// lib/presentation/screens/transaction_form.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/entities/account.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/transaction_usecases.dart';
import '../../domain/usecases/account_usecases.dart';
import '../../domain/usecases/category_usecases.dart';

class TransactionForm extends StatefulWidget {
  final TransactionEntity? transaction;
  final TransactionUseCases transactionUseCases;
  final GetAccounts getAccounts;
  final GetCategories getCategories;

  const TransactionForm({
    Key? key,
    this.transaction,
    required this.transactionUseCases,
    required this.getAccounts,
    required this.getCategories,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _referenceController = TextEditingController();
  final _contactController = TextEditingController();

  late DateTime _selectedDate;
  String _selectedType = 'E'; // Por defecto es gasto
  String _flow = 'O'; // Por defecto es salida
  AccountEntity? _selectedAccount;
  AccountEntity? _selectedToAccount; // Solo para transferencias
  CategoryEntity? _selectedCategory;

  bool get isTransfer => _selectedType == 'T';
  bool get isExpense => _selectedType == 'E';
  bool get isIncome => _selectedType == 'I';

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.transaction != null) {
      _amountController.text = widget.transaction!.amount.toString();
      _descriptionController.text = widget.transaction!.description ?? '';
      _referenceController.text = widget.transaction!.reference ?? '';
      _contactController.text = widget.transaction!.contact ?? '';
      _selectedDate = widget.transaction!.transactionDate;
      _selectedType = widget.transaction!.type;
      _flow = widget.transaction!.flow;
    } else {
      _selectedDate = DateTime.now();
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _referenceController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  // Función auxiliar para encontrar la categoría padre
  CategoryEntity findParentCategory(List<CategoryEntity> categories, CategoryEntity childCategory) {
    try {
      return categories.firstWhere((c) => c.id == childCategory.parentId);
    } catch (e) {
      return CategoryEntity(
        id: -1,
        name: 'Desconocido',
        type: childCategory.type,
        createdAt: DateTime.now(),
        parentId: null,
        description: null,
        status: true,
      );
    }
  }

  // Widget para seleccionar la categoría
  Widget _buildCategorySelector() {
    if (isTransfer) return const SizedBox.shrink();

    return StreamBuilder<List<CategoryEntity>>(
      stream: widget.getCategories(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final categories = snapshot.data!;
        final validCategories = categories.where((category) => 
          category.parentId != null && 
          ((isExpense && category.type == 'E') || 
           (isIncome && category.type == 'I'))
        ).toList();

        return DropdownButtonFormField<CategoryEntity>(
          value: _selectedCategory,
          decoration: const InputDecoration(
            labelText: 'Categoría',
            prefixIcon: Icon(Icons.category),
            border: OutlineInputBorder(),
          ),
          items: validCategories.map((category) {
            final parent = findParentCategory(categories, category);
            
            return DropdownMenuItem(
              value: category,
              child: Text('${parent.name} > ${category.name}'),
            );
          }).toList(),
          onChanged: (CategoryEntity? value) {
            setState(() {
              _selectedCategory = value;
            });
          },
          validator: (value) {
            if (!isTransfer && value == null) {
              return 'Por favor seleccione una categoría';
            }
            return null;
          },
        );
      },
    );
  }

  // Widget para seleccionar la cuenta
  Widget _buildAccountSelector() {
    return StreamBuilder<List<AccountEntity>>(
      stream: widget.getAccounts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final accounts = snapshot.data!;
        return DropdownButtonFormField<AccountEntity>(
          value: _selectedAccount,
          decoration: const InputDecoration(
            labelText: 'Cuenta',
            prefixIcon: Icon(Icons.account_balance),
            border: OutlineInputBorder(),
          ),
          items: accounts.map((account) {
            return DropdownMenuItem(
              value: account,
              child: Text(account.name),
            );
          }).toList(),
          onChanged: (AccountEntity? value) {
            setState(() {
              _selectedAccount = value;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'Por favor seleccione una cuenta';
            }
            return null;
          },
        );
      },
    );
  }

  // Widget para seleccionar la cuenta destino (solo para transferencias)
  Widget _buildToAccountSelector() {
    if (!isTransfer) return const SizedBox.shrink();

    return StreamBuilder<List<AccountEntity>>(
      stream: widget.getAccounts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final accounts = snapshot.data!.where((account) => account != _selectedAccount).toList();
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: DropdownButtonFormField<AccountEntity>(
            value: _selectedToAccount,
            decoration: const InputDecoration(
              labelText: 'Cuenta Destino',
              prefixIcon: Icon(Icons.account_balance),
              border: OutlineInputBorder(),
            ),
            items: accounts.map((account) {
              return DropdownMenuItem(
                value: account,
                child: Text(account.name),
              );
            }).toList(),
            onChanged: (AccountEntity? value) {
              setState(() {
                _selectedToAccount = value;
              });
            },
            validator: (value) {
              if (isTransfer && value == null) {
                return 'Por favor seleccione una cuenta destino';
              }
              return null;
            },
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _onSave() async {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      
      final transaction = TransactionEntity(
        id: widget.transaction?.id ?? -1,
        type: _selectedType,
        flow: _flow,
        amount: amount,
        accountId: _selectedAccount!.id,
        categoryId: isTransfer ? null : _selectedCategory!.id,
        reference: _referenceController.text.isEmpty ? null : _referenceController.text,
        contact: _contactController.text.isEmpty ? null : _contactController.text,
        description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
        transactionDate: _selectedDate,
        createdAt: widget.transaction?.createdAt ?? DateTime.now(),
        status: true,
      );

      if (widget.transaction == null) {
        await widget.transactionUseCases.createTransaction(transaction);
      } else {
        await widget.transactionUseCases.updateTransaction(transaction);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transaction == null ? 'Nueva Transacción' : 'Editar Transacción'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Tipo de Transacción
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tipo de Transacción',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(
                          value: 'E',
                          icon: Icon(Icons.arrow_downward),
                          label: Text('Gasto'),
                        ),
                        ButtonSegment(
                          value: 'I',
                          icon: Icon(Icons.arrow_upward),
                          label: Text('Ingreso'),
                        ),
                        ButtonSegment(
                          value: 'T',
                          icon: Icon(Icons.swap_horiz),
                          label: Text('Transferencia'),
                        ),
                      ],
                      selected: {_selectedType},
                      onSelectionChanged: (Set<String> newSelection) {
                        setState(() {
                          _selectedType = newSelection.first;
                          _flow = _selectedType == 'I' ? 'I' : 'O';
                          // Limpiar la categoría cuando cambia el tipo
                          _selectedCategory = null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Monto
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Monto',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un monto';
                }
                if (double.tryParse(value) == null) {
                  return 'Por favor ingrese un monto válido';
                }
                if (double.parse(value) <= 0) {
                  return 'El monto debe ser mayor a 0';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Fecha
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Fecha',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  DateFormat('dd/MM/yyyy').format(_selectedDate),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Cuenta origen
            _buildAccountSelector(),
            
            // Cuenta destino (solo para transferencias)
            _buildToAccountSelector(),
            
            // Categoría (excepto para transferencias)
            if (!isTransfer) ...[
              const SizedBox(height: 16),
              _buildCategorySelector(),
            ],

            const SizedBox(height: 16),
            
            // Descripción
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            // Referencia
            TextFormField(
              controller: _referenceController,
              decoration: const InputDecoration(
                labelText: 'Referencia',
                prefixIcon: Icon(Icons.receipt),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Contacto
            TextFormField(
              controller: _contactController,
              decoration: const InputDecoration(
                labelText: 'Contacto',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _onSave,
          child: Text(widget.transaction == null ? 'Crear Transacción' : 'Actualizar Transacción'),
        ),
      ),
    );
  }
}