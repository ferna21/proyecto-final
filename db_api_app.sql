-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2022 a las 09:32:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_api_app`
--
CREATE DATABASE IF NOT EXISTS `db_api_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_api_app`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`) VALUES
(1, 'TIENDAFAKE', 1, 'ADMIN TIENDAFAKE', 1, 'admin-interface/logo/npc-nutricion-cientifica-perros.png', 1, '#254B0F', '#F5B05F', '#35B74B', '#FFFFFF', '#C9F0DD', '#254B0F', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#144B16', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, 'admin-interface/favicon/npc-nutricion-cientifica-perros.png', '0.3', 'TIENDITAFAKE', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add carrito', 8, 'add_carrito'),
(30, 'Can change carrito', 8, 'change_carrito'),
(31, 'Can delete carrito', 8, 'delete_carrito'),
(32, 'Can view carrito', 8, 'view_carrito'),
(33, 'Can add compras', 9, 'add_compras'),
(34, 'Can change compras', 9, 'change_compras'),
(35, 'Can delete compras', 9, 'delete_compras'),
(36, 'Can view compras', 9, 'view_compras'),
(37, 'Can add estado compra', 10, 'add_estadocompra'),
(38, 'Can change estado compra', 10, 'change_estadocompra'),
(39, 'Can delete estado compra', 10, 'delete_estadocompra'),
(40, 'Can view estado compra', 10, 'view_estadocompra'),
(41, 'Can add tipo producto', 11, 'add_tipoproducto'),
(42, 'Can change tipo producto', 11, 'change_tipoproducto'),
(43, 'Can delete tipo producto', 11, 'delete_tipoproducto'),
(44, 'Can view tipo producto', 11, 'view_tipoproducto'),
(45, 'Can add tipo usuario', 12, 'add_tipousuario'),
(46, 'Can change tipo usuario', 12, 'change_tipousuario'),
(47, 'Can delete tipo usuario', 12, 'delete_tipousuario'),
(48, 'Can view tipo usuario', 12, 'view_tipousuario'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add extend user', 14, 'add_extenduser'),
(54, 'Can change extend user', 14, 'change_extenduser'),
(55, 'Can delete extend user', 14, 'delete_extenduser'),
(56, 'Can view extend user', 14, 'view_extenduser');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(7, 'pbkdf2_sha256$260000$2s6bnW5lr8AUbqyTYK4EPu$H86aGbfQ4aVg89XzwigbpwBiZ4QquZCi9xEMsfTMU54=', '2022-07-13 00:15:15.119227', 0, 'ferna23', 'fernando', 'gonzalez', 'ne.garrido@duocuc.cl', 0, 1, '2022-07-13 00:15:14.105814'),
(8, 'pbkdf2_sha256$260000$1hLgDYWJoquqfTesCqSbrM$SR5SLbvZwTLf5vAXQj5Jli/oyQa7R5URLkFHp/ritYc=', '2022-07-13 03:28:52.884243', 0, 'nelssss', 'nelson', 'garrido', 'ne.garrido@duocuc.cl', 0, 1, '2022-07-13 03:28:51.348109'),
(9, 'pbkdf2_sha256$260000$Vsnxb9C3p77VyjW1sLEncU$XL0MqwnNWASpLtjpNsPrfDHGBZ6+93z+u44TXkgV7Mo=', '2022-07-13 06:16:04.350584', 1, 'admin', '', '', 'fe.gonzalezf@duocuc.cl', 1, 1, '2022-07-13 05:30:09.303774');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(6, 7, 2),
(7, 8, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_compras`
--

CREATE TABLE `db_compras` (
  `codigo` int(11) NOT NULL,
  `articulos` varchar(300) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `estado_pedido` varchar(50) NOT NULL,
  `cliente` varchar(30) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `precioiva` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_compras`
--

INSERT INTO `db_compras` (`codigo`, `articulos`, `cantidad`, `fecha_compra`, `estado_pedido`, `cliente`, `subtotal`, `precioiva`, `total`) VALUES
(9, ' Alimento cachorro (1) Correa retractil (1) ', 2, '2022-07-13', 'Validación', 'admin', 14880, 2827, 17707);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_estadocompra`
--

CREATE TABLE `db_estadocompra` (
  `id` bigint(20) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_estadocompra`
--

INSERT INTO `db_estadocompra` (`id`, `estado`) VALUES
(1, 'Validación'),
(2, 'Preparación'),
(3, 'Reparto'),
(4, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_items_carrito`
--

CREATE TABLE `db_items_carrito` (
  `id` bigint(20) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `detalle` varchar(40) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `total_pagar` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_items_carrito`
--

INSERT INTO `db_items_carrito` (`id`, `codigo`, `nombre`, `marca`, `precio`, `stock`, `detalle`, `cantidad`, `tipo`, `imagen`, `total_pagar`, `usuario`) VALUES
(43, 1, 'Rascador de Gatos', 'KittyRasg', 8990, 10, 'Rascador Resistente', 1, 'Accesorios', 'productos/Rascador_Gatos.png', 8990, 'denileni'),
(45, 2, 'Cama Perro', 'SleepDog', 4990, 15, 'Cama muy cómoda', 1, 'Accesorios', 'productos/cama_perro.png', 4990, 'ferna23'),
(46, 3, 'Whiskas 6Kg', 'Whiskas', 6990, 20, 'Sabor a pescado', 1, 'Comida Gato', 'productos/comida_whiskas.png', 6990, 'ferna23'),
(51, 2, 'Cama Perro', 'SleepDog', 2495, 13, 'Cama muy cómoda', 3, 'Accesorios', 'productos/cama_perro.png', 7485, 'nelssss'),
(54, 5, 'alimento humedo', 'pedigree', 850, 45, 'sachet sabor pollo', 1, 'Alimento', 'productos/Alimento-humedo-perro-adulto-carne-100-g.webp', 850, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_producto`
--

CREATE TABLE `db_producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `detalle` varchar(40) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `tipo_id` bigint(20) NOT NULL,
  `descuento` int(11) NOT NULL,
  `total_descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_producto`
--

INSERT INTO `db_producto` (`codigo`, `nombre`, `marca`, `precio`, `stock`, `detalle`, `imagen`, `created_at`, `updated_at`, `tipo_id`, `descuento`, `total_descuento`) VALUES
(1, 'Alimento cachorro', 'Champion Dog', 6990, 19, 'Sabor carne y pollo', 'productos/Alimento-perro-cachorro-carne-pollo-y-leche-3-kg.jpg', '2022-07-13', '2022-07-13', 5, 10, 6291),
(2, 'identificador QR', 'Petfy', 5990, 30, 'Para razas pequeñas', 'productos/3239292.jpg', '2022-07-13', '2022-07-13', 7, 10, 5391),
(3, 'Correa retractil', 'perro feliz', 7890, 23, 'Pasea cómodamente a tu perro', 'productos/5444004.jpg', '2022-07-13', '2022-07-13', 6, 10, 7101),
(4, 'Bandana Facherita', 'nose', 3900, 17, 'Bandana a cuadros fachera', 'productos/descargaa.jpg', '2022-07-13', '2022-07-13', 6, 10, 3510),
(5, 'alimento humedo', 'pedigree', 1000, 44, 'sachet sabor pollo', 'productos/Alimento-humedo-perro-adulto-carne-100-g.webp', '2022-07-13', '2022-07-13', 5, 15, 850);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_tipo_producto`
--

CREATE TABLE `db_tipo_producto` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_tipo_producto`
--

INSERT INTO `db_tipo_producto` (`id`, `tipo`) VALUES
(5, 'Alimento'),
(6, 'Accesorios'),
(7, 'Identificadores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_tipo_usuario`
--

CREATE TABLE `db_tipo_usuario` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `db_usuario`
--

CREATE TABLE `db_usuario` (
  `id` bigint(20) NOT NULL,
  `rut` varchar(8) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `suscripcion` tinyint(1) NOT NULL,
  `djangoUser_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `db_usuario`
--

INSERT INTO `db_usuario` (`id`, `rut`, `dv`, `direccion`, `telefono`, `imagen`, `suscripcion`, `djangoUser_id`) VALUES
(7, '21054640', '5', 'asdasdasd', '976754629', '0', 0, 7),
(8, '65151321', '5', 'sadasdasda', '521515353', 'usuarios/npc-nutricion-cientifica-perros.png', 1, 8),
(9, '21044446', '9', 'taitao 100', '976754629', 'usuarios/descarga.jpg', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(25, '2022-07-13 05:30:45.886003', '4', 'ferna21', 3, '', 5, 9),
(26, '2022-07-13 06:02:07.659018', '9', 'admin', 1, '[{\"added\": {}}]', 14, 9),
(27, '2022-07-13 07:28:30.943298', '1', 'TIENDAFAKE', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Logo\", \"Favicon\", \"Color\", \"Background color\", \"Text color\", \"Background color\"]}}]', 1, 9),
(28, '2022-07-13 07:30:30.708660', '1', 'TIENDAFAKE', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Title\", \"Background color\"]}}]', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(8, 'app', 'carrito'),
(9, 'app', 'compras'),
(10, 'app', 'estadocompra'),
(14, 'app', 'extenduser'),
(13, 'app', 'producto'),
(11, 'app', 'tipoproducto'),
(12, 'app', 'tipousuario'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-08 05:17:49.078146'),
(2, 'auth', '0001_initial', '2022-07-08 05:17:49.427205'),
(3, 'admin', '0001_initial', '2022-07-08 05:17:49.515241'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-08 05:17:49.523580'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-08 05:17:49.532050'),
(6, 'admin_interface', '0001_initial', '2022-07-08 05:17:49.548443'),
(7, 'admin_interface', '0002_add_related_modal', '2022-07-08 05:17:49.598742'),
(8, 'admin_interface', '0003_add_logo_color', '2022-07-08 05:17:49.615112'),
(9, 'admin_interface', '0004_rename_title_color', '2022-07-08 05:17:49.625702'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2022-07-08 05:17:49.641106'),
(11, 'admin_interface', '0006_bytes_to_str', '2022-07-08 05:17:49.701654'),
(12, 'admin_interface', '0007_add_favicon', '2022-07-08 05:17:49.716013'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2022-07-08 05:17:49.742121'),
(14, 'admin_interface', '0009_add_enviroment', '2022-07-08 05:17:49.769288'),
(15, 'admin_interface', '0010_add_localization', '2022-07-08 05:17:49.785188'),
(16, 'admin_interface', '0011_add_environment_options', '2022-07-08 05:17:49.834894'),
(17, 'admin_interface', '0012_update_verbose_names', '2022-07-08 05:17:49.842037'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2022-07-08 05:17:49.862302'),
(19, 'admin_interface', '0014_name_unique', '2022-07-08 05:17:49.892062'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2022-07-08 05:17:49.908018'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2022-07-08 05:17:49.925565'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2022-07-08 05:17:49.931516'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2022-07-08 05:17:49.948661'),
(24, 'admin_interface', '0019_add_form_sticky', '2022-07-08 05:17:49.977647'),
(25, 'admin_interface', '0020_module_selected_colors', '2022-07-08 05:17:50.015469'),
(26, 'admin_interface', '0021_file_extension_validator', '2022-07-08 05:17:50.023530'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2022-07-08 05:17:50.052840'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2022-07-08 05:17:50.068922'),
(29, 'admin_interface', '0024_remove_theme_css', '2022-07-08 05:17:50.080828'),
(30, 'app', '0001_initial', '2022-07-08 05:17:50.237254'),
(31, 'contenttypes', '0002_remove_content_type_name', '2022-07-08 05:17:50.286323'),
(32, 'auth', '0002_alter_permission_name_max_length', '2022-07-08 05:17:50.332372'),
(33, 'auth', '0003_alter_user_email_max_length', '2022-07-08 05:17:50.347741'),
(34, 'auth', '0004_alter_user_username_opts', '2022-07-08 05:17:50.357167'),
(35, 'auth', '0005_alter_user_last_login_null', '2022-07-08 05:17:50.389766'),
(36, 'auth', '0006_require_contenttypes_0002', '2022-07-08 05:17:50.394247'),
(37, 'auth', '0007_alter_validators_add_error_messages', '2022-07-08 05:17:50.404010'),
(38, 'auth', '0008_alter_user_username_max_length', '2022-07-08 05:17:50.421545'),
(39, 'auth', '0009_alter_user_last_name_max_length', '2022-07-08 05:17:50.436516'),
(40, 'auth', '0010_alter_group_name_max_length', '2022-07-08 05:17:50.456635'),
(41, 'auth', '0011_update_proxy_permissions', '2022-07-08 05:17:50.470775'),
(42, 'auth', '0012_alter_user_first_name_max_length', '2022-07-08 05:17:50.487144'),
(43, 'sessions', '0001_initial', '2022-07-08 05:17:50.526624'),
(44, 'app', '0002_producto_descuento_producto_total_descuento', '2022-07-09 05:29:58.655266');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('26ecmc0b9frhz4qseyojt8xp19wgeiu9', '.eJxVjDEOAiEQRe9CbQgKAcbS3jOQGYaRVQPJslsZ766bbKHtf-_9l0q4LjWto8xpYnVWoA6_G2F-lLYBvmO7dZ17W-aJ9KbonQ597Vyel939O6g46rcOOVi0gAVNpGI4ckYCQsks1hk5gqArzjkhDycvHsgZlggWKHC06v0BIcM5DQ:1oBUx8:dPwduYkUPVckabzum3uPAL-T_n4cWjXIW7RIiGn3flc', '2022-07-27 05:30:26.390699'),
('37tkbsnkpgv0o7ua0rv11eco7g0ki7xh', '.eJxVjDEOAiEQRe9CbQgKAcbS3jOQGYaRVQPJslsZ766bbKHtf-_9l0q4LjWto8xpYnVWoA6_G2F-lLYBvmO7dZ17W-aJ9KbonQ597Vyel939O6g46rcOOVi0gAVNpGI4ckYCQsks1hk5gqArzjkhDycvHsgZlggWKHC06v0BIcM5DQ:1oBVfI:wK7ZavjuDs-gX7tmKPdTCiCfHES-I3fVxcJ-37r0E2c', '2022-07-27 06:16:04.357671'),
('e5tkgxcq1jxla0u2kysi9vpm7jlhyol2', '.eJxVjEEOwiAQRe_C2pDSzhRw6d4zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnZdTpd2OKj1R2IHcqt6pjLesys94VfdCmr1XS83K4fweZWv7WLpE47gbvfRJABObJCErvLLJBHNH0RD4ODiNxcjbaiTsYAEYP1oJ6fwDojDeJ:1oAeOD:MqEJOFxU3F5sbyBIsYgHxK5Q_ZwTemoyNWLs0VNuIqk', '2022-07-24 21:22:53.637672'),
('gcp5pzjim44od1mvjbwf08wc92rckzbo', '.eJxVjEEOwiAQRe_C2hCgpQMu3fcMZJihUjWQlHZlvLtt0oVu_3vvv0XAbc1ha2kJM4urMOLyu0WkZyoH4AeWe5VUy7rMUR6KPGmTY-X0up3u30HGlvcaQTkmtB5I90DswE82MkKCbohsdDehdt4Qs0e2JhrFyeteDaRh98XnC_m9OGg:1oAezC:gVlo_T9URzwBFqLPtmnRgMtKmGkcBrxNN7ljL35fnW8', '2022-07-24 22:01:06.825555');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `db_compras`
--
ALTER TABLE `db_compras`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `db_estadocompra`
--
ALTER TABLE `db_estadocompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `db_items_carrito`
--
ALTER TABLE `db_items_carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `db_producto`
--
ALTER TABLE `db_producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `db_producto_tipo_id_b9ba0546_fk_db_tipo_producto_id` (`tipo_id`);

--
-- Indices de la tabla `db_tipo_producto`
--
ALTER TABLE `db_tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `db_tipo_usuario`
--
ALTER TABLE `db_tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `db_usuario`
--
ALTER TABLE `db_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoUser_id` (`djangoUser_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `db_compras`
--
ALTER TABLE `db_compras`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `db_estadocompra`
--
ALTER TABLE `db_estadocompra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `db_items_carrito`
--
ALTER TABLE `db_items_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `db_tipo_producto`
--
ALTER TABLE `db_tipo_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `db_tipo_usuario`
--
ALTER TABLE `db_tipo_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `db_usuario`
--
ALTER TABLE `db_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `db_producto`
--
ALTER TABLE `db_producto`
  ADD CONSTRAINT `db_producto_tipo_id_b9ba0546_fk_db_tipo_producto_id` FOREIGN KEY (`tipo_id`) REFERENCES `db_tipo_producto` (`id`);

--
-- Filtros para la tabla `db_usuario`
--
ALTER TABLE `db_usuario`
  ADD CONSTRAINT `db_usuario_djangoUser_id_673c7f8f_fk_auth_user_id` FOREIGN KEY (`djangoUser_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
