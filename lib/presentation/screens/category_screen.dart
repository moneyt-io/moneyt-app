// lib/presentation/screens/category_screen.dart
import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/category_usecases.dart';
import '../../routes/app_routes.dart';
import '../widgets/expandable_category_list.dart';
import '../widgets/app_drawer.dart';

class CategoryScreen extends StatelessWidget {
  final GetCategories getCategories;
  final CreateCategory createCategory;
  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;

  const CategoryScreen({
    Key? key,
    required this.getCategories,
    required this.createCategory,
    required this.updateCategory,
    required this.deleteCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categorías'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.arrow_upward),
                text: 'Ingresos',
              ),
              Tab(
                icon: Icon(Icons.arrow_downward),
                text: 'Egresos',
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case 'filter':
                    // TODO: Implementar filtrado
                    break;
                  case 'sort':
                    // TODO: Implementar ordenamiento
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'filter',
                  child: Row(
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(width: 8),
                      Text('Filtrar'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'sort',
                  child: Row(
                    children: [
                      Icon(Icons.sort),
                      SizedBox(width: 8),
                      Text('Ordenar'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        drawer: AppDrawer(
          getCategories: getCategories,
          createCategory: createCategory,
          updateCategory: updateCategory,
          deleteCategory: deleteCategory,
        ),
        body: TabBarView(
          children: [
            // Lista de categorías de ingreso
            StreamBuilder<List<CategoryEntity>>(
              stream: getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final ingresos = snapshot.data!
                    .where((category) => category.type == 'I')
                    .toList();

                if (ingresos.isEmpty) {
                  return const Center(
                    child: Text('No hay categorías de ingreso'),
                  );
                }

                return ExpandableCategoryList(
                  categories: ingresos,
                  onDelete: (category) => deleteCategory(category.id),
                  onUpdate: (category) => Navigator.pushNamed(
                    context,
                    AppRoutes.categoryForm,
                    arguments: CategoryFormArgs(
                      category: category,
                      createCategory: createCategory,
                      updateCategory: updateCategory,
                      getCategories: getCategories,
                    ),
                  ),
                );
              },
            ),
            // Lista de categorías de egreso
            StreamBuilder<List<CategoryEntity>>(
              stream: getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final egresos = snapshot.data!
                    .where((category) => category.type == 'E')
                    .toList();

                if (egresos.isEmpty) {
                  return const Center(
                    child: Text('No hay categorías de egreso'),
                  );
                }

                return ExpandableCategoryList(
                  categories: egresos,
                  onDelete: (category) => deleteCategory(category.id),
                  onUpdate: (category) => Navigator.pushNamed(
                    context,
                    AppRoutes.categoryForm,
                    arguments: CategoryFormArgs(
                      category: category,
                      createCategory: createCategory,
                      updateCategory: updateCategory,
                      getCategories: getCategories,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(
            context,
            AppRoutes.categoryForm,
            arguments: CategoryFormArgs(
              createCategory: createCategory,
              updateCategory: updateCategory,
              getCategories: getCategories,
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}