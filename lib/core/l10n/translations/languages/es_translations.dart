import '../base_translations.dart';

class EsTranslations extends BaseTranslations {
  @override
  String get languageCode => 'es';

  // App general
  @override
  String get appName => 'MoneyT';

  // Authentication
  @override
  String get signIn => 'Iniciar Sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get signInWithEmail => 'Iniciar sesión con Email';

  @override
  String get signInWithGoogle => 'Iniciar sesión con Google';

  @override
  String get skipSignIn => 'Omitir inicio de sesión';

  @override
  String get emailRequired => 'El correo electrónico es requerido';

  @override
  String get invalidEmail => 'Por favor ingrese un correo válido';

  @override
  String get password => 'Contraseña';

  @override
  String get passwordRequired => 'La contraseña es requerida';

  @override
  String get passwordTooShort => 'La contraseña debe tener al menos 6 caracteres';

  @override
  String get passwordResetEmailSent => 'Correo de restablecimiento de contraseña enviado exitosamente';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta? Regístrate';

  @override
  String get termsAndConditions => 'Términos y Condiciones';

  @override
  String get acceptTerms => 'Acepto los Términos y Condiciones';

  @override
  String get acceptTermsAndConditions => 'Acepto los Términos y Condiciones';

  @override
  String get acceptMarketing => 'Me gustaría recibir correos de marketing';

  @override
  String get termsText => 'Al usar esta aplicación, aceptas nuestros Términos de Servicio y Política de Privacidad...';

  @override
  String get readTerms => 'Leer Términos y Condiciones';

  @override
  String get welcome => 'Bienvenido';

  @override
  String get welcomeTitle => 'Gestiona tus finanzas con facilidad';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get continue_ => 'Continuar';

  @override
  String get save => 'Guardar';

  @override
  String get add => 'Agregar';

  @override
  String get error => 'Error';

  @override
  String get noDescription => 'Sin descripción';

  @override
  String get unknown => 'Desconocido';

  // Navigation
  @override
  String get home => 'Inicio';

  @override
  String get accounts => 'Cuentas';

  @override
  String get categories => 'Categorías';

  @override
  String get transactions => 'Transacciones';

  // Account related
  @override
  String get account => 'Cuenta';

  @override
  String get accountName => 'Nombre de la cuenta';

  @override
  String get accountDescription => 'Descripción de la cuenta';

  @override
  String get balance => 'Balance';

  @override
  String get availableBalance => 'Saldo Disponible';

  @override
  String get newAccount => 'Nueva cuenta';

  @override
  String get editAccount => 'Editar cuenta';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get deleteAccountConfirmation => '¿Está seguro que desea eliminar esta cuenta?';

  @override
  String get accountDeleted => 'Cuenta eliminada exitosamente';

  @override
  String get noAccounts => 'No se encontraron cuentas';

  // Category related
  @override
  String get category => 'Categoría';

  @override
  String get categoryName => 'Nombre de la categoría';

  @override
  String get categoryDescription => 'Descripción de la categoría';

  @override
  String get newCategory => 'Nueva categoría';

  @override
  String get editCategory => 'Editar categoría';

  @override
  String get deleteCategory => 'Eliminar categoría';

  @override
  String get deleteCategoryConfirmation => '¿Está seguro que desea eliminar esta categoría?';

  @override
  String get categoryDeleted => 'Categoría eliminada exitosamente';

  @override
  String get noCategories => 'No se encontraron categorías';

  @override
  String get basicInformation => 'Información básica';

  @override
  String get categoryHierarchy => 'Jerarquía de categoría';

  @override
  String get mainCategory => 'Categoría principal';

  @override
  String get mainCategoryDescription => 'Una categoría principal que puede contener subcategorías';

  @override
  String get subcategory => 'Subcategoría';

  @override
  String get subcategoryDescription => 'Una subcategoría que pertenece a una categoría principal';

  @override
  String get parentCategory => 'Categoría padre';

  @override
  String get selectParentCategory => 'Seleccione una categoría padre';

  @override
  String get categoryType => 'Tipo de categoría';

  @override
  String noMainCategoriesAvailable(String type) => 'No hay categorías principales de $type disponibles';

  @override
  String get errorLoadingCategories => 'Error al cargar las categorías';

  // Transaction related
  @override
  String get transaction => 'Transacción';

  @override
  String get newTransaction => 'Nueva transacción';

  @override
  String get editTransaction => 'Editar transacción';

  @override
  String get deleteTransaction => 'Eliminar transacción';

  @override
  String get deleteTransactionConfirmation => '¿Estás seguro de que deseas eliminar esta transacción?';

  @override
  String get noTransactions => 'No se encontraron transacciones';

  @override
  String get amount => 'Monto';

  @override
  String get date => 'Fecha';

  @override
  String get description => 'Descripción';

  @override
  String get reference => 'Referencia';

  @override
  String get contact => 'Contacto';

  @override
  String get details => 'Detalles';

  @override
  String get additionalInformation => 'Información adicional';

  @override
  String get toAccount => 'A la cuenta';

  @override
  String get income => 'Ingreso';

  @override
  String get expense => 'Gasto';

  @override
  String get transfer => 'Transferencia';

  @override
  String get newExpense => 'Nuevo gasto';

  @override
  String get newIncome => 'Nuevo ingreso';

  @override
  String get newTransfer => 'Nueva transferencia';

  @override
  String get invalidAmount => 'Monto inválido';

  @override
  String get selectAccount => 'Seleccionar Cuenta';

  @override
  String get selectCategory => 'Seleccionar Categoría';

  // Filter related
  String get filter => 'Filtro';

  @override
  String get filterAll => 'Todos';

  @override
  String get filterIncome => 'Ingresos';

  @override
  String get filterExpense => 'Gastos';

  @override
  String get filterTransfer => 'Transferencias';

  @override
  String get all => 'Todo';

  @override
  String get apply => 'Aplicar';

  @override
  String get filters => 'Filtros';

  @override
  String get from => 'Desde';

  @override
  String get to => 'Hasta';

  // Database and Settings
  @override
  String get data => 'Base de Datos';

  @override
  String get manageBackups => 'Administrar Respaldos';

  // Backup related
  @override
  String get backup => 'Respaldo';

  @override
  String get backups => 'Respaldos';

  @override
  String get createBackup => 'Crear Respaldo';

  @override
  String get restoreBackup => 'Restaurar Respaldo';

  @override
  String get deleteBackup => 'Eliminar Respaldo';

  @override
  String get noBackups => 'No hay respaldos disponibles';

  @override
  String get backupCreated => 'Respaldo creado exitosamente';

  @override
  String get backupRestored => 'Respaldo restaurado exitosamente';

  @override
  String get backupDeleted => 'Respaldo eliminado exitosamente';

  @override
  String get backupError => 'Error al realizar la operación de respaldo';

  @override
  String get restoreBackupConfirmation => '¿Está seguro de restaurar este respaldo? Los datos actuales se perderán.';

  @override
  String get deleteBackupConfirmation => '¿Está seguro de eliminar este respaldo?';

  @override
  String get backupSettings => 'Configuración de Respaldos';

  @override
  String get backupDirectory => 'Directorio de Respaldos';

  @override
  String get changeDirectory => 'Cambiar Directorio';

  @override
  String get resetDirectory => 'Restablecer Directorio';

  @override
  String get backupDirectoryUpdated => 'Directorio de respaldo actualizado';

  @override
  String get backupDirectoryReset => 'Directorio de respaldo restablecido a predeterminado';

  @override
  String get settings => 'Configuración';

  @override
  String get appearance => 'Apariencia';

  @override
  String get about => 'Acerca de';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get darkModeDescription => 'Activar modo oscuro para mejor visualización nocturna';

  @override
  String get automaticBackups => 'Copias de seguridad automáticas';

  @override
  String get enableAutomaticBackups => 'Habilitar copias automáticas';

  @override
  String get backupFrequency => 'Frecuencia de respaldo';

  @override
  String get every => 'Cada';

  @override
  String get hours => 'horas';

  @override
  String get saveSettings => 'Guardar configuración';

  @override
  String get settingsSaved => 'Configuración guardada exitosamente';

  String get settingsError => 'Error al guardar la configuración';

  String get lastBackup => 'Último respaldo';

  String get nextBackup => 'Próximo respaldo';

  @override
  String get importBackup => 'Importar Respaldo';

  String get fileReadError => 'No se pudo leer el archivo';

  String get invalidFileFormat => 'Formato de archivo inválido. Por favor use archivos .db, .sqlite, o .backup';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get backupTime => 'Hora de Respaldo';

  @override
  String get selectBackupDirectory => 'Seleccionar Directorio de Respaldo';

  @override
  String get selectExportDirectory => 'Seleccionar Directorio de Exportación';

  @override
  String get backupExported => 'Respaldo exportado exitosamente';

  @override
  String get retentionDays => 'Días de Retención';

  @override
  String get days => 'días';

  // About and Social
  @override
  String get webSite => 'Sitio Web';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get gitHub => 'GitHub';

  @override
  String get reddit => 'Reddit';

  @override
  String get discord => 'Discord';

  @override
  String get email => 'Correo';

  @override
  String get joinOurCommunity => 'Únete a nuestra comunidad';

  // Form Fields and Sections
  @override
  String get name => 'Nombre';

  @override
  String get nameRequired => 'El nombre es requerido';

  @override
  String get mainCategoryRequired => 'Por favor seleccione una categoría principal';

  @override
  String get incomeDescription => 'Dinero que ingresa a tus cuentas';

  @override
  String get expenseDescription => 'Dinero que sale de tus cuentas';

  @override
  String get create => 'Crear';

  @override
  String get update => 'Actualizar';

  @override
  String get fieldRequired => 'Este campo es requerido';

  @override
  String get required => 'Este campo es requerido';

  // Menu sections
  @override
  String get main => 'Principal';

  @override
  String get management => 'Gestión';

  @override
  String get preferences => 'Preferencias';

  // Stats and Balance
  @override
  String get totalBalance => 'Balance total';

  @override
  String get monthlyStats => 'Estadísticas mensuales';

  @override
  String get expenses => 'Gastos';

  @override
  String get monthlyBalance => 'Balance mensual';

  @override
  String get recentTransactions => 'Transacciones recientes';

  @override
  String get viewAll => 'Ver todo';

  @override
  String get noRecentTransactions => 'No hay transacciones recientes';

  @override
  String get share => 'Compartir';

  @override
  String get deleteConfirmation => 'Confirmar eliminación';

  @override
  String get sortDateAsc => 'Fecha ↑';

  @override
  String get sortDateDesc => 'Fecha ↓';

  @override
  String get sortAmountAsc => 'Monto ↑';

  @override
  String get sortAmountDesc => 'Monto ↓';

  // Contact related
  @override
  String get contacts => 'Contactos';

  @override
  String get selectContact => 'Seleccionar Contacto';

  @override
  String get searchOrCreateContact => 'Buscar o escribir para crear contacto';

  @override
  String get newContact => 'Nuevo Contacto';

  @override
  String get editContact => 'Editar Contacto';

  @override
  String get deleteContact => 'Eliminar Contacto';

  @override
  String get deleteContactTitle => 'Eliminar Contacto';

  @override
  String get deleteContactMessage => '¿Estás seguro de que deseas eliminar este contacto?';

  @override
  String get deleteContactSuccess => 'Contacto eliminado exitosamente';

  @override
  String get contactDeleted => 'Contacto eliminado exitosamente';

  @override
  String get noContacts => 'Sin Contactos';

  @override
  String get noContactsDescription => 'Aún no has agregado ningún contacto. Agrega tu primer contacto presionando el botón +.';

  @override
  String get search => 'Buscar';

  @override
  String get addContact => 'Añadir Contacto';

  @override
  String get contactName => 'Nombre';

  @override
  String get contactEmail => 'Correo electrónico';

  @override
  String get contactPhone => 'Teléfono';

  @override
  String get contactNotes => 'Notas';

  @override
  String get contactSaved => 'Contacto guardado exitosamente';

  @override
  String get contactUpdated => 'Contacto actualizado exitosamente';

  @override
  String get contactCreated => 'Contacto creado exitosamente';

  @override
  String get contactNameRequired => 'El nombre del contacto es requerido';

  @override
  String get contactInformation => 'Información del Contacto';

  @override
  String get createContact => 'Crear Contacto';

  @override
  String get importContacts => 'Importar Contactos';

  @override
  String get contactsPermissionDenied => 'Se denegó el permiso para acceder a los contactos';

  @override
  String get contactsError => 'Error al acceder a los contactos';

  @override
  String get noContactsFound => 'No se encontraron contactos con esa búsqueda';

  @override
  String contactsImported(int count) => '$count contactos importados exitosamente';

  @override
  String contactsImportedMessage(int count) => '$count contactos importados exitosamente';

  @override
  String get pickContact => 'Seleccionar Contacto';

  @override
  String get selectFromContacts => 'Seleccionar de Contactos';

  @override
  String get invalidCredentials => 'Correo o contraseña inválidos';

  @override
  String get emailAlreadyInUse => 'Este correo ya está registrado';

  @override
  String get weakPassword => 'La contraseña es demasiado débil';

  @override
  String get networkError => 'Error de red. Por favor verifica tu conexión';

  @override
  String get unknownError => 'Ha ocurrido un error desconocido';

  @override
  String getText(String key) => key;

  @override
  String get allContacts => 'Todos los Contactos';

  @override
  String get requiredField => 'Este campo es requerido';

  @override
  String get sync => 'Sincronizar';

  @override
  String get syncing => 'Sincronizando...';

  @override
  String get syncSuccess => 'Sincronización exitosa';

  @override
  String get syncError => 'Error al sincronizar';

  @override
  String get lastSync => 'Última sincronización';

  @override
  String get syncNever => 'Nunca';

  @override
  String get restore => 'Restaurar';

  @override
  String get notSet => 'No Establecido';
}
