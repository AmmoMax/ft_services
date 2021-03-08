<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'wordpress' );

// Тут хардкод имени и пароля пользователя потому что
// по каким то причинам не срабатывало получение переменной окружения:
// define( 'DB_USER', getenv('DB_USER')) -> вот так не работает непонятно почему, бился с этим целый вечер и пока так и не смог победить
/** Имя пользователя MySQL */
define( 'DB_USER', 'amayor');

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'amayor');

/** Имя сервера MySQL */
define( 'DB_HOST', 'mysql-service: 3306' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '%.hzCYYi#U;.Wq({FNG9iIkFNdC0[~jc}-ONiU~VM%A%welG9j{S;+h!n^~X/[J<' );
define( 'SECURE_AUTH_KEY',  'Cr0#G%_Igj[H*XE=D-KlcL5Kv&gk=@eY5d5<YuXbmUx_f6=NN-vv.^zD%oRbI5?8' );
define( 'LOGGED_IN_KEY',    '=<+q1KpEo1x(I>}BK>ly{>jiK:KX9db|6*6M;&}$dB_q|1Bau|~vOMjO5UAkdS|H' );
define( 'NONCE_KEY',        't/U1B7MM9`OZB.22^t=)oH]l`OHRg>1y5$^{eN-$/5bil,Ji`C_!RF1(6p`N/_xU' );
define( 'AUTH_SALT',        'C:&Tt1d:xweQ0w{`K+5z)>{_IjegZ`]1!>zLFd*cuAi<IzL29aaMjq.tb#5V(@fp' );
define( 'SECURE_AUTH_SALT', 'Ok_GTxn1AmvG>lUq8gaYa{`m%.P1#R~o7%%V@W_B~K5 1}JmCeG.O`bz_/=y|tM|' );
define( 'LOGGED_IN_SALT',   'Nd6u,CZt[(db[>Ix+T?;8R*Ck-7]o|/]8]$H2tjWmIu-8o#wp _{QB<zeEKp!Q/1' );
define( 'NONCE_SALT',       '.9QAu5et,a]O= %h*`bq;;/7x]ihV>2EX6OYNWIUDkDI%bCH}OnR!)gI!q?Q04My' );

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once( ABSPATH . 'wp-settings.php' );
