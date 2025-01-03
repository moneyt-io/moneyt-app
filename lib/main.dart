// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moneyt_pfm/data/local/backup/backup_service.dart';
import 'package:moneyt_pfm/data/repositories/backup_repository_impl.dart';
import 'package:moneyt_pfm/domain/repositories/backup_repository.dart';
import 'package:moneyt_pfm/domain/usecases/account_usecases.dart';
import 'package:moneyt_pfm/domain/usecases/category_usecases.dart';
import 'package:moneyt_pfm/domain/usecases/contact_usecases.dart';
import 'package:moneyt_pfm/domain/usecases/transaction_usecases.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/injection_container.dart';
import 'core/l10n/language_manager.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/providers/drawer_provider.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar dependencias
  initializeDependencies();
  
  // Inicializar SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstRun = prefs.getBool('is_first_run') ?? true;
  
  // Inicializar el administrador de idiomas
  final languageManager = LanguageManager();
  await languageManager.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(prefs)),
        Provider<BackupRepository>(
          create: (_) => BackupRepositoryImpl(GetIt.I<BackupService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawerProvider(
            // Categories
            getCategories: GetIt.I<GetCategories>(),
            createCategory: GetIt.I<CreateCategory>(),
            updateCategory: GetIt.I<UpdateCategory>(),
            deleteCategory: GetIt.I<DeleteCategory>(),
            // Accounts
            getAccounts: GetIt.I<GetAccounts>(),
            createAccount: GetIt.I<CreateAccount>(),
            updateAccount: GetIt.I<UpdateAccount>(),
            deleteAccount: GetIt.I<DeleteAccount>(),
            // Contacts
            getContacts: GetIt.I<GetContacts>(),
            createContact: GetIt.I<CreateContact>(),
            updateContact: GetIt.I<UpdateContact>(),
            deleteContact: GetIt.I<DeleteContact>(),
            // Transactions
            transactionUseCases: GetIt.I<TransactionUseCases>(),
          ),
        ),
        ChangeNotifierProvider.value(value: languageManager),
      ],
      child: Consumer<LanguageManager>(
        builder: (context, languageManager, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                title: 'MoneyT',
                theme: themeProvider.lightTheme,
                darkTheme: themeProvider.darkTheme,
                themeMode: themeProvider.themeMode,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: isFirstRun ? AppRoutes.welcome : AppRoutes.home,
              );
            },
          );
        },
      ),
    ),
  );
}
