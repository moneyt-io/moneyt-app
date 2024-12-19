// lib/presentation/widgets/app_drawer.dart
import 'package:flutter/material.dart';
import '../../domain/usecases/category_usecases.dart';
import '../../domain/usecases/account_usecases.dart';
import '../../routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  // Categorías
  final GetCategories getCategories;
  final CreateCategory createCategory;
  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;

  // Cuentas
  final GetAccounts getAccounts;
  final CreateAccount createAccount;
  final UpdateAccount updateAccount;
  final DeleteAccount deleteAccount;

  const AppDrawer({
    Key? key,
    // Categorías
    required this.getCategories,
    required this.createCategory,
    required this.updateCategory,
    required this.deleteCategory,
    // Cuentas
    required this.getAccounts,
    required this.createAccount,
    required this.updateAccount,
    required this.deleteAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 64,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Text(
                  'Mi Presupuesto',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text('Dashboard'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.account_balance),
                  title: const Text('Cuentas'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.accounts,
                      arguments: {
                        'getAccounts': getAccounts,
                        'createAccount': createAccount,
                        'updateAccount': updateAccount,
                        'deleteAccount': deleteAccount,
                      },
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Categorías'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.categories,
                      arguments: {
                        'getCategories': getCategories,
                        'createCategory': createCategory,
                        'updateCategory': updateCategory,
                        'deleteCategory': deleteCategory,
                      },
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Configuración'),
                  onTap: () {
                    // TODO: Implementar pantalla de configuración
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Versión 1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}