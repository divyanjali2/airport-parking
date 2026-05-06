-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 24, 2026 at 09:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport--parking`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_actiondom`
--

CREATE TABLE `modxwl_access_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_category`
--

CREATE TABLE `modxwl_access_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_context`
--

CREATE TABLE `modxwl_access_context` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_access_context`
--

INSERT INTO `modxwl_access_context` (`id`, `target`, `principal_class`, `principal`, `authority`, `policy`) VALUES
(1, 'web', 'MODX\\Revolution\\modUserGroup', 0, 9999, 3),
(2, 'mgr', 'MODX\\Revolution\\modUserGroup', 1, 0, 2),
(3, 'web', 'MODX\\Revolution\\modUserGroup', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_elements`
--

CREATE TABLE `modxwl_access_elements` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_media_source`
--

CREATE TABLE `modxwl_access_media_source` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_menus`
--

CREATE TABLE `modxwl_access_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_namespace`
--

CREATE TABLE `modxwl_access_namespace` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_permissions`
--

CREATE TABLE `modxwl_access_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `value` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_access_permissions`
--

INSERT INTO `modxwl_access_permissions` (`id`, `template`, `name`, `description`, `value`) VALUES
(1, 1, 'about', 'perm.about_desc', 1),
(2, 1, 'access_permissions', 'perm.access_permissions_desc', 1),
(3, 1, 'actions', 'perm.actions_desc', 1),
(4, 1, 'change_password', 'perm.change_password_desc', 1),
(5, 1, 'change_profile', 'perm.change_profile_desc', 1),
(6, 1, 'charsets', 'perm.charsets_desc', 1),
(7, 1, 'class_map', 'perm.class_map_desc', 1),
(8, 1, 'components', 'perm.components_desc', 1),
(9, 1, 'content_types', 'perm.content_types_desc', 1),
(10, 1, 'countries', 'perm.countries_desc', 1),
(11, 1, 'create', 'perm.create_desc', 1),
(12, 1, 'credits', 'perm.credits_desc', 1),
(13, 1, 'customize_forms', 'perm.customize_forms_desc', 1),
(14, 1, 'dashboards', 'perm.dashboards_desc', 1),
(15, 1, 'database', 'perm.database_desc', 1),
(16, 1, 'database_truncate', 'perm.database_truncate_desc', 1),
(17, 1, 'delete_category', 'perm.delete_category_desc', 1),
(18, 1, 'delete_chunk', 'perm.delete_chunk_desc', 1),
(19, 1, 'delete_context', 'perm.delete_context_desc', 1),
(20, 1, 'delete_document', 'perm.delete_document_desc', 1),
(21, 1, 'delete_weblink', 'perm.delete_weblink_desc', 1),
(22, 1, 'delete_symlink', 'perm.delete_symlink_desc', 1),
(23, 1, 'delete_static_resource', 'perm.delete_static_resource_desc', 1),
(24, 1, 'delete_eventlog', 'perm.delete_eventlog_desc', 1),
(25, 1, 'delete_plugin', 'perm.delete_plugin_desc', 1),
(26, 1, 'delete_propertyset', 'perm.delete_propertyset_desc', 1),
(27, 1, 'delete_snippet', 'perm.delete_snippet_desc', 1),
(28, 1, 'delete_template', 'perm.delete_template_desc', 1),
(29, 1, 'delete_tv', 'perm.delete_tv_desc', 1),
(30, 1, 'delete_role', 'perm.delete_role_desc', 1),
(31, 1, 'delete_user', 'perm.delete_user_desc', 1),
(32, 1, 'directory_chmod', 'perm.directory_chmod_desc', 1),
(33, 1, 'directory_create', 'perm.directory_create_desc', 1),
(34, 1, 'directory_list', 'perm.directory_list_desc', 1),
(35, 1, 'directory_remove', 'perm.directory_remove_desc', 1),
(36, 1, 'directory_update', 'perm.directory_update_desc', 1),
(37, 1, 'edit_category', 'perm.edit_category_desc', 1),
(38, 1, 'edit_chunk', 'perm.edit_chunk_desc', 1),
(39, 1, 'edit_context', 'perm.edit_context_desc', 1),
(40, 1, 'edit_document', 'perm.edit_document_desc', 1),
(41, 1, 'edit_weblink', 'perm.edit_weblink_desc', 1),
(42, 1, 'edit_symlink', 'perm.edit_symlink_desc', 1),
(43, 1, 'edit_static_resource', 'perm.edit_static_resource_desc', 1),
(44, 1, 'edit_locked', 'perm.edit_locked_desc', 1),
(45, 1, 'edit_plugin', 'perm.edit_plugin_desc', 1),
(46, 1, 'edit_propertyset', 'perm.edit_propertyset_desc', 1),
(47, 1, 'edit_role', 'perm.edit_role_desc', 1),
(48, 1, 'edit_snippet', 'perm.edit_snippet_desc', 1),
(49, 1, 'edit_template', 'perm.edit_template_desc', 1),
(50, 1, 'edit_tv', 'perm.edit_tv_desc', 1),
(51, 1, 'edit_user', 'perm.edit_user_desc', 1),
(52, 1, 'element_tree', 'perm.element_tree_desc', 1),
(53, 1, 'empty_cache', 'perm.empty_cache_desc', 1),
(54, 1, 'error_log_erase', 'perm.error_log_erase_desc', 1),
(55, 1, 'error_log_view', 'perm.error_log_view_desc', 1),
(56, 1, 'export_static', 'perm.export_static_desc', 1),
(57, 1, 'file_create', 'perm.file_create_desc', 1),
(58, 1, 'file_list', 'perm.file_list_desc', 1),
(59, 1, 'file_manager', 'perm.file_manager_desc', 1),
(60, 1, 'file_remove', 'perm.file_remove_desc', 1),
(61, 1, 'file_tree', 'perm.file_tree_desc', 1),
(62, 1, 'file_update', 'perm.file_update_desc', 1),
(63, 1, 'file_upload', 'perm.file_upload_desc', 1),
(64, 1, 'file_unpack', 'perm.file_unpack_desc', 1),
(65, 1, 'file_view', 'perm.file_view_desc', 1),
(66, 1, 'flush_sessions', 'perm.flush_sessions_desc', 1),
(67, 1, 'frames', 'perm.frames_desc', 1),
(68, 1, 'help', 'perm.help_desc', 1),
(69, 1, 'home', 'perm.home_desc', 1),
(70, 1, 'language', 'perm.language_desc', 1),
(71, 1, 'languages', 'perm.languages_desc', 1),
(72, 1, 'lexicons', 'perm.lexicons_desc', 1),
(73, 1, 'list', 'perm.list_desc', 1),
(74, 1, 'load', 'perm.load_desc', 1),
(75, 1, 'logout', 'perm.logout_desc', 1),
(76, 1, 'mgr_log_view', 'perm.mgr_log_view_desc', 1),
(77, 1, 'mgr_log_erase', 'perm.mgr_log_erase_desc', 1),
(78, 1, 'menu_reports', 'perm.menu_reports_desc', 1),
(79, 1, 'menu_security', 'perm.menu_security_desc', 1),
(80, 1, 'menu_site', 'perm.menu_site_desc', 1),
(81, 1, 'menu_support', 'perm.menu_support_desc', 1),
(82, 1, 'menu_system', 'perm.menu_system_desc', 1),
(83, 1, 'menu_tools', 'perm.menu_tools_desc', 1),
(84, 1, 'menu_trash', 'perm.menu_trash_desc', 1),
(85, 1, 'menu_user', 'perm.menu_user_desc', 1),
(86, 1, 'menus', 'perm.menus_desc', 1),
(87, 1, 'messages', 'perm.messages_desc', 1),
(88, 1, 'namespaces', 'perm.namespaces_desc', 1),
(89, 1, 'new_category', 'perm.new_category_desc', 1),
(90, 1, 'new_chunk', 'perm.new_chunk_desc', 1),
(91, 1, 'new_context', 'perm.new_context_desc', 1),
(92, 1, 'new_document', 'perm.new_document_desc', 1),
(93, 1, 'new_static_resource', 'perm.new_static_resource_desc', 1),
(94, 1, 'new_symlink', 'perm.new_symlink_desc', 1),
(95, 1, 'new_weblink', 'perm.new_weblink_desc', 1),
(96, 1, 'new_document_in_root', 'perm.new_document_in_root_desc', 1),
(97, 1, 'new_plugin', 'perm.new_plugin_desc', 1),
(98, 1, 'new_propertyset', 'perm.new_propertyset_desc', 1),
(99, 1, 'new_role', 'perm.new_role_desc', 1),
(100, 1, 'new_snippet', 'perm.new_snippet_desc', 1),
(101, 1, 'new_template', 'perm.new_template_desc', 1),
(102, 1, 'new_tv', 'perm.new_tv_desc', 1),
(103, 1, 'new_user', 'perm.new_user_desc', 1),
(104, 1, 'packages', 'perm.packages_desc', 1),
(105, 1, 'policy_delete', 'perm.policy_delete_desc', 1),
(106, 1, 'policy_edit', 'perm.policy_edit_desc', 1),
(107, 1, 'policy_new', 'perm.policy_new_desc', 1),
(108, 1, 'policy_save', 'perm.policy_save_desc', 1),
(109, 1, 'policy_view', 'perm.policy_view_desc', 1),
(110, 1, 'policy_template_delete', 'perm.policy_template_delete_desc', 1),
(111, 1, 'policy_template_edit', 'perm.policy_template_edit_desc', 1),
(112, 1, 'policy_template_new', 'perm.policy_template_new_desc', 1),
(113, 1, 'policy_template_save', 'perm.policy_template_save_desc', 1),
(114, 1, 'policy_template_view', 'perm.policy_template_view_desc', 1),
(115, 1, 'property_sets', 'perm.property_sets_desc', 1),
(116, 1, 'providers', 'perm.providers_desc', 1),
(117, 1, 'publish_document', 'perm.publish_document_desc', 1),
(118, 1, 'purge_deleted', 'perm.purge_deleted_desc', 1),
(119, 1, 'remove', 'perm.remove_desc', 1),
(120, 1, 'remove_locks', 'perm.remove_locks_desc', 1),
(121, 1, 'resource_duplicate', 'perm.resource_duplicate_desc', 1),
(122, 1, 'resourcegroup_delete', 'perm.resourcegroup_delete_desc', 1),
(123, 1, 'resourcegroup_edit', 'perm.resourcegroup_edit_desc', 1),
(124, 1, 'resourcegroup_new', 'perm.resourcegroup_new_desc', 1),
(125, 1, 'resourcegroup_resource_edit', 'perm.resourcegroup_resource_edit_desc', 1),
(126, 1, 'resourcegroup_resource_list', 'perm.resourcegroup_resource_list_desc', 1),
(127, 1, 'resourcegroup_save', 'perm.resourcegroup_save_desc', 1),
(128, 1, 'resourcegroup_view', 'perm.resourcegroup_view_desc', 1),
(129, 1, 'resource_quick_create', 'perm.resource_quick_create_desc', 1),
(130, 1, 'resource_quick_update', 'perm.resource_quick_update_desc', 1),
(131, 1, 'resource_tree', 'perm.resource_tree_desc', 1),
(132, 1, 'save', 'perm.save_desc', 1),
(133, 1, 'save_category', 'perm.save_category_desc', 1),
(134, 1, 'save_chunk', 'perm.save_chunk_desc', 1),
(135, 1, 'save_context', 'perm.save_context_desc', 1),
(136, 1, 'save_document', 'perm.save_document_desc', 1),
(137, 1, 'save_plugin', 'perm.save_plugin_desc', 1),
(138, 1, 'save_propertyset', 'perm.save_propertyset_desc', 1),
(139, 1, 'save_role', 'perm.save_role_desc', 1),
(140, 1, 'save_snippet', 'perm.save_snippet_desc', 1),
(141, 1, 'save_template', 'perm.save_template_desc', 1),
(142, 1, 'save_tv', 'perm.save_tv_desc', 1),
(143, 1, 'save_user', 'perm.save_user_desc', 1),
(144, 1, 'search', 'perm.search_desc', 1),
(145, 1, 'set_sudo', 'perm.set_sudo_desc', 1),
(146, 1, 'settings', 'perm.settings_desc', 1),
(147, 1, 'events', 'perm.events_desc', 1),
(148, 1, 'source_save', 'perm.source_save_desc', 1),
(149, 1, 'source_delete', 'perm.source_delete_desc', 1),
(150, 1, 'source_edit', 'perm.source_edit_desc', 1),
(151, 1, 'source_view', 'perm.source_view_desc', 1),
(152, 1, 'sources', 'perm.sources_desc', 1),
(153, 1, 'steal_locks', 'perm.steal_locks_desc', 1),
(154, 1, 'tree_show_element_ids', 'perm.tree_show_element_ids_desc', 1),
(155, 1, 'tree_show_resource_ids', 'perm.tree_show_resource_ids_desc', 1),
(156, 1, 'undelete_document', 'perm.undelete_document_desc', 1),
(157, 1, 'unpublish_document', 'perm.unpublish_document_desc', 1),
(158, 1, 'unlock_element_properties', 'perm.unlock_element_properties_desc', 1),
(159, 1, 'usergroup_delete', 'perm.usergroup_delete_desc', 1),
(160, 1, 'usergroup_edit', 'perm.usergroup_edit_desc', 1),
(161, 1, 'usergroup_new', 'perm.usergroup_new_desc', 1),
(162, 1, 'usergroup_save', 'perm.usergroup_save_desc', 1),
(163, 1, 'usergroup_user_edit', 'perm.usergroup_user_edit_desc', 1),
(164, 1, 'usergroup_user_list', 'perm.usergroup_user_list_desc', 1),
(165, 1, 'usergroup_view', 'perm.usergroup_view_desc', 1),
(166, 1, 'view', 'perm.view_desc', 1),
(167, 1, 'view_category', 'perm.view_category_desc', 1),
(168, 1, 'view_chunk', 'perm.view_chunk_desc', 1),
(169, 1, 'view_context', 'perm.view_context_desc', 1),
(170, 1, 'view_document', 'perm.view_document_desc', 1),
(171, 1, 'view_element', 'perm.view_element_desc', 1),
(172, 1, 'view_eventlog', 'perm.view_eventlog_desc', 1),
(173, 1, 'view_offline', 'perm.view_offline_desc', 1),
(174, 1, 'view_plugin', 'perm.view_plugin_desc', 1),
(175, 1, 'view_propertyset', 'perm.view_propertyset_desc', 1),
(176, 1, 'view_role', 'perm.view_role_desc', 1),
(177, 1, 'view_snippet', 'perm.view_snippet_desc', 1),
(178, 1, 'view_sysinfo', 'perm.view_sysinfo_desc', 1),
(179, 1, 'view_template', 'perm.view_template_desc', 1),
(180, 1, 'view_tv', 'perm.view_tv_desc', 1),
(181, 1, 'view_user', 'perm.view_user_desc', 1),
(182, 1, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(183, 1, 'workspaces', 'perm.workspaces_desc', 1),
(184, 2, 'add_children', 'perm.add_children_desc', 1),
(185, 2, 'copy', 'perm.copy_desc', 1),
(186, 2, 'create', 'perm.create_desc', 1),
(187, 2, 'delete', 'perm.delete_desc', 1),
(188, 2, 'list', 'perm.list_desc', 1),
(189, 2, 'load', 'perm.load_desc', 1),
(190, 2, 'move', 'perm.move_desc', 1),
(191, 2, 'publish', 'perm.publish_desc', 1),
(192, 2, 'remove', 'perm.remove_desc', 1),
(193, 2, 'save', 'perm.save_desc', 1),
(194, 2, 'steal_lock', 'perm.steal_lock_desc', 1),
(195, 2, 'undelete', 'perm.undelete_desc', 1),
(196, 2, 'unpublish', 'perm.unpublish_desc', 1),
(197, 2, 'view', 'perm.view_desc', 1),
(198, 3, 'load', 'perm.load_desc', 1),
(199, 3, 'list', 'perm.list_desc', 1),
(200, 3, 'view', 'perm.view_desc', 1),
(201, 3, 'save', 'perm.save_desc', 1),
(202, 3, 'remove', 'perm.remove_desc', 1),
(203, 4, 'add_children', 'perm.add_children_desc', 1),
(204, 4, 'create', 'perm.create_desc', 1),
(205, 4, 'copy', 'perm.copy_desc', 1),
(206, 4, 'delete', 'perm.delete_desc', 1),
(207, 4, 'list', 'perm.list_desc', 1),
(208, 4, 'load', 'perm.load_desc', 1),
(209, 4, 'remove', 'perm.remove_desc', 1),
(210, 4, 'save', 'perm.save_desc', 1),
(211, 4, 'view', 'perm.view_desc', 1),
(212, 5, 'create', 'perm.create_desc', 1),
(213, 5, 'copy', 'perm.copy_desc', 1),
(214, 5, 'list', 'perm.list_desc', 1),
(215, 5, 'load', 'perm.load_desc', 1),
(216, 5, 'remove', 'perm.remove_desc', 1),
(217, 5, 'save', 'perm.save_desc', 1),
(218, 5, 'view', 'perm.view_desc', 1),
(219, 6, 'load', 'perm.load_desc', 1),
(220, 6, 'list', 'perm.list_desc', 1),
(221, 6, 'view', 'perm.view_desc', 1),
(222, 6, 'save', 'perm.save_desc', 1),
(223, 6, 'remove', 'perm.remove_desc', 1),
(224, 6, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(225, 6, 'copy', 'perm.copy_desc', 1),
(226, 7, 'list', 'perm.list_desc', 1),
(227, 7, 'load', 'perm.load_desc', 1),
(228, 7, 'view', 'perm.view_desc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_policies`
--

CREATE TABLE `modxwl_access_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `template` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class` varchar(191) NOT NULL DEFAULT '',
  `data` text DEFAULT NULL,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_access_policies`
--

INSERT INTO `modxwl_access_policies` (`id`, `name`, `description`, `parent`, `template`, `class`, `data`, `lexicon`) VALUES
(1, 'Resource', 'policy_resource_desc', 0, 2, '', '{\"add_children\":true,\"create\":true,\"copy\":true,\"delete\":true,\"list\":true,\"load\":true,\"move\":true,\"publish\":true,\"remove\":true,\"save\":true,\"steal_lock\":true,\"undelete\":true,\"unpublish\":true,\"view\":true}', 'permissions'),
(2, 'Administrator', 'policy_administrator_desc', 0, 1, '', '{\"about\":true,\"access_permissions\":true,\"actions\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"database_truncate\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_role\":true,\"delete_snippet\":true,\"delete_static_resource\":true,\"delete_symlink\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_user\":true,\"delete_weblink\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"edit_weblink\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"events\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_unpack\":true,\"file_update\":true,\"file_upload\":true,\"file_view\":true,\"flush_sessions\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"mgr_log_view\":true,\"mgr_log_erase\":true,\"menu_reports\":true,\"menu_security\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_trash\":true,\"menu_user\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"new_weblink\":true,\"packages\":true,\"policy_delete\":true,\"policy_edit\":true,\"policy_new\":true,\"policy_save\":true,\"policy_template_delete\":true,\"policy_template_edit\":true,\"policy_template_new\":true,\"policy_template_save\":true,\"policy_template_view\":true,\"policy_view\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"remove_locks\":true,\"resource_duplicate\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"resourcegroup_delete\":true,\"resourcegroup_edit\":true,\"resourcegroup_new\":true,\"resourcegroup_resource_edit\":true,\"resourcegroup_resource_list\":true,\"resourcegroup_save\":true,\"resourcegroup_view\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_role\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"set_sudo\":true,\"settings\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"sources\":true,\"steal_locks\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unlock_element_properties\":true,\"unpublish_document\":true,\"usergroup_delete\":true,\"usergroup_edit\":true,\"usergroup_new\":true,\"usergroup_save\":true,\"usergroup_user_edit\":true,\"usergroup_user_list\":true,\"usergroup_view\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_unpublished\":true,\"view_user\":true,\"workspaces\":true}', 'permissions'),
(3, 'Load Only', 'policy_load_only_desc', 0, 3, '', '{\"load\":true}', 'permissions'),
(4, 'Load, List and View', 'policy_load_list_and_view_desc', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(5, 'Object', 'policy_object_desc', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true}', 'permissions'),
(6, 'Element', 'policy_element_desc', 0, 4, '', '{\"add_children\":true,\"create\":true,\"delete\":true,\"list\":true,\"load\":true,\"remove\":true,\"save\":true,\"view\":true,\"copy\":true}', 'permissions'),
(7, 'Content Editor', 'policy_content_editor_desc', 0, 1, '', '{\"change_profile\":true,\"class_map\":true,\"countries\":true,\"delete_document\":true,\"delete_static_resource\":true,\"delete_symlink\":true,\"delete_weblink\":true,\"edit_document\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_weblink\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"list\":true,\"load\":true,\"logout\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_tools\":true,\"menu_user\":true,\"new_document\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_weblink\":true,\"resource_duplicate\":true,\"resource_tree\":true,\"save_document\":true,\"source_view\":true,\"tree_show_resource_ids\":true,\"view\":true,\"view_document\":true,\"view_template\":true}', 'permissions'),
(8, 'Media Source Admin', 'policy_media_source_admin_desc', 0, 5, '', '{\"create\":true,\"copy\":true,\"load\":true,\"list\":true,\"save\":true,\"remove\":true,\"view\":true}', 'permissions'),
(9, 'Media Source User', 'policy_media_source_user_desc', 0, 5, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(10, 'Developer', 'policy_developer_desc', 0, 1, '', '{\"about\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_role\":true,\"delete_snippet\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_user\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"edit_weblink\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_unpack\":true,\"file_update\":true,\"file_upload\":true,\"file_view\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"mgr_log_view\":true,\"mgr_log_erase\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_user\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"new_weblink\":true,\"packages\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"resource_duplicate\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"settings\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"sources\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unlock_element_properties\":true,\"unpublish_document\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_unpublished\":true,\"view_user\":true,\"workspaces\":true}', 'permissions'),
(11, 'Context', 'policy_context_desc', 0, 6, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true,\"copy\":true,\"view_unpublished\":true}', 'permissions'),
(12, 'Hidden Namespace', 'policy_hidden_namespace_desc', 0, 7, '', '{\"load\":false,\"list\":false,\"view\":true}', 'permissions');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_policy_templates`
--

CREATE TABLE `modxwl_access_policy_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_access_policy_templates`
--

INSERT INTO `modxwl_access_policy_templates` (`id`, `template_group`, `name`, `description`, `lexicon`) VALUES
(1, 1, 'AdministratorTemplate', 'policy_template_administrator_desc', 'permissions'),
(2, 3, 'ResourceTemplate', 'policy_template_resource_desc', 'permissions'),
(3, 2, 'ObjectTemplate', 'policy_template_object_desc', 'permissions'),
(4, 4, 'ElementTemplate', 'policy_template_element_desc', 'permissions'),
(5, 5, 'MediaSourceTemplate', 'policy_template_mediasource_desc', 'permissions'),
(6, 7, 'ContextTemplate', 'policy_template_context_desc', 'permissions'),
(7, 6, 'NamespaceTemplate', 'policy_template_namespace_desc', 'permissions');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_policy_template_groups`
--

CREATE TABLE `modxwl_access_policy_template_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_access_policy_template_groups`
--

INSERT INTO `modxwl_access_policy_template_groups` (`id`, `name`, `description`) VALUES
(1, 'Administrator', 'policy_template_group_administrator_desc'),
(2, 'Object', 'policy_template_group_object_desc'),
(3, 'Resource', 'policy_template_group_resource_desc'),
(4, 'Element', 'policy_template_group_element_desc'),
(5, 'MediaSource', 'policy_template_group_mediasource_desc'),
(6, 'Namespace', 'policy_template_group_namespace_desc'),
(7, 'Context', 'policy_template_group_context_desc');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_resources`
--

CREATE TABLE `modxwl_access_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_resource_groups`
--

CREATE TABLE `modxwl_access_resource_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_access_templatevars`
--

CREATE TABLE `modxwl_access_templatevars` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_actiondom`
--

CREATE TABLE `modxwl_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `set` int(11) NOT NULL DEFAULT 0,
  `action` varchar(191) NOT NULL DEFAULT '',
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `xtype` varchar(100) NOT NULL DEFAULT '',
  `container` varchar(255) NOT NULL DEFAULT '',
  `rule` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `for_parent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_actions_fields`
--

CREATE TABLE `modxwl_actions_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(191) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT 'field',
  `tab` varchar(191) NOT NULL DEFAULT '',
  `form` varchar(255) NOT NULL DEFAULT '',
  `other` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_actions_fields`
--

INSERT INTO `modxwl_actions_fields` (`id`, `action`, `name`, `type`, `tab`, `form`, `other`, `rank`) VALUES
(1, 'resource/update', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(2, 'resource/update', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(3, 'resource/update', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(4, 'resource/update', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(5, 'resource/update', 'alias', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(6, 'resource/update', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(7, 'resource/update', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(8, 'resource/update', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 5),
(9, 'resource/update', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0),
(10, 'resource/update', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 3),
(11, 'resource/update', 'modx-resource-main-right-top', 'tab', '', 'modx-panel-resource', '', 4),
(12, 'resource/update', 'published', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 0),
(13, 'resource/update', 'deleted', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 1),
(14, 'resource/update', 'publishedon', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 2),
(15, 'resource/update', 'pub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 3),
(16, 'resource/update', 'unpub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 4),
(17, 'resource/update', 'modx-resource-main-right-middle', 'tab', '', 'modx-panel-resource', '', 5),
(18, 'resource/update', 'template', 'field', 'modx-resource-main-right-middle', 'modx-panel-resource', '', 0),
(19, 'resource/update', 'modx-resource-main-right-bottom', 'tab', '', 'modx-panel-resource', '', 6),
(20, 'resource/update', 'hidemenu', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 0),
(21, 'resource/update', 'menutitle', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 1),
(22, 'resource/update', 'link_attributes', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 2),
(23, 'resource/update', 'menuindex', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 3),
(24, 'resource/update', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 7),
(25, 'resource/update', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 8),
(26, 'resource/update', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(27, 'resource/update', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(28, 'resource/update', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 9),
(29, 'resource/update', 'parent-cmb', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(30, 'resource/update', 'content_dispo', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(31, 'resource/update', 'modx-page-settings-box-left', 'tab', '', 'modx-panel-resource', '', 10),
(32, 'resource/update', 'isfolder', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 0),
(33, 'resource/update', 'show_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 1),
(34, 'resource/update', 'hide_children_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 2),
(35, 'resource/update', 'alias_visible', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 3),
(36, 'resource/update', 'uri_override', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 4),
(37, 'resource/update', 'uri', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 5),
(38, 'resource/update', 'modx-page-settings-box-right', 'tab', '', 'modx-panel-resource', '', 11),
(39, 'resource/update', 'richtext', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 0),
(40, 'resource/update', 'cacheable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 1),
(41, 'resource/update', 'searchable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 2),
(42, 'resource/update', 'syncsite', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 3),
(43, 'resource/update', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 12),
(44, 'resource/update', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 13),
(45, 'resource/create', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(46, 'resource/create', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(47, 'resource/create', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(48, 'resource/create', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(49, 'resource/create', 'alias', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(50, 'resource/create', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(51, 'resource/create', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(52, 'resource/create', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 5),
(53, 'resource/create', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0),
(54, 'resource/create', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 3),
(55, 'resource/create', 'modx-resource-main-right-top', 'tab', '', 'modx-panel-resource', '', 4),
(56, 'resource/create', 'published', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 0),
(57, 'resource/create', 'deleted', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 1),
(58, 'resource/create', 'publishedon', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 2),
(59, 'resource/create', 'pub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 3),
(60, 'resource/create', 'unpub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 4),
(61, 'resource/create', 'modx-resource-main-right-middle', 'tab', '', 'modx-panel-resource', '', 5),
(62, 'resource/create', 'template', 'field', 'modx-resource-main-right-middle', 'modx-panel-resource', '', 0),
(63, 'resource/create', 'modx-resource-main-right-bottom', 'tab', '', 'modx-panel-resource', '', 6),
(64, 'resource/create', 'hidemenu', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 0),
(65, 'resource/create', 'menutitle', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 1),
(66, 'resource/create', 'link_attributes', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 2),
(67, 'resource/create', 'menuindex', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 3),
(68, 'resource/create', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 7),
(69, 'resource/create', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 8),
(70, 'resource/create', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(71, 'resource/create', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(72, 'resource/create', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 9),
(73, 'resource/create', 'parent-cmb', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(74, 'resource/create', 'content_dispo', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(75, 'resource/create', 'modx-page-settings-box-left', 'tab', '', 'modx-panel-resource', '', 10),
(76, 'resource/create', 'isfolder', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 0),
(77, 'resource/create', 'show_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 1),
(78, 'resource/create', 'hide_children_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 2),
(79, 'resource/create', 'alias_visible', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 3),
(80, 'resource/create', 'uri_override', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 4),
(81, 'resource/create', 'uri', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 5),
(82, 'resource/create', 'modx-page-settings-box-right', 'tab', '', 'modx-panel-resource', '', 11),
(83, 'resource/create', 'richtext', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 0),
(84, 'resource/create', 'cacheable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 1),
(85, 'resource/create', 'searchable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 2),
(86, 'resource/create', 'syncsite', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 3),
(87, 'resource/create', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 12),
(88, 'resource/create', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 13);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_active_users`
--

CREATE TABLE `modxwl_active_users` (
  `internalKey` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(11) NOT NULL DEFAULT 0,
  `id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_categories`
--

CREATE TABLE `modxwl_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED DEFAULT 0,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_categories_closure`
--

CREATE TABLE `modxwl_categories_closure` (
  `ancestor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `descendant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `depth` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_content_type`
--

CREATE TABLE `modxwl_content_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `mime_type` tinytext DEFAULT NULL,
  `file_extensions` tinytext DEFAULT NULL,
  `icon` tinytext DEFAULT NULL,
  `headers` mediumtext DEFAULT NULL,
  `binary` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_content_type`
--

INSERT INTO `modxwl_content_type` (`id`, `name`, `description`, `mime_type`, `file_extensions`, `icon`, `headers`, `binary`) VALUES
(1, 'HTML', 'HTML content', 'text/html', '.html', '', NULL, 0),
(2, 'XML', 'XML content', 'text/xml', '.xml', 'icon-xml', NULL, 0),
(3, 'Text', 'Plain text content', 'text/plain', '.txt', 'icon-txt', NULL, 0),
(4, 'CSS', 'CSS content', 'text/css', '.css', 'icon-css', NULL, 0),
(5, 'JavaScript', 'JavaScript content', 'text/javascript', '.js', 'icon-js', NULL, 0),
(6, 'RSS', 'For RSS feeds', 'application/rss+xml', '.rss', 'icon-rss', NULL, 0),
(7, 'JSON', 'JSON', 'application/json', '.json', 'icon-json', NULL, 0),
(8, 'PDF', 'PDF Files', 'application/pdf', '.pdf', 'icon-pdf', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_context`
--

CREATE TABLE `modxwl_context` (
  `key` varchar(100) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_context`
--

INSERT INTO `modxwl_context` (`key`, `name`, `description`, `rank`) VALUES
('mgr', 'Manager', 'The default manager or administration context for content management activity.', 0),
('web', 'Website', 'The default front-end context for your web site.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_context_resource`
--

CREATE TABLE `modxwl_context_resource` (
  `context_key` varchar(191) NOT NULL,
  `resource` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_context_setting`
--

CREATE TABLE `modxwl_context_setting` (
  `context_key` varchar(191) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_context_setting`
--

INSERT INTO `modxwl_context_setting` (`context_key`, `key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('mgr', 'allow_tags_in_post', '1', 'combo-boolean', 'core', 'system', NULL),
('mgr', 'modRequest.class', 'MODX\\Revolution\\modManagerRequest', 'textfield', 'core', 'system', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_dashboard`
--

CREATE TABLE `modxwl_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `hide_trees` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `customizable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_dashboard`
--

INSERT INTO `modxwl_dashboard` (`id`, `name`, `description`, `hide_trees`, `customizable`) VALUES
(1, 'Default', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_dashboard_widget`
--

CREATE TABLE `modxwl_dashboard_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `namespace` varchar(191) NOT NULL DEFAULT '',
  `lexicon` varchar(191) NOT NULL DEFAULT 'core:dashboards',
  `size` varchar(255) NOT NULL DEFAULT 'half',
  `permission` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_dashboard_widget`
--

INSERT INTO `modxwl_dashboard_widget` (`id`, `name`, `description`, `type`, `content`, `properties`, `namespace`, `lexicon`, `size`, `permission`) VALUES
(1, 'w_newsfeed', 'w_newsfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-news.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(2, 'w_securityfeed', 'w_securityfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-security.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(3, 'w_whosonline', 'w_whosonline_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-online.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(4, 'w_recentlyeditedresources', 'w_recentlyeditedresources_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-rer.php', NULL, 'core', 'core:dashboards', 'two-thirds', 'view_document'),
(5, 'w_configcheck', 'w_configcheck_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.configcheck.php', NULL, 'core', 'core:dashboards', 'full', ''),
(6, 'w_buttons', 'w_buttons_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.buttons.php', '{\"create-resource\":{\"link\":\"[[++manager_url]]?a=resource\\/create\",\"icon\":\"file-o\",\"title\":\"[[%action_new_resource]]\",\"description\":\"[[%action_new_resource_desc]]\"},\"view-site\":{\"link\":\"[[++site_url]]\",\"icon\":\"eye\",\"title\":\"[[%action_view_website]]\",\"description\":\"[[%action_view_website_desc]]\",\"target\":\"_blank\"},\"advanced-search\":{\"link\":\"[[++manager_url]]?a=search\",\"icon\":\"search\",\"title\":\"[[%action_advanced_search]]\",\"description\":\"[[%action_advanced_search_desc]]\"},\"manage-users\":{\"link\":\"[[++manager_url]]?a=security\\/user\",\"icon\":\"user\",\"title\":\"[[%action_manage_users]]\",\"description\":\"[[%action_manage_users_desc]]\"}}', 'core', 'core:dashboards', 'full', ''),
(7, 'w_updates', 'w_updates_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.updates.php', NULL, 'core', 'core:dashboards', 'one-third', 'workspaces');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_dashboard_widget_placement`
--

CREATE TABLE `modxwl_dashboard_widget_placement` (
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `widget` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` varchar(255) NOT NULL DEFAULT 'half'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_dashboard_widget_placement`
--

INSERT INTO `modxwl_dashboard_widget_placement` (`user`, `dashboard`, `widget`, `rank`, `size`) VALUES
(0, 1, 1, 2, 'one-third'),
(0, 1, 2, 3, 'one-third'),
(0, 1, 3, 5, 'one-third'),
(0, 1, 4, 6, 'two-thirds'),
(0, 1, 5, 1, 'full'),
(0, 1, 6, 0, 'full'),
(0, 1, 7, 4, 'one-third'),
(1, 1, 1, 2, 'one-third'),
(1, 1, 2, 3, 'one-third'),
(1, 1, 3, 5, 'one-third'),
(1, 1, 4, 6, 'two-thirds'),
(1, 1, 5, 1, 'full'),
(1, 1, 6, 0, 'full'),
(1, 1, 7, 4, 'one-third');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_deprecated_call`
--

CREATE TABLE `modxwl_deprecated_call` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `call_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `caller` varchar(191) NOT NULL DEFAULT '',
  `caller_file` varchar(191) NOT NULL DEFAULT '',
  `caller_line` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_deprecated_call`
--

INSERT INTO `modxwl_deprecated_call` (`id`, `method`, `call_count`, `caller`, `caller_file`, `caller_line`) VALUES
(1, 1, 2, 'MODX\\Revolution\\Registry\\modRegistry::_initRegister', '/home/airpor26/public_html/core/src/Revolution/Registry/modRegistry.php', 173);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_deprecated_method`
--

CREATE TABLE `modxwl_deprecated_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `definition` varchar(191) NOT NULL DEFAULT '',
  `since` varchar(191) NOT NULL DEFAULT '',
  `recommendation` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_deprecated_method`
--

INSERT INTO `modxwl_deprecated_method` (`id`, `definition`, `since`, `recommendation`) VALUES
(1, 'registry.modDbRegister', '3.0', 'Replace references to class registry.modDbRegister with MODX\\Revolution\\Registry\\modDbRegister to take advantage of PSR-4 autoloading.');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_documentgroup_names`
--

CREATE TABLE `modxwl_documentgroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `private_webgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_document_groups`
--

CREATE TABLE `modxwl_document_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_group` int(11) NOT NULL DEFAULT 0,
  `document` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_element_property_sets`
--

CREATE TABLE `modxwl_element_property_sets` (
  `element` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `element_class` varchar(100) NOT NULL DEFAULT '',
  `property_set` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_extension_packages`
--

CREATE TABLE `modxwl_extension_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT 'core',
  `path` text DEFAULT NULL,
  `table_prefix` varchar(255) NOT NULL DEFAULT '',
  `service_class` varchar(255) NOT NULL DEFAULT '',
  `service_name` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_fc_profiles`
--

CREATE TABLE `modxwl_fc_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_fc_profiles_usergroups`
--

CREATE TABLE `modxwl_fc_profiles_usergroups` (
  `usergroup` int(11) NOT NULL DEFAULT 0,
  `profile` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_fc_sets`
--

CREATE TABLE `modxwl_fc_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile` int(11) NOT NULL DEFAULT 0,
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `template` int(11) NOT NULL DEFAULT 0,
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_lexicon_entries`
--

CREATE TABLE `modxwl_lexicon_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `topic` varchar(191) NOT NULL DEFAULT 'default',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  `createdon` datetime DEFAULT NULL,
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_manager_log`
--

CREATE TABLE `modxwl_manager_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `occurred` datetime NOT NULL DEFAULT current_timestamp(),
  `action` varchar(100) NOT NULL DEFAULT '',
  `classKey` varchar(100) NOT NULL DEFAULT '',
  `item` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_manager_log`
--

INSERT INTO `modxwl_manager_log` (`id`, `user`, `occurred`, `action`, `classKey`, `item`) VALUES
(1, 1, '2025-12-28 16:53:02', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(2, 1, '2025-12-28 17:11:54', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(3, 1, '2025-12-28 17:22:53', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(4, 1, '2025-12-29 03:52:44', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(5, 1, '2025-12-29 05:29:20', 'template_create', 'MODX\\Revolution\\modTemplate', '2'),
(6, 1, '2025-12-29 05:29:34', 'chunk_create', 'MODX\\Revolution\\modChunk', '1'),
(7, 1, '2025-12-29 05:29:53', 'chunk_create', 'MODX\\Revolution\\modChunk', '2'),
(8, 1, '2025-12-29 05:30:07', 'chunk_create', 'MODX\\Revolution\\modChunk', '3'),
(9, 1, '2025-12-29 05:30:25', 'snippet_create', 'MODX\\Revolution\\modSnippet', '1'),
(10, 1, '2025-12-29 05:30:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(11, 1, '2025-12-29 05:30:59', 'resource_create', 'MODX\\Revolution\\modDocument', '2'),
(12, 1, '2025-12-29 05:31:05', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(13, 1, '2025-12-29 05:31:15', 'resource_create', 'MODX\\Revolution\\modDocument', '3'),
(14, 1, '2025-12-29 05:31:21', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(15, 1, '2025-12-29 05:31:35', 'resource_create', 'MODX\\Revolution\\modDocument', '4'),
(16, 1, '2025-12-29 05:31:41', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(17, 1, '2025-12-29 05:31:59', 'resource_create', 'MODX\\Revolution\\modDocument', '5'),
(18, 1, '2025-12-29 05:32:05', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(19, 1, '2025-12-29 05:32:28', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(20, 1, '2025-12-29 05:34:54', 'directory_create', '', 'Filesystem: /node_modules'),
(21, 1, '2025-12-29 05:35:22', 'directory_remove', '', 'Filesystem: node_modules/'),
(22, 1, '2025-12-29 05:48:26', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(23, 1, '2025-12-29 05:50:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(24, 1, '2025-12-29 05:50:27', 'resource_create', 'MODX\\Revolution\\modDocument', '6'),
(25, 1, '2025-12-29 05:50:41', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(26, 1, '2025-12-29 05:51:16', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(27, 1, '2025-12-29 05:51:16', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(28, 1, '2025-12-29 05:52:24', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(29, 1, '2025-12-29 05:52:24', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(30, 1, '2025-12-29 05:53:03', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(31, 1, '2025-12-29 05:55:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(32, 1, '2025-12-29 05:56:16', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(33, 1, '2025-12-29 05:56:16', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(34, 1, '2025-12-29 06:05:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(35, 1, '2025-12-29 06:07:28', 'delete_resource', 'MODX\\Revolution\\modDocument', '6'),
(36, 1, '2025-12-29 06:13:43', 'snippet_create', 'MODX\\Revolution\\modSnippet', '2'),
(37, 1, '2025-12-29 06:14:26', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(38, 1, '2025-12-29 06:14:26', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(39, 1, '2025-12-29 06:14:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(40, 1, '2025-12-29 06:16:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(41, 1, '2025-12-29 06:17:01', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(42, 1, '2025-12-29 06:17:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(43, 1, '2025-12-29 06:18:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(44, 1, '2025-12-29 06:19:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(45, 1, '2025-12-29 06:19:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(46, 1, '2025-12-29 06:20:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(47, 1, '2025-12-29 06:22:38', 'chunk_create', 'MODX\\Revolution\\modChunk', '4'),
(48, 1, '2025-12-29 06:23:02', 'chunk_update', 'MODX\\Revolution\\modChunk', '4'),
(49, 1, '2025-12-29 06:23:03', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 4 Default'),
(50, 1, '2025-12-29 06:23:48', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(51, 1, '2025-12-29 06:23:49', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(52, 1, '2025-12-29 06:24:30', 'chunk_delete', 'MODX\\Revolution\\modChunk', '4'),
(53, 1, '2025-12-29 06:24:54', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(54, 1, '2025-12-29 06:24:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(55, 1, '2025-12-29 06:26:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(56, 1, '2025-12-29 06:27:17', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(57, 1, '2025-12-29 07:24:21', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(58, 1, '2025-12-29 07:24:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(59, 1, '2025-12-29 07:25:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(60, 1, '2025-12-29 07:31:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(61, 1, '2025-12-29 07:31:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(62, 1, '2025-12-29 07:33:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(63, 1, '2025-12-29 07:34:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(64, 1, '2025-12-29 07:34:54', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(65, 1, '2025-12-29 07:37:02', 'file_update', '', 'Filesystem: assets/css/style.css'),
(66, 1, '2025-12-29 07:38:10', 'file_update', '', 'Filesystem: assets/css/style.css'),
(67, 1, '2025-12-29 07:39:03', 'file_update', '', 'Filesystem: assets/css/style.css'),
(68, 1, '2025-12-29 07:40:41', 'file_update', '', 'Filesystem: assets/css/style.css'),
(69, 1, '2025-12-29 07:42:11', 'file_update', '', 'Filesystem: assets/css/style.css'),
(70, 1, '2025-12-29 07:42:37', 'file_update', '', 'Filesystem: assets/css/style.css'),
(71, 1, '2025-12-29 07:43:56', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(72, 1, '2025-12-29 07:43:57', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(73, 1, '2025-12-29 07:45:25', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(74, 1, '2025-12-29 07:45:26', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(75, 1, '2025-12-30 07:20:43', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(76, 1, '2025-12-30 11:12:03', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(77, 1, '2025-12-30 11:20:39', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(78, 1, '2025-12-30 11:20:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(79, 1, '2025-12-30 11:21:17', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(80, 1, '2025-12-30 11:22:10', 'file_remove', '', 'Filesystem: assets/images/why-choose-us/img-4.png'),
(81, 1, '2025-12-30 11:22:15', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(82, 1, '2025-12-30 11:24:56', 'file_remove', '', 'Filesystem: assets/images/why-choose-us/img-4.png'),
(83, 1, '2025-12-30 11:25:02', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(84, 1, '2025-12-30 11:25:51', 'file_remove', '', 'Filesystem: assets/images/why-choose-us/img-4.png'),
(85, 1, '2025-12-30 11:25:56', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(86, 1, '2025-12-30 11:26:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(87, 1, '2025-12-30 11:27:14', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(88, 1, '2025-12-30 11:27:19', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(89, 1, '2025-12-30 11:28:11', 'file_update', '', 'Filesystem: assets/css/style.css'),
(90, 1, '2025-12-30 11:28:23', 'file_remove', '', 'Filesystem: assets/images/logo.png'),
(91, 1, '2025-12-30 11:28:37', 'file_upload', '', 'Filesystem: assets/images/'),
(92, 1, '2025-12-30 11:30:04', 'file_upload', '', 'Filesystem: assets/images/'),
(93, 1, '2025-12-30 11:30:21', 'file_rename', '', 'Filesystem: assets/images/airport-parking-1.png -> assets/images/logo-1.png'),
(94, 1, '2025-12-30 11:30:35', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(95, 1, '2025-12-30 11:30:35', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(96, 1, '2025-12-30 11:31:57', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(97, 1, '2025-12-30 11:31:58', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(98, 1, '2025-12-30 11:32:10', 'file_rename', '', 'Filesystem: assets/images/logo-1.png -> assets/images/logo.png'),
(99, 1, '2025-12-30 11:32:35', 'file_remove', '', 'Filesystem: assets/images/logo.png'),
(100, 1, '2025-12-30 11:33:33', 'file_upload', '', 'Filesystem: assets/images/'),
(101, 1, '2025-12-30 11:38:08', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(102, 1, '2025-12-30 11:38:09', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(103, 1, '2025-12-30 11:38:25', 'file_remove', '', 'Filesystem: assets/images/logo.png'),
(104, 1, '2025-12-30 11:38:31', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(105, 1, '2025-12-30 11:38:31', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(106, 1, '2025-12-30 11:39:26', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(107, 1, '2025-12-30 11:39:36', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(108, 1, '2025-12-30 11:40:16', 'file_upload', '', 'Filesystem: assets/images/'),
(109, 1, '2025-12-30 11:43:35', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(110, 1, '2025-12-30 11:46:22', 'file_update', '', 'Filesystem: assets/css/style.css'),
(111, 1, '2025-12-30 11:46:32', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(112, 1, '2025-12-30 12:00:13', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(113, 1, '2025-12-30 12:00:14', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(114, 1, '2025-12-30 12:00:38', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(115, 1, '2025-12-30 12:00:38', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(116, 1, '2025-12-30 12:02:18', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(117, 1, '2025-12-30 12:03:18', 'file_update', '', 'Filesystem: assets/js/whatsapp-widget.js'),
(118, 1, '2025-12-30 12:04:07', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(119, 1, '2025-12-30 12:04:07', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(120, 1, '2025-12-30 12:07:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(121, 1, '2025-12-30 12:09:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(122, 1, '2025-12-30 12:10:17', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(123, 1, '2025-12-30 12:10:59', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(124, 1, '2025-12-30 12:11:29', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(125, 1, '2025-12-30 12:14:58', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(126, 1, '2025-12-30 12:14:59', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(127, 1, '2025-12-30 12:15:56', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(128, 1, '2025-12-30 12:15:56', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(129, 1, '2025-12-30 12:18:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(130, 1, '2025-12-30 12:23:45', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(131, 1, '2025-12-30 12:23:45', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(132, 1, '2025-12-30 12:24:10', 'file_update', '', 'Filesystem: assets/css/style.css'),
(133, 1, '2025-12-30 12:27:34', 'file_upload', '', 'Filesystem: assets/images/home-hero/'),
(134, 1, '2025-12-30 12:27:35', 'file_upload', '', 'Filesystem: assets/images/home-hero/'),
(135, 1, '2025-12-30 12:27:35', 'file_upload', '', 'Filesystem: assets/images/home-hero/'),
(136, 1, '2025-12-30 12:27:40', 'file_remove', '', 'Filesystem: assets/images/home-hero/img-1.jpg'),
(137, 1, '2025-12-30 12:27:43', 'file_remove', '', 'Filesystem: assets/images/home-hero/img-2.jpg'),
(138, 1, '2025-12-30 12:27:47', 'file_remove', '', 'Filesystem: assets/images/home-hero/img-3.jpg'),
(139, 1, '2025-12-30 12:28:03', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(140, 1, '2025-12-30 12:30:17', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(141, 1, '2025-12-30 12:30:17', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(142, 1, '2025-12-30 12:31:36', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(143, 1, '2025-12-30 12:31:36', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(144, 1, '2025-12-30 12:32:29', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(145, 1, '2025-12-30 12:32:29', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(146, 1, '2025-12-30 15:57:49', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(147, 1, '2025-12-30 15:58:26', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(148, 1, '2025-12-30 16:02:29', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(149, 1, '2025-12-30 16:06:24', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(150, 1, '2025-12-31 03:52:38', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(151, 1, '2025-12-31 03:53:28', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(152, 1, '2025-12-31 03:53:55', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(153, 1, '2025-12-31 03:55:36', 'file_upload', '', 'Filesystem: assets/images/'),
(154, 1, '2025-12-31 03:55:54', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(155, 1, '2025-12-31 03:55:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(156, 1, '2025-12-31 03:56:40', 'file_remove', '', 'Filesystem: assets/images/logo-header.png'),
(157, 1, '2025-12-31 03:56:48', 'file_upload', '', 'Filesystem: assets/images/'),
(158, 1, '2025-12-31 04:05:57', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(159, 1, '2025-12-31 04:05:58', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(160, 1, '2025-12-31 04:07:47', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(161, 1, '2025-12-31 04:07:48', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(162, 1, '2025-12-31 04:08:44', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(163, 1, '2025-12-31 04:08:46', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(164, 1, '2025-12-31 04:09:11', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(165, 1, '2025-12-31 04:09:11', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(166, 1, '2025-12-31 04:24:45', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(167, 1, '2025-12-31 04:24:45', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(168, 1, '2026-01-05 11:24:52', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(169, 1, '2026-01-06 03:55:58', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(170, 1, '2026-01-06 04:02:04', 'file_update', '', 'Filesystem: assets/css/style.css'),
(171, 1, '2026-01-06 04:10:23', 'file_upload', '', 'Filesystem: assets/images/services/'),
(172, 1, '2026-01-06 04:10:24', 'file_upload', '', 'Filesystem: assets/images/services/'),
(173, 1, '2026-01-06 04:10:25', 'file_upload', '', 'Filesystem: assets/images/services/'),
(174, 1, '2026-01-06 04:10:26', 'file_upload', '', 'Filesystem: assets/images/services/'),
(175, 1, '2026-01-06 04:10:27', 'file_upload', '', 'Filesystem: assets/images/services/'),
(176, 1, '2026-01-06 04:11:32', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(177, 1, '2026-01-06 04:11:52', 'file_remove', '', 'Filesystem: assets/images/services/airport-parking-area.jpg'),
(178, 1, '2026-01-06 04:11:56', 'file_remove', '', 'Filesystem: assets/images/services/Airport-Taxi-Service.jpg'),
(179, 1, '2026-01-06 04:12:00', 'file_remove', '', 'Filesystem: assets/images/services/Car-Rental-Services.jpg'),
(180, 1, '2026-01-06 04:12:04', 'file_remove', '', 'Filesystem: assets/images/services/hotel-booking-service.jpg'),
(181, 1, '2026-01-06 04:12:08', 'file_remove', '', 'Filesystem: assets/images/services/sri-lanka-tours.jpg'),
(182, 1, '2026-01-06 04:13:32', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(183, 1, '2026-01-06 04:14:51', 'file_upload', '', 'Filesystem: assets/images/'),
(184, 1, '2026-01-06 04:14:57', 'file_remove', '', 'Filesystem: assets/images/booking-tips.png'),
(185, 1, '2026-01-06 04:15:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(186, 1, '2026-01-06 04:18:44', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(187, 1, '2026-01-06 04:18:45', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(188, 1, '2026-01-06 04:18:45', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(189, 1, '2026-01-06 04:18:46', 'file_upload', '', 'Filesystem: assets/images/why-choose-us/'),
(190, 1, '2026-01-08 04:03:56', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(191, 1, '2026-01-08 04:07:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(192, 1, '2026-01-08 04:08:32', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(193, 1, '2026-01-08 04:10:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(194, 1, '2026-01-08 04:11:17', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(195, 1, '2026-01-08 04:13:00', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(196, 1, '2026-01-08 04:13:49', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(197, 1, '2026-01-08 04:21:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(198, 1, '2026-01-15 16:35:47', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(199, 1, '2026-01-15 16:36:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(200, 1, '2026-01-16 04:02:02', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(201, 1, '2026-01-16 08:27:47', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(202, 1, '2026-01-16 08:28:43', 'file_update', '', 'Filesystem: assets/css/style.css'),
(203, 1, '2026-01-16 08:35:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(204, 1, '2026-01-16 09:12:22', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(205, 1, '2026-01-16 09:12:22', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(206, 1, '2026-01-16 09:12:35', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(207, 1, '2026-01-16 09:12:37', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(208, 1, '2026-01-16 09:13:11', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(209, 1, '2026-01-16 09:13:11', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(210, 1, '2026-01-16 12:07:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(211, 1, '2026-01-16 12:13:06', 'directory_create', '', 'Filesystem: /uploads'),
(212, 1, '2026-01-27 09:41:19', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(213, 1, '2026-01-27 09:46:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(214, 1, '2026-01-27 09:46:53', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(215, 1, '2026-01-27 09:48:45', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(216, 1, '2026-01-27 09:50:14', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(217, 1, '2026-01-27 09:51:47', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(218, 1, '2026-01-27 09:52:30', 'file_update', '', 'Filesystem: assets/css/style.css'),
(219, 1, '2026-01-27 09:54:25', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(220, 1, '2026-01-27 09:54:59', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(221, 1, '2026-01-27 09:55:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(222, 1, '2026-01-27 09:57:06', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(223, 1, '2026-01-27 09:57:33', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(224, 1, '2026-01-27 09:58:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(225, 1, '2026-01-27 10:05:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(226, 1, '2026-01-27 10:06:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(227, 1, '2026-01-27 10:09:34', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(228, 1, '2026-01-27 10:09:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(229, 1, '2026-01-27 10:10:39', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(230, 1, '2026-01-27 10:13:24', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(231, 1, '2026-01-27 10:18:11', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(232, 1, '2026-01-27 10:19:45', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(233, 1, '2026-01-27 10:22:13', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(234, 1, '2026-01-27 10:24:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(235, 1, '2026-01-27 10:27:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(236, 1, '2026-01-27 10:27:55', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(237, 1, '2026-01-27 10:30:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(238, 1, '2026-01-27 10:30:48', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(239, 1, '2026-01-27 10:31:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(240, 1, '2026-01-27 10:32:52', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(241, 1, '2026-01-27 10:32:52', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(242, 1, '2026-01-27 10:33:18', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(243, 1, '2026-01-27 10:34:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(244, 1, '2026-02-02 04:26:37', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(245, 1, '2026-02-02 04:58:07', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(246, 1, '2026-02-02 04:58:07', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(247, 1, '2026-02-02 04:59:57', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(248, 1, '2026-02-02 04:59:59', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(249, 1, '2026-02-02 06:17:54', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(250, 1, '2026-02-02 06:17:55', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(251, 1, '2026-02-02 06:43:33', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(252, 1, '2026-02-02 06:43:33', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(253, 1, '2026-02-02 07:09:30', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(254, 1, '2026-02-02 07:09:31', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(255, 1, '2026-02-02 07:20:29', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(256, 1, '2026-02-02 07:20:29', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(257, 1, '2026-02-02 23:04:32', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(258, 1, '2026-02-02 23:05:14', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(259, 1, '2026-02-02 23:05:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(260, 1, '2026-02-03 00:41:19', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(261, 1, '2026-02-03 00:41:30', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(262, 1, '2026-02-03 00:42:08', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(263, 1, '2026-02-03 00:43:20', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(264, 1, '2026-02-03 00:44:09', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(265, 1, '2026-02-03 00:45:56', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(266, 1, '2026-02-03 00:46:40', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(267, 1, '2026-02-03 00:47:54', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(268, 1, '2026-02-03 00:48:25', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(269, 1, '2026-02-03 04:01:02', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(270, 1, '2026-02-03 04:02:30', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(271, 1, '2026-02-03 04:06:11', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(272, 1, '2026-02-03 04:07:05', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(273, 1, '2026-02-03 04:07:06', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(274, 1, '2026-02-03 05:34:45', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(275, 1, '2026-02-03 05:54:44', 'setting_update', 'MODX\\Revolution\\modSystemSetting', 'friendly_urls'),
(276, 1, '2026-02-03 05:55:21', 'setting_update', 'MODX\\Revolution\\modSystemSetting', 'friendly_urls'),
(277, 1, '2026-02-13 09:04:08', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(278, 1, '2026-02-13 09:09:39', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(279, 1, '2026-02-13 09:11:33', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(280, 1, '2026-02-13 09:12:16', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(281, 1, '2026-02-13 09:19:36', 'file_update', '', 'Filesystem: assets/css/style.css'),
(282, 1, '2026-02-13 09:20:25', 'file_update', '', 'Filesystem: assets/css/style.css'),
(283, 1, '2026-02-13 09:22:32', 'file_update', '', 'Filesystem: assets/css/style.css'),
(284, 1, '2026-02-13 09:24:20', 'file_update', '', 'Filesystem: assets/css/style.css'),
(285, 1, '2026-02-13 09:25:19', 'file_update', '', 'Filesystem: assets/css/style.css'),
(286, 1, '2026-02-13 09:27:25', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(287, 1, '2026-02-13 09:34:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(288, 1, '2026-02-13 09:36:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(289, 1, '2026-02-13 09:38:01', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(290, 1, '2026-02-13 09:39:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(291, 1, '2026-02-13 09:41:49', 'file_update', '', 'Filesystem: assets/css/style.css'),
(292, 1, '2026-02-13 09:42:58', 'file_update', '', 'Filesystem: assets/css/style.css'),
(293, 1, '2026-02-13 09:43:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(294, 1, '2026-02-13 10:21:01', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(295, 1, '2026-02-13 10:22:32', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(296, 1, '2026-02-13 10:35:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(297, 1, '2026-02-13 10:35:36', 'file_update', '', 'Filesystem: assets/css/style.css'),
(298, 1, '2026-02-13 10:36:34', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(299, 1, '2026-02-13 10:38:12', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(300, 1, '2026-02-13 10:38:24', 'file_update', '', 'Filesystem: assets/css/style.css'),
(301, 1, '2026-02-13 10:39:27', 'file_update', '', 'Filesystem: assets/css/style.css'),
(302, 1, '2026-02-13 10:40:32', 'file_update', '', 'Filesystem: assets/css/style.css'),
(303, 1, '2026-02-13 10:42:53', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(304, 1, '2026-02-13 10:43:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(305, 1, '2026-02-13 10:44:30', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(306, 1, '2026-02-13 10:45:18', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(307, 1, '2026-02-13 10:46:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(308, 1, '2026-02-13 10:47:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(309, 1, '2026-02-13 10:48:50', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(310, 1, '2026-02-13 10:49:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(311, 1, '2026-02-13 10:50:27', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(312, 1, '2026-02-13 10:50:44', 'file_update', '', 'Filesystem: assets/css/style.css'),
(313, 1, '2026-02-13 10:51:47', 'file_update', '', 'Filesystem: assets/css/style.css'),
(314, 1, '2026-02-13 10:52:48', 'file_update', '', 'Filesystem: assets/css/style.css'),
(315, 1, '2026-02-13 10:53:13', 'file_update', '', 'Filesystem: assets/css/style.css'),
(316, 1, '2026-02-13 10:53:20', 'file_update', '', 'Filesystem: assets/css/style.css'),
(317, 1, '2026-02-13 10:55:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(318, 1, '2026-02-13 11:34:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(319, 1, '2026-02-13 11:35:47', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(320, 1, '2026-02-13 11:38:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(321, 1, '2026-02-13 11:39:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(322, 1, '2026-02-15 12:44:43', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(323, 1, '2026-02-15 12:47:21', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(324, 1, '2026-02-15 12:48:25', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(325, 1, '2026-02-16 10:01:16', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(326, 1, '2026-02-16 10:06:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(327, 1, '2026-02-16 10:24:01', 'directory_remove', '', 'Filesystem: uploads/'),
(328, 1, '2026-02-16 10:30:22', 'directory_create', '', 'Filesystem: /uploads'),
(329, 1, '2026-02-17 16:04:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(330, 1, '2026-02-17 16:05:13', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(331, 1, '2026-02-19 11:50:17', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(332, 1, '2026-03-03 07:07:29', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(333, 1, '2026-03-09 11:59:38', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(334, 1, '2026-03-09 12:00:53', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(335, 1, '2026-03-09 12:00:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(336, 1, '2026-03-09 12:03:34', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(337, 1, '2026-03-09 12:03:35', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(338, 1, '2026-03-25 04:39:23', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(339, 1, '2026-03-25 04:40:40', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(340, 1, '2026-03-25 04:55:45', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(341, 1, '2026-03-25 04:56:25', 'file_update', '', 'Filesystem: assets/css/style.css'),
(342, 1, '2026-03-25 04:57:31', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(343, 1, '2026-03-25 04:59:57', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(344, 1, '2026-03-25 05:00:59', 'file_update', '', 'Filesystem: assets/css/style.css'),
(345, 1, '2026-03-25 05:01:26', 'file_update', '', 'Filesystem: assets/css/style.css'),
(346, 1, '2026-03-25 05:02:08', 'file_update', '', 'Filesystem: assets/css/style.css'),
(347, 1, '2026-03-25 05:06:04', 'file_update', '', 'Filesystem: assets/css/style.css'),
(348, 1, '2026-03-25 05:06:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(349, 1, '2026-03-25 05:07:13', 'file_update', '', 'Filesystem: assets/css/style.css'),
(350, 1, '2026-03-25 05:07:35', 'file_update', '', 'Filesystem: assets/css/style.css'),
(351, 1, '2026-03-25 05:10:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(352, 1, '2026-03-25 05:11:28', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(353, 1, '2026-03-25 05:12:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(354, 1, '2026-03-25 05:12:37', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(355, 1, '2026-03-25 05:14:15', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(356, 1, '2026-03-25 05:14:46', 'file_update', '', 'Filesystem: assets/css/style.css'),
(357, 1, '2026-03-25 05:16:40', 'file_update', '', 'Filesystem: assets/css/style.css'),
(358, 1, '2026-03-25 05:16:45', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(359, 1, '2026-03-25 05:17:39', 'file_update', '', 'Filesystem: assets/css/style.css'),
(360, 1, '2026-03-25 05:24:58', 'file_update', '', 'Filesystem: assets/css/style.css'),
(361, 1, '2026-03-25 06:29:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(362, 1, '2026-03-25 06:30:25', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(363, 1, '2026-03-25 06:31:09', 'file_update', '', 'Filesystem: assets/css/style.css'),
(364, 1, '2026-03-25 06:32:21', 'file_update', '', 'Filesystem: assets/css/style.css'),
(365, 1, '2026-03-25 06:32:59', 'file_update', '', 'Filesystem: assets/css/style.css'),
(366, 1, '2026-03-25 06:33:18', 'file_update', '', 'Filesystem: assets/css/style.css'),
(367, 1, '2026-03-25 06:36:20', 'file_update', '', 'Filesystem: assets/css/style.css'),
(368, 1, '2026-03-25 06:37:25', 'file_update', '', 'Filesystem: assets/css/style.css'),
(369, 1, '2026-03-25 06:37:47', 'file_update', '', 'Filesystem: assets/css/style.css'),
(370, 1, '2026-03-25 06:38:56', 'file_update', '', 'Filesystem: assets/css/style.css'),
(371, 1, '2026-03-25 06:39:13', 'file_update', '', 'Filesystem: assets/css/style.css'),
(372, 1, '2026-03-25 06:39:50', 'file_update', '', 'Filesystem: assets/css/style.css'),
(373, 1, '2026-03-25 06:41:37', 'file_update', '', 'Filesystem: assets/css/style.css'),
(374, 1, '2026-03-25 06:42:32', 'file_update', '', 'Filesystem: assets/css/style.css'),
(375, 1, '2026-03-25 06:43:28', 'file_update', '', 'Filesystem: assets/css/style.css'),
(376, 1, '2026-03-25 06:44:57', 'file_update', '', 'Filesystem: assets/css/style.css'),
(377, 1, '2026-03-25 06:45:52', 'file_update', '', 'Filesystem: assets/css/style.css'),
(378, 1, '2026-03-25 06:46:02', 'file_update', '', 'Filesystem: assets/css/style.css'),
(379, 1, '2026-03-25 06:47:00', 'file_update', '', 'Filesystem: assets/css/style.css'),
(380, 1, '2026-03-25 06:51:49', 'file_update', '', 'Filesystem: assets/css/style.css'),
(381, 1, '2026-03-25 06:53:20', 'file_update', '', 'Filesystem: assets/css/style.css'),
(382, 1, '2026-03-25 08:55:03', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(383, 1, '2026-03-28 17:06:36', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(384, 1, '2026-03-28 17:08:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(385, 1, '2026-03-28 17:09:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(386, 1, '2026-03-28 17:09:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(387, 1, '2026-04-02 10:40:39', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(388, 1, '2026-04-02 10:42:30', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(389, 1, '2026-04-02 10:46:05', 'file_update', '', 'Filesystem: assets/css/style.css'),
(390, 1, '2026-04-02 10:47:17', 'file_update', '', 'Filesystem: assets/css/style.css'),
(391, 1, '2026-04-02 10:48:24', 'file_update', '', 'Filesystem: assets/css/style.css'),
(392, 1, '2026-04-02 10:49:13', 'file_update', '', 'Filesystem: assets/css/style.css'),
(393, 1, '2026-04-02 10:51:48', 'file_update', '', 'Filesystem: assets/css/style.css');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_media_sources`
--

CREATE TABLE `modxwl_media_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\Sources\\modFileMediaSource',
  `properties` mediumtext DEFAULT NULL,
  `is_stream` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_media_sources`
--

INSERT INTO `modxwl_media_sources` (`id`, `name`, `description`, `class_key`, `properties`, `is_stream`) VALUES
(1, 'Filesystem', '', 'MODX\\Revolution\\Sources\\modFileMediaSource', 'a:0:{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_media_sources_contexts`
--

CREATE TABLE `modxwl_media_sources_contexts` (
  `source` int(11) NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_media_sources_elements`
--

CREATE TABLE `modxwl_media_sources_elements` (
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `object_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modTemplateVar',
  `object` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_membergroup_names`
--

CREATE TABLE `modxwl_membergroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_membergroup_names`
--

INSERT INTO `modxwl_membergroup_names` (`id`, `name`, `description`, `parent`, `rank`, `dashboard`) VALUES
(1, 'Administrator', NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_member_groups`
--

CREATE TABLE `modxwl_member_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_member_groups`
--

INSERT INTO `modxwl_member_groups` (`id`, `user_group`, `member`, `role`, `rank`) VALUES
(1, 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_menus`
--

CREATE TABLE `modxwl_menus` (
  `text` varchar(191) NOT NULL DEFAULT '',
  `parent` varchar(191) NOT NULL DEFAULT '',
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `menuindex` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `handler` text NOT NULL,
  `permissions` text NOT NULL,
  `namespace` varchar(100) NOT NULL DEFAULT 'core'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_menus`
--

INSERT INTO `modxwl_menus` (`text`, `parent`, `action`, `description`, `icon`, `menuindex`, `params`, `handler`, `permissions`, `namespace`) VALUES
('about', 'usernav', 'help', 'about_desc', '<i class=\"icon-question-circle icon\"></i>', 3, '', '', 'help', 'core'),
('access', 'usernav', '', '', '<i class=\"icon-user-lock icon\"></i>', 1, '', '', 'access_permissions', 'core'),
('acls', 'access', 'security/permission', 'acls_desc', '', 2, '', '', 'access_permissions', 'core'),
('admin', 'usernav', '', '', '<i class=\"icon-gear icon\"></i>', 2, '', '', 'settings', 'core'),
('components', 'topnav', '', '', '<i class=\"icon-cube icon\"></i>', 2, '', '', 'components', 'core'),
('content_types', 'site', 'system/contenttype', 'content_types_desc', '', 4, '', '', 'content_types', 'core'),
('contexts', 'admin', 'context', 'contexts_desc', '', 4, '', '', 'view_context', 'core'),
('dashboards', 'admin', 'system/dashboards', 'dashboards_desc', '', 5, '', '', 'dashboards', 'core'),
('edit_menu', 'admin', 'system/action', 'edit_menu_desc', '', 3, '', '', 'actions', 'core'),
('eventlog_viewer', 'reports', 'system/event', 'eventlog_viewer_desc', '', 1, '', '', 'view_eventlog', 'core'),
('file_browser', 'media', 'media/browser', 'file_browser_desc', '', 0, '', '', 'file_manager', 'core'),
('flush_access', 'access', '', 'flush_access_desc', '', 3, '', 'MODx.msg.confirm({\n                            title: _(\'flush_access\')\n                            ,text: _(\'flush_access_confirm\')\n                            ,url: MODx.config.connector_url\n                            ,params: {\n                                action: \'security/access/flush\'\n                            }\n                            ,listeners: {\n                                \'success\': {fn:function() { location.href = \'./\'; },scope:this},\n                                \'failure\': {fn:function(response) { Ext.MessageBox.alert(\'failure\', response.responseText); },scope:this},\n                            }\n                        });', 'access_permissions', 'core'),
('flush_sessions', 'access', '', 'flush_sessions_desc', '', 4, '', 'MODx.msg.confirm({\n                            title: _(\'flush_sessions\')\n                            ,text: _(\'flush_sessions_confirm\')\n                            ,url: MODx.config.connector_url\n                            ,params: {\n                                action: \'security/flush\'\n                            }\n                            ,listeners: {\n                                \'success\': {fn:function() { location.href = \'./\'; },scope:this}\n                            }\n                        });', 'flush_sessions', 'core'),
('form_customization', 'admin', 'security/forms', 'form_customization_desc', '', 1, '', '', 'customize_forms', 'core'),
('installer', 'components', 'workspaces', 'installer_desc', '', 0, '', '', 'packages', 'core'),
('language', 'admin', '', 'language_desc', '', 8, '', '', 'language', 'core'),
('lexicon_management', 'admin', 'workspaces/lexicon', 'lexicon_management_desc', '', 7, '', '', 'lexicons', 'core'),
('logout', 'user', 'security/logout', 'logout_desc', '', 2, '', 'MODx.logout(); return false;', 'logout', 'core'),
('media', 'topnav', '', '', '<i class=\"icon-file-image-o icon\"></i>', 1, '', '', 'file_manager', 'core'),
('messages', 'user', 'security/message', 'messages_desc', '', 1, '', '', 'messages', 'core'),
('namespaces', 'admin', 'workspaces/namespace', 'namespaces_desc', '', 6, '', '', 'namespaces', 'core'),
('new_resource', 'site', 'resource/create', 'new_resource_desc', '', 0, '', '', 'new_document', 'core'),
('propertysets', 'admin', 'element/propertyset', 'propertysets_desc', '', 2, '', '', 'property_sets', 'core'),
('refreshuris', 'refresh_site', '', 'refreshuris_desc', '', 0, '', 'MODx.refreshURIs(); return false;', 'empty_cache', 'core'),
('refresh_site', 'site', '', 'refresh_site_desc', '', 1, '', 'MODx.clearCache(); return false;', 'empty_cache', 'core'),
('remove_locks', 'site', '', 'remove_locks_desc', '', 2, '', 'MODx.removeLocks();return false;', 'remove_locks', 'core'),
('reports', 'admin', '', 'reports_desc', '', 9, '', '', 'menu_reports', 'core'),
('resource_groups', 'access', 'security/resourcegroup', 'resource_groups_desc', '', 1, '', '', 'access_permissions', 'core'),
('site', 'topnav', '', '', '<i class=\"icon-file-text-o icon\"></i>', 0, '', '', 'menu_site', 'core'),
('site_schedule', 'site', 'resource/site_schedule', 'site_schedule_desc', '', 3, '', '', 'view_document', 'core'),
('sources', 'media', 'source', 'sources_desc', '', 1, '', '', 'sources', 'core'),
('system_settings', 'admin', 'system/settings', 'system_settings_desc', '', 0, '', '', 'settings', 'core'),
('topnav', '', '', 'topnav_desc', '', 0, '', '', '', 'core'),
('trash', 'site', 'resource/trash', 'trash_desc', '', 5, '', '', 'menu_trash', 'core'),
('user', 'usernav', '', '', '<span id=\"user-avatar\" title=\"{$username}\">{$userImage}</span> <span id=\"user-username\">{$username}</span>', 0, '', '', 'menu_user', 'core'),
('usernav', '', '', 'usernav_desc', '', 1, '', '', '', 'core'),
('users', 'access', 'security/user', 'user_management_desc', '', 0, '', '', 'view_user', 'core'),
('view_logging', 'reports', 'system/logs', 'view_logging_desc', '', 0, '', '', 'mgr_log_view', 'core'),
('view_sysinfo', 'reports', 'system/info', 'view_sysinfo_desc', '', 2, '', '', 'view_sysinfo', 'core'),
('{$username}', 'user', 'security/profile', 'profile_desc', '', 0, '', '', 'change_profile', 'core');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_namespaces`
--

CREATE TABLE `modxwl_namespaces` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `path` text DEFAULT NULL,
  `assets_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_namespaces`
--

INSERT INTO `modxwl_namespaces` (`name`, `path`, `assets_path`) VALUES
('core', '{core_path}', '{assets_path}');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_property_set`
--

CREATE TABLE `modxwl_property_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `properties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_register_messages`
--

CREATE TABLE `modxwl_register_messages` (
  `topic` int(10) UNSIGNED NOT NULL,
  `id` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `valid` datetime NOT NULL,
  `accessed` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `accesses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `payload` mediumtext NOT NULL,
  `kill` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_register_queues`
--

CREATE TABLE `modxwl_register_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_register_queues`
--

INSERT INTO `modxwl_register_queues` (`id`, `name`, `options`) VALUES
(1, 'locks', 'a:1:{s:9:\"directory\";s:5:\"locks\";}'),
(2, 'resource_reload', 'a:1:{s:9:\"directory\";s:15:\"resource_reload\";}');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_register_topics`
--

CREATE TABLE `modxwl_register_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `options` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_register_topics`
--

INSERT INTO `modxwl_register_topics` (`id`, `queue`, `name`, `created`, `updated`, `options`) VALUES
(1, 1, '/resource/', '2025-12-28 16:53:21', NULL, NULL),
(2, 2, '/resourcereload/', '2025-12-29 05:32:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_session`
--

CREATE TABLE `modxwl_session` (
  `id` varchar(191) NOT NULL DEFAULT '',
  `access` int(10) UNSIGNED NOT NULL,
  `data` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_session`
--

INSERT INTO `modxwl_session` (`id`, `access`, `data`) VALUES
('014fk1ke7jsi8ie6bfkv6cnrme', 1775373284, 'modx.user.contextTokens|a:0:{}'),
('014lk9ll0d0eind7odp9f4bglk', 1775229991, 'modx.user.contextTokens|a:0:{}'),
('02cg0id9d2v1uil37jta4ggbom', 1775901430, 'modx.user.contextTokens|a:0:{}'),
('03hd0tvb7g6cv05767icdpjsbo', 1775143515, 'modx.user.contextTokens|a:0:{}'),
('0508lqetdpv3arhdi12e1l29t0', 1775414719, 'modx.user.contextTokens|a:0:{}'),
('056v4c7opifal9d8gfolhb17cp', 1776095385, 'modx.user.contextTokens|a:0:{}'),
('095uo4iurfbc6fgel8bria6hbl', 1776128595, 'modx.user.contextTokens|a:0:{}'),
('09bp0mbbnon90gpna0snqeiqja', 1776293826, 'modx.user.contextTokens|a:0:{}'),
('09dj5bthlvpq8gaac3ppbepv16', 1775595656, 'modx.user.contextTokens|a:0:{}'),
('09nahpkq2smkccrmvg73qrnui5', 1775643929, 'modx.user.contextTokens|a:0:{}'),
('09s2q0p1or4krsuor58t5kge7k', 1776338369, 'modx.user.contextTokens|a:0:{}'),
('0a0tonk4c51d3967sqd3t1psfe', 1776392070, 'modx.user.contextTokens|a:0:{}'),
('0ak2ur14atmu5js2j9ko55kpfl', 1775651288, 'modx.user.contextTokens|a:0:{}'),
('0b3anqo5s4bvmdn861kojpsr5s', 1776250189, 'modx.user.contextTokens|a:0:{}'),
('0cppdvm68l4clumndimgcirmse', 1775334646, 'modx.user.contextTokens|a:0:{}'),
('0cs4n81g9s2otliqltuipq88nh', 1775655915, 'modx.user.contextTokens|a:0:{}'),
('0dffc478pod419frqk1b6ddol4', 1775684869, 'modx.user.contextTokens|a:0:{}'),
('0fiq6p08m1k2u7ce7kh43m6rig', 1775341103, 'modx.user.contextTokens|a:0:{}'),
('0gipv2bjbkdcumjbn447h0v1ht', 1775666861, 'modx.user.contextTokens|a:0:{}'),
('0h5ca5chf478db68e5o5qr1ilj', 1775922996, 'modx.user.contextTokens|a:0:{}'),
('0hec27dqtmu4061smevmjjjifb', 1776250353, 'modx.user.contextTokens|a:0:{}'),
('0iauk0s9gv21j0h72rdachnh6k', 1775342414, 'modx.user.contextTokens|a:0:{}'),
('0ib3eh9fe1obtno7v0dlbcl1sn', 1776325390, 'modx.user.contextTokens|a:0:{}'),
('0j0i7jmgko8bhjphpuni27672d', 1775554125, 'modx.user.contextTokens|a:0:{}'),
('0kge20af1ilf76o5q5m8j97ad3', 1775300169, 'modx.user.contextTokens|a:0:{}'),
('0lf0vokeq81k90k0la4eoo4v94', 1775414637, 'modx.user.contextTokens|a:0:{}'),
('0n4dplenhd3ptoqqcpogbahblm', 1775232687, 'modx.user.contextTokens|a:0:{}'),
('0pa3f1mluutsotk66bqre15ul2', 1775999335, 'modx.user.contextTokens|a:0:{}'),
('0pclfc2cl71pcd94i2sm7badss', 1776288863, 'modx.user.contextTokens|a:0:{}'),
('0pm7dd3k8kvm5aual1l0c17sui', 1775743574, 'modx.user.contextTokens|a:0:{}'),
('0q544qna1b5urcp0amkb49aspi', 1775347236, 'modx.user.contextTokens|a:0:{}'),
('0qgdn5b4pqjnsbcplg3a8em44r', 1775477549, 'modx.user.contextTokens|a:0:{}'),
('0r8qirgf50p2p23varrd39rf6o', 1775185226, 'modx.user.contextTokens|a:0:{}'),
('0rkkd5pn0dl0u8h6e6429i5kps', 1776051130, 'modx.user.contextTokens|a:0:{}'),
('0snmlceg1b7452p6gj4etiscv3', 1775975566, 'modx.user.contextTokens|a:0:{}'),
('0vf7ktmtstou2tnjvrd0av0jdn', 1775372343, 'modx.user.contextTokens|a:0:{}'),
('10bvrit2hgera6qv5hteq60o49', 1775874924, 'modx.user.contextTokens|a:0:{}'),
('112ohaf71b3kgoqlt53ppebear', 1775491506, 'modx.user.contextTokens|a:0:{}'),
('11k0b9mn4upuu6a1sgc447r1he', 1775614424, 'modx.user.contextTokens|a:0:{}'),
('11o7ehkbdigo15ak3l14map2la', 1775906301, 'modx.user.contextTokens|a:0:{}'),
('12av4hg8v800hqqv0h0rmpn4un', 1775725919, 'modx.user.contextTokens|a:0:{}'),
('12bo9qtfitbmvpr2ushmkvhgj1', 1776331391, 'modx.user.contextTokens|a:0:{}'),
('13027kc4os5iamv3ghcolgs278', 1776395777, 'modx.user.contextTokens|a:0:{}'),
('13bap1mp88i7gss1ekg93o30uu', 1775452019, 'modx.user.contextTokens|a:0:{}'),
('13r7uig86eoc8b9h95a8efjcmp', 1775551923, 'modx.user.contextTokens|a:0:{}'),
('189fe1atrahvsdodcqmhtq02pk', 1776322698, 'modx.user.contextTokens|a:0:{}'),
('18e0kjr5vvepq2v3hb0sfnt17l', 1776182556, 'modx.user.contextTokens|a:0:{}'),
('19960k96duudjrpnvpv7pe07ae', 1776008949, 'modx.user.contextTokens|a:0:{}'),
('19octhdv5e55pl2nl8s7kn8pnv', 1775316295, 'modx.user.contextTokens|a:0:{}'),
('1b6o0f8cs86tm78fsu6ivl6ap7', 1775922276, 'modx.user.contextTokens|a:0:{}'),
('1c9r2947b2com1cm3ugtrie88a', 1775651287, 'modx.user.contextTokens|a:0:{}'),
('1f3f8rgs9rolnaiatlg7rot4tt', 1775773686, 'modx.user.contextTokens|a:0:{}'),
('1ggbpdd3tljcn3fq6jkvtands0', 1775488673, 'modx.user.contextTokens|a:0:{}'),
('1j40m99822ou2le4jtslvlgma7', 1775829735, 'modx.user.contextTokens|a:0:{}'),
('1jan1brakk9j4rjsr83pajukqn', 1775132972, 'modx.user.contextTokens|a:0:{}'),
('1k2bp427i1oliimg84u8g7d3ka', 1775733343, 'modx.user.contextTokens|a:0:{}'),
('1l2bo38corvinmmbnqp3n15kti', 1776251072, 'modx.user.contextTokens|a:0:{}'),
('1mcedna3klqebeb97li264ibdq', 1775133728, 'modx.user.contextTokens|a:0:{}'),
('1mkpg6pudsisli43l5t9qqn56u', 1775368613, 'modx.user.contextTokens|a:0:{}'),
('1mu38q082i70gd4nmehvdqqn5n', 1775617413, 'modx.user.contextTokens|a:0:{}'),
('1mva9l8e8jtf0c03d4sofdg3ed', 1775731044, 'modx.user.contextTokens|a:0:{}'),
('1n11e5uqhrm4tjer9qo89chk97', 1775357284, 'modx.user.contextTokens|a:0:{}'),
('1n37m55e2a6ur7r7ci3bhntr5e', 1775467881, 'modx.user.contextTokens|a:0:{}'),
('1o361fldf4ugdpqqjfhnqirfgj', 1776101721, 'modx.user.contextTokens|a:0:{}'),
('1q22srkelrj4obn358ltps27nu', 1775804209, 'modx.user.contextTokens|a:0:{}'),
('1q4tbddcd1h9egh68s74p0a878', 1776325390, 'modx.user.contextTokens|a:0:{}'),
('1r7sf4qdgh0tvoj8rsj47apbpn', 1776198452, 'modx.user.contextTokens|a:0:{}'),
('1rq9r6893f60deiklaa1et3f06', 1775541383, 'modx.user.contextTokens|a:0:{}'),
('1sevutjldn159db5bnimudav05', 1775495739, 'modx.user.contextTokens|a:0:{}'),
('2077n22jhhgiivirjagdf0r1m8', 1776088320, 'modx.user.contextTokens|a:0:{}'),
('21iues99jmv2ff49kukdp2ohjl', 1776017583, 'modx.user.contextTokens|a:0:{}'),
('21msdmn0rj947211kuvu8b3kol', 1775548539, 'modx.user.contextTokens|a:0:{}'),
('21o0m24ud839vn69v2pl9pqk91', 1775743751, 'modx.user.contextTokens|a:0:{}'),
('24gldn2flh8qvie14iqb0mijjh', 1775410545, 'modx.user.contextTokens|a:0:{}'),
('24qvm69n9aba4sh90264m19pth', 1775306072, 'modx.user.contextTokens|a:0:{}'),
('24us4f5be3410tsrtp96o06tm2', 1775426589, 'modx.user.contextTokens|a:0:{}'),
('2805l2ti0q52igcpmuignf832v', 1775232842, 'modx.user.contextTokens|a:0:{}'),
('28n1bvjlisivfdbv5polg88s13', 1776017581, 'modx.user.contextTokens|a:0:{}'),
('2abjsuv8hguab4t24vl9q1khjc', 1776224941, 'modx.user.contextTokens|a:0:{}'),
('2aubocci7pnv9rml6v2skmfkck', 1775311454, 'modx.user.contextTokens|a:0:{}'),
('2aufhup64pfgfasgn8vkldcctn', 1775649965, 'modx.user.contextTokens|a:0:{}'),
('2bc8di2njbafuqgudnchv1ef13', 1776241873, 'modx.user.contextTokens|a:0:{}'),
('2cevpko5lrbupdsrv73dnq5es8', 1775667932, 'modx.user.contextTokens|a:0:{}'),
('2d949npfo8dcmf44uvh3dprqij', 1775608458, 'modx.user.contextTokens|a:0:{}'),
('2dm03jmr5d5q2dn0ktkg1q3gvj', 1775695030, 'modx.user.contextTokens|a:0:{}'),
('2erhkrdo515kgmk7fokqd3pi96', 1775241226, 'modx.user.contextTokens|a:0:{}'),
('2fb03ikd9jmtmmkmpd50u4vlh8', 1776012711, 'modx.user.contextTokens|a:0:{}'),
('2jn4ddba59p6bbtebm9bu3s8mn', 1776103985, 'modx.user.contextTokens|a:0:{}'),
('2jrl1n0tva2hvcchfh8mkt24tl', 1776210795, 'modx.user.contextTokens|a:0:{}'),
('2knm0mof7010b017busmef6phc', 1775875540, 'modx.user.contextTokens|a:0:{}'),
('2lc0kmgrfg1brucmov3uae19jf', 1775366402, 'modx.user.contextTokens|a:0:{}'),
('2lhuvttdpv7jl0v8cg74negfqc', 1775293733, 'modx.user.contextTokens|a:0:{}'),
('2lpkf9cjfm6snmbig9v35cvh29', 1775893919, 'modx.user.contextTokens|a:0:{}'),
('2ncbqpccl8csmvqvabtlbvanv8', 1775441561, 'modx.user.contextTokens|a:0:{}'),
('2njsrl380mbm6nag04mhfkam6j', 1775204141, 'modx.user.contextTokens|a:0:{}'),
('2p0ovlmpiaftl2ka10lf19rbpd', 1775875402, 'modx.user.contextTokens|a:0:{}'),
('2pgubf96hvbfl73hlhjdpm0qb6', 1776180150, 'modx.user.contextTokens|a:0:{}'),
('2pqe4nfvlodf4jq3636aejh3s9', 1775549368, 'modx.user.contextTokens|a:0:{}'),
('2q58ukl8ujtm0hpsd8udfjc066', 1775998052, 'modx.user.contextTokens|a:0:{}'),
('2rcbekdf4n6b3k7fi8u2ghv293', 1775726353, 'modx.user.contextTokens|a:0:{}'),
('2rg3dpfnvvadnbacmsudqeu4tk', 1776393666, 'modx.user.contextTokens|a:0:{}'),
('2sbpcg632s85v0jjfoef3mcbv3', 1775231624, 'modx.user.contextTokens|a:0:{}'),
('2sgtdbi9mnip11mthem4nci2hu', 1775695916, 'modx.user.contextTokens|a:0:{}'),
('2stqc46pegp8vvba2tah9o4bhe', 1775545935, 'modx.user.contextTokens|a:0:{}'),
('2ufesv7rc5ritk50ihkmsjrl2s', 1775270908, 'modx.user.contextTokens|a:0:{}'),
('2v4vj85jpfb99v64kujmdg0egl', 1776048866, 'modx.user.contextTokens|a:0:{}'),
('2vkmn7ep8brf5muv3rrcpo2h6k', 1776224550, 'modx.user.contextTokens|a:0:{}'),
('30adkn7h94aidn7pbt55lb8n67', 1775781642, 'modx.user.contextTokens|a:0:{}'),
('321j04iuf84n241t5ch0c42gup', 1776017573, 'modx.user.contextTokens|a:0:{}'),
('32ssdpj802efo69innn2o3n2r3', 1775202651, 'modx.user.contextTokens|a:0:{}'),
('345mrnu6jkasg1vbdf4rb7k8n3', 1775287876, 'modx.user.contextTokens|a:0:{}'),
('35kl5tn5r10ttqu44trc0hjhtd', 1775704103, 'modx.user.contextTokens|a:0:{}'),
('35r2sv3ck6bhm79iv5pq1o8btn', 1776159417, 'modx.user.contextTokens|a:0:{}'),
('361ks477857cgtrmec87mqid66', 1775231487, 'modx.user.contextTokens|a:0:{}'),
('374brgg8481trettr2mtm0iacl', 1775494521, 'modx.user.contextTokens|a:0:{}'),
('38qeha5qe0j4p13tsijdfsf9j6', 1776152728, 'modx.user.contextTokens|a:0:{}'),
('3apar90s3cjg9ntjjd39lthdii', 1775874924, 'modx.user.contextTokens|a:0:{}'),
('3bcg1cl95g3vg8naek76qu1749', 1775193816, 'modx.user.contextTokens|a:0:{}'),
('3bl26hl6j9uvbcbq5ij9rmcqg7', 1775459763, 'modx.user.contextTokens|a:0:{}'),
('3bn4sctfa6leulv6dk80u3sltg', 1775474248, 'modx.user.contextTokens|a:0:{}'),
('3csv035p6eu8q2ugvna134spfm', 1775509463, 'modx.user.contextTokens|a:0:{}'),
('3elttthgmgrkt2c5kv1tmsm8dh', 1775887760, 'modx.user.contextTokens|a:0:{}'),
('3fcvm1q24brfbcbv690215bcrf', 1775545939, 'modx.user.contextTokens|a:0:{}'),
('3gcn536g1gbfrl07oc3e9mttdo', 1775743663, 'modx.user.contextTokens|a:0:{}'),
('3gu45co02d4bam0bb2cr8q8pvk', 1775910575, 'modx.user.contextTokens|a:0:{}'),
('3guod1e64qdtd8sttkg162dh9c', 1776108102, 'modx.user.contextTokens|a:0:{}'),
('3h5mh59nntvvqh97289tlvi1rn', 1775394218, 'modx.user.contextTokens|a:0:{}'),
('3h97r4dmao2ok7422505uhfbah', 1775967542, 'modx.user.contextTokens|a:0:{}'),
('3k86b079dnsak02mk7jn5b6qbn', 1775662512, 'modx.user.contextTokens|a:0:{}'),
('3kvam20heoe6vn7cv4r8mchh75', 1775167526, 'modx.user.contextTokens|a:0:{}'),
('3l30pikjufi7rb64ka8ia8ka27', 1775628767, 'modx.user.contextTokens|a:0:{}'),
('3m9tqpo0pv8c5eg7epsbalmrp9', 1775684873, 'modx.user.contextTokens|a:0:{}'),
('3mq3tdjraplave1oq5c84b4ue8', 1775782589, 'modx.user.contextTokens|a:0:{}'),
('3mqeq55t9j5lr2c0segruj5jp3', 1776392057, 'modx.user.contextTokens|a:0:{}'),
('3pjb608lfv1o80nne7nrcd4kan', 1776082620, 'modx.user.contextTokens|a:0:{}'),
('3q6cka8t3oegl552pi4bdhlrg5', 1775976080, 'modx.user.contextTokens|a:0:{}'),
('3qd6pfqcfs12csn9u5cj319nof', 1775461072, 'modx.user.contextTokens|a:0:{}'),
('3teha9tiddkkvghfmjvlmo08a4', 1775461743, 'modx.user.contextTokens|a:0:{}'),
('3uaq6oev05aq4o16rs3f0khf26', 1775134933, 'modx.user.contextTokens|a:0:{}'),
('3v8pb9g28ihnk5jdla3millr5d', 1775752521, 'modx.user.contextTokens|a:0:{}'),
('3vi74aujr3ufbtec9s77r9alev', 1775347233, 'modx.user.contextTokens|a:0:{}'),
('3vub811g3dtnif7k8d8je72l54', 1775177364, 'modx.user.contextTokens|a:0:{}'),
('41rt1d4d6d7pdsfqkpoeobn42v', 1775660112, 'modx.user.contextTokens|a:0:{}'),
('42dgqrb0k6lk7e16cu1fl9u3fk', 1775528652, 'modx.user.contextTokens|a:0:{}'),
('455sdbohfm0kt3j9nbcnafivmf', 1775156104, 'modx.user.contextTokens|a:0:{}'),
('45kls4phdl2h4f3kvp5ej5d365', 1776148598, 'modx.user.contextTokens|a:0:{}'),
('45uhmf6n4dvkjti32nssim3rbm', 1775318131, 'modx.user.contextTokens|a:0:{}'),
('46nq4ut7bpsjlmcg42virgdfhr', 1776406828, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('46tbo3j4mpr6fcioihps8eooao', 1775331735, 'modx.user.contextTokens|a:0:{}'),
('47abvrhlob5e0bfju2gdmjc15t', 1776230095, 'modx.user.contextTokens|a:0:{}'),
('4963fjbp04qrtgjvi4e9grkun7', 1776030261, 'modx.user.contextTokens|a:0:{}'),
('4ddlqk1r2orh2t37n0b83ld481', 1776160203, 'modx.user.contextTokens|a:0:{}'),
('4dgedgk1g52vo0npaso5r0tcbh', 1775472969, 'modx.user.contextTokens|a:0:{}'),
('4enjh8jg7i4v4cpb2ob1fpjru5', 1775733356, 'modx.user.contextTokens|a:0:{}'),
('4gebdecstmbnirh1ra156bpop8', 1775705635, 'modx.user.contextTokens|a:0:{}'),
('4i4ubol37sgn16nk0gpbgv03d6', 1775933319, 'modx.user.contextTokens|a:0:{}'),
('4j54cvhji2ok1vdaobm1ne6cd0', 1775812444, 'modx.user.contextTokens|a:0:{}'),
('4j70ahio7ohcl5du94pb4t4e6d', 1776202363, 'modx.user.contextTokens|a:0:{}'),
('4jh68rgslcmgufcabkung7vmei', 1776128900, 'modx.user.contextTokens|a:0:{}'),
('4l8n5mr8q42jr80c35pgqtthog', 1775902824, 'modx.user.contextTokens|a:0:{}'),
('4lt9l88g3hcpvd0556pof31s9m', 1775473474, 'modx.user.contextTokens|a:0:{}'),
('4mi5ab8khhocbl464emm94351a', 1775716740, 'modx.user.contextTokens|a:0:{}'),
('4mp28rjnfqc5h2925kbr80hq6r', 1776300173, 'modx.user.contextTokens|a:0:{}'),
('4nlgaodgihkehd3lgg7tfi2903', 1775155942, 'modx.user.contextTokens|a:0:{}'),
('4o9u58flu9bk6iv75ums04q6os', 1775798180, 'modx.user.contextTokens|a:0:{}'),
('4ofsbof2knfple9bgham2btqh0', 1775870558, 'modx.user.contextTokens|a:0:{}'),
('4q9544r8ct6rbt1ap4ahos5jqi', 1775975566, 'modx.user.contextTokens|a:0:{}'),
('4t3g3l5utl7tmim6ngnv1lt71r', 1775733342, 'modx.user.contextTokens|a:0:{}'),
('4uv3okhai5csrrso815mml3d26', 1776174322, 'modx.user.contextTokens|a:0:{}'),
('4vtbt6h9i6pf4ru2mmmi55eit5', 1776323198, 'modx.user.contextTokens|a:0:{}'),
('50i7pm35i6qbav83m8m070j57j', 1776411629, 'modx.user.contextTokens|a:0:{}'),
('51f27djq6jt2bpd4lmrfeco6a7', 1775391565, 'modx.user.contextTokens|a:0:{}'),
('51mr0ff1ju4hstgtcrsitdobkf', 1775429193, 'modx.user.contextTokens|a:0:{}'),
('529m6m76d542alb83512d91luu', 1775814931, 'modx.user.contextTokens|a:0:{}'),
('52ivahomtkctl4407pm1e601kd', 1775753070, 'modx.user.contextTokens|a:0:{}'),
('52ts9d2rravbtpnie2ukpmjsht', 1775272173, 'modx.user.contextTokens|a:0:{}'),
('540b2el1pvclv2ektbqbtlu2ja', 1775249593, 'modx.user.contextTokens|a:0:{}'),
('543kaftsa6tl241cutmhrnjf17', 1775299681, 'modx.user.contextTokens|a:0:{}'),
('54t07gp75q77iliv5fi34urllu', 1775156729, 'modx.user.contextTokens|a:0:{}'),
('56ladr4ce3kevvapjavc5hn9ci', 1775331009, 'modx.user.contextTokens|a:0:{}'),
('579psasba01it9b3ahg3b2gr95', 1775472845, 'modx.user.contextTokens|a:0:{}'),
('57athsr0fsd2cdp7tmffbvu1cv', 1776176557, 'modx.user.contextTokens|a:0:{}'),
('57kbre8hvun0ctoneslh0dnvit', 1775662467, 'modx.user.contextTokens|a:0:{}'),
('5802bv8ha83s5uirlhk0hfkcj8', 1775570020, 'modx.user.contextTokens|a:0:{}'),
('58usgjo9e7f16l27r1uq15vm74', 1775491174, 'modx.user.contextTokens|a:0:{}'),
('59ohb8e1jvh32q6rmbilsd1ita', 1776370000, 'modx.user.contextTokens|a:0:{}'),
('5ai5mihrq18q48volc6i1s904b', 1775628578, 'modx.user.contextTokens|a:0:{}'),
('5cm78jkr3v5cvft8f9n9utf9kj', 1775908431, 'modx.user.contextTokens|a:0:{}'),
('5cus8u68kgkthu13e8vfseqie7', 1775278840, 'modx.user.contextTokens|a:0:{}'),
('5dls45qk0lolg1aclvst2v6pfl', 1776352159, 'modx.user.contextTokens|a:0:{}'),
('5dq5ri19fbd6e6v951ke2bo9ql', 1775634464, 'modx.user.contextTokens|a:0:{}'),
('5ecqvc8diknjvq05730u7cje0j', 1775542248, 'modx.user.contextTokens|a:0:{}'),
('5edmo0safbi9q5ugnc95touhro', 1775561130, 'modx.user.contextTokens|a:0:{}'),
('5eqvdsef3qtqrc30fbsgsc0dmn', 1775338610, 'modx.user.contextTokens|a:0:{}'),
('5gd2bnn4njq5fnq6n939jesolk', 1775140119, 'modx.user.contextTokens|a:0:{}'),
('5ge26p2m9g5mtcipb03t7l8qle', 1775726353, 'modx.user.contextTokens|a:0:{}'),
('5giq69g3cglcrifnogcr8hnc85', 1776053558, 'modx.user.contextTokens|a:0:{}'),
('5gp18f7q9h533u5229a8d077ic', 1775976566, 'modx.user.contextTokens|a:0:{}'),
('5h7o4t8a0kj43qieiu6co456r2', 1775634479, 'modx.user.contextTokens|a:0:{}'),
('5hj52clisthsbkcr3b2q66srb2', 1775835519, 'modx.user.contextTokens|a:0:{}'),
('5hra7trkt990n0j75dp1qqfhou', 1775356947, 'modx.user.contextTokens|a:0:{}'),
('5mdp23nh0jl4g0mldvmlrcdb0t', 1776136683, 'modx.user.contextTokens|a:0:{}'),
('5njfoga1k8hk5e8tkrh528rl52', 1776268622, 'modx.user.contextTokens|a:0:{}'),
('5o0ngq87j6no2l6dbcl9nrf0ct', 1776362824, 'modx.user.contextTokens|a:0:{}'),
('5o41eno3ac847ma59k30hn2r2m', 1776094660, 'modx.user.contextTokens|a:0:{}'),
('5psmd86cc7tihg9vdfn3hn8g3v', 1775915358, 'modx.user.contextTokens|a:0:{}'),
('5r0g6eq00l2oiks8k1jdk3qncn', 1776261543, 'modx.user.contextTokens|a:0:{}'),
('5sg5q5hgt2cd8du93ahcs3qt68', 1776219762, 'modx.user.contextTokens|a:0:{}'),
('5sj6204ks87nmu3b5rvp85i9b9', 1776410479, 'modx.user.contextTokens|a:0:{}'),
('5sjhp1uhu1fb65i284gp0uq9ch', 1775672591, 'modx.user.contextTokens|a:0:{}'),
('5ud4c3mrf5i76sikiephr5vcie', 1776012404, 'modx.user.contextTokens|a:0:{}'),
('5uift3vg34rrl4t8a4rjutf72m', 1775282390, 'modx.user.contextTokens|a:0:{}'),
('60kqupp0gegr9spjke1fq5rmd5', 1776323175, 'modx.user.contextTokens|a:0:{}'),
('61s0vgbvpnpvp4370908oqnkok', 1775357597, 'modx.user.contextTokens|a:0:{}'),
('63g0g2h70la6fd6js3jpv0uaf8', 1776037094, 'modx.user.contextTokens|a:0:{}'),
('64jsnod0as52m06cn8f1ruavum', 1775300795, 'modx.user.contextTokens|a:0:{}'),
('64m7nr5t0u7kn02c384qh5ek48', 1775692755, 'modx.user.contextTokens|a:0:{}'),
('65pgdh34irt929j8pdmhroht00', 1776371738, 'modx.user.contextTokens|a:0:{}'),
('66eft6be18m12louof7k4p9iaj', 1775368586, 'modx.user.contextTokens|a:0:{}'),
('68hitmsmrajglhmrql3hmpi68g', 1776347013, 'modx.user.contextTokens|a:0:{}'),
('68q00sunrn4q3chnpg9i4lcp7n', 1775270902, 'modx.user.contextTokens|a:0:{}'),
('6abhjk96pil8vchmo7ic9ctvks', 1775537725, 'modx.user.contextTokens|a:0:{}'),
('6ccamvfnrop1t0diqtctqrt5is', 1775714914, 'modx.user.contextTokens|a:0:{}'),
('6firegfbv4u7obq9ga9bv9921e', 1775826895, 'modx.user.contextTokens|a:0:{}'),
('6fp3gpjvb5ildgt694pb7hbems', 1775436167, 'modx.user.contextTokens|a:0:{}'),
('6gdkuhlvu82k6hf8s2m5mhpo3k', 1775968776, 'modx.user.contextTokens|a:0:{}'),
('6h8leqve5uenufb4j3d6og0muv', 1775243672, 'modx.user.contextTokens|a:0:{}'),
('6hdjrg1tvt8bfrt9pg8alluons', 1776264474, 'modx.user.contextTokens|a:0:{}'),
('6hml0okri9l82usi47tpqsnfkr', 1775662479, 'modx.user.contextTokens|a:0:{}'),
('6hr5dqndug8vlrlpbrvf7iptak', 1775301607, 'modx.user.contextTokens|a:0:{}'),
('6jbi23bhlnui356209ki7v84ur', 1775241955, 'modx.user.contextTokens|a:0:{}'),
('6ktli0b6uesp3g2gv8sgcde261', 1775814921, 'modx.user.contextTokens|a:0:{}'),
('6l4e24sckjof5igvdqm8j79oer', 1775928861, 'modx.user.contextTokens|a:0:{}'),
('6otolt49rk7cjh15ar64a6tbka', 1775265748, 'modx.user.contextTokens|a:0:{}'),
('6qb7gbf700gonrj6d86epha9s8', 1775946227, 'modx.user.contextTokens|a:0:{}'),
('6r8fgq82ptmf1fsu9orp301uar', 1775880800, 'modx.user.contextTokens|a:0:{}'),
('6r9tsct76cufpemvt7dst68f0u', 1775995105, 'modx.user.contextTokens|a:0:{}'),
('6rr8mupq2qcjkekv4r7tgorqbk', 1776386192, 'modx.user.contextTokens|a:0:{}'),
('6tsiemsu157uo36gdjmsv1cekl', 1775357093, 'modx.user.contextTokens|a:0:{}'),
('6ttrhqfk8g595ahsbolpfv4o4t', 1775375574, 'modx.user.contextTokens|a:0:{}'),
('6uhrot77mekhl85n9sseb7rcv2', 1775969022, 'modx.user.contextTokens|a:0:{}'),
('6ujqghq80i1b5247gprgrom4ef', 1776328056, 'modx.user.contextTokens|a:0:{}'),
('714bj86r9nbalvqa1fn1lvrecn', 1775285672, 'modx.user.contextTokens|a:0:{}'),
('7163n6lht89etaajtjdrrlsco8', 1775617415, 'modx.user.contextTokens|a:0:{}'),
('718leo46kldd2toe0eifds66u5', 1775603478, 'modx.user.contextTokens|a:0:{}'),
('71gm3dlmhlsgg7nfds5lnu2fda', 1775887615, 'modx.user.contextTokens|a:0:{}'),
('71o6sbq00k9nstru5j8e0595ds', 1775662484, 'modx.user.contextTokens|a:0:{}'),
('72argqfmpl5tnfm2kthuo9cebg', 1776300386, 'modx.user.contextTokens|a:0:{}'),
('74mld8mab9b9c8o8athbofmnn2', 1776005983, 'modx.user.contextTokens|a:0:{}'),
('762gjs3f2hhe3pj0t243eg0sn9', 1775331810, 'modx.user.contextTokens|a:0:{}'),
('77v6ivrf8l2p8mpk1k2g5rfado', 1775758547, 'modx.user.contextTokens|a:0:{}'),
('7885l6016r5f8vsemmb6j665m8', 1775294054, 'modx.user.contextTokens|a:0:{}'),
('79e2papdn8ipi1ra5fgut1cmnp', 1775910078, 'modx.user.contextTokens|a:0:{}'),
('79kghfaosa939v92qnmcb3s15k', 1775352633, 'modx.user.contextTokens|a:0:{}'),
('7b0gft8efipi9cbgvtd94pnm7i', 1775501125, 'modx.user.contextTokens|a:0:{}'),
('7ecg41sao8ed86jrkj6jh56bfd', 1775310517, 'modx.user.contextTokens|a:0:{}'),
('7fhmsqiimq23cr7e9jdkr6kc07', 1775836161, 'modx.user.contextTokens|a:0:{}'),
('7gvucmfe24k537hu0snuar8ts2', 1775304828, 'modx.user.contextTokens|a:0:{}'),
('7hvq1h2kvekbkanm8gp3dsq2cj', 1776338360, 'modx.user.contextTokens|a:0:{}'),
('7jjlb9a2hot9d6rmo8o65qo47o', 1775968774, 'modx.user.contextTokens|a:0:{}'),
('7lq7hnhktf8kvnb2hjc3dig9dr', 1775270911, 'modx.user.contextTokens|a:0:{}'),
('7lsscbfqf59ba5utuquvlg8tg6', 1776077021, 'modx.user.contextTokens|a:0:{}'),
('7lu4p16lcsced1282fipug4bg5', 1775440222, 'modx.user.contextTokens|a:0:{}'),
('7m50amm83d0j8fm6d9u5lqqr2k', 1775366592, 'modx.user.contextTokens|a:0:{}'),
('7mhobrb6125ng5ils2mb2loc27', 1775897732, 'modx.user.contextTokens|a:0:{}'),
('7mt3umoucerg0s93s141e4n25e', 1775171908, 'modx.user.contextTokens|a:0:{}'),
('7mu9fvdb4gfuv4adfve6r17tlf', 1775782132, 'modx.user.contextTokens|a:0:{}'),
('7mutkico92t44fkrkj6vsrgadp', 1776334094, 'modx.user.contextTokens|a:0:{}'),
('7nmohuv7qh61kst6nj1ukca1sj', 1775636186, 'modx.user.contextTokens|a:0:{}'),
('7op2785uleu5ig5rhtuascsos3', 1775232750, 'modx.user.contextTokens|a:0:{}'),
('7p3nob6898nuoef7e2ic9lh4jf', 1775350519, 'modx.user.contextTokens|a:0:{}'),
('7rqi92mf1d6qr0vraunklt0c9g', 1775566913, 'modx.user.contextTokens|a:0:{}'),
('7rsr38392t2u7g0al8hjhujdih', 1775404432, 'modx.user.contextTokens|a:0:{}'),
('7tcsi5cfpjlm9kntarqeqpb5k7', 1775545975, 'modx.user.contextTokens|a:0:{}'),
('7tk56l0obk0ctof49fh27ddclj', 1776105320, 'modx.user.contextTokens|a:0:{}'),
('7v1bsht1epfcsfrk7msuc10pbl', 1775188367, 'modx.user.contextTokens|a:0:{}'),
('7vpcceh19l8dl71f5hvq4k8v18', 1776282271, 'modx.user.contextTokens|a:0:{}'),
('8077c0iv1dcmei7olkhvgho8ri', 1775743748, 'modx.user.contextTokens|a:0:{}'),
('816opl3fh4g7u7njbf2bcml4gu', 1776237743, 'modx.user.contextTokens|a:0:{}'),
('817eavk7jmp0lbhi4de888b1aq', 1776287610, 'modx.user.contextTokens|a:0:{}'),
('81qih5j3d1uelqtkrv6c5orrll', 1775684068, 'modx.user.contextTokens|a:0:{}'),
('82ml0kr482nkju2vvlgjmcqju4', 1776229624, 'modx.user.contextTokens|a:0:{}'),
('82ns0627hmi0dcsprj5blp4mt1', 1775814302, 'modx.user.contextTokens|a:0:{}'),
('837jll2hq9540jkus9e3a1018q', 1775937067, 'modx.user.contextTokens|a:0:{}'),
('8472c6utpdpuvfac94qancqmg2', 1776094660, 'modx.user.contextTokens|a:0:{}'),
('85q41bcfu3du1bkikvkiloo6ma', 1775861195, 'modx.user.contextTokens|a:0:{}'),
('862p784vd3ggu0qh82udskget1', 1775946802, 'modx.user.contextTokens|a:0:{}'),
('867lt1fljro1l9ld2kd2t0v5qp', 1775821370, 'modx.user.contextTokens|a:0:{}'),
('87fagcpn6mbfg7jncpqufm41tc', 1776104960, 'modx.user.contextTokens|a:0:{}'),
('87jsgh88jac1bki2b66encu6vv', 1775133725, 'modx.user.contextTokens|a:0:{}'),
('88595duu1ujtqu751mcga3d6d1', 1775476845, 'modx.user.contextTokens|a:0:{}'),
('88mnk4pduc73tk12u7840inkm7', 1775821121, 'modx.user.contextTokens|a:0:{}'),
('89ehm9nng8ik7510e8l5p61190', 1775736356, 'modx.user.contextTokens|a:0:{}'),
('8aicjoo1v5f52s56crdnphs6vm', 1775874410, 'modx.user.contextTokens|a:0:{}'),
('8as5gncop10kshpnv3s0f53nde', 1776010403, 'modx.user.contextTokens|a:0:{}'),
('8d2nukgb3j509ullvqqk1e24fm', 1775874924, 'modx.user.contextTokens|a:0:{}'),
('8dd23iducjqtkmnfc4lun2f6h4', 1775888448, 'modx.user.contextTokens|a:0:{}'),
('8du2fseqh4cftmun5i28bgcjva', 1776205108, 'modx.user.contextTokens|a:0:{}'),
('8eh0mvivq545udfj8gulh6dmqu', 1775632895, 'modx.user.contextTokens|a:0:{}'),
('8eua6h7k4ukjpljhnf8q65o3uj', 1775886010, 'modx.user.contextTokens|a:0:{}'),
('8f1dgfkbbdne0jq3d7b3eoudub', 1775656821, 'modx.user.contextTokens|a:0:{}'),
('8fmh6t3m2j5cal40lq53nsr54i', 1775552080, 'modx.user.contextTokens|a:0:{}'),
('8hqvao1sh11ach101gc5ilmch0', 1775454286, 'modx.user.contextTokens|a:0:{}'),
('8i2r1ckb0sj3t9cb1fv17urhc7', 1775904638, 'modx.user.contextTokens|a:0:{}'),
('8i7kt4n3ej4kj70s9gfrnpmtur', 1775681838, 'modx.user.contextTokens|a:0:{}'),
('8j742h9jkuabd8sjjb9f95hbnm', 1775408827, 'modx.user.contextTokens|a:0:{}'),
('8j7tvb12nd38gjfo6mfcfd8q5e', 1775363795, 'modx.user.contextTokens|a:0:{}'),
('8je200jfhqcta7ulsd64ndlb4c', 1775182432, 'modx.user.contextTokens|a:0:{}'),
('8jrhvkhp0pst1uote3tmn3kpir', 1775773663, 'modx.user.contextTokens|a:0:{}'),
('8lpfncso7o4b9jds7olm6po5qs', 1775417526, 'modx.user.contextTokens|a:0:{}'),
('8lvl000p14ff9teqrldi8mespk', 1776224550, 'modx.user.contextTokens|a:0:{}'),
('8mnensuaj5h365m4lsgnuk93qn', 1775787742, 'modx.user.contextTokens|a:0:{}'),
('8qlol0vp28ua0ilvelbia8odsb', 1775270902, 'modx.user.contextTokens|a:0:{}'),
('8rf6utfatovjshr8dkgvjpm3qb', 1776014921, 'modx.user.contextTokens|a:0:{}'),
('8ses65pa08fn1ev5b1giucrt8d', 1775240785, 'modx.user.contextTokens|a:0:{}'),
('8su1g2u3mrns0gnlplqvg3b0jl', 1775157881, 'modx.user.contextTokens|a:0:{}'),
('8t17qqa2l8tk8il0k1tmk90vp2', 1775231653, 'modx.user.contextTokens|a:0:{}'),
('8th4q1jbiqagil1elokpuapomc', 1776151763, 'modx.user.contextTokens|a:0:{}'),
('8uo1rkl8m0jpjo3ljmpeb557gp', 1775706522, 'modx.user.contextTokens|a:0:{}'),
('90tjj421ft9v6l4svru4k5vgrh', 1775357112, 'modx.user.contextTokens|a:0:{}'),
('90ukbfgsa2af64960l9gsa7f31', 1775682830, 'modx.user.contextTokens|a:0:{}'),
('919e45i675tk1d3igkluvcl4gt', 1776398327, 'modx.user.contextTokens|a:0:{}'),
('9306vm58da2mnej49capf6fai6', 1776003674, 'modx.user.contextTokens|a:0:{}'),
('94r7pg6jobkd8blkadci035mhj', 1776205027, 'modx.user.contextTokens|a:0:{}'),
('96j8vo2qlfofgk16pktork2kgo', 1775807744, 'modx.user.contextTokens|a:0:{}'),
('97embrfrphc1adud6cjv64sc3c', 1775888366, 'modx.user.contextTokens|a:0:{}'),
('97i2v9ks0v36loucp92gufrmnu', 1775842566, 'modx.user.contextTokens|a:0:{}'),
('98l9vsl1bvptvnap1gfrhq6ka1', 1775194353, 'modx.user.contextTokens|a:0:{}'),
('98q5oao6ot5s7lmi764o1pn0pm', 1775354129, 'modx.user.contextTokens|a:0:{}'),
('9a3u8tldneqotraamdrt6b5jvb', 1775138756, 'modx.user.contextTokens|a:0:{}'),
('9ai7gg1gv1948i0tmhbcaoaj9q', 1775644277, 'modx.user.contextTokens|a:0:{}'),
('9ap95lqnmtsp8uigl2rj3aaj50', 1775321825, 'modx.user.contextTokens|a:0:{}'),
('9at2gcubdlnnrj17gtfo5jh1an', 1775391565, 'modx.user.contextTokens|a:0:{}'),
('9bamr73t3409b8jmbuepp8k2bi', 1775641969, 'modx.user.contextTokens|a:0:{}'),
('9bkuriaudq51jeufcqk7s99nuv', 1776066995, 'modx.user.contextTokens|a:0:{}'),
('9cvd38qkp0oiqjbjgiju0eqeug', 1776397427, 'modx.user.contextTokens|a:0:{}'),
('9dcv7achvu2kp10ft25aelp5f1', 1776285536, 'modx.user.contextTokens|a:0:{}'),
('9ea3umhifrepkljj65mlat6u0a', 1775755460, 'modx.user.contextTokens|a:0:{}'),
('9f97r6indt3m924dq12a8krf0l', 1776285484, 'modx.user.contextTokens|a:0:{}'),
('9fbm3k7h712ohlg2v508l1qk36', 1775198325, 'modx.user.contextTokens|a:0:{}'),
('9fgki1dijb763r4v4n1iapgijf', 1776372228, 'modx.user.contextTokens|a:0:{}'),
('9hngtrd9u72rv4gq9ra5cp3m55', 1775229990, 'modx.user.contextTokens|a:0:{}'),
('9icqr9ufkkks5ek082sr7k0if1', 1775635276, 'modx.user.contextTokens|a:0:{}'),
('9idl5isr466ijthbqg0um1rklm', 1776151811, 'modx.user.contextTokens|a:0:{}'),
('9isr3hek8012stou8p0m7hm3rc', 1776310955, 'modx.user.contextTokens|a:0:{}'),
('9j6btcm35rrp8oeo8hkkmkdn0j', 1776191945, 'modx.user.contextTokens|a:0:{}'),
('9j8idr670596224r8j5hsj5p2h', 1776334041, 'modx.user.contextTokens|a:0:{}'),
('9k637fvub7u6ra71p08e82ofdg', 1776131070, 'modx.user.contextTokens|a:0:{}'),
('9ljqi1q3vo2v3qium7vjd5aa2l', 1775401487, 'modx.user.contextTokens|a:0:{}'),
('9ltp2k2ca73g63kp5b4opndgv8', 1776332187, 'modx.user.contextTokens|a:0:{}'),
('9m6nes5mnkkc6orase6s526gee', 1775850056, 'modx.user.contextTokens|a:0:{}'),
('9n2phl7o2c4btslme4c6kggv4e', 1775500550, 'modx.user.contextTokens|a:0:{}'),
('9n8apevssr4hc30eomijei3o1n', 1776009909, 'modx.user.contextTokens|a:0:{}'),
('9qqpbb1016ks845ef1psuluk80', 1775701407, 'modx.user.contextTokens|a:0:{}'),
('9revgf41laep91idpofggbhbif', 1776210798, 'modx.user.contextTokens|a:0:{}'),
('9sedd9i903t2bncvpvt83bpu39', 1776017579, 'modx.user.contextTokens|a:0:{}'),
('9sf8lu9m9dcmf9gpronbub3s2e', 1776099656, 'modx.user.contextTokens|a:0:{}'),
('9sl1n23lnqchdbbknqu1peoppn', 1775251186, 'modx.user.contextTokens|a:0:{}'),
('9ti0596s5rqqmns1c2mduv2cu8', 1775347226, 'modx.user.contextTokens|a:0:{}'),
('9tqgesc36n7fq7jg4rv20p5l44', 1775946804, 'modx.user.contextTokens|a:0:{}'),
('9uup73fod1fts1ic0pli6q2khf', 1775717096, 'modx.user.contextTokens|a:0:{}'),
('a166oghipitpgmfk16b1rqdg9k', 1775749370, 'modx.user.contextTokens|a:0:{}'),
('a2kfgkbtmtaos46750cpcstbno', 1775545465, 'modx.user.contextTokens|a:0:{}'),
('a2v4icgpfii95fhhbmdd1e3bnk', 1776176278, 'modx.user.contextTokens|a:0:{}'),
('a36utmmkq57srqkc4jpcr3oh7t', 1776277394, 'modx.user.contextTokens|a:0:{}'),
('a3hmfifko7qmtnkkl8gm1v80bb', 1776327123, 'modx.user.contextTokens|a:0:{}'),
('a3jfutf77la72g1nadrbio4gbo', 1775491436, 'modx.user.contextTokens|a:0:{}'),
('a3pe3lgq9m1pa1fump21c93c7o', 1775755478, 'modx.user.contextTokens|a:0:{}'),
('a4m19ch2ahnc4cs9fbbctacuio', 1776407858, 'modx.user.contextTokens|a:0:{}'),
('a5pin5ph65bka1sllv93i72rk2', 1775479769, 'modx.user.contextTokens|a:0:{}'),
('a6bgcqa9c2s9ratosfupr3fm9m', 1775667831, 'modx.user.contextTokens|a:0:{}'),
('a6hpid0f4qe7lrfphpgip4i0lk', 1775581094, 'modx.user.contextTokens|a:0:{}'),
('a6slrojn4ihn9uflbej7epnjdb', 1775662473, 'modx.user.contextTokens|a:0:{}'),
('a81ctcs15hm5mr7gv18tm85a4m', 1775585984, 'modx.user.contextTokens|a:0:{}'),
('a8avapmql10ed823cpc81327c0', 1775573484, 'modx.user.contextTokens|a:0:{}'),
('a8bg5ljqhossk6la5utlkgqoos', 1775814896, 'modx.user.contextTokens|a:0:{}'),
('a8g3i0o18mddhq6otvup7174dc', 1775789681, 'modx.user.contextTokens|a:0:{}'),
('a8m1odl8s4sla8tl184ril039q', 1775147563, 'modx.user.contextTokens|a:0:{}'),
('a92j82k082g6c930443urmk845', 1776137974, 'modx.user.contextTokens|a:0:{}'),
('ab59hofhhejlm5baribu992gvr', 1775566331, 'modx.user.contextTokens|a:0:{}'),
('abh6d7fjbbhd0vlksqtob0mc5u', 1775591016, 'modx.user.contextTokens|a:0:{}'),
('abvdevbe5h9f5nuqdrmv0g31ar', 1776257879, 'modx.user.contextTokens|a:0:{}'),
('acd65rh4e8d642dl9u4bqbsbei', 1775429921, 'modx.user.contextTokens|a:0:{}'),
('ad7nodp5v31b1v0fsadtjmjgnu', 1775642373, 'modx.user.contextTokens|a:0:{}'),
('adq4oddvnumlm58s1d92f4qhl3', 1775132503, 'modx.user.contextTokens|a:0:{}'),
('afc6f739q5j740tmiltifrg2au', 1775625033, 'modx.user.contextTokens|a:0:{}'),
('afoc7sqiq7abf74b7b8vauup44', 1776075713, 'modx.user.contextTokens|a:0:{}'),
('ahs02abvq10lhdrkdek2lpu808', 1775922932, 'modx.user.contextTokens|a:0:{}'),
('ai60jnau2m2vtfhd4t75krai45', 1775504950, 'modx.user.contextTokens|a:0:{}'),
('aju9f36f2p6urcn20f08c26irv', 1775456593, 'modx.user.contextTokens|a:0:{}'),
('ak76ve7b7975og8ie3bajl7s6b', 1776269536, 'modx.user.contextTokens|a:0:{}'),
('akrihksoepghfpian4t6u4os0n', 1775821871, 'modx.user.contextTokens|a:0:{}'),
('ankkd3pr70r0q1ck8e1jlm45q4', 1775822667, 'modx.user.contextTokens|a:0:{}'),
('anm3vhmom7893oseev8gmbt29t', 1776188606, 'modx.user.contextTokens|a:0:{}'),
('ao4j5qq4b4o62je59p2vcbmdph', 1775668409, 'modx.user.contextTokens|a:0:{}'),
('aok419f2209gioncdh6kf1q4df', 1775232133, 'modx.user.contextTokens|a:0:{}'),
('ar20a8f3aih6q2b0n09frbq7tv', 1775357302, 'modx.user.contextTokens|a:0:{}'),
('asnvbn27vvrt1tv5ffbn8tg1q8', 1776000123, 'modx.user.contextTokens|a:0:{}'),
('at78jptd3pf6b8pb5hco2aflta', 1775928825, 'modx.user.contextTokens|a:0:{}'),
('atec0jif5031dc6049anooko18', 1775381956, 'modx.user.contextTokens|a:0:{}'),
('atf0mdb9io93kfm00viclm657o', 1775229989, 'modx.user.contextTokens|a:0:{}'),
('avedb7fmt9bed8i50158ppo0uv', 1775874785, 'modx.user.contextTokens|a:0:{}'),
('b0dr9fj3gkdd1slopjo4mr2gb6', 1776334096, 'modx.user.contextTokens|a:0:{}'),
('b0g199gkv41ipnej4j4mjajkhv', 1775624966, 'modx.user.contextTokens|a:0:{}'),
('b0l40l2gmml3opb6j5pggbqqul', 1775199682, 'modx.user.contextTokens|a:0:{}'),
('b0orijvtot665vh1k7iu9cmt9v', 1775533922, 'modx.user.contextTokens|a:0:{}'),
('b1gr7mb6oum2dhmo37uvrohmqf', 1775976575, 'modx.user.contextTokens|a:0:{}'),
('b1k5j489jdtr8c6ft9ne02gua5', 1776058389, 'modx.user.contextTokens|a:0:{}'),
('b1mv174teasr5sjhocdkt3f42o', 1775301648, 'modx.user.contextTokens|a:0:{}'),
('b2o4fc79a3pqecvi46bla5lp7d', 1775552725, 'modx.user.contextTokens|a:0:{}'),
('b3jc8srm4okbmgm3l4p6iu36po', 1775755483, 'modx.user.contextTokens|a:0:{}'),
('b3vhdvf42org34oocdpdnpf0st', 1775385501, 'modx.user.contextTokens|a:0:{}'),
('b54nnmt5lgleeer1agt7g3g8f1', 1776391784, 'modx.user.contextTokens|a:0:{}'),
('b57npuiphdkv9ijd1kqgsa0lse', 1775432078, 'modx.user.contextTokens|a:0:{}'),
('b61kfki6fi4ku3s4j4p9b8tl7d', 1776354121, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('b7e80h57evmashr1h7ibv1opbu', 1775660206, 'modx.user.contextTokens|a:0:{}'),
('b8qd3v56cje135c4fig04828qr', 1775696625, 'modx.user.contextTokens|a:0:{}'),
('b9eo8s7a83r02de2n6fb0i763e', 1775837420, 'modx.user.contextTokens|a:0:{}'),
('babrg2mbjr5bknv8rmcapqqeri', 1775886755, 'modx.user.contextTokens|a:0:{}'),
('bb3op3b6018fcfgo5aderherpo', 1775324626, 'modx.user.contextTokens|a:0:{}'),
('bdj8vv8cqtlu04j6sak81tu9ns', 1775560357, 'modx.user.contextTokens|a:0:{}'),
('bdp1neu3ifb506f3nh26kp7pac', 1776352159, 'modx.user.contextTokens|a:0:{}'),
('bdqori83a9i1kv2mru3m5dq0uq', 1775472811, 'modx.user.contextTokens|a:0:{}'),
('bgbm9nlss6pae4ek258rrbk7tk', 1776284316, 'modx.user.contextTokens|a:0:{}'),
('bh7p1g3vkcnabtl6e82gk6o668', 1775352310, 'modx.user.contextTokens|a:0:{}'),
('bhg2biott0bii2qqucs97kd7ui', 1776358809, 'modx.user.contextTokens|a:0:{}'),
('bi186nd0cci7kim26taa3idt40', 1775456864, 'modx.user.contextTokens|a:0:{}'),
('bi7v4vm6tb53i7fkgftu5il7tm', 1775497883, 'modx.user.contextTokens|a:0:{}'),
('bijls66g5i97vj8nkc1fe4u6gv', 1776151763, 'modx.user.contextTokens|a:0:{}'),
('bio4gshj6r5i6ch8lstu6qnvcp', 1776113301, 'modx.user.contextTokens|a:0:{}'),
('bis6tde98ug07gr93uh753l572', 1775540410, 'modx.user.contextTokens|a:0:{}'),
('bmvdnv3eh1as1agfj1i3eg1gg2', 1776167710, 'modx.user.contextTokens|a:0:{}'),
('bn031bp7glrntcgc03jut49p91', 1775888090, 'modx.user.contextTokens|a:0:{}'),
('bnhh9hsr210bsq5nf260cslkb8', 1776139055, 'modx.user.contextTokens|a:0:{}'),
('bo6kfk9src59gtkc5o54n1lr33', 1775209181, 'modx.user.contextTokens|a:0:{}'),
('bp179n4v1p2ujnj1gak06t14dj', 1775561083, 'modx.user.contextTokens|a:0:{}'),
('bqjonm9l64ounrg732ln1amo24', 1775894462, 'modx.user.contextTokens|a:0:{}'),
('brd5vmlj32fjq01jpe2cubnml3', 1776125316, 'modx.user.contextTokens|a:0:{}'),
('brvt05k3no083ae7jke66poptl', 1776012307, 'modx.user.contextTokens|a:0:{}'),
('bt88g6cq981ud5bfcvq43sl0rc', 1775946227, 'modx.user.contextTokens|a:0:{}'),
('bticqppgq9g7cehjs446288gmt', 1776002211, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('btlq1cf38mg0mce1eslatcnvik', 1775896209, 'modx.user.contextTokens|a:0:{}'),
('butiak1lq0tnc061ubjki64drc', 1776235060, 'modx.user.contextTokens|a:0:{}'),
('bv0m1n1fc570jkqnodkhvevarf', 1776324307, 'modx.user.contextTokens|a:0:{}'),
('bv4a75l1j1616ff99qutar3ae3', 1775752556, 'modx.user.contextTokens|a:0:{}'),
('bvj6q1pgrqa0qv66h3hb13le2d', 1775472969, 'modx.user.contextTokens|a:0:{}'),
('c1ghd3m98sk9m64sa6jjpbmghe', 1775637542, 'modx.user.contextTokens|a:0:{}'),
('c25t7g6iu7v6nulg0hvats4rtr', 1775887213, 'modx.user.contextTokens|a:0:{}'),
('c2vb5naiuc82us0v8l29jkis2c', 1775492319, 'modx.user.contextTokens|a:0:{}'),
('c30judnkb46vtl5rhrh9ehi0bi', 1775365692, 'modx.user.contextTokens|a:0:{}'),
('c3o92jft2el06j8j85cutsjid2', 1776316472, 'modx.user.contextTokens|a:0:{}'),
('c41kg11l9gpqlaojfmtjfkg1kt', 1775602963, 'modx.user.contextTokens|a:0:{}'),
('c53c5m639arhdt65shv5mi0sht', 1775919877, 'modx.user.contextTokens|a:0:{}'),
('c5chj30cktsa50uqhci2is6kh5', 1775964803, 'modx.user.contextTokens|a:0:{}'),
('c5flfnok3r8qfmf9am5d8v3boq', 1776241258, 'modx.user.contextTokens|a:0:{}'),
('c7e1tanq8fcu9fidmc0ili8q2v', 1775668719, 'modx.user.contextTokens|a:0:{}'),
('c7hcet9cv9hfer574108u28acr', 1775672591, 'modx.user.contextTokens|a:0:{}'),
('c8kh3odjqkgdfuc9rav62mk99p', 1775608480, 'modx.user.contextTokens|a:0:{}'),
('c96f2juhuot22q2ec1ldg56g74', 1775596315, 'modx.user.contextTokens|a:0:{}'),
('c9b8qn0oc4i72arm04jckgsls3', 1775188376, 'modx.user.contextTokens|a:0:{}'),
('c9i4ebtf08i9p8iejnmanu2pbv', 1776261191, 'modx.user.contextTokens|a:0:{}'),
('cc29gp6moj3jv1fktalo9sh22j', 1775469760, 'modx.user.contextTokens|a:0:{}'),
('cfuao8ccslls022jjbdhq2tqfn', 1776269605, 'modx.user.contextTokens|a:0:{}'),
('cgeivnogjj3c8pt55iic38tii0', 1776407503, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('cghsug443iqshv0s044nm3dk88', 1776328127, 'modx.user.contextTokens|a:0:{}'),
('ch9t98p2u21m68c6ckevlskg4i', 1775167540, 'modx.user.contextTokens|a:0:{}'),
('chftp72qlgia8q3tk7arv5qhbv', 1775472954, 'modx.user.contextTokens|a:0:{}'),
('chv0c0108agm3vojc44lvifce8', 1775132651, 'modx.user.contextTokens|a:0:{}'),
('cidsaeekqrvl6be25hj3ae0gfr', 1775613375, 'modx.user.contextTokens|a:0:{}'),
('cjoioi0m9pvrl8lfbf47ia87ls', 1776286698, 'modx.user.contextTokens|a:0:{}'),
('cjr1t38vhfs29uls5hda1cun13', 1775573551, 'modx.user.contextTokens|a:0:{}'),
('cjsq0ejc3q7j2e7tegij99d90k', 1776350155, 'modx.user.contextTokens|a:0:{}'),
('cklb7g5k36s6qksut5b79uggli', 1775900962, 'modx.user.contextTokens|a:0:{}'),
('ckodhehd7csuqorb9pk17ei4bt', 1775180260, 'modx.user.contextTokens|a:0:{}'),
('cldckkofva8po432458fn6m7m9', 1775814034, 'modx.user.contextTokens|a:0:{}'),
('clo2io6c4a37pns9ajurircc2t', 1776186873, 'modx.user.contextTokens|a:0:{}'),
('cnhr5m1brgarf4qqatd3c3j7q4', 1775414633, 'modx.user.contextTokens|a:0:{}'),
('coa9543ujg9iuluebhoa3kbmai', 1775864564, 'modx.user.contextTokens|a:0:{}'),
('covgoeojrrutcl7siv078cpv1g', 1776337527, 'modx.user.contextTokens|a:0:{}'),
('cpol4m2f01k769joillf9c23ho', 1776205107, 'modx.user.contextTokens|a:0:{}'),
('cr28iehr18odg0c1gjjrtjv9pb', 1775347241, 'modx.user.contextTokens|a:0:{}'),
('cr555e4bvaspnrgbr4b0l6jf5g', 1775202792, 'modx.user.contextTokens|a:0:{}'),
('csl89s6ipjb3hnpf6chuluko7d', 1776237513, 'modx.user.contextTokens|a:0:{}'),
('cst327dgeoegfs7n0rvt310rui', 1776369577, 'modx.user.contextTokens|a:0:{}'),
('cthnitl61a0cpl14ifqoqr4r1j', 1775532741, 'modx.user.contextTokens|a:0:{}'),
('cugjauvjrtqqs29u2ttm2ukf52', 1775270904, 'modx.user.contextTokens|a:0:{}'),
('cv1d3ap4e13ja6u2b17ebs8vm4', 1775910811, 'modx.user.contextTokens|a:0:{}'),
('d124jdtt9cr28k5t87dmhpa8ev', 1776136656, 'modx.user.contextTokens|a:0:{}'),
('d27kjf0iq3hcfect6teefcuapd', 1775672267, 'modx.user.contextTokens|a:0:{}'),
('d3sfgf7v5652b3aq5178fkru7b', 1775442794, 'modx.user.contextTokens|a:0:{}'),
('d43j5ad8k68d7b9s5rppl2ga8v', 1775880770, 'modx.user.contextTokens|a:0:{}'),
('d5pqc3ueskrajaornm1qjgkijr', 1776164255, 'modx.user.contextTokens|a:0:{}'),
('d5tcjb0encacdn3fktoh5ok9k1', 1776381612, 'modx.user.contextTokens|a:0:{}'),
('d65mja3l1uegafh7dm065s1qo3', 1775583315, 'modx.user.contextTokens|a:0:{}'),
('d6uhp682acklr07qd90s5plgmd', 1775561080, 'modx.user.contextTokens|a:0:{}'),
('d7dca08opsjer68nrlvgtvuf6u', 1775414639, 'modx.user.contextTokens|a:0:{}'),
('d7mri0hc2ao6k001kfebt90qg5', 1775946227, 'modx.user.contextTokens|a:0:{}'),
('d8cgbmr6r6a33vjrm7c9pp2eh2', 1775684067, 'modx.user.contextTokens|a:0:{}'),
('dabveqi04b3kplkg1b1jhqp20p', 1775603468, 'modx.user.contextTokens|a:0:{}'),
('dajithefck14kap16p404j6062', 1776331993, 'modx.user.contextTokens|a:0:{}'),
('dbj8tmus0102f5jagcsqk4749n', 1776060937, 'modx.user.contextTokens|a:0:{}'),
('dbl73qhjmp5j8jbbq57jijrok5', 1775219450, 'modx.user.contextTokens|a:0:{}'),
('dcj4gu1pqgisb58vuoocvpjh0e', 1775814409, 'modx.user.contextTokens|a:0:{}'),
('dgc3ttalb85hibd8eu56kmffdb', 1775676708, 'modx.user.contextTokens|a:0:{}'),
('dgvre38nd7d59m0drh8jsga499', 1775513715, 'modx.user.contextTokens|a:0:{}'),
('dh2uculsuce4gavajik5mdjui4', 1775279170, 'modx.user.contextTokens|a:0:{}'),
('dk2l1mf6gqse1u82brhv0o5e6k', 1775968837, 'modx.user.contextTokens|a:0:{}'),
('dkc841vskpohio3jk6144pkhut', 1775909035, 'modx.user.contextTokens|a:0:{}'),
('dkecj0403hd6fe0jru5ug1fff4', 1775389867, 'modx.user.contextTokens|a:0:{}'),
('dli8ohgd2e5bo56f79a13bhq9i', 1776011766, 'modx.user.contextTokens|a:0:{}'),
('dlrheiriah0jj3nn0f20idq0qd', 1775429922, 'modx.user.contextTokens|a:0:{}'),
('dm1b2kemi4vc9gbigvbf46l9ki', 1775374818, 'modx.user.contextTokens|a:0:{}'),
('dn7g0l7g6fips0u6a3jghctkjr', 1775832905, 'modx.user.contextTokens|a:0:{}'),
('dnah7sb6otrnftia6r070hc1gp', 1775806091, 'modx.user.contextTokens|a:0:{}'),
('dnb67ifr26er6m5k0pm8ig6dto', 1775574416, 'modx.user.contextTokens|a:0:{}'),
('dnee5dcmlc7uianbvmup59osc3', 1775658276, 'modx.user.contextTokens|a:0:{}'),
('do9hf4m8eot1tl4krbovvt2h01', 1775826928, 'modx.user.contextTokens|a:0:{}'),
('dpsnt7lm3vd0kd60u7ilbqe1e0', 1775886982, 'modx.user.contextTokens|a:0:{}'),
('dr6idb6l09p0kre7dtucl91bpl', 1775706829, 'modx.user.contextTokens|a:0:{}'),
('drfe2b7euqbcs3krgbgd6106pi', 1775167500, 'modx.user.contextTokens|a:0:{}'),
('drjsvv6simikas68q42pk15i3c', 1775232689, 'modx.user.contextTokens|a:0:{}'),
('drmr5n63kv8c65qoj6bfmp94ph', 1776391738, 'modx.user.contextTokens|a:0:{}'),
('drqptq6vvha38njd9or3dkftc2', 1775456520, 'modx.user.contextTokens|a:0:{}'),
('ds09t82c9bo9hkbfro1khhviem', 1775508744, 'modx.user.contextTokens|a:0:{}'),
('ds4ni9njbaenh2cqevqh19lhjv', 1775921991, 'modx.user.contextTokens|a:0:{}'),
('dslt5h21k4v1o3uoj65254s6b7', 1775731421, 'modx.user.contextTokens|a:0:{}'),
('duf4gdmf08o4oqabk1rinitrkc', 1775552726, 'modx.user.contextTokens|a:0:{}'),
('duqvplp10ek10njb701tkq1sue', 1775537598, 'modx.user.contextTokens|a:0:{}'),
('e0ag42qv9mlben41fcruk58al6', 1775477452, 'modx.user.contextTokens|a:0:{}'),
('e1icunjftkho6n0hsim8tctjri', 1776371991, 'modx.user.contextTokens|a:0:{}'),
('e4n0fevv4jvhaco045fgfo25bh', 1776100648, 'modx.user.contextTokens|a:0:{}'),
('e4vfss8cdf7t0on3rtgua71spi', 1775888421, 'modx.user.contextTokens|a:0:{}'),
('e5827cr8otuea0q1mo73v2c81h', 1776386638, 'modx.user.contextTokens|a:0:{}'),
('e79fsnkjir8p53aahogedrb7r4', 1776244858, 'modx.user.contextTokens|a:0:{}'),
('e7ipcuvf7rmmuel033un4sjjjm', 1775946227, 'modx.user.contextTokens|a:0:{}'),
('e99340ic2e2m7gm88h16ddb80e', 1776064539, 'modx.user.contextTokens|a:0:{}'),
('e9taib6hnm4km74e0ccvh8o1om', 1775740408, 'modx.user.contextTokens|a:0:{}'),
('eagemaf2c0bl7jlq42bkj8ibja', 1775371672, 'modx.user.contextTokens|a:0:{}'),
('easmj7jihfkupa95156fbh87nn', 1776152718, 'modx.user.contextTokens|a:0:{}'),
('edcjh8pro4g6c4nt3lhpnim2so', 1775286587, 'modx.user.contextTokens|a:0:{}'),
('ee8d429va7b4275pef2u9mo5j1', 1776199662, 'modx.user.contextTokens|a:0:{}'),
('efr6844r673g2jhh6tka9dj8od', 1775660112, 'modx.user.contextTokens|a:0:{}'),
('ei51fdvel9jjkidfdbmsutrlv7', 1775754630, 'modx.user.contextTokens|a:0:{}'),
('ei870a5mh3l6sbdhppf8tniqni', 1776094714, 'modx.user.contextTokens|a:0:{}'),
('eile3a3ii8fs20poe6it41qs22', 1775727365, 'modx.user.contextTokens|a:0:{}'),
('el5fn9fct92ifcostojchsm33k', 1775452189, 'modx.user.contextTokens|a:0:{}'),
('em74es92oer05omqe94afk4f7c', 1775903677, 'modx.user.contextTokens|a:0:{}'),
('em81ebtqmvl8bujmm037v2iv2g', 1775721855, 'modx.user.contextTokens|a:0:{}'),
('eneomlga6vdovhin8qnf1i7uhl', 1775224021, 'modx.user.contextTokens|a:0:{}'),
('env1t5d5esekl5ard9kpjsija1', 1775572792, 'modx.user.contextTokens|a:0:{}'),
('eo73meeqv0sj3c3llktdsa5bat', 1775503473, 'modx.user.contextTokens|a:0:{}'),
('eojc0ek9ecjdg7nigm8e6a346n', 1775976338, 'modx.user.contextTokens|a:0:{}'),
('ep7jjjfjjvnvu67fsjr9m3ud3g', 1775929500, 'modx.user.contextTokens|a:0:{}'),
('eq930ceuqr93j8i6nd28ii9kn1', 1775743541, 'modx.user.contextTokens|a:0:{}'),
('er8sjvt2ti9jolfauuec1ah6st', 1775382160, 'modx.user.contextTokens|a:0:{}'),
('ercm021u6anlo9qea5v3h57lf0', 1775201328, 'modx.user.contextTokens|a:0:{}'),
('ern2ipp1ltp2q4nmshd9hidgtg', 1776283451, 'modx.user.contextTokens|a:0:{}'),
('evkqjrm2v72jpqedshvrulu791', 1775731781, 'modx.user.contextTokens|a:0:{}'),
('evpo14sunj0jrq1cpjedhpb3dg', 1775456807, 'modx.user.contextTokens|a:0:{}'),
('f0q8m93fpi8i0dvldbj5flqil8', 1775780820, 'modx.user.contextTokens|a:0:{}'),
('f34gik6n590b9rf8ga3dm62utd', 1776350156, 'modx.user.contextTokens|a:0:{}'),
('f3gost3s1i03akljahgqlva7h2', 1775285879, 'modx.user.contextTokens|a:0:{}'),
('f3r3loe9a7ud09feo678sb9g8v', 1775528526, 'modx.user.contextTokens|a:0:{}'),
('f5gmikhe81rrnuc4glg1s0v003', 1776001754, 'modx.user.contextTokens|a:0:{}'),
('f5mpc8ib3t80utdnhoh8c7eapu', 1775350500, 'modx.user.contextTokens|a:0:{}'),
('f5v5u4ogbt2qn35epkg32fc720', 1775513724, 'modx.user.contextTokens|a:0:{}'),
('f76eo5dk29emp9n3l0ld7jld0m', 1775563111, 'modx.user.contextTokens|a:0:{}'),
('f865g0grp7ff4g8grkesi6eb61', 1775358341, 'modx.user.contextTokens|a:0:{}'),
('fafcel6b30hpe8k8jvkjikb3ru', 1776349498, 'modx.user.contextTokens|a:0:{}'),
('farro1i0tpsga971o0dj0r409i', 1775975185, 'modx.user.contextTokens|a:0:{}'),
('fd5sjdmoi02lv33orggpmkhl5v', 1775846353, 'modx.user.contextTokens|a:0:{}'),
('fem4dt81ntauh5omlsllp8dbqh', 1775414629, 'modx.user.contextTokens|a:0:{}'),
('femhl6mt9a94mfathus9ocjufl', 1776314902, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('fevgkmkgegt0mh4o66n5ece561', 1775420419, 'modx.user.contextTokens|a:0:{}'),
('fj5gpu4t0g9at148hudia71cal', 1775401035, 'modx.user.contextTokens|a:0:{}'),
('fke0l4qh0rv5483g1a0h2i96eo', 1775179418, 'modx.user.contextTokens|a:0:{}'),
('fkjq5sihup3d4jgvc9a679g826', 1776154410, 'modx.user.contextTokens|a:0:{}'),
('flj9gbga5aoa1c1v20ab73nmq0', 1775356042, 'modx.user.contextTokens|a:0:{}'),
('fn8l1fhl2g3n2kd171hukf5b3o', 1775971850, 'modx.user.contextTokens|a:0:{}'),
('fon1nsb839br3ngt7qnrk0gs30', 1776244858, 'modx.user.contextTokens|a:0:{}'),
('fp3tn9o6baj1h8iqm1thb9h23c', 1775409495, 'modx.user.contextTokens|a:0:{}'),
('fphntq8gkdl4h9l9rbvc7naqpe', 1775509353, 'modx.user.contextTokens|a:0:{}'),
('fqpmjv1rbffvnrvv9od0cfstgk', 1775828144, 'modx.user.contextTokens|a:0:{}'),
('fqqlif4t215kg54cf5k52metbh', 1775946798, 'modx.user.contextTokens|a:0:{}'),
('fs3385v2buq80fp241ac4u1kg9', 1775456878, 'modx.user.contextTokens|a:0:{}'),
('fscgo3fidkhoa11651cu2795q3', 1776037094, 'modx.user.contextTokens|a:0:{}'),
('ftaqq0l2j1gva87kaq7vhsjcjq', 1775935611, 'modx.user.contextTokens|a:0:{}'),
('ftbfgc30gg6eu6qu0iqsas1cno', 1776060498, 'modx.user.contextTokens|a:0:{}'),
('fu2o5de2no48n6t6c2qg45lmjs', 1775588284, 'modx.user.contextTokens|a:0:{}'),
('fur80595c30vis4qpf35i9h491', 1775583172, 'modx.user.contextTokens|a:0:{}'),
('fuueo3e05noip0mknbnspm2rdc', 1775933133, 'modx.user.contextTokens|a:0:{}'),
('g0bgter2i8b158578nl9etm9o8', 1775631053, 'modx.user.contextTokens|a:0:{}'),
('g19fgi1d734lbatr76jvkhgb9g', 1775255305, 'modx.user.contextTokens|a:0:{}'),
('g1g02j8sqnun2m9kjo1hf5vira', 1775476828, 'modx.user.contextTokens|a:0:{}'),
('g237h7jfvhvojuf3s3n56gddro', 1775241767, 'modx.user.contextTokens|a:0:{}'),
('g3jbvgc8hfbiu23drcpt4mte2e', 1775719068, 'modx.user.contextTokens|a:0:{}'),
('g4ali5b8ma2akfg49fo4tflged', 1776060057, 'modx.user.contextTokens|a:0:{}'),
('g64sjmaup5gah76kqranbd6rj7', 1776285037, 'modx.user.contextTokens|a:0:{}'),
('g65akfanslof4c9eiekcdd7r0m', 1775710523, 'modx.user.contextTokens|a:0:{}'),
('g6g1vrgm8d3nid9pagnol1738r', 1776381714, 'modx.user.contextTokens|a:0:{}'),
('g9vn1vage6q3o9ci9f7atdomie', 1775975566, 'modx.user.contextTokens|a:0:{}'),
('gaepmdval7b5s1v7l1qh6ligro', 1775878767, 'modx.user.contextTokens|a:0:{}'),
('gbgk2qibkim2jqtm25nqpuupd0', 1776297828, 'modx.user.contextTokens|a:0:{}'),
('gcpof3iee5ojtg9enmnosi7k07', 1776406624, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('gdb7vj4cf1vjdrroonj0tnva1p', 1775966603, 'modx.user.contextTokens|a:0:{}'),
('gdq5qq9j2u5c2ujlltk4497d3m', 1775288900, 'modx.user.contextTokens|a:0:{}'),
('gdr4ounr47hb2fi4d4pes1mg0a', 1775968710, 'modx.user.contextTokens|a:0:{}'),
('ge6ucbci93a20n593eng74osbh', 1775709566, 'modx.user.contextTokens|a:0:{}'),
('gf8v2ajo315e91kj1n9j2hshu2', 1776186873, 'modx.user.contextTokens|a:0:{}'),
('ghcdhdbf8hjlc1h7li4aqobfph', 1775268174, 'modx.user.contextTokens|a:0:{}'),
('gi98p155vfkndfhf8m6r1iv958', 1775551887, 'modx.user.contextTokens|a:0:{}'),
('giqg015m7fva3gqqosgomdtigb', 1775698791, 'modx.user.contextTokens|a:0:{}'),
('gkq0t7nmc5jl8kllaj6p4k5vo9', 1775908100, 'modx.user.contextTokens|a:0:{}'),
('glk9b65hiaapgtp4qbnn2tfr06', 1776365944, 'modx.user.contextTokens|a:0:{}'),
('glnmosg06mog8ifu4pff12lk9p', 1775821313, 'modx.user.contextTokens|a:0:{}'),
('gmkvielhi05tkp1tnilhhtekr0', 1775810880, 'modx.user.contextTokens|a:0:{}');
INSERT INTO `modxwl_session` (`id`, `access`, `data`) VALUES
('gmtvds2h08vrd9dt9lcu128sh4', 1776206672, 'modx.user.contextTokens|a:0:{}'),
('gnrmmbk0kquvka23lp2j40epbj', 1775305049, 'modx.user.contextTokens|a:0:{}'),
('godf8qadai7ar3ni069tf03k47', 1776364585, 'modx.user.contextTokens|a:0:{}'),
('goir8vu5fhtqvevtr7qlhr96f9', 1775733350, 'modx.user.contextTokens|a:0:{}'),
('gs94hec1g6saapni2tgf1bhp8i', 1776290294, 'modx.user.contextTokens|a:0:{}'),
('gsagonm2c406pcar5n4cko96s6', 1775787795, 'modx.user.contextTokens|a:0:{}'),
('gtvuhbv7ju7fa4u8cs4la2kfql', 1776381698, 'modx.user.contextTokens|a:0:{}'),
('gv577f2l6e0ulnf2118tqasm4e', 1775545838, 'modx.user.contextTokens|a:0:{}'),
('gv8he3q1j84568un7gk3edqdb6', 1775839019, 'modx.user.contextTokens|a:0:{}'),
('gvithoehrcaeoh1grhln07mgaa', 1775209181, 'modx.user.contextTokens|a:0:{}'),
('h1hvfbhto28ok1s0iqqkb68hdv', 1776268973, 'modx.user.contextTokens|a:0:{}'),
('h1trgvb4k27tp62jp2ko10tvl2', 1775132699, 'modx.user.contextTokens|a:0:{}'),
('h3hef1fug1v8j0semt76tsg5l9', 1775995595, 'modx.user.contextTokens|a:0:{}'),
('h6sve5i5jfg273grn3gihu6fnf', 1775936218, 'modx.user.contextTokens|a:0:{}'),
('hahcehcn5frk43spt0o9s4j7vg', 1775350887, 'modx.user.contextTokens|a:0:{}'),
('hca17t32n5uu4c6m6q70e4kamh', 1775485160, 'modx.user.contextTokens|a:0:{}'),
('hcfq6n00ftac79b5nacq7q3sb0', 1775710538, 'modx.user.contextTokens|a:0:{}'),
('hd8ah72dq9e30ngq3mrhfp93om', 1775140524, 'modx.user.contextTokens|a:0:{}'),
('hiducdbep20gd4j0d7amqhgout', 1775442731, 'modx.user.contextTokens|a:0:{}'),
('hj0pb9vqb3n19vk4hfu5mhtsbu', 1775554641, 'modx.user.contextTokens|a:0:{}'),
('hj1db7svrk3mc773bkbnedechr', 1775159531, 'modx.user.contextTokens|a:0:{}'),
('hj98g3p1n0h7tmkt639eslsn6r', 1776352835, 'modx.user.contextTokens|a:0:{}'),
('hjvg7g2k12p4jmarnua7l3a8a9', 1776259224, 'modx.user.contextTokens|a:0:{}'),
('hks56kutte38s691k73gv0cdjm', 1775628767, 'modx.user.contextTokens|a:0:{}'),
('hr8rtkk0alrulghggej6qduktd', 1775725313, 'modx.user.contextTokens|a:0:{}'),
('hrqpktl9ecvrdr7q2h7hop8jtq', 1776392944, 'modx.user.contextTokens|a:0:{}'),
('hrufk6oj04vh1dgil3kutjtcbq', 1775314335, 'modx.user.contextTokens|a:0:{}'),
('hs2p8bu279go9nmnilc3hj0n63', 1775514789, 'modx.user.contextTokens|a:0:{}'),
('hs92vdnkuv13h9ekiragntddpc', 1775367637, 'modx.user.contextTokens|a:0:{}'),
('htt75qhcfffm09r511q9eil9rs', 1776138957, 'modx.user.contextTokens|a:0:{}'),
('hu2uco2blvapckg4f9nv5la394', 1775156728, 'modx.user.contextTokens|a:0:{}'),
('hu3og64301erlbp9rgadhnflp4', 1775406780, 'modx.user.contextTokens|a:0:{}'),
('hu6dj3bv32qsf27boknm45l98n', 1775885305, 'modx.user.contextTokens|a:0:{}'),
('hv412qfr11hhkkv1unm4h7osl0', 1776297162, 'modx.user.contextTokens|a:0:{}'),
('hvk42si4t41pvrhmqgmlgormc0', 1775744080, 'modx.user.contextTokens|a:0:{}'),
('i1mp452jdq1729qngin54b2tc8', 1775291705, 'modx.user.contextTokens|a:0:{}'),
('i2tf8b829llle9nmo3g8eivbif', 1775145661, 'modx.user.contextTokens|a:0:{}'),
('i37c04c38l9e16nejkbs4r226m', 1775573549, 'modx.user.contextTokens|a:0:{}'),
('i5g9f10ct8bti9iprk75n5hhfj', 1775895887, 'modx.user.contextTokens|a:0:{}'),
('i8g4d89v2okh09hkfro8qqmt82', 1775901437, 'modx.user.contextTokens|a:0:{}'),
('ialgv7fufp7hc92scd1dpvaqd8', 1775839006, 'modx.user.contextTokens|a:0:{}'),
('idkiif4qjo22sebeefmgm2vpvi', 1775724847, 'modx.user.contextTokens|a:0:{}'),
('ie23p19ta8e8g33e78el65og3i', 1775911517, 'modx.user.contextTokens|a:0:{}'),
('ie7hpr6ef2296m2o68qbv4lu2t', 1776336806, 'modx.user.contextTokens|a:0:{}'),
('iejdb969or504ikae3vu1vv7r2', 1776019546, 'modx.user.contextTokens|a:0:{}'),
('igr5dlerq4brl5egcrqknpokpv', 1776244858, 'modx.user.contextTokens|a:0:{}'),
('ih172iarlp659moggsulnhq7bm', 1775826243, 'modx.user.contextTokens|a:0:{}'),
('ihtqq2qu77ntijgnjsrmiisbha', 1775211972, 'modx.user.contextTokens|a:0:{}'),
('iin3g1kmce7o1adn3hp5ivnmeh', 1776107100, 'modx.user.contextTokens|a:0:{}'),
('ijklu13lcp3bku2k4b17rjt4ce', 1775410029, 'modx.user.contextTokens|a:0:{}'),
('ikjd951u9n7krq53imbjbolov7', 1776325228, 'modx.user.contextTokens|a:0:{}'),
('il45qjtkd8ns98q81ugq5lnlbs', 1775731517, 'modx.user.contextTokens|a:0:{}'),
('im7ct78pf6o2lmo8ri6og9plbo', 1775623599, 'modx.user.contextTokens|a:0:{}'),
('immsl0m1tfcm4k5p2sav1npqsc', 1775640696, 'modx.user.contextTokens|a:0:{}'),
('ink53bgb43hs1diik2raorlo4s', 1776011914, 'modx.user.contextTokens|a:0:{}'),
('io55aui1paeitvca9jvjvl9iam', 1776049566, 'modx.user.contextTokens|a:0:{}'),
('iodd1vqsn3ijfbq98jj58dirn7', 1776327436, 'modx.user.contextTokens|a:0:{}'),
('ipmctbrfcjc06h9tss7du737lm', 1775451004, 'modx.user.contextTokens|a:0:{}'),
('iprshfpaoihbcku1843qf1qh6t', 1776253866, 'modx.user.contextTokens|a:0:{}'),
('iq8ghl408qkj80pimr8euaqfpf', 1775469767, 'modx.user.contextTokens|a:0:{}'),
('ir17fb1d7lvkj4r6m4g0k6naos', 1775439134, 'modx.user.contextTokens|a:0:{}'),
('ir1r5dkoc38ttvpbj60b74oko0', 1776020021, 'modx.user.contextTokens|a:0:{}'),
('iropisif527gm9gbqnde94sgdq', 1775566912, 'modx.user.contextTokens|a:0:{}'),
('it1ngdvtvlb3lib8hs16ttu5f4', 1775649958, 'modx.user.contextTokens|a:0:{}'),
('ithdhbj5phgjagvp1f0lh02316', 1775905223, 'modx.user.contextTokens|a:0:{}'),
('j096hd36c7382rgd8pqmhnthct', 1776133974, 'modx.user.contextTokens|a:0:{}'),
('j0sq1g2u5pnaepdc6coel6lold', 1775167526, 'modx.user.contextTokens|a:0:{}'),
('j1lfnaftgimclrre89k7agjcle', 1775643930, 'modx.user.contextTokens|a:0:{}'),
('j1rf53sn6qnun0ickvfutmrtgv', 1775850953, 'modx.user.contextTokens|a:0:{}'),
('j3qt22a15baed0j4m15h880ffv', 1776235959, 'modx.user.contextTokens|a:0:{}'),
('j6au19pcsor1tert81j7ftj1cp', 1775887031, 'modx.user.contextTokens|a:0:{}'),
('j6o01bk9rqabc16sc2nkuf3sng', 1775752120, 'modx.user.contextTokens|a:0:{}'),
('j79qlgvmemo31d5fls4hh1v0g0', 1775293107, 'modx.user.contextTokens|a:0:{}'),
('j8uj1hiqkcuohiufg6jkkugl9v', 1775351842, 'modx.user.contextTokens|a:0:{}'),
('j97h2gd0gh805kve0tb0s27i10', 1776002115, 'modx.user.contextTokens|a:0:{}'),
('jbfu0f54n3udoe71ui2ma59pcr', 1775708854, 'modx.user.contextTokens|a:0:{}'),
('jcgbje8s6g747mro13ekgaudj5', 1775698857, 'modx.user.contextTokens|a:0:{}'),
('jcicphs8n7s39hak68sib1adf5', 1775613471, 'modx.user.contextTokens|a:0:{}'),
('jcskg9ifk5ladl28o8iocm92f0', 1775875802, 'modx.user.contextTokens|a:0:{}'),
('jd3vp7ph45j5147goadsu4bkpq', 1776381703, 'modx.user.contextTokens|a:0:{}'),
('jdhotac1sanj8je9bajaakeq0n', 1776164977, 'modx.user.contextTokens|a:0:{}'),
('jdq49b8vrug5dab8n6sb03njug', 1775921917, 'modx.user.contextTokens|a:0:{}'),
('jeb10hq9gh7n2kfdmc54degm9v', 1775623599, 'modx.user.contextTokens|a:0:{}'),
('jed5t5ofel56nnntoar2ioj8rk', 1775971127, 'modx.user.contextTokens|a:0:{}'),
('jeqdgnfcl9kdnrvd8a5e2usmai', 1776324970, 'modx.user.contextTokens|a:0:{}'),
('jfpk769galbvgrnl9qgnqjb8m8', 1776001858, 'modx.user.contextTokens|a:0:{}'),
('jfq4hu85e5bjquqsckfjibfe5p', 1776340339, 'modx.user.contextTokens|a:0:{}'),
('jfrmunc7dumj10e3ctpd6plj60', 1775822862, 'modx.user.contextTokens|a:0:{}'),
('jft4gdia6ekfbfc5ce88jj5hmr', 1776135171, 'modx.user.contextTokens|a:0:{}'),
('jgn42uic4l8ckr3chjcmj6ps10', 1775891929, 'modx.user.contextTokens|a:0:{}'),
('jgo77n7o447cbsfjiufvd56g9u', 1775452181, 'modx.user.contextTokens|a:0:{}'),
('jh5jf1cupm1g6k5jui3grrgpdn', 1775805090, 'modx.user.contextTokens|a:0:{}'),
('jh6fnludjgtli56ghgf2qgfhs9', 1776323214, 'modx.user.contextTokens|a:0:{}'),
('jipd9acdevsnos43etoh06i069', 1775178582, 'modx.user.contextTokens|a:0:{}'),
('jit6qomn64j98plflcnhjun27k', 1775627327, 'modx.user.contextTokens|a:0:{}'),
('jk1r15cibjcblb5n3b01su106m', 1775378880, 'modx.user.contextTokens|a:0:{}'),
('jm395oktiol69tgerkmtb7pm44', 1775509469, 'modx.user.contextTokens|a:0:{}'),
('jmasq7rvsom2n3hiksvv79qgdb', 1776381697, 'modx.user.contextTokens|a:0:{}'),
('jn4f95r4beqcthq05skpi2pk8g', 1775586000, 'modx.user.contextTokens|a:0:{}'),
('jnnrnlj8bffc7tmkpm3f8o2isc', 1775247183, 'modx.user.contextTokens|a:0:{}'),
('jntfhi62do8krmrc3qjgtsl1d5', 1775971714, 'modx.user.contextTokens|a:0:{}'),
('jrvsi902sqtnjahmuqfvickds1', 1775290621, 'modx.user.contextTokens|a:0:{}'),
('jsqj8e0tnjbhle3vglq07hp4cs', 1776334512, 'modx.user.contextTokens|a:0:{}'),
('jtkti1l71fsukjmd164l7b0krn', 1775436204, 'modx.user.contextTokens|a:0:{}'),
('jtp1tlb5nm2av9qe1nc1roarjn', 1775324626, 'modx.user.contextTokens|a:0:{}'),
('jug4t78vuaa8mfqo99bu4uifof', 1775591348, 'modx.user.contextTokens|a:0:{}'),
('k0p1rm75fo13msvsbir92scdf4', 1775159353, 'modx.user.contextTokens|a:0:{}'),
('k15et7qaamu0i7sj1ibq8he0r7', 1775365565, 'modx.user.contextTokens|a:0:{}'),
('k1cujejc8g0tctaerl9ms7f6va', 1775726017, 'modx.user.contextTokens|a:0:{}'),
('k1k3tthqlr726u2grskdpg40oo', 1776089967, 'modx.user.contextTokens|a:0:{}'),
('k228e87j6d5t9r3v82sa17tt2f', 1775814895, 'modx.user.contextTokens|a:0:{}'),
('k31igvb0t2gc11vf5mb3mm4n2q', 1776095423, 'modx.user.contextTokens|a:0:{}'),
('k330pik3j9nl68t3rla896fh19', 1775733353, 'modx.user.contextTokens|a:0:{}'),
('k3h1omec39b98v626ul2fgn630', 1775837264, 'modx.user.contextTokens|a:0:{}'),
('k4m73jgkjpbsmg9ju608o9fr1l', 1775994755, 'modx.user.contextTokens|a:0:{}'),
('k4pdfjr9b5cscm47edd4m54nce', 1775814319, 'modx.user.contextTokens|a:0:{}'),
('k57gitcthskm04oipr3vhvla26', 1775662470, 'modx.user.contextTokens|a:0:{}'),
('k58h6fs4h48rd0s4id9sovqs68', 1775976563, 'modx.user.contextTokens|a:0:{}'),
('k5h6mn82gpsjhofqpt7g48r5j5', 1776082040, 'modx.user.contextTokens|a:0:{}'),
('k7daujed409jsmq229747dkuo0', 1776192898, 'modx.user.contextTokens|a:0:{}'),
('k7mamr97njmh330772t8rrg82h', 1775642396, 'modx.user.contextTokens|a:0:{}'),
('k800gugka4cal4ar3lfqbta1g5', 1776386129, 'modx.user.contextTokens|a:0:{}'),
('k8m358fi0quo042fa6bdcdpg5p', 1776261433, 'modx.user.contextTokens|a:0:{}'),
('k91ci4ls1s7n1sctdo9itduvl1', 1775324626, 'modx.user.contextTokens|a:0:{}'),
('kb9lokb7hhgmq4m5ii1j04lrrf', 1775912881, 'modx.user.contextTokens|a:0:{}'),
('kcdmak9f0c6f03e52j8o9t4qv8', 1775270890, 'modx.user.contextTokens|a:0:{}'),
('kcgjlr8uu5r5lna8c0lk4grq4j', 1776204293, 'modx.user.contextTokens|a:0:{}'),
('kf2baq49mtr384d7rotkeuluf2', 1775228644, 'modx.user.contextTokens|a:0:{}'),
('kfbrpghuef05ljdfkaeqida4re', 1775273721, 'modx.user.contextTokens|a:0:{}'),
('kflem267v05qfkav5l9s3j1qi5', 1775987348, 'modx.user.contextTokens|a:0:{}'),
('kgpt7v98d8nrqej9seida1kv1k', 1775553370, 'modx.user.contextTokens|a:0:{}'),
('kiukvbmv4hrqqpc20bp8gqnqv3', 1775913823, 'modx.user.contextTokens|a:0:{}'),
('kj7mvvlu9amn71r9gk43gpvrfs', 1775825106, 'modx.user.contextTokens|a:0:{}'),
('kjba2h2kd71gk53hr5k1useokq', 1775301816, 'modx.user.contextTokens|a:0:{}'),
('kko27lef0isgi6pr0hc7kt5thm', 1775371581, 'modx.user.contextTokens|a:0:{}'),
('kl0d10mf8ckjo6qmdu3vv4v7fd', 1775819427, 'modx.user.contextTokens|a:0:{}'),
('klbnblqil4kholegrp9nigdfvb', 1775254700, 'modx.user.contextTokens|a:0:{}'),
('kn3cr25pbf3o0ef05dsfdmmi1p', 1776239940, 'modx.user.contextTokens|a:0:{}'),
('kn7rkci2q1866qureeh3tkrbsc', 1776046111, 'modx.user.contextTokens|a:0:{}'),
('kn990t6hotor5b833qsl76fpnr', 1775141547, 'modx.user.contextTokens|a:0:{}'),
('knmmf1ih8c9clclo4amtqqsoue', 1776156919, 'modx.user.contextTokens|a:0:{}'),
('kor70ef9ippsvis00co8ibo10t', 1776369300, 'modx.user.contextTokens|a:0:{}'),
('kptk6fdhtc6dom9a43egshv92j', 1775156729, 'modx.user.contextTokens|a:0:{}'),
('kqq666m56u96otrssb4f3drmfc', 1775680787, 'modx.user.contextTokens|a:0:{}'),
('kqs8g4du65aeb2usu22415sc66', 1776112931, 'modx.user.contextTokens|a:0:{}'),
('ks3rs2119a8f8v5mbgjsm5h4n1', 1775649134, 'modx.user.contextTokens|a:0:{}'),
('ksadi956knm8cqkid0n069u5jg', 1775828444, 'modx.user.contextTokens|a:0:{}'),
('ksgmh4oj1g9v9953cq5cf44fct', 1775503474, 'modx.user.contextTokens|a:0:{}'),
('ku2unt4toi2evbeguds6s8irpc', 1776039023, 'modx.user.contextTokens|a:0:{}'),
('kvqgofp9nr35ebvk75o9bh7d0r', 1775610782, 'modx.user.contextTokens|a:0:{}'),
('kvtq1s8dujn9qvd829lhj9r9ov', 1775764138, 'modx.user.contextTokens|a:0:{}'),
('l09n0ocbr75p3c1a48drv06dcq', 1776363007, 'modx.user.contextTokens|a:0:{}'),
('l19oov1dp4llkddq4tgpb4de1s', 1775913150, 'modx.user.contextTokens|a:0:{}'),
('l27qkrclsrdpgivcu6s7ktklkl', 1775227311, 'modx.user.contextTokens|a:0:{}'),
('lb4flaqpiutrdfqofqq49gqlos', 1775394146, 'modx.user.contextTokens|a:0:{}'),
('lbln99cb57plci8e07qusqrl64', 1775619393, 'modx.user.contextTokens|a:0:{}'),
('lc4s4shhmk9j3pk20e9sptql0l', 1776017663, 'modx.user.contextTokens|a:0:{}'),
('ldm46mumcspv2gv531ibh4b33s', 1775617602, 'modx.user.contextTokens|a:0:{}'),
('ldsh2rqj53pp156gs0ktk12c0l', 1776187751, 'modx.user.contextTokens|a:0:{}'),
('leg6mofp2vago64e5g7ljdn5c8', 1775374818, 'modx.user.contextTokens|a:0:{}'),
('lesddlmlvt6ghu5dpv5varvisi', 1776168786, 'modx.user.contextTokens|a:0:{}'),
('lflqnc6hl2q7ff8smrmlrlr884', 1775662476, 'modx.user.contextTokens|a:0:{}'),
('lg9tmkvgehikp0p79htauiqa87', 1775938943, 'modx.user.contextTokens|a:0:{}'),
('lgd8n64dmjsb5d5394km5lmf04', 1776035927, 'modx.user.contextTokens|a:0:{}'),
('lhchp692j2ngmri9dnaqsg0390', 1775430394, 'modx.user.contextTokens|a:0:{}'),
('lisnqpvgmetlo6nidienktbt8u', 1776341627, 'modx.user.contextTokens|a:0:{}'),
('lj339ptq85kiq39uvge5te3s1a', 1775658902, 'modx.user.contextTokens|a:0:{}'),
('lj87i6ne6vcttiuhbc05274as7', 1775347229, 'modx.user.contextTokens|a:0:{}'),
('ljq9vujq0s7miusfvpdanjdqmd', 1775829728, 'modx.user.contextTokens|a:0:{}'),
('lkq8pbun7k6o9ojtlfnhilhg04', 1775356892, 'modx.user.contextTokens|a:0:{}'),
('llbcok0p8c0u170et7a2bul7ln', 1775229990, 'modx.user.contextTokens|a:0:{}'),
('lmbeo0g3r5t3h14gjb9l51583g', 1775731322, 'modx.user.contextTokens|a:0:{}'),
('lmsoeb2poi1o8enh12esshs0q8', 1776312945, 'modx.user.contextTokens|a:0:{}'),
('lnv1n947s9rf4tkd06892l3nel', 1775975200, 'modx.user.contextTokens|a:0:{}'),
('lo7ps9rqt6es5kr9uicj752akg', 1776039325, 'modx.user.contextTokens|a:0:{}'),
('lo9bdeslv795sb4kl08smk167s', 1776054743, 'modx.user.contextTokens|a:0:{}'),
('lodq67q18c27s9c8h480vh22bo', 1775971122, 'modx.user.contextTokens|a:0:{}'),
('lp1iim0qvvqt9j5s2o6m1h2up9', 1775421917, 'modx.user.contextTokens|a:0:{}'),
('lpoj0kq5qha8t64d9ijhl2p47o', 1776138957, 'modx.user.contextTokens|a:0:{}'),
('lq4boidr142utm8ht9eij3dufu', 1776138957, 'modx.user.contextTokens|a:0:{}'),
('lr8iin71g373ceuipd9bq5a9u4', 1775770514, 'modx.user.contextTokens|a:0:{}'),
('lrcst13ilcqdn4k2berfrfjh6h', 1775475307, 'modx.user.contextTokens|a:0:{}'),
('lrl2tvjifn1udmetsbvfjg7a64', 1775357281, 'modx.user.contextTokens|a:0:{}'),
('lssfc690kbk433dalqi4qj9731', 1775865333, 'modx.user.contextTokens|a:0:{}'),
('lssn1vnq4pgrhj7k0gb59lat6o', 1775371673, 'modx.user.contextTokens|a:0:{}'),
('lt5agasm4gd3pdrttad0a26388', 1775493940, 'modx.user.contextTokens|a:0:{}'),
('ltrtuac34qb6tvo3si3ueahd7j', 1776325227, 'modx.user.contextTokens|a:0:{}'),
('lu5a3q4bpahv2p8gbb9jdire5s', 1775349530, 'modx.user.contextTokens|a:0:{}'),
('lunq58jngo2mfpnk02vodrhorp', 1775947676, 'modx.user.contextTokens|a:0:{}'),
('m2u1hli2na4matcrvk7bej4nno', 1776025873, 'modx.user.contextTokens|a:0:{}'),
('m2vntkkvu94dkm4bciohrbp5h4', 1776236211, 'modx.user.contextTokens|a:0:{}'),
('m386kosjr65ljlhjokksmtonmc', 1776028019, 'modx.user.contextTokens|a:0:{}'),
('m62po97oirqstvijeriijipgq8', 1776407231, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('m68gb5o8osdjn9sa3i8sllfut7', 1775984590, 'modx.user.contextTokens|a:0:{}'),
('m8trqabarimkg0cnf350m8lkpe', 1775757534, 'modx.user.contextTokens|a:0:{}'),
('m9nu647do9atvhrg9g1r7tgkkn', 1775695983, 'modx.user.contextTokens|a:0:{}'),
('mb7jveh1b28uro88hn2ofjvcnb', 1775658151, 'modx.user.contextTokens|a:0:{}'),
('mdblvg7ea5rqt0bknplf1g3uam', 1776128930, 'modx.user.contextTokens|a:0:{}'),
('mdd57i1ajktfjvre08ndnp7sb9', 1775178593, 'modx.user.contextTokens|a:0:{}'),
('mh9k9l68lm08u0ur55emki7o36', 1775451002, 'modx.user.contextTokens|a:0:{}'),
('mhf4l745l5pr6ocaltsfhbqpou', 1775330714, 'modx.user.contextTokens|a:0:{}'),
('mj5h5vrolufl5cfj7bjq495ucp', 1775682831, 'modx.user.contextTokens|a:0:{}'),
('mjm7tni0lp6ieanscub6du64uo', 1776300215, 'modx.user.contextTokens|a:0:{}'),
('mjp8chjj7bmbtl1nfiq230rabe', 1776064463, 'modx.user.contextTokens|a:0:{}'),
('ml8tetd1u4h1o7ng91no2j65jo', 1775552080, 'modx.user.contextTokens|a:0:{}'),
('mlatn06o1clnic3emf1cga0h9t', 1776196885, 'modx.user.contextTokens|a:0:{}'),
('mljsrmjnbmemo17sl8ssdct2rh', 1776098752, 'modx.user.contextTokens|a:0:{}'),
('mms0uf3bob2pno2r1tnc3ao0l5', 1776222119, 'modx.user.contextTokens|a:0:{}'),
('mn51b7ddttbbk566hpl1els148', 1775697946, 'modx.user.contextTokens|a:0:{}'),
('mn5shdloets3ikq3m3ptm4ranb', 1775821735, 'modx.user.contextTokens|a:0:{}'),
('mn9n1kb6uj90jb2rgfhd7uitbf', 1775347238, 'modx.user.contextTokens|a:0:{}'),
('mnoh3c9u8uge288td3m32t1cp6', 1775443244, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('mo77ursjfggkih7me6frlcp8os', 1775196334, 'modx.user.contextTokens|a:0:{}'),
('mor4csvvbd6o4717k8srdp7ved', 1776094660, 'modx.user.contextTokens|a:0:{}'),
('mpi8ca3ahqtkvkhp97v5rdgrei', 1776278815, 'modx.user.contextTokens|a:0:{}'),
('mqndcs3pobntgt8il353k1ka0i', 1775195077, 'modx.user.contextTokens|a:0:{}'),
('mr66vo02jsm4mid2dsms998v37', 1776406437, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('mr8plva6ersif9gkfgtu64125m', 1776379372, 'modx.user.contextTokens|a:0:{}'),
('mrcb5686n1ta3ihqarsns811dj', 1776230104, 'modx.user.contextTokens|a:0:{}'),
('mrrtr1refrb1e3d7jhseqj34md', 1776343909, 'modx.user.contextTokens|a:0:{}'),
('ms3icqfq2gl1icjf5a6si6lksm', 1776409163, 'modx.user.contextTokens|a:0:{}'),
('msa7nc8uhh9lbnosp2ekieqj4t', 1775753202, 'modx.user.contextTokens|a:0:{}'),
('mspodjru4kt7a0k9gmckpq298m', 1775635525, 'modx.user.contextTokens|a:0:{}'),
('msq26dc001a4g11eq95e1deudr', 1775460731, 'modx.user.contextTokens|a:0:{}'),
('mtfbrjnvfdh9ppuqeodgl6ouku', 1775201328, 'modx.user.contextTokens|a:0:{}'),
('mue7qau0h08c69dldilaaemk4p', 1775501627, 'modx.user.contextTokens|a:0:{}'),
('mumte1b62ihl0j7pnd179e92f9', 1776277013, 'modx.user.contextTokens|a:0:{}'),
('mupbsvfri3tqv917ug3htterb5', 1775828159, 'modx.user.contextTokens|a:0:{}'),
('muvhkk886u1cil7ao8ub6h2en9', 1776332389, 'modx.user.contextTokens|a:0:{}'),
('n0biepst8o737bup84ehh6jupi', 1775192431, 'modx.user.contextTokens|a:0:{}'),
('n1j29jgi84rivk726mr8rfdequ', 1776367233, 'modx.user.contextTokens|a:0:{}'),
('n23dgv8na36kg61p5h623m287l', 1775585665, 'modx.user.contextTokens|a:0:{}'),
('n2opr15i5juj18i5he9vuv7fnm', 1775681666, 'modx.user.contextTokens|a:0:{}'),
('n2q37egjse48ee2tedpkrpjf8k', 1775291563, 'modx.user.contextTokens|a:0:{}'),
('n30n8qtofvkt9q81mojl67t7lu', 1775822466, 'modx.user.contextTokens|a:0:{}'),
('n4slohhhgvhu184b5g0kt51tmm', 1776075710, 'modx.user.contextTokens|a:0:{}'),
('n4ut4spd99dktm693ipb31nb6e', 1775232832, 'modx.user.contextTokens|a:0:{}'),
('n64v6a2g85ps05kj8r3gl61666', 1775605285, 'modx.user.contextTokens|a:0:{}'),
('nan2boksiojcli5cbua7ko9qo3', 1775471004, 'modx.user.contextTokens|a:0:{}'),
('nb7rjbr51vkp1loliukkf8sblh', 1776371750, 'modx.user.contextTokens|a:0:{}'),
('ncutp4t0mjpk8ndcapaoismhue', 1775324625, 'modx.user.contextTokens|a:0:{}'),
('ne10gh1tj4crm37sng4nn5sbpv', 1776321220, 'modx.user.contextTokens|a:0:{}'),
('nf5cuf0mfusajgb103o1agt1ol', 1775136192, 'modx.user.contextTokens|a:0:{}'),
('ngdjc40lt5r04o3a66oao5jgvj', 1775935284, 'modx.user.contextTokens|a:0:{}'),
('ngfmd5lg38mq7neaf0rj27fmeo', 1775438033, 'modx.user.contextTokens|a:0:{}'),
('nh4qdeodb125p8ul3khf8jl7hb', 1775946811, 'modx.user.contextTokens|a:0:{}'),
('ni6sqago8jtgg8dq4lrbmklhu0', 1776065925, 'modx.user.contextTokens|a:0:{}'),
('nifk26rhoac76b768cle0qla4k', 1775837421, 'modx.user.contextTokens|a:0:{}'),
('nj9lp3qto6r7v7glr1401fdoda', 1776253543, 'modx.user.contextTokens|a:0:{}'),
('nknuqsn4pg8lru3gfmtrlk1pgp', 1775290322, 'modx.user.contextTokens|a:0:{}'),
('nm2hcb56cen4cmtbegsfl7uiha', 1776037094, 'modx.user.contextTokens|a:0:{}'),
('nn9ocdogfhtt88r6ih0smjd18m', 1775907739, 'modx.user.contextTokens|a:0:{}'),
('nnj822lin98hn9o6968b63d15n', 1776017607, 'modx.user.contextTokens|a:0:{}'),
('no28fv65el3oojhek0k1v37q9p', 1776344149, 'modx.user.contextTokens|a:0:{}'),
('no8lec8jgusog9v2nshh6aijh4', 1775666261, 'modx.user.contextTokens|a:0:{}'),
('noigrg6ghdv696h3q3iv4v25nb', 1775674442, 'modx.user.contextTokens|a:0:{}'),
('np80ah5fabc4rim5gtqo1o6q0k', 1776051130, 'modx.user.contextTokens|a:0:{}'),
('npfqca32q5bmlqpojscj2vfbfr', 1776151773, 'modx.user.contextTokens|a:0:{}'),
('nrdplrdo0lji06qpe16t5kmdcg', 1775357306, 'modx.user.contextTokens|a:0:{}'),
('ns36c22a7aqkksuqptedn05bl3', 1775733349, 'modx.user.contextTokens|a:0:{}'),
('nt7llebg9h21d1615gcehpmg1p', 1775684175, 'modx.user.contextTokens|a:0:{}'),
('nti9i209kaneg7ubjm209jahke', 1775488712, 'modx.user.contextTokens|a:0:{}'),
('ntrorjfisrrv4uhqn1vamcl2om', 1775316296, 'modx.user.contextTokens|a:0:{}'),
('nu7nh7ti4pcbpon76aer7rjcdr', 1775316352, 'modx.user.contextTokens|a:0:{}'),
('nuhk03qg9jvui6sdt16585qaq2', 1776224551, 'modx.user.contextTokens|a:0:{}'),
('nuk5qb9hb603npgeqbfba7n1f7', 1775880194, 'modx.user.contextTokens|a:0:{}'),
('nul8t5cld8d3bldj30nlenr7cs', 1775930428, 'modx.user.contextTokens|a:0:{}'),
('nunus14f92epi9boukd4e39nl7', 1775282290, 'modx.user.contextTokens|a:0:{}'),
('o049a40sp0k66ddt542sgp129c', 1775818066, 'modx.user.contextTokens|a:0:{}'),
('o0j9ac98kr7emhgttno2nn2bn5', 1775633435, 'modx.user.contextTokens|a:0:{}'),
('o15h96m90qcsjhd7jqf9qasjvv', 1775584831, 'modx.user.contextTokens|a:0:{}'),
('o38i1an4qu7ohc4m0bjnif2i1f', 1775627839, 'modx.user.contextTokens|a:0:{}'),
('o47hl5v42t11po2fo4ouihguif', 1776263814, 'modx.user.contextTokens|a:0:{}'),
('o5djcta7d5u3i35dcioqr7847c', 1775967926, 'modx.user.contextTokens|a:0:{}'),
('o67oh3heqq1bh93hrlmhhf35hc', 1775532599, 'modx.user.contextTokens|a:0:{}'),
('o6i93tneilmh09v1heahbqqhua', 1775449614, 'modx.user.contextTokens|a:0:{}'),
('o6iu4c382q673o0hq09u3algej', 1775633789, 'modx.user.contextTokens|a:0:{}'),
('o713femee3n460rhrhctv3nbrn', 1775766806, 'modx.user.contextTokens|a:0:{}'),
('o7jn00o1h4derm6rqmmsuq1519', 1775259880, 'modx.user.contextTokens|a:0:{}'),
('o9e10mt3d3p8kb7r3r1mh05cps', 1776118208, 'modx.user.contextTokens|a:0:{}'),
('oaqfhf95o20jvjjtq5v679g6ro', 1775372975, 'modx.user.contextTokens|a:0:{}'),
('ob71juo13eohqnkru1b326aeaa', 1776249818, 'modx.user.contextTokens|a:0:{}'),
('od78fphffc6k92a8ob9v1a1uj9', 1775223836, 'modx.user.contextTokens|a:0:{}'),
('oft4reer0li0hajg8p0dmlgb5q', 1775577847, 'modx.user.contextTokens|a:0:{}'),
('ofu10lh9213hgrnr3n6fr88re4', 1775358021, 'modx.user.contextTokens|a:0:{}'),
('ogce2ouqm210asbbv4b0mlj041', 1776006034, 'modx.user.contextTokens|a:0:{}'),
('ogql31n2cv9lft3ujkttc1800g', 1776263246, 'modx.user.contextTokens|a:0:{}'),
('ogsq7u19s5vin717d9ket9mjhp', 1776171068, 'modx.user.contextTokens|a:0:{}'),
('oia4f8c6nuk8jv7imnsjspnbb7', 1776198452, 'modx.user.contextTokens|a:0:{}'),
('oidpugtrgavu4qmgch8oripi1a', 1775631096, 'modx.user.contextTokens|a:0:{}'),
('ojng830lni14736ltr1645331i', 1776056916, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('okaldtdiiefbd7a13r4lmtb34f', 1775838923, 'modx.user.contextTokens|a:0:{}'),
('ol60hbjh4p8880mb9smtt9rg9j', 1776138956, 'modx.user.contextTokens|a:0:{}'),
('omc4vjm4e8vo27i58271qlt80l', 1775411109, 'modx.user.contextTokens|a:0:{}'),
('on67fojntg4c9oakg0qbhmvblh', 1775270913, 'modx.user.contextTokens|a:0:{}'),
('onjk494al7v2b929scpmgdskp4', 1775192395, 'modx.user.contextTokens|a:0:{}'),
('ooj9agmu7387bcu2h3o2i8v8nm', 1775815164, 'modx.user.contextTokens|a:0:{}'),
('ookolvnamrq7mijl74n4v3arh5', 1776328821, 'modx.user.contextTokens|a:0:{}'),
('op72mtbm9bpkvhhsbqgb12kvm9', 1776198453, 'modx.user.contextTokens|a:0:{}'),
('opnnqreglu8fdkr2tlr9km077p', 1776019688, 'modx.user.contextTokens|a:0:{}'),
('opud8sc0nuttulodp50se03lmc', 1776151338, 'modx.user.contextTokens|a:0:{}'),
('oqp642d0fbgdeqt4eh133rq883', 1775451006, 'modx.user.contextTokens|a:0:{}'),
('or6o4tbvddobrts2lfln325c8v', 1775656859, 'modx.user.contextTokens|a:0:{}'),
('oscclif3mji817dvjj7mfbljum', 1775567870, 'modx.user.contextTokens|a:0:{}'),
('ot50te8489bas5dk2cetth24b5', 1775643985, 'modx.user.contextTokens|a:0:{}'),
('ouau98l66jm474q7cn62tud73c', 1775597776, 'modx.user.contextTokens|a:0:{}'),
('ovof23gkf1toti6pl6svmtf3ha', 1775617322, 'modx.user.contextTokens|a:0:{}'),
('p286gevlbaqrrlui9h46nf175v', 1775614442, 'modx.user.contextTokens|a:0:{}'),
('p2lcs7g077s8m4877esipndrkl', 1776198452, 'modx.user.contextTokens|a:0:{}'),
('p30p49i18t9jnmcc6a0km81fl2', 1775646110, 'modx.user.contextTokens|a:0:{}'),
('p62bv1m47b7834m9hohfi5clq4', 1776020019, 'modx.user.contextTokens|a:0:{}'),
('p74flh878asau8qecrt33dk19e', 1775229982, 'modx.user.contextTokens|a:0:{}'),
('p7ae6e4v660hml3ap14c5dpi24', 1775298524, 'modx.user.contextTokens|a:0:{}'),
('p7tpcvrlo2cckscmoj2ekkhnjt', 1775190370, 'modx.user.contextTokens|a:0:{}'),
('p9j8lhmng92vdegste1aq85dlv', 1775417196, 'modx.user.contextTokens|a:0:{}'),
('pa44u8ph66andu64iv1d2r8ljs', 1776406605, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}login_failed|i:5;'),
('pa49j9b0769878qdcke1h05bt9', 1775948274, 'modx.user.contextTokens|a:0:{}'),
('pcen8hbn3lf1ppf1vg5qgjkksj', 1776209638, 'modx.user.contextTokens|a:0:{}'),
('pchsebgmp899gqqjknok8d2ree', 1776386580, 'modx.user.contextTokens|a:0:{}'),
('pd46mrrssdlpc6vebme6vg9vju', 1776042158, 'modx.user.contextTokens|a:0:{}'),
('pdcsuq95ovm6o1or26egvkunru', 1775451583, 'modx.user.contextTokens|a:0:{}'),
('peiou5n33jbkr0lr2i2uc1vltm', 1775584016, 'modx.user.contextTokens|a:0:{}'),
('pf5kes9b093ubk85a1kcc8ftgh', 1776085686, 'modx.user.contextTokens|a:0:{}'),
('pf707v9tghg5moj2qt20f222ke', 1776026333, 'modx.user.contextTokens|a:0:{}'),
('pfni69ok1bl4v67f40e1gji2ch', 1776221873, 'modx.user.contextTokens|a:0:{}'),
('pfok1ghf0ebrh1a2rqg39i5je7', 1775925070, 'modx.user.contextTokens|a:0:{}'),
('pi1jnilsuco820tg2hguc5qdbc', 1776003222, 'modx.user.contextTokens|a:0:{}'),
('pi383q5v81nl2h2t3i63hljhas', 1775898129, 'modx.user.contextTokens|a:0:{}'),
('pjq67r34hngk1ct5qvghc9gasa', 1776011913, 'modx.user.contextTokens|a:0:{}'),
('plc17jvr3o54j9donpsja3ftk2', 1775545839, 'modx.user.contextTokens|a:0:{}'),
('pmm0bbonge53vihb2rvv9go5rj', 1775432321, 'modx.user.contextTokens|a:0:{}'),
('pnka21tb2fqe9932slek99qfv2', 1776264330, 'modx.user.contextTokens|a:0:{}'),
('pobuo03ue46mdrqvhse5454k25', 1775338609, 'modx.user.contextTokens|a:0:{}'),
('prs3qhm7a467n3alk7pnmtko77', 1776350074, 'modx.user.contextTokens|a:0:{}'),
('psg2pqv358c11g5i1l24rndn1a', 1776031809, 'modx.user.contextTokens|a:0:{}'),
('psonrtt2a9aodv9sujvjh2jo71', 1776338859, 'modx.user.contextTokens|a:0:{}'),
('pv89c3ossv141sbdnofllc2lee', 1775215573, 'modx.user.contextTokens|a:0:{}'),
('q1e8ehkiao2jq6sll29p9vtkov', 1775989253, 'modx.user.contextTokens|a:0:{}'),
('q4lhm2j19cnjhj407mi72o9r7p', 1775974699, 'modx.user.contextTokens|a:0:{}'),
('q56ql0qknmuakrktc6l66sh8pn', 1775553007, 'modx.user.contextTokens|a:0:{}'),
('q58ggp3foivrg6uj6aj6bp8b42', 1775399432, 'modx.user.contextTokens|a:0:{}'),
('q5inc8u2l8p3v5ubt5lr1u653h', 1776279190, 'modx.user.contextTokens|a:0:{}'),
('q66v0p548nkgk9ssjakdpj32te', 1776219764, 'modx.user.contextTokens|a:0:{}'),
('q6l97f2duag4nua87rt9mvak3l', 1775544622, 'modx.user.contextTokens|a:0:{}'),
('q779asa015d90520q2hgctfkre', 1775228837, 'modx.user.contextTokens|a:0:{}'),
('q79scopsj1vsb01vm6a4j42nv4', 1776356677, 'modx.user.contextTokens|a:0:{}'),
('q86jqphi63sm49093fe2o0t64n', 1775815783, 'modx.user.contextTokens|a:0:{}'),
('q8hde1e15riqeso49b88kcablr', 1775300799, 'modx.user.contextTokens|a:0:{}'),
('q8jfdnokicg78k6slbcep2uhce', 1775981307, 'modx.user.contextTokens|a:0:{}'),
('q9ntsbgkjru0nh0iadadvofhcm', 1776414249, 'modx.user.contextTokens|a:0:{}'),
('qa11o6ea6pn2lqhmkq0c3fu8hc', 1776369300, 'modx.user.contextTokens|a:0:{}'),
('qba21993jm4i8op39atse65rh2', 1775206362, 'modx.user.contextTokens|a:0:{}'),
('qbl4k2umjo0345i1j0pfkmhdbc', 1776331372, 'modx.user.contextTokens|a:0:{}'),
('qc9543r29o91jbmvgdr8p7pdha', 1775727626, 'modx.user.contextTokens|a:0:{}'),
('qcmjr96it63avq0pc41ej65l3p', 1775559226, 'modx.user.contextTokens|a:0:{}'),
('qcor09q43jrpdaov0lmt98ojsa', 1775275001, 'modx.user.contextTokens|a:0:{}'),
('qcpto2me841m7oiarl324tpllp', 1775703358, 'modx.user.contextTokens|a:0:{}'),
('qdh5j5kj2li9gomndsomd0v29t', 1775754220, 'modx.user.contextTokens|a:0:{}'),
('qe5kq4ie23p9lv6i16922ocpdd', 1775665867, 'modx.user.contextTokens|a:0:{}'),
('qeg7o2rtg8setem7v5eofo3gb4', 1776371990, 'modx.user.contextTokens|a:0:{}'),
('qeobo59452q5g735vfu3vmn6lo', 1775651288, 'modx.user.contextTokens|a:0:{}'),
('qeqdl4aknvtfvd6dthircfb8k0', 1775796003, 'modx.user.contextTokens|a:0:{}'),
('qet6e0hhecm1a0nmp85l9mg8lb', 1776374485, 'modx.user.contextTokens|a:0:{}'),
('qfeb00e0mojvbh91fgvbv4j1k5', 1776229292, 'modx.user.contextTokens|a:0:{}'),
('qg2iq91g9ghc9819atfjbndr1g', 1775684873, 'modx.user.contextTokens|a:0:{}'),
('qgf2pdr92e9km0ahcgisr2a7ea', 1775731231, 'modx.user.contextTokens|a:0:{}'),
('qha8b69t7rvaevkmltj24l7l0b', 1775827222, 'modx.user.contextTokens|a:0:{}'),
('qhj0m3fucaot0hq3gfmg357de4', 1775151597, 'modx.user.contextTokens|a:0:{}'),
('qi1qhlehn5aenqgccignbqkln3', 1776176267, 'modx.user.contextTokens|a:0:{}'),
('qif7s4npks67rhko9hio4rpv5u', 1775995200, 'modx.user.contextTokens|a:0:{}'),
('qlqgi22uirp9gem681neqo874t', 1775477751, 'modx.user.contextTokens|a:0:{}'),
('qmb2tia78n13f0lje0cndaduqn', 1775861463, 'modx.user.contextTokens|a:0:{}'),
('qppt4j9adu7dthth4tvpd299qe', 1775132586, 'modx.user.contextTokens|a:0:{}'),
('qsjtlhes7b3jffptemj1f8uj69', 1775396655, 'modx.user.contextTokens|a:0:{}'),
('qti331dssm0ji3sus0icrlvabg', 1775442474, 'modx.user.contextTokens|a:0:{}'),
('qu9hqamnmr6q11fpb6413c1mh0', 1775229991, 'modx.user.contextTokens|a:0:{}'),
('qujdseon951ua2dch71ruo08du', 1776390350, 'modx.user.contextTokens|a:0:{}'),
('qvjshk2ft27b06sp3frivkbit2', 1775956994, 'modx.user.contextTokens|a:0:{}'),
('r11660lm57d99cra7mt1vnrqq2', 1776278655, 'modx.user.contextTokens|a:0:{}'),
('r2316al367pq27e3usr8ng1ing', 1775490554, 'modx.user.contextTokens|a:0:{}'),
('r312ljbdngl9pam4ml35513k00', 1775932866, 'modx.user.contextTokens|a:0:{}'),
('r31j724mv6r5p307q1nf1fj78l', 1775813657, 'modx.user.contextTokens|a:0:{}'),
('r3ahh4cn6vf5iupb1e8s0klt1h', 1775713988, 'modx.user.contextTokens|a:0:{}'),
('r3djmouqesqcosae8anf7vh6vt', 1775922309, 'modx.user.contextTokens|a:0:{}'),
('r6lfkrn05bf45lfev0qhenbaga', 1776224550, 'modx.user.contextTokens|a:0:{}'),
('r73do8nmlrr0i5b82treghp6ag', 1775614817, 'modx.user.contextTokens|a:0:{}'),
('r7c0c0ip6dv8c0ueui361veatr', 1775461150, 'modx.user.contextTokens|a:0:{}'),
('r7hehv99cr6fllu03rigt988ak', 1775770182, 'modx.user.contextTokens|a:0:{}'),
('r85n9niti7hcjaundskvnjt16c', 1776412343, 'modx.user.contextTokens|a:0:{}'),
('r8usucucfdv8d8ed4bojjb42p2', 1775646666, 'modx.user.contextTokens|a:0:{}'),
('r8v4hvsoodse1trqht43a9vdng', 1776406339, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('r9kug32aj6mjtgkum0debt3qnp', 1775227796, 'modx.user.contextTokens|a:0:{}'),
('ra8i9b9acf4fnt7uspmtndsflv', 1775925229, 'modx.user.contextTokens|a:0:{}'),
('ralgnekvulbunr802h19h0laf5', 1775473115, 'modx.user.contextTokens|a:0:{}'),
('rdqremfq5dujf36lc40hcgk177', 1776296199, 'modx.user.contextTokens|a:0:{}'),
('rdu9e260k1agvifvoqrmiuencd', 1775142907, 'modx.user.contextTokens|a:0:{}'),
('rf80ea8i72j8e1t0rorm89poph', 1776017577, 'modx.user.contextTokens|a:0:{}'),
('rff2gn1pif48742uk7nbenkjr0', 1775674252, 'modx.user.contextTokens|a:0:{}'),
('rh14a5rajikacmd0t2udfnd3i5', 1775394427, 'modx.user.contextTokens|a:0:{}'),
('rh373siavco6n6nhdo81r572bt', 1775317577, 'modx.user.contextTokens|a:0:{}'),
('rhclqepl8lq09n47dgcmfcp9h3', 1775442034, 'modx.user.contextTokens|a:0:{}'),
('risg4e2f58r2ukrj1ec6j9chnj', 1775481979, 'modx.user.contextTokens|a:0:{}'),
('rja76m0cg3frk387hvq5kq3d93', 1776324307, 'modx.user.contextTokens|a:0:{}'),
('rjijkthl6t4as6d6f500g671od', 1775764605, 'modx.user.contextTokens|a:0:{}'),
('rp3t96vtcgklom0dl6qh4cvg7f', 1775204843, 'modx.user.contextTokens|a:0:{}'),
('rpgptsj03qq7conbeilpt8lm0s', 1775311548, 'modx.user.contextTokens|a:0:{}'),
('rqb086kameb10boje8rl82sbno', 1775409148, 'modx.user.contextTokens|a:0:{}'),
('rqtmqethjr1mgjf4q4etbpe9n2', 1775686093, 'modx.user.contextTokens|a:0:{}'),
('rr7f3s4d7oqbpoh7ohaocq9oou', 1775851763, 'modx.user.contextTokens|a:0:{}'),
('rs1a0cngh8ndi32e086daevbnr', 1775946807, 'modx.user.contextTokens|a:0:{}'),
('rs6e0c5al59gb6kggab4ielcgr', 1775149813, 'modx.user.contextTokens|a:0:{}'),
('rsi1a874ek1b2dl0oe4bd6urbe', 1776324307, 'modx.user.contextTokens|a:0:{}'),
('rsqgpvsrnd0ohsul4b8u1f4j53', 1775600157, 'modx.user.contextTokens|a:0:{}'),
('rt6hduj9jesfupkof4a57e6kar', 1776237433, 'modx.user.contextTokens|a:0:{}'),
('rti8au1drbl0q40dpdtufd05k8', 1775145664, 'modx.user.contextTokens|a:0:{}'),
('ru74gjiojdhjsp1n8so4mm8j0k', 1775784340, 'modx.user.contextTokens|a:0:{}'),
('ruaa5heikh1up2og9dinq1n5j8', 1775481796, 'modx.user.contextTokens|a:0:{}'),
('rurrb5fcvcp34eh47odtbmjcca', 1776233289, 'modx.user.contextTokens|a:0:{}'),
('rv2iefeu1p80ffco5qnf9p9gar', 1776334094, 'modx.user.contextTokens|a:0:{}'),
('rvpot0mbpgskfmi7lgrfcj5lmm', 1775279491, 'modx.user.contextTokens|a:0:{}'),
('s0u5hbb7iq43lkmf2jn7r9u8uu', 1775887929, 'modx.user.contextTokens|a:0:{}'),
('s140du54cslbfq5jogrp3kc4up', 1775179150, 'modx.user.contextTokens|a:0:{}'),
('s2lsflbeffcafs9nhu8smjmgt2', 1775552059, 'modx.user.contextTokens|a:0:{}'),
('s3o237nlv4k4oa9q0d94fea79m', 1775738021, 'modx.user.contextTokens|a:0:{}'),
('s3rpb26ulgh0guls2dh86ibh7j', 1775413615, 'modx.user.contextTokens|a:0:{}'),
('s45h5srv17sht8c60v426tdj48', 1775669611, 'modx.user.contextTokens|a:0:{}'),
('s572bmt2gppo3kgla5qeaatif9', 1776364454, 'modx.user.contextTokens|a:0:{}'),
('s6h0a8o15chrj9qqrte13c99oh', 1775839008, 'modx.user.contextTokens|a:0:{}'),
('s6p2sii74nqvv1bl9brj4ncsfe', 1776287238, 'modx.user.contextTokens|a:0:{}'),
('s7hi4gaht46a490ir1mfeshnh0', 1776324307, 'modx.user.contextTokens|a:0:{}'),
('s8c758rpnjmuun3eluelcbvadm', 1775446513, 'modx.user.contextTokens|a:0:{}'),
('sbk80iuj9j7p5fqcbro0tsdh3g', 1775352424, 'modx.user.contextTokens|a:0:{}'),
('sbpku093lgr9g08plts7pba4le', 1776347891, 'modx.user.contextTokens|a:0:{}'),
('sbvbrvn4jusgvccnv4q4mqffq3', 1775630678, 'modx.user.contextTokens|a:0:{}'),
('sc1kio72l8j92ppsnb40ta6krc', 1775542248, 'modx.user.contextTokens|a:0:{}'),
('sc418163missq6r845n8n2uemf', 1775386094, 'modx.user.contextTokens|a:0:{}'),
('sc94f1q2s2ge4u5ibdlb30f5s7', 1775232865, 'modx.user.contextTokens|a:0:{}'),
('seqlk1sm1fipoareik64dclmc1', 1775548539, 'modx.user.contextTokens|a:0:{}'),
('sgajbses9u6et9eb0o1uq7kio1', 1776263580, 'modx.user.contextTokens|a:0:{}'),
('sgesemdgrq49i7d4lvpnn0q2cl', 1775167536, 'modx.user.contextTokens|a:0:{}'),
('sh5rp44bm0entb0ll8u484ut8d', 1775974031, 'modx.user.contextTokens|a:0:{}'),
('sic7bggpsnge9kaps3vvi2fd6e', 1775874924, 'modx.user.contextTokens|a:0:{}'),
('sisur13qco6u3fkn3rmpr8obv6', 1775201241, 'modx.user.contextTokens|a:0:{}'),
('sk67i2r57utrvu2aml4f3ib0tn', 1775205708, 'modx.user.contextTokens|a:0:{}'),
('sln2huv65c3qjppvev6umhrd9i', 1775192525, 'modx.user.contextTokens|a:0:{}'),
('slo0gmj7qbmc0ele811k5356lt', 1776140238, 'modx.user.contextTokens|a:0:{}'),
('slp3cre7mgnccrd9ace4u2mgoe', 1775143436, 'modx.user.contextTokens|a:0:{}'),
('sm626ubci9s5ddfbe1fv2d8jsl', 1776317992, 'modx.user.contextTokens|a:0:{}'),
('spqlmpbfgve73roapnp9qh4b2b', 1776409281, 'modx.user.contextTokens|a:0:{}'),
('spsfal5oo8mfb2ndpo1rt6fbdh', 1775907147, 'modx.user.contextTokens|a:0:{}'),
('sq4v0gtnbksmtmd4vo6il8ho7t', 1775316123, 'modx.user.contextTokens|a:0:{}'),
('sqc007st18o21bapti7urif5de', 1775922218, 'modx.user.contextTokens|a:0:{}'),
('sqs6ed3u5g3das0fm5h2phpn8e', 1775865168, 'modx.user.contextTokens|a:0:{}'),
('srrmtjpdauc5ftrhsgbs22qp7u', 1776143658, 'modx.user.contextTokens|a:0:{}'),
('srsk19c5oc54atc4jt3fish3ng', 1775371790, 'modx.user.contextTokens|a:0:{}'),
('sv7386ktidhv2m0s5vdk54tmoa', 1776376055, 'modx.user.contextTokens|a:0:{}'),
('t0bfhviomhju75ahb03ph98cdv', 1775374949, 'modx.user.contextTokens|a:0:{}'),
('t1bfgn1af0v55sd2tt0bnulhun', 1775317424, 'modx.user.contextTokens|a:0:{}'),
('t1f7vteb8kheoh0fi9n7m8d0do', 1776006080, 'modx.user.contextTokens|a:0:{}'),
('t1gmcsd4l3f8bpm3n490aguok0', 1775923751, 'modx.user.contextTokens|a:0:{}'),
('t1hekh7aa1qvmpvcupmu1qafio', 1775894143, 'modx.user.contextTokens|a:0:{}'),
('t1pungmtd4mhedeoja30fsts76', 1776097420, 'modx.user.contextTokens|a:0:{}'),
('t1uhjcit8mv0tsrckd7ic1ei4e', 1776009306, 'modx.user.contextTokens|a:0:{}'),
('t23s5kfcsu11m2nbb7c1gb19am', 1775915677, 'modx.user.contextTokens|a:0:{}'),
('t449vq0iu4ojo6nh6429kdaeb5', 1776054099, 'modx.user.contextTokens|a:0:{}'),
('t4nk0r6bqv8m91r8nnsurc3clb', 1775370470, 'modx.user.contextTokens|a:0:{}'),
('t6b6mfsp71iu4eh59ltfe4shi6', 1775836474, 'modx.user.contextTokens|a:0:{}'),
('t6s20opusohhapf5g6foqqefk2', 1775822150, 'modx.user.contextTokens|a:0:{}'),
('t7g1b0hc36j892h0shsdqo58n9', 1776011895, 'modx.user.contextTokens|a:0:{}'),
('t7tcgcv3t5jbq5s170rf528gs6', 1775401740, 'modx.user.contextTokens|a:0:{}'),
('t8dtouqjhtu7a9slj0urig06k7', 1775595655, 'modx.user.contextTokens|a:0:{}'),
('td4chet6otvn4q2dcf82fiu20u', 1776310307, 'modx.user.contextTokens|a:0:{}'),
('tdunsi98n1maujvgohkm62jtns', 1775214618, 'modx.user.contextTokens|a:0:{}'),
('tf9gpt1mms331gc5vdpr9263eo', 1776289997, 'modx.user.contextTokens|a:0:{}'),
('tgof95sg8381d5t0p5khnkrlpf', 1775456815, 'modx.user.contextTokens|a:0:{}'),
('tgrsjoqvtgo6sgjroub2d7kpvv', 1776128922, 'modx.user.contextTokens|a:0:{}'),
('tih6rsutkeo8seqlq5v5rucptq', 1776134990, 'modx.user.contextTokens|a:0:{}'),
('tijcosm4rub69ee6h8o4ds533h', 1775301606, 'modx.user.contextTokens|a:0:{}'),
('tijdhp11njk80t4r3rfu64klbc', 1775631136, 'modx.user.contextTokens|a:0:{}'),
('tj58d6riq21iebvaloidm42aa0', 1776156909, 'modx.user.contextTokens|a:0:{}'),
('tjmekudodnmms0jd9184vnifpb', 1775156729, 'modx.user.contextTokens|a:0:{}'),
('tjsg25dpjjhn3vsl3cm4svgmru', 1775153813, 'modx.user.contextTokens|a:0:{}'),
('tli8lqfnus4oqhtm024hg11mud', 1775357292, 'modx.user.contextTokens|a:0:{}'),
('tm2blr5441hj5dhb63b87jd8ck', 1775697945, 'modx.user.contextTokens|a:0:{}'),
('toblm75l8e2g8sbc65465htvom', 1775467486, 'modx.user.contextTokens|a:0:{}'),
('tomh4slempge1v12s8cuee47e7', 1775623635, 'modx.user.contextTokens|a:0:{}'),
('tp4kkb16205d0oav7nl9q7t7eo', 1775733120, 'modx.user.contextTokens|a:0:{}'),
('tpggq11o959veuv5khqrdgtnm8', 1775910575, 'modx.user.contextTokens|a:0:{}'),
('tr022rqgea0t90c6969ej66fom', 1776012402, 'modx.user.contextTokens|a:0:{}'),
('tsto7fc2igeo6dh0rpa9efc4cd', 1775681665, 'modx.user.contextTokens|a:0:{}'),
('ttqdc5f28qdeavrdgikdlsfinh', 1776148577, 'modx.user.contextTokens|a:0:{}'),
('tv0u3nbbjlenbp58ulu378epq6', 1775154424, 'modx.user.contextTokens|a:0:{}'),
('u0gnl41qrre39jlg91in08s3md', 1776161584, 'modx.user.contextTokens|a:0:{}'),
('u2p3vbhu6s2gqd57jf4no2lbtr', 1775726664, 'modx.user.contextTokens|a:0:{}'),
('u4qup40sl7n5pbi62okbpelsdb', 1775201759, 'modx.user.contextTokens|a:0:{}'),
('u4t1ph5hbu170o2g94shqa632c', 1775748115, 'modx.user.contextTokens|a:0:{}'),
('u55p09j6p3c8ein46tijhundut', 1775528617, 'modx.user.contextTokens|a:0:{}'),
('u5d8g0mh5sf6kfb0gq6ai8q3ik', 1776011438, 'modx.user.contextTokens|a:0:{}'),
('u7qs39qa4tejboiohem75hlggh', 1775835766, 'modx.user.contextTokens|a:0:{}'),
('u8s9n3r7kckart993cc79uksu3', 1776094660, 'modx.user.contextTokens|a:0:{}'),
('ubc5pemqnodimqoo6od1ug0hhn', 1775436309, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";s:1:\"0\";s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('uc4bnivjl2981o0s6ttctl4ap2', 1775682977, 'modx.user.contextTokens|a:0:{}'),
('ud26ltaour1had41ola4cb3qiq', 1775647518, 'modx.user.contextTokens|a:0:{}'),
('ud4jesq5chrqa68hvv5uauiokr', 1775668084, 'modx.user.contextTokens|a:0:{}'),
('udgd55c7gtecqeeaeggohgipm5', 1775232028, 'modx.user.contextTokens|a:0:{}'),
('udneqld60lan78ejmlr9lsbi4k', 1776301573, 'modx.user.contextTokens|a:0:{}'),
('udqk99p87lhikgcd0qbr2ft54a', 1776191781, 'modx.user.contextTokens|a:0:{}'),
('ueh2ljoi488neffr8d4f1puvp4', 1775352196, 'modx.user.contextTokens|a:0:{}'),
('ug5r1rn8fe8vphafjs1q4248dg', 1775676709, 'modx.user.contextTokens|a:0:{}'),
('ugs00gejdsavfvqna9n6hv9ntm', 1775753214, 'modx.user.contextTokens|a:0:{}'),
('ugtb0qhfpih9c1a3kg9o5rc4gn', 1775583484, 'modx.user.contextTokens|a:0:{}'),
('uh838m2rrio03vg97dujkngtp2', 1776206054, 'modx.user.contextTokens|a:0:{}'),
('uhlq6o17bi2itb50cqsijurpca', 1776261542, 'modx.user.contextTokens|a:0:{}'),
('uhns2dbj1d7c7ol8ak0t6s0l5m', 1776286138, 'modx.user.contextTokens|a:0:{}'),
('ui90i552iguij5m1fn3jjsunt5', 1775891921, 'modx.user.contextTokens|a:0:{}'),
('uj3n243i5th2vrm6b2pmq2h5f1', 1775726353, 'modx.user.contextTokens|a:0:{}'),
('unnvkgb0r7rjrofeus7veotdk3', 1775968735, 'modx.user.contextTokens|a:0:{}'),
('uok1vhc1j28to6gihv1i6p6a8c', 1775270906, 'modx.user.contextTokens|a:0:{}'),
('uool8rm5srp4ouk0kt4vgh2o2m', 1775873244, 'modx.user.contextTokens|a:0:{}'),
('uosen7um8st3jgnllk26j03fod', 1776053919, 'modx.user.contextTokens|a:0:{}'),
('upm5opjpb0momdt60ljbt2p7gf', 1775969728, 'modx.user.contextTokens|a:0:{}'),
('uqfpmb79kv142giuuasuvon97m', 1776057988, 'modx.user.contextTokens|a:0:{}'),
('ur5n3jmva63hj2g08fbo81ldrv', 1775794568, 'modx.user.contextTokens|a:0:{}'),
('urui0igijruifanab45uqnkrs8', 1776011899, 'modx.user.contextTokens|a:0:{}'),
('usf015c9g4nubse63nl2mm0h7b', 1775473054, 'modx.user.contextTokens|a:0:{}'),
('utd3kthqst4irmurgakeojo0dm', 1775887465, 'modx.user.contextTokens|a:0:{}'),
('utjk2ojpifcjagkgbqnc55ueji', 1776008958, 'modx.user.contextTokens|a:0:{}'),
('uu3g942qvnelii8p8qjos8aq63', 1775317062, 'modx.user.contextTokens|a:0:{}'),
('uu5r4lrm1oe8m5uip8eb46lidv', 1775972857, 'modx.user.contextTokens|a:0:{}'),
('uuvnmtisglathol69bhjsh4c2g', 1775621996, 'modx.user.contextTokens|a:0:{}'),
('uv777gcmi4t1fkp6ncjs0u8rkk', 1775661686, 'modx.user.contextTokens|a:0:{}'),
('v0j6um2hbhmp9580tr49g9dk5p', 1775414635, 'modx.user.contextTokens|a:0:{}'),
('v0vapqcrnpi4i8e88de6gkio6c', 1776191661, 'modx.user.contextTokens|a:0:{}'),
('v1oc3h2upbtpqiqikfr4sat0gr', 1775573607, 'modx.user.contextTokens|a:0:{}'),
('v3eo6s0gunegcm7osfvsuf2tis', 1775293099, 'modx.user.contextTokens|a:0:{}'),
('v3qlflsqm0moodeilfvrpdm476', 1775167292, 'modx.user.contextTokens|a:0:{}'),
('v6lchekt47gf30j81bfdc8un2t', 1775386011, 'modx.user.contextTokens|a:0:{}'),
('v7g430m6ss5amucavc63cepsgl', 1775946796, 'modx.user.contextTokens|a:0:{}'),
('v7jqevpenl1tl4ljlbpusjr4hg', 1775350445, 'modx.user.contextTokens|a:0:{}'),
('v81g9e371jgve7aioks15q9o2j', 1775804358, 'modx.user.contextTokens|a:0:{}'),
('v8v3oqh3rreqnq1bln0khfe7k3', 1775132724, 'modx.user.contextTokens|a:0:{}'),
('vctife2g4js16t6kscbd9b8qhp', 1775921977, 'modx.user.contextTokens|a:0:{}'),
('vd6hhg54ku5jjod3jp5t8gbk1g', 1775587549, 'modx.user.contextTokens|a:0:{}'),
('vdrdn8sj9jt7ai3jqjn8fqp3vo', 1775457042, 'modx.user.contextTokens|a:0:{}'),
('veeqq8ko81g8jn44v3h5pcr1uj', 1775942062, 'modx.user.contextTokens|a:0:{}'),
('vfae0glvgjooshi5m3ueou4ukq', 1776364824, 'modx.user.contextTokens|a:0:{}'),
('vge0mu7965mi1peclo6g0f4saf', 1775708435, 'modx.user.contextTokens|a:0:{}'),
('vh2u1l1k6ga1fnuhttquijch0n', 1776154634, 'modx.user.contextTokens|a:0:{}'),
('vh5hfn3gl8hlumoi34kk26v5dt', 1776310917, 'modx.user.contextTokens|a:0:{}'),
('viufmkn11fivfe74uj2vq1s67c', 1775726353, 'modx.user.contextTokens|a:0:{}'),
('vkakaprdmvlp52pjkn83deodm2', 1776012424, 'modx.user.contextTokens|a:0:{}'),
('vl1ih6o7pgp4tmhsa645c7e1hl', 1776013220, 'modx.user.contextTokens|a:0:{}'),
('vlqdjofcfhp6i2jco23ikorlrg', 1775230026, 'modx.user.contextTokens|a:0:{}'),
('vnj10mg9vfiad947q41sq7afqe', 1775726353, 'modx.user.contextTokens|a:0:{}'),
('vr2b9s1sup9rndr4ankm0k3vim', 1776269846, 'modx.user.contextTokens|a:0:{}'),
('vt2guvudso7tfrrp4stb3um0es', 1776246505, 'modx.user.contextTokens|a:0:{}'),
('vt3kd5hnt4btgiii1h2dg0tsja', 1776334725, 'modx.user.contextTokens|a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_content`
--

CREATE TABLE `modxwl_site_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `pagetitle` varchar(191) NOT NULL DEFAULT '',
  `longtitle` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `alias` varchar(191) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `pub_date` int(11) NOT NULL DEFAULT 0,
  `unpub_date` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isfolder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `introtext` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `richtext` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `template` int(11) NOT NULL DEFAULT 0,
  `menuindex` int(11) NOT NULL DEFAULT 0,
  `searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `cacheable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `createdby` int(11) NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedby` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deletedon` int(11) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL DEFAULT 0,
  `publishedon` int(11) NOT NULL DEFAULT 0,
  `publishedby` int(11) NOT NULL DEFAULT 0,
  `menutitle` varchar(255) NOT NULL DEFAULT '',
  `content_dispo` tinyint(1) NOT NULL DEFAULT 0,
  `hidemenu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modDocument',
  `context_key` varchar(100) NOT NULL DEFAULT 'web',
  `content_type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `uri` text DEFAULT NULL,
  `uri_override` tinyint(1) NOT NULL DEFAULT 0,
  `hide_children_in_tree` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_tree` tinyint(1) NOT NULL DEFAULT 1,
  `properties` mediumtext DEFAULT NULL,
  `alias_visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_site_content`
--

INSERT INTO `modxwl_site_content` (`id`, `type`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible`) VALUES
(1, 'document', 'Home', 'Congratulations!', '', 'index', '', 1, 0, 0, 0, 0, '', '<body id = \"homePage\">\r\n    <!-- Home hero starts -->\r\n    <section id=\"homeHero\">\r\n        <div class=\"swiper homeHeroSwiper\">\r\n            <div class=\"swiper-wrapper\">\r\n                <!-- Slide 1 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-1.webp\" alt=\"Airport Parking\"class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 2 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-2.webp\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 3 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-3.webp\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- Hero Content -->\r\n        <div class=\"homehero-content\">\r\n            <h1 data-aos=\"fade-down-right\" data-aos-duration=\"1000\">\r\n                Secure Parking  <br class=\"d-md-none\">\r\n                Designed <br class=\"d-none d-md-block\">\r\n                Around Your Journey\r\n            </h1>\r\n            <p class=\"mt-3\" data-aos=\"fade-down-left\" data-aos-duration=\"1000\">\r\n                Secure, convenient parking designed to keep your journey smooth.<br>\r\n                Reliable access, peace of mind, and hassle-free arrivals and returns.\r\n            </p>\r\n            <a href=\"#reserve-slots\" class=\"mt-3\">Reserve Your Space</a>\r\n        </div>\r\n\r\n    </section>\r\n    <!-- Home hero ends -->\r\n\r\n    <!-- Who we are section starts -->\r\n    <section id=\"who-we-are\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row d-flex align-items-center justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-8\">\r\n                    <h2 class=\"heading\">Who We Are</h2>\r\n                    <p class=\"supportive-text\">Airport Parking Service</p>\r\n                    <p><b>Airportparking.lk</b> is a flagship venture of <b><a href=\"https://explore.vacations/\" style =\"text-decoration:none; color: black;\">Explore Holdings</a></b> and a pioneer in introducing dedicated airport parking services in Sri Lanka. As one of the first providers to establish this concept, we set the industry standard for secure, convenient, and cost-effective airport parking solutions. Our facility is strategically located in close proximity to Bandaranaike International Airport, enabling travelers to park with confidence and reach the terminal quickly and effortlessly.</p>\r\n                    <p class=\"mb-0\">With 24/7 surveillance, controlled access, and a professionally trained operations team, we ensure the highest level of safety and reliability for every vehicle entrusted to us. Supported by flexible parking options and responsive customer service, Airportparking.lk continues to lead the industry by delivering a seamless, stress-free parking experience that allows our customers to begin and end their journeys with complete peace of mind.\r\n                    </p>\r\n                </div>\r\n                 <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <img src=\"assets/images/who-we-are.jpeg\" alt=\"Who we are image\" class=\"img-fluid rounded-3 mt-4 mt-md-0\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Who we are section ends -->\r\n\r\n    <!-- Why Choose Us section starts -->\r\n    <section id=\"why-choose-us\" class=\"py-3\">\r\n        <div class=\"container\">\r\n            <div class=\"row g-5 justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-1.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>SAFE AND SECURE PARKING AREAS</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-2.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>FRIENDLY AND EFFICIENT STAFF</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-3.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>ONLINE BOOKING FACILITY</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-4.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>24/7 CCTV SURVEILLANCE</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Why Choose Us section ends -->\r\n\r\n    <!--Reserve Slots section starts -->\r\n    <section id=\"reserve-slots\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Reserve Your Parking Slot Today</h2>\r\n                    <p class=\"supportive-text text-center\">Book your parking space in advance and enjoy a hassle-free experience.</p>\r\n                </div>\r\n                <hr>\r\n                <p class=\"text-danger text-center mb-2 fw-bold\">Pick your trip dates to see available parking!</p>  \r\n                <div class=\"date-picker-container d-flex justify-content-center align-items-center flex-wrap gap-3 mb-3\">\r\n                    <div class=\"date-picker-item\">\r\n                        <label for=\"initial-start-date\" class=\"form-label\">Start Date</label>\r\n                        <input type=\"date\" id=\"initial-start-date\" class=\"form-control rounded-0\">\r\n                    </div>\r\n\r\n                    <div class=\"date-picker-item\">\r\n                        <label for=\"initial-end-date\" class=\"form-label\">End Date</label>\r\n                        <input type=\"date\" id=\"initial-end-date\" class=\"form-control rounded-0\">\r\n                    </div>\r\n\r\n                    <div class=\"date-picker-item align-self-end\">\r\n                        <button id=\"check-availability\" class=\"btn btn-success rounded-0\" style=\"background-color:#001c35; border-color: transparent;\">Check Availability</button>\r\n                    </div>\r\n                    <div class=\"date-picker-item align-self-end\" style=\"min-width: auto;\">\r\n                        <button id=\"clear-dates\" class=\"btn btn-outline-danger\">\r\n                            <i class=\"bi bi-trash3\"></i>                        \r\n                        </button>\r\n                    </div>\r\n                </div>\r\n\r\n                <hr>              \r\n                <div class=\"col-12 d-flex justify-content-center\">\r\n                    <div class=\"parking-building-wrapper\">\r\n                        <!-- Legend -->\r\n                        <div class=\"parking-legend\">\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"available\"></span> Available\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"selected\"></span> Selected\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"booked\"></span> Booked\r\n                            </div>\r\n                        </div>\r\n\r\n                        <!-- Parking layout -->\r\n                        <div class=\"floor active\">\r\n                            <!-- ALL BOOKED banner -->\r\n                            <div class=\"all-booked-banner d-none\">\r\n                                <div class=\"all-booked-card\">\r\n                                    <div class=\"all-booked-icon\">\r\n                                        <i class=\"bi bi-exclamation-circle-fill\"></i>\r\n                                    </div>\r\n                                    <div class=\"all-booked-text\">\r\n                                        <h5>Basement Parking Fully Booked</h5>\r\n                                        <p>\r\n                                            We’re sorry for the inconvenience. All Basement Parking slots are currently booked\r\n                                            for your selected dates. Please check the available Surface Parking slots below.\r\n                                        </p>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Main parking layout -->\r\n                            <div class=\"main-layout booked-zone\">\r\n                                <!-- Row 1 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">A1</button>\r\n                                        <button class=\"slot booked\">A2</button>\r\n                                        <button class=\"slot booked\">A3</button>\r\n                                        <button class=\"slot booked\">A4</button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">A5</button>\r\n                                        <button class=\"slot booked\">A6</button>\r\n                                        <button class=\"slot booked\">A7</button>\r\n                                        <button class=\"slot booked\">A8</button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 2 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">B1</button>\r\n                                        <button class=\"slot booked\">B2</button>\r\n                                        <button class=\"slot booked\">B3</button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">B4</button>\r\n                                        <button class=\"slot booked\">B5</button>\r\n                                        <button class=\"slot booked\">B6</button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 3 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">C1</button>\r\n                                        <button class=\"slot booked\">C2</button>\r\n                                        <button class=\"slot booked\">C3</button>\r\n                                        <button class=\"slot booked\">C4</button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">C5</button>\r\n                                        <button class=\"slot booked\">C6</button>\r\n                                        <button class=\"slot booked\">C7</button>\r\n                                        <button class=\"slot booked\">C8</button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 4 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">D1</button>\r\n                                        <button class=\"slot booked\">D2</button>\r\n                                        <button class=\"slot booked\">D3</button>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">D4</button>\r\n                                        <button class=\"slot booked\">D5</button>\r\n                                        <button class=\"slot booked\">D6</button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 5 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">E1</button>\r\n                                        <button class=\"slot booked\">E2</button>\r\n                                        <button class=\"slot booked\">E3</button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">E4</button>\r\n                                        <button class=\"slot booked\">E5</button>\r\n                                        <button class=\"slot booked\">E6</button>\r\n                                        <button class=\"slot booked\">E7</button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 6 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\">F1</button>\r\n                                        <button class=\"slot booked\">F2</button>\r\n                                        <button class=\"slot booked\">F3</button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\">F4</button>\r\n                                        <button class=\"slot booked\">F5</button>\r\n                                        <button class=\"slot booked\">F6</button>\r\n                                        <button class=\"slot booked\">F7</button>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Outer slots -->\r\n                            <div class=\"outer-slots-section\">\r\n                                <h4 class=\"outer-slot-title\">Surface Parking Area</h4>\r\n                                <p class=\"outer-slot-subtitle\">Limited slots available near perimeter</p>\r\n\r\n                                <div class=\"outer-layout\">\r\n                                    <!-- Row 1 -->\r\n                                    <div class=\"row parking-row\">\r\n                                        <div class=\"bay left\">\r\n                                            <button class=\"slot outer-slot\">G1</button>\r\n                                            <button class=\"slot outer-slot\">G2</button>\r\n                                            <button class=\"slot outer-slot\">G3</button>\r\n                                        </div>\r\n\r\n                                        <div class=\"driveway small\">Driveway</div>\r\n\r\n                                        <div class=\"bay right\">\r\n                                            <button class=\"slot outer-slot\">G4</button>\r\n                                            <button class=\"slot outer-slot\">G5</button>\r\n                                            <button class=\"slot outer-slot\">G6</button>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <!-- Row 2 -->\r\n                                    <div class=\"row parking-row\">\r\n                                        <div class=\"bay left\">\r\n                                            <button class=\"slot outer-slot\">G7</button>\r\n                                            <button class=\"slot outer-slot\">G8</button>\r\n                                        </div>\r\n\r\n                                        <div class=\"driveway small\">Driveway</div>\r\n\r\n                                        <div class=\"bay right\">\r\n                                            <button class=\"slot outer-slot\">G9</button>\r\n                                            <button class=\"slot outer-slot\">G10</button>\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Entry/Exit -->\r\n                            <div class=\"entry-exit\">\r\n                                <span class=\"marker entry\">Entry</span>\r\n                                <span class=\"marker exit\">Exit</span>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <!-- Booking Modal -->\r\n                        <div id=\"booking-modal\" class=\"modal\">\r\n                            <div class=\"modal-content\">\r\n                                <span class=\"close\">&times;</span>\r\n                                <h3>Reserve Your Parking Slot</h3>\r\n                                <hr>\r\n                                <form id=\"booking-form\" class=\"booking-form-grid\">\r\n                                    <div class=\"form-group\">\r\n                                        <label>Slot Number</label>\r\n                                        <input type=\"text\" id=\"slot-number\" readonly>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Vehicle Type <span class=\"text-danger\">*</span></label>\r\n                                        <select class=\"form-select\" id=\"vehicle-type\" required>\r\n                                            <option value=\"\">Select vehicle</option>\r\n                                            <option value=\"car\">Car</option>\r\n                                            <option value=\"van\">Van</option>\r\n                                            <option value=\"bus\">Bus</option>\r\n                                        </select>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Flight Number <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"flight-number\" placeholder=\"Enter Flight Number\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Start Date & Time <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"datetime-local\" id=\"start-date\" class=\"form-control\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>End Date & Time <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"datetime-local\" id=\"end-date\" class=\"form-control\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Name <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"user-name\" placeholder=\"Enter Name\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Hometown <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"hometown\" placeholder=\"Enter Hometown\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Email <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"email\" id=\"user-email\" placeholder=\"Enter Email\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>WhatsApp Number <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"number\" id=\"whatsapp-number\" class=\"form-control\" required placeholder=\"94771234567 (without + or spaces)\">\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Air Ticket Image <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"file\" id=\"air_ticket_image_url\" name=\"air_ticket_image_url\" accept=\"image/*\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Passport Copy Image <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"file\" id=\"passport_copy_image_url\" name=\"passport_copy_image_url\" accept=\"image/*\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Passenger Count <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"number\" id=\"passenger_count\" name=\"passenger_count\" class=\"form-control\" min=\"1\" placeholder=\"Enter Passenger Count\" required>\r\n                                    </div>\r\n                                    <div class=\"extra-services mt-2\">\r\n                                        <p><strong>Extra Services</strong></p>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"1000\" data-name=\"Body Wash & Vacuum\">\r\n                                            Body Wash & Vacuum (LKR 1,000)\r\n                                        </label>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"500\" data-name=\"Shuttle One Way\">\r\n                                            Shuttle One Way (LKR 500)\r\n                                        </label>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"1000\" data-name=\"Shuttle Two Way\">\r\n                                            Shuttle Two Way (LKR 1,000)\r\n                                        </label>\r\n                                    </div>\r\n                                    <div class=\"price-summary mt-2\">\r\n                                        <p>\r\n                                            <strong>Total Days:</strong>\r\n                                            <span id=\"total-days-text\">0</span>\r\n                                        </p>\r\n                                        <p>\r\n                                            <strong>Price per Day:</strong>\r\n                                            LKR 1,000\r\n                                        </p>\r\n                                        <p class=\"total-amount\">\r\n                                            <strong>Total Price:</strong>\r\n                                            LKR <span id=\"total-price-text\">0</span>\r\n                                        </p>\r\n                                    </div>\r\n                                    <div class=\"booking-notes mt-3\">\r\n                                        <p class=\"mb-0\"><strong>Important Notice:</strong></p>\r\n                                        <ul class=\"whitespace-nowrap\">\r\n                                           <li>Please arrive at least <strong>one (1) hour early</strong> to allow time for vehicle handover and necessary procedures.</li>\r\n<li>If the end time is extended, a 2-hour grace applies; thereafter, 25% (2–4h), 50% (4–6h), 75% (6–8h), or 100% (>8h) of the daily rate will be charged.</li>\r\n                                        </ul>\r\n                                    </div>\r\n                                    <button type=\"submit\" id=\"submit-booking-btn\">Book Slot</button>\r\n                                    <!-- <div class=\"booking-notes mt-3\">\r\n                                        <p><strong>Important Notice:</strong></p>\r\n                                        <ul>\r\n                                            <li>Please arrive at our office at least <strong>three (3) hours prior</strong> to your scheduled departure time.</li>\r\n                                            <li>Transfers are arranged to ensure arrival within the recommended check-in period.</li>\r\n                                        </ul>\r\n                                    </div> -->\r\n                                </form>\r\n                               \r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!--Reserve Slots section ends -->\r\n\r\n    <!-- Booking Tips section starts -->\r\n    <section id=\"booking-tips\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Booking Tips</h2>\r\n                    <p class=\"supportive-text text-center\">Follow these steps for a smooth parking experience.</p>\r\n                </div>\r\n            </div>\r\n           <div class=\"row mt-4\">\r\n                <div class=\"col-md-8\">\r\n                    <ul class=\"booking-tips-timeline\">\r\n                        <li>\r\n                            <span class=\"tip-circle\">01</span>\r\n                            <div class=\"tip-content\">Reserve your parking slot in advance</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">02</span>\r\n                            <div class=\"tip-content\">Double-check your start and end dates</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">03</span>\r\n                            <div class=\"tip-content\">Keep your reference number safe</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">04</span>\r\n                            <div class=\"tip-content\">Select extra services if required</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">05</span>\r\n                            <div class=\"tip-content\">Arrive early for a smooth check-in</div>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n                <div class=\"col-md-4 d-flex justify-content-center align-items-center\">\r\n                    <img src=\"assets/images/booking-tips.webp\" alt=\"Booking tips image\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Booking Tips section ends -->\r\n\r\n    <!-- Our Services section starts -->\r\n    <section id=\"our-services\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Our Services</h2>\r\n                    <p class=\"supportive-text text-center\">Comprehensive parking solutions tailored to your needs.</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"row justify-content-center mt-4\">\r\n                <!-- Airport Parking Services -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/airport-parking-area.webp\" alt=\"Airport Parking Services\" class=\"img-fluid\">\r\n                        <div class=\"service-content\">\r\n                            <h3>Airport Parking Services</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Secure airport parking 10 minutes from BIA.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    Airport Parking Sri Lanka is one of the wing companies of\r\n                                    Explore Holdings. We are the only airport parking provider\r\n                                    in Sri Lanka for overseas travelers, located just\r\n                                    10 minutes from Bandaranayake International Airport with\r\n                                    optional shuttle services. <a href=\"https://airportparking.lk/\">Airport Parking</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Tour Operations in Sri Lanka -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/airport-taxi-service.webp\"\r\n                            alt=\"Tour Operations in Sri Lanka\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Tour Operations in Sri Lanka</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Tailor-made Sri Lanka holiday experiences.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    Explore Vacations offers customized Sri Lanka tours with\r\n                                    customer-friendly guided experiences. Every client is\r\n                                    treated as a VIP, ensuring a memorable and enriching\r\n                                    journey across the island. <a href=\"https://explore.vacations/\">Explore Vacations</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Car Rental Services -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/car-rental-services.webp\"\r\n                            alt=\"Car Rental Services\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Car Rental Services</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Premium vehicles at affordable rates.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    SR Rent A Car provides a fleet of over 100 luxury vehicles\r\n                                    suitable for business travel and leisure trips. Our\r\n                                    smooth rental process ensures convenience and comfort\r\n                                    for every journey. <a href=\"https://srilankarentacar.lk/\">SR Rent a Car</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Airport Taxi Service -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/hotel-booking-service.webp\"\r\n                            alt=\"Airport Taxi Service\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Airport Taxi Service</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Seamless airport-hotel transfers.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    SR Transfers offers reliable airport taxi services with\r\n                                    competitive rates. Our customer-focused approach ensures\r\n                                    timely and comfortable transfers between the airport\r\n                                    and your destination. <a href=\"https://srilankatransfer.lk/\">SR Transfers</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Our Services section ends -->\r\n\r\n    <!-- Testimonials section starts -->\r\n    <section id=\"testimonials\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">What Our Customers Say</h2>\r\n                    <p class=\"supportive-text text-center\">Real feedback from our valued clients.</p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row justify-content-center\">\r\n                <div class=\"col-12\">\r\n                    <div id=\"testimonialCarousel\" class=\"carousel slide\" data-bs-ride=\"carousel\">\r\n                        <div class=\"carousel-inner\" id=\"testimonialContainer\"></div>\r\n\r\n                        <button class=\"carousel-control-prev\" type=\"button\"\r\n                            data-bs-target=\"#testimonialCarousel\" data-bs-slide=\"prev\">\r\n                            <span class=\"carousel-control-prev-icon\"></span>\r\n                        </button>\r\n\r\n                        <button class=\"carousel-control-next\" type=\"button\"\r\n                            data-bs-target=\"#testimonialCarousel\" data-bs-slide=\"next\">\r\n                            <span class=\"carousel-control-next-icon\"></span>\r\n                        </button>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <!-- View More Button -->\r\n            <div class=\"row\">\r\n                <div class=\"col text-center\">\r\n                    <a href=\"https://www.google.com/maps/place/Airport+Parking+Sri+Lanka/@7.1292859,79.8732382,17z/data=!4m8!3m7!1s0x3ae2f16b53527527:0xfa15e5c2744b0e7f!8m2!3d7.1292859!4d79.8758131!9m1!1b1!16s%2Fg%2F11j30yjgyb?entry=ttu&g_ep=EgoyMDI2MDEwNC4wIKXMDSoASAFQAw%3D%3D\" class=\"btn btn-outline-primary px-4\" target=\"_blank\" rel=\"noopener noreferrer\">\r\n                        View More Reviews\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Testimonials section ends -->\r\n\r\n    <script>\r\n        fetch(\'assets/data/testimonials.json\')\r\n            .then(response => response.json())\r\n            .then(data => {\r\n                const container = document.getElementById(\'testimonialContainer\');\r\n                const wordLimit = 20;\r\n\r\n                const limitWords = (text, limit) => {\r\n                    const words = text.split(\' \');\r\n                    return words.length > limit\r\n                        ? words.slice(0, limit).join(\' \') + \'...\'\r\n                        : text;\r\n                };\r\n\r\n                const firstFour = data.slice(0, 4);\r\n\r\n                let slideHTML = `\r\n                    <div class=\"carousel-item active\">\r\n                        <div class=\"row\">\r\n                `;\r\n\r\n                firstFour.forEach(item => {\r\n                    slideHTML += `\r\n                        <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                            <div class=\"testimonial-card text-center p-4 h-100\">\r\n                                <p class=\"testimonial-text\">\r\n                                    \"${limitWords(item.text, wordLimit)}\"\r\n                                </p>\r\n                                <h5 class=\"testimonial-name mt-3\">- ${item.name}</h5>\r\n                                <p class=\"testimonial-role\">${item.role}</p>\r\n                            </div>\r\n                        </div>\r\n                    `;\r\n                });\r\n\r\n                slideHTML += `\r\n                        </div>\r\n                    </div>\r\n                `;\r\n\r\n                container.insertAdjacentHTML(\'beforeend\', slideHTML);\r\n            })\r\n            .catch(err => console.error(\'Error loading testimonials:\', err));\r\n    </script>\r\n\r\n    <script>\r\n        window.addEventListener(\'load\', () =>{\r\n            if(window.location.hash === \"#reserve-slots\") {\r\n                const section = document.getElementById(\"reserve-slots\");\r\n                if(section) section.scrollIntoView({ behavior: \"smooth\" });\r\n            }\r\n        });\r\n    </script>\r\n     \r\n    <script>\r\n        document.querySelectorAll(\'.toggle-service\').forEach(button => {\r\n            button.addEventListener(\'click\', () => {\r\n                const card = button.closest(\'.service-card\');\r\n                card.classList.toggle(\'active\');\r\n                button.textContent = card.classList.contains(\'active\')\r\n                    ? \'Hide Details\'\r\n                    : \'View Details\';\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const slots = Array.from(document.querySelectorAll(\'#reserve-slots .slot\'));\r\n            const modal = document.getElementById(\'booking-modal\');\r\n            const closeModal = modal.querySelector(\'.close\');\r\n            const bookingForm = document.getElementById(\'booking-form\');\r\n\r\n            const slotInput = document.getElementById(\'slot-number\');\r\n            const vehicleTypeInput = document.getElementById(\'vehicle-type\');\r\n            const hometownInput = document.getElementById(\'hometown\');\r\n\r\n            const startDateInput = document.getElementById(\'start-date\');\r\n            const endDateInput = document.getElementById(\'end-date\');\r\n\r\n            const totalDaysText = document.getElementById(\'total-days-text\');\r\n            const totalPriceText = document.getElementById(\'total-price-text\');\r\n\r\n            const extraServices = document.querySelectorAll(\'.extra-service\');\r\n\r\n            const PRICE_PER_DAY = 1000;\r\n\r\n            const now = new Date();\r\n            const tzOffset = now.getTimezoneOffset() * 60000; \r\n            const localISO = new Date(now - tzOffset).toISOString().slice(0,16); \r\n\r\n            startDateInput.min = localISO;\r\n            endDateInput.min = localISO;\r\n\r\n            function calculateTotal() {\r\n                if (!startDateInput.value || !endDateInput.value) {\r\n                    totalDaysText.textContent = \'0 days 0 hours\';\r\n                    totalPriceText.textContent = \'0.00\';\r\n                    return;\r\n                }\r\n\r\n                const start = new Date(startDateInput.value);\r\n                const end = new Date(endDateInput.value);\r\n\r\n                if (end <= start) {\r\n                    totalDaysText.textContent = \'0 days 0 hours\';\r\n                    totalPriceText.textContent = \'0.00\';\r\n                    return;\r\n                }\r\n\r\n                // Difference in milliseconds\r\n                const diffMs = end - start;\r\n\r\n                // Total hours\r\n                const totalHours = diffMs / (1000 * 60 * 60);\r\n\r\n                // Calculate full days and remaining hours\r\n                const fullDays = Math.floor(totalHours / 24);\r\n                const remainingHours = Math.round(totalHours % 24);\r\n\r\n                // Total days as float for pricing\r\n                const totalDaysFloat = totalHours / 24;\r\n\r\n                // Price: multiply by PRICE_PER_DAY proportionally\r\n                let total = totalDaysFloat * PRICE_PER_DAY;\r\n\r\n                // Add extra services\r\n                extraServices.forEach(service => {\r\n                    if (service.checked) {\r\n                        total += parseInt(service.value, 10);\r\n                    }\r\n                });\r\n\r\n                // Update display\r\n                totalDaysText.textContent = `${fullDays} day${fullDays !== 1 ? \'s\' : \'\'} ${remainingHours} hour${remainingHours !== 1 ? \'s\' : \'\'}`;\r\n                const roundedTotal = Math.round(total);\r\n                totalPriceText.textContent = `${roundedTotal.toLocaleString()}`;\r\n            }\r\n\r\n            startDateInput.addEventListener(\'change\', () => {\r\n                endDateInput.min = startDateInput.value;\r\n                calculateTotal();\r\n            });\r\n\r\n            endDateInput.addEventListener(\'change\', calculateTotal);\r\n\r\n            extraServices.forEach(service => {\r\n                service.addEventListener(\'change\', calculateTotal);\r\n            });\r\n\r\n            /* Slot click */\r\n            slots.forEach(slot => {\r\n                slot.addEventListener(\'click\', () => {\r\n                    if (slot.classList.contains(\'booked\') || slot.disabled) return;\r\n\r\n                    bookingForm.reset();\r\n                    slotInput.value = slot.textContent.trim();\r\n                    totalDaysText.textContent = \'0\';\r\n                    totalPriceText.textContent = \'0\';\r\n\r\n                    modal.style.display = \'block\';\r\n                });\r\n            });\r\n\r\n            /*  Close modal */\r\n            closeModal.addEventListener(\'click\', () => {\r\n                modal.style.display = \'none\';\r\n                bookingForm.reset();\r\n            });\r\n\r\n            window.addEventListener(\'click\', e => {\r\n                if (e.target === modal) {\r\n                modal.style.display = \'none\';\r\n                bookingForm.reset();\r\n                }\r\n            });\r\n\r\n            bookingForm.addEventListener(\'submit\', e => {\r\n                e.preventDefault();\r\n\r\n                const submitBtn = document.getElementById(\'submit-booking-btn\');\r\n                submitBtn.disabled = true;\r\n                submitBtn.textContent = \'Reserving...\';\r\n\r\n                // Calculate exact total hours for fractional days\r\n                const start = new Date(startDateInput.value);\r\n                const end = new Date(endDateInput.value);\r\n                const totalHours = (end - start) / (1000 * 60 * 60); // total hours\r\n                const totalDaysFloat = totalHours / 24;\r\n\r\n                // Calculate total price including extra services\r\n                let totalPrice = totalDaysFloat * PRICE_PER_DAY;\r\n                extraServices.forEach(service => {\r\n                    if (service.checked) totalPrice += parseInt(service.value, 10);\r\n                });\r\n\r\n                const payload = {\r\n                    slot: slotInput.value,\r\n                    vehicleType: document.getElementById(\'vehicle-type\').value,\r\n                    hometown: document.getElementById(\'hometown\').value,\r\n                    startDate: startDateInput.value,\r\n                    endDate: endDateInput.value,\r\n                    days: totalDaysFloat.toFixed(2),      \r\n                    pricePerDay: PRICE_PER_DAY,\r\n                    totalPrice: Math.round(totalPrice),\r\n                    extras: Array.from(document.querySelectorAll(\'.extra-service:checked\'))\r\n                        .map(e => e.dataset.name),\r\n                    flightNumber: document.getElementById(\'flight-number\').value,\r\n                    whatsapp: document.getElementById(\'whatsapp-number\').value,\r\n                    passenger_count: document.getElementById(\'passenger_count\').value,\r\n                    name: document.getElementById(\'user-name\').value,\r\n                    email: document.getElementById(\'user-email\').value\r\n                };\r\n\r\n                const formData = new FormData();\r\n\r\n                Object.keys(payload).forEach(key => {\r\n                    if (Array.isArray(payload[key])) {\r\n                        payload[key].forEach(val => formData.append(`${key}[]`, val));\r\n                    } else {\r\n                        formData.append(key, payload[key]);\r\n                    }\r\n                });\r\n\r\n                // Append images\r\n                formData.append(\'air_ticket_image_url\', document.getElementById(\'air_ticket_image_url\').files[0]);\r\n                formData.append(\'passport_copy_image_url\', document.getElementById(\'passport_copy_image_url\').files[0]);\r\nconsole.log(\'========== BOOKING DEBUG ==========\');\r\nconsole.log(\'slotInput.value:\', slotInput.value);\r\nconsole.log(\'vehicleType:\', payload.vehicleType);\r\nconsole.log(\'startDate:\', payload.startDate);\r\nconsole.log(\'endDate:\', payload.endDate);\r\n\r\nconsole.log(\'---- Payload Object ----\');\r\nconsole.log(payload);\r\n\r\nconsole.log(\'---- FormData Contents ----\');\r\nfor (const [key, value] of formData.entries()) {\r\n    console.log(key, value);\r\n}\r\nconsole.log(\'===================================\');\r\n\r\n                fetch(\'/assets/includes/save-booking.php\', {\r\n                    method: \'POST\',\r\n                    body: formData\r\n                })\r\n.then(res => res.text())\r\n.then(t => { console.log(\"RAW RESPONSE:\", t); return JSON.parse(t); })\r\n                .then(response => {\r\n                    if (!response.success) {\r\n                        submitBtn.disabled = false;\r\n                        submitBtn.textContent = \'Book Slot\';\r\n\r\n                        Swal.fire({\r\n                            icon: \'error\',\r\n                            title: \'Booking Failed\',\r\n                            //text: response.message || \'Unknown error\',\r\ntext: response.detail || response.error || \'Unknown error\'\r\n\r\n                        });\r\n                        return;\r\n                    }\r\n\r\n                    Swal.fire({\r\n                        icon: \'success\',\r\n                        title: \'Booking Successful\',\r\n                        html: `\r\n                            Slot <strong>${payload.slot}</strong> reserved.<br>\r\n                            Reference: <strong>${response.reference}</strong>\r\n                        `\r\n                    }).then(() => {\r\n                        window.open(response.pdf_url, \'_blank\', \'noopener,noreferrer\');\r\n                        setTimeout(() => window.location.reload(), 1000);\r\n                    });\r\n\r\n                    const slotElement = slots.find(s => s.textContent === payload.slot);\r\n                    if (slotElement) slotElement.classList.add(\'booked\');\r\n\r\n                    modal.style.display = \'none\';\r\n                    bookingForm.reset();\r\n                })\r\n                .catch(error => {\r\n                    submitBtn.disabled = false;\r\n                    submitBtn.textContent = \'Book Slot\';\r\n\r\n                    Swal.fire({\r\n                        icon: \'error\',\r\n                        title: \'Server Error\',\r\n                        text: error.message,\r\n                    });\r\n                    console.error(error);\r\n                });\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const outerSlots = Array.from(document.querySelectorAll(\'#reserve-slots .outer-slot\'));\r\n            const startInput = document.getElementById(\'initial-start-date\');\r\n            const endInput = document.getElementById(\'initial-end-date\');\r\n            const checkBtn = document.getElementById(\'check-availability\');\r\n            const clearBtn = document.getElementById(\'clear-dates\');\r\n            const banner = document.querySelector(\'.all-booked-banner\');\r\n            let lastStart = \'\';\r\n            let lastEnd = \'\';\r\n\r\n            function shuffle(array) {\r\n                const arr = [...array];\r\n                for (let i = arr.length - 1; i > 0; i--) {\r\n                    const j = Math.floor(Math.random() * (i + 1));\r\n                    [arr[i], arr[j]] = [arr[j], arr[i]];\r\n                }\r\n                return arr;\r\n            }\r\n\r\n            function resetOuterSlots() {\r\n                outerSlots.forEach(slot => {\r\n                    slot.classList.remove(\'booked\', \'selected\');\r\n                    slot.disabled = true;\r\n                });\r\n            }\r\n\r\n            function showRandomOuterAvailability() {\r\n                resetOuterSlots();\r\n\r\n                const shuffledSlots = shuffle(outerSlots);\r\n\r\n                const bookedCount = 7;\r\n\r\n                const bookedSlots = shuffledSlots.slice(0, bookedCount);\r\n                const availableSlot = shuffledSlots[bookedCount];\r\n\r\n                bookedSlots.forEach(slot => {\r\n                    slot.classList.add(\'booked\');\r\n                    slot.disabled = true;\r\n                });\r\n\r\n                if (availableSlot) {\r\n                    availableSlot.classList.remove(\'booked\');\r\n                    availableSlot.disabled = false;\r\n                }\r\n            }\r\n\r\n            resetOuterSlots();\r\n\r\n            clearBtn.addEventListener(\'click\', () => {\r\n                startInput.value = \'\';\r\n                endInput.value = \'\';\r\n                lastStart = \'\';\r\n                lastEnd = \'\';\r\n\r\n                resetOuterSlots();\r\n\r\n                banner.classList.add(\'d-none\');\r\n            });\r\n\r\n            checkBtn.addEventListener(\'click\', () => {\r\n                const start = startInput.value;\r\n                const end = endInput.value;\r\n\r\n                if (!start || !end) {\r\n                    alert(\'Please select both start and end dates.\');\r\n                    return;\r\n                }\r\n\r\n                if (end < start) {\r\n                    alert(\'End date must be after start date.\');\r\n                    return;\r\n                }\r\n\r\n                if (start !== lastStart || end !== lastEnd) {\r\n                    lastStart = start;\r\n                    lastEnd = end;\r\n\r\n                    showRandomOuterAvailability();\r\n\r\n                    banner.classList.remove(\'d-none\');\r\n                }\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        const heroSwiper = new Swiper(\".homeHeroSwiper\", {\r\n            loop: true,\r\n            autoplay: {\r\n                delay: 3500,\r\n                disableOnInteraction: false,\r\n            },\r\n            speed: 800,\r\n            effect: \"fade\",\r\n            fadeEffect: {\r\n                crossFade: true\r\n            }\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const start = document.getElementById(\'initial-start-date\');\r\n            const end = document.getElementById(\'initial-end-date\');\r\n\r\n            const today = new Date().toISOString().split(\'T\')[0]; // YYYY-MM-DD\r\n\r\n            start.min = end.min = today;\r\n\r\n            start.addEventListener(\'change\', () => {\r\n                end.min = start.value || today;\r\n            });\r\n        });\r\n    </script>\r\n</body>', 1, 2, 0, 1, 1, 1, 1766937052, 1, 1775126550, 0, 0, 0, 0, 0, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1);
INSERT INTO `modxwl_site_content` (`id`, `type`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible`) VALUES
(2, 'document', 'About', '', '', 'about', '', 1, 0, 0, 0, 0, '', '<body id = \"aboutPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/about-hero.jpg\" alt=\"Airport Parking - About Us\">\r\n        <div class=\"hero-content\">\r\n            <h1>About Us</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- About Us section starts -->\r\n    <section id=\"about-us\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row justify-content-center align-items-center\">\r\n                <div class=\"col-12 col-md-6\">\r\n           <p style=\"text-align: justify;\">\r\n<strong><a href=\"https://www.airportparking.lk/\">airportparking.lk</a></strong> is the first and leading airport parking facility provider in Sri Lanka and a proud member of Explore Holdings. Through our parking service, you can enjoy the safest parking facility at the most affordable rates. Our parking facility is located close to the International Airport of Sri Lanka, allowing clients to enjoy stress-free parking and quickly reach the airport.\r\n</p>\r\n\r\n<p style=\"text-align: justify;\">\r\nOur 24/7 support service aims to satisfy our clients by providing a high-quality and secure parking experience.</p>\r\n<p style=\"text-align: justify;\">\r\nAdditionally, we are proud to introduce <strong><a href=\"https://www.explore.vacations\">explore.vacations</a></strong>, another member of the Explore Holdings family, which allows you to easily search and book accommodations and travel experiences throughout Sri Lanka.\r\n</p>\r\n\r\n<p style=\"text-align: justify;\">\r\nAs a foreigner or local client, you can take advantage of our airport pickup and drop-off services, ensuring a smooth and convenient travel experience.\r\n</p>\r\n\r\n</p>\r\n\r\n                </div>\r\n                <div class=\"col-12 col-md-6\">\r\n                    <img src=\"assets/images/about-us.jpg\" alt=\"About Airport Parking Sri Lanka\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n            <div class=\"row about-details\">\r\n                <div class=\"col-12 d-flex justify-content-center\">\r\n                    <p>Park with us and enjoy a stress-free start to your journey. Our secure parking and convenient shuttle services <br> ensure your trip begins comfortably and worry-free!!</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- About Us section ends -->\r\n\r\n    <!-- Vision & Mission section starts -->\r\n    <section id=\"vission-mission\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row mb-4\">\r\n                <div class=\"col-12 text-center\">\r\n                    <h2 class=\"heading\">Our Vision & Mission</h2>\r\n                    <p class=\"supportive-text text-center\">Committed to Excellence in Airport Parking and Travel Services</p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row justify-content-center g-4\">\r\n                <!-- Vision Card -->\r\n                <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <div class=\"flip-card\">\r\n                    <div class=\"flip-card-inner\">\r\n                        <div class=\"flip-card-front text-center p-4\">\r\n                        <h3>Our Vision</h3>\r\n                        <p>See what drives us forward</p>\r\n                        </div>\r\n                        <div class=\"flip-card-back text-center p-4\">\r\n                        <p>\r\n                            To be Sri Lanka\'s leading provider of secure, convenient, and customer-friendly airport parking and travel services, delivering excellence and peace of mind to every traveler.\r\n                        </p>\r\n                        </div>\r\n                    </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Mission Card -->\r\n                <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <div class=\"flip-card\">\r\n                    <div class=\"flip-card-inner\">\r\n                        <div class=\"flip-card-front text-center p-4\">\r\n                        <h3>Our Mission</h3>\r\n                        <p>See how we achieve our vision</p>\r\n                        </div>\r\n                        <div class=\"flip-card-back text-center p-4\">\r\n                        <p>\r\n                            To provide secure parking, seamless airport transfers, and premium travel solutions while maintaining the highest standards of reliability, efficiency, and customer satisfaction.\r\n                        </p>\r\n                        </div>\r\n                    </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Vision & Mission section ends -->\r\n\r\n    <!-- Reserve Slot section starts -->\r\n    <section id=\"reserve-slots\" class=\"py-5 text-center\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-12\">\r\n                    <h2 class=\"heading mb-3\">Reserve Your Parking Slot Now</h2>\r\n                    <p class=\"supportive-text mb-4 text-center\">\r\n                        Secure your vehicle in advance and enjoy a hassle-free start to your journey.\r\n                    </p>\r\n                    <a href=\"[[~1]]#reserve-slots\" class=\"btn btn-primary btn-lg\">\r\n                        Reserve Slot\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Reserve Slot section ends -->\r\n</body>', 1, 2, 1, 1, 1, 1, 1766986259, 1, 1770079705, 0, 0, 0, 1766986260, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(3, 'document', 'Contact', '', '', 'contact', '', 1, 0, 0, 0, 0, '', '\r\n<body id=\"contactPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/contact-hero.jpg\" alt=\"Airport Parking - Contact Us\">\r\n        <div class=\"hero-content\">\r\n            <h1>Contact Us</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- Contact us starts -->\r\n    <section id=\"contactContent\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-12\">\r\n                    <h2 class=\"heading\" data-aos=\"fade-down\">Get in touch with us</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"row\">\r\n                <p class=\"justify-text mb-0\">Have questions about our airport parking services? We’re happy to help. Contact us to reserve your slot or get personalized assistance, and let our friendly team ensure a smooth, stress-free start to your journey...</p>\r\n                <div class=\"img-container col-12 col-lg-5 order-lg-2\" data-aos=\"fade-left\">\r\n                    <img src=\"assets/images/contact-form-img.png\" alt=\"Airport Parking - contact image\" class= \"img-fluid\">\r\n                </div>\r\n                <div class=\"col-12 col-lg-7 pt-3\">\r\n                    <form action=\"[[~3]]\" method=\"POST\" data-aos=\"fade-right\">\r\n                        [[!ContactUs]]\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Contact us ends -->\r\n\r\n    <div style=\"margin-bottom: -22px;\">\r\n        <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d69704.75036294853!2d79.83616751972946!3d7.107632678455203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2f16b53527527%3A0xfa15e5c2744b0e7f!2sAirport%20Parking%20Sri%20Lanka!5e0!3m2!1sen!2slk!4v1766638738533!5m2!1sen!2slk\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\r\n    </div>\r\n</body>', 1, 2, 2, 1, 1, 1, 1766986275, 1, 1766986281, 0, 0, 0, 1766986281, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(4, 'document', 'FAQ', '', '', 'faq', '', 1, 0, 0, 0, 0, '', '<body id=\"faqPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/faq-hero.jpg\" alt=\"Airport Parking - FAQ\">\r\n        <div class=\"hero-content\">\r\n            <h1>FAQ</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- FAQ section starts -->\r\n    <section id=\"faq\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row mb-4\">\r\n                <div class=\"col text-center\">\r\n                    <h2 class=\"heading text-center\">Frequently Asked Questions</h2>\r\n                    <p class=\"supportive-text text-center\">\r\n                        Find answers to common questions about our airport parking services\r\n                    </p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row\">\r\n                <div class=\"col-12 col-md-6\">\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I send different driver to collect the vehicle?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                <b>NO </b>. We recommend you to come and collect the vehicle all the times due to security reasons.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Do we need to sign an agreement\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, you have to fill some details for the vehicle before you leave, we recommend you to be their 15 minutes before your departure\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                           Can I get my vehicle cleaned when I return?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes of course we can do the clean-up on the day of your arrival with an additional charge.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            What would be the daily parking price?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                You can check the price online.  Just enter your departure date & time and your arrival date & time. Then you\'ll get the exact amount which you need to pay.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            How can I book a parking lot?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                               Reserve your parking slot via the <b>Reserve Slot</b> section on our main page or WhatsApp us your vehicle number and booking time at\r\n<b>+94 76 1414 557</b>                            \r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n                </div> \r\n                <div class=\"col-12 col-md-6\">\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I send the details in advance and what are the details\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, if you can send the following details by email, so you don’t need to wait longer filling the documents \r\n                                <ul class=\"list-unstyled\">\r\n                                    <li>i. Vehicle Book copy</li>\r\n                                    <li>ii. Owners National Identification Card (NIC) and the Owners Driving License Copy</li>\r\n                                    <li>iii. Residence Prof document for the owner of the vehicle</li>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Safety of the Vehicle\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                You will get a GPS tracking when you park the vehicle and any part of the world you can simply log in and check your vehicle\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                           How can I make the payments?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                We have 2 payment methods for you.\r\n                                <ul>\r\n                                    <li>Do a bank transfer and send us the slip by Viber / WhatsApp.</li>\r\n                                    <li>You can pay on the spot when you park the vehicle</li>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I book online?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, you can book online! Just use the <strong>Reserve Slot</strong> section\r\n                                on the main page and submit your details to reserve your parking slot in advance.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- FAQ section ends -->\r\n\r\n    <script>\r\n        document.querySelectorAll(\'.faq-question\').forEach(button => {\r\n            button.addEventListener(\'click\', () => {\r\n                const item = button.closest(\'.faq-item\');\r\n                document.querySelectorAll(\'.faq-item\').forEach(i => {\r\n                    if (i !== item) i.classList.remove(\'active\');\r\n                });\r\n\r\n                item.classList.toggle(\'active\');\r\n            });\r\n        });\r\n    </script>\r\n</body>', 1, 2, 3, 1, 1, 1, 1766986295, 1, 1767153235, 0, 0, 0, 1766986260, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(5, 'document', 'Gallery', '', '', 'gallery', '', 1, 0, 0, 0, 0, '', '<body id=\"galleryPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/gallery-hero.jpg\" alt=\"Airport Parking - Gallery\">\r\n        <div class=\"hero-content\">\r\n            <h1>Gallery</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- Gallery content starts-->\r\n    <section id=\"galleryContent\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div id=\"image-gallery\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-1.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-1.webp\" alt=\"Secure Parking Area\">\r\n                            <div class=\"gallery-overlay\">Secure Parking Area</div>\r\n                        </a>\r\n                    </div>\r\n\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-2.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-2.webp\" alt=\"24/7 CCTV Surveillance\">\r\n                            <div class=\"gallery-overlay\">24/7 CCTV SURVEILLANCE</div>\r\n                        </a>\r\n                    </div>\r\n\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-3.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-3.webp\" alt=\"Spacious Parking Bays\">\r\n                            <div class=\"gallery-overlay\">Spacious Parking Bays</div>\r\n                        </a>\r\n                    </div>\r\n\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-4.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-4.webp\" alt=\"Easy Airport Access\">\r\n                            <div class=\"gallery-overlay\">Easy Airport Access</div>\r\n                        </a>\r\n                    </div>\r\n\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-5.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-5.webp\" alt=\"Well Maintained Facility\">\r\n                            <div class=\"gallery-overlay\">Well Maintained Facility</div>\r\n                        </a>\r\n                    </div>\r\n\r\n                    <div class=\"col-12 col-md-4 gallery-item\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-6.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-6.webp\" alt=\"Professional Operations Team\">\r\n                            <div class=\"gallery-overlay\">Professional Operations Team</div>\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Gallery content starts-->\r\n\r\n    <script>\r\n        // Js for gallery page\r\n        const container = document.querySelector(\'#image-gallery\');\r\n        window.lightGallery(container, {\r\n            selector: \'.lg-item\',\r\n            zoomFromOrigin: true,\r\n            download: false,\r\n            thumbnail: true,\r\n            closeButton: true,\r\n        });\r\n    </script>\r\n\r\n</body>', 1, 2, 4, 1, 1, 1, 1766986319, 1, 1767095192, 0, 0, 0, 1766986320, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(6, 'document', 'home1', '', '', 'home1', '', 1, 0, 0, 0, 0, '', '<body id = \"homePage\">\r\n    <!-- Home hero starts -->\r\n    <section id=\"homeHero\">\r\n        <div class=\"swiper homeHeroSwiper\">\r\n            <div class=\"swiper-wrapper\">\r\n                <!-- Slide 1 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-1.jpg\" alt=\"Airport Parking\"class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 2 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-2.jpg\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 3 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-3.jpg\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- Hero Content -->\r\n        <div class=\"homehero-content\">\r\n            <h1 data-aos=\"fade-down-right\" data-aos-duration=\"1000\">\r\n                Secure Parking  <br class=\"d-md-none\">\r\n                Designed <br class=\"d-none d-md-block\">\r\n                Around Your Journey\r\n            </h1>\r\n            <p class=\"mt-3\" data-aos=\"fade-down-left\" data-aos-duration=\"1000\">\r\n                Secure, convenient parking designed to keep your journey smooth.<br>\r\n                Reliable access, peace of mind, and hassle-free arrivals and returns.\r\n            </p>\r\n            <a href=\"#reserve-slots\" class=\"mt-3\">Reserve Your Space</a>\r\n        </div>\r\n\r\n    </section>\r\n    <!-- Home hero ends -->\r\n\r\n    <!-- Who we are section starts -->\r\n    <section id=\"who-we-are\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row d-flex align-items-center justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-8\">\r\n                    <h2 class=\"heading\">Who We Are</h2>\r\n                    <p class=\"supportive-text\">Airport Parking Service</p>\r\n                    <p>Airportparking.lk is a one of the wing company of SR Rent a car. We are one of the airport parking facility provider in Sri Lanka.Through our parking service you can enjoy safest parking facility with lawest budget. Also our parking facilty located in near to the International airport of Sri Lanka.Therefore our clients can be able to get stress free parking facilty and quickly reach to the Airport.</p>\r\n                    <p class=\"mb-0\">Our facility is monitored around the clock and managed by a trained team to ensure your vehicle remains safe and secure at all times. With easy access, flexible parking options, and reliable customer support, we aim to make every journey start and end with complete peace of mind.</p>\r\n                </div>\r\n                 <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <img src=\"assets/images/who-we-are.jpeg\" alt=\"Who we are image\" class=\"img-fluid rounded-3 mt-4 mt-md-0\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Who we are section ends -->\r\n\r\n    <!-- Why Choose Us section starts -->\r\n    <section id=\"why-choose-us\" class=\"py-3\">\r\n        <div class=\"container\">\r\n            <div class=\"row g-5 justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-4 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-1.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>SAFE AND SECURE PARKING AREAS</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-4 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-2.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>FRIENDLY AND EFFICIENT STAFF</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-4 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-3.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>ONLINE BOOKING FACILITY</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Why Choose Us section ends -->\r\n\r\n    <!--Reserve Slots section starts -->\r\n    <section id=\"reserve-slots\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Reserve Your Parking Slot Today</h2>\r\n                    <p class=\"supportive-text text-center\">Book your parking space in advance and enjoy a hassle-free experience.</p>\r\n                </div>\r\n                <div class=\"col-12 d-flex justify-content-center\">\r\n                    <div class=\"parking-building-wrapper\">\r\n                        <!-- Legend -->\r\n                        <div class=\"parking-legend\">\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"available\"></span> Available\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"selected\"></span> Selected\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"booked\"></span> Booked\r\n                            </div>\r\n                        </div>\r\n\r\n                        <!-- Parking layout -->\r\n                        <div class=\"floor active\">\r\n                            <!-- Row 1 -->\r\n                            <div class=\"row parking-row\">\r\n                                <div class=\"bay left\">\r\n                                <button class=\"slot\">A1</button>\r\n                                <button class=\"slot booked\">A2</button>\r\n                                <button class=\"slot\">A3</button>\r\n                                <button class=\"slot\">A4</button>\r\n                                <span class=\"marker elevator\">', 1, 2, 5, 1, 1, 1, 1766987427, 1, 1766987441, 1, 1766988448, 1, 1766987441, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_htmlsnippets`
--

CREATE TABLE `modxwl_site_htmlsnippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_site_htmlsnippets`
--

INSERT INTO `modxwl_site_htmlsnippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `static`, `static_file`) VALUES
(1, 1, 0, 'footer', '', 0, 0, 0, '<footer>\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-12 col-lg-4 col order-lg-1 \">\n                <h2 class=\"footer-logo m-0\"><img src=\"assets/images/footer-logo.png\" alt=\"Airport Parking | Logo\" class=\"img-fluid\"></h2>\n                <p class=\"my-3 my-lg-4\">Start your journey stress-free,<br>with secure and easy parking.\n                </p>\n                <ul class=\"list-unstyled d-flex\" id=\"footer-social-list\">\n                    <li class=\"me-2\">\n                        <a href=\"https://www.facebook.com/airportparkinglk\" target=\"_blank\" aria-label=\"Airport Parking on Facebook\" title=\"Facebook\">\n                            <i class=\"fa-brands fa-facebook-f\"></i>\n                        </a>\n                    </li>\n                    <li class=\"mx-2\">\n                        <a href=\"https://www.instagram.com/airportparking.lk/\" target=\"_blank\" aria-label=\"Airport Parking on Instagram\" title=\"Instagram\">\n                            <i class=\"fa-brands fa-instagram\"></i>\n                        </a>\n                    </li>\n                    <li class=\"ms-2\">\n                        <a href=\"https://wa.me/94761414557\" target=\"_blank\" alt=\"whatsapp\" aria-label=\"Chat with Airport Parking on WhatsApp\" title=\"WhatsApp\">\n                            <i class=\"fa-brands fa-whatsapp\"></i>\n                        </a>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"col-12 col-md-6 col-lg-4 order-lg-2\">\n                <h2 class=\"my-4 mt-lg-0\">Links</h2>\n                <ul class=\"list-unstyled\" id=\"footer-nav-link-list\">\n                    <li>\n                        <a href=\"./\">Home</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~2]]\">About</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~4]]\">FAQ</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~5]]\">Gallery</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~3]]\">Contact</a>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"col-12 col-md-6 col-lg-4 order-lg-4\">\n                <h2 class=\"my-4 mt-lg-0\">Contact</h2>\n                <ul class=\"list-unstyled\" id=\"footer-contact-list\">\n                 <li>\n                        <img src=\"assets/images/icons/footer-phone.svg\" \n                            alt=\"Airport Parking | Footer Contact Icon\" \n                            class=\"img-fluid me-1\">\n\n                        <a href=\"tel:+94761414557\">+94 76 141 4557</a>\n                    </li>\n                    <li class=\"d-flex align-items-center\">\n                        <img src=\"assets/images/icons/footer-email.svg\" alt=\"Airport Parking | Footer Contact Icon\" class=\"img-fluid me-1\">\n                        <div class=\"d-inline-block\">\n                            <a href=\"mailto:info@airportparking.lk\">info@airportparking.lk</a> \n                        </div>\n                    </li>\n                    <li>\n                        <img src=\"assets/images/icons/footer-location.svg\" alt=\"Airport Parking | Footer Contact Icon\" class=\"img-fluid me-1\">\n                        <a href=\"https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A\" target=\"_blank\">371/5 Negombo Rd, Seeduwa</a>\n                    </li>\n                </ul>\n            </div>\n        </div>\n        <div class=\"row\">\n            <div class=\"col-12\">\n                <p class=\"m-0 py-4\">Designed and Developed by <a href=\"https://explore.vacations/\" target=\"_blank\">Explore Vacations</a>. <br class=\"d-md-none\">© <span id=\"currentYear\"></span>\n\n</p>\n            </div>\n        </div>\n    </div>\n</footer>\n\n<!--Whatsapp widget-->\n<div id=\"whatsapp-widget\">\n    <div class=\"chat-header\" id=\"chat-header\">\n        <div class=\"avatar-container\">\n            <img src=\"assets/images/whatsapp-img.jpg\" alt=\"logo\" class=\"img-fluid\">\n            <div class=\"online-dot\"></div>\n        </div>\n        <div class=\"chat-header-info\">\n            <span style=\"transform: translateY(2px);\">Airport Parking</span>\n            <div style=\"color: #eeeeee;\">online</div>\n\n        </div>\n        <button class=\"close-btn\" id=\"close-btn\">&times;</button>\n    </div>\n    <div class=\"chat-content\" id=\"chat-content\">\n    </div>\n    <div class=\"message-input\" id=\"message-input\">\n        <button class=\"whatsapp-btn\" id=\"whatsapp-btn\">Chat in WhatsApp</button>\n    </div>\n    <div class=\"chat-icon\" id=\"chat-icon\">\n        <img src=\"https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg\" alt=\"WhatsApp\" class=\"img-fluid\">\n    </div>\n</div>\n\n<script>\n    document.getElementById(\"currentYear\").textContent = new Date().getFullYear();\n</script>\n', 0, 'a:0:{}', 0, ''),
(2, 1, 0, 'header', '', 0, 0, 0, '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n<!-- Google tag (gtag.js) -->\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-0Q3Z5R8FLW\"></script>\n<script>\n  window.dataLayer = window.dataLayer || [];\n  function gtag(){dataLayer.push(arguments);}\n  gtag(\'js\', new Date());\n \n  gtag(\'config\', \'G-0Q3Z5R8FLW\');\n</script>\n\n    <!-- Meta Tags -->\n    <meta charset=\"UTF-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta name=\"description\" content=\"<?php echo WEBSITE_DESCRIPTION; ?>\">\n    <meta name=\"keywords\" content=\"<?php echo WEBSITE_KEYWORDS; ?>\">\n    <meta name=\"author\" content=\"Airport Parking\">\n    <meta name=\"robots\" content=\"index, follow\">\n\n    <!-- Page Title -->\n    <title>Airport Parking</title>\n\n    <!-- Favicon -->\n    <link rel=\"icon\" href=\"assets/images/favicon.ico\" type=\"image/x-icon\">\n\n    <!-- Canonical URL -->\n    <link rel=\"canonical\" href=\"\">\n\n    <!-- Fontawesome -->\n    <link rel=\"stylesheet\" href=\"node_modules/@fortawesome/fontawesome-free/css/all.min.css\">\n    <!-- Swiper JS -->\n    <link rel=\"stylesheet\" href=\"node_modules/swiper/swiper-bundle.min.css\">\n    <!-- AOS Animations CSS -->\n    <link href=\"node_modules/aos/dist/aos.css\" rel=\"stylesheet\">\n    <!-- Lightgallery -->\n    <link type=\"text/css\" rel=\"stylesheet\" href=\"node_modules/lightgallery/css/lightgallery-bundle.css\" />\n    <!-- Stylesheets -->\n    <link rel=\"stylesheet\" href=\"node_modules/bootstrap/dist/css/bootstrap.min.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/variables.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/overrides.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/responsive.css\">\n    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css\">\n\n</head>\n\n<body>\n<!-- Google Tag Manager (noscript) -->\n<noscript><iframe src=\"https://www.googletagmanager.com/ns.html?id=GTM-NR5R9R38\"\nheight=\"0\" width=\"0\" style=\"display:none;visibility:hidden\"></iframe></noscript>\n<!-- End Google Tag Manager (noscript) -->\n\n     <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js\"></script>\n     <!-- SweetAlert2 CSS & JS -->\n     <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>\n    <!-- Bootstrap -->\n    <script src=\"node_modules/bootstrap/dist/js/bootstrap.min.js\"></script>\n    <!-- Swiper JS -->\n    <script src=\"node_modules/swiper/swiper-bundle.min.js\"></script>\n    <!-- AOS Animations JS -->\n    <script src=\"node_modules/aos/dist/aos.js\"></script>\n    <!-- Whatsapp widget JS -->\n    <script src=\"assets/js/whatsapp-widget.js\"></script>\n    <!-- Lightgallery -->\n    <script src=\"node_modules/lightgallery/lightgallery.umd.js\"></script>\n    <!-- Custom JS -->\n    <script src=\"assets/js/script.js\"></script>\n    <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>\n    <!-- Scroll to Top Button -->\n    <button id=\"scrollTopBtn\" title=\"Go to top\"><img src=\"assets/images/top-icon.png\" alt=\"top-icon\" class=\"img-fluid\" style=\"\n        width: 20px;\n        height: 20px;\n        display: flex;\n    \"></button>\n\n</body>\n\n<script>\n    //Get the button\n    const scrollTopBtn = document.getElementById(\"scrollTopBtn\");\n\n    // Show button when user scrolls down 100px\n    window.onscroll = function() {scrollFunction()};\n\n    function scrollFunction() {\n        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {\n            scrollTopBtn.style.display = \"block\";\n        } else {\n            scrollTopBtn.style.display = \"none\";\n        }\n    }\n\n    // Scroll to top smoothly when clicked\n    scrollTopBtn.addEventListener(\'click\', () => {\n        window.scrollTo({\n            top: 0,\n            behavior: \'smooth\'\n        });\n    });\n</script>\n\n</html>', 0, 'a:0:{}', 0, ''),
(3, 1, 0, 'navbar', '', 0, 0, 0, '<header>\n\n    <!-- Top Info Bar -->\n    <div class=\"top-bar\">\n        <div class=\"container d-flex justify-content-between align-items-center\">\n            <div class=\"top-left\">\n               <a href=\"https://wa.me/94761414557\" target=\"_blank\" class=\"top-link\">\n                    <i class=\"fa-brands fa-whatsapp fa-lg\"></i> +94 76 1414 557\n                </a>\n                <a href=\"mailto:info@airportparking.lk\" class=\"top-link\">\n                    <i class=\"fa-regular fa-envelope fa-lg\"></i> info@airportparking.lk\n                </a>\n            </div>\n            <div class=\"top-right\">\n                <a href=\"https://airport.lk/\" class=\"top-link\" target=\"_blank\">\n                    <i class=\"fa-solid fa-plane\"></i> Flight Info\n                </a>\n                <a href=\"https://srilankarentacar.com/\" class=\"top-btn\" target=\"_blank\">\n                    SR Rent a Car\n                </a>\n            </div>\n        </div>\n    </div>\n\n    <!-- Navbar -->\n    <nav class=\"navbar navbar-expand-lg p-lg-0\">\n        <div class=\"container d-flex align-items-center justify-content-between\">\n\n            <a class=\"navbar-brand\" href=\"./\">\n                <img src=\"assets/images/logo-header.png\" alt=\"Airport Parking | Logo\">\n            </a>\n\n            <button class=\"navbar-toggler border-0\" type=\"button\" data-bs-toggle=\"offcanvas\" data-bs-target=\"#offcanvasNavbar\" aria-label=\"Open navigation menu\">\n                <i class=\"fa-solid fa-bars\"></i>\n            </button>\n\n            <div class=\"offcanvas offcanvas-start\" tabindex=\"-1\" id=\"offcanvasNavbar\">\n                <div class=\"offcanvas-header\">\n                    <!-- <h5 class=\"offcanvas-title\">Airport Parking</h5> --> \n                <img src=\"assets/images/logo.png\" alt=\"Airport Parking | Logo\" style=\"width: 50%;\">\n\n                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"offcanvas\"></button>\n                </div>\n                <div class=\"offcanvas-body pt-0\">\n                    <ul class=\"navbar-nav ms-auto align-items-lg-center\">\n                        <li class=\"nav-item\"><a class=\"nav-link active\" href=\"./\">Home</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~2]]\">About</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~4]]\">FAQ</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~5]]\">Gallery</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~3]]\">Contact</a></li>\n                    </ul>\n                </div>\n            </div>\n\n        </div>\n    </nav>\n\n</header>\n\n<script>\nwindow.addEventListener(\"scroll\", function () {\n    const navbar = document.querySelector(\".navbar\");\n\n    if (window.scrollY > 50) {\n        navbar.classList.add(\"scrolled\");\n    } else {\n        navbar.classList.remove(\"scrolled\");\n    }\n});\n</script>\n\n', 0, 'a:0:{}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_plugins`
--

CREATE TABLE `modxwl_site_plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `plugincode` mediumtext NOT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_plugin_events`
--

CREATE TABLE `modxwl_site_plugin_events` (
  `pluginid` int(11) NOT NULL DEFAULT 0,
  `event` varchar(191) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `propertyset` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_snippets`
--

CREATE TABLE `modxwl_site_snippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_site_snippets`
--

INSERT INTO `modxwl_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(1, 1, 0, 'ContactUs', '', 0, 0, 0, 'ob_start();\n\ninclude(\'config-details.php\');\ninclude(\'assets/classes/EmailSender.php\');\n\n$errors = [];\n$successMessage = \'\';\n$errorMessage = \'\';\n\n$name = $email = $phone = $message = \'\';\n$recaptcha_response = \'\';\n\n// Handle form submission\nif ($_SERVER[\'REQUEST_METHOD\'] === \'POST\') {\n\n    $name    = test_input($_POST[\'name\'] ?? \'\');\n    $email   = test_input($_POST[\'email\'] ?? \'\');\n    $phone   = preg_replace(\'/\\D+/\', \'\', $_POST[\'phone\'] ?? \'\');\n    $message = test_input($_POST[\'message\'] ?? \'\');\n    $recaptcha_response = $_POST[\'recaptchaResponse\'] ?? \'\';\n\n    if (!verifyRecaptcha($recaptcha_response)) {\n        $errors[\'recaptcha\'] = \"reCAPTCHA validation failed.\";\n    }\n\n    if (empty($name)) {\n        $errors[\'name\'] = \"Name is required\";\n    }\n\n    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {\n        $errors[\'email\'] = \"Enter a valid email address\";\n    }\n\n    if (empty($phone)) {\n        $errors[\'phone\'] = \"Contact number is required\";\n    }\n\n    if (empty($message)) {\n        $errors[\'message\'] = \"Message is required\";\n    }\n\n    if (empty($errors)) {\n        $emailSender = new EmailSender();\n        $emailTo = SMTP_USERNAME;\n        $emailSubject = \'Contact Form Message\';\n\n        $emailContent = \"\n            <table cellpadding=\'6\'>\n                <tr><td><b>Name</b></td><td>{$name}</td></tr>\n                <tr><td><b>Email</b></td><td>{$email}</td></tr>\n                <tr><td><b>Phone</b></td><td>{$phone}</td></tr>\n                <tr><td><b>Message</b></td><td>\".nl2br($message).\"</td></tr>\n            </table>\n        \";\n\n        if ($emailSender->sendEmail($emailTo, $emailSubject, $emailContent)) {\n            $successMessage = \"Your message has been sent successfully!\";\n            $name = $email = $phone = $message = \'\';\n        } else {\n            $errorMessage = \"Sorry, there was an issue sending your message.\";\n        }\n    }\n}\n?>\n\n<div class=\"row\">\n\n    <!-- Success / Error Messages -->\n    <div class=\"col-12\">\n        <?php if (!empty($successMessage)): ?>\n            <div class=\"alert alert-success alert-dismissible fade show text-center\">\n                <?= $successMessage ?>\n                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>\n            </div>\n        <?php elseif (!empty($errorMessage)): ?>\n            <div class=\"alert alert-danger alert-dismissible fade show text-center\">\n                <?= $errorMessage ?>\n                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>\n            </div>\n        <?php endif; ?>\n    </div>\n\n    <!-- Name -->\n    <div class=\"col-12 my-3\">\n        <label class=\"form-label\">Name<span class=\"text-danger\">*</span></label>\n        <input type=\"text\" name=\"name\" class=\"form-control\" value=\"<?= htmlspecialchars($name) ?>\">\n        <?php if (!empty($errors[\'name\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'name\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Email -->\n    <div class=\"col-md-6 my-3\">\n        <label class=\"form-label\">Email<span class=\"text-danger\">*</span></label>\n        <input type=\"email\" name=\"email\" class=\"form-control\" value=\"<?= htmlspecialchars($email) ?>\">\n        <?php if (!empty($errors[\'email\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'email\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Phone -->\n    <div class=\"col-md-6 my-3\">\n        <label class=\"form-label\">Phone<span class=\"text-danger\">*</span></label>\n        <input type=\"tel\" name=\"phone\" class=\"form-control\" value=\"<?= htmlspecialchars($phone) ?>\">\n        <?php if (!empty($errors[\'phone\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'phone\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Message -->\n    <div class=\"col-12 my-3\">\n        <label class=\"form-label\">Message<span class=\"text-danger\">*</span></label>\n        <textarea name=\"message\" rows=\"5\" class=\"form-control\"><?= htmlspecialchars($message) ?></textarea>\n        <?php if (!empty($errors[\'message\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'message\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- reCAPTCHA -->\n    <input type=\"hidden\" name=\"recaptchaResponse\" id=\"recaptchaResponse\">\n    <?php if (!empty($errors[\'recaptcha\'])): ?>\n        <div class=\"col-12\">\n            <small class=\"text-danger\"><?= $errors[\'recaptcha\'] ?></small>\n        </div>\n    <?php endif; ?>\n\n    <!-- Submit -->\n    <div class=\"col-12 mt-4\">\n        <input type=\"submit\" name=\"submit\" value=\"Send Message\">\n    </div>\n</div>\n\n<!-- Google reCAPTCHA -->\n<script src=\"https://www.google.com/recaptcha/api.js?render=<?= GOOGLE_RECAPTCHA_SITE_KEY ?>\"></script>\n<script>\n    grecaptcha.ready(function() {\n        grecaptcha.execute(\'<?= GOOGLE_RECAPTCHA_SITE_KEY ?>\', {action: \'submit\'}).then(function(token) {\n            document.getElementById(\'recaptchaResponse\').value = token;\n        });\n    });\n</script>\n\n\n<?php\nreturn ob_get_clean();', 0, 'a:0:{}', '', 0, ''),
(2, 1, 0, 'home', '', 0, 0, 0, '', 0, 'a:0:{}', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_templates`
--

CREATE TABLE `modxwl_site_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `template_type` int(11) NOT NULL DEFAULT 0,
  `content` mediumtext NOT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT '',
  `preview_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_site_templates`
--

INSERT INTO `modxwl_site_templates` (`id`, `source`, `property_preprocess`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `properties`, `static`, `static_file`, `preview_file`) VALUES
(1, 0, 0, 'BaseTemplate', '', 0, 0, '', 0, '<!doctype html>\n<html lang=\"en\">\n<head>\n    <title>[[*pagetitle]] - [[++site_name]]</title>\n    <base href=\"[[!++site_url]]\">\n    <meta charset=\"[[++modx_charset]]\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n\n    <style>\n        body {\n            background-color: #eee;\n            font-family: sans-serif;\n            font-size: 20px;\n            line-height: 1.4em;\n            padding: 0;\n            margin: 0;\n        }\n        body.loaded {\n            font-family: \'Open Sans\', sans-serif;\n        }\n        .container {\n            display: block;\n            max-width: 960px;\n            margin: 2em auto 2em;\n            padding: 2em;\n            background: #fff;\n            border: 1px solid #ddd;\n            border-radius: 3px;\n        }\n        .container > section {\n            height: 100%;\n            width: 60%;\n            display: inline-block;\n            float: left;\n            margin-bottom: 2em;\n        }\n        .container > aside {\n            height: 100%;\n            display: inline-block;\n            width: 30%;\n            border-left: 2px dashed #eee;\n            float: right;\n            padding-left: 1.5em;\n        }\n        .logo {\n            background: url(\'[[++manager_url]]templates/default/images/modx-logo-color.svg\') no-repeat center transparent;\n            width: 220px;\n            height: 85px;\n            background-size: contain;\n            display: block;\n            position: relative;\n            text-indent: -9999px;\n            margin: 2em auto;\n        }\n        h1, h2, h3, h4, h5 {\n            color: #494949;\n            font-family: \'Open Sans\', sans-serif;\n            font-weight: 700;\n        }\n        h1 {\n            font-size: 36px;\n            color: #137899;\n        }\n        h2 {\n            font-size: 29px;\n        }\n        h3 {\n            font-size: 24px;\n        }\n        a {\n            color: #0f7096;\n        }\n        ul {\n            padding-left: 2em;\n        }\n        img {\n            max-width: 100%;\n        }\n        .cta-button {\n            display: block;\n            text-align: center;\n            vertical-align: middle;\n            -webkit-transform: translateZ(0);\n            transform: translateZ(0);\n            box-shadow: 0 0 1px rgba(0, 0, 0, 0);\n            -webkit-backface-visibility: hidden;\n            backface-visibility: hidden;\n            -moz-osx-font-smoothing: grayscale;\n            position: relative;\n            overflow: hidden;\n            margin: .2em 0;\n            padding: 1em;\n            cursor: pointer;\n            background: #67a749;\n            text-decoration: none;\n            border-radius: 3px;\n            color: #fff;\n            -webkit-tap-highlight-color: rgba(0,0,0,0);\n        }\n        .cta-button:before {\n            content: \"\";\n            position: absolute;\n            z-index: -1;\n            left: 50%;\n            right: 50%;\n            bottom: 0;\n            background: #137899;\n            height: 5px;\n            -webkit-transition-property: left, right;\n            transition-property: left, right;\n            -webkit-transition-duration: 0.3s;\n            transition-duration: 0.3s;\n            -webkit-transition-timing-function: ease-out;\n            transition-timing-function: ease-out;\n        }\n        .cta-button:hover:before, .cta-button:focus:before, .cta-button:active:before {\n            left: 0;\n            right: 0;\n        }\n        .companies {\n            clear: both;\n            display: block;\n            width: 100%;\n            padding: 1em 0 0;\n            border-top: 2px dashed #eee;\n        }\n        .companies h3 {\n            text-align: center;\n            margin: 0;\n        }\n        .companies ul {\n            margin: 0;\n            padding: 0;\n            list-style: none;\n            text-align: center;\n        }\n        .companies ul li {\n            display: inline-block;\n            padding: 0 1em;\n        }\n        .companies ul li:first-child {\n            padding-left: 0;\n        }\n        .companies ul li:last-child {\n            padding-right: 0;\n        }\n        .companies ul li a {\n            display: block;\n            position: relative;\n            text-indent: -99999px;\n            width: 200px;\n            height: 75px;\n            background-repeat: no-repeat;\n            background-size: 200px;\n            background-position: center;\n        }\n        .companies ul li.modmore a {\n            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAABxCAMAAAAUAqFnAAADAFBMVEUgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToB8YRCjAAAA/3RSTlMAAQIDBAUGBwgJCgsMDQ4PEBESExQVFhcYGRobHB0eHyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nzg5Ojs8PT4/QEFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFlaW1xdXl9gYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXp7fH1+f4CBgoOEhYaHiImKi4yNjo+QkZKTlJWWl5iZmpucnZ6foKGio6SlpqeoqaqrrK2ur7CxsrO0tba3uLm6u7y9vr/AwcLDxMXGx8jJysvMzc7P0NHS09TV1tfY2drb3N3e3+Dh4uPk5ebn6Onq6+zt7u/w8fLz9PX29/j5+vv8/f7rCNk1AAAXa0lEQVR4Ae3deVxU5eLH8e+wMCigqICguSSiiUiauedSmUtYXVtysbr6u+WtrpmWy22xunmte7Ml762riVppmpaauZuaqKSmLbmgoKip4CKOCrIzzPc3nDPnzHNmgQGGQJn3n3OYM/D6zGHOeeac80Cr48Sl+84YzOajXEJSDGapO+aMagaP64nXyJ1FtFiOcgk10OLqkm64bnh02k6rZeWMfoEq4+z6uD54DM+ke6KTP0XB43rwUDHdFp3HmqHm82ifSTdGZ4IvajoP7wS6NTonoabzeJBujn4xFDcAr9FTJptNGaPDjUe33d3R+QJuAN4nKDnpjRtPe6Pbo+/zuhGiH6Dk4I0YfTxtrUG5hOXSRmEbT/SabSlF22fN+NcIlEvAK2/PiD9M0QhP9BpN9yutMgajguq8RsEMT/Qard5ZWv0fKm4lrRZ5otdoTa9QdTEYFfcnWq1GjeaJfpWq3aiEdkaqvsf1whN9AyqhSQ5ViZ7otS/6Tk90T3RPdE90T3RP9BrJE13nY+WJXkui33pItat+1Uf3C2nbqVfvbu0b+8BWUMsO3Xrf0SkyCC7RBYQ1btw40NVuviGtoju2aVHfG2auRfeq08j8CiH+sOPfMLxxeAM9XKavW7euHuWir39TVCsdHPEPbx0bGxnqV+HoPanKbVSl0f06PP7BxpSMfJoVGpK+ejYKisYDXvpyb/o1I81y0hJmDghAqRoMfH3lL2mXDAZD+v41M4aEoXT1Bs5Yl5yRU2jKyzp/cM3bQyPLil633dAp8zf+euqi+RUyTiYu+GsMLCL6jH3/m90nLpgXXEjdvuBvnX1QhtYj3l390/G0tLRje755a2hzlCmk4yNT567+MfX81dxfvGCrQdy7W05czjUacy6lrH3tDr8KRe9O1eWGVRe93pA5R4zUylk9AGa3Tv7OQBvHXguFU70XpFPj4rLBcC72P6eolZ1fSvQ63SatSi2iVuHOJwMROWrOT1doY/+rzeBc2LiduRRlbvxzPTjlGzNmzp4LJiqSbKN3+DidGgcmNayp0bv/5yQdWtb1uV1GOnLqCTjWcRUd2NoPjoV9lEdHHEcPvn/eMTqWtC2HDl2aXh+OBb6UTnvHnvaGI+EPxycVUeOgNnqj/+TRzskna2J0n6FbTKyAj33hwAu5dMj4tg8cuDOVdDW6z53z0lgRh3rAkV6/0bGEaNhqNGrlJcqcRu9+hA6tCK150duygr70gi2veDr1bT3YGZlHl6N7r2VFZT8Ie2Ny6UzGIGgEvXeGAsfRh1yjE/tvruLoO1Be0UWsoBmwNY+l2KiHjbgiuh7d5wwrLH8QbD3FUuTeC1EUWWb0Pjl0Kikcish8qja6K3oiyqtdIV11zWC4aqKquA+0XqZVYVrKvr3Jp/NoNQdakQaq8k7s27xxx6Gzxc6jH2PFZbSC1mAjS3P1Vggi88qM3iSdpdjqC4uBtFpZmeghl6hKC6h49Is/xE8ZNaBrp9vuHDU9IZ8i0+HFLwzp2DKiSbMOw+Iv0WKXF0TdimiRs2T4LfW9Ae+gqKHzrGkfgki3kYpNf46qIz3UIGbk7OQqiM610Ig4x9L9Vrd80b9iqV51dMLLrMpE90uh1ZiKRv+pdyMI2i+iomjP1Nv8YNX8K1oMgMArkRbrYiBoqa7peJDDs/5PPwCRftA590fnIIg+Z1leL1f0gdQyUSv3FkgmUDC6MtHxDa0u3lbB6F/CxlRaPKWDlk6p/gUE99Nivhe0ptHieVh576XsRGvY+LUKom+BoLORZbnStBzRdTsoKnq7Y6dZ1FgMs+YfUZDdHE7EUmXwgxNjKDCMrVOh6MthazllU2Ar7CIlaYGw+p6y77xg6zPKUvRQ9aEsr7v92LuL0S+fNtCBjJQf95ygjaJoWC2mVvrCd5ZdptY/y45+2Ev4WwSPwWwyRQVtgPkGij6F6PZBVhOouvbIIKtmEASnUXTkefdE72J0upc5h7LOwnqKKMm5BXYapVPWH6r/UfY+KhQ9+Y2HY5sGRdy9lFprhsc29gHq9t1IrRehapZNjYWhAG7+jhqn6pYe3VSQs0+JHk/RIki2UPQWUEjRpRYQJbBs4yB6nBo/uCe6z1FKjvnD1jDKRkI1mbL5cOBVyj6GQm9pmNOyYtHfEVYtehcW3kupsRqqp6mxSYcSQQepMdBZ9CMLp4+9v2/ndjffBFnAKQoKYyHpr32SHwwUFN4HjY0s29PQ+Iii79wTHespyWzsdFfj7/a/dR840Drf0tEHFrcWU7IeFYv+ARSJFP3m5eSir+N6KFZTVBAL2RBqzHIWfRRs3EHRXsj8jlJQ3EkT3TAUlY6Od6si+leUFETBVnQhJf+Gov5ZSn6vA0d2UZLXChajKZtQ6eh/oSirKRQfU3StBSyC0inaBAufJIr2OYv+OGy8SNGHsJhL0TNi9PXRcEN0DDvq/ugL1J0QW7cU2EaPNZU64vAeZffCYiZld1Q6esdiCoQVDqdGJydPeA6K9ym60thJ9CdgY7HjNM9QFK9ELzy+eBDgluio/9Smi6bqiz6Ustfh0Gjbg7YVlGQ2rXT0FtcoGg5FH2r0g8XDFJm6QzFMu6CLi9F1eylK2ZEo2ZFC0Q4l+qU3m8Ad0WVdlhVWX/TxlD0Gh/pS9p7N//sT+kpHD7/sZBe3t5PoUyjKioCis4mih12MHpBGF6TAQIusRR3dFP3BnSay+qLPoOzu0r/WWawkPEjJL3B39IllRv+AIuFt1yyLoudcjN40iy64CANVua+6I3rECpLVGf1/lHWFQy2vacfAA45Tst3t0SeUGf1Tin7VQVHvAkXTXIzeroAuuAwDBZ95Vzp6ZDKrOfo8SoyxcCjsEiVbbKKvr4boyylKhKrOSYrecTH67Sa6wIDLFH0EjS0s298gapRE0eZqiB5PSX7b0qPvqgHRV1G0VfPNleh9F6P3oGvRs6kxBKLFZ9MVaRlUFZ9LS1ecfRyiudTYWn1belEMHAq1RP9eiX6Ckm3VEP0birZD5X+covfcGj0D9yw0UrDXB4LAhg0UwfdQdaVVA1VDPQTtiyhInx5TDdE/oawLHGqWqd2yfZMo2VcN0RdS9LMOiqDzFL3hYvTbiumCdAB9TlLQA07cTtXlenBiOgUrmgDVEP3flPUr/VWWweJHSlJ8/vjo/6UoxReKiCsUTXQxetsCCozHjiQ7shJm7Q20mlKZ79N1P9Bqqw+qJfqLlD1a+kUb/4XFOkouhPzx0V+hyBACRQcjRSNcjB5+lYKc1n6O6OUur9NqQWWiB52mqrAzqif6MMqmwqHhtu/u2ZQY2//x0R+nyNgRivuocYeL0fUnSjlHp5SPgrWViR6eSdUhr2qK3pWyhaV/Aj0Ei4mUPfjHR+9GjdHCLynKbu5idGynaANK0TzbXWfD5lK1HdUUPcRASZIPHNlCiTEaFv0pm/nHR2+UQdFSKPbYnoHtYvSPqTER9jo0tLS6Uv0XO7gvOnZqR2ccf+yl+tv+e9rv7TT6oSqKju8putoEstuNFC2Aq9GfoIZpEmx0nJfZVrzY4YaJPoOyt+HAWPszKRM0X3KJvPZT8rNXFUV/mRpzHY+EDnc1urxctKYHVN5tn9lcxMJWN2T0HpSdD4Ed/WHKHoFqEmVfwVbQOUo2oIqity9ycJt83/epcSnE5ehIoI3ihFfiune/Y/Djb3x5MJ9meTdmdJ/92g1H9AplZ+vD7gKf4ntg4z5tV/dHxxZqbR0/YspeasXD9ehPsXQ3bHQ8TYvxsDG8kPY/jhWUnY6ERr3fKHugyqLfyzIVxpYjenC6W6P3oqqoUc2OHpBKi3cCIfCbVETZ5aYQdC2m7FhvCKK2U3Y+uMqi67ayLPNRjuh43q3Rw8epnvKv2dHxEBVHpnSoA4lv23G/OJt34lNaFM7tGQhJo94fGmgxE1UWHR3zWLpzTcoVXb/PndE1anh0LBBHoLct/eKLL7cczqfqO29ohJ2i6uTWJV98sWrPOarOR1RhdIxj6e5DuaLj1qzaGj0gkaVIjoCNfvl0bhiqMjo+YGleQDmj4xEjS1MYeaNGR9gPdOpIJOwMLaAz01C10fEunTK9CNeiu35XjWs33bDREbSQTqyLgAMDz9Ih42RUdXSMvULHzjyACkRHnyN0akMPnX309aiEiJoRXTYqhQ6kjdPBoZu/pgP77kLVR0f0cjqQ/8lNqFB0NPjXVTpSsGYQZNrom1EJzfMqc/uR9s7fd19SdgtsRTu/mULQsz/SxsGpjeHUwDV51DAmjtbDns85imZDEVFE0RQo+lGjP+z0mn+BWqc+iIWdKGr8Bc5ETk+mjdzdr3WA1U2ZVB3QoeLEszE3orwiZsfPNZv3NOyMnj/XLH62fbJwy5MeggO6rlPXJGcV06w4J3Xjm331KFW751cdzTHRrOjqoRUvdoJDXjPi51rNHwZF/Q/FBfOsbaPihQXx8W3hQNjQd79PzSww0ZR/JXnjW4OC4UDox5pX6AHn6vad9u1BQ14xWZRz8eDGmSNaQ6Oxgaq8SFTc87RaiZpB3/TWvv379+vUrC5cUadZ57v69+/VvrEv/nh1w9t07npb6zA93MMnpFWnrl2imzf0gR3/k7SKR4U1PEqrOajRPHZQsOD2+np/X5SLTu/vHxa3j4LJqNE8PqLGmZRjs1AuDfccPZpBjf6o0Twepq2VKJewq7RxuRFqNI9Qg9tnVV6JGs4j3u3R41DDeUTnuTn6Lm/UdB5vuTe6sRdqPA//HW6NPg3XAY+IX90YfQ6uCx5ha90V3TgN1wkP3bOn3BJ9Rz9cPzwaPp2QRdkalEtYLmVpiwfrcH3xaD5o4vvzF8xf8DTKJehD83M+efupnvVRq3h4eHh4eHh4eHh4eHh4eHh4eHh4eLSIiQmBKDomJhAK/07Dnx3317iWUDWJaS+JiQyEIlJ6TBbTEhpB4rIoHWS+HR41r/f+1lA1Vtbbuh7sBcbEtIOocUxMc6iaDnpy3N9GdQmAwr99jLSy9k29YVGvU/uYAKhuiYltCUWL+8dNHHtnMGqLdUbjIbH6S0VG492QNXgt2cQS2ZsfhMVco0X+yS/7Q6L72SjYYjsVtiBJjxIBkw8YWSJvx2OweNtoUXB6eRxsDTQaC5+DVUSq0fgNLPp/e4WSE+80hayjUVaUdeDj7pCEHDFZn4IxBcbCAZDdt42kicya3wG1wyaSK6C620jyHki6JtPqi7qQLKDgvz5S9AMU7IVGHAVnpejRP9Pq22BI3qHg8zrQGqyd69Vrk/WbTp9ZtEobDEknWhXPDkKJu0zkeMiirpD/giRiNX9/o2/z8Kj75xfxdR1qgw2ay22anLFeiNHhInlt0V/j7h360g6Sq3yUOQJWvG42fcnvyuS2ut9YuOLzhbJFf4fGveSpz5Rl//YF0PIUmf/Vs0PufWDSZpIJdZU7km983ezNhakkZ0NrEM2ONoTFmzT71nqm8k9vPHTvvWPiL5H5/ZToaa+bzVybQXJroHKiY3YHlPBOIHf6osQtvxdPqANZy4Vc5ltrohf2gcR7I9XoPrvJfTGQPZFDTlCiD4UkeCaZ20qOnhkKkTb6Moh068mkrpA9eIWcoUR/GpKAV8niTg6iczlkQ0zW6I+SxS94W6JtIo8HW6LvgqTpm0XKNCz6H8k9fjB7ibwchRKhqVe7wepFLqgd0QtPkCcbo8Q/yNyzlugPk2lNxUnAzwZboj8Gi63kM3L0rBalRF8B0d3klTZQ3F/MzKaW6BOFCXtes4t+rpB8QW57njxjkqP7HRJPMw08SE60RP8RFiOLWRSLErHZ8lusS776Ryw1dQPm7d5/4MDP/+sM4A2OqBXRi+KOkWt0AOJM5LhlluhrtFPn7yZH2kYfT84qd/TPyOmwWkc+Zxt9JLnYLvoXfycL+pR0TiD3D7dE76udS/pB8hdvm+j4TJ1WdQJp7IvAA1Q26L6cAuAAf97741Hm/wnw2pseWBuis1XPYvIVeQtagTVy9AYZzL4JVs+Rn9pGf5z8pLzR/VO1cwaNIFfbRo8jV9hFX45N5PFQYCaZH9udcvTp5DuwqnuGhVG20buZmOSLEroNZEq9mWRSPUi+ueAP4JdMf0A3pOC4PzCAo2pF9E54hSy6EwlkagjWy9FvV2fKkXUh9+psos8gp1mih5cS/WsIogqZqodVmwIe87OJPoGcZRd9FZqklZQeSnI8BliiryLvh2AdeZ9tdP1x5raApEUGuTuf+d0gCc77AFL0AJitZxTgc2ZNLYmONeTReWReTyjR77OJ1TSLp+rK0UcoD50i75SjZ/eLaiNp29A++iZlWWMAvcnvIQg6z0vhcvTxkDVIIh92EB0DjeT/0sglUKPvpakjBLPIZ2yjYyvZC7KRLDEJsu4cLEevA7PveDOAxedqS/TwkywxHmr0x8h5EDQ8R0OwHH1sveDg+g1aPZFM7vaVozMvV5b3d/voxlxZ/ifyv+7VEOiPMedmOfrLJesNbvHoz2RyoKPomMYSScFqdO+jzImEYBr5kl30ZcLM4PPEcYmH2U6KntXQ17feKNNPPgBeLa4t0dG3iOQSOI/e6Lwa3XD6zJkz6Xkkz3eAHN3qn/bRVcscRT/K7JZy9Csl603LIZnZEw6je60nmd0ZanSf47x2MwSTyH/YRf+UjIPFAyZhXpBRbAWzH02nTx0/zQvdYTaRtSY6pshbkBp9OPkpBCEXeLG+HF1RtD4aluhF65Z9LVn+kH30tGVfycueBTCQXAeB/wleayFHVxgTusBxdISfIsfCGt3rEAvaQjCDfMEu+ipyAGShx8UJcOPYWYpenHQgjQkRKPFOXu2JjtXGzhCi301ugCCygMl+cvT0pCOHU0jTY4ASPTPM1cGZztYccoUrPBssRz9vXm+yiXwOcBYdd/FzCNGxnewJwXzyz3bRd9HUCbKvyHwyqx0kt3CMsiMX+vv5lijx/eFaFL35gxCjty3kCX/t6PcWyNFH++n9/BeRX1ujZzV39ZAt4iozGsCqWzF/0cnRJ/vp9foPyS3ezqNjeKgm+mfkk4DYl71toze6pE7k9ySZf892MtEXJXzT1srR6wJ/4maYhebPqjXRZUJ0v2QWd4XVB+QMS/SRUrwL8h0Zy3ucrttNDtZOIDIHcvTnYVbvBDnVaXSZEP0Z7UFGi2y5ryb6MHVCtHZZ5EuIzSH/Acl0tpGiBwL4mk8BmMqutTc6ZpFfaC/B7KYZnPk/MqNZ+aPjVc3nRsBxcrBmcOYB8lq0y9Fb5TG7LVRvkStgE13/m3I06LeL3OYFTCCLeqNERPYGAMcYBKBZFmPRXHqg1kaPLmDxSFh4LyO36TTRsZlcqUZv4nL05lnkOChmk/v9NNGxlEzwcjU6viR3BMGify55t030oGVkeiOU+Cd5OUodmEOJpzgNeGycL8zunnx7wO7cqNocHf8ii2bcDDO/XpvIwq7QRm+XTT5uiX6tY6MQWWj9MqJjEslZUTDz7voNyYHQRr8pg5zgcvTIy+SeAXVh1mRKNrkQYvTANs8cUicTvstIjlEH5j6B5GO+5Q1FRCL/hFod3W8pyazdK5esP0LS+GfYRMcr5LlwObop49x52YUVZUXHJySz965asvagieTzsImOsWRWlKvREZdD8vh3S77+wUByR30les4Bs9/zSRaPR4mGx61H6COts8m+x5/jfFEi7MXM/KGoDbaRnSH6Xtn24DP9GhWHB0O2iBwNmf5X8lsfQJdSypkz95FrYWOqgYrUYdYdxSmQ6baRiXUgiiM3QDSY3ARZzz1U5H0UCElnWiX2Rwnfb8jTYbD+GdfaQDL0GE8tmjrhzfW53BCNWuHdxJ1REM1MTLwdFlEvbz5hMGQcWDIyQA2WmDgAFj13JO7qDOg+TdypSvwPNHokJv4Ttpq/uD7VYLiU9PXoYFg8k5j4KCxitu3ccydE3RIT34aoq/CAzwPzf7loMJzeMb0DLKIsv8zWpS/3gKzH7sSdA6FotDZxz0uQ+T/y9WljccHh2b0g+X8Vbbf7yuo/YwAAAABJRU5ErkJggg==);\n        }\n        .companies ul li.extrasio a {\n            background-image: url(data:image/png;base64,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);\n        }\n        .companies ul li.modstore a {\n            background-image: url(data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABQAAD/4QMxaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzA2NyA3OS4xNTc3NDcsIDIwMTUvMDMvMzAtMjM6NDA6NDIgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkM1OTk4RURBQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkM1OTk4RURCQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjlCOUZEN0ZCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjlCOUZEODBCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAACAgICAgICAgICAwICAgMEAwICAwQFBAQEBAQFBgUFBQUFBQYGBwcIBwcGCQkKCgkJDAwMDAwMDAwMDAwMDAwMAQMDAwUEBQkGBgkNCwkLDQ8ODg4ODw8MDAwMDA8PDAwMDAwMDwwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCABLANwDAREAAhEBAxEB/8QAuwABAAMAAwEBAAAAAAAAAAAAAAcICQQFBgoDAQEBAQEBAAMBAAAAAAAAAAAAAgEDBAUGBwgQAAEDAwQABAIEBgwJDQAAAAIBAwQABQYREgcIITETCUEUUWEiFYEjtRZ2ODJCUmJyonOzlNRWGHGRobEzg3U2F6MkNGS0JTXVJsY3SBkRAAICAQIFAgEJBQkAAAAAAAABEQIDMRIhQRMEBSIUUWGxMkKi0lQGF3GBwSMV8JHhUlPDRBZG/9oADAMBAAIRAxEAPwDfygFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAV35F7Yde+J8qcwjkDkqHYMpZbZck2n5SdKJgZAI416xxYzwNKQEhIhki7VRfJUrVVsl2SJ4tF2tl/tVsvtlnsXWzXmKzOtNzimjjEiNIBHGXmjHVCEwJCRU80WsKK+5v2964ccZbLwXMuUoFoymAYNXC2jFnShjuGKEgPPxo7rLZIhJqhGip8dK1VbJdkixkeQxLjsSorwSI0lsXY77aoQG2aIQkJJ4KiouqLWFFa8v7k9YsGub1nyLmGyhcoznoyY1uGTdfScTwUHCt7MgRUV8FRV8PjVbWS7Ik/jnmTizlyLIl8bZ3aMvCGiLNjwX0WSwhfsSejHtebRfgpAiL8Kxpo1NM4PK/OfFHB8C1XLlPMY+Jxb466zaEdZkyXZBsoKu+mzEaecVAQx3Lt0TVNV8Uok2G0tSE2O/vUWS62y3zDHE3V0EnbRemgT+EbkARH8K1uxmb0WZwzO8M5FsjWR4JlFsy2xvGrY3O1yW5LQuCiKTZqCrsMdU1EtCT4pUtQanJ39xuNvtECXdLtPj2u2W9on59xlugwww0Cak4664oiAiniqquiUNKuTO8vVCDdfuZ7me0nL3bPWjxp8iLrrp/0xmMcfTw8/U0qtrJ3osdj+XYtlePx8rxnIrdf8altE/Hv0CS3IiE2Gu9fVbJR+zoqEir4KioulSVJV5/v31GjPOsOcxRiNklAyatN5dBVT9y43BIST60VUqtjJ3o/IfcC6hmYtpzA0hEqIilZb4I+P0ktvRE/CtNjG9FqYuVY1NxmLmke+wSxKbbm7vGyM3wbhlBdaR4JKvGoiLatqhblVE0qSit1w7y9ULbcvuqRzPaXJW5Q9WLGny42qf8AWo8ZxjT69+lVtZO9FhsOzjDuQrIzkmDZPbcssT5k23dLXJbkso4Gm5sibVdpjqmoloqfFKmDU5I75X7HcK8HzLXbuUc7jYtcL0yUm2wCjTJjzjIkoK4rcNh8hHciohEiIqounktak2HZIjG298+pN1ltwovMkFp51dBOZbrrDZT+E9JhtNj+Eq3azN6LV2i8Wm/2yFerFdIl6s9yaR+3XWC8EiM+0XkbTrSkBiv0otSUQhyf2m4D4Zv7WLck8iRscyB6MEwbUkOfNdFl1SQDc+SjPoG7auiEqL8a1VbJdkiNV9wPqEOmvMDXj9Fkvi/5rfW7GN6LGcbco4Dy9jQZfxxksfKcdOQ5EW4Rwda2SGkEjacafBtwCRDFdCFF0VF8lrGoNTk6jJebuLcRu8mxZBlrMK7Q9qSoYR5UhW1IUJEImGXBRdFRdNda6VwXspSPrfkPzh4nsMzw586rdaqLWj9u1NHQ/wB5ThP+24f0C4f1aq9rk+HzHh/UHwf4j7GT7o/vKcJ/23D+gXD+rU9rk+HzD9QfB/iPsZPuj+8pwn/bcP6BcP6tT2uT4fMP1B8H+I+xk+6SJ+fuH/mj+fn39H/NH0vW++9D9Pb6vo6bdu/d6n2Nu3Xd4aa1z6dt22OJ89/W+y9n73qLoRO/jGu34TO7hETPA+cH3D/1vuV/rCwfkK31dND231LZdNe59s426zcn49mMpp+9cPRCncdQX3PxlyaurxNx4IjrvJGJzibyTXYy4mibW1qbVll1vCMi73errkl5u2Q32c7c73fZj9wu9yfXV2RKkuE686a/EjMlVa6HI3J76c63zjbrvxJxzidxctV55SsscbzcY5kD7Vngw46PsgYqigslx4AVdfEBcH9tXOilna7hGbnX7pXzH2Mx+55ZiP3RYsZgPuQ495v0h6O3MlNChG1GBhh9wkHcKEaiga6oiqQkiW7JHOtGyP8Aby71F5sBHUPGOQcDmNm42DiuRZkZxBcQVJtUR6NKaVNU1TUV0XaaeDg0ZxqzQ33PsttufccdWs4s6/8AdeXQrvd4AqSEQtTYtqeECVP2w7tpfWlRTmdMjlIqBwl0i5X5/wCM7lyVgN2x5Y9vuUm1t49cZL8eZIeitNOl6ZJHNhNyPIg73BTXzVPOqdkiFRtHX9UeYsr62c/2hm5nLtVmm3ccY5Pxh9VAfSJ9YzpPNLqiPQnVVwV8C1Eg1QTNF2ylCrhl0fdd5VyVvJcE4agz3YeLHZhye+w2lURnSXpT8aML/wASFhIxEI66bj3KiqIqMY1zLyPkVn449vXmzlDiKDyvjtwx8RvcY5uN4nIlGE2bHAlFF9VG1YaJxRXYJuJ8N6hVO6TJVG1J6b28c0ziw82XTg90bgxjHJttu9tyuyOtHrbZsSE8YTiZNEVpxtW1ZPXbqhIhaqIaLrhIo+MHgeyfR/OetOHW/N8jzGw5FarpfGrHDjW0ZQSfUeYkSBdMXmhBBQY6oqIarqqedK2ky1IPP9aOn2a9nrdlVzxTKLHjzOJSosWc3dvmd7iywcMSbRhpxNERtddVSttaBWsk398eQL5hlv4t6kWrIXJePcQ4lZGc3eYFWAul4SK36KuBqS+k0ygONipabnF3aqAEmVXM275Hg+PPbv7CckccQuR7UzYbVFvUNu4Y3j10muMXCfFdTe06AiwbLaOgqEHqujqioq6IutHdIKjaPKdQeZcp678/2OHcHZdtsF7uzeMck41IImwEHX/lldeaJFQXYTq70XTdoht6ohlrtlKMq4ZZL3ZP/mfjj9Ch/KMupx6FZNSvWNdHeVsx6/tdgsautiuVkOBcLoeLes+3c0iWx+QxJIUJn0SNPlyNA9TVR8E1LQV3cpgnY4ksx7V3LmSQeRMj4alznZeIX20Sb3aYDhKQw7lDcaRwmUVdAF9oy9RE8yAF+nXLrmVjfIhz3Mv1prz+j1n/AJkq2mhmTU7/AI79s/lXkjA8Pz+1Z/icK25laIl4gw5Sz/XaamNC6IObIxDuFC0XRVTXyWjukFjbNSOv3E196c9csttd7ucTMb3EuE/Il+7WnUjC5IZjRmmtXNpkAqyhmW0dEVfDw1XKrqXSPj/NeQfjOxy9yq7nSraXy8p+SdfgpKT2R08jzi0PX0iuTl9vkc7wTirrIWTJFXtyjov29y66V8vb01cckfyx2dn3nf0eb1O+Rbp+tust398lvsrxzj4slgY/drRhMa4fn5arZi9oxU1Wc5bFm+nMbvTQEoiqsqKfAt+qJ4V4qWtEqdHM/wAD9T8n2Hjn3VcGWnbq3ucdMdcL9bx74us6ThemPg90o/XJeO8Uvl2xe2XCy4pCS550totcvDkebbW2RBcclxLm4i+mElU2CiJoeuu3wRaVyWSbTenP+BXkPA9p3ObDjyY8Fd3c7KvBKXTqm70yv6KyfRS+tMxwkiK8nj+d8e8m3kcKsuH3Hje4WsLG7Z2CjG9GnynIpR5epKjxggIW9U3a6+SeFdqzS1VLcyfV+7fb+T8d3eb2+PDbtrY9mxbW63s6Ot+Pqaidz4z8hMf/ANJv9X/7hrj/AMj+3wPtf/hv3f75j37iH633K38nYPyFb681ND9evqU/vthvOMXSTZMgtr9ou0NGykwJIqDgC82LzRKi/A2zEhXyVFRU8Kok49xtlwtMgYlzhuwJRsMSRjvCoH6MpoH2D2r4ohtmJj9KKi0Bod7kMp88y4GhEZfKx+KLO8y2q/ZQ3pEoTVE+lUbFF/wVFC78jXToxBi2/qhw0zEAQbetUmS5t+LsifJedVfrUzWotqdaaGWnuvwIrHOmCz2gQJU/CGBlqn7b0bjNQCX69C01+qrx6HPJqR32TkOyunvR915VUxhZWyir+4Zlxmw/iilatWZbRGj/ALWf6tVz/Ta6f9kg1F9S8ehkf3jt0Sz9sOZo9uBGGju8aaSB4fj5kGNKeLw+JOuktdK6HO+prL3Y6jZD2PxPCuRcDdZc5LxiyNxZFlluIyF2guD8wjLbx6C2826ZqG9UEt5IRDolc62g6XrJlpxR2U7GdPshfwqXGmR7TbnzW7cW5Sw6McFcPU3IyFtcYU1RVE2i2Eq7lE6t1TOas6m4/WbtVxP2SjXCRi8ZMaz+DHF7JcQnI388LKEgeuy+CIklhCVB3Jooqo7wDcOvO1WjtWyZXX3XE16+4av0Z9B/JlyrcepOTQjn2jv91Oa/9rWb+YlVuQzEZ0d3pL0rtZzQ6+qqY3lpkVX9wzDjtB/FFKuuhF9T6f8AHYUa24/YrdCAWocC3xY0RsPARaaaEARPqRESuB6D5gO6kViz9r+ZUtojHQb+3NRW0RNH5EZiS6fh8VdMlX66710PPfUs77qjpyOV+KpLvg5IwNlxxP3xTpRL/lWppoVk1Kv2XuNzVjnCI8B2C4Wy0YWkKZbinR4elzKLcH3X5TXzJOEKeorxgqiCEgr4Ki+NVtUyTucQaU+2r1cvOFg92Ay6VDVzK7KsHBLTDktS9sKU426/LkOMqYC4XpC2LaFuFPURxBLREi9uReOvMpl7maadpbx9eO2df+SKqpoTk1IvxfnXuRZ8bsNoxLKs8Yxe1wI8XHmIUJ5yMEJltAYBk0jkigIIiD4r4VsIxOxv31Wume5v1wwKfzNHly8wvkG4M5E1d4qRpEiMs2SzHWQxsD/SRUbXxFNyLuXzrk+D4F3x1y43S6mtk009Gnwaf7UVOyPr1yjiWbyHsPx1+92q13AJuOXQDZMSbA0dZRwXDFdweAkijoqoungqV8nXuKWr6mfzr3/5F8r2Hft9pid6VsrUtwfBOaym9Vo5XFr4HCLi/n0sy/PtcJk/nCl2S9etpGRr5tHvXRfT9TTTenlW9XFt2zwOL/Ln5hfe+99u+rv6k+mN07tJ0nkds1hnZBhm+stYjKD7+vbWRuuIMXfFujLqvDKhr6n4g1VdqqPmP2fKp34uHHRR+49VfE/matciWB/zMiy/V9ORPdvpx9D5OPq8NDk5ZivZDMrcVqueD/JwZEr5+5s22LBhfPTNFT5iUrJCrp+K+K+GvjprWUviq5TOnk/G/mbyGPpZO3ire6ypWlN9/wDNfa/Uywf/AA3zL+6x/wAP/uj/ANXfL+p90eq3u/8AF/ndm/ds3el46a+fh515+rXrbuX+B96/oHe/9T9js/nx9GV/q9SJmJ2/LrwMQ/cQ/W+5W/k7B+QrfXKmh+i31NPb10P445/i8H8o3m+z7BJDC8ZYzS0QmgMb01EgsI2pPKQmy4rSI0RohagIaIKjqsboOmxPiZQd6vDtfzA2iILbE63sMNiiCINM2uG22AomiIgiKIifQldK6HO+pa/3KsGlDivW3ktiORwX8Waxm5ykRdrTrTDUyGCr5auC5IVP4C1NGVdaEjdHe8vEmAcOW/i3l2+O4ncMIdmJYLssOVMYnQJDxyxBVitvEDrRumG0hQVBA0JS3ImWq5NpdJcSgvc3n22diuapuYY7HkMYpZbdHsGLLKH03n4sZx14pBt6rs9V59whTz2bd2haol1UIizllmO9WCzONOu3THCLkCs3SxWa7hd2CTRW5rzNtflN6fvHXCH8FTVy2VdQkSb0U7XcF8Fde7zY+RMwK3ZKGT3G5R8bjQZcqVIYdjRAaVtW2lZ1MmyRN7gomn2lRKy1W2bSySM5bzcL52c7GypsOA63c+XMwEIVuFVcKLGmSEbaAjRPFI8fTcWiJoKl4JV6I56s1Y7hd3+ZuvHMzPHOHYrjrOK2602+4QJN3jSZDtyZfFUMhNuQygNg42bKbU11Al3fBIrVNHS12md1m/bXo92C4ebc5oAm8gC3avYuFulOXu3XA2tDS1Tm2fTXRxV2GrggSInrCiajWKrT4Gu1WuJmp0Keu7XbPiRLITom9LuDc4Q10KGtulLIRxE8FFARV8fiiL5oldLaHOmpqP7rf6vmHfp9B/Jlyrnj1OmTQjj2jv8AdTmv/a1m/mJVbkMxFLPccwWfiHaHK7u8woWvP4Nvv1nf8xJPlwhyB18tyPxjVU80RRX4pVUfAm64mk/EnuPcArxHj8nkC/zrFneP2iNDv2Mhb5Ul2bLjNI0TsN1ptWFF5R3ojjg7NdC8tyw6OS1dQY1PS772e7KDLbtxDc+W8zbUbc1q4kWLKkIm0iRPEI0dPtnp+xBSWumiOWrLpe7GIjzHxqIogiOFiginkiJcJXhU49C8mpHeQdU7JfOjnHnYnC4DsfMrIFxd5EjNm66FxtwXaVEGULRKaNuRRAFLYgirW8i8RTXd3GDNvpkk/wBrjnSRjmfXrhC+3LTHs5ZcuWJMPH9li9RB3OtNa6IPzUYSUtfMmgQU1JdcuuZuN8iJvc0/Wlu36O2f+aKtpoZk1NNOvfbzrhifBXEOM5Ly9aLff7DiNpgXe3ujKJyPIjxW2zZLRlU1bVNvgunh4eFQ6uTpWyguZx3ylx7yzZpGQccZZAy6zxJJQ5cyCaqjUgQFxW3BNBIS2mK+KeS1LUFJye+rDRQCgFAKAyL7V+3vyhzjzllPKOI5li1vs+UNW1HIF4cmsyY5woLEIkRI8WQBoXob0XcPnpp4ar0rdJHK1G2am4Rj7mJYXiOKvSRmu4zZYFqdmAKgLpQozbCuIKqqohKGumtc2dUZP9k/bp5T5i5wzTkrF81xWBYMukxZKRbo5ObmR1bisx3B2MRHmz8W1UV3pqnnpXRXhHK1G2aVZpwvh/JPEo8Q55GK8WE7ZDguymV9GQ0/CABalxjVC9NwCDcPmnmJIQqQrEwzo1KgyByn2mOS2Lm+mE8n4zdbMrirFcvbcyBKFtV8BMIzMwCVE8NUJNfPRPKunUOTxssN1u9tCz8Z5bas95ayiHnN1sDwS7Fi9uYcC2NS2lQmpEh1/a4/6ZIhCHpgO5EUtyfZqXeSq441Jk7ydU807PWzjtnCsisljm4VIuZymb2Ultp8LgEZEUHIzL5IoLH8lDx3eaaeOVtBt6yZ4te0/wA9qYI9neANtqv4wwl3QyRPqFbaOv8AjSr6iI6bNA+p3Q7E+ul2XOsgviZ1ySrDke33IY/y8G1tvCoPfJtkRmTjgKoE6SouxVERFCLdNrSXWkEtdnOqWBdnMfgRMgkPY7llgRz82czhti49HF3RXGH2SUUfZJUQtikKoviBjqW7K2g21ZMupXtMcthOVuFydiEi2b9ElvhPZf2a+foCw6Ov1ep+Gr6iOfTZoh1Q6VYZ1mSdkD11LNeRbtH+VlZO6wkdmJGJUI48Jjc4oIaom8yJSLRNNiaisWtJdaQd73Q68ZN2U4rtOE4lfLZYrzaMjjXwH7v6yRnW2YsqMTSmw26YL/zhCRdhfsdPjqirhm3rKPKdH+reYdY8czuBmeQ2e+XLL7hDkMt2VZDjDDUNpwE3OyWmCIjV1fBA0TTzXXwWtJlKwSp2W6x4N2ZxGLYMnddst+sjjj+KZfEbFyTBcdREcAgJRR1l3aPqN7h12iqEJIi1lbQbasmUM32muZm55N23kfC5dsQ1QJkkrjHfUPgqsBEeFF+r1fw106iOfTZfnqd0TxPrjc3M3vd8TOeSXY7kWHdUY+XhWxl5NrqQ2iIzVxwfsk6S67VUREUI90WtJdaQeM7u9LOQey2a4hl2EZRj1oCxWRbROgXw5bKqqSXXxdbcjR5O7VHVRUUU008118NraDL0ktN194Vd4r6+4twtmUmBlJW633KDkRRwP5KU3c5cmQ6yIuoJEGyR6aqqJu010TXSpblyVVQoMwD9rrmPFOR4uScZcqY3brRYry3c8UvNwKYF2hpHfR6MRstRHGHHGtqa/jBE1TyFF0TpvRz6bJf7cdCOV+fOVW+Q8WzLFY7Uix2+33KPeCmw3PmoYEDhtjGiyx2HqhIikip5eOmq5W8Iq1G2Ve//ACg7A/2349/p11/8qreoiemzTHpJ1oyzrNgmV49mV9tN7u+S3tLkK2Un3IzTLcdtkRVyQywakqiSr9jRE08VqLWkulYLp1JYoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAKAUAoBQCgFAf/Z);\n        }\n        .companies ul li.modxextras a {\n            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMjkuNDkgNjEuNTQiPjxkZWZzPjxzdHlsZT4uY2xzLTF7ZmlsbDojMDBiNWRlO30uY2xzLTJ7ZmlsbDojMDBkZWNjO30uY2xzLTN7ZmlsbDojZmY1NTI5O30uY2xzLTR7ZmlsbDojZmY5NjQwO30uY2xzLTV7ZmlsbDojMTAyYzUzO308L3N0eWxlPjwvZGVmcz48ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj48ZyBpZD0iYnJhbmRfZ3VpZGVzIiBkYXRhLW5hbWU9ImJyYW5kIGd1aWRlcyI+PGcgaWQ9ImxvZ29fb25fbGlnaHQiIGRhdGEtbmFtZT0ibG9nbyBvbiBsaWdodCI+PHBvbHlnb24gY2xhc3M9ImNscy0xIiBwb2ludHM9IjU5LjI5IDUuOTUgMjkuNTggNS45NSAyNS41NiAxMi40IDQ2Ljk0IDI1LjcgNDYuOTQgMjUuNyA0Ni45NCAyNS43MSA1OS4yOSA1Ljk1Ii8+PHBvbHlnb24gY2xhc3M9ImNscy0yIiBwb2ludHM9IjI1LjU2IDEyLjQgNS42MiAwIDUuNjIgMjkuNzEgMTIuNDkgMzMuNzIgNDYuOTQgMjUuNyA0Ni45NCAyNS43IDI1LjU2IDEyLjQiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNDcuMDYgMjcuODIgNDcuMDYgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNTMuNDcgMzEuODMgNDcuMDcgMjcuODIgMzMuNjUgNDkuMTUgNTMuNDcgNjEuNTQgNTMuNDcgMzEuODMiLz48cG9seWdvbiBjbGFzcz0iY2xzLTQiIHBvaW50cz0iNDcuMDcgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIgMTIuMzUgMzUuOTggMCA1NS40MSAyOS43MSA1NS40MSAzMy42NSA0OS4xNSA0Ny4wNyAyNy44MiA0Ny4wNyAyNy44MiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTEwNy42Niw0Ny44bDAtMTguODRMOTguMzcsNDQuNDhIOTUuMUw4NS45LDI5LjM3VjQ3LjhINzkuMDhWMTYuNGg2TDk2Ljg1LDM1LjkyLDEwOC40MiwxNi40aDZsLjA5LDMxLjRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMTIxLjgyLDMyLjFjMC05LjMzLDcuMjctMTYuMjQsMTcuMTgtMTYuMjRzMTcuMTgsNi44NywxNy4xOCwxNi4yNFMxNDguODcsNDguMzQsMTM5LDQ4LjM0LDEyMS44Miw0MS40MywxMjEuODIsMzIuMVptMjcsMGMwLTYtNC4yMi0xMC05LjgzLTEwcy05LjgyLDQuMDktOS44MiwxMC4wNSw0LjIxLDEwLDkuODIsMTBTMTQ4LjgzLDM4LjA3LDE0OC44MywzMi4xWiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTE2My41OSwxNi40aDE0LjI2YzEwLjI3LDAsMTcuMzIsNi4xOSwxNy4zMiwxNS43cy03LDE1LjctMTcuMzIsMTUuN0gxNjMuNTlabTEzLjksMjUuNDRjNi4yNCwwLDEwLjMyLTMuNzMsMTAuMzItOS43NHMtNC4wOC05LjczLTEwLjMyLTkuNzNoLTYuNjRWNDEuODRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMjIxLjEsNDcuOGwtNy41OC0xMC45LTcuNDUsMTAuOWgtOC4zNGwxMS42MS0xNi0xMS0xNS40M2g4LjI1bDcuMjIsMTAuMTgsNy4wOS0xMC4xOGg3Ljg1TDIxNy43OCwzMS41NiwyMjkuNDksNDcuOFoiLz48L2c+PC9nPjwvZz48L3N2Zz4=);\n        }\n        .disclaimer {\n            max-width: 960px;\n            display: block;\n            margin: 0 auto;\n            text-align: center;\n            color: #333;\n            font-size: .6em;\n        }\n        @media (min-width: 768px) and (max-width: 991px)  {\n            .container {\n                padding: 1em;\n                border: 0;\n                border-radius: 0;\n            }\n        }\n        @media (max-width: 767px)  {\n            body {\n                font-size: 16px;\n            }\n            .container {\n                padding: 1em;\n                margin: 0 0 1em;\n                border: 0;\n                border-radius: 0;\n            }\n            .container > section, .container > aside {\n                float: none;\n                width: 100%;\n            }\n            .container aside {\n                border: 0;\n                padding: 0;\n            }\n            .logo {\n                width: 100%;\n                height: 48px;\n            }\n            h1 {\n                font-size: 24px;\n            }\n            h2 {\n                font-size: 19px;\n            }\n            h3 {\n                font-size: 16px;\n            }\n            .companys ul li {\n                display: block;\n            }\n        }\n    </style>\n</head>\n<body>\n<a href=\"https://modx.com\" title=\"MODX\" class=\"logo\" target=\"_blank\">MODX</a>\n<div class=\"container\">\n    <section>\n        <h1>[[*longtitle:default=`[[*pagetitle]]`]]</h1>\n        [[*content]]\n    </section>\n    <aside>\n        <a href=\"[[++manager_url]]\" title=\"Your MODX manager\" class=\"cta-button\">Go to the&nbsp;manager</a>\n        <h3>Learn more about&nbsp;MODX</h3>\n        <ul>\n            <li><a href=\"https://docs.modx.com/3.x/en/index\" target=\"_blank\">Official&nbsp;Documentation</a></li>\n            <li><a href=\"https://docs.modx.com/3.x/en/getting-started/friendly-urls\" target=\"_blank\">Using Friendly&nbsp;URLs</a></li>\n            <li><a href=\"https://docs.modx.com/current/en/building-sites/extras\" target=\"_blank\">Package&nbsp;Management</a></li>\n            <li><a href=\"https://modx.com/blog/\" target=\"_blank\">Official MODX&nbsp;Blog</a></li>\n            <li><a href=\"http://www.discovermodx.com/\" target=\"_blank\">Discover&nbsp;MODX</a></li>\n            <li><a href=\"https://modx.today\" target=\"_blank\">MODX.today</a></li>\n        </ul>\n        <h3>Get help!</h3>\n        <ul>\n            <li><a href=\"https://community.modx.com\" target=\"_blank\">Official MODX&nbsp;Forums</a></li>\n            <li><a href=\"https://modx.org/\" target=\"_blank\">MODX on&nbsp;Slack</a></li>\n            <li><a href=\"https://twitter.com/modx\" target=\"_blank\">MODX on&nbsp;Twitter</a></li>\n            <li><a href=\"https://www.facebook.com/modxcms\" target=\"_blank\">MODX on&nbsp;Facebook</a></li>\n            <li><a href=\"https://modx.com/professionals/\" target=\"_blank\">Find a MODX&nbsp;Professional</a></li>\n        </ul>\n    </aside>\n    <div class=\"companies\">\n        <h3>Extend MODX with&nbsp;Extras</h3>\n        <ul>\n            <li class=\"modxextras\"><a href=\"https://modx.com/extras/\" title=\"MODX extras\" target=\"_blank\">MODX&nbsp;extras</a></li>\n            <li class=\"modmore\"><a href=\"https://www.modmore.com/extras/\" title=\"modmore.com\" target=\"_blank\">modmore.com</a></li>\n            <li class=\"modstore\"><a href=\"https://modstore.pro/\" title=\"modstore.pro\" target=\"_blank\">modstore.pro</a></li>\n            <li class=\"extrasio\"><a href=\"https://extras.io/extras/\" title=\"Extras.io\" target=\"_blank\">Extras.io</a></li>\n        </ul>\n    </div>\n</div>\n<footer class=\"disclaimer\">\n    <p>&copy; 2005-present the <a href=\"https://modx.com\" target=\"_blank\">MODX</a> Content Management Framework (CMF) project. All rights reserved. MODX is licensed under the GNU&nbsp;GPL.</p>\n</footer>\n\n<script>\n    // Load the Open Sans font\n    try {\n        document.addEventListener(\"DOMContentLoaded\", function() { // prevent a Flash Of Unstyled Text (FOUT)\n            document.querySelector(\'head\').innerHTML += \"<link href=\'https://fonts.googleapis.com/css?family=Open+Sans:400,700\' rel=\'stylesheet\' type=\'text/css\'>\";\n            document.body.classList.add(\'loaded\');\n        });\n    } catch (e) { }\n\n    // Shuffle the vendors to prevent favoritism of one vendor over the other\n    // with thanks to http://james.padolsey.com/javascript/shuffling-the-dom/\n    function shuffle(elems) {\n        var allElems = (function(){\n            var ret = [], l = elems.length;\n            while (l--) {\n                if (elems[l].className !== \'modxextras\') {\n                    ret[ret.length] = elems[l];\n                }\n            }\n            return ret;\n        })();\n\n        var shuffled = (function(){\n            var l = allElems.length, ret = [];\n            while (l--) {\n                var random = Math.floor(Math.random() * allElems.length),\n                        randEl = allElems[random].cloneNode(true);\n                allElems.splice(random, 1);\n                ret[ret.length] = randEl;\n            }\n            return ret;\n        })(), l = elems.length;\n\n        // To make sure the MODX logo stays #1, we lower the count by one here (shuffling 3 instead of 4 items)\n        // and refer to elems[l+1] in the loop below. This matches because allElems was also filtered to not include\n        // the official MODX logo.\n        l--;\n        while (l--) {\n            elems[l+1].parentNode.insertBefore(shuffled[l], elems[l+1].nextSibling);\n            elems[l+1].parentNode.removeChild(elems[l+1]);\n        }\n    }\n    shuffle(document.querySelectorAll(\'.companies li\'));\n</script>\n\n</body>\n</html>\n', 0, NULL, 0, '', ''),
(2, 1, 0, 'home', '', 0, 0, '', 0, '[[$header?]]\n[[$navbar?]]\n[[*content]]\n[[$footer?]]', 0, 'a:0:{}', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_tmplvars`
--

CREATE TABLE `modxwl_site_tmplvars` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `elements` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `display` varchar(20) NOT NULL DEFAULT '',
  `default_text` mediumtext DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `input_properties` text DEFAULT NULL,
  `output_properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_tmplvar_access`
--

CREATE TABLE `modxwl_site_tmplvar_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `documentgroup` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_tmplvar_contentvalues`
--

CREATE TABLE `modxwl_site_tmplvar_contentvalues` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contentid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_site_tmplvar_templates`
--

CREATE TABLE `modxwl_site_tmplvar_templates` (
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `templateid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_system_eventnames`
--

CREATE TABLE `modxwl_system_eventnames` (
  `name` varchar(50) NOT NULL,
  `service` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_system_eventnames`
--

INSERT INTO `modxwl_system_eventnames` (`name`, `service`, `groupname`) VALUES
('OnBeforeCacheUpdate', 4, 'System'),
('OnBeforeChunkFormDelete', 1, 'Chunks'),
('OnBeforeChunkFormSave', 1, 'Chunks'),
('OnBeforeDocFormDelete', 1, 'Resources'),
('OnBeforeDocFormSave', 1, 'Resources'),
('OnBeforeEmptyTrash', 1, 'Resources'),
('OnBeforeManagerLogin', 2, 'Security'),
('OnBeforeManagerLogout', 2, 'Security'),
('OnBeforeManagerPageInit', 2, 'System'),
('OnBeforePluginFormDelete', 1, 'Plugins'),
('OnBeforePluginFormSave', 1, 'Plugins'),
('OnBeforeRegisterClientScripts', 5, 'System'),
('OnBeforeSaveWebPageCache', 4, 'System'),
('OnBeforeSnipFormDelete', 1, 'Snippets'),
('OnBeforeSnipFormSave', 1, 'Snippets'),
('OnBeforeTempFormDelete', 1, 'Templates'),
('OnBeforeTempFormSave', 1, 'Templates'),
('OnBeforeTVFormDelete', 1, 'Template Variables'),
('OnBeforeTVFormSave', 1, 'Template Variables'),
('OnBeforeUserActivate', 1, 'Users'),
('OnBeforeUserDeactivate', 1, 'Users'),
('OnBeforeUserDuplicate', 1, 'Users'),
('OnBeforeUserFormDelete', 1, 'Users'),
('OnBeforeUserFormSave', 1, 'Users'),
('OnBeforeUserGroupFormRemove', 1, 'User Groups'),
('OnBeforeUserGroupFormSave', 1, 'User Groups'),
('OnBeforeWebLogin', 3, 'Security'),
('OnBeforeWebLogout', 3, 'Security'),
('OnCacheUpdate', 4, 'System'),
('OnCategoryBeforeRemove', 1, 'Categories'),
('OnCategoryBeforeSave', 1, 'Categories'),
('OnCategoryRemove', 1, 'Categories'),
('OnCategorySave', 1, 'Categories'),
('OnChunkBeforeRemove', 1, 'Chunks'),
('OnChunkBeforeSave', 1, 'Chunks'),
('OnChunkFormDelete', 1, 'Chunks'),
('OnChunkFormPrerender', 1, 'Chunks'),
('OnChunkFormRender', 1, 'Chunks'),
('OnChunkFormSave', 1, 'Chunks'),
('OnChunkRemove', 1, 'Chunks'),
('OnChunkSave', 1, 'Chunks'),
('OnContextBeforeRemove', 1, 'Contexts'),
('OnContextBeforeSave', 1, 'Contexts'),
('OnContextFormPrerender', 2, 'Contexts'),
('OnContextFormRender', 2, 'Contexts'),
('OnContextInit', 1, 'Contexts'),
('OnContextRemove', 1, 'Contexts'),
('OnContextSave', 1, 'Contexts'),
('OnDocFormDelete', 1, 'Resources'),
('OnDocFormPrerender', 1, 'Resources'),
('OnDocFormRender', 1, 'Resources'),
('OnDocFormSave', 1, 'Resources'),
('OnDocPublished', 5, 'Resources'),
('OnDocUnPublished', 5, 'Resources'),
('OnElementNotFound', 1, 'System'),
('OnEmptyTrash', 1, 'Resources'),
('OnFileCreateFormPrerender', 1, 'System'),
('OnFileEditFormPrerender', 1, 'System'),
('OnFileManagerBeforeUpload', 1, 'System'),
('OnFileManagerDirCreate', 1, 'System'),
('OnFileManagerDirRemove', 1, 'System'),
('OnFileManagerDirRename', 1, 'System'),
('OnFileManagerFileCreate', 1, 'System'),
('OnFileManagerFileRemove', 1, 'System'),
('OnFileManagerFileRename', 1, 'System'),
('OnFileManagerFileUpdate', 1, 'System'),
('OnFileManagerMoveObject', 1, 'System'),
('OnFileManagerUpload', 1, 'System'),
('OnHandleRequest', 5, 'System'),
('OnInitCulture', 1, 'Internationalization'),
('OnLoadWebDocument', 5, 'System'),
('OnLoadWebPageCache', 4, 'System'),
('OnManagerAuthentication', 2, 'Security'),
('OnManagerLogin', 2, 'Security'),
('OnManagerLoginFormPrerender', 2, 'Security'),
('OnManagerLoginFormRender', 2, 'Security'),
('OnManagerLogout', 2, 'Security'),
('OnManagerPageAfterRender', 2, 'System'),
('OnManagerPageBeforeRender', 2, 'System'),
('OnManagerPageInit', 2, 'System'),
('OnMediaSourceBeforeFormDelete', 1, 'Media Sources'),
('OnMediaSourceBeforeFormSave', 1, 'Media Sources'),
('OnMediaSourceDuplicate', 1, 'Media Sources'),
('OnMediaSourceFormDelete', 1, 'Media Sources'),
('OnMediaSourceFormSave', 1, 'Media Sources'),
('OnMediaSourceGetProperties', 1, 'Media Sources'),
('OnMODXInit', 5, 'System'),
('OnPackageInstall', 2, 'Package Manager'),
('OnPackageRemove', 2, 'Package Manager'),
('OnPackageUninstall', 2, 'Package Manager'),
('OnPageNotFound', 1, 'System'),
('OnPageUnauthorized', 1, 'Security'),
('OnParseDocument', 5, 'System'),
('OnPluginBeforeRemove', 1, 'Plugins'),
('OnPluginBeforeSave', 1, 'Plugins'),
('OnPluginEventBeforeRemove', 1, 'Plugin Events'),
('OnPluginEventBeforeSave', 1, 'Plugin Events'),
('OnPluginEventRemove', 1, 'Plugin Events'),
('OnPluginEventSave', 1, 'Plugin Events'),
('OnPluginFormDelete', 1, 'Plugins'),
('OnPluginFormPrerender', 1, 'Plugins'),
('OnPluginFormRender', 1, 'Plugins'),
('OnPluginFormSave', 1, 'Plugins'),
('OnPluginRemove', 1, 'Plugins'),
('OnPluginSave', 1, 'Plugins'),
('OnPropertySetBeforeRemove', 1, 'Property Sets'),
('OnPropertySetBeforeSave', 1, 'Property Sets'),
('OnPropertySetRemove', 1, 'Property Sets'),
('OnPropertySetSave', 1, 'Property Sets'),
('OnResourceAddToResourceGroup', 1, 'Resources'),
('OnResourceAutoPublish', 1, 'Resources'),
('OnResourceBeforeSort', 1, 'Resources'),
('OnResourceCacheUpdate', 1, 'Resources'),
('OnResourceDelete', 1, 'Resources'),
('OnResourceDuplicate', 1, 'Resources'),
('OnResourceGroupBeforeRemove', 1, 'Security'),
('OnResourceGroupBeforeSave', 1, 'Security'),
('OnResourceGroupRemove', 1, 'Security'),
('OnResourceGroupSave', 1, 'Security'),
('OnResourceRemoveFromResourceGroup', 1, 'Resources'),
('OnResourceSort', 1, 'Resources'),
('OnResourceToolbarLoad', 1, 'Resources'),
('OnResourceTVFormPrerender', 1, 'Resources'),
('OnResourceTVFormRender', 1, 'Resources'),
('OnResourceUndelete', 1, 'Resources'),
('OnRichTextBrowserInit', 1, 'RichText Editor'),
('OnRichTextEditorInit', 1, 'RichText Editor'),
('OnRichTextEditorRegister', 1, 'RichText Editor'),
('OnSiteRefresh', 1, 'System'),
('OnSiteSettingsRender', 1, 'Settings'),
('OnSnipFormDelete', 1, 'Snippets'),
('OnSnipFormPrerender', 1, 'Snippets'),
('OnSnipFormRender', 1, 'Snippets'),
('OnSnipFormSave', 1, 'Snippets'),
('OnSnippetBeforeRemove', 1, 'Snippets'),
('OnSnippetBeforeSave', 1, 'Snippets'),
('OnSnippetRemove', 1, 'Snippets'),
('OnSnippetSave', 1, 'Snippets'),
('OnTempFormDelete', 1, 'Templates'),
('OnTempFormPrerender', 1, 'Templates'),
('OnTempFormRender', 1, 'Templates'),
('OnTempFormSave', 1, 'Templates'),
('OnTemplateBeforeRemove', 1, 'Templates'),
('OnTemplateBeforeSave', 1, 'Templates'),
('OnTemplateRemove', 1, 'Templates'),
('OnTemplateSave', 1, 'Templates'),
('OnTemplateVarBeforeRemove', 1, 'Template Variables'),
('OnTemplateVarBeforeSave', 1, 'Template Variables'),
('OnTemplateVarRemove', 1, 'Template Variables'),
('OnTemplateVarSave', 1, 'Template Variables'),
('OnTVFormDelete', 1, 'Template Variables'),
('OnTVFormPrerender', 1, 'Template Variables'),
('OnTVFormRender', 1, 'Template Variables'),
('OnTVFormSave', 1, 'Template Variables'),
('OnTVInputPropertiesList', 1, 'Template Variables'),
('OnTVInputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderPropertiesList', 1, 'Template Variables'),
('OnUserActivate', 1, 'Users'),
('OnUserAddToGroup', 1, 'User Groups'),
('OnUserBeforeAddToGroup', 1, 'User Groups'),
('OnUserBeforeRemove', 1, 'Users'),
('OnUserBeforeRemoveFromGroup', 1, 'User Groups'),
('OnUserBeforeSave', 1, 'Users'),
('OnUserChangePassword', 1, 'Users'),
('OnUserDeactivate', 1, 'Users'),
('OnUserDuplicate', 1, 'Users'),
('OnUserFormDelete', 1, 'Users'),
('OnUserFormPrerender', 1, 'Users'),
('OnUserFormRender', 1, 'Users'),
('OnUserFormSave', 1, 'Users'),
('OnUserGroupBeforeRemove', 1, 'User Groups'),
('OnUserGroupBeforeSave', 1, 'User Groups'),
('OnUserGroupFormSave', 1, 'User Groups'),
('OnUserGroupRemove', 1, 'User Groups'),
('OnUserGroupSave', 1, 'User Groups'),
('OnUserNotFound', 1, 'Users'),
('OnUserProfileBeforeRemove', 1, 'User Profiles'),
('OnUserProfileBeforeSave', 1, 'User Profiles'),
('OnUserProfileRemove', 1, 'User Profiles'),
('OnUserProfileSave', 1, 'User Profiles'),
('OnUserRemove', 1, 'Users'),
('OnUserRemoveFromGroup', 1, 'User Groups'),
('OnUserSave', 1, 'Users'),
('OnWebAuthentication', 3, 'Security'),
('OnWebLogin', 3, 'Security'),
('OnWebLogout', 3, 'Security'),
('OnWebPageComplete', 5, 'System'),
('OnWebPageInit', 5, 'System'),
('OnWebPagePrerender', 5, 'System');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_system_settings`
--

CREATE TABLE `modxwl_system_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_system_settings`
--

INSERT INTO `modxwl_system_settings` (`key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('access_category_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_context_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_resource_group_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_forward_across_contexts', '', 'combo-boolean', 'core', 'system', NULL),
('allow_manager_login_forgot_password', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_multiple_emails', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_tags_in_post', '', 'combo-boolean', 'core', 'system', NULL),
('anonymous_sessions', '1', 'combo-boolean', 'core', 'session', NULL),
('archive_with', '', 'combo-boolean', 'core', 'system', NULL),
('automatic_alias', '1', 'combo-boolean', 'core', 'furls', NULL),
('automatic_template_assignment', 'sibling', 'textfield', 'core', 'site', NULL),
('auto_check_pkg_updates', '1', 'combo-boolean', 'core', 'system', NULL),
('auto_check_pkg_updates_cache_expire', '15', 'numberfield', 'core', 'system', NULL),
('auto_isfolder', '1', 'combo-boolean', 'core', 'site', NULL),
('auto_menuindex', '1', 'combo-boolean', 'core', 'site', NULL),
('base_help_url', '//docs.modx.com/help/', 'textfield', 'core', 'manager', NULL),
('blocked_minutes', '60', 'numberfield', 'core', 'authentication', NULL),
('cache_alias_map', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_context_settings', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_db', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_db_session', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_session_lifetime', '', 'numberfield', 'core', 'caching', NULL),
('cache_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_format', '0', 'numberfield', 'core', 'caching', NULL),
('cache_handler', 'xPDO\\Cache\\xPDOFileCache', 'textfield', 'core', 'caching', NULL),
('cache_lang_js', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_noncore_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_clear_partial', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_scripts', '1', 'combo-boolean', 'core', 'caching', NULL),
('clear_cache_refresh_trees', '', 'combo-boolean', 'core', 'caching', NULL),
('compress_css', '1', 'combo-boolean', 'core', 'manager', NULL),
('compress_js', '1', 'combo-boolean', 'core', 'manager', NULL),
('confirm_navigation', '1', 'combo-boolean', 'core', 'manager', NULL),
('container_suffix', '/', 'textfield', 'core', 'furls', NULL),
('context_tree_sort', '1', 'combo-boolean', 'core', 'manager', NULL),
('context_tree_sortby', 'rank', 'textfield', 'core', 'manager', NULL),
('context_tree_sortdir', 'ASC', 'textfield', 'core', 'manager', NULL),
('cultureKey', 'en', 'modx-combo-language', 'core', 'language', NULL),
('date_timezone', '', 'textfield', 'core', 'system', NULL),
('debug', '', 'numberfield', 'core', 'system', NULL),
('default_content_type', '1', 'modx-combo-content-type', 'core', 'site', NULL),
('default_context', 'web', 'modx-combo-context', 'core', 'site', NULL),
('default_duplicate_publish_option', 'preserve', 'textfield', 'core', 'manager', NULL),
('default_media_source', '1', 'modx-combo-source', 'core', 'manager', NULL),
('default_media_source_type', 'MODX\\Revolution\\Sources\\modFileMediaSource', 'modx-combo-source-type', 'core', 'manager', NULL),
('default_per_page', '20', 'textfield', 'core', 'manager', NULL),
('default_template', '1', 'modx-combo-template', 'core', 'site', NULL),
('default_username', '(anonymous)', 'textfield', 'core', 'session', NULL),
('emailsender', 'admin@airportparking.lk', 'textfield', 'core', 'authentication', '2025-12-28 21:20:52'),
('enable_dragdrop', '1', 'combo-boolean', 'core', 'manager', NULL),
('enable_gravatar', '', 'combo-boolean', 'core', 'manager', NULL),
('enable_template_picker_in_tree', '1', 'combo-boolean', 'core', 'manager', NULL),
('error_log_filename', 'error.log', 'textfield', 'core', 'system', NULL),
('error_log_filepath', '', 'textfield', 'core', 'system', NULL),
('error_page', '1', 'numberfield', 'core', 'site', NULL),
('failed_login_attempts', '5', 'numberfield', 'core', 'authentication', NULL),
('feed_modx_news', 'https://feeds.feedburner.com/modx-announce', 'textfield', 'core', 'system', NULL),
('feed_modx_news_enabled', '1', 'combo-boolean', 'core', 'system', NULL),
('feed_modx_security', 'https://forums.modx.com/board.xml?board=294', 'textfield', 'core', 'system', NULL),
('feed_modx_security_enabled', '1', 'combo-boolean', 'core', 'system', NULL),
('form_customization_use_all_groups', '', 'combo-boolean', 'core', 'manager', NULL),
('forward_merge_excludes', 'type,published,class_key', 'textfield', 'core', 'system', NULL),
('friendly_alias_lowercase_only', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_max_length', '0', 'numberfield', 'core', 'furls', NULL),
('friendly_alias_realtime', '', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_restrict_chars', 'pattern', 'textfield', 'core', 'furls', NULL),
('friendly_alias_restrict_chars_pattern', '/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_strip_element_tags', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_translit', 'none', 'textfield', 'core', 'furls', NULL),
('friendly_alias_translit_class', 'translit.modTransliterate', 'textfield', 'core', 'furls', NULL),
('friendly_alias_translit_class_path', '{core_path}components/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_trim_chars', '/.-_', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiter', '-', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiters', '-_', 'textfield', 'core', 'furls', NULL),
('friendly_urls', '0', 'combo-boolean', 'core', 'furls', '2026-02-03 05:55:21'),
('friendly_urls_strict', '', 'combo-boolean', 'core', 'furls', NULL),
('global_duplicate_uri_check', '', 'combo-boolean', 'core', 'furls', NULL),
('hidemenu_default', '', 'combo-boolean', 'core', 'site', NULL),
('inline_help', '1', 'combo-boolean', 'core', 'manager', NULL),
('link_tag_scheme', '-1', 'textfield', 'core', 'site', NULL),
('locale', '', 'textfield', 'core', 'language', NULL),
('lock_ttl', '360', 'numberfield', 'core', 'system', NULL),
('login_background_image', '', 'textfield', 'core', 'authentication', NULL),
('login_help_button', '', 'combo-boolean', 'core', 'authentication', NULL),
('login_logo', '', 'textfield', 'core', 'authentication', NULL),
('log_deprecated', '1', 'combo-boolean', 'core', 'system', NULL),
('log_level', '1', 'numberfield', 'core', 'system', NULL),
('log_snippet_not_found', '1', 'combo-boolean', 'core', 'site', NULL),
('log_target', 'FILE', 'textfield', 'core', 'system', NULL),
('mail_charset', 'UTF-8', 'modx-combo-charset', 'core', 'mail', NULL),
('mail_dkim_domain', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_identity', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_passphrase', '', 'text-password', 'core', 'mail', NULL),
('mail_dkim_privatekeyfile', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_privatekeystring', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_selector', '', 'textfield', 'core', 'mail', NULL),
('mail_encoding', '8bit', 'textfield', 'core', 'mail', NULL),
('mail_smtp_auth', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_autotls', '1', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_helo', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_hosts', 'localhost', 'textfield', 'core', 'mail', NULL),
('mail_smtp_keepalive', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_pass', '', 'text-password', 'core', 'mail', NULL),
('mail_smtp_port', '587', 'numberfield', 'core', 'mail', NULL),
('mail_smtp_secure', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_single_to', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_timeout', '10', 'numberfield', 'core', 'mail', NULL),
('mail_smtp_user', '', 'textfield', 'core', 'mail', NULL),
('mail_use_smtp', '', 'combo-boolean', 'core', 'mail', NULL),
('main_nav_parent', 'topnav', 'textfield', 'core', 'manager', NULL),
('manager_datetime_empty_value', '—', 'textfield', 'core', 'manager', NULL),
('manager_datetime_separator', ', ', 'textfield', 'core', 'manager', NULL),
('manager_date_format', 'Y-m-d', 'textfield', 'core', 'manager', NULL),
('manager_direction', 'ltr', 'textfield', 'core', 'language', NULL),
('manager_favicon_url', 'favicon.ico', 'textfield', 'core', 'manager', NULL),
('manager_login_url_alternate', '', 'textfield', 'core', 'authentication', NULL),
('manager_logo', '', 'textfield', 'core', 'manager', NULL),
('manager_theme', 'default', 'modx-combo-manager-theme', 'core', 'manager', NULL),
('manager_time_format', 'H:i', 'textfield', 'core', 'manager', NULL),
('manager_tooltip_delay', '2300', 'numberfield', 'core', 'manager', NULL),
('manager_tooltip_enable', '1', 'combo-boolean', 'core', 'manager', NULL),
('manager_use_fullname', '', 'combo-boolean', 'core', 'manager', NULL),
('manager_week_start', '0', 'numberfield', 'core', 'manager', NULL),
('mgr_source_icon', 'icon-folder-open-o', 'textfield', 'core', 'manager', NULL),
('mgr_tree_icon_context', 'tree-context', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_sort', 'name', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_viewmode', 'grid', 'textfield', 'core', 'manager', NULL),
('modx_browser_tree_hide_files', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_browser_tree_hide_tooltips', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_charset', 'UTF-8', 'modx-combo-charset', 'core', 'language', NULL),
('package_installer_at_top', '1', 'combo-boolean', 'core', 'manager', NULL),
('parser_recurse_uncacheable', '1', 'combo-boolean', 'core', 'system', NULL),
('passwordless_activated', '', 'combo-boolean', 'core', 'authentication', NULL),
('passwordless_expiration', '3600', 'textfield', 'core', 'authentication', NULL),
('password_generated_length', '10', 'numberfield', 'core', 'authentication', NULL),
('password_min_length', '8', 'numberfield', 'core', 'authentication', NULL),
('photo_profile_source', '', 'modx-combo-source', 'core', 'manager', NULL),
('phpthumb_allow_src_above_docroot', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxage', '30', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxfiles', '10000', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxsize', '100', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_source_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_document_root', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_bgcolor', 'CCCCFF', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_fontsize', '1', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_error_textcolor', 'FF0000', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_far', 'C', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_imagemagick_path', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_enabled', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_text_message', 'Off-server thumbnailing is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_require_refer', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_text_message', 'Off-server linking is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_watermark_src', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_zoomcrop', '0', 'textfield', 'core', 'phpthumb', NULL),
('preserve_menuindex', '', 'combo-boolean', 'core', 'manager', NULL),
('principal_targets', 'MODX\\Revolution\\modAccessContext,MODX\\Revolution\\modAccessResourceGroup,MODX\\Revolution\\modAccessCategory,MODX\\Revolution\\Sources\\modAccessMediaSource,MODX\\Revolution\\modAccessNamespace', 'textfield', 'core', 'authentication', NULL),
('proxy_auth_type', 'BASIC', 'textfield', 'core', 'proxy', NULL),
('proxy_host', '', 'textfield', 'core', 'proxy', NULL),
('proxy_password', '', 'text-password', 'core', 'proxy', NULL),
('proxy_port', '', 'numberfield', 'core', 'proxy', NULL),
('proxy_username', '', 'textfield', 'core', 'proxy', NULL),
('publish_default', '', 'combo-boolean', 'core', 'site', NULL),
('quick_search_in_content', '1', 'combo-boolean', 'core', 'manager', NULL),
('quick_search_result_max', '10', 'numberfield', 'core', 'manager', NULL),
('request_controller', 'index.php', 'textfield', 'core', 'gateway', NULL),
('request_method_strict', '', 'combo-boolean', 'core', 'gateway', NULL),
('request_param_alias', 'q', 'textfield', 'core', 'gateway', NULL),
('request_param_id', 'id', 'textfield', 'core', 'gateway', NULL),
('resource_static_allow_absolute', '0', 'combo-boolean', 'core', 'static_resources', NULL),
('resource_static_path', '{assets_path}', 'textfield', 'core', 'static_resources', NULL),
('resource_tree_node_name', 'pagetitle', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_name_fallback', 'alias', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_tooltip', '', 'textfield', 'core', 'manager', NULL),
('richtext_default', '1', 'combo-boolean', 'core', 'manager', NULL),
('search_default', '1', 'combo-boolean', 'core', 'site', NULL),
('send_poweredby_header', '1', 'combo-boolean', 'core', 'system', '2025-12-28 21:20:52'),
('server_offset_time', '0', 'numberfield', 'core', 'system', NULL),
('session_cookie_domain', '', 'textfield', 'core', 'session', NULL),
('session_cookie_httponly', '1', 'combo-boolean', 'core', 'session', NULL),
('session_cookie_lifetime', '604800', 'numberfield', 'core', 'session', NULL),
('session_cookie_path', '', 'textfield', 'core', 'session', NULL),
('session_cookie_samesite', '', 'textfield', 'core', 'session', NULL),
('session_cookie_secure', '', 'combo-boolean', 'core', 'session', NULL),
('session_gc_maxlifetime', '604800', 'textfield', 'core', 'session', NULL),
('session_handler_class', 'MODX\\Revolution\\modSessionHandler', 'textfield', 'core', 'session', NULL),
('session_name', '', 'textfield', 'core', 'session', NULL),
('settings_distro', 'traditional', 'textfield', 'core', 'system', NULL),
('settings_version', '3.1.2-pl', 'textfield', 'core', 'system', NULL),
('set_header', '1', 'combo-boolean', 'core', 'system', NULL),
('show_tv_categories_header', '1', 'combo-boolean', 'core', 'manager', NULL),
('site_name', 'MODX Revolution', 'textfield', 'core', 'site', NULL),
('site_start', '1', 'numberfield', 'core', 'site', NULL),
('site_status', '1', 'combo-boolean', 'core', 'site', NULL),
('site_unavailable_message', '[[%site_unavailable_message]]', 'textfield', 'core', 'site', NULL),
('site_unavailable_page', '0', 'numberfield', 'core', 'site', NULL),
('static_elements_automate_chunks', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_plugins', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_snippets', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_templates', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_tvs', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_basepath', '', 'textfield', 'core', 'static_elements', NULL),
('static_elements_default_category', '0', 'modx-combo-category', 'core', 'static_elements', NULL),
('static_elements_default_mediasource', '0', 'modx-combo-source', 'core', 'static_elements', NULL),
('static_elements_html_extension', '.tpl', 'textfield', 'core', 'static_elements', NULL),
('symlink_merge_fields', '1', 'combo-boolean', 'core', 'site', NULL),
('syncsite_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('topmenu_show_descriptions', '1', 'combo-boolean', 'core', 'manager', NULL),
('tree_default_sort', 'menuindex', 'textfield', 'core', 'manager', NULL),
('tree_root_id', '0', 'numberfield', 'core', 'manager', NULL),
('tvs_below_content', '', 'combo-boolean', 'core', 'manager', NULL),
('unauthorized_page', '1', 'numberfield', 'core', 'site', NULL),
('upload_files', 'aac,au,avi,bmp,css,css.map,doc,docx,eot,gif,gz,htm,html,ico,jpeg,jpg,js,js.map,less,md,mp3,mp4,mpeg,mpg,odb,odf,odg,odp,ods,odt,pdf,png,ppt,pptx,psd,rar,scss,svg,svgz,tar,tgz,tiff,ttf,txt,wav,webp,wmv,woff,woff2,xls,xlsx,xml,z,zip', 'textfield', 'core', 'file', NULL),
('upload_file_exists', '1', 'combo-boolean', 'core', 'file', NULL),
('upload_maxsize', '104857600', 'numberfield', 'core', 'file', '2025-12-28 21:20:52'),
('upload_translit', '1', 'combo-boolean', 'core', 'file', NULL),
('upload_translit_restrict_chars_pattern', '/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/', 'textfield', 'core', 'file', NULL),
('user_nav_parent', 'usernav', 'textfield', 'core', 'manager', NULL),
('use_alias_path', '', 'combo-boolean', 'core', 'furls', NULL),
('use_context_resource_table', '1', 'combo-boolean', 'core', 'caching', NULL),
('use_editor', '1', 'combo-boolean', 'core', 'editor', NULL),
('use_frozen_parent_uris', '', 'combo-boolean', 'core', 'furls', NULL),
('use_multibyte', '1', 'combo-boolean', 'core', 'language', '2025-12-28 21:20:52'),
('use_weblink_target', '', 'combo-boolean', 'core', 'site', NULL),
('welcome_action', 'welcome', 'textfield', 'core', 'manager', NULL),
('welcome_namespace', 'core', 'textfield', 'core', 'manager', NULL),
('welcome_screen', '', 'combo-boolean', 'core', 'manager', '2025-12-28 16:53:03'),
('welcome_screen_url', '//misc.modx.com/revolution/welcome.31.html', 'textfield', 'core', 'manager', NULL),
('which_editor', '', 'modx-combo-rte', 'core', 'editor', NULL),
('which_element_editor', '', 'modx-combo-rte', 'core', 'editor', NULL),
('xhtml_urls', '1', 'combo-boolean', 'core', 'site', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_transport_packages`
--

CREATE TABLE `modxwl_transport_packages` (
  `signature` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `installed` datetime DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `workspace` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `provider` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `source` tinytext DEFAULT NULL,
  `manifest` text DEFAULT NULL,
  `attributes` mediumtext DEFAULT NULL,
  `package_name` varchar(191) NOT NULL,
  `metadata` text DEFAULT NULL,
  `version_major` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `version_minor` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `version_patch` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `release` varchar(100) NOT NULL DEFAULT '',
  `release_index` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_transport_providers`
--

CREATE TABLE `modxwl_transport_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `service_url` tinytext DEFAULT NULL,
  `username` varchar(191) NOT NULL DEFAULT '',
  `api_key` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `priority` tinyint(4) NOT NULL DEFAULT 10,
  `properties` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_transport_providers`
--

INSERT INTO `modxwl_transport_providers` (`id`, `name`, `description`, `service_url`, `username`, `api_key`, `created`, `updated`, `active`, `priority`, `properties`) VALUES
(1, 'modx.com', 'The official MODX transport provider for 3rd party components.', 'https://rest.modx.com/extras/', '', '', '2025-04-02 10:20:59', NULL, 1, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_users`
--

CREATE TABLE `modxwl_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `cachepwd` varchar(255) NOT NULL DEFAULT '',
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modUser',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `remote_key` varchar(191) DEFAULT NULL,
  `remote_data` text DEFAULT NULL,
  `hash_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\Hashing\\modNative',
  `salt` varchar(100) NOT NULL DEFAULT '',
  `primary_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session_stale` text DEFAULT NULL,
  `sudo` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_users`
--

INSERT INTO `modxwl_users` (`id`, `username`, `password`, `cachepwd`, `class_key`, `active`, `remote_key`, `remote_data`, `hash_class`, `salt`, `primary_group`, `session_stale`, `sudo`, `createdon`) VALUES
(1, 'admin', '$2a$12$1jlBMxGkqZVa4YsgEIs8SuPuDRwCtl3XhXeJ7pAdXoGrumfaCNTQG', '', 'MODX\\Revolution\\modUser', 1, NULL, NULL, 'MODX\\Revolution\\Hashing\\modNative', '26289a1b385b2d36838a5fcf01ac1f4d', 1, NULL, 1, 1766937052);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_user_attributes`
--

CREATE TABLE `modxwl_user_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `internalKey` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `blockeduntil` int(11) NOT NULL DEFAULT 0,
  `blockedafter` int(11) NOT NULL DEFAULT 0,
  `logincount` int(11) NOT NULL DEFAULT 0,
  `lastlogin` int(11) NOT NULL DEFAULT 0,
  `thislogin` int(11) NOT NULL DEFAULT 0,
  `failedlogincount` int(11) NOT NULL DEFAULT 0,
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(11) NOT NULL DEFAULT 0,
  `gender` tinyint(1) NOT NULL DEFAULT 0,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `website` varchar(255) NOT NULL DEFAULT '',
  `extended` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_user_attributes`
--

INSERT INTO `modxwl_user_attributes` (`id`, `internalKey`, `fullname`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `address`, `country`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `website`, `extended`) VALUES
(1, 1, 'Default Admin User', 'admin@airportparking.lk', '', '', 0, 1776410251, 0, 28, 1774717596, 1775126439, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_user_group_roles`
--

CREATE TABLE `modxwl_user_group_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_user_group_roles`
--

INSERT INTO `modxwl_user_group_roles` (`id`, `name`, `description`, `authority`) VALUES
(1, 'Member', NULL, 9999),
(2, 'Super User', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_user_group_settings`
--

CREATE TABLE `modxwl_user_group_settings` (
  `group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_user_messages`
--

CREATE TABLE `modxwl_user_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `date_sent` datetime DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_user_settings`
--

CREATE TABLE `modxwl_user_settings` (
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modxwl_workspaces`
--

CREATE TABLE `modxwl_workspaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `path` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `attributes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modxwl_workspaces`
--

INSERT INTO `modxwl_workspaces` (`id`, `name`, `path`, `created`, `active`, `attributes`) VALUES
(1, 'Default MODX workspace', '{core_path}', '2025-12-28 21:20:52', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_actiondom`
--

CREATE TABLE `modx_access_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_category`
--

CREATE TABLE `modx_access_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_context`
--

CREATE TABLE `modx_access_context` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_access_context`
--

INSERT INTO `modx_access_context` (`id`, `target`, `principal_class`, `principal`, `authority`, `policy`) VALUES
(1, 'web', 'MODX\\Revolution\\modUserGroup', 0, 9999, 3),
(2, 'mgr', 'MODX\\Revolution\\modUserGroup', 1, 0, 2),
(3, 'web', 'MODX\\Revolution\\modUserGroup', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_elements`
--

CREATE TABLE `modx_access_elements` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_media_source`
--

CREATE TABLE `modx_access_media_source` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_menus`
--

CREATE TABLE `modx_access_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_namespace`
--

CREATE TABLE `modx_access_namespace` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_permissions`
--

CREATE TABLE `modx_access_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `value` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_access_permissions`
--

INSERT INTO `modx_access_permissions` (`id`, `template`, `name`, `description`, `value`) VALUES
(1, 1, 'about', 'perm.about_desc', 1),
(2, 1, 'access_permissions', 'perm.access_permissions_desc', 1),
(3, 1, 'actions', 'perm.actions_desc', 1),
(4, 1, 'change_password', 'perm.change_password_desc', 1),
(5, 1, 'change_profile', 'perm.change_profile_desc', 1),
(6, 1, 'charsets', 'perm.charsets_desc', 1),
(7, 1, 'class_map', 'perm.class_map_desc', 1),
(8, 1, 'components', 'perm.components_desc', 1),
(9, 1, 'content_types', 'perm.content_types_desc', 1),
(10, 1, 'countries', 'perm.countries_desc', 1),
(11, 1, 'create', 'perm.create_desc', 1),
(12, 1, 'credits', 'perm.credits_desc', 1),
(13, 1, 'customize_forms', 'perm.customize_forms_desc', 1),
(14, 1, 'dashboards', 'perm.dashboards_desc', 1),
(15, 1, 'database', 'perm.database_desc', 1),
(16, 1, 'database_truncate', 'perm.database_truncate_desc', 1),
(17, 1, 'delete_category', 'perm.delete_category_desc', 1),
(18, 1, 'delete_chunk', 'perm.delete_chunk_desc', 1),
(19, 1, 'delete_context', 'perm.delete_context_desc', 1),
(20, 1, 'delete_document', 'perm.delete_document_desc', 1),
(21, 1, 'delete_weblink', 'perm.delete_weblink_desc', 1),
(22, 1, 'delete_symlink', 'perm.delete_symlink_desc', 1),
(23, 1, 'delete_static_resource', 'perm.delete_static_resource_desc', 1),
(24, 1, 'delete_eventlog', 'perm.delete_eventlog_desc', 1),
(25, 1, 'delete_plugin', 'perm.delete_plugin_desc', 1),
(26, 1, 'delete_propertyset', 'perm.delete_propertyset_desc', 1),
(27, 1, 'delete_snippet', 'perm.delete_snippet_desc', 1),
(28, 1, 'delete_template', 'perm.delete_template_desc', 1),
(29, 1, 'delete_tv', 'perm.delete_tv_desc', 1),
(30, 1, 'delete_role', 'perm.delete_role_desc', 1),
(31, 1, 'delete_user', 'perm.delete_user_desc', 1),
(32, 1, 'directory_chmod', 'perm.directory_chmod_desc', 1),
(33, 1, 'directory_create', 'perm.directory_create_desc', 1),
(34, 1, 'directory_list', 'perm.directory_list_desc', 1),
(35, 1, 'directory_remove', 'perm.directory_remove_desc', 1),
(36, 1, 'directory_update', 'perm.directory_update_desc', 1),
(37, 1, 'edit_category', 'perm.edit_category_desc', 1),
(38, 1, 'edit_chunk', 'perm.edit_chunk_desc', 1),
(39, 1, 'edit_context', 'perm.edit_context_desc', 1),
(40, 1, 'edit_document', 'perm.edit_document_desc', 1),
(41, 1, 'edit_weblink', 'perm.edit_weblink_desc', 1),
(42, 1, 'edit_symlink', 'perm.edit_symlink_desc', 1),
(43, 1, 'edit_static_resource', 'perm.edit_static_resource_desc', 1),
(44, 1, 'edit_locked', 'perm.edit_locked_desc', 1),
(45, 1, 'edit_plugin', 'perm.edit_plugin_desc', 1),
(46, 1, 'edit_propertyset', 'perm.edit_propertyset_desc', 1),
(47, 1, 'edit_role', 'perm.edit_role_desc', 1),
(48, 1, 'edit_snippet', 'perm.edit_snippet_desc', 1),
(49, 1, 'edit_template', 'perm.edit_template_desc', 1),
(50, 1, 'edit_tv', 'perm.edit_tv_desc', 1),
(51, 1, 'edit_user', 'perm.edit_user_desc', 1),
(52, 1, 'element_tree', 'perm.element_tree_desc', 1),
(53, 1, 'empty_cache', 'perm.empty_cache_desc', 1),
(54, 1, 'error_log_erase', 'perm.error_log_erase_desc', 1),
(55, 1, 'error_log_view', 'perm.error_log_view_desc', 1),
(56, 1, 'export_static', 'perm.export_static_desc', 1),
(57, 1, 'file_create', 'perm.file_create_desc', 1),
(58, 1, 'file_list', 'perm.file_list_desc', 1),
(59, 1, 'file_manager', 'perm.file_manager_desc', 1),
(60, 1, 'file_remove', 'perm.file_remove_desc', 1),
(61, 1, 'file_tree', 'perm.file_tree_desc', 1),
(62, 1, 'file_update', 'perm.file_update_desc', 1),
(63, 1, 'file_upload', 'perm.file_upload_desc', 1),
(64, 1, 'file_unpack', 'perm.file_unpack_desc', 1),
(65, 1, 'file_view', 'perm.file_view_desc', 1),
(66, 1, 'flush_sessions', 'perm.flush_sessions_desc', 1),
(67, 1, 'frames', 'perm.frames_desc', 1),
(68, 1, 'help', 'perm.help_desc', 1),
(69, 1, 'home', 'perm.home_desc', 1),
(70, 1, 'language', 'perm.language_desc', 1),
(71, 1, 'languages', 'perm.languages_desc', 1),
(72, 1, 'lexicons', 'perm.lexicons_desc', 1),
(73, 1, 'list', 'perm.list_desc', 1),
(74, 1, 'load', 'perm.load_desc', 1),
(75, 1, 'logout', 'perm.logout_desc', 1),
(76, 1, 'mgr_log_view', 'perm.mgr_log_view_desc', 1),
(77, 1, 'mgr_log_erase', 'perm.mgr_log_erase_desc', 1),
(78, 1, 'menu_reports', 'perm.menu_reports_desc', 1),
(79, 1, 'menu_security', 'perm.menu_security_desc', 1),
(80, 1, 'menu_site', 'perm.menu_site_desc', 1),
(81, 1, 'menu_support', 'perm.menu_support_desc', 1),
(82, 1, 'menu_system', 'perm.menu_system_desc', 1),
(83, 1, 'menu_tools', 'perm.menu_tools_desc', 1),
(84, 1, 'menu_trash', 'perm.menu_trash_desc', 1),
(85, 1, 'menu_user', 'perm.menu_user_desc', 1),
(86, 1, 'menus', 'perm.menus_desc', 1),
(87, 1, 'messages', 'perm.messages_desc', 1),
(88, 1, 'namespaces', 'perm.namespaces_desc', 1),
(89, 1, 'new_category', 'perm.new_category_desc', 1),
(90, 1, 'new_chunk', 'perm.new_chunk_desc', 1),
(91, 1, 'new_context', 'perm.new_context_desc', 1),
(92, 1, 'new_document', 'perm.new_document_desc', 1),
(93, 1, 'new_static_resource', 'perm.new_static_resource_desc', 1),
(94, 1, 'new_symlink', 'perm.new_symlink_desc', 1),
(95, 1, 'new_weblink', 'perm.new_weblink_desc', 1),
(96, 1, 'new_document_in_root', 'perm.new_document_in_root_desc', 1),
(97, 1, 'new_plugin', 'perm.new_plugin_desc', 1),
(98, 1, 'new_propertyset', 'perm.new_propertyset_desc', 1),
(99, 1, 'new_role', 'perm.new_role_desc', 1),
(100, 1, 'new_snippet', 'perm.new_snippet_desc', 1),
(101, 1, 'new_template', 'perm.new_template_desc', 1),
(102, 1, 'new_tv', 'perm.new_tv_desc', 1),
(103, 1, 'new_user', 'perm.new_user_desc', 1),
(104, 1, 'packages', 'perm.packages_desc', 1),
(105, 1, 'policy_delete', 'perm.policy_delete_desc', 1),
(106, 1, 'policy_edit', 'perm.policy_edit_desc', 1),
(107, 1, 'policy_new', 'perm.policy_new_desc', 1),
(108, 1, 'policy_save', 'perm.policy_save_desc', 1),
(109, 1, 'policy_view', 'perm.policy_view_desc', 1),
(110, 1, 'policy_template_delete', 'perm.policy_template_delete_desc', 1),
(111, 1, 'policy_template_edit', 'perm.policy_template_edit_desc', 1),
(112, 1, 'policy_template_new', 'perm.policy_template_new_desc', 1),
(113, 1, 'policy_template_save', 'perm.policy_template_save_desc', 1),
(114, 1, 'policy_template_view', 'perm.policy_template_view_desc', 1),
(115, 1, 'property_sets', 'perm.property_sets_desc', 1),
(116, 1, 'providers', 'perm.providers_desc', 1),
(117, 1, 'publish_document', 'perm.publish_document_desc', 1),
(118, 1, 'purge_deleted', 'perm.purge_deleted_desc', 1),
(119, 1, 'remove', 'perm.remove_desc', 1),
(120, 1, 'remove_locks', 'perm.remove_locks_desc', 1),
(121, 1, 'resource_duplicate', 'perm.resource_duplicate_desc', 1),
(122, 1, 'resourcegroup_delete', 'perm.resourcegroup_delete_desc', 1),
(123, 1, 'resourcegroup_edit', 'perm.resourcegroup_edit_desc', 1),
(124, 1, 'resourcegroup_new', 'perm.resourcegroup_new_desc', 1),
(125, 1, 'resourcegroup_resource_edit', 'perm.resourcegroup_resource_edit_desc', 1),
(126, 1, 'resourcegroup_resource_list', 'perm.resourcegroup_resource_list_desc', 1),
(127, 1, 'resourcegroup_save', 'perm.resourcegroup_save_desc', 1),
(128, 1, 'resourcegroup_view', 'perm.resourcegroup_view_desc', 1),
(129, 1, 'resource_quick_create', 'perm.resource_quick_create_desc', 1),
(130, 1, 'resource_quick_update', 'perm.resource_quick_update_desc', 1),
(131, 1, 'resource_tree', 'perm.resource_tree_desc', 1),
(132, 1, 'save', 'perm.save_desc', 1),
(133, 1, 'save_category', 'perm.save_category_desc', 1),
(134, 1, 'save_chunk', 'perm.save_chunk_desc', 1),
(135, 1, 'save_context', 'perm.save_context_desc', 1),
(136, 1, 'save_document', 'perm.save_document_desc', 1),
(137, 1, 'save_plugin', 'perm.save_plugin_desc', 1),
(138, 1, 'save_propertyset', 'perm.save_propertyset_desc', 1),
(139, 1, 'save_role', 'perm.save_role_desc', 1),
(140, 1, 'save_snippet', 'perm.save_snippet_desc', 1),
(141, 1, 'save_template', 'perm.save_template_desc', 1),
(142, 1, 'save_tv', 'perm.save_tv_desc', 1),
(143, 1, 'save_user', 'perm.save_user_desc', 1),
(144, 1, 'search', 'perm.search_desc', 1),
(145, 1, 'set_sudo', 'perm.set_sudo_desc', 1),
(146, 1, 'settings', 'perm.settings_desc', 1),
(147, 1, 'events', 'perm.events_desc', 1),
(148, 1, 'source_save', 'perm.source_save_desc', 1),
(149, 1, 'source_delete', 'perm.source_delete_desc', 1),
(150, 1, 'source_edit', 'perm.source_edit_desc', 1),
(151, 1, 'source_view', 'perm.source_view_desc', 1),
(152, 1, 'sources', 'perm.sources_desc', 1),
(153, 1, 'steal_locks', 'perm.steal_locks_desc', 1),
(154, 1, 'tree_show_element_ids', 'perm.tree_show_element_ids_desc', 1),
(155, 1, 'tree_show_resource_ids', 'perm.tree_show_resource_ids_desc', 1),
(156, 1, 'undelete_document', 'perm.undelete_document_desc', 1),
(157, 1, 'unpublish_document', 'perm.unpublish_document_desc', 1),
(158, 1, 'unlock_element_properties', 'perm.unlock_element_properties_desc', 1),
(159, 1, 'usergroup_delete', 'perm.usergroup_delete_desc', 1),
(160, 1, 'usergroup_edit', 'perm.usergroup_edit_desc', 1),
(161, 1, 'usergroup_new', 'perm.usergroup_new_desc', 1),
(162, 1, 'usergroup_save', 'perm.usergroup_save_desc', 1),
(163, 1, 'usergroup_user_edit', 'perm.usergroup_user_edit_desc', 1),
(164, 1, 'usergroup_user_list', 'perm.usergroup_user_list_desc', 1),
(165, 1, 'usergroup_view', 'perm.usergroup_view_desc', 1),
(166, 1, 'view', 'perm.view_desc', 1),
(167, 1, 'view_category', 'perm.view_category_desc', 1),
(168, 1, 'view_chunk', 'perm.view_chunk_desc', 1),
(169, 1, 'view_context', 'perm.view_context_desc', 1),
(170, 1, 'view_document', 'perm.view_document_desc', 1),
(171, 1, 'view_element', 'perm.view_element_desc', 1),
(172, 1, 'view_eventlog', 'perm.view_eventlog_desc', 1),
(173, 1, 'view_offline', 'perm.view_offline_desc', 1),
(174, 1, 'view_plugin', 'perm.view_plugin_desc', 1),
(175, 1, 'view_propertyset', 'perm.view_propertyset_desc', 1),
(176, 1, 'view_role', 'perm.view_role_desc', 1),
(177, 1, 'view_snippet', 'perm.view_snippet_desc', 1),
(178, 1, 'view_sysinfo', 'perm.view_sysinfo_desc', 1),
(179, 1, 'view_template', 'perm.view_template_desc', 1),
(180, 1, 'view_tv', 'perm.view_tv_desc', 1),
(181, 1, 'view_user', 'perm.view_user_desc', 1),
(182, 1, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(183, 1, 'workspaces', 'perm.workspaces_desc', 1),
(184, 2, 'add_children', 'perm.add_children_desc', 1),
(185, 2, 'copy', 'perm.copy_desc', 1),
(186, 2, 'create', 'perm.create_desc', 1),
(187, 2, 'delete', 'perm.delete_desc', 1),
(188, 2, 'list', 'perm.list_desc', 1),
(189, 2, 'load', 'perm.load_desc', 1),
(190, 2, 'move', 'perm.move_desc', 1),
(191, 2, 'publish', 'perm.publish_desc', 1),
(192, 2, 'remove', 'perm.remove_desc', 1),
(193, 2, 'save', 'perm.save_desc', 1),
(194, 2, 'steal_lock', 'perm.steal_lock_desc', 1),
(195, 2, 'undelete', 'perm.undelete_desc', 1),
(196, 2, 'unpublish', 'perm.unpublish_desc', 1),
(197, 2, 'view', 'perm.view_desc', 1),
(198, 3, 'load', 'perm.load_desc', 1),
(199, 3, 'list', 'perm.list_desc', 1),
(200, 3, 'view', 'perm.view_desc', 1),
(201, 3, 'save', 'perm.save_desc', 1),
(202, 3, 'remove', 'perm.remove_desc', 1),
(203, 4, 'add_children', 'perm.add_children_desc', 1),
(204, 4, 'create', 'perm.create_desc', 1),
(205, 4, 'copy', 'perm.copy_desc', 1),
(206, 4, 'delete', 'perm.delete_desc', 1),
(207, 4, 'list', 'perm.list_desc', 1),
(208, 4, 'load', 'perm.load_desc', 1),
(209, 4, 'remove', 'perm.remove_desc', 1),
(210, 4, 'save', 'perm.save_desc', 1),
(211, 4, 'view', 'perm.view_desc', 1),
(212, 5, 'create', 'perm.create_desc', 1),
(213, 5, 'copy', 'perm.copy_desc', 1),
(214, 5, 'list', 'perm.list_desc', 1),
(215, 5, 'load', 'perm.load_desc', 1),
(216, 5, 'remove', 'perm.remove_desc', 1),
(217, 5, 'save', 'perm.save_desc', 1),
(218, 5, 'view', 'perm.view_desc', 1),
(219, 6, 'load', 'perm.load_desc', 1),
(220, 6, 'list', 'perm.list_desc', 1),
(221, 6, 'view', 'perm.view_desc', 1),
(222, 6, 'save', 'perm.save_desc', 1),
(223, 6, 'remove', 'perm.remove_desc', 1),
(224, 6, 'view_unpublished', 'perm.view_unpublished_desc', 1),
(225, 6, 'copy', 'perm.copy_desc', 1),
(226, 7, 'list', 'perm.list_desc', 1),
(227, 7, 'load', 'perm.load_desc', 1),
(228, 7, 'view', 'perm.view_desc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_policies`
--

CREATE TABLE `modx_access_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `template` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `class` varchar(191) NOT NULL DEFAULT '',
  `data` text DEFAULT NULL,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_access_policies`
--

INSERT INTO `modx_access_policies` (`id`, `name`, `description`, `parent`, `template`, `class`, `data`, `lexicon`) VALUES
(1, 'Resource', 'policy_resource_desc', 0, 2, '', '{\"add_children\":true,\"create\":true,\"copy\":true,\"delete\":true,\"list\":true,\"load\":true,\"move\":true,\"publish\":true,\"remove\":true,\"save\":true,\"steal_lock\":true,\"undelete\":true,\"unpublish\":true,\"view\":true}', 'permissions'),
(2, 'Administrator', 'policy_administrator_desc', 0, 1, '', '{\"about\":true,\"access_permissions\":true,\"actions\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"database_truncate\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_role\":true,\"delete_snippet\":true,\"delete_static_resource\":true,\"delete_symlink\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_user\":true,\"delete_weblink\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"edit_weblink\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"events\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_unpack\":true,\"file_update\":true,\"file_upload\":true,\"file_view\":true,\"flush_sessions\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"mgr_log_view\":true,\"mgr_log_erase\":true,\"menu_reports\":true,\"menu_security\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_trash\":true,\"menu_user\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"new_weblink\":true,\"packages\":true,\"policy_delete\":true,\"policy_edit\":true,\"policy_new\":true,\"policy_save\":true,\"policy_template_delete\":true,\"policy_template_edit\":true,\"policy_template_new\":true,\"policy_template_save\":true,\"policy_template_view\":true,\"policy_view\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"remove_locks\":true,\"resource_duplicate\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"resourcegroup_delete\":true,\"resourcegroup_edit\":true,\"resourcegroup_new\":true,\"resourcegroup_resource_edit\":true,\"resourcegroup_resource_list\":true,\"resourcegroup_save\":true,\"resourcegroup_view\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_role\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"set_sudo\":true,\"settings\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"sources\":true,\"steal_locks\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unlock_element_properties\":true,\"unpublish_document\":true,\"usergroup_delete\":true,\"usergroup_edit\":true,\"usergroup_new\":true,\"usergroup_save\":true,\"usergroup_user_edit\":true,\"usergroup_user_list\":true,\"usergroup_view\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_unpublished\":true,\"view_user\":true,\"workspaces\":true}', 'permissions'),
(3, 'Load Only', 'policy_load_only_desc', 0, 3, '', '{\"load\":true}', 'permissions'),
(4, 'Load, List and View', 'policy_load_list_and_view_desc', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(5, 'Object', 'policy_object_desc', 0, 3, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true}', 'permissions'),
(6, 'Element', 'policy_element_desc', 0, 4, '', '{\"add_children\":true,\"create\":true,\"delete\":true,\"list\":true,\"load\":true,\"remove\":true,\"save\":true,\"view\":true,\"copy\":true}', 'permissions'),
(7, 'Content Editor', 'policy_content_editor_desc', 0, 1, '', '{\"change_profile\":true,\"class_map\":true,\"countries\":true,\"delete_document\":true,\"delete_static_resource\":true,\"delete_symlink\":true,\"delete_weblink\":true,\"edit_document\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_weblink\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"list\":true,\"load\":true,\"logout\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_tools\":true,\"menu_user\":true,\"new_document\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_weblink\":true,\"resource_duplicate\":true,\"resource_tree\":true,\"save_document\":true,\"source_view\":true,\"tree_show_resource_ids\":true,\"view\":true,\"view_document\":true,\"view_template\":true}', 'permissions'),
(8, 'Media Source Admin', 'policy_media_source_admin_desc', 0, 5, '', '{\"create\":true,\"copy\":true,\"load\":true,\"list\":true,\"save\":true,\"remove\":true,\"view\":true}', 'permissions'),
(9, 'Media Source User', 'policy_media_source_user_desc', 0, 5, '', '{\"load\":true,\"list\":true,\"view\":true}', 'permissions'),
(10, 'Developer', 'policy_developer_desc', 0, 1, '', '{\"about\":true,\"change_password\":true,\"change_profile\":true,\"charsets\":true,\"class_map\":true,\"components\":true,\"content_types\":true,\"countries\":true,\"create\":true,\"credits\":true,\"customize_forms\":true,\"dashboards\":true,\"database\":true,\"delete_category\":true,\"delete_chunk\":true,\"delete_context\":true,\"delete_document\":true,\"delete_eventlog\":true,\"delete_plugin\":true,\"delete_propertyset\":true,\"delete_role\":true,\"delete_snippet\":true,\"delete_template\":true,\"delete_tv\":true,\"delete_user\":true,\"directory_chmod\":true,\"directory_create\":true,\"directory_list\":true,\"directory_remove\":true,\"directory_update\":true,\"edit_category\":true,\"edit_chunk\":true,\"edit_context\":true,\"edit_document\":true,\"edit_locked\":true,\"edit_plugin\":true,\"edit_propertyset\":true,\"edit_role\":true,\"edit_snippet\":true,\"edit_static_resource\":true,\"edit_symlink\":true,\"edit_template\":true,\"edit_tv\":true,\"edit_user\":true,\"edit_weblink\":true,\"element_tree\":true,\"empty_cache\":true,\"error_log_erase\":true,\"error_log_view\":true,\"export_static\":true,\"file_create\":true,\"file_list\":true,\"file_manager\":true,\"file_remove\":true,\"file_tree\":true,\"file_unpack\":true,\"file_update\":true,\"file_upload\":true,\"file_view\":true,\"frames\":true,\"help\":true,\"home\":true,\"language\":true,\"languages\":true,\"lexicons\":true,\"list\":true,\"load\":true,\"logout\":true,\"mgr_log_view\":true,\"mgr_log_erase\":true,\"menu_reports\":true,\"menu_site\":true,\"menu_support\":true,\"menu_system\":true,\"menu_tools\":true,\"menu_user\":true,\"menus\":true,\"messages\":true,\"namespaces\":true,\"new_category\":true,\"new_chunk\":true,\"new_context\":true,\"new_document\":true,\"new_document_in_root\":true,\"new_plugin\":true,\"new_propertyset\":true,\"new_role\":true,\"new_snippet\":true,\"new_static_resource\":true,\"new_symlink\":true,\"new_template\":true,\"new_tv\":true,\"new_user\":true,\"new_weblink\":true,\"packages\":true,\"property_sets\":true,\"providers\":true,\"publish_document\":true,\"purge_deleted\":true,\"remove\":true,\"resource_duplicate\":true,\"resource_quick_create\":true,\"resource_quick_update\":true,\"resource_tree\":true,\"save\":true,\"save_category\":true,\"save_chunk\":true,\"save_context\":true,\"save_document\":true,\"save_plugin\":true,\"save_propertyset\":true,\"save_snippet\":true,\"save_template\":true,\"save_tv\":true,\"save_user\":true,\"search\":true,\"settings\":true,\"source_delete\":true,\"source_edit\":true,\"source_save\":true,\"source_view\":true,\"sources\":true,\"tree_show_element_ids\":true,\"tree_show_resource_ids\":true,\"undelete_document\":true,\"unlock_element_properties\":true,\"unpublish_document\":true,\"view\":true,\"view_category\":true,\"view_chunk\":true,\"view_context\":true,\"view_document\":true,\"view_element\":true,\"view_eventlog\":true,\"view_offline\":true,\"view_plugin\":true,\"view_propertyset\":true,\"view_role\":true,\"view_snippet\":true,\"view_sysinfo\":true,\"view_template\":true,\"view_tv\":true,\"view_unpublished\":true,\"view_user\":true,\"workspaces\":true}', 'permissions'),
(11, 'Context', 'policy_context_desc', 0, 6, '', '{\"load\":true,\"list\":true,\"view\":true,\"save\":true,\"remove\":true,\"copy\":true,\"view_unpublished\":true}', 'permissions'),
(12, 'Hidden Namespace', 'policy_hidden_namespace_desc', 0, 7, '', '{\"load\":false,\"list\":false,\"view\":true}', 'permissions');

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_policy_templates`
--

CREATE TABLE `modx_access_policy_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `template_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `lexicon` varchar(255) NOT NULL DEFAULT 'permissions'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_access_policy_templates`
--

INSERT INTO `modx_access_policy_templates` (`id`, `template_group`, `name`, `description`, `lexicon`) VALUES
(1, 1, 'AdministratorTemplate', 'policy_template_administrator_desc', 'permissions'),
(2, 3, 'ResourceTemplate', 'policy_template_resource_desc', 'permissions'),
(3, 2, 'ObjectTemplate', 'policy_template_object_desc', 'permissions'),
(4, 4, 'ElementTemplate', 'policy_template_element_desc', 'permissions'),
(5, 5, 'MediaSourceTemplate', 'policy_template_mediasource_desc', 'permissions'),
(6, 7, 'ContextTemplate', 'policy_template_context_desc', 'permissions'),
(7, 6, 'NamespaceTemplate', 'policy_template_namespace_desc', 'permissions');

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_policy_template_groups`
--

CREATE TABLE `modx_access_policy_template_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_access_policy_template_groups`
--

INSERT INTO `modx_access_policy_template_groups` (`id`, `name`, `description`) VALUES
(1, 'Administrator', 'policy_template_group_administrator_desc'),
(2, 'Object', 'policy_template_group_object_desc'),
(3, 'Resource', 'policy_template_group_resource_desc'),
(4, 'Element', 'policy_template_group_element_desc'),
(5, 'MediaSource', 'policy_template_group_mediasource_desc'),
(6, 'Namespace', 'policy_template_group_namespace_desc'),
(7, 'Context', 'policy_template_group_context_desc');

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_resources`
--

CREATE TABLE `modx_access_resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_resource_groups`
--

CREATE TABLE `modx_access_resource_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_access_templatevars`
--

CREATE TABLE `modx_access_templatevars` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(100) NOT NULL DEFAULT '',
  `principal_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modPrincipal',
  `principal` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999,
  `policy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_actiondom`
--

CREATE TABLE `modx_actiondom` (
  `id` int(10) UNSIGNED NOT NULL,
  `set` int(11) NOT NULL DEFAULT 0,
  `action` varchar(191) NOT NULL DEFAULT '',
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `xtype` varchar(100) NOT NULL DEFAULT '',
  `container` varchar(255) NOT NULL DEFAULT '',
  `rule` varchar(100) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT '',
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `for_parent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_actions_fields`
--

CREATE TABLE `modx_actions_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(100) NOT NULL DEFAULT 'field',
  `tab` varchar(191) NOT NULL DEFAULT '',
  `form` varchar(255) NOT NULL DEFAULT '',
  `other` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_actions_fields`
--

INSERT INTO `modx_actions_fields` (`id`, `action`, `name`, `type`, `tab`, `form`, `other`, `rank`) VALUES
(1, 'resource/update', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(2, 'resource/update', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(3, 'resource/update', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(4, 'resource/update', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(5, 'resource/update', 'alias', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(6, 'resource/update', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(7, 'resource/update', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(8, 'resource/update', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 5),
(9, 'resource/update', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0),
(10, 'resource/update', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 3),
(11, 'resource/update', 'modx-resource-main-right-top', 'tab', '', 'modx-panel-resource', '', 4),
(12, 'resource/update', 'published', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 0),
(13, 'resource/update', 'deleted', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 1),
(14, 'resource/update', 'publishedon', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 2),
(15, 'resource/update', 'pub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 3),
(16, 'resource/update', 'unpub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 4),
(17, 'resource/update', 'modx-resource-main-right-middle', 'tab', '', 'modx-panel-resource', '', 5),
(18, 'resource/update', 'template', 'field', 'modx-resource-main-right-middle', 'modx-panel-resource', '', 0),
(19, 'resource/update', 'modx-resource-main-right-bottom', 'tab', '', 'modx-panel-resource', '', 6),
(20, 'resource/update', 'hidemenu', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 0),
(21, 'resource/update', 'menutitle', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 1),
(22, 'resource/update', 'link_attributes', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 2),
(23, 'resource/update', 'menuindex', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 3),
(24, 'resource/update', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 7),
(25, 'resource/update', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 8),
(26, 'resource/update', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(27, 'resource/update', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(28, 'resource/update', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 9),
(29, 'resource/update', 'parent-cmb', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(30, 'resource/update', 'content_dispo', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(31, 'resource/update', 'modx-page-settings-box-left', 'tab', '', 'modx-panel-resource', '', 10),
(32, 'resource/update', 'isfolder', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 0),
(33, 'resource/update', 'show_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 1),
(34, 'resource/update', 'hide_children_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 2),
(35, 'resource/update', 'alias_visible', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 3),
(36, 'resource/update', 'uri_override', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 4),
(37, 'resource/update', 'uri', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 5),
(38, 'resource/update', 'modx-page-settings-box-right', 'tab', '', 'modx-panel-resource', '', 11),
(39, 'resource/update', 'richtext', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 0),
(40, 'resource/update', 'cacheable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 1),
(41, 'resource/update', 'searchable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 2),
(42, 'resource/update', 'syncsite', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 3),
(43, 'resource/update', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 12),
(44, 'resource/update', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 13),
(45, 'resource/create', 'modx-resource-settings', 'tab', '', 'modx-panel-resource', '', 0),
(46, 'resource/create', 'modx-resource-main-left', 'tab', '', 'modx-panel-resource', '', 1),
(47, 'resource/create', 'id', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 0),
(48, 'resource/create', 'pagetitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 1),
(49, 'resource/create', 'alias', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 2),
(50, 'resource/create', 'longtitle', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 3),
(51, 'resource/create', 'description', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 4),
(52, 'resource/create', 'introtext', 'field', 'modx-resource-main-left', 'modx-panel-resource', '', 5),
(53, 'resource/create', 'modx-resource-content', 'field', 'modx-resource-content', 'modx-panel-resource', '', 0),
(54, 'resource/create', 'modx-resource-main-right', 'tab', '', 'modx-panel-resource', '', 3),
(55, 'resource/create', 'modx-resource-main-right-top', 'tab', '', 'modx-panel-resource', '', 4),
(56, 'resource/create', 'published', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 0),
(57, 'resource/create', 'deleted', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 1),
(58, 'resource/create', 'publishedon', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 2),
(59, 'resource/create', 'pub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 3),
(60, 'resource/create', 'unpub_date', 'field', 'modx-resource-main-right-top', 'modx-panel-resource', '', 4),
(61, 'resource/create', 'modx-resource-main-right-middle', 'tab', '', 'modx-panel-resource', '', 5),
(62, 'resource/create', 'template', 'field', 'modx-resource-main-right-middle', 'modx-panel-resource', '', 0),
(63, 'resource/create', 'modx-resource-main-right-bottom', 'tab', '', 'modx-panel-resource', '', 6),
(64, 'resource/create', 'hidemenu', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 0),
(65, 'resource/create', 'menutitle', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 1),
(66, 'resource/create', 'link_attributes', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 2),
(67, 'resource/create', 'menuindex', 'field', 'modx-resource-main-right-bottom', 'modx-panel-resource', '', 3),
(68, 'resource/create', 'modx-page-settings', 'tab', '', 'modx-panel-resource', '', 7),
(69, 'resource/create', 'modx-page-settings-left', 'tab', '', 'modx-panel-resource', '', 8),
(70, 'resource/create', 'class_key', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 0),
(71, 'resource/create', 'content_type', 'field', 'modx-page-settings-left', 'modx-panel-resource', '', 1),
(72, 'resource/create', 'modx-page-settings-right', 'tab', '', 'modx-panel-resource', '', 9),
(73, 'resource/create', 'parent-cmb', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 0),
(74, 'resource/create', 'content_dispo', 'field', 'modx-page-settings-right', 'modx-panel-resource', '', 1),
(75, 'resource/create', 'modx-page-settings-box-left', 'tab', '', 'modx-panel-resource', '', 10),
(76, 'resource/create', 'isfolder', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 0),
(77, 'resource/create', 'show_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 1),
(78, 'resource/create', 'hide_children_in_tree', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 2),
(79, 'resource/create', 'alias_visible', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 3),
(80, 'resource/create', 'uri_override', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 4),
(81, 'resource/create', 'uri', 'field', 'modx-page-settings-box-left', 'modx-panel-resource', '', 5),
(82, 'resource/create', 'modx-page-settings-box-right', 'tab', '', 'modx-panel-resource', '', 11),
(83, 'resource/create', 'richtext', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 0),
(84, 'resource/create', 'cacheable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 1),
(85, 'resource/create', 'searchable', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 2),
(86, 'resource/create', 'syncsite', 'field', 'modx-page-settings-box-right', 'modx-panel-resource', '', 3),
(87, 'resource/create', 'modx-panel-resource-tv', 'tab', '', 'modx-panel-resource', 'tv', 12),
(88, 'resource/create', 'modx-resource-access-permissions', 'tab', '', 'modx-panel-resource', '', 13);

-- --------------------------------------------------------

--
-- Table structure for table `modx_active_users`
--

CREATE TABLE `modx_active_users` (
  `internalKey` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(11) NOT NULL DEFAULT 0,
  `id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_categories`
--

CREATE TABLE `modx_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(10) UNSIGNED DEFAULT 0,
  `category` varchar(45) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_categories_closure`
--

CREATE TABLE `modx_categories_closure` (
  `ancestor` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `descendant` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `depth` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_content_type`
--

CREATE TABLE `modx_content_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `mime_type` tinytext DEFAULT NULL,
  `file_extensions` tinytext DEFAULT NULL,
  `icon` tinytext DEFAULT NULL,
  `headers` mediumtext DEFAULT NULL,
  `binary` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_content_type`
--

INSERT INTO `modx_content_type` (`id`, `name`, `description`, `mime_type`, `file_extensions`, `icon`, `headers`, `binary`) VALUES
(1, 'HTML', 'HTML content', 'text/html', '.html', '', NULL, 0),
(2, 'XML', 'XML content', 'text/xml', '.xml', 'icon-xml', NULL, 0),
(3, 'Text', 'Plain text content', 'text/plain', '.txt', 'icon-txt', NULL, 0),
(4, 'CSS', 'CSS content', 'text/css', '.css', 'icon-css', NULL, 0),
(5, 'JavaScript', 'JavaScript content', 'text/javascript', '.js', 'icon-js', NULL, 0),
(6, 'RSS', 'For RSS feeds', 'application/rss+xml', '.rss', 'icon-rss', NULL, 0),
(7, 'JSON', 'JSON', 'application/json', '.json', 'icon-json', NULL, 0),
(8, 'PDF', 'PDF Files', 'application/pdf', '.pdf', 'icon-pdf', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_context`
--

CREATE TABLE `modx_context` (
  `key` varchar(100) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_context`
--

INSERT INTO `modx_context` (`key`, `name`, `description`, `rank`) VALUES
('mgr', 'Manager', 'The default manager or administration context for content management activity.', 0),
('web', 'Website', 'The default front-end context for your web site.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `modx_context_resource`
--

CREATE TABLE `modx_context_resource` (
  `context_key` varchar(191) NOT NULL,
  `resource` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_context_setting`
--

CREATE TABLE `modx_context_setting` (
  `context_key` varchar(191) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_context_setting`
--

INSERT INTO `modx_context_setting` (`context_key`, `key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('mgr', 'allow_tags_in_post', '1', 'combo-boolean', 'core', 'system', NULL),
('mgr', 'modRequest.class', 'MODX\\Revolution\\modManagerRequest', 'textfield', 'core', 'system', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modx_dashboard`
--

CREATE TABLE `modx_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `hide_trees` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `customizable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_dashboard`
--

INSERT INTO `modx_dashboard` (`id`, `name`, `description`, `hide_trees`, `customizable`) VALUES
(1, 'Default', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_dashboard_widget`
--

CREATE TABLE `modx_dashboard_widget` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `namespace` varchar(191) NOT NULL DEFAULT '',
  `lexicon` varchar(191) NOT NULL DEFAULT 'core:dashboards',
  `size` varchar(255) NOT NULL DEFAULT 'half',
  `permission` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_dashboard_widget`
--

INSERT INTO `modx_dashboard_widget` (`id`, `name`, `description`, `type`, `content`, `properties`, `namespace`, `lexicon`, `size`, `permission`) VALUES
(1, 'w_newsfeed', 'w_newsfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-news.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(2, 'w_securityfeed', 'w_securityfeed_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.modx-security.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(3, 'w_whosonline', 'w_whosonline_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-online.php', NULL, 'core', 'core:dashboards', 'one-third', ''),
(4, 'w_recentlyeditedresources', 'w_recentlyeditedresources_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.grid-rer.php', NULL, 'core', 'core:dashboards', 'two-thirds', 'view_document'),
(5, 'w_configcheck', 'w_configcheck_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.configcheck.php', NULL, 'core', 'core:dashboards', 'full', ''),
(6, 'w_buttons', 'w_buttons_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.buttons.php', '{\"create-resource\":{\"link\":\"[[++manager_url]]?a=resource\\/create\",\"icon\":\"file-o\",\"title\":\"[[%action_new_resource]]\",\"description\":\"[[%action_new_resource_desc]]\"},\"view-site\":{\"link\":\"[[++site_url]]\",\"icon\":\"eye\",\"title\":\"[[%action_view_website]]\",\"description\":\"[[%action_view_website_desc]]\",\"target\":\"_blank\"},\"advanced-search\":{\"link\":\"[[++manager_url]]?a=search\",\"icon\":\"search\",\"title\":\"[[%action_advanced_search]]\",\"description\":\"[[%action_advanced_search_desc]]\"},\"manage-users\":{\"link\":\"[[++manager_url]]?a=security\\/user\",\"icon\":\"user\",\"title\":\"[[%action_manage_users]]\",\"description\":\"[[%action_manage_users_desc]]\"}}', 'core', 'core:dashboards', 'full', ''),
(7, 'w_updates', 'w_updates_desc', 'file', '[[++manager_path]]controllers/default/dashboard/widget.updates.php', NULL, 'core', 'core:dashboards', 'one-third', 'workspaces');

-- --------------------------------------------------------

--
-- Table structure for table `modx_dashboard_widget_placement`
--

CREATE TABLE `modx_dashboard_widget_placement` (
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `widget` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `size` varchar(255) NOT NULL DEFAULT 'half'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_dashboard_widget_placement`
--

INSERT INTO `modx_dashboard_widget_placement` (`user`, `dashboard`, `widget`, `rank`, `size`) VALUES
(0, 1, 1, 2, 'one-third'),
(0, 1, 2, 3, 'one-third'),
(0, 1, 3, 5, 'one-third'),
(0, 1, 4, 6, 'two-thirds'),
(0, 1, 5, 1, 'full'),
(0, 1, 6, 0, 'full'),
(0, 1, 7, 4, 'one-third'),
(1, 1, 1, 2, 'one-third'),
(1, 1, 2, 3, 'one-third'),
(1, 1, 3, 5, 'one-third'),
(1, 1, 4, 6, 'two-thirds'),
(1, 1, 5, 1, 'full'),
(1, 1, 6, 0, 'full'),
(1, 1, 7, 4, 'one-third');

-- --------------------------------------------------------

--
-- Table structure for table `modx_deprecated_call`
--

CREATE TABLE `modx_deprecated_call` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `call_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `caller` varchar(191) NOT NULL DEFAULT '',
  `caller_file` varchar(191) NOT NULL DEFAULT '',
  `caller_line` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_deprecated_call`
--

INSERT INTO `modx_deprecated_call` (`id`, `method`, `call_count`, `caller`, `caller_file`, `caller_line`) VALUES
(1, 1, 2, 'MODX\\Revolution\\Registry\\modRegistry::_initRegister', 'C:\\xampp\\htdocs\\airport-parking\\core\\src\\Revolution\\Registry\\modRegistry.php', 173),
(2, 2, 956, 'xPDO\\xPDO::call', 'C:\\xampp\\htdocs\\airport\\core\\vendor\\xpdo\\xpdo\\src\\xPDO\\xPDO.php', 774),
(3, 2, 956, 'xPDO\\Om\\xPDOObject::load', 'C:\\xampp\\htdocs\\airport\\core\\vendor\\xpdo\\xpdo\\src\\xPDO\\Om\\xPDOObject.php', 402),
(4, 1, 2, 'MODX\\Revolution\\Registry\\modRegistry::_initRegister', 'C:\\xampp\\htdocs\\airport\\core\\src\\Revolution\\Registry\\modRegistry.php', 174);

-- --------------------------------------------------------

--
-- Table structure for table `modx_deprecated_method`
--

CREATE TABLE `modx_deprecated_method` (
  `id` int(10) UNSIGNED NOT NULL,
  `definition` varchar(191) NOT NULL DEFAULT '',
  `since` varchar(191) NOT NULL DEFAULT '',
  `recommendation` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_deprecated_method`
--

INSERT INTO `modx_deprecated_method` (`id`, `definition`, `since`, `recommendation`) VALUES
(1, 'registry.modDbRegister', '3.0', 'Replace references to class registry.modDbRegister with MODX\\Revolution\\Registry\\modDbRegister to take advantage of PSR-4 autoloading.'),
(2, 'modContextSetting', '3.0', 'Replace references to class modContextSetting with MODX\\Revolution\\modContextSetting to take advantage of PSR-4 autoloading.');

-- --------------------------------------------------------

--
-- Table structure for table `modx_documentgroup_names`
--

CREATE TABLE `modx_documentgroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `private_webgroup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_document_groups`
--

CREATE TABLE `modx_document_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_group` int(11) NOT NULL DEFAULT 0,
  `document` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_element_property_sets`
--

CREATE TABLE `modx_element_property_sets` (
  `element` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `element_class` varchar(100) NOT NULL DEFAULT '',
  `property_set` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_extension_packages`
--

CREATE TABLE `modx_extension_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT 'core',
  `path` text DEFAULT NULL,
  `table_prefix` varchar(255) NOT NULL DEFAULT '',
  `service_class` varchar(255) NOT NULL DEFAULT '',
  `service_name` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_fc_profiles`
--

CREATE TABLE `modx_fc_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_fc_profiles_usergroups`
--

CREATE TABLE `modx_fc_profiles_usergroups` (
  `usergroup` int(11) NOT NULL DEFAULT 0,
  `profile` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_fc_sets`
--

CREATE TABLE `modx_fc_sets` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile` int(11) NOT NULL DEFAULT 0,
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `template` int(11) NOT NULL DEFAULT 0,
  `constraint` varchar(255) NOT NULL DEFAULT '',
  `constraint_field` varchar(100) NOT NULL DEFAULT '',
  `constraint_class` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_lexicon_entries`
--

CREATE TABLE `modx_lexicon_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `topic` varchar(191) NOT NULL DEFAULT 'default',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  `createdon` datetime DEFAULT NULL,
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_manager_log`
--

CREATE TABLE `modx_manager_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `occurred` datetime NOT NULL DEFAULT current_timestamp(),
  `action` varchar(100) NOT NULL DEFAULT '',
  `classKey` varchar(100) NOT NULL DEFAULT '',
  `item` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `user`, `occurred`, `action`, `classKey`, `item`) VALUES
(1, 1, '2025-12-22 11:40:05', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(2, 1, '2025-12-23 04:36:57', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(3, 1, '2025-12-23 04:46:11', 'chunk_create', 'MODX\\Revolution\\modChunk', '1'),
(4, 1, '2025-12-23 04:46:37', 'template_create', 'MODX\\Revolution\\modTemplate', '2'),
(5, 1, '2025-12-23 04:47:56', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(6, 1, '2025-12-23 05:15:40', 'chunk_create', 'MODX\\Revolution\\modChunk', '2'),
(7, 1, '2025-12-23 05:15:58', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(8, 1, '2025-12-23 05:15:58', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(9, 1, '2025-12-23 05:17:37', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(10, 1, '2025-12-23 05:17:37', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(11, 1, '2025-12-23 05:21:28', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(12, 1, '2025-12-23 05:21:28', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(13, 1, '2025-12-23 05:32:10', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(14, 1, '2025-12-23 05:32:10', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(15, 1, '2025-12-23 05:36:08', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(16, 1, '2025-12-23 05:36:08', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(17, 1, '2025-12-23 05:38:52', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(18, 1, '2025-12-23 05:38:52', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(19, 1, '2025-12-23 05:44:10', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(20, 1, '2025-12-23 05:44:10', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(21, 1, '2025-12-23 05:45:35', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(22, 1, '2025-12-23 05:45:35', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(23, 1, '2025-12-23 05:48:58', 'chunk_create', 'MODX\\Revolution\\modChunk', '3'),
(24, 1, '2025-12-23 05:50:26', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(25, 1, '2025-12-23 05:50:26', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(26, 1, '2025-12-23 05:52:30', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(27, 1, '2025-12-23 05:53:19', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(28, 1, '2025-12-23 05:54:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(29, 1, '2025-12-23 06:01:49', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(30, 1, '2025-12-23 06:07:49', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(31, 1, '2025-12-23 06:08:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(32, 1, '2025-12-23 06:24:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(33, 1, '2025-12-23 06:25:00', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(34, 1, '2025-12-23 06:40:15', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(35, 1, '2025-12-23 06:43:53', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(36, 1, '2025-12-23 06:44:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(37, 1, '2025-12-23 06:46:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(38, 1, '2025-12-23 06:47:59', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(39, 1, '2025-12-23 06:48:16', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(40, 1, '2025-12-23 06:52:59', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(41, 1, '2025-12-23 06:53:17', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(42, 1, '2025-12-23 06:53:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(43, 1, '2025-12-23 06:54:12', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(44, 1, '2025-12-23 06:55:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(45, 1, '2025-12-23 06:55:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(46, 1, '2025-12-23 06:58:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(47, 1, '2025-12-23 06:58:18', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(48, 1, '2025-12-23 07:02:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(49, 1, '2025-12-23 07:07:05', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(50, 1, '2025-12-23 07:08:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(51, 1, '2025-12-23 07:11:16', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(52, 1, '2025-12-23 07:16:00', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(53, 1, '2025-12-23 07:16:42', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(54, 1, '2025-12-23 07:17:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(55, 1, '2025-12-23 07:18:34', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(56, 1, '2025-12-23 07:24:48', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(57, 1, '2025-12-23 07:26:10', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(58, 1, '2025-12-23 07:29:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(59, 1, '2025-12-23 07:31:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(60, 1, '2025-12-23 07:31:54', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(61, 1, '2025-12-23 07:32:33', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(62, 1, '2025-12-23 07:32:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(63, 1, '2025-12-23 07:39:55', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(64, 1, '2025-12-23 07:51:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(65, 1, '2025-12-23 07:54:47', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(66, 1, '2025-12-23 07:59:38', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(67, 1, '2025-12-23 08:06:23', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(68, 1, '2025-12-23 08:21:36', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(69, 1, '2025-12-23 08:34:54', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(70, 1, '2025-12-23 08:37:42', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(71, 1, '2025-12-23 08:38:24', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(72, 1, '2025-12-23 08:38:50', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(73, 1, '2025-12-23 10:27:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(74, 1, '2025-12-23 10:35:31', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(75, 1, '2025-12-23 10:36:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(76, 1, '2025-12-23 10:37:52', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(77, 1, '2025-12-23 10:51:21', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(78, 1, '2025-12-23 10:52:48', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(79, 1, '2025-12-23 10:53:11', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(80, 1, '2025-12-23 10:55:11', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(81, 1, '2025-12-23 10:59:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(82, 1, '2025-12-23 11:23:08', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(83, 1, '2025-12-23 11:26:54', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(84, 1, '2025-12-23 11:59:33', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(85, 1, '2025-12-23 12:02:00', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(86, 1, '2025-12-23 12:04:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(87, 1, '2025-12-23 12:06:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(88, 1, '2025-12-23 12:13:29', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(89, 1, '2025-12-23 12:14:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(90, 1, '2025-12-23 12:24:23', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(91, 1, '2025-12-23 12:33:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(92, 1, '2025-12-23 12:35:41', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(93, 1, '2025-12-23 12:35:41', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(94, 1, '2025-12-23 12:36:28', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(95, 1, '2025-12-23 12:39:21', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(96, 1, '2025-12-23 12:39:21', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(97, 1, '2025-12-23 12:40:03', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(98, 1, '2025-12-23 12:41:18', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(99, 1, '2025-12-23 12:46:21', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(100, 1, '2025-12-23 12:54:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(101, 1, '2025-12-23 12:58:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(102, 1, '2025-12-23 13:00:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(103, 1, '2025-12-24 04:58:15', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(104, 1, '2025-12-24 04:58:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(105, 1, '2025-12-24 05:00:02', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(106, 1, '2025-12-24 05:24:46', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(107, 1, '2025-12-24 05:28:05', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(108, 1, '2025-12-24 05:30:21', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(109, 1, '2025-12-24 05:33:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(110, 1, '2025-12-24 05:33:24', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(111, 1, '2025-12-24 05:40:25', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(112, 1, '2025-12-24 05:41:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(113, 1, '2025-12-24 05:44:28', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(114, 1, '2025-12-24 05:45:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(115, 1, '2025-12-24 05:48:16', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(116, 1, '2025-12-24 05:53:34', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(117, 1, '2025-12-24 05:56:24', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(118, 1, '2025-12-24 05:56:27', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(119, 1, '2025-12-24 05:56:55', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(120, 1, '2025-12-24 05:59:37', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(121, 1, '2025-12-24 06:03:26', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(122, 1, '2025-12-24 06:05:20', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(123, 1, '2025-12-24 06:11:40', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(124, 1, '2025-12-24 06:12:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(125, 1, '2025-12-24 06:13:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(126, 1, '2025-12-24 06:18:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(127, 1, '2025-12-24 06:19:48', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(128, 1, '2025-12-24 06:20:49', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(129, 1, '2025-12-24 06:21:38', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(130, 1, '2025-12-24 06:29:34', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(131, 1, '2025-12-24 06:37:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(132, 1, '2025-12-24 06:37:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(133, 1, '2025-12-24 06:38:31', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(134, 1, '2025-12-24 07:06:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(135, 1, '2025-12-24 07:12:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(136, 1, '2025-12-24 07:15:46', 'resource_create', 'MODX\\Revolution\\modDocument', '2'),
(137, 1, '2025-12-24 07:16:12', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(138, 1, '2025-12-24 07:16:13', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(139, 1, '2025-12-24 07:17:13', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(140, 1, '2025-12-24 07:17:53', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(141, 1, '2025-12-24 07:23:15', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(142, 1, '2025-12-24 07:25:25', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(143, 1, '2025-12-24 07:26:30', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(144, 1, '2025-12-24 07:26:45', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(145, 1, '2025-12-24 07:27:37', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(146, 1, '2025-12-24 07:28:13', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(147, 1, '2025-12-24 07:29:05', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(148, 1, '2025-12-24 07:30:38', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(149, 1, '2025-12-24 07:31:05', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(150, 1, '2025-12-24 07:31:33', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(151, 1, '2025-12-24 07:31:40', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(152, 1, '2025-12-24 07:52:04', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(153, 1, '2025-12-24 08:04:59', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(154, 1, '2025-12-24 08:05:37', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(155, 1, '2025-12-24 08:09:09', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(156, 1, '2025-12-24 08:09:27', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(157, 1, '2025-12-24 08:29:22', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(158, 1, '2025-12-24 08:29:48', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(159, 1, '2025-12-24 08:30:28', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(160, 1, '2025-12-24 08:31:00', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(161, 1, '2025-12-24 08:38:30', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(162, 1, '2025-12-24 08:40:41', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(163, 1, '2025-12-24 08:46:36', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(164, 1, '2025-12-24 08:47:05', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(165, 1, '2025-12-24 08:51:11', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(166, 1, '2025-12-24 08:54:37', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(167, 1, '2025-12-24 08:55:37', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(168, 1, '2025-12-25 05:46:03', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(169, 1, '2025-12-25 05:46:31', 'resource_create', 'MODX\\Revolution\\modDocument', '3'),
(170, 1, '2025-12-25 05:46:36', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(171, 1, '2025-12-25 05:47:05', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(172, 1, '2025-12-25 05:47:07', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(173, 1, '2025-12-25 05:49:38', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(174, 1, '2025-12-25 05:50:28', 'snippet_create', 'MODX\\Revolution\\modSnippet', '1'),
(175, 1, '2025-12-25 05:55:24', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(176, 1, '2025-12-25 05:55:25', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(177, 1, '2025-12-25 05:55:54', 'snippet_update', 'MODX\\Revolution\\modSnippet', '1'),
(178, 1, '2025-12-25 05:55:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 1 Default'),
(179, 1, '2025-12-25 05:56:04', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(180, 1, '2025-12-25 05:59:19', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(181, 1, '2025-12-25 06:00:51', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(182, 1, '2025-12-25 06:02:54', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(183, 1, '2025-12-25 06:07:50', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(184, 1, '2025-12-25 06:08:53', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(185, 1, '2025-12-25 06:10:36', 'resource_update', 'MODX\\Revolution\\modResource', '3'),
(186, 1, '2025-12-25 06:11:02', 'resource_create', 'MODX\\Revolution\\modDocument', '4'),
(187, 1, '2025-12-25 06:11:07', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(188, 1, '2025-12-25 06:11:43', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(189, 1, '2025-12-25 06:11:43', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(190, 1, '2025-12-25 06:12:46', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(191, 1, '2025-12-25 06:17:55', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(192, 1, '2025-12-25 06:18:08', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(193, 1, '2025-12-25 06:24:48', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(194, 1, '2025-12-25 06:25:11', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(195, 1, '2025-12-25 06:30:41', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(196, 1, '2025-12-25 06:31:13', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(197, 1, '2025-12-25 06:32:01', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(198, 1, '2025-12-25 06:39:09', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(199, 1, '2025-12-25 06:39:47', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(200, 1, '2025-12-25 06:40:24', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(201, 1, '2025-12-25 06:40:48', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(202, 1, '2025-12-25 06:47:13', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(203, 1, '2025-12-25 06:55:16', 'resource_create', 'MODX\\Revolution\\modDocument', '5'),
(204, 1, '2025-12-25 06:55:19', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(205, 1, '2025-12-25 06:56:13', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(206, 1, '2025-12-25 06:56:13', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(207, 1, '2025-12-25 06:59:44', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(208, 1, '2025-12-25 07:05:59', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(209, 1, '2025-12-25 07:07:53', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(210, 1, '2025-12-25 07:09:35', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(211, 1, '2025-12-25 07:09:35', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(212, 1, '2025-12-25 07:10:05', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(213, 1, '2025-12-25 07:11:43', 'resource_update', 'MODX\\Revolution\\modResource', '5'),
(214, 1, '2025-12-25 10:30:41', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(215, 1, '2025-12-25 10:41:32', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(216, 1, '2025-12-25 16:14:18', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(217, 1, '2025-12-25 16:20:35', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(218, 1, '2025-12-25 16:20:36', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(219, 1, '2025-12-25 16:21:12', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(220, 1, '2025-12-25 16:21:12', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(221, 1, '2025-12-25 16:59:12', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(222, 1, '2025-12-25 16:59:12', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(223, 1, '2025-12-25 17:09:45', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(224, 1, '2025-12-25 17:09:46', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(225, 1, '2025-12-25 17:10:20', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(226, 1, '2025-12-25 17:10:21', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(227, 1, '2025-12-25 17:12:17', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(228, 1, '2025-12-25 17:12:17', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(229, 1, '2025-12-25 17:18:57', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(230, 1, '2025-12-25 17:18:57', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(231, 1, '2025-12-25 17:21:58', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(232, 1, '2025-12-25 17:21:59', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(233, 1, '2025-12-25 17:22:21', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(234, 1, '2025-12-25 17:22:22', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(235, 1, '2025-12-25 17:27:16', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(236, 1, '2025-12-25 17:27:16', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(237, 1, '2025-12-25 17:28:31', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(238, 1, '2025-12-25 17:28:31', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(239, 1, '2025-12-25 17:32:03', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(240, 1, '2025-12-25 17:32:04', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(241, 1, '2025-12-25 17:33:47', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(242, 1, '2025-12-25 17:33:48', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(243, 1, '2025-12-25 17:34:33', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(244, 1, '2025-12-25 17:34:33', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(245, 1, '2025-12-25 17:34:54', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(246, 1, '2025-12-25 17:34:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(247, 1, '2025-12-25 17:36:30', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(248, 1, '2025-12-25 17:36:31', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(249, 1, '2025-12-25 17:36:45', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(250, 1, '2025-12-25 17:36:45', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(251, 1, '2025-12-25 17:36:50', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(252, 1, '2025-12-25 17:36:50', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(253, 1, '2025-12-25 17:37:09', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(254, 1, '2025-12-25 17:37:10', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(255, 1, '2025-12-25 17:38:04', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(256, 1, '2025-12-25 17:38:04', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(257, 1, '2025-12-25 17:38:45', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(258, 1, '2025-12-25 17:38:45', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(259, 1, '2025-12-25 17:39:38', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(260, 1, '2025-12-25 17:39:39', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(261, 1, '2025-12-25 17:43:01', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(262, 1, '2025-12-25 17:53:37', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(263, 1, '2025-12-25 17:56:51', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(264, 1, '2025-12-25 18:02:08', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(265, 1, '2025-12-25 18:02:08', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(266, 1, '2025-12-26 05:46:59', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(267, 1, '2025-12-26 05:57:50', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(268, 1, '2025-12-26 06:00:31', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(269, 1, '2026-04-17 11:34:31', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(270, 1, '2026-04-17 11:34:50', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(271, 1, '2026-04-17 11:37:06', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(272, 1, '2026-04-17 11:37:06', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(273, 1, '2026-04-17 11:43:38', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(274, 1, '2026-04-17 11:47:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(275, 1, '2026-04-17 11:50:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(276, 1, '2026-04-17 11:50:37', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(277, 1, '2026-04-17 11:51:27', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(278, 1, '2026-04-17 11:52:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(279, 1, '2026-04-17 11:54:07', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(280, 1, '2026-04-17 11:56:56', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(281, 1, '2026-04-17 11:59:10', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(282, 1, '2026-04-17 11:59:31', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(283, 1, '2026-04-17 12:01:04', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(284, 1, '2026-04-17 12:01:35', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(285, 1, '2026-04-17 12:03:41', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(286, 1, '2026-04-17 12:07:43', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(287, 1, '2026-04-17 12:11:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(288, 1, '2026-04-17 13:40:09', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(289, 1, '2026-04-17 13:41:15', 'resource_update', 'MODX\\Revolution\\modResource', '2'),
(290, 1, '2026-04-17 13:43:13', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(291, 1, '2026-04-17 13:43:33', 'resource_update', 'MODX\\Revolution\\modResource', '4'),
(292, 1, '2026-04-17 13:44:26', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(293, 1, '2026-04-17 13:44:27', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(294, 1, '2026-04-17 13:49:25', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(295, 1, '2026-04-17 13:49:25', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(296, 1, '2026-04-17 13:50:06', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(297, 1, '2026-04-17 13:50:06', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(298, 1, '2026-04-17 13:50:23', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(299, 1, '2026-04-17 13:50:24', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(300, 1, '2026-04-17 13:54:04', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(301, 1, '2026-04-17 13:54:04', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(302, 1, '2026-04-17 13:54:25', 'chunk_update', 'MODX\\Revolution\\modChunk', '1'),
(303, 1, '2026-04-17 13:54:25', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 1 Default'),
(304, 1, '2026-04-17 14:15:32', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(305, 1, '2026-04-17 14:15:32', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(306, 1, '2026-04-17 14:15:44', 'chunk_update', 'MODX\\Revolution\\modChunk', '2'),
(307, 1, '2026-04-17 14:15:44', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 2 Default'),
(308, 1, '2026-04-17 14:17:58', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(309, 1, '2026-04-17 14:18:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(310, 1, '2026-04-20 13:05:06', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(311, 1, '2026-04-23 14:33:33', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(312, 1, '2026-04-23 14:34:11', 'chunk_update', 'MODX\\Revolution\\modChunk', '3'),
(313, 1, '2026-04-23 14:34:11', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modChunk 3 Default'),
(314, 1, '2026-04-23 14:34:45', 'resource_create', 'MODX\\Revolution\\modDocument', '6'),
(315, 1, '2026-04-23 14:34:53', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(316, 1, '2026-04-23 14:39:00', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(317, 1, '2026-04-23 17:54:54', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(318, 1, '2026-04-23 17:55:26', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(319, 1, '2026-04-23 18:01:27', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(320, 1, '2026-04-23 18:04:37', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(321, 1, '2026-04-23 18:05:28', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(322, 1, '2026-04-23 18:06:39', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(323, 1, '2026-04-23 18:08:25', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(324, 1, '2026-04-23 18:12:17', 'file_upload', '', 'Filesystem: assets\\images/\\'),
(325, 1, '2026-04-23 18:12:42', 'file_rename', '', 'Filesystem: assets\\images\\app-login-illustration-svg-download-png-4346990-removebg-preview.png -> login-illustration.png'),
(326, 1, '2026-04-23 18:21:24', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(327, 1, '2026-04-23 18:22:13', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(328, 1, '2026-04-23 18:23:25', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(329, 1, '2026-04-23 18:24:08', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(330, 1, '2026-04-23 18:24:55', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(331, 1, '2026-04-24 05:46:51', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(332, 1, '2026-04-24 05:50:05', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(333, 1, '2026-04-24 05:54:49', 'snippet_create', 'MODX\\Revolution\\modSnippet', '2'),
(334, 1, '2026-04-24 05:56:09', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(335, 1, '2026-04-24 05:57:42', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(336, 1, '2026-04-24 05:57:42', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(337, 1, '2026-04-24 05:57:53', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(338, 1, '2026-04-24 05:57:53', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(339, 1, '2026-04-24 05:58:13', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(340, 1, '2026-04-24 05:58:14', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(341, 1, '2026-04-24 05:58:47', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(342, 1, '2026-04-24 05:58:47', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(343, 1, '2026-04-24 05:59:32', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(344, 1, '2026-04-24 05:59:34', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(345, 1, '2026-04-24 06:00:15', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(346, 1, '2026-04-24 06:00:16', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(347, 1, '2026-04-24 06:03:23', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(348, 1, '2026-04-24 06:05:59', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(349, 1, '2026-04-24 06:06:01', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(350, 1, '2026-04-24 06:06:28', 'resource_create', 'MODX\\Revolution\\modDocument', '7'),
(351, 1, '2026-04-24 06:06:40', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(352, 1, '2026-04-24 06:07:11', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(353, 1, '2026-04-24 06:08:07', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(354, 1, '2026-04-24 06:08:08', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(355, 1, '2026-04-24 06:08:42', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(356, 1, '2026-04-24 06:09:00', 'snippet_create', 'MODX\\Revolution\\modSnippet', '3'),
(357, 1, '2026-04-24 06:09:28', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(358, 1, '2026-04-24 06:11:22', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(359, 1, '2026-04-24 06:11:22', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(360, 1, '2026-04-24 06:11:32', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(361, 1, '2026-04-24 06:12:32', 'resource_update', 'MODX\\Revolution\\modResource', '7'),
(362, 1, '2026-04-24 06:14:37', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(363, 1, '2026-04-24 06:14:37', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(364, 1, '2026-04-24 06:24:51', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(365, 1, '2026-04-24 06:25:00', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(366, 1, '2026-04-24 06:25:01', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(367, 1, '2026-04-24 06:25:36', 'resource_create', 'MODX\\Revolution\\modDocument', '8'),
(368, 1, '2026-04-24 06:25:40', 'resource_update', 'MODX\\Revolution\\modResource', '8'),
(369, 1, '2026-04-24 06:25:57', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(370, 1, '2026-04-24 06:25:57', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(371, 1, '2026-04-24 06:32:27', 'snippet_create', 'MODX\\Revolution\\modSnippet', '4'),
(372, 1, '2026-04-24 06:32:36', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(373, 1, '2026-04-24 06:32:37', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(374, 1, '2026-04-24 06:32:47', 'resource_update', 'MODX\\Revolution\\modResource', '8'),
(375, 1, '2026-04-24 06:43:54', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(376, 1, '2026-04-24 06:43:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(377, 1, '2026-04-24 06:56:18', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(378, 1, '2026-04-24 06:56:18', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(379, 1, '2026-04-24 06:58:30', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(380, 1, '2026-04-24 06:58:30', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(381, 1, '2026-04-24 07:00:01', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(382, 1, '2026-04-24 07:00:01', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(383, 1, '2026-04-24 07:01:26', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(384, 1, '2026-04-24 07:01:26', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(385, 1, '2026-04-24 07:03:11', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(386, 1, '2026-04-24 07:03:11', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(387, 1, '2026-04-24 07:03:43', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(388, 1, '2026-04-24 07:03:44', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(389, 1, '2026-04-24 07:04:22', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(390, 1, '2026-04-24 07:04:23', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(391, 1, '2026-04-24 07:06:19', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(392, 1, '2026-04-24 07:06:19', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(393, 1, '2026-04-24 07:06:56', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(394, 1, '2026-04-24 07:06:57', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(395, 1, '2026-04-24 07:15:05', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(396, 1, '2026-04-24 07:15:07', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(397, 1, '2026-04-24 07:15:24', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(398, 1, '2026-04-24 07:15:25', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(399, 1, '2026-04-24 07:15:46', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(400, 1, '2026-04-24 07:15:47', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(401, 1, '2026-04-24 07:18:25', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(402, 1, '2026-04-24 07:18:26', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(403, 1, '2026-04-24 07:18:33', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(404, 1, '2026-04-24 07:18:34', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(405, 1, '2026-04-24 07:18:54', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(406, 1, '2026-04-24 07:18:54', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(407, 1, '2026-04-24 07:20:03', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(408, 1, '2026-04-24 07:20:03', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(409, 1, '2026-04-24 07:21:15', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(410, 1, '2026-04-24 07:21:16', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(411, 1, '2026-04-24 07:21:43', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(412, 1, '2026-04-24 07:21:43', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(413, 1, '2026-04-24 07:23:29', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(414, 1, '2026-04-24 07:23:30', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(415, 1, '2026-04-24 08:02:24', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(416, 1, '2026-04-24 08:02:25', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(417, 1, '2026-04-24 08:02:46', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(418, 1, '2026-04-24 08:02:46', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(419, 1, '2026-04-24 08:24:00', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(420, 1, '2026-04-24 08:24:01', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(421, 1, '2026-04-24 08:24:16', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(422, 1, '2026-04-24 08:24:17', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(423, 1, '2026-04-24 08:24:34', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(424, 1, '2026-04-24 08:24:34', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(425, 1, '2026-04-24 08:26:56', 'snippet_create', 'MODX\\Revolution\\modSnippet', '5'),
(426, 1, '2026-04-24 08:27:10', 'resource_create', 'MODX\\Revolution\\modDocument', '9'),
(427, 1, '2026-04-24 08:27:16', 'resource_update', 'MODX\\Revolution\\modResource', '9'),
(428, 1, '2026-04-24 08:27:42', 'resource_update', 'MODX\\Revolution\\modResource', '9'),
(429, 1, '2026-04-24 08:30:29', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(430, 1, '2026-04-24 08:30:32', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(431, 1, '2026-04-24 08:30:33', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(432, 1, '2026-04-24 08:30:43', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(433, 1, '2026-04-24 08:30:44', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(434, 1, '2026-04-24 08:31:53', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(435, 1, '2026-04-24 08:31:57', 'snippet_update', 'MODX\\Revolution\\modSnippet', '3'),
(436, 1, '2026-04-24 08:31:57', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 3 Default'),
(437, 1, '2026-04-24 08:32:08', 'snippet_update', 'MODX\\Revolution\\modSnippet', '4'),
(438, 1, '2026-04-24 08:32:09', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 4 Default'),
(439, 1, '2026-04-24 08:32:18', 'snippet_update', 'MODX\\Revolution\\modSnippet', '5'),
(440, 1, '2026-04-24 08:32:18', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 5 Default'),
(441, 1, '2026-04-24 08:33:54', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(442, 1, '2026-04-24 08:36:19', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(443, 1, '2026-04-24 08:37:40', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(444, 1, '2026-04-24 08:38:20', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(445, 1, '2026-04-24 08:39:23', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(446, 1, '2026-04-24 08:41:11', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(447, 1, '2026-04-24 08:41:12', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(448, 1, '2026-04-24 08:54:58', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(449, 1, '2026-04-24 08:59:18', 'login', 'MODX\\Revolution\\modContext', 'mgr'),
(450, 1, '2026-04-24 09:00:02', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(451, 1, '2026-04-24 09:00:02', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(452, 1, '2026-04-24 09:01:04', 'resource_create', 'MODX\\Revolution\\modDocument', '10'),
(453, 1, '2026-04-24 09:01:17', 'resource_update', 'MODX\\Revolution\\modResource', '10'),
(454, 1, '2026-04-24 09:01:28', 'resource_update', 'MODX\\Revolution\\modResource', '10'),
(455, 1, '2026-04-24 09:01:38', 'snippet_create', 'MODX\\Revolution\\modSnippet', '6'),
(456, 1, '2026-04-24 09:01:57', 'snippet_create', 'MODX\\Revolution\\modSnippet', '7'),
(457, 1, '2026-04-24 09:02:07', 'resource_create', 'MODX\\Revolution\\modDocument', '11'),
(458, 1, '2026-04-24 09:02:12', 'resource_update', 'MODX\\Revolution\\modResource', '11'),
(459, 1, '2026-04-24 09:02:30', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(460, 1, '2026-04-24 09:02:59', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(461, 1, '2026-04-24 09:05:10', 'snippet_update', 'MODX\\Revolution\\modSnippet', '2'),
(462, 1, '2026-04-24 09:05:10', 'propertyset_update_from_element', 'MODX\\Revolution\\modPropertySet', 'MODX\\Revolution\\modSnippet 2 Default'),
(463, 1, '2026-04-24 09:05:59', 'resource_update', 'MODX\\Revolution\\modResource', '6'),
(464, 1, '2026-04-24 09:08:22', 'resource_update', 'MODX\\Revolution\\modResource', '1'),
(465, 1, '2026-04-24 09:11:11', 'resource_update', 'MODX\\Revolution\\modResource', '1');

-- --------------------------------------------------------

--
-- Table structure for table `modx_media_sources`
--

CREATE TABLE `modx_media_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\Sources\\modFileMediaSource',
  `properties` mediumtext DEFAULT NULL,
  `is_stream` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_media_sources`
--

INSERT INTO `modx_media_sources` (`id`, `name`, `description`, `class_key`, `properties`, `is_stream`) VALUES
(1, 'Filesystem', '', 'MODX\\Revolution\\Sources\\modFileMediaSource', 'a:0:{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_media_sources_contexts`
--

CREATE TABLE `modx_media_sources_contexts` (
  `source` int(11) NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_media_sources_elements`
--

CREATE TABLE `modx_media_sources_elements` (
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `object_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modTemplateVar',
  `object` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context_key` varchar(100) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_membergroup_names`
--

CREATE TABLE `modx_membergroup_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dashboard` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_membergroup_names`
--

INSERT INTO `modx_membergroup_names` (`id`, `name`, `description`, `parent`, `rank`, `dashboard`) VALUES
(1, 'Administrator', NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_member_groups`
--

CREATE TABLE `modx_member_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `member` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `role` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `rank` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_member_groups`
--

INSERT INTO `modx_member_groups` (`id`, `user_group`, `member`, `role`, `rank`) VALUES
(1, 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `modx_menus`
--

CREATE TABLE `modx_menus` (
  `text` varchar(191) NOT NULL DEFAULT '',
  `parent` varchar(191) NOT NULL DEFAULT '',
  `action` varchar(191) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `menuindex` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `handler` text NOT NULL,
  `permissions` text NOT NULL,
  `namespace` varchar(100) NOT NULL DEFAULT 'core'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_menus`
--

INSERT INTO `modx_menus` (`text`, `parent`, `action`, `description`, `icon`, `menuindex`, `params`, `handler`, `permissions`, `namespace`) VALUES
('about', 'usernav', 'help', 'about_desc', '<i class=\"icon-question-circle icon\"></i>', 3, '', '', 'help', 'core'),
('access', 'usernav', '', '', '<i class=\"icon-user-lock icon\"></i>', 1, '', '', 'access_permissions', 'core'),
('acls', 'access', 'security/permission', 'acls_desc', '', 2, '', '', 'access_permissions', 'core'),
('admin', 'usernav', '', '', '<i class=\"icon-gear icon\"></i>', 2, '', '', 'settings', 'core'),
('components', 'topnav', '', '', '<i class=\"icon-cube icon\"></i>', 2, '', '', 'components', 'core'),
('content_types', 'site', 'system/contenttype', 'content_types_desc', '', 4, '', '', 'content_types', 'core'),
('contexts', 'admin', 'context', 'contexts_desc', '', 4, '', '', 'view_context', 'core'),
('dashboards', 'admin', 'system/dashboards', 'dashboards_desc', '', 5, '', '', 'dashboards', 'core'),
('edit_menu', 'admin', 'system/action', 'edit_menu_desc', '', 3, '', '', 'actions', 'core'),
('eventlog_viewer', 'reports', 'system/event', 'eventlog_viewer_desc', '', 1, '', '', 'view_eventlog', 'core'),
('file_browser', 'media', 'media/browser', 'file_browser_desc', '', 0, '', '', 'file_manager', 'core'),
('flush_access', 'access', '', 'flush_access_desc', '', 3, '', 'MODx.msg.confirm({\n                            title: _(\'flush_access\')\n                            ,text: _(\'flush_access_confirm\')\n                            ,url: MODx.config.connector_url\n                            ,params: {\n                                action: \'security/access/flush\'\n                            }\n                            ,listeners: {\n                                \'success\': {fn:function() { location.href = \'./\'; },scope:this},\n                                \'failure\': {fn:function(response) { Ext.MessageBox.alert(\'failure\', response.responseText); },scope:this},\n                            }\n                        });', 'access_permissions', 'core'),
('flush_sessions', 'access', '', 'flush_sessions_desc', '', 4, '', 'MODx.msg.confirm({\n                            title: _(\'flush_sessions\')\n                            ,text: _(\'flush_sessions_confirm\')\n                            ,url: MODx.config.connector_url\n                            ,params: {\n                                action: \'security/flush\'\n                            }\n                            ,listeners: {\n                                \'success\': {fn:function() { location.href = \'./\'; },scope:this}\n                            }\n                        });', 'flush_sessions', 'core'),
('form_customization', 'admin', 'security/forms', 'form_customization_desc', '', 1, '', '', 'customize_forms', 'core'),
('installer', 'components', 'workspaces', 'installer_desc', '', 0, '', '', 'packages', 'core'),
('language', 'admin', '', 'language_desc', '', 8, '', '', 'language', 'core'),
('lexicon_management', 'admin', 'workspaces/lexicon', 'lexicon_management_desc', '', 7, '', '', 'lexicons', 'core'),
('logout', 'user', 'security/logout', 'logout_desc', '', 2, '', 'MODx.logout(); return false;', 'logout', 'core'),
('media', 'topnav', '', '', '<i class=\"icon-file-image-o icon\"></i>', 1, '', '', 'file_manager', 'core'),
('messages', 'user', 'security/message', 'messages_desc', '', 1, '', '', 'messages', 'core'),
('namespaces', 'admin', 'workspaces/namespace', 'namespaces_desc', '', 6, '', '', 'namespaces', 'core'),
('new_resource', 'site', 'resource/create', 'new_resource_desc', '', 0, '', '', 'new_document', 'core'),
('propertysets', 'admin', 'element/propertyset', 'propertysets_desc', '', 2, '', '', 'property_sets', 'core'),
('refreshuris', 'refresh_site', '', 'refreshuris_desc', '', 0, '', 'MODx.refreshURIs(); return false;', 'empty_cache', 'core'),
('refresh_site', 'site', '', 'refresh_site_desc', '', 1, '', 'MODx.clearCache(); return false;', 'empty_cache', 'core'),
('remove_locks', 'site', '', 'remove_locks_desc', '', 2, '', 'MODx.removeLocks();return false;', 'remove_locks', 'core'),
('reports', 'admin', '', 'reports_desc', '', 9, '', '', 'menu_reports', 'core'),
('resource_groups', 'access', 'security/resourcegroup', 'resource_groups_desc', '', 1, '', '', 'access_permissions', 'core'),
('site', 'topnav', '', '', '<i class=\"icon-file-text-o icon\"></i>', 0, '', '', 'menu_site', 'core'),
('site_schedule', 'site', 'resource/site_schedule', 'site_schedule_desc', '', 3, '', '', 'view_document', 'core'),
('sources', 'media', 'source', 'sources_desc', '', 1, '', '', 'sources', 'core'),
('system_settings', 'admin', 'system/settings', 'system_settings_desc', '', 0, '', '', 'settings', 'core'),
('topnav', '', '', 'topnav_desc', '', 0, '', '', '', 'core'),
('trash', 'site', 'resource/trash', 'trash_desc', '', 5, '', '', 'menu_trash', 'core'),
('user', 'usernav', '', '', '<span id=\"user-avatar\" title=\"{$username}\">{$userImage}</span> <span id=\"user-username\">{$username}</span>', 0, '', '', 'menu_user', 'core'),
('usernav', '', '', 'usernav_desc', '', 1, '', '', '', 'core'),
('users', 'access', 'security/user', 'user_management_desc', '', 0, '', '', 'view_user', 'core'),
('view_logging', 'reports', 'system/logs', 'view_logging_desc', '', 0, '', '', 'mgr_log_view', 'core'),
('view_sysinfo', 'reports', 'system/info', 'view_sysinfo_desc', '', 2, '', '', 'view_sysinfo', 'core'),
('{$username}', 'user', 'security/profile', 'profile_desc', '', 0, '', '', 'change_profile', 'core');

-- --------------------------------------------------------

--
-- Table structure for table `modx_namespaces`
--

CREATE TABLE `modx_namespaces` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `path` text DEFAULT NULL,
  `assets_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_namespaces`
--

INSERT INTO `modx_namespaces` (`name`, `path`, `assets_path`) VALUES
('core', '{core_path}', '{assets_path}');

-- --------------------------------------------------------

--
-- Table structure for table `modx_property_set`
--

CREATE TABLE `modx_property_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `properties` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_register_messages`
--

CREATE TABLE `modx_register_messages` (
  `topic` int(10) UNSIGNED NOT NULL,
  `id` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `valid` datetime NOT NULL,
  `accessed` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `accesses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `payload` mediumtext NOT NULL,
  `kill` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_register_queues`
--

CREATE TABLE `modx_register_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `options` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_register_queues`
--

INSERT INTO `modx_register_queues` (`id`, `name`, `options`) VALUES
(1, 'locks', 'a:1:{s:9:\"directory\";s:5:\"locks\";}'),
(2, 'resource_reload', 'a:1:{s:9:\"directory\";s:15:\"resource_reload\";}');

-- --------------------------------------------------------

--
-- Table structure for table `modx_register_topics`
--

CREATE TABLE `modx_register_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `options` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_register_topics`
--

INSERT INTO `modx_register_topics` (`id`, `queue`, `name`, `created`, `updated`, `options`) VALUES
(1, 1, '/resource/', '2025-12-23 04:46:53', NULL, NULL),
(2, 2, '/resourcereload/', '2025-12-23 04:47:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modx_session`
--

CREATE TABLE `modx_session` (
  `id` varchar(191) NOT NULL DEFAULT '',
  `access` int(10) UNSIGNED NOT NULL,
  `data` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_session`
--

INSERT INTO `modx_session` (`id`, `access`, `data`) VALUES
('3bu872qo191dj29dp9pd054eif', 1776947689, 'modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.user.contextTokens|a:1:{s:3:\"mgr\";i:1;}manager_language|s:2:\"en\";modx.mgr.user.token|s:52:\"modx69e1dd98294e22.03597616_169ea119cd74710.41565581\";modx.mgr.session.cookie.lifetime|i:0;modx.mgr.user.config|a:0:{}newResourceTokens|a:1:{i:0;s:23:\"69ea11e7077e51.38411369\";}'),
('8kuba3isbe566bs000vrkbrg98', 1776668743, 'modx.user.contextTokens|a:0:{}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}'),
('euoeuo276rlg07jd6m7363f8bi', 1777014388, 'modx.user.contextTokens|a:1:{s:3:\"mgr\";i:1;}modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.mgr.user.token|s:52:\"modx69e1dd98294e22.03597616_169eb14c6cfd9a4.31465386\";modx.mgr.session.cookie.lifetime|i:604800;modx.mgr.user.config|a:0:{}newResourceTokens|a:11:{i:0;s:23:\"69eb14cee87536.45336634\";i:1;s:23:\"69eb15313d2580.36031354\";i:2;s:23:\"69eb156fe7be74.23512912\";i:3;s:23:\"69eb1579ba9db8.65374771\";i:4;s:23:\"69eb157a2b8f73.09494261\";i:5;s:23:\"69eb157a9d7261.07010139\";i:6;s:23:\"69eb15b58cfab2.81121977\";i:7;s:23:\"69eb15bac8cac8.94962403\";i:8;s:23:\"69eb15bb792a26.25015385\";i:9;s:23:\"69eb164c340476.54936501\";i:10;s:23:\"69eb1674db01c0.96017562\";}'),
('gl19v063vba8p18n6pdp5hek85', 1776959713, 'modx.user.contextTokens|a:1:{s:3:\"mgr\";i:1;}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.mgr.user.token|s:52:\"modx69e1dd98294e22.03597616_169ea40cdf21a76.05318454\";modx.mgr.session.cookie.lifetime|i:0;modx.mgr.user.config|a:0:{}newResourceTokens|a:1:{i:0;s:23:\"69ea40e1b8d2e2.60422034\";}'),
('j62ednsnc6uv2fkoqf7oek66en', 1776959682, 'modx.user.0.resourceGroups|a:1:{s:3:\"web\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"web\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.user.contextTokens|a:0:{}'),
('ni0p5ou7u2qudjn5bt2q344t9b', 1776428213, 'modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.user.contextTokens|a:1:{s:3:\"mgr\";i:1;}manager_language|s:2:\"en\";login_failed|i:1;modx.mgr.user.token|s:52:\"modx69e1dd98294e22.03597616_169e1fea70491d7.36805128\";modx.mgr.session.cookie.lifetime|i:0;modx.mgr.user.config|a:0:{}newResourceTokens|a:6:{i:0;s:23:\"69e1fea9b4c915.52045448\";i:1;s:23:\"69e200b291c465.24398574\";i:2;s:23:\"69e2019b0c14b7.78920236\";i:3;s:23:\"69e21c1c34b075.17493214\";i:4;s:23:\"69e21cb3eaf614.52757997\";i:5;s:23:\"69e224b499b9d3.98311452\";}'),
('rikq9ecrvs7p9bnbh6bt56bnt2', 1776683106, 'modx.user.contextTokens|a:1:{s:3:\"mgr\";i:1;}manager_language|s:2:\"en\";modx.user.0.resourceGroups|a:1:{s:3:\"mgr\";a:0:{}}modx.user.0.attributes|a:1:{s:3:\"mgr\";a:5:{s:32:\"MODX\\Revolution\\modAccessContext\";a:1:{s:3:\"web\";a:1:{i:0;a:3:{s:9:\"principal\";i:0;s:9:\"authority\";i:0;s:6:\"policy\";a:1:{s:4:\"load\";b:1;}}}}s:38:\"MODX\\Revolution\\modAccessResourceGroup\";a:0:{}s:33:\"MODX\\Revolution\\modAccessCategory\";a:0:{}s:44:\"MODX\\Revolution\\Sources\\modAccessMediaSource\";a:0:{}s:34:\"MODX\\Revolution\\modAccessNamespace\";a:0:{}}}modx.mgr.user.token|s:52:\"modx69e1dd98294e22.03597616_169e608623412e3.10775657\";modx.mgr.session.cookie.lifetime|i:0;modx.mgr.user.config|a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_content`
--

CREATE TABLE `modx_site_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `pagetitle` varchar(191) NOT NULL DEFAULT '',
  `longtitle` varchar(191) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `alias` varchar(191) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `pub_date` int(11) NOT NULL DEFAULT 0,
  `unpub_date` int(11) NOT NULL DEFAULT 0,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `isfolder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `introtext` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `richtext` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `template` int(11) NOT NULL DEFAULT 0,
  `menuindex` int(11) NOT NULL DEFAULT 0,
  `searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `cacheable` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `createdby` int(11) NOT NULL DEFAULT 0,
  `createdon` int(11) NOT NULL DEFAULT 0,
  `editedby` int(11) NOT NULL DEFAULT 0,
  `editedon` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deletedon` int(11) NOT NULL DEFAULT 0,
  `deletedby` int(11) NOT NULL DEFAULT 0,
  `publishedon` int(11) NOT NULL DEFAULT 0,
  `publishedby` int(11) NOT NULL DEFAULT 0,
  `menutitle` varchar(255) NOT NULL DEFAULT '',
  `content_dispo` tinyint(1) NOT NULL DEFAULT 0,
  `hidemenu` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modDocument',
  `context_key` varchar(100) NOT NULL DEFAULT 'web',
  `content_type` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `uri` text DEFAULT NULL,
  `uri_override` tinyint(1) NOT NULL DEFAULT 0,
  `hide_children_in_tree` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_tree` tinyint(1) NOT NULL DEFAULT 1,
  `properties` mediumtext DEFAULT NULL,
  `alias_visible` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible`) VALUES
(1, 'document', 'Home', 'Congratulations!', '', 'index', '', 1, 0, 0, 0, 0, '', '<body id = \"homePage\">\r\n    <!-- Home hero starts -->\r\n    <section id=\"homeHero\">\r\n        <div class=\"swiper homeHeroSwiper\">\r\n            <div class=\"swiper-wrapper\">\r\n                <!-- Slide 1 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-1.webp\" alt=\"Airport Parking\"class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 2 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-2.webp\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n\r\n                <!-- Slide 3 -->\r\n                <div class=\"swiper-slide\">\r\n                    <img src=\"assets/images/home-hero/img-3.webp\" alt=\"Airport Parking\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- Hero Content -->\r\n        <div class=\"homehero-content\">\r\n            <h1 data-aos=\"fade-down-right\" data-aos-duration=\"1000\">\r\n                Secure Parking  <br class=\"d-md-none\">\r\n                Designed <br class=\"d-none d-md-block\">\r\n                Around Your Journey\r\n            </h1>\r\n            <p class=\"mt-3\" data-aos=\"fade-down-left\" data-aos-duration=\"1000\">\r\n                Secure, convenient parking designed to keep your journey smooth.<br>\r\n                Reliable access, peace of mind, and hassle-free arrivals and returns.\r\n            </p>\r\n            <a href=\"#reserve-slots\" class=\"mt-3\">Reserve Your Space</a>\r\n        </div>\r\n\r\n    </section>\r\n    <!-- Home hero ends -->\r\n\r\n    <!-- Who we are section starts -->\r\n    <section id=\"who-we-are\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row d-flex align-items-center justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-8\">\r\n                    <h2 class=\"heading\">Who We Are</h2>\r\n                    <p class=\"supportive-text\">Airport Parking Service</p>\r\n                    <p><b>Airportparking.lk</b> is a flagship venture of <b><a href=\"https://explore.vacations/\" style =\"text-decoration:none; color: black;\">Explore Holdings</a></b> and a pioneer in introducing dedicated airport parking services in Sri Lanka. As one of the first providers to establish this concept, we set the industry standard for secure, convenient, and cost-effective airport parking solutions. Our facility is strategically located in close proximity to Bandaranaike International Airport, enabling travelers to park with confidence and reach the terminal quickly and effortlessly.</p>\r\n                    <p class=\"mb-0\">With 24/7 surveillance, controlled access, and a professionally trained operations team, we ensure the highest level of safety and reliability for every vehicle entrusted to us. Supported by flexible parking options and responsive customer service, Airportparking.lk continues to lead the industry by delivering a seamless, stress-free parking experience that allows our customers to begin and end their journeys with complete peace of mind.\r\n                    </p>\r\n                </div>\r\n                 <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <img src=\"assets/images/who-we-are.jpeg\" alt=\"Who we are image\" class=\"img-fluid rounded-3 mt-4 mt-md-0\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Who we are section ends -->\r\n\r\n    <!-- Why Choose Us section starts -->\r\n    <section id=\"why-choose-us\" class=\"py-3\">\r\n        <div class=\"container\">\r\n            <div class=\"row g-5 justify-content-center\">\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-1.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>SAFE AND SECURE PARKING AREAS</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-2.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>FRIENDLY AND EFFICIENT STAFF</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-3.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>ONLINE BOOKING FACILITY</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6 col-lg-3 why-choose\">\r\n                    <img src=\"assets/images/why-choose-us/img-4.png\" alt=\"Why choose us image\" class=\"img-fluid\">\r\n                    <p>24/7 CCTV SURVEILLANCE</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Why Choose Us section ends -->\r\n\r\n    <!--Reserve Slots section starts -->\r\n    <section id=\"reserve-slots\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Reserve Your Parking Slot Today</h2>\r\n                    <p class=\"supportive-text text-center\">Book your parking space in advance and enjoy a hassle-free experience.</p>\r\n                </div>\r\n                <hr>\r\n\r\n                <p class=\"text-danger text-center mb-2 fw-bold\">Pick your trip dates to see available parking!</p>  \r\n                <div class=\"date-picker-container d-flex justify-content-center align-items-center flex-wrap gap-3 mb-3\">\r\n                    <div class=\"date-picker-item\">\r\n                        <label for=\"initial-start-date\" class=\"form-label\">Start Date</label>\r\n                        <input type=\"date\" id=\"initial-start-date\" class=\"form-control rounded-0\">\r\n                    </div>\r\n\r\n                    <div class=\"date-picker-item\">\r\n                        <label for=\"initial-end-date\" class=\"form-label\">End Date</label>\r\n                        <input type=\"date\" id=\"initial-end-date\" class=\"form-control rounded-0\">\r\n                    </div>\r\n\r\n                    <div class=\"date-picker-item align-self-end\">\r\n                        <button id=\"check-availability\" class=\"btn btn-success rounded-0\" style=\"background-color:#001c35; border-color: transparent;\">Check Availability</button>\r\n                    </div>\r\n                    <div class=\"date-picker-item align-self-end\" style=\"min-width: auto;\">\r\n                        <button id=\"clear-dates\" class=\"btn btn-outline-danger\">\r\n                            <i class=\"bi bi-trash3\"></i>                        \r\n                        </button>\r\n                    </div>\r\n                </div>\r\n\r\n                <hr>              \r\n                <div class=\"col-12 d-flex justify-content-center\">\r\n                    <div class=\"parking-building-wrapper\">\r\n                        <!-- Legend -->\r\n                        <div class=\"parking-legend\">\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"available\"></span> Available\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"selected\"></span> Selected\r\n                            </div>\r\n                            <div class=\"legend-item\">\r\n                                <span class=\"booked\"></span> Booked\r\n                            </div>\r\n                        </div>\r\n\r\n                        <!-- Parking layout -->\r\n                        <div class=\"floor active\">\r\n                            <!-- ALL BOOKED banner -->\r\n                            <div class=\"all-booked-banner d-none\">\r\n                                <div class=\"all-booked-card\">\r\n                                    <div class=\"all-booked-icon\">\r\n                                        <i class=\"bi bi-exclamation-circle-fill\"></i>\r\n                                    </div>\r\n                                    <div class=\"all-booked-text\">\r\n                                        <h5>Basement Parking Fully Booked</h5>\r\n                                        <p>\r\n                                            We’re sorry for the inconvenience. All Basement Parking slots are currently booked\r\n                                            for your selected dates. Please check the available Surface Parking slots below.\r\n                                        </p>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Main parking layout -->\r\n                            <div class=\"main-layout booked-zone\">\r\n                                <!-- Row 1 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 2 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 3 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 4 -->\r\n                                <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                    </div>\r\n                                </div>\r\n\r\n                                <!-- Row 5 -->\r\n                                <!-- <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                    </div>\r\n                                </div> -->\r\n\r\n                                <!-- Row 6 -->\r\n                                <!-- <div class=\"row parking-row\">\r\n                                    <div class=\"bay left\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <span class=\"marker elevator\"></span>\r\n                                    </div>\r\n                                    <div class=\"driveway\">Driveway</div>\r\n                                    <div class=\"bay right\">\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                        <button class=\"slot booked\"><i class=\"bi bi-car-front\"></i></button>\r\n                                    </div>\r\n                                </div> -->\r\n                            </div>\r\n\r\n                            <!-- Outer slots -->\r\n                            <div class=\"outer-slots-section\">\r\n                                <h4 class=\"outer-slot-title\">Surface Parking Area</h4>\r\n                                <p class=\"outer-slot-subtitle\">Limited slots available near perimeter</p>\r\n\r\n                                <div class=\"outer-layout\">\r\n                                    <!-- Row 1 -->\r\n                                    <div class=\"row parking-row\">\r\n                                        <div class=\"bay left\">\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G1\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G2\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G3\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        </div>\r\n\r\n                                        <div class=\"driveway small\">Driveway</div>\r\n\r\n                                        <div class=\"bay right\">\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G4\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G5\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G6\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        </div>\r\n                                    </div>\r\n\r\n                                    <!-- Row 2 -->\r\n                                    <div class=\"row parking-row\">\r\n                                        <div class=\"bay left\">\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G7\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G8\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        </div>\r\n\r\n                                        <div class=\"driveway small\">Driveway</div>\r\n\r\n                                        <div class=\"bay right\">\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G9\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                            <button class=\"slot outer-slot\" data-slot=\"G10\"><i class=\"bi bi-car-front icon-car\"></i></button>\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Entry/Exit -->\r\n                            <div class=\"entry-exit\">\r\n                                <span class=\"marker entry\">Entry</span>\r\n                                <span class=\"marker exit\">Exit</span>\r\n                            </div>\r\n                        </div>\r\n\r\n<div class=\"extend-note\">\r\n    Need to extend your booking after booking?  \r\n    Create an account via <strong>My Account</strong> in the navigation bar and update your end date easily.  \r\n    <br>⚠️ Additional charges will be applied based on the extended duration.\r\n</div>\r\n\r\n                        <!-- Booking Modal -->\r\n                        <div id=\"booking-modal\" class=\"modal\">\r\n                            <div class=\"modal-content\">\r\n                                <span class=\"close\">&times;</span>\r\n                                <h3>Reserve Your Parking Slot</h3>\r\n                                <hr>\r\n                                <form id=\"booking-form\" class=\"booking-form-grid\">\r\n                                    <div class=\"form-group d-none\">\r\n                                        <label>Slot Number</label>\r\n                                        <input type=\"text\" id=\"slot-number\" readonly>\r\n                                    </div>\r\n\r\n                                   <div class=\"form-group\">\r\n                                        <label>Vehicle Number <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"vehicle_number\" placeholder=\"Enter Vehicle Number\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Vehicle Type <span class=\"text-danger\">*</span></label>\r\n                                        <select class=\"form-select\" id=\"vehicle-type\" required>\r\n                                            <option value=\"\">Select vehicle</option>\r\n                                            <option value=\"car\">Car</option>\r\n                                            <option value=\"van\">Van</option>\r\n                                            <option value=\"bus\">Bus</option>\r\n                                        </select>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Flight Number <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"flight-number\" placeholder=\"Enter Flight Number\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Start Date & Time <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"datetime-local\" id=\"start-date\" class=\"form-control\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>End Date & Time <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"datetime-local\" id=\"end-date\" class=\"form-control\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group\">\r\n                                        <label>Name <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"user-name\" placeholder=\"Enter Name\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Hometown <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"text\" id=\"hometown\" placeholder=\"Enter Hometown\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group\">\r\n                                        <label>Email <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"email\" id=\"user-email\" placeholder=\"Enter Email\" required>\r\n                                    </div>\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>WhatsApp Number <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"number\" id=\"whatsapp-number\" class=\"form-control\" required placeholder=\"94771234567 (without + or spaces)\">\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Air Ticket Image <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"file\" id=\"air_ticket_image_url\" name=\"air_ticket_image_url\" accept=\"image/*\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Passport Copy Image <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"file\" id=\"passport_copy_image_url\" name=\"passport_copy_image_url\" accept=\"image/*\" required>\r\n                                    </div>\r\n\r\n                                    <div class=\"form-group mb-0 mt-2\">\r\n                                        <label>Passenger Count <span class=\"text-danger\">*</span></label>\r\n                                        <input type=\"number\" id=\"passenger_count\" name=\"passenger_count\" class=\"form-control\" min=\"1\" placeholder=\"Enter Passenger Count\" required>\r\n                                    </div>\r\n                                    <div class=\"extra-services mt-2\">\r\n                                        <p><strong>Extra Services</strong></p>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"1000\" data-name=\"Body Wash & Vacuum\">\r\n                                            Body Wash & Vacuum (LKR 1,000)\r\n                                        </label>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"500\" data-name=\"Shuttle One Way\">\r\n                                            Shuttle One Way (LKR 500)\r\n                                        </label>\r\n\r\n                                        <label class=\"checkbox-item\">\r\n                                            <input type=\"checkbox\" class=\"extra-service\" value=\"1000\" data-name=\"Shuttle Two Way\">\r\n                                            Shuttle Two Way (LKR 1,000)\r\n                                        </label>\r\n                                    </div>\r\n                                    <div class=\"price-summary mt-2\">\r\n                                        <p>\r\n                                            <strong>Total Days:</strong>\r\n                                            <span id=\"total-days-text\">0</span>\r\n                                        </p>\r\n                                        <p>\r\n                                            <strong>Price per Day:</strong>\r\n                                            LKR 1,000\r\n                                        </p>\r\n                                        <p class=\"total-amount\">\r\n                                            <strong>Total Price:</strong>\r\n                                            LKR <span id=\"total-price-text\">0</span>\r\n                                        </p>\r\n                                    </div>\r\n                                    <div class=\"booking-notes mt-3\">\r\n                                        <p class=\"mb-0\"><strong>Important Notice:</strong></p>\r\n                                        <ul class=\"whitespace-nowrap\">\r\n                                           <li>Please arrive at least <strong>one (1) hour early</strong> to allow time for vehicle handover and necessary procedures.</li>\r\n                                            <li>If the end time is extended, a 2-hour grace applies; thereafter, 25% (2–4h), 50% (4–6h), 75% (6–8h), or 100% (>8h) of the daily rate will be charged.</li>\r\n                                        </ul>\r\n                                    </div>\r\n                                    <button type=\"submit\" id=\"submit-booking-btn\">Book Slot</button>\r\n                                    <!-- <div class=\"booking-notes mt-3\">\r\n                                        <p><strong>Important Notice:</strong></p>\r\n                                        <ul>\r\n                                            <li>Please arrive at our office at least <strong>three (3) hours prior</strong> to your scheduled departure time.</li>\r\n                                            <li>Transfers are arranged to ensure arrival within the recommended check-in period.</li>\r\n                                        </ul>\r\n                                    </div> -->\r\n                                </form>\r\n                               \r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!--Reserve Slots section ends -->\r\n\r\n    <!-- Booking Tips section starts -->\r\n    <section id=\"booking-tips\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Booking Tips</h2>\r\n                    <p class=\"supportive-text text-center\">Follow these steps for a smooth parking experience.</p>\r\n                </div>\r\n            </div>\r\n           <div class=\"row mt-4\">\r\n                <div class=\"col-md-8\">\r\n                    <ul class=\"booking-tips-timeline\">\r\n                        <li>\r\n                            <span class=\"tip-circle\">01</span>\r\n                            <div class=\"tip-content\">Reserve your parking slot in advance</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">02</span>\r\n                            <div class=\"tip-content\">Double-check your start and end dates</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">03</span>\r\n                            <div class=\"tip-content\">Keep your reference number safe</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">04</span>\r\n                            <div class=\"tip-content\">Select extra services if required</div>\r\n                        </li>\r\n                        <li>\r\n                            <span class=\"tip-circle\">05</span>\r\n                            <div class=\"tip-content\">Arrive early for a smooth check-in</div>\r\n                        </li>\r\n                    </ul>\r\n                </div>\r\n                <div class=\"col-md-4 d-flex justify-content-center align-items-center\">\r\n                    <img src=\"assets/images/booking-tips.webp\" alt=\"Booking tips image\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Booking Tips section ends -->\r\n\r\n    <!-- Our Services section starts -->\r\n    <section id=\"our-services\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">Our Services</h2>\r\n                    <p class=\"supportive-text text-center\">Comprehensive parking solutions tailored to your needs.</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"row justify-content-center mt-4\">\r\n                <!-- Airport Parking Services -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/airport-parking-area.webp\" alt=\"Airport Parking Services\" class=\"img-fluid\">\r\n                        <div class=\"service-content\">\r\n                            <h3>Airport Parking Services</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Secure airport parking 10 minutes from BIA.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    Airport Parking Sri Lanka is one of the wing companies of\r\n                                    Explore Holdings. We are the only airport parking provider\r\n                                    in Sri Lanka for overseas travelers, located just\r\n                                    10 minutes from Bandaranayake International Airport with\r\n                                    optional shuttle services. <a href=\"https://airportparking.lk/\">Airport Parking</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Tour Operations in Sri Lanka -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/airport-taxi-service.webp\"\r\n                            alt=\"Tour Operations in Sri Lanka\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Tour Operations in Sri Lanka</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Tailor-made Sri Lanka holiday experiences.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    Explore Vacations offers customized Sri Lanka tours with\r\n                                    customer-friendly guided experiences. Every client is\r\n                                    treated as a VIP, ensuring a memorable and enriching\r\n                                    journey across the island. <a href=\"https://explore.vacations/\" target=\"_blank\">Explore Vacations</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Car Rental Services -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/car-rental-services.webp\"\r\n                            alt=\"Car Rental Services\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Car Rental Services</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Premium vehicles at affordable rates.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    SR Rent A Car provides a fleet of over 100 luxury vehicles\r\n                                    suitable for business travel and leisure trips. Our\r\n                                    smooth rental process ensures convenience and comfort\r\n                                    for every journey. <a href=\"https://srilankarentacar.lk/\" target=\"_blank\">SR Rent a Car</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Airport Taxi Service -->\r\n                <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                    <div class=\"service-card\">\r\n                        <img src=\"assets/images/services/hotel-booking-service.webp\"\r\n                            alt=\"Airport Taxi Service\"\r\n                            class=\"img-fluid\">\r\n\r\n                        <div class=\"service-content\">\r\n                            <h3>Airport Taxi Service</h3>\r\n                            <p class=\"service-short text-center\">\r\n                                Seamless airport-hotel transfers.\r\n                            </p>\r\n\r\n                            <button class=\"toggle-service\">View Details</button>\r\n\r\n                            <div class=\"service-details\">\r\n                                <p>\r\n                                    SR Transfers offers reliable airport taxi services with\r\n                                    competitive rates. Our customer-focused approach ensures\r\n                                    timely and comfortable transfers between the airport\r\n                                    and your destination. <a href=\"https://srilankatransfer.lk/\" target=\"_blank\">SR Transfers</a>\r\n                                </p>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Our Services section ends -->\r\n\r\n    <!-- Testimonials section starts -->\r\n    <section id=\"testimonials\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                    <h2 class=\"heading text-center\">What Our Customers Say</h2>\r\n                    <p class=\"supportive-text text-center\">Real feedback from our valued clients.</p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row justify-content-center\">\r\n                <div class=\"col-12\">\r\n                    <div id=\"testimonialCarousel\" class=\"carousel slide\" data-bs-ride=\"carousel\">\r\n                        <div class=\"carousel-inner\" id=\"testimonialContainer\"></div>\r\n\r\n                        <button class=\"carousel-control-prev\" type=\"button\"\r\n                            data-bs-target=\"#testimonialCarousel\" data-bs-slide=\"prev\">\r\n                            <span class=\"carousel-control-prev-icon\"></span>\r\n                        </button>\r\n\r\n                        <button class=\"carousel-control-next\" type=\"button\"\r\n                            data-bs-target=\"#testimonialCarousel\" data-bs-slide=\"next\">\r\n                            <span class=\"carousel-control-next-icon\"></span>\r\n                        </button>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <!-- View More Button -->\r\n            <div class=\"row\">\r\n                <div class=\"col text-center\">\r\n                    <a href=\"https://www.google.com/maps/place/Airport+Parking+Sri+Lanka/@7.1292859,79.8732382,17z/data=!4m8!3m7!1s0x3ae2f16b53527527:0xfa15e5c2744b0e7f!8m2!3d7.1292859!4d79.8758131!9m1!1b1!16s%2Fg%2F11j30yjgyb?entry=ttu&g_ep=EgoyMDI2MDEwNC4wIKXMDSoASAFQAw%3D%3D\" class=\"btn btn-outline-primary px-4\" target=\"_blank\" rel=\"noopener noreferrer\">\r\n                        View More Reviews\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Testimonials section ends -->\r\n\r\n    <script>\r\n        fetch(\'assets/data/testimonials.json\')\r\n            .then(response => response.json())\r\n            .then(data => {\r\n                const container = document.getElementById(\'testimonialContainer\');\r\n                const wordLimit = 20;\r\n\r\n                const limitWords = (text, limit) => {\r\n                    const words = text.split(\' \');\r\n                    return words.length > limit\r\n                        ? words.slice(0, limit).join(\' \') + \'...\'\r\n                        : text;\r\n                };\r\n\r\n                const firstFour = data.slice(0, 4);\r\n\r\n                let slideHTML = `\r\n                    <div class=\"carousel-item active\">\r\n                        <div class=\"row\">\r\n                `;\r\n\r\n                firstFour.forEach(item => {\r\n                    slideHTML += `\r\n                        <div class=\"col-12 col-md-6 col-lg-3 mb-4\">\r\n                            <div class=\"testimonial-card text-center p-4 h-100\">\r\n                                <p class=\"testimonial-text\">\r\n                                    \"${limitWords(item.text, wordLimit)}\"\r\n                                </p>\r\n                                <h5 class=\"testimonial-name mt-3\">- ${item.name}</h5>\r\n                                <p class=\"testimonial-role\">${item.role}</p>\r\n                            </div>\r\n                        </div>\r\n                    `;\r\n                });\r\n\r\n                slideHTML += `\r\n                        </div>\r\n                    </div>\r\n                `;\r\n\r\n                container.insertAdjacentHTML(\'beforeend\', slideHTML);\r\n            })\r\n            .catch(err => console.error(\'Error loading testimonials:\', err));\r\n    </script>\r\n\r\n    <script>\r\n        window.addEventListener(\'load\', () =>{\r\n            if(window.location.hash === \"#reserve-slots\") {\r\n                const section = document.getElementById(\"reserve-slots\");\r\n                if(section) section.scrollIntoView({ behavior: \"smooth\" });\r\n            }\r\n        });\r\n    </script>\r\n     \r\n    <script>\r\n        document.querySelectorAll(\'.toggle-service\').forEach(button => {\r\n            button.addEventListener(\'click\', () => {\r\n                const card = button.closest(\'.service-card\');\r\n                card.classList.toggle(\'active\');\r\n                button.textContent = card.classList.contains(\'active\')\r\n                    ? \'Hide Details\'\r\n                    : \'View Details\';\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const slots = Array.from(document.querySelectorAll(\'#reserve-slots .slot\'));\r\n            const modal = document.getElementById(\'booking-modal\');\r\n            const closeModal = modal.querySelector(\'.close\');\r\n            const bookingForm = document.getElementById(\'booking-form\');\r\n\r\n            const slotInput = document.getElementById(\'slot-number\');\r\n            const vehicleTypeInput = document.getElementById(\'vehicle-type\');\r\n            const hometownInput = document.getElementById(\'hometown\');\r\n\r\n            const startDateInput = document.getElementById(\'start-date\');\r\n            const endDateInput = document.getElementById(\'end-date\');\r\n\r\n            const totalDaysText = document.getElementById(\'total-days-text\');\r\n            const totalPriceText = document.getElementById(\'total-price-text\');\r\n\r\n            const extraServices = document.querySelectorAll(\'.extra-service\');\r\n\r\n            const PRICE_PER_DAY = 1000;\r\n\r\n            const now = new Date();\r\n            const tzOffset = now.getTimezoneOffset() * 60000; \r\n            const localISO = new Date(now - tzOffset).toISOString().slice(0,16); \r\n\r\n            startDateInput.min = localISO;\r\n            endDateInput.min = localISO;\r\n\r\n            function calculateTotal() {\r\n                if (!startDateInput.value || !endDateInput.value) {\r\n                    totalDaysText.textContent = \'0 days 0 hours\';\r\n                    totalPriceText.textContent = \'0.00\';\r\n                    return;\r\n                }\r\n\r\n                const start = new Date(startDateInput.value);\r\n                const end = new Date(endDateInput.value);\r\n\r\n                if (end <= start) {\r\n                    totalDaysText.textContent = \'0 days 0 hours\';\r\n                    totalPriceText.textContent = \'0.00\';\r\n                    return;\r\n                }\r\n\r\n                // Difference in milliseconds\r\n                const diffMs = end - start;\r\n\r\n                // Total hours\r\n                const totalHours = diffMs / (1000 * 60 * 60);\r\n\r\n                // Calculate full days and remaining hours\r\n                const fullDays = Math.floor(totalHours / 24);\r\n                const remainingHours = Math.round(totalHours % 24);\r\n\r\n                // Total days as float for pricing\r\n                const totalDaysFloat = totalHours / 24;\r\n\r\n                // Price: multiply by PRICE_PER_DAY proportionally\r\n                let total = totalDaysFloat * PRICE_PER_DAY;\r\n\r\n                // Add extra services\r\n                extraServices.forEach(service => {\r\n                    if (service.checked) {\r\n                        total += parseInt(service.value, 10);\r\n                    }\r\n                });\r\n\r\n                // Update display\r\n                totalDaysText.textContent = `${fullDays} day${fullDays !== 1 ? \'s\' : \'\'} ${remainingHours} hour${remainingHours !== 1 ? \'s\' : \'\'}`;\r\n                const roundedTotal = Math.round(total);\r\n                totalPriceText.textContent = `${roundedTotal.toLocaleString()}`;\r\n            }\r\n\r\n            startDateInput.addEventListener(\'change\', () => {\r\n                endDateInput.min = startDateInput.value;\r\n                calculateTotal();\r\n            });\r\n\r\n            endDateInput.addEventListener(\'change\', calculateTotal);\r\n\r\n            extraServices.forEach(service => {\r\n                service.addEventListener(\'change\', calculateTotal);\r\n            });\r\n\r\n            /* Slot click */\r\n            slots.forEach(slot => {\r\n                slot.addEventListener(\'click\', () => {\r\n                    if (slot.classList.contains(\'booked\') || slot.disabled) return;\r\n\r\n                    bookingForm.reset();\r\n                    slotInput.value = slot.dataset.slot;\r\n                    totalDaysText.textContent = \'0\';\r\n                    totalPriceText.textContent = \'0\';\r\n\r\n                    modal.style.display = \'block\';\r\n                });\r\n            });\r\n\r\n            /*  Close modal */\r\n            closeModal.addEventListener(\'click\', () => {\r\n                modal.style.display = \'none\';\r\n                bookingForm.reset();\r\n            });\r\n\r\n            window.addEventListener(\'click\', e => {\r\n                if (e.target === modal) {\r\n                modal.style.display = \'none\';\r\n                bookingForm.reset();\r\n                }\r\n            });\r\n\r\n            bookingForm.addEventListener(\'submit\', e => {\r\n                e.preventDefault();\r\n\r\n                const submitBtn = document.getElementById(\'submit-booking-btn\');\r\n                submitBtn.disabled = true;\r\n                submitBtn.textContent = \'Reserving...\';\r\n\r\n                // Calculate exact total hours for fractional days\r\n                const start = new Date(startDateInput.value);\r\n                const end = new Date(endDateInput.value);\r\n                const totalHours = (end - start) / (1000 * 60 * 60); // total hours\r\n                const totalDaysFloat = totalHours / 24;\r\n\r\n                // Calculate total price including extra services\r\n                let totalPrice = totalDaysFloat * PRICE_PER_DAY;\r\n                extraServices.forEach(service => {\r\n                    if (service.checked) totalPrice += parseInt(service.value, 10);\r\n                });\r\n\r\n                const payload = {\r\n                    slot: slotInput.value,\r\n                    vehicleType: document.getElementById(\'vehicle-type\').value,\r\n                    hometown: document.getElementById(\'hometown\').value,\r\n                    startDate: startDateInput.value,\r\n                    endDate: endDateInput.value,\r\n                    days: totalDaysFloat.toFixed(2),      \r\n                    pricePerDay: PRICE_PER_DAY,\r\n                    totalPrice: Math.round(totalPrice),\r\n                    extras: Array.from(document.querySelectorAll(\'.extra-service:checked\'))\r\n                        .map(e => e.dataset.name),\r\n                    flightNumber: document.getElementById(\'flight-number\').value,\r\n                    vehicleNumber: document.getElementById(\'vehicle_number\').value,\r\n                    whatsapp: document.getElementById(\'whatsapp-number\').value,\r\n                    passenger_count: document.getElementById(\'passenger_count\').value,\r\n                    name: document.getElementById(\'user-name\').value,\r\n                    email: document.getElementById(\'user-email\').value\r\n                };\r\n\r\n                const formData = new FormData();\r\n\r\n                Object.keys(payload).forEach(key => {\r\n                    if (Array.isArray(payload[key])) {\r\n                        payload[key].forEach(val => formData.append(`${key}[]`, val));\r\n                    } else {\r\n                        formData.append(key, payload[key]);\r\n                    }\r\n                });\r\n\r\n                // Append images\r\n                formData.append(\'air_ticket_image_url\', document.getElementById(\'air_ticket_image_url\').files[0]);\r\n                formData.append(\'passport_copy_image_url\', document.getElementById(\'passport_copy_image_url\').files[0]);\r\n                console.log(\'========== BOOKING DEBUG ==========\');\r\n                console.log(\'slotInput.value:\', slotInput.value);\r\n                console.log(\'vehicleType:\', payload.vehicleType);\r\n                console.log(\'startDate:\', payload.startDate);\r\n                console.log(\'endDate:\', payload.endDate);\r\n\r\n                console.log(\'---- Payload Object ----\');\r\n                console.log(payload);\r\n\r\n                console.log(\'---- FormData Contents ----\');\r\n                for (const [key, value] of formData.entries()) {\r\n                    console.log(key, value);\r\n                }\r\n                console.log(\'===================================\');\r\n\r\n                                fetch(\'assets/includes/save-booking.php\', {\r\n                                    method: \'POST\',\r\n                                    body: formData\r\n                                })\r\n                .then(res => res.text())\r\n                .then(t => { console.log(\"RAW RESPONSE:\", t); return JSON.parse(t); })\r\n                                .then(response => {\r\n                                    if (!response.success) {\r\n                                        submitBtn.disabled = false;\r\n                                        submitBtn.textContent = \'Book Slot\';\r\n\r\n                                        Swal.fire({\r\n                                            icon: \'error\',\r\n                                            title: \'Booking Failed\',\r\n                                            //text: response.message || \'Unknown error\',\r\n                text: response.detail || response.error || \'Unknown error\'\r\n\r\n                        });\r\n                        return;\r\n                    }\r\n\r\n                    Swal.fire({\r\n                        icon: \'success\',\r\n                        title: \'Booking Successful\',\r\n                        html: `\r\n                            Slot <strong>${payload.slot}</strong> reserved.<br>\r\n                            Reference: <strong>${response.reference}</strong>\r\n                        `\r\n                    }).then(() => {\r\n                        window.open(response.pdf_url, \'_blank\', \'noopener,noreferrer\');\r\n                        setTimeout(() => window.location.reload(), 1000);\r\n                    });\r\n\r\n                    const slotElement = slots.find(s => s.dataset.slot === payload.slot);\r\n                    if (slotElement) slotElement.classList.add(\'booked\');\r\n\r\n                    modal.style.display = \'none\';\r\n                    bookingForm.reset();\r\n                })\r\n                .catch(error => {\r\n                    submitBtn.disabled = false;\r\n                    submitBtn.textContent = \'Book Slot\';\r\n\r\n                    Swal.fire({\r\n                        icon: \'error\',\r\n                        title: \'Server Error\',\r\n                        text: error.message,\r\n                    });\r\n                    console.error(error);\r\n                });\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const outerSlots = Array.from(document.querySelectorAll(\'#reserve-slots .outer-slot\'));\r\n            const startInput = document.getElementById(\'initial-start-date\');\r\n            const endInput = document.getElementById(\'initial-end-date\');\r\n            const checkBtn = document.getElementById(\'check-availability\');\r\n            const clearBtn = document.getElementById(\'clear-dates\');\r\n            const banner = document.querySelector(\'.all-booked-banner\');\r\n            let lastStart = \'\';\r\n            let lastEnd = \'\';\r\n\r\n            function shuffle(array) {\r\n                const arr = [...array];\r\n                for (let i = arr.length - 1; i > 0; i--) {\r\n                    const j = Math.floor(Math.random() * (i + 1));\r\n                    [arr[i], arr[j]] = [arr[j], arr[i]];\r\n                }\r\n                return arr;\r\n            }\r\n\r\n            function resetOuterSlots() {\r\n                outerSlots.forEach(slot => {\r\n                    slot.classList.remove(\'booked\', \'selected\');\r\n                    slot.disabled = true;\r\n                });\r\n            }\r\n\r\n            function showRandomOuterAvailability() {\r\n                resetOuterSlots();\r\n\r\n                const shuffledSlots = shuffle(outerSlots);\r\n\r\n                const bookedCount = 7;\r\n\r\n                const bookedSlots = shuffledSlots.slice(0, bookedCount);\r\n                const availableSlot = shuffledSlots[bookedCount];\r\n\r\n                bookedSlots.forEach(slot => {\r\n                    slot.classList.add(\'booked\');\r\n                    slot.disabled = true;\r\n                });\r\n\r\n                if (availableSlot) {\r\n                    availableSlot.classList.remove(\'booked\');\r\n                    availableSlot.disabled = false;\r\n                }\r\n            }\r\n\r\n            resetOuterSlots();\r\n\r\n            clearBtn.addEventListener(\'click\', () => {\r\n                startInput.value = \'\';\r\n                endInput.value = \'\';\r\n                lastStart = \'\';\r\n                lastEnd = \'\';\r\n\r\n                resetOuterSlots();\r\n\r\n                banner.classList.add(\'d-none\');\r\n            });\r\n\r\n            checkBtn.addEventListener(\'click\', () => {\r\n                const start = startInput.value;\r\n                const end = endInput.value;\r\n\r\n                if (!start || !end) {\r\n                    alert(\'Please select both start and end dates.\');\r\n                    return;\r\n                }\r\n\r\n                if (end < start) {\r\n                    alert(\'End date must be after start date.\');\r\n                    return;\r\n                }\r\n\r\n                if (start !== lastStart || end !== lastEnd) {\r\n                    lastStart = start;\r\n                    lastEnd = end;\r\n\r\n                    showRandomOuterAvailability();\r\n\r\n                    banner.classList.remove(\'d-none\');\r\n                }\r\n            });\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        const heroSwiper = new Swiper(\".homeHeroSwiper\", {\r\n            loop: true,\r\n            autoplay: {\r\n                delay: 3500,\r\n                disableOnInteraction: false,\r\n            },\r\n            speed: 800,\r\n            effect: \"fade\",\r\n            fadeEffect: {\r\n                crossFade: true\r\n            }\r\n        });\r\n    </script>\r\n\r\n    <script>\r\n        document.addEventListener(\'DOMContentLoaded\', () => {\r\n            const start = document.getElementById(\'initial-start-date\');\r\n            const end = document.getElementById(\'initial-end-date\');\r\n\r\n            const today = new Date().toISOString().split(\'T\')[0]; // YYYY-MM-DD\r\n\r\n            start.min = end.min = today;\r\n\r\n            start.addEventListener(\'change\', () => {\r\n                end.min = start.value || today;\r\n            });\r\n        });\r\n    </script>\r\n</body>', 1, 2, 0, 1, 1, 1, 1766399981, 1, 1777014671, 0, 0, 0, 0, 0, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1);
INSERT INTO `modx_site_content` (`id`, `type`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible`) VALUES
(2, 'document', 'About', '', '', 'about', '', 1, 0, 0, 0, 0, '', '<body id = \"aboutPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/about-hero.jpg\" alt=\"Airport Parking - About Us\">\r\n        <div class=\"hero-content\">\r\n            <h1>About Us</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- About Us section starts -->\r\n    <section id=\"about-us\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row justify-content-center align-items-center\">\r\n                <div class=\"col-12 col-md-6\">\r\n                    <p><b><a href=\"https://www.airportparking.lk/\">Airportparking.lk</a></b> is the first and leading airport parking facility provider in Sri Lanka and a proud member of Explore Holdings. Through our parking service, you can enjoy the safest parking facility at the most affordable rates. Our parking facility is located close to the International Airport of Sri Lanka, allowing clients to enjoy stress-free parking and quickly reach the airport.</p>\r\n                    <p>Our 24/7 support service aims to satisfy our clients by providing a high-quality and secure parking experience.<br>\r\n                    Additionally, we are proud to introduce explore.vacations, another member of the Explore Holdings family, which allows you to easily search and book accommodations and travel experiences throughout Sri Lanka.</p>\r\n                    <p class=\"mb-lg-0\">As a foreigner or local client, you can take advantage of our airport pickup and drop-off services, ensuring a smooth and convenient travel experience.</p>\r\n                </div>\r\n                <div class=\"col-12 col-md-6\">\r\n                    <img src=\"assets/images/about-us.jpg\" alt=\"About Airport Parking Sri Lanka\" class=\"img-fluid\">\r\n                </div>\r\n            </div>\r\n            <div class=\"row about-details\">\r\n                <div class=\"col-12 d-flex justify-content-center\">\r\n                    <p>Park with us and enjoy a stress-free start to your journey. Our secure parking and convenient shuttle services <br> ensure your trip begins comfortably and worry-free!!</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- About Us section ends -->\r\n\r\n    <!-- Vision & Mission section starts -->\r\n    <section id=\"vission-mission\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row mb-4\">\r\n                <div class=\"col-12 text-center\">\r\n                    <h2 class=\"heading\">Our Vision & Mission</h2>\r\n                    <p class=\"supportive-text text-center\">Committed to Excellence in Airport Parking and Travel Services</p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row justify-content-center g-4\">\r\n                <!-- Vision Card -->\r\n                <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <div class=\"flip-card\">\r\n                    <div class=\"flip-card-inner\">\r\n                        <div class=\"flip-card-front text-center p-4\">\r\n                        <h3>Our Vision</h3>\r\n                        <p>See what drives us forward</p>\r\n                        </div>\r\n                        <div class=\"flip-card-back text-center p-4\">\r\n                        <p>\r\n                            To be Sri Lanka\'s leading provider of secure, convenient, and customer-friendly airport parking and travel services, delivering excellence and peace of mind to every traveler.\r\n                        </p>\r\n                        </div>\r\n                    </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!-- Mission Card -->\r\n                <div class=\"col-12 col-md-6 col-lg-4\">\r\n                    <div class=\"flip-card\">\r\n                    <div class=\"flip-card-inner\">\r\n                        <div class=\"flip-card-front text-center p-4\">\r\n                        <h3>Our Mission</h3>\r\n                        <p>See how we achieve our vision</p>\r\n                        </div>\r\n                        <div class=\"flip-card-back text-center p-4\">\r\n                        <p>\r\n                            To provide secure parking, seamless airport transfers, and premium travel solutions while maintaining the highest standards of reliability, efficiency, and customer satisfaction.\r\n                        </p>\r\n                        </div>\r\n                    </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Vision & Mission section ends -->\r\n\r\n    <!-- Reserve Slot section starts -->\r\n    <section id=\"reserve-slots\" class=\"py-5 text-center\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-12\">\r\n                    <h2 class=\"heading mb-3\">Reserve Your Parking Slot Now</h2>\r\n                    <p class=\"supportive-text mb-4 text-center\">\r\n                        Secure your vehicle in advance and enjoy a hassle-free start to your journey.\r\n                    </p>\r\n                    <a href=\"[[~1]]#reserve-slots\" class=\"btn btn-primary btn-lg\">\r\n                        Reserve Slot\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Reserve Slot section ends -->\r\n</body>', 1, 2, 1, 1, 1, 1, 1766556946, 1, 1776426075, 0, 0, 0, 1766557020, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(3, 'document', 'Contact', '', '', 'contact', '', 1, 0, 0, 0, 0, '', '\r\n<body id=\"contactPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/contact-hero.jpg\" alt=\"Airport Parking - Contact Us\">\r\n        <div class=\"hero-content\">\r\n            <h1>Contact Us</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- Contact us starts -->\r\n    <section id=\"contactContent\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-12\">\r\n                    <h2 class=\"heading\" data-aos=\"fade-down\">Get in touch with us</p>\r\n                </div>\r\n            </div>\r\n            <div class=\"row\">\r\n                <p class=\"justify-text mb-0\">Have questions about our airport parking services? We’re happy to help. Contact us to reserve your slot or get personalized assistance, and let our friendly team ensure a smooth, stress-free start to your journey...</p>\r\n                <div class=\"img-container col-12 col-lg-5 order-lg-2\" data-aos=\"fade-left\">\r\n                    <img src=\"assets/images/contact-form-img.png\" alt=\"Airport Parking - contact image\" class= \"img-fluid\">\r\n                </div>\r\n                <div class=\"col-12 col-lg-7 pt-3\">\r\n                    <form action=\"[[~3]]\" method=\"POST\" data-aos=\"fade-right\">\r\n                        [[!ContactUs]]\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Contact us ends -->\r\n\r\n    <div style=\"margin-bottom: -22px;\">\r\n        <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d69704.75036294853!2d79.83616751972946!3d7.107632678455203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2f16b53527527%3A0xfa15e5c2744b0e7f!2sAirport%20Parking%20Sri%20Lanka!5e0!3m2!1sen!2slk!4v1766638738533!5m2!1sen!2slk\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\r\n    </div>\r\n</body>', 1, 2, 2, 1, 1, 1, 1766637991, 1, 1766639436, 0, 0, 0, 1766637960, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(4, 'document', 'FAQ', '', '', 'faq', '', 1, 0, 0, 0, 0, '', '<body id=\"faqPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/faq-hero.jpg\" alt=\"Airport Parking - FAQ\">\r\n        <div class=\"hero-content\">\r\n            <h1>FAQ</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- FAQ section starts -->\r\n    <section id=\"faq\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div class=\"row mb-4\">\r\n                <div class=\"col text-center\">\r\n                    <h2 class=\"heading text-center\">Frequently Asked Questions</h2>\r\n                    <p class=\"supportive-text text-center\">\r\n                        Find answers to common questions about our airport parking services\r\n                    </p>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"row\">\r\n                <div class=\"col-12 col-md-6\">\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I send different driver to collect the vehicle?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                <b>NO </b>. We recommend you to come and collect the vehicle all the times due to security reasons.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Do we need to sign an agreement\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, you have to fill some details for the vehicle before you leave, we recommend you to be their 15 Mts before your departure\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                           Can I get my vehicle cleaned when I return?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes of course we can do the clean-up on the day of your arrival with an additional charge.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            What would be the daily parking price?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                You can check the price online.  Just enter your departure date & time and your arrival date & time. Then you\'ll get the exact amount which you need to pay.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            How can I book a parking lot?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Reserve your parking slot via the Reserve Slot section on our main page or WhatsApp us your vehicle number and booking time at <b>+94 76 1414 557</b>                     \r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n                <div class=\"col-12 col-md-6\">\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I send the details in advance and what are the details\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, if you can send the following details by email, so you don’t need to wait longer filling the documents \r\n                                <ul class=\"list-unstyled\">\r\n                                    <li>i. Vehicle Book copy</li>\r\n                                    <li>ii. Owners National Identification Card (NIC) and the Owners Driving License Copy</li>\r\n                                    <li>iii. Residence Prof document for the owner of the vehicle</li>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Safety of the Vehicle\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                You will get a GPS tracking when you park the vehicle and any part of the world you can simply log in and check your vehicle\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                           How can I make the payments?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                We have 2 payment methods for you.\r\n                                <ul>\r\n                                    <li>Do a bank transfer and send us the slip by Viber / WhatsApp.</li>\r\n                                    <li>You can pay on the spot when you park the vehicle</li>\r\n                                </ul>\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"faq-item\">\r\n                        <button class=\"faq-question\">\r\n                            Can I book online?\r\n                            <span class=\"faq-icon\">+</span>\r\n                        </button>\r\n                        <div class=\"faq-answer\">\r\n                            <p>\r\n                                Yes, you can book online! Just use the <strong>Reserve Slot</strong> section\r\n                                on the main page and submit your details to reserve your parking slot in advance.\r\n                            </p>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- FAQ section ends -->\r\n\r\n    <script>\r\n        document.querySelectorAll(\'.faq-question\').forEach(button => {\r\n            button.addEventListener(\'click\', () => {\r\n                const item = button.closest(\'.faq-item\');\r\n                document.querySelectorAll(\'.faq-item\').forEach(i => {\r\n                    if (i !== item) i.classList.remove(\'active\');\r\n                });\r\n\r\n                item.classList.toggle(\'active\');\r\n            });\r\n        });\r\n    </script>\r\n</body>', 1, 2, 3, 1, 1, 1, 1766639462, 1, 1776426213, 0, 0, 0, 1766639460, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(5, 'document', 'Gallery', '', '', 'gallery', '', 1, 0, 0, 0, 0, '', '<body id=\"galleryPage\">\r\n    <!-- Hero starts -->\r\n    <section id=\"hero\">\r\n        <img src=\"assets/images/gallery-hero.jpg\" alt=\"Airport Parking - Gallery\">\r\n        <div class=\"hero-content\">\r\n            <h1>Gallery</h1>\r\n        </div>\r\n    </section>\r\n    <!-- Hero ends -->\r\n\r\n    <!-- Gallery content starts-->\r\n    <section id=\"galleryContent\" class=\"py-5\">\r\n        <div class=\"container\">\r\n            <div id=\"image-gallery\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-1.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-1.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 1\" />\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-2.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-2.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 2\" />\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-3.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-3.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 3\" />\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n                <div class=\"row\">\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-4.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-4.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 4\" />\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-5.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-5.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 5\" />\r\n                        </a>\r\n                    </div>\r\n                    <div class=\"col-12 col-md-4\">\r\n                        <a class=\"lg-item\" data-src=\"assets/images/gallery/gal-img-6.webp\">\r\n                            <img src=\"assets/images/gallery/gal-img-6.webp\" class=\"w-100 mb-4\" alt=\"Airport Parking - Gallery Image 6\" />\r\n                        </a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </section>\r\n    <!-- Gallery content starts-->\r\n    <script>\r\n        // Js for gallery page\r\n        const container = document.querySelector(\'#image-gallery\');\r\n        window.lightGallery(container, {\r\n            selector: \'.lg-item\',\r\n            zoomFromOrigin: true,\r\n            download: false,\r\n            thumbnail: true,\r\n            closeButton: true,\r\n        });\r\n    </script>\r\n\r\n</body>', 1, 2, 4, 1, 1, 1, 1766642116, 1, 1766643103, 0, 0, 0, 1766642100, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(6, 'document', 'My Account', '', '', 'my-account', '', 1, 0, 0, 0, 0, '', '[[!WebsiteCustomerAuth]]\r\n\r\n\r\n<style>\r\n    * {\r\n        box-sizing: border-box;\r\n    }\r\n\r\n    body {\r\n        margin: 0;\r\n        font-family: Cambria, Cochin, Georgia, Times, \'Times New Roman\', serif;\r\n        position: relative;\r\n        overflow-x: hidden;\r\n        background-color: #5b565652;\r\n    }\r\n\r\n.active::after {\r\n    content: \"\";\r\n    display: block;\r\n    border-bottom: 2px solid #f7f7f700 !important;\r\n}\r\n\r\n    .account-page {\r\n        position: relative;\r\n        z-index: 1;\r\n        max-width: 1150px;\r\n        margin: 0 auto;\r\n        padding: 70px 20px;\r\n    }\r\n\r\n    .page-title {\r\n        text-align: center;\r\n        color: #fff;\r\n        margin-bottom: 30px;\r\n    }\r\n    \r\n    .form-message {\r\n    background: #e8f4ff;\r\n    border-left: 4px solid #003272;\r\n    color: #003272;\r\n    padding: 10px;\r\n    margin-bottom: 12px;\r\n    font-size: 14px;\r\n}\r\n\r\n.booking-note {\r\n    background: #fff8e5;\r\n    border-left: 4px solid #f0ad00;\r\n    padding: 10px;\r\n    margin-bottom: 12px;\r\n    font-size: 14px;\r\n}\r\n\r\n\r\n    .account-card {\r\n        background: #f4f4f4;\r\n        border-radius: 0;\r\n        padding: 30px;\r\n        box-shadow: 0 8px 24px rgba(0,0,0,0.08);\r\n    }\r\n\r\n    .account-tabs {\r\n        display: flex;\r\n        justify-content: center;\r\n        gap: 14px;\r\n        margin-bottom: 30px;\r\n        flex-wrap: wrap;\r\n    }\r\n\r\n    .tab-btn {\r\n        border: 1px solid #49b4d3;\r\n        background: #fff;\r\n        color: #1f2a7c;\r\n        padding: 12px 26px;\r\n        border-radius: 8px;\r\n        font-weight: 700;\r\n        cursor: pointer;\r\n        transition: 0.2s ease;\r\n        min-width: 130px;\r\n    }\r\n\r\n    .tab-btn.active {\r\n        background: #003272;\r\n        color: #fff;\r\n    }\r\n\r\n    .tab-panel {\r\n        display: none;\r\n    }\r\n\r\n    .tab-panel.active {\r\n        display: block;\r\n    }\r\n\r\n    .panel-grid {\r\n        display: grid;\r\n        grid-template-columns: 1fr 1fr;\r\n        gap: 40px;\r\n        align-items: center;\r\n        min-height: 500px;\r\n    }\r\n\r\n    .left-side {\r\n        text-align: center;\r\n        padding: 20px;\r\n    }\r\n\r\n    .left-side img {\r\n        max-width: 100%;\r\n        width: 380px;\r\n        height: auto;\r\n    }\r\n\r\n    .left-side .left-note {\r\n        margin-top: 30px;\r\n        font-size: 14px;\r\n        color: #5b5b8a;\r\n    }\r\n\r\n    .right-side {\r\n        max-width: 470px;\r\n        width: 100%;\r\n    }\r\n\r\n    .form-title {\r\n        color: #1f2a7c;\r\n        font-size: 28px;\r\n        font-weight: 700;\r\n    }\r\n\r\n    .form-subtitle {\r\n        color: #7b7ba8;\r\n        font-size: 15px;\r\n        margin-bottom: 18px;\r\n    }\r\n\r\n    .form-group {\r\n        margin-bottom: 16px;\r\n    }\r\n\r\n    .input-wrap {\r\n        position: relative;\r\n    }\r\n\r\n    .input-wrap input {\r\n        width: 100%;\r\n        height: 56px;\r\n        border: 1.5px solid #67bfd8;\r\n        border-radius: 2px;\r\n        padding: 0 16px 0 46px;\r\n        background: #fff;\r\n        font-size: 16px;\r\n        color: #555;\r\n        outline: none;\r\n    }\r\n\r\n    .input-wrap input:focus {\r\n        border-color: #1f2a7c;\r\n    }\r\n\r\n    .input-icon {\r\n        position: absolute;\r\n        left: 15px;\r\n        top: 50%;\r\n        transform: translateY(-50%);\r\n        color: #67bfd8;\r\n        font-size: 16px;\r\n        font-weight: bold;\r\n    }\r\n\r\n    .form-row {\r\n        display: flex;\r\n        justify-content: space-between;\r\n        align-items: center;\r\n        gap: 15px;\r\n        flex-wrap: wrap;\r\n        margin: 8px 0 24px;\r\n    }\r\n\r\n    .remember-me {\r\n        display: flex;\r\n        align-items: center;\r\n        gap: 8px;\r\n        color: #5b5b8a;\r\n        font-size: 14px;\r\n    }\r\n\r\n    .remember-me input {\r\n        width: 16px;\r\n        height: 16px;\r\n        accent-color: #49b4d3;\r\n    }\r\n\r\n    .form-link {\r\n        color: #5b5b8a;\r\n        text-decoration: none;\r\n        font-size: 14px;\r\n    }\r\n\r\n    .form-link:hover {\r\n        text-decoration: underline;\r\n    }\r\n\r\n    .btn-primary {\r\n        width: 145px;\r\n        height: 52px;\r\n        border: none;\r\n        background: #003272;\r\n        color: #fff;\r\n        font-size: 20px;\r\n        font-weight: 700;\r\n        border-radius: 3px;\r\n        cursor: pointer;\r\n        display: block;\r\n        margin: 0 auto 0;\r\n        transition: 0.2s ease;\r\n    }\r\n\r\n    .btn-primary:hover {\r\n        background: #329fbe;\r\n    }\r\n\r\n    .bottom-text {\r\n        text-align: center;\r\n        color: #5b5b8a;\r\n        font-size: 15px;\r\n    }\r\n\r\n    .bottom-text a {\r\n        color: #39419c;\r\n        text-decoration: none;\r\n        font-weight: 500;\r\n    }\r\n\r\n    .bottom-text a:hover {\r\n        text-decoration: underline;\r\n    }\r\n\r\n    .bottom-bar {\r\n        display: flex;\r\n        justify-content: space-between;\r\n        align-items: center;\r\n        margin-top: 30px;\r\n        color: #5b5b8a;\r\n        font-size: 14px;\r\n        flex-wrap: wrap;\r\n        gap: 12px;\r\n    }\r\n\r\n    .bottom-bar a {\r\n        color: #5b5b8a;\r\n        text-decoration: none;\r\n        margin-left: 10px;\r\n    }\r\n\r\n    .bottom-bar a:hover {\r\n        text-decoration: underline;\r\n    }\r\n\r\n    @media (max-width: 900px) {\r\n        .panel-grid {\r\n            grid-template-columns: 1fr;\r\n            min-height: auto;\r\n        }\r\n\r\n        .right-side {\r\n            max-width: 100%;\r\n        }\r\n\r\n        .left-side img {\r\n            width: 280px;\r\n        }\r\n\r\n        .page-title h1 {\r\n            font-size: 32px;\r\n        }\r\n    }\r\n\r\n    @media (max-width: 600px) {\r\n        .account-card {\r\n            padding: 25px 20px 20px;\r\n        }\r\n\r\n        .form-title {\r\n            font-size: 24px;\r\n        }\r\n\r\n        .btn-primary {\r\n            width: 100%;\r\n        }\r\n\r\n        .bottom-bar {\r\n            flex-direction: column;\r\n            align-items: flex-start;\r\n        }\r\n    }\r\n</style>\r\n\r\n<div class=\"account-page\">\r\n    <div class=\"page-title\">\r\n\r\n    </div>\r\n\r\n    <div class=\"account-card\">\r\n\r\n        <div class=\"account-tabs\">\r\n            <button class=\"tab-btn active\" data-tab=\"loginTab\">Login</button>\r\n            <button class=\"tab-btn\" data-tab=\"registerTab\">Register</button>\r\n        </div>\r\n\r\n        <!-- LOGIN -->\r\n        <div class=\"tab-panel active\" id=\"loginTab\">\r\n            <div class=\"panel-grid\">\r\n                <div class=\"left-side\">\r\n                    <img src=\"assets/images/login-illustration.png\" alt=\"Login Illustration\">\r\n                </div>\r\n\r\n                <div class=\"right-side\">\r\n                    <div class=\"form-title\">Welcome Back!</div>\r\n                    <div class=\"form-subtitle\">Login to continue</div>\r\n\r\n                    <form method=\"post\" action=\"\">\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">👤</span>\r\n                                <input type=\"email\" name=\"login_email\" value=\"[[+prefillEmail]]\" placeholder=\"Enter your email\" required>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">🔒</span>\r\n                                <input type=\"password\" name=\"login_password\" placeholder=\"Enter your password\" required>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-row\">\r\n                            <label class=\"remember-me\">\r\n                                <input type=\"checkbox\" name=\"remember_me\">\r\n                                Remember Me\r\n                            </label>\r\n\r\n                            <a href=\"[[~10]]\" class=\"form-link\">Forgot password?</a>\r\n                        </div>\r\n\r\n                        <?php if (!empty($loginMessage)): ?>\r\n    <div class=\"form-message\" id=\"loginMessageBox\" style=\"display:none;\">[[+loginMessage]]</div>\r\n<?php endif; ?>\r\n\r\n                        <button type=\"submit\" name=\"login_submit\" class=\"btn-primary\">Sign In</button>\r\n\r\n                        <div class=\"bottom-text\">\r\n                            New User? <a href=\"#\" class=\"switch-tab\" data-target=\"registerTab\">Sign Up</a>\r\n                        </div>\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <!-- REGISTER -->\r\n        <div class=\"tab-panel\" id=\"registerTab\">\r\n            <div class=\"panel-grid\">\r\n                <div class=\"left-side\">\r\n                    <img src=\"assets/images/login-illustration.png\" alt=\"Register Illustration\">\r\n                    <div class=\"left-note\">Create your account and get started</div>\r\n                </div>\r\n\r\n                <div class=\"right-side\">\r\n                    <div class=\"form-title\">Create Account</div>\r\n                    <div class=\"form-subtitle\">Register to continue</div>\r\n\r\n                    <?php if (!empty($registerMessage)): ?>\r\n   <div class=\"form-message\" id=\"registerMessageBox\" style=\"display:none;\">[[+registerMessage]]</div>\r\n<?php endif; ?>\r\n\r\n<div class=\"booking-note\">\r\n    Please register with the same email and phone number you used when making bookings with us.\r\n</div>\r\n\r\n                    <form method=\"post\" action=\"\">\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">👤</span>\r\n                                <input type=\"text\" name=\"register_name\" placeholder=\"Full name\" required>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">✉</span>\r\n                                <input type=\"email\" name=\"register_email\" placeholder=\"Email address\" required>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">📞</span>\r\n                                <input type=\"text\" name=\"register_phone\" placeholder=\"Phone number\">\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">🔒</span>\r\n                                <input type=\"password\" name=\"register_password\" placeholder=\"Password\" required>\r\n                            </div>\r\n                        </div>\r\n\r\n                        <div class=\"form-group\">\r\n                            <div class=\"input-wrap\">\r\n                                <span class=\"input-icon\">🔒</span>\r\n                                <input type=\"password\" name=\"register_confirm_password\" placeholder=\"Confirm password\" required>\r\n                            </div>\r\n                        </div>\r\n<button type=\"submit\" name=\"register_submit\" class=\"btn-primary\">Sign Up</button>\r\n\r\n\r\n                        <div class=\"bottom-text\">\r\n                            Already have an account? <a href=\"#\" class=\"switch-tab\" data-target=\"loginTab\">Login</a>\r\n                        </div>\r\n                    </form>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n        <div class=\"bottom-bar\">\r\n            <div>Designed and Developed by Explore Vacations. © <span id=\"currentYear\"></span></div>\r\n         \r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<script>\r\n    const tabs = document.querySelectorAll(\'.tab-btn\');\r\n    const panels = document.querySelectorAll(\'.tab-panel\');\r\n\r\n    function openTab(tabId) {\r\n        tabs.forEach(btn => btn.classList.remove(\'active\'));\r\n        panels.forEach(panel => panel.classList.remove(\'active\'));\r\n\r\n        document.querySelector(`.tab-btn[data-tab=\"${tabId}\"]`)?.classList.add(\'active\');\r\n        document.getElementById(tabId)?.classList.add(\'active\');f\r\n    }\r\n\r\n    tabs.forEach(button => {\r\n        button.addEventListener(\'click\', function () {\r\n            openTab(this.dataset.tab);\r\n        });\r\n    });\r\n\r\n    document.querySelectorAll(\'.switch-tab\').forEach(link => {\r\n        link.addEventListener(\'click\', function (e) {\r\n            e.preventDefault();\r\n            openTab(this.dataset.target);\r\n        });\r\n    });\r\n\r\n    document.getElementById(\'currentYear\').textContent = new Date().getFullYear();\r\n</script>', 1, 2, 5, 1, 1, 1, 1776947685, 1, 1777014359, 0, 0, 0, 1776947640, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(7, 'document', 'Dashboard', '', '', 'dashboard', '', 1, 0, 0, 0, 0, '', '[[!Dashboard]]', 1, 0, 6, 1, 1, 1, 1777003588, 1, 1777003952, 0, 0, 0, 1777003620, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(8, 'document', 'Bookings', '', '', 'bookings', '', 1, 0, 0, 0, 0, '', '[[!CustomerBookings]]', 1, 0, 7, 1, 1, 1, 1777004736, 1, 1777005167, 0, 0, 0, 1777004700, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(9, 'document', 'Profile', '', '', 'profile', '', 1, 0, 0, 0, 0, '', '[[!CustomerProfile]]', 1, 0, 8, 1, 1, 1, 1777012030, 1, 1777012062, 0, 0, 0, 1777012062, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(10, 'document', 'Forgot Password', '', '', 'forgot-password', '', 1, 0, 0, 0, 0, '', '<form method=\"post\">\r\n    <input type=\"email\" name=\"email\" placeholder=\"Enter your email\" required>\r\n    <button type=\"submit\" name=\"forgot_submit\">Reset Password</button>\r\n</form>\r\n\r\n<div>[[+forgotMessage]]</div>', 1, 0, 9, 1, 1, 1, 1777014064, 1, 1777014088, 0, 0, 0, 1777014060, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1),
(11, 'document', 'reset-password', '', '', 'reset-password', '', 1, 0, 0, 0, 0, '', '<form method=\"post\">\r\n    <input type=\"password\" name=\"new_password\" placeholder=\"New password\" required>\r\n    <button type=\"submit\" name=\"reset_submit\">Update Password</button>\r\n</form>\r\n\r\n<div>[[+resetMessage]]</div>', 1, 0, 10, 1, 1, 1, 1777014127, 1, 1777014132, 0, 0, 0, 1777014132, 1, '', 0, 0, 'MODX\\Revolution\\modDocument', 'web', 1, '', 0, 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_htmlsnippets`
--

CREATE TABLE `modx_site_htmlsnippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `static`, `static_file`) VALUES
(1, 1, 0, 'footer', '', 0, 0, 0, '<footer>\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-12 col-lg-4 col order-lg-1 \">\n                <h6 class=\"footer-logo m-0\"><img src=\"assets/images/footer-logo.png\" alt=\"Airport Parking | Logo\"></h6>\n                <p class=\"my-3 my-lg-4\">Start your journey stress-free,<br>with secure and easy parking.\n                </p>\n                <ul class=\"list-unstyled d-flex\" id=\"footer-social-list\">\n                    <li class=\"me-2\">\n                        <a href=\"https://www.facebook.com/airportparkinglk\" target=\"_blank\" alt=\"facebook\">\n                            <i class=\"fa-brands fa-facebook-f\"></i>\n                        </a>\n                    </li>\n                    <li class=\"mx-2\">\n                        <a href=\"https://www.instagram.com/airportparking.lk/\" target=\"_blank\" alt=\"instragram\">\n                            <i class=\"fa-brands fa-instagram\"></i>\n                        </a>\n                    </li>\n                    <li class=\"ms-2\">\n                        <a href=\"https://wa.me/94761414557\" target=\"_blank\" alt=\"whatsapp\">\n                            <i class=\"fa-brands fa-whatsapp\"></i>\n                        </a>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"col-12 col-md-6 col-lg-4 order-lg-2\">\n                <h2 class=\"my-4 mt-lg-0\">Links</h2>\n                <ul class=\"list-unstyled\" id=\"footer-nav-link-list\">\n                    <li>\n                        <a href=\"./\">Home</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~2]]\">About</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~4]]\">FAQ</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~5]]\">Gallery</a>\n                    </li>\n                    <li>\n                        <a href=\"[[~3]]\">Contact</a>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"col-12 col-md-6 col-lg-4 order-lg-4\">\n                <h2 class=\"my-4 mt-lg-0\">Contact</h2>\n                <ul class=\"list-unstyled\" id=\"footer-contact-list\">\n                   <li>\n                        <img src=\"assets/images/icons/footer-phone.svg\" \n                            alt=\"Airport Parking | Footer Contact Icon\" \n                            class=\"me-1\">\n\n                        <a href=\"tel:+94761414557\">+94 76 141 4557</a>\n                    </li>\n                    <li class=\"d-flex align-items-center\">\n                        <img src=\"assets/images/icons/footer-email.svg\" alt=\"Airport Parking | Footer Contact Icon\" class=\"me-1\">\n                        <div class=\"d-inline-block\">\n                            <a href=\"mailto:info@airportparking.lk\">info@airportparking.lk</a> \n                        </div>\n                    </li>\n                    <li>\n                        <img src=\"assets/images/icons/footer-location.svg\" alt=\"Airport Parking | Footer Contact Icon\" class=\"me-1\">\n                        <a href=\"https://maps.app.goo.gl/GYYZrAGs9UKBf7j5A\" target=\"_blank\">371/5 Negombo Rd, Seeduwa</a>\n                    </li>\n                </ul>\n            </div>\n        </div>\n        <div class=\"row\">\n    <div class=\"col-12\">\n    <p class=\"m-0 py-4\">\n        Designed and Developed by \n        <a href=\"https://explore.vacations/\" target=\"_blank\">Explore Vacations</a>. \n        <br class=\"d-md-none\">© <span id=\"year\"></span>\n    </p>\n</div>\n\n<script>\n    document.getElementById(\"year\").textContent = new Date().getFullYear();\n</script>\n        </div>\n    </div>\n</footer>\n\n<!--Whatsapp widget-->\n<div id=\"whatsapp-widget\">\n    <div class=\"chat-header\" id=\"chat-header\">\n        <div class=\"avatar-container\">\n            <img src=\"assets/images/whatsapp-img.jpg\" alt=\"logo\">\n            <div class=\"online-dot\"></div>\n        </div>\n        <div class=\"chat-header-info\">\n            <span style=\"transform: translateY(2px);\">Airport Parking</span>\n            <div style=\"color: #eeeeee;\">online</div>\n\n        </div>\n        <button class=\"close-btn\" id=\"close-btn\">&times;</button>\n    </div>\n    <div class=\"chat-content\" id=\"chat-content\">\n    </div>\n    <div class=\"message-input\" id=\"message-input\">\n        <button class=\"whatsapp-btn\" id=\"whatsapp-btn\">Chat in WhatsApp</button>\n    </div>\n    <div class=\"chat-icon\" id=\"chat-icon\">\n        <img src=\"https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg\" alt=\"WhatsApp\">\n    </div>\n</div>', 0, 'a:0:{}', 0, ''),
(2, 1, 0, 'header', '', 0, 0, 0, '<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n    <!-- Meta Tags -->\n    <meta charset=\"UTF-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <meta name=\"description\" content=\"<?php echo WEBSITE_DESCRIPTION; ?>\">\n    <meta name=\"keywords\" content=\"<?php echo WEBSITE_KEYWORDS; ?>\">\n    <meta name=\"author\" content=\"Airport Parking\">\n    <meta name=\"robots\" content=\"index, follow\">\n\n    <!-- Page Title -->\n    <title>Airport Parking</title>\n\n    <!-- Favicon -->\n    <link rel=\"icon\" href=\"assets/images/favicon.ico?v=2\" type=\"image/x-icon\">\n\n    <!-- Canonical URL -->\n    <link rel=\"canonical\" href=\"\">\n\n    <!-- Fontawesome -->\n    <link rel=\"stylesheet\" href=\"node_modules/@fortawesome/fontawesome-free/css/all.min.css\">\n    <!-- Swiper JS -->\n    <link rel=\"stylesheet\" href=\"node_modules/swiper/swiper-bundle.min.css\">\n    <!-- AOS Animations CSS -->\n    <link href=\"node_modules/aos/dist/aos.css\" rel=\"stylesheet\">\n    <!-- Lightgallery -->\n    <link type=\"text/css\" rel=\"stylesheet\" href=\"node_modules/lightgallery/css/lightgallery-bundle.css\" />\n    <!-- Stylesheets -->\n    <link rel=\"stylesheet\" href=\"node_modules/bootstrap/dist/css/bootstrap.min.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/variables.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/overrides.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/style.css\">\n    <link rel=\"stylesheet\" href=\"assets/css/responsive.css\">\n<link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css\" rel=\"stylesheet\">\n</head>\n\n<body>\n     <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js\"></script>\n     <!-- SweetAlert2 CSS & JS -->\n     <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>\n    <!-- Bootstrap -->\n    <script src=\"node_modules/bootstrap/dist/js/bootstrap.min.js\"></script>\n    <!-- Swiper JS -->\n    <script src=\"node_modules/swiper/swiper-bundle.min.js\"></script>\n    <!-- AOS Animations JS -->\n    <script src=\"node_modules/aos/dist/aos.js\"></script>\n    <!-- Whatsapp widget JS -->\n    <script src=\"assets/js/whatsapp-widget.js\"></script>\n    <!-- Lightgallery -->\n    <script src=\"node_modules/lightgallery/lightgallery.umd.js\"></script>\n    <!-- Custom JS -->\n    <script src=\"assets/js/script.js\"></script>\n    <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>\n    <!-- Scroll to Top Button -->\n    <button id=\"scrollTopBtn\" title=\"Go to top\"><img src=\"assets/images/top-icon.png\" alt=\"top-icon\" class=\"img-fluid\" style=\"\n        width: 20px;\n        height: 20px;\n        display: flex;\n    \"></button>\n\n</body>\n\n<script>\n    //Get the button\n    const scrollTopBtn = document.getElementById(\"scrollTopBtn\");\n\n    // Show button when user scrolls down 100px\n    window.onscroll = function() {scrollFunction()};\n\n    function scrollFunction() {\n        if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {\n            scrollTopBtn.style.display = \"block\";\n        } else {\n            scrollTopBtn.style.display = \"none\";\n        }\n    }\n\n    // Scroll to top smoothly when clicked\n    scrollTopBtn.addEventListener(\'click\', () => {\n        window.scrollTo({\n            top: 0,\n            behavior: \'smooth\'\n        });\n    });\n</script>\n\n</html>', 0, 'a:0:{}', 0, ''),
(3, 1, 0, 'navbar', '', 0, 0, 0, '<header>\n\n    <!-- Top Info Bar -->\n    <div class=\"top-bar\">\n        <div class=\"container d-flex justify-content-between align-items-center\">\n            <div class=\"top-left\">\n                <a href=\"https://wa.me/94761414557\" target=\"_blank\" class=\"top-link\">\n                    <i class=\"fa-brands fa-whatsapp fa-lg\"></i> +94 76 1414 557\n                </a>\n                <a href=\"mailto:info@airportparking.lk\" class=\"top-link\">\n                    <i class=\"fa-regular fa-envelope fa-lg\"></i> info@airportparking.lk\n                </a>\n            </div>\n            <div class=\"top-right\">\n                <a href=\"https://www.skyscanner.net/\" class=\"top-link\" target=\"_blank\">\n                    <i class=\"fa-solid fa-plane\"></i> Flight Info\n                </a>\n                <a href=\"https://srilankarentacar.com/\" class=\"top-btn\" target=\"_blank\">\n                    Rent a Car\n                </a>\n            </div>\n        </div>\n    </div>\n\n    <!-- Navbar -->\n    <nav class=\"navbar navbar-expand-lg p-lg-0\">\n        <div class=\"container d-flex align-items-center justify-content-between\">\n\n            <a class=\"navbar-brand\" href=\"./\">\n                <img src=\"assets/images/logo.png\" alt=\"Explore Vacations | Logo\">\n            </a>\n\n            <button class=\"navbar-toggler border-0\" type=\"button\"\n                data-bs-toggle=\"offcanvas\" data-bs-target=\"#offcanvasNavbar\">\n                <i class=\"fa-solid fa-bars\"></i>\n            </button>\n\n            <div class=\"offcanvas offcanvas-start\" tabindex=\"-1\" id=\"offcanvasNavbar\">\n                <div class=\"offcanvas-header\">\n                    <h5 class=\"offcanvas-title\">Explore Vacations</h5>\n                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"offcanvas\"></button>\n                </div>\n                <div class=\"offcanvas-body\">\n                    <ul class=\"navbar-nav ms-auto align-items-lg-center\">\n                        <li class=\"nav-item\"><a class=\"nav-link active\" href=\"./\">Home</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~2]]\">About</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~4]]\">FAQ</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~5]]\">Gallery</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~3]]\">Contact</a></li>\n                        <li class=\"nav-item\"><a class=\"nav-link\" href=\"[[~6]]\">My Account</a></li>\n\n                    </ul>\n                </div>\n            </div>\n\n        </div>\n    </nav>\n\n</header>\n\n<script>\nwindow.addEventListener(\"scroll\", function () {\n    const navbar = document.querySelector(\".navbar\");\n\n    if (window.scrollY > 50) {\n        navbar.classList.add(\"scrolled\");\n    } else {\n        navbar.classList.remove(\"scrolled\");\n    }\n});\n</script>\n\n', 0, 'a:0:{}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_plugins`
--

CREATE TABLE `modx_site_plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `plugincode` mediumtext NOT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_plugin_events`
--

CREATE TABLE `modx_site_plugin_events` (
  `pluginid` int(11) NOT NULL DEFAULT 0,
  `event` varchar(191) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT 0,
  `propertyset` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_snippets`
--

CREATE TABLE `modx_site_snippets` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `cache_type` tinyint(1) NOT NULL DEFAULT 0,
  `snippet` mediumtext DEFAULT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `moduleguid` varchar(32) NOT NULL DEFAULT '',
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `source`, `property_preprocess`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`, `static`, `static_file`) VALUES
(1, 1, 0, 'ContactUs', '', 0, 0, 0, 'ob_start();\n\ninclude(\'config-details.php\');\ninclude(\'assets/classes/EmailSender.php\');\n\n$errors = [];\n$successMessage = \'\';\n$errorMessage = \'\';\n\n$name = $email = $phone = $message = \'\';\n\n// Handle form submission\nif ($_SERVER[\'REQUEST_METHOD\'] === \'POST\') {\n\n    $name    = test_input($_POST[\'name\'] ?? \'\');\n    $email   = test_input($_POST[\'email\'] ?? \'\');\n    $phone   = preg_replace(\'/\\D+/\', \'\', $_POST[\'phone\'] ?? \'\');\n    $message = test_input($_POST[\'message\'] ?? \'\');\n\n    if (empty($name)) {\n        $errors[\'name\'] = \"Name is required\";\n    }\n\n    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {\n        $errors[\'email\'] = \"Enter a valid email address\";\n    }\n\n    if (empty($phone)) {\n        $errors[\'phone\'] = \"Contact number is required\";\n    }\n\n    if (empty($message)) {\n        $errors[\'message\'] = \"Message is required\";\n    }\n\n    if (empty($errors)) {\n        $emailSender = new EmailSender();\n        $emailTo = SMTP_USERNAME;\n        $emailSubject = \'Contact Form Message\';\n\n        $emailContent = \"\n            <table cellpadding=\'6\'>\n                <tr><td><b>Name</b></td><td>{$name}</td></tr>\n                <tr><td><b>Email</b></td><td>{$email}</td></tr>\n                <tr><td><b>Phone</b></td><td>{$phone}</td></tr>\n                <tr><td><b>Message</b></td><td>\".nl2br($message).\"</td></tr>\n            </table>\n        \";\n\n        if ($emailSender->sendEmail($emailTo, $emailSubject, $emailContent)) {\n            $successMessage = \"Your message has been sent successfully!\";\n            $name = $email = $phone = $message = \'\';\n        } else {\n            $errorMessage = \"Sorry, there was an issue sending your message.\";\n        }\n    }\n}\n?>\n\n<div class=\"row\">\n\n    <!-- Success / Error Messages -->\n    <div class=\"col-12\">\n        <?php if (!empty($successMessage)): ?>\n            <div class=\"alert alert-success alert-dismissible fade show text-center\">\n                <?= $successMessage ?>\n                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>\n            </div>\n        <?php elseif (!empty($errorMessage)): ?>\n            <div class=\"alert alert-danger alert-dismissible fade show text-center\">\n                <?= $errorMessage ?>\n                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>\n            </div>\n        <?php endif; ?>\n    </div>\n\n    <!-- Name -->\n    <div class=\"col-12 my-3\">\n        <label class=\"form-label\">Name<span class=\"text-danger\">*</span></label>\n        <input type=\"text\" name=\"name\" class=\"form-control\" value=\"<?= htmlspecialchars($name) ?>\">\n        <?php if (!empty($errors[\'name\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'name\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Email -->\n    <div class=\"col-md-6 my-3\">\n        <label class=\"form-label\">Email<span class=\"text-danger\">*</span></label>\n        <input type=\"email\" name=\"email\" class=\"form-control\" value=\"<?= htmlspecialchars($email) ?>\">\n        <?php if (!empty($errors[\'email\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'email\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Phone -->\n    <div class=\"col-md-6 my-3\">\n        <label class=\"form-label\">Phone<span class=\"text-danger\">*</span></label>\n        <input type=\"tel\" name=\"phone\" class=\"form-control\" value=\"<?= htmlspecialchars($phone) ?>\">\n        <?php if (!empty($errors[\'phone\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'phone\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Message -->\n    <div class=\"col-12 my-3\">\n        <label class=\"form-label\">Message<span class=\"text-danger\">*</span></label>\n        <textarea name=\"message\" rows=\"5\" class=\"form-control\"><?= htmlspecialchars($message) ?></textarea>\n        <?php if (!empty($errors[\'message\'])): ?>\n            <small class=\"text-danger\"><?= $errors[\'message\'] ?></small>\n        <?php endif; ?>\n    </div>\n\n    <!-- Submit -->\n    <div class=\"col-12 mt-4\">\n        <input type=\"submit\" name=\"submit\" value=\"Send Message\">\n    </div>\n</div>\n\n\n<?php\nreturn ob_get_clean();', 0, 'a:0:{}', '', 0, ''),
(2, 1, 0, 'WebsiteCustomerAuth', '', 0, 0, 0, 'session_start();\nrequire_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$dashboardPageId = 7;\n\n$loginMessage = \'\';\n$registerMessage = \'\';\n$activeTab = \'loginTab\';\n$prefillEmail = \'\';\n$prefillPhone = \'\';\n\nif ($_SERVER[\'REQUEST_METHOD\'] === \'POST\') {\n\n    if (isset($_POST[\'register_submit\'])) {\n        $activeTab = \'registerTab\';\n\n        $name = trim($_POST[\'register_name\'] ?? \'\');\n        $email = trim($_POST[\'register_email\'] ?? \'\');\n        $phone = trim($_POST[\'register_phone\'] ?? \'\');\n        $password = $_POST[\'register_password\'] ?? \'\';\n        $confirm = $_POST[\'register_confirm_password\'] ?? \'\';\n\n        $prefillEmail = $email;\n        $prefillPhone = $phone;\n\n        if (!$name || !$email || !$phone || !$password || !$confirm) {\n            $registerMessage = \'Please fill all required fields.\';\n        } elseif ($password !== $confirm) {\n            $registerMessage = \'Passwords do not match.\';\n        } else {\n            try {\n                // Check customer has booking record\n                $bookingCheck = $conn->prepare(\"\n                    SELECT id \n                    FROM reserved_slots \n                    WHERE email = ?\n                    LIMIT 1\n                \");\n                $bookingCheck->execute([$email, $phone]);\n\n                if (!$bookingCheck->fetch()) {\n                    $registerMessage = \'No booking records found for this email or phone number. Please register using the same details used for your booking.\';\n                } else {\n                    $check = $conn->prepare(\"SELECT id FROM website_customer WHERE email = ?\");\n                    $check->execute([$email]);\n\n                    if ($check->fetch()) {\n                        $registerMessage = \'This email is already registered. Please login.\';\n                        $activeTab = \'loginTab\';\n                    } else {\n                        $hash = password_hash($password, PASSWORD_DEFAULT);\n\n                        $stmt = $conn->prepare(\"\n                            INSERT INTO website_customer \n                            (full_name, email, phone, password_hash)\n                            VALUES (?, ?, ?, ?)\n                        \");\n                        $stmt->execute([$name, $email, $phone, $hash]);\n\n                        $loginMessage = \'Registration successful. Please login using your registered email.\';\n                        $activeTab = \'loginTab\';\n                        $prefillEmail = $email;\n                    }\n                }\n            } catch (PDOException $e) {\n                $registerMessage = \'Registration failed. Please try again.\';\n            }\n        }\n    }\n\n    if (isset($_POST[\'login_submit\'])) {\n        $activeTab = \'loginTab\';\n\n        $email = trim($_POST[\'login_email\'] ?? \'\');\n        $password = $_POST[\'login_password\'] ?? \'\';\n\n        $prefillEmail = $email;\n\n        if (!$email || !$password) {\n            $loginMessage = \'Please enter email and password.\';\n        } else {\n            $stmt = $conn->prepare(\"SELECT * FROM website_customer WHERE email = ?\");\n            $stmt->execute([$email]);\n            $user = $stmt->fetch(PDO::FETCH_ASSOC);\n\nif ($user && password_verify($password, $user[\'password_hash\'])) {\n\n    $_SESSION[\'customer_id\'] = $user[\'id\'];\n    $_SESSION[\'customer_name\'] = $user[\'full_name\'];\n    $_SESSION[\'customer_email\'] = $user[\'email\'];\n\n    // ✅ REMEMBER ME\n    if (!empty($_POST[\'remember_me\'])) {\n        $token = bin2hex(random_bytes(32));\n\n        // save token in DB\n        $stmt = $conn->prepare(\"UPDATE website_customer SET remember_token=? WHERE id=?\");\n        $stmt->execute([$token, $user[\'id\']]);\n\n        // set cookie (30 days)\n        setcookie(\"remember_token\", $token, time() + (86400 * 30), \"/\");\n    }\n\n    header(\"Location: \" . $modx->makeUrl($dashboardPageId));\n    exit;\n}\nelse {\n                $loginMessage = \'Invalid email or password.\';\n            }\n        }\n    }\n}\n\n$modx->setPlaceholder(\'loginMessage\', $loginMessage);\n$modx->setPlaceholder(\'registerMessage\', $registerMessage);\n$modx->setPlaceholder(\'activeTab\', $activeTab);\n$modx->setPlaceholder(\'prefillEmail\', htmlspecialchars($prefillEmail, ENT_QUOTES, \'UTF-8\'));\n$modx->setPlaceholder(\'prefillPhone\', htmlspecialchars($prefillPhone, ENT_QUOTES, \'UTF-8\'));\n\nreturn \'\';', 0, 'a:0:{}', '', 0, ''),
(3, 1, 0, 'Dashboard', '', 0, 0, 0, 'session_start();\n\n$myAccountPageId = 6;       // My Account page ID\n$bookingsPageId  = 8;     \n\nif (!isset($_SESSION[\'customer_id\'])) {\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nif (isset($_POST[\'logout\'])) {\n    session_destroy();\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nrequire_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$name  = htmlspecialchars($_SESSION[\'customer_name\'] ?? \'Customer\', ENT_QUOTES, \'UTF-8\');\n$emailRaw = $_SESSION[\'customer_email\'] ?? \'\';\n$email = htmlspecialchars($emailRaw, ENT_QUOTES, \'UTF-8\');\n$initial = strtoupper(substr($name, 0, 1));\n\n$totalBookings = 0;\n$activeBookings = 0;\n$totalReceipts = 0;\n\ntry {\n    $stmt = $conn->prepare(\"\n        SELECT COUNT(*) \n        FROM reserved_slots \n        WHERE email = ?\n        AND is_trashed = 0\n        AND is_no_show = 0\n    \");\n    $stmt->execute([$emailRaw]);\n    $totalBookings = (int)$stmt->fetchColumn();\n\n    $stmt = $conn->prepare(\"\n        SELECT COUNT(*) \n        FROM reserved_slots \n        WHERE email = ?\n        AND is_trashed = 0\n        AND is_no_show = 0\n        AND end_date >= NOW()\n    \");\n    $stmt->execute([$emailRaw]);\n    $activeBookings = (int)$stmt->fetchColumn();\n\n    $stmt = $conn->prepare(\"\n        SELECT COUNT(pr.id)\n        FROM payment_receipts pr\n        INNER JOIN reserved_slots rs ON rs.id = pr.reserved_slot_id\n        WHERE rs.email = ?\n    \");\n    $stmt->execute([$emailRaw]);\n    $totalReceipts = (int)$stmt->fetchColumn();\n\n} catch (PDOException $e) {\n    $totalBookings = 0;\n    $activeBookings = 0;\n    $totalReceipts = 0;\n}\n\nreturn \'\n<style>\n.customer-dashboard-wrap {\n    display: flex;\n    min-height: 80vh;\n    background: #f4f6f8;\n    font-family: Cambria, Cochin, Georgia, Times, \"Times New Roman\", serif;\n}\n\n.customer-sidebar {\n    width: 260px;\n    background: #003272;\n    color: #fff;\n    padding: 25px 20px;\n}\n\n.customer-logo {\n    font-size: 24px;\n    font-weight: bold;\n    margin-bottom: 35px;\n}\n\n.customer-user {\n    text-align: center;\n    margin-bottom: 30px;\n}\n\n.customer-avatar {\n    width: 75px;\n    height: 75px;\n    background: #fff;\n    color: #003272;\n    border-radius: 50%;\n    margin: 0 auto 12px;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    font-size: 30px;\n    font-weight: bold;\n}\n\n.customer-user-name {\n    font-size: 18px;\n    font-weight: bold;\n}\n\n.customer-user-email {\n    font-size: 13px;\n    opacity: 0.85;\n    word-break: break-word;\n}\n\n.customer-menu a,\n.customer-menu button {\n    display: block;\n    width: 100%;\n    background: transparent;\n    border: none;\n    color: #fff;\n    text-align: left;\n    padding: 12px 14px;\n    border-radius: 8px;\n    margin-bottom: 8px;\n    text-decoration: none;\n    cursor: pointer;\n    font-size: 15px;\n}\n\n.customer-menu a.active,\n.customer-menu a:hover,\n.customer-menu button:hover {\n    background: rgba(255,255,255,0.15);\n}\n\n.customer-main {\n    flex: 1;\n    padding: 30px;\n}\n\n.dashboard-header {\n    background: #fff;\n    padding: 22px 25px;\n    border-radius: 14px;\n    box-shadow: 0 5px 18px rgba(0,0,0,0.06);\n    margin-bottom: 25px;\n}\n\n.dashboard-header h2 {\n    color: #003272;\n    margin: 0 0 6px;\n}\n\n.dashboard-header p {\n    margin: 0;\n    color: #666;\n}\n\n.dashboard-cards {\n    display: grid;\n    grid-template-columns: repeat(3, 1fr);\n    gap: 18px;\n    margin-bottom: 25px;\n}\n\n.dashboard-card {\n    background: #fff;\n    padding: 22px;\n    border-radius: 14px;\n    box-shadow: 0 5px 18px rgba(0,0,0,0.06);\n}\n\n.dashboard-card span {\n    color: #777;\n    font-size: 14px;\n}\n\n.dashboard-card h3 {\n    margin: 8px 0 0;\n    color: #003272;\n    font-size: 28px;\n}\n\n.profile-panel {\n    background: #fff;\n    padding: 25px;\n    border-radius: 14px;\n    box-shadow: 0 5px 18px rgba(0,0,0,0.06);\n}\n\n.profile-panel h3 {\n    margin-top: 0;\n    color: #003272;\n}\n\n.profile-grid {\n    display: grid;\n    grid-template-columns: repeat(2, 1fr);\n    gap: 15px;\n}\n\n.profile-item {\n    background: #f8fafc;\n    border: 1px solid #e2e8f0;\n    padding: 14px;\n    border-radius: 10px;\n}\n\n.profile-item strong {\n    display: block;\n    color: #555;\n    margin-bottom: 5px;\n}\n\n@media (max-width: 850px) {\n    .customer-dashboard-wrap {\n        flex-direction: column;\n    }\n\n    .customer-sidebar {\n        width: 100%;\n    }\n\n    .dashboard-cards,\n    .profile-grid {\n        grid-template-columns: 1fr;\n    }\n}\n</style>\n\n\n    <title>Airport Parking | Booking Dashboard</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <link rel=\"icon\" type=\"image/png\" href=\"assets/images/footer-logo.png\">\n\n<div class=\"customer-dashboard-wrap\">\n    <aside class=\"customer-sidebar\">\n        <div class=\"customer-logo\">Airport Parking</div>\n\n        <div class=\"customer-user\">\n            <div class=\"customer-avatar\">\' . $initial . \'</div>\n            <div class=\"customer-user-name\">\' . $name . \'</div>\n            <div class=\"customer-user-email\">\' . $email . \'</div>\n        </div>\n\n        <div class=\"customer-menu\">\n            <a href=\"\' . $modx->makeUrl($modx->resource->get(\"id\")) . \'\" class=\"active\">Dashboard</a>\n            <a href=\"\' . $modx->makeUrl($bookingsPageId) . \'\">My Bookings</a>\n         \n            <a href=\"#\">Profile</a>\n\n            <form method=\"post\">\n                <button type=\"submit\" name=\"logout\">Logout</button>\n            </form>\n        </div>\n    </aside>\n\n    <main class=\"customer-main\">\n        <div class=\"dashboard-header\">\n            <h2>Welcome back, \' . $name . \'</h2>\n            <p>Manage your bookings, receipts, and account details from your dashboard.</p>\n        </div>\n\n        <div class=\"dashboard-cards\">\n            <div class=\"dashboard-card\">\n                <span>Total Bookings</span>\n                <h3>\' . $totalBookings . \'</h3>\n            </div>\n\n            <div class=\"dashboard-card\">\n                <span>Active Bookings</span>\n                <h3>\' . $activeBookings . \'</h3>\n            </div>\n\n            <div class=\"dashboard-card\">\n                <span>Payment Receipts</span>\n                <h3>\' . $totalReceipts . \'</h3>\n            </div>\n        </div>\n\n        <div class=\"profile-panel\">\n            <h3>Account Details</h3>\n\n            <div class=\"profile-grid\">\n                <div class=\"profile-item\">\n                    <strong>Name</strong>\n                    \' . $name . \'\n                </div>\n\n                <div class=\"profile-item\">\n                    <strong>Email</strong>\n                    \' . $email . \'\n                </div>\n\n                <div class=\"profile-item\">\n                    <strong>Account Status</strong>\n                    Active\n                </div>\n\n                <div class=\"profile-item\">\n                    <strong>Member Type</strong>\n                    Website Customer\n                </div>\n            </div>\n        </div>\n    </main>\n</div>\';', 0, 'a:0:{}', '', 0, ''),
(4, 1, 0, 'CustomerBookings', '', 0, 0, 0, 'session_start();\n\n$myAccountPageId = 6;   // My Account page ID\n$dashboardPageId = 7;  // Dashboard page ID\n$profilePageId = 9;\nif (!isset($_SESSION[\'customer_id\'])) {\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nif (isset($_POST[\'logout\'])) {\n    session_destroy();\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nrequire_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$name = htmlspecialchars($_SESSION[\'customer_name\'] ?? \'Customer\', ENT_QUOTES, \'UTF-8\');\n$emailRaw = $_SESSION[\'customer_email\'] ?? \'\';\n$email = htmlspecialchars($emailRaw, ENT_QUOTES, \'UTF-8\');\n$initial = strtoupper(substr($name, 0, 1));\n\nfunction makeFileUrl($path) {\n    if (!$path) return null;\n\n    $path = str_replace(\'\\\\\', \'/\', $path);\n\n    if (preg_match(\'#^https?://#i\', $path)) {\n        return $path;\n    }\n\n    if (isset($_SERVER[\'DOCUMENT_ROOT\']) && strpos($path, $_SERVER[\'DOCUMENT_ROOT\']) === 0) {\n        $path = substr($path, strlen($_SERVER[\'DOCUMENT_ROOT\']));\n    }\n\n    return \'/\' . ltrim($path, \'/\');\n}\n\nfunction getReceipts($conn, $bookingId) {\n    $stmt = $conn->prepare(\"\n        SELECT id, receipt_no, receipt_path, payment_amount, generated_at\n        FROM payment_receipts\n        WHERE reserved_slot_id = ?\n        AND receipt_path IS NOT NULL\n        ORDER BY generated_at DESC, id DESC\n    \");\n    $stmt->execute([$bookingId]);\n    return $stmt->fetchAll(PDO::FETCH_ASSOC);\n}\n\nfunction buildRows($bookings, $conn, $showEdit = false) {\n    $rows = \'\';\n\n    foreach ($bookings as $i => $b) {\n        $bookingId = (int)$b[\'id\'];\n        $ref = htmlspecialchars($b[\'reference_number\'] ?? \'\', ENT_QUOTES, \'UTF-8\');\n        $vehicle = htmlspecialchars(($b[\'vehicle_type\'] ?? \'\') . \' - \' . ($b[\'vehicle_number\'] ?? \'\'), ENT_QUOTES, \'UTF-8\');\n        $slot = htmlspecialchars($b[\'slot_number\'] ?? \'\', ENT_QUOTES, \'UTF-8\');\n\n        $start = !empty($b[\'start_date\']) ? date(\'d M Y h:i A\', strtotime($b[\'start_date\'])) : \'\';\n        $endSource = !empty($b[\'end_date_edited\']) ? $b[\'end_date_edited\'] : $b[\'end_date\'];\n        $end = !empty($endSource) ? date(\'d M Y h:i A\', strtotime($endSource)) : \'\';\n\n        $amount = !empty($b[\'total_price_final\']) ? (float)$b[\'total_price_final\'] : (float)$b[\'total_price\'];\n\n        $invoiceBtn = \'<span class=\"muted\">N/A</span>\';\n        if (!empty($b[\'pdf_path\'])) {\n            $pdf = makeFileUrl($b[\'pdf_path\']);\n            $invoiceBtn = \'<a href=\"\' . htmlspecialchars($pdf, ENT_QUOTES, \'UTF-8\') . \'\" target=\"_blank\" class=\"small-btn\">Invoice PDF</a>\';\n        }\n\n        $receipts = getReceipts($conn, $bookingId);\n        $receiptBtn = \'<span class=\"muted\">N/A</span>\';\n\n        if (count($receipts) === 1) {\n            $receiptUrl = makeFileUrl($receipts[0][\'receipt_path\']);\n            $receiptBtn = \'<a href=\"\' . htmlspecialchars($receiptUrl, ENT_QUOTES, \'UTF-8\') . \'\" target=\"_blank\" class=\"small-btn receipt-btn\">Receipt PDF</a>\';\n        } elseif (count($receipts) > 1) {\n            $receiptBtn = \'<button type=\"button\" class=\"small-btn receipt-btn view-receipts-btn\" data-booking-id=\"\' . $bookingId . \'\">Receipts (\' . count($receipts) . \')</button>\';\n        }\n\n$customerId = (int)($_SESSION[\'customer_id\'] ?? 0);\n\n$editBtn = $showEdit\n    ? \'<button type=\"button\" class=\"small-btn edit-booking-btn\" data-id=\"\' . $bookingId . \'\" data-customer-id=\"\' . $customerId . \'\">Edit</button>\'\n    : \'<span class=\"muted\">Completed</span>\';\n\n        $rows .= \'\n            <tr>\n                <td>\' . ($i + 1) . \'</td>\n                <td>\' . $ref . \'</td>\n                <td>\' . $vehicle . \'</td>\n                <td>\' . $start . \'</td>\n                <td>\' . $end . \'</td>\n                <td>LKR \' . number_format($amount, 2) . \'</td>\n                <td>\' . $invoiceBtn . \' \' . $receiptBtn . \'</td>\n                <td>\' . $editBtn . \'</td>\n            </tr>\n        \';\n    }\n\n    return $rows;\n}\n\n$ongoingBookings = [];\n$completedBookings = [];\n\ntry {\n    $stmt = $conn->prepare(\"\n        SELECT \n            id,\n            reference_number,\n            slot_number,\n            vehicle_type,\n            vehicle_number,\n            start_date,\n            end_date,\n            end_date_edited,\n            total_price,\n            total_price_final,\n            pdf_path,\n            status,\n            vehicle_status\n        FROM reserved_slots\n        WHERE email = ?\n        AND is_trashed = 0\n        AND is_no_show = 0\n        AND (vehicle_status IS NULL OR vehicle_status != \'completed\')\n        ORDER BY start_date DESC\n    \");\n    $stmt->execute([$emailRaw]);\n    $ongoingBookings = $stmt->fetchAll(PDO::FETCH_ASSOC);\n\n    $stmt = $conn->prepare(\"\n        SELECT \n            id,\n            reference_number,\n            slot_number,\n            vehicle_type,\n            vehicle_number,\n            start_date,\n            end_date,\n            end_date_edited,\n            total_price,\n            total_price_final,\n            pdf_path,\n            status,\n            vehicle_status\n        FROM reserved_slots\n        WHERE email = ?\n        AND is_trashed = 0\n        AND is_no_show = 0\n        AND vehicle_status = \'completed\'\n        ORDER BY start_date DESC\n    \");\n    $stmt->execute([$emailRaw]);\n    $completedBookings = $stmt->fetchAll(PDO::FETCH_ASSOC);\n\n} catch (PDOException $e) {\n    $ongoingBookings = [];\n    $completedBookings = [];\n}\n\n$ongoingRows = buildRows($ongoingBookings, $conn, true);\n$completedRows = buildRows($completedBookings, $conn, false);\n\nreturn \'\n<link rel=\"stylesheet\" href=\"https://cdn.datatables.net/2.1.2/css/dataTables.dataTables.min.css\">\n\n<style>\n.customer-dashboard-wrap {\n    display: flex;\n    min-height: 80vh;\n    background: #f4f6f8;\n    font-family: Cambria, Cochin, Georgia, Times, \"Times New Roman\", serif;\n}\n\n.customer-sidebar {\n    width: 260px;\n    background: #003272;\n    color: #fff;\n    padding: 25px 20px;\n}\n\n.customer-logo {\n    font-size: 24px;\n    font-weight: bold;\n    margin-bottom: 35px;\n}\n\n.customer-user {\n    text-align: center;\n    margin-bottom: 30px;\n}\n\n.customer-avatar {\n    width: 75px;\n    height: 75px;\n    background: #fff;\n    color: #003272;\n    border-radius: 50%;\n    margin: 0 auto 12px;\n    display: flex;\n    align-items: center;\n    justify-content: center;\n    font-size: 30px;\n    font-weight: bold;\n}\n\n.customer-user-name {\n    font-size: 18px;\n    font-weight: bold;\n}\n\n.customer-user-email {\n    font-size: 13px;\n    opacity: 0.85;\n    word-break: break-word;\n}\n\n.customer-menu a,\n.customer-menu button {\n    display: block;\n    width: 100%;\n    background: transparent;\n    border: none;\n    color: #fff;\n    text-align: left;\n    padding: 12px 14px;\n    border-radius: 8px;\n    margin-bottom: 8px;\n    text-decoration: none;\n    cursor: pointer;\n    font-size: 15px;\n}\n\n.customer-menu a.active,\n.customer-menu a:hover,\n.customer-menu button:hover {\n    background: rgba(255,255,255,0.15);\n}\n\n.customer-main {\n    flex: 1;\n    padding: 30px;\n}\n\n.dashboard-header,\n.bookings-panel {\n    background: #fff;\n    padding: 22px 25px;\n    border-radius: 14px;\n    box-shadow: 0 5px 18px rgba(0,0,0,0.06);\n    margin-bottom: 25px;\n}\n\n.dashboard-header h2,\n.bookings-panel h3 {\n    color: #003272;\n    margin-top: 0;\n}\n\n.bookings-table-wrap {\n    overflow-x: auto;\n}\n\n.bookings-table {\n    width: 100%;\n    border-collapse: collapse;\n}\n\n.bookings-table th {\n    background: #003272;\n    color: #fff;\n    padding: 12px;\n    text-align: left;\n}\n\n.bookings-table td {\n    padding: 12px;\n    border-bottom: 1px solid #e5e7eb;\n}\n\n.small-btn {\n    display: inline-block;\n    background: #003272;\n    color: #fff;\n    border: none;\n    padding: 7px 10px;\n    border-radius: 6px;\n    text-decoration: none;\n    font-size: 12px;\n    cursor: pointer;\n    margin: 2px;\n}\n\n.receipt-btn {\n    background: #6f42c1;\n}\n\n.edit-booking-btn {\n    background: #198754;\n}\n\n.muted {\n    color: #999;\n}\n\n.empty-row {\n    text-align: center;\n    color: #777;\n    padding: 24px !important;\n}\n\n.receipt-modal-overlay {\n    display: none;\n    position: fixed;\n    z-index: 9999;\n    inset: 0;\n    background: rgba(0,0,0,0.5);\n    padding: 40px 20px;\n}\n\n.receipt-modal {\n    background: #fff;\n    max-width: 800px;\n    margin: 0 auto;\n    border-radius: 12px;\n    overflow: hidden;\n}\n\n.receipt-modal-header {\n    background: #003272;\n    color: #fff;\n    padding: 16px 20px;\n    display: flex;\n    justify-content: space-between;\n    align-items: center;\n}\n\n.receipt-modal-body {\n    padding: 20px;\n    max-height: 70vh;\n    overflow-y: auto;\n}\n\n.close-receipt-modal {\n    background: transparent;\n    color: #fff;\n    border: none;\n    font-size: 24px;\n    cursor: pointer;\n}\n\n.receipt-list-table {\n    width: 100%;\n    border-collapse: collapse;\n}\n\n.receipt-list-table th {\n    background: #f1f5f9;\n    padding: 10px;\n    text-align: left;\n}\n\n.receipt-list-table td {\n    padding: 10px;\n    border-bottom: 1px solid #e5e7eb;\n}\n\n@media (max-width: 850px) {\n    .customer-dashboard-wrap {\n        flex-direction: column;\n    }\n\n    .customer-sidebar {\n        width: 100%;\n    }\n}\n</style>\n\n    <title>Airport Parking | Booking Dashboard</title>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <link rel=\"icon\" type=\"image/png\" href=\"assets/images/footer-logo.png\">\n\n<div class=\"customer-dashboard-wrap\">\n    <aside class=\"customer-sidebar\">\n        <div class=\"customer-logo\">Airport Parking</div>\n\n        <div class=\"customer-user\">\n            <div class=\"customer-avatar\">\' . $initial . \'</div>\n            <div class=\"customer-user-name\">\' . $name . \'</div>\n            <div class=\"customer-user-email\">\' . $email . \'</div>\n        </div>\n\n        <div class=\"customer-menu\">\n            <a href=\"\' . $modx->makeUrl($dashboardPageId) . \'\">Dashboard</a>\n            <a href=\"#\" class=\"active\">My Bookings</a>\n            <a href=\"\' . $modx->makeUrl($profilePageId) . \'\">Profile</a>\n\n            <form method=\"post\">\n                <button type=\"submit\" name=\"logout\">Logout</button>\n            </form>\n        </div>\n    </aside>\n\n    <main class=\"customer-main\">\n        <div class=\"dashboard-header\">\n            <h2>My Bookings</h2>\n            <p>Bookings matched using your registered email address: \' . $email . \'</p>\n        </div>\n\n        <div class=\"bookings-panel\">\n            <h3>Ongoing Bookings</h3>\n            <div class=\"bookings-table-wrap\">\n                <table id=\"ongoingBookingsTable\" class=\"bookings-table\">\n                    <thead>\n                        <tr>\n                            <th>#</th>\n                            <th>Reference No</th>\n                            <th>Vehicle</th>\n                            <th>Start Date</th>\n                            <th>End Date</th>\n                            <th>Total</th>\n                            <th>PDFs</th>\n                            <th>Action</th>\n                        </tr>\n                    </thead>\n                    <tbody>\' . $ongoingRows . \'</tbody>\n                </table>\n            </div>\n        </div>\n\n        <div class=\"bookings-panel\">\n            <h3>Completed Bookings</h3>\n            <div class=\"bookings-table-wrap\">\n                <table id=\"completedBookingsTable\" class=\"bookings-table\">\n                    <thead>\n                        <tr>\n                            <th>#</th>\n                            <th>Reference No</th>\n                            <th>Vehicle</th>\n                            <th>Start Date</th>\n                            <th>End Date</th>\n                            <th>Total</th>\n                            <th>PDFs</th>\n                            <th>Status</th>\n                        </tr>\n                    </thead>\n                    <tbody>\' . $completedRows . \'</tbody>\n                </table>\n            </div>\n        </div>\n    </main>\n</div>\n\n<div class=\"receipt-modal-overlay\" id=\"bookingEditModalOverlay\">\n    <div class=\"receipt-modal\">\n        <div class=\"receipt-modal-header\">\n            <strong>Edit Booking</strong>\n            <button type=\"button\" class=\"close-receipt-modal\" id=\"closeBookingEditModal\">&times;</button>\n        </div>\n        <div class=\"receipt-modal-body\" id=\"bookingEditModalBody\">\n            Loading...\n        </div>\n    </div>\n</div>\n\n<script src=\"https://code.jquery.com/jquery-3.7.1.min.js\"></script>\n<script src=\"https://cdn.datatables.net/2.1.2/js/dataTables.min.js\"></script>\n\n<script>\n$(function () {\n    $(\"#ongoingBookingsTable\").DataTable({\n        pageLength: 10,\n                order: [ [4, \"desc\"] ]\n\n    });\n\n    $(\"#completedBookingsTable\").DataTable({\n        pageLength: 10,\n                order: [ [4, \"desc\"] ]\n\n    });\n\n    $(\".view-receipts-btn\").on(\"click\", function () {\n        const bookingId = $(this).data(\"booking-id\");\n\n        $(\"#receiptModalOverlay\").fadeIn(150);\n        $(\"#receiptModalBody\").html(\"Loading...\");\n\n        $.get(\"assets/includes/customer-receipts-modal.php\", { booking_id: bookingId }, function (html) {\n            $(\"#receiptModalBody\").html(html);\n        }).fail(function () {\n            $(\"#receiptModalBody\").html(\"<p class=\\\"error-text\\\">Failed to load receipts.</p>\");\n        });\n    });\n\n    $(\"#closeReceiptModal, #receiptModalOverlay\").on(\"click\", function (e) {\n        if (e.target.id === \"receiptModalOverlay\" || e.target.id === \"closeReceiptModal\") {\n            $(\"#receiptModalOverlay\").fadeOut(150);\n        }\n    });\n\n$(document).on(\"click\", \".edit-booking-btn\", function () {\n    const bookingId = $(this).data(\"id\");\n\n    $(\"#bookingEditModalOverlay\").fadeIn(150);\n    $(\"#bookingEditModalBody\").html(\"Loading...\");\n\n  const customerId = $(this).data(\"customer-id\");\n\n$.get(\"assets/includes/customer-edit-booking-modal.php\", {\n    id: bookingId,\n    customer_id: customerId\n}, function (html) {\n        $(\"#bookingEditModalBody\").html(html);\n    }).fail(function () {\n    $(\"#bookingEditModalBody\").html(\"<p class=\\\"error-text\\\">Failed to load booking edit form.</p>\");\n});\n});\n\n$(document).on(\"click\", \"#closeBookingEditModal, #bookingEditModalOverlay\", function (e) {\n    if (e.target.id === \"bookingEditModalOverlay\" || e.target.id === \"closeBookingEditModal\") {\n        $(\"#bookingEditModalOverlay\").fadeOut(150);\n    }\n});\n});\n</script>\n\';', 0, 'a:0:{}', '', 0, ''),
(5, 1, 0, 'CustomerProfile', '', 0, 0, 0, 'session_start();\n\n$myAccountPageId = 6;\n$dashboardPageId = 7;\n$bookingsPageId = 8;\n\nif (!isset($_SESSION[\'customer_id\'])) {\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nif (isset($_POST[\'logout\'])) {\n    session_destroy();\n    header(\"Location: \" . $modx->makeUrl($myAccountPageId));\n    exit;\n}\n\nrequire_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$customerId = (int)$_SESSION[\'customer_id\'];\n$message = \'\';\n\nif (isset($_POST[\'update_profile\'])) {\n    $fullName = trim($_POST[\'full_name\'] ?? \'\');\n    $phone = trim($_POST[\'phone\'] ?? \'\');\n\n    if ($fullName === \'\') {\n        $message = \'Name is required.\';\n    } else {\n        $stmt = $conn->prepare(\"\n            UPDATE website_customer\n            SET full_name = ?, phone = ?\n            WHERE id = ?\n        \");\n        $stmt->execute([$fullName, $phone, $customerId]);\n\n        $_SESSION[\'customer_name\'] = $fullName;\n        $message = \'Profile updated successfully.\';\n    }\n}\n\n$stmt = $conn->prepare(\"SELECT * FROM website_customer WHERE id = ?\");\n$stmt->execute([$customerId]);\n$user = $stmt->fetch(PDO::FETCH_ASSOC);\n\n$name = htmlspecialchars($user[\'full_name\'] ?? \'Customer\', ENT_QUOTES, \'UTF-8\');\n$email = htmlspecialchars($user[\'email\'] ?? \'\', ENT_QUOTES, \'UTF-8\');\n$phone = htmlspecialchars($user[\'phone\'] ?? \'\', ENT_QUOTES, \'UTF-8\');\n$initial = strtoupper(substr($name, 0, 1));\n\nreturn \'\n<style>\n.customer-dashboard-wrap{display:flex;min-height:80vh;background:#f4f6f8;font-family:Cambria,Cochin,Georgia,Times,\"Times New Roman\",serif}\n.customer-sidebar{width:260px;background:#003272;color:#fff;padding:25px 20px}\n.customer-logo{font-size:24px;font-weight:bold;margin-bottom:35px}\n.customer-user{text-align:center;margin-bottom:30px}\n.customer-avatar{width:75px;height:75px;background:#fff;color:#003272;border-radius:50%;margin:0 auto 12px;display:flex;align-items:center;justify-content:center;font-size:30px;font-weight:bold}\n.customer-user-name{font-size:18px;font-weight:bold}\n.customer-user-email{font-size:13px;opacity:.85;word-break:break-word}\n.customer-menu a,.customer-menu button{display:block;width:100%;background:transparent;border:none;color:#fff;text-align:left;padding:12px 14px;border-radius:8px;margin-bottom:8px;text-decoration:none;cursor:pointer;font-size:15px}\n.customer-menu a.active,.customer-menu a:hover,.customer-menu button:hover{background:rgba(255,255,255,.15)}\n.customer-main{flex:1;padding:30px}\n.profile-card{background:#fff;padding:25px;border-radius:14px;box-shadow:0 5px 18px rgba(0,0,0,.06);max-width:750px}\n.profile-card h2{color:#003272;margin-top:0}\n.form-group{margin-bottom:16px}\n.form-group label{display:block;font-weight:bold;color:#003272;margin-bottom:6px}\n.form-group input{width:100%;padding:12px;border:1px solid #ccd6e0;border-radius:8px}\n.save-btn{background:#003272;color:#fff;border:none;padding:12px 20px;border-radius:8px;cursor:pointer;font-weight:bold}\n.message{background:#e8f4ff;border-left:4px solid #003272;padding:10px;margin-bottom:15px;color:#003272}\n@media(max-width:850px){.customer-dashboard-wrap{flex-direction:column}.customer-sidebar{width:100%}}\n</style>\n\n<div class=\"customer-dashboard-wrap\">\n    <aside class=\"customer-sidebar\">\n        <div class=\"customer-logo\">Airport Parking</div>\n        <div class=\"customer-user\">\n            <div class=\"customer-avatar\">\'.$initial.\'</div>\n            <div class=\"customer-user-name\">\'.$name.\'</div>\n            <div class=\"customer-user-email\">\'.$email.\'</div>\n        </div>\n\n        <div class=\"customer-menu\">\n            <a href=\"\'.$modx->makeUrl($dashboardPageId).\'\">Dashboard</a>\n            <a href=\"\'.$modx->makeUrl($bookingsPageId).\'\">My Bookings</a>\n            <a href=\"#\" class=\"active\">Profile</a>\n            <form method=\"post\">\n                <button type=\"submit\" name=\"logout\">Logout</button>\n            </form>\n        </div>\n    </aside>\n\n    <main class=\"customer-main\">\n        <div class=\"profile-card\">\n            <h2>My Profile</h2>\n\n            \'.($message ? \'<div class=\"message\">\'.htmlspecialchars($message, ENT_QUOTES, \'UTF-8\').\'</div>\' : \'\').\'\n\n            <form method=\"post\">\n                <div class=\"form-group\">\n                    <label>Full Name</label>\n                    <input type=\"text\" name=\"full_name\" value=\"\'.$name.\'\" required>\n                </div>\n\n                <div class=\"form-group\">\n                    <label>Email Address</label>\n                    <input type=\"email\" value=\"\'.$email.\'\" readonly>\n                </div>\n\n                <div class=\"form-group\">\n                    <label>Phone Number</label>\n                    <input type=\"text\" name=\"phone\" value=\"\'.$phone.\'\">\n                </div>\n\n                <button type=\"submit\" name=\"update_profile\" class=\"save-btn\">Save Changes</button>\n            </form>\n        </div>\n    </main>\n</div>\';', 0, 'a:0:{}', '', 0, ''),
(6, 1, 0, 'forgotMessage', '', 0, 0, 0, 'require_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$msg = \'\';\n\nif (isset($_POST[\'forgot_submit\'])) {\n\n    $email = trim($_POST[\'email\']);\n\n    $stmt = $conn->prepare(\"SELECT * FROM website_customer WHERE email=?\");\n    $stmt->execute([$email]);\n    $user = $stmt->fetch(PDO::FETCH_ASSOC);\n\n    if ($user) {\n        $token = bin2hex(random_bytes(32));\n        $expiry = date(\'Y-m-d H:i:s\', strtotime(\'+1 hour\'));\n\n        $stmt = $conn->prepare(\"UPDATE website_customer SET reset_token=?, reset_expiry=? WHERE id=?\");\n        $stmt->execute([$token, $expiry, $user[\'id\']]);\n\n        $link = \"http://localhost/airport/reset-password?token=\" . $token;\n\n        // SIMPLE MESSAGE (instead of email)\n        $msg = \"Reset link: <a href=\'$link\'>$link</a>\";\n    } else {\n        $msg = \"Email not found.\";\n    }\n}\n\n$modx->setPlaceholder(\'forgotMessage\', $msg);\nreturn \'\';', 0, 'a:0:{}', '', 0, ''),
(7, 1, 0, 'resetMessage', '', 0, 0, 0, 'require_once MODX_BASE_PATH . \'assets/includes/db_connect.php\';\n\n$msg = \'\';\n$token = $_GET[\'token\'] ?? \'\';\n\nif (!$token) {\n    $msg = \"Invalid request.\";\n} else {\n\n    $stmt = $conn->prepare(\"SELECT * FROM website_customer WHERE reset_token=? AND reset_expiry > NOW()\");\n    $stmt->execute([$token]);\n    $user = $stmt->fetch(PDO::FETCH_ASSOC);\n\n    if (!$user) {\n        $msg = \"Invalid or expired token.\";\n    } else {\n\n        if (isset($_POST[\'reset_submit\'])) {\n            $pass = password_hash($_POST[\'new_password\'], PASSWORD_DEFAULT);\n\n            $stmt = $conn->prepare(\"\n                UPDATE website_customer \n                SET password_hash=?, reset_token=NULL, reset_expiry=NULL \n                WHERE id=?\n            \");\n            $stmt->execute([$pass, $user[\'id\']]);\n\n            $msg = \"Password updated successfully.\";\n        }\n    }\n}\n\n$modx->setPlaceholder(\'resetMessage\', $msg);\nreturn \'\';', 0, 'a:0:{}', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_templates`
--

CREATE TABLE `modx_site_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `template_type` int(11) NOT NULL DEFAULT 0,
  `content` mediumtext NOT NULL,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT '',
  `preview_file` varchar(191) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `source`, `property_preprocess`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `properties`, `static`, `static_file`, `preview_file`) VALUES
(1, 0, 0, 'BaseTemplate', '', 0, 0, '', 0, '<!doctype html>\n<html lang=\"en\">\n<head>\n    <title>[[*pagetitle]] - [[++site_name]]</title>\n    <base href=\"[[!++site_url]]\">\n    <meta charset=\"[[++modx_charset]]\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n\n    <style>\n        body {\n            background-color: #eee;\n            font-family: sans-serif;\n            font-size: 20px;\n            line-height: 1.4em;\n            padding: 0;\n            margin: 0;\n        }\n        body.loaded {\n            font-family: \'Open Sans\', sans-serif;\n        }\n        .container {\n            display: block;\n            max-width: 960px;\n            margin: 2em auto 2em;\n            padding: 2em;\n            background: #fff;\n            border: 1px solid #ddd;\n            border-radius: 3px;\n        }\n        .container > section {\n            height: 100%;\n            width: 60%;\n            display: inline-block;\n            float: left;\n            margin-bottom: 2em;\n        }\n        .container > aside {\n            height: 100%;\n            display: inline-block;\n            width: 30%;\n            border-left: 2px dashed #eee;\n            float: right;\n            padding-left: 1.5em;\n        }\n        .logo {\n            background: url(\'[[++manager_url]]templates/default/images/modx-logo-color.svg\') no-repeat center transparent;\n            width: 220px;\n            height: 85px;\n            background-size: contain;\n            display: block;\n            position: relative;\n            text-indent: -9999px;\n            margin: 2em auto;\n        }\n        h1, h2, h3, h4, h5 {\n            color: #494949;\n            font-family: \'Open Sans\', sans-serif;\n            font-weight: 700;\n        }\n        h1 {\n            font-size: 36px;\n            color: #137899;\n        }\n        h2 {\n            font-size: 29px;\n        }\n        h3 {\n            font-size: 24px;\n        }\n        a {\n            color: #0f7096;\n        }\n        ul {\n            padding-left: 2em;\n        }\n        img {\n            max-width: 100%;\n        }\n        .cta-button {\n            display: block;\n            text-align: center;\n            vertical-align: middle;\n            -webkit-transform: translateZ(0);\n            transform: translateZ(0);\n            box-shadow: 0 0 1px rgba(0, 0, 0, 0);\n            -webkit-backface-visibility: hidden;\n            backface-visibility: hidden;\n            -moz-osx-font-smoothing: grayscale;\n            position: relative;\n            overflow: hidden;\n            margin: .2em 0;\n            padding: 1em;\n            cursor: pointer;\n            background: #67a749;\n            text-decoration: none;\n            border-radius: 3px;\n            color: #fff;\n            -webkit-tap-highlight-color: rgba(0,0,0,0);\n        }\n        .cta-button:before {\n            content: \"\";\n            position: absolute;\n            z-index: -1;\n            left: 50%;\n            right: 50%;\n            bottom: 0;\n            background: #137899;\n            height: 5px;\n            -webkit-transition-property: left, right;\n            transition-property: left, right;\n            -webkit-transition-duration: 0.3s;\n            transition-duration: 0.3s;\n            -webkit-transition-timing-function: ease-out;\n            transition-timing-function: ease-out;\n        }\n        .cta-button:hover:before, .cta-button:focus:before, .cta-button:active:before {\n            left: 0;\n            right: 0;\n        }\n        .companies {\n            clear: both;\n            display: block;\n            width: 100%;\n            padding: 1em 0 0;\n            border-top: 2px dashed #eee;\n        }\n        .companies h3 {\n            text-align: center;\n            margin: 0;\n        }\n        .companies ul {\n            margin: 0;\n            padding: 0;\n            list-style: none;\n            text-align: center;\n        }\n        .companies ul li {\n            display: inline-block;\n            padding: 0 1em;\n        }\n        .companies ul li:first-child {\n            padding-left: 0;\n        }\n        .companies ul li:last-child {\n            padding-right: 0;\n        }\n        .companies ul li a {\n            display: block;\n            position: relative;\n            text-indent: -99999px;\n            width: 200px;\n            height: 75px;\n            background-repeat: no-repeat;\n            background-size: 200px;\n            background-position: center;\n        }\n        .companies ul li.modmore a {\n            background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAABxCAMAAAAUAqFnAAADAFBMVEUgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToAgToB8YRCjAAAA/3RSTlMAAQIDBAUGBwgJCgsMDQ4PEBESExQVFhcYGRobHB0eHyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nzg5Ojs8PT4/QEFCQ0RFRkdISUpLTE1O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);\n        }\n        .companies ul li.extrasio a {\n            background-image: url(data:image/png;base64,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);\n        }\n        .companies ul li.modstore a {\n            background-image: url(data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABQAAD/4QMxaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzA2NyA3OS4xNTc3NDcsIDIwMTUvMDMvMzAtMjM6NDA6NDIgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE1IChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkM1OTk4RURBQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkM1OTk4RURCQjNCNTExRTVBNzdGRjlFOTdFNjM1MzEwIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RjlCOUZEN0ZCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RjlCOUZEODBCM0IwMTFFNUE3N0ZGOUU5N0U2MzUzMTAiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAACAgICAgICAgICAwIC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);\n        }\n        .companies ul li.modxextras a {\n            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMjkuNDkgNjEuNTQiPjxkZWZzPjxzdHlsZT4uY2xzLTF7ZmlsbDojMDBiNWRlO30uY2xzLTJ7ZmlsbDojMDBkZWNjO30uY2xzLTN7ZmlsbDojZmY1NTI5O30uY2xzLTR7ZmlsbDojZmY5NjQwO30uY2xzLTV7ZmlsbDojMTAyYzUzO308L3N0eWxlPjwvZGVmcz48ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj48ZyBpZD0iYnJhbmRfZ3VpZGVzIiBkYXRhLW5hbWU9ImJyYW5kIGd1aWRlcyI+PGcgaWQ9ImxvZ29fb25fbGlnaHQiIGRhdGEtbmFtZT0ibG9nbyBvbiBsaWdodCI+PHBvbHlnb24gY2xhc3M9ImNscy0xIiBwb2ludHM9IjU5LjI5IDUuOTUgMjkuNTggNS45NSAyNS41NiAxMi40IDQ2Ljk0IDI1LjcgNDYuOTQgMjUuNyA0Ni45NCAyNS43MSA1OS4yOSA1Ljk1Ii8+PHBvbHlnb24gY2xhc3M9ImNscy0yIiBwb2ludHM9IjI1LjU2IDEyLjQgNS42MiAwIDUuNjIgMjkuNzEgMTIuNDkgMzMuNzIgNDYuOTQgMjUuNyA0Ni45NCAyNS43IDI1LjU2IDEyLjQiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNDcuMDYgMjcuODIgNDcuMDYgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIiLz48cG9seWdvbiBjbGFzcz0iY2xzLTMiIHBvaW50cz0iNTMuNDcgMzEuODMgNDcuMDcgMjcuODIgMzMuNjUgNDkuMTUgNTMuNDcgNjEuNTQgNTMuNDcgMzEuODMiLz48cG9seWdvbiBjbGFzcz0iY2xzLTQiIHBvaW50cz0iNDcuMDcgMjcuODIgNDcuMDcgMjcuODIgNDcuMDYgMjcuODIgMTIuMzUgMzUuOTggMCA1NS40MSAyOS43MSA1NS40MSAzMy42NSA0OS4xNSA0Ny4wNyAyNy44MiA0Ny4wNyAyNy44MiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTEwNy42Niw0Ny44bDAtMTguODRMOTguMzcsNDQuNDhIOTUuMUw4NS45LDI5LjM3VjQ3LjhINzkuMDhWMTYuNGg2TDk2Ljg1LDM1LjkyLDEwOC40MiwxNi40aDZsLjA5LDMxLjRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMTIxLjgyLDMyLjFjMC05LjMzLDcuMjctMTYuMjQsMTcuMTgtMTYuMjRzMTcuMTgsNi44NywxNy4xOCwxNi4yNFMxNDguODcsNDguMzQsMTM5LDQ4LjM0LDEyMS44Miw0MS40MywxMjEuODIsMzIuMVptMjcsMGMwLTYtNC4yMi0xMC05LjgzLTEwcy05LjgyLDQuMDktOS44MiwxMC4wNSw0LjIxLDEwLDkuODIsMTBTMTQ4LjgzLDM4LjA3LDE0OC44MywzMi4xWiIvPjxwYXRoIGNsYXNzPSJjbHMtNSIgZD0iTTE2My41OSwxNi40aDE0LjI2YzEwLjI3LDAsMTcuMzIsNi4xOSwxNy4zMiwxNS43cy03LDE1LjctMTcuMzIsMTUuN0gxNjMuNTlabTEzLjksMjUuNDRjNi4yNCwwLDEwLjMyLTMuNzMsMTAuMzItOS43NHMtNC4wOC05LjczLTEwLjMyLTkuNzNoLTYuNjRWNDEuODRaIi8+PHBhdGggY2xhc3M9ImNscy01IiBkPSJNMjIxLjEsNDcuOGwtNy41OC0xMC45LTcuNDUsMTAuOWgtOC4zNGwxMS42MS0xNi0xMS0xNS40M2g4LjI1bDcuMjIsMTAuMTgsNy4wOS0xMC4xOGg3Ljg1TDIxNy43OCwzMS41NiwyMjkuNDksNDcuOFoiLz48L2c+PC9nPjwvZz48L3N2Zz4=);\n        }\n        .disclaimer {\n            max-width: 960px;\n            display: block;\n            margin: 0 auto;\n            text-align: center;\n            color: #333;\n            font-size: .6em;\n        }\n        @media (min-width: 768px) and (max-width: 991px)  {\n            .container {\n                padding: 1em;\n                border: 0;\n                border-radius: 0;\n            }\n        }\n        @media (max-width: 767px)  {\n            body {\n                font-size: 16px;\n            }\n            .container {\n                padding: 1em;\n                margin: 0 0 1em;\n                border: 0;\n                border-radius: 0;\n            }\n            .container > section, .container > aside {\n                float: none;\n                width: 100%;\n            }\n            .container aside {\n                border: 0;\n                padding: 0;\n            }\n            .logo {\n                width: 100%;\n                height: 48px;\n            }\n            h1 {\n                font-size: 24px;\n            }\n            h2 {\n                font-size: 19px;\n            }\n            h3 {\n                font-size: 16px;\n            }\n            .companys ul li {\n                display: block;\n            }\n        }\n    </style>\n</head>\n<body>\n<a href=\"https://modx.com\" title=\"MODX\" class=\"logo\" target=\"_blank\">MODX</a>\n<div class=\"container\">\n    <section>\n        <h1>[[*longtitle:default=`[[*pagetitle]]`]]</h1>\n        [[*content]]\n    </section>\n    <aside>\n        <a href=\"[[++manager_url]]\" title=\"Your MODX manager\" class=\"cta-button\">Go to the&nbsp;manager</a>\n        <h3>Learn more about&nbsp;MODX</h3>\n        <ul>\n            <li><a href=\"https://docs.modx.com/3.x/en/index\" target=\"_blank\">Official&nbsp;Documentation</a></li>\n            <li><a href=\"https://docs.modx.com/3.x/en/getting-started/friendly-urls\" target=\"_blank\">Using Friendly&nbsp;URLs</a></li>\n            <li><a href=\"https://docs.modx.com/current/en/building-sites/extras\" target=\"_blank\">Package&nbsp;Management</a></li>\n            <li><a href=\"https://modx.com/blog/\" target=\"_blank\">Official MODX&nbsp;Blog</a></li>\n            <li><a href=\"http://www.discovermodx.com/\" target=\"_blank\">Discover&nbsp;MODX</a></li>\n            <li><a href=\"https://modx.today\" target=\"_blank\">MODX.today</a></li>\n        </ul>\n        <h3>Get help!</h3>\n        <ul>\n            <li><a href=\"https://community.modx.com\" target=\"_blank\">Official MODX&nbsp;Forums</a></li>\n            <li><a href=\"https://modx.org/\" target=\"_blank\">MODX on&nbsp;Slack</a></li>\n            <li><a href=\"https://twitter.com/modx\" target=\"_blank\">MODX on&nbsp;Twitter</a></li>\n            <li><a href=\"https://www.facebook.com/modxcms\" target=\"_blank\">MODX on&nbsp;Facebook</a></li>\n            <li><a href=\"https://modx.com/professionals/\" target=\"_blank\">Find a MODX&nbsp;Professional</a></li>\n        </ul>\n    </aside>\n    <div class=\"companies\">\n        <h3>Extend MODX with&nbsp;Extras</h3>\n        <ul>\n            <li class=\"modxextras\"><a href=\"https://modx.com/extras/\" title=\"MODX extras\" target=\"_blank\">MODX&nbsp;extras</a></li>\n            <li class=\"modmore\"><a href=\"https://www.modmore.com/extras/\" title=\"modmore.com\" target=\"_blank\">modmore.com</a></li>\n            <li class=\"modstore\"><a href=\"https://modstore.pro/\" title=\"modstore.pro\" target=\"_blank\">modstore.pro</a></li>\n            <li class=\"extrasio\"><a href=\"https://extras.io/extras/\" title=\"Extras.io\" target=\"_blank\">Extras.io</a></li>\n        </ul>\n    </div>\n</div>\n<footer class=\"disclaimer\">\n    <p>&copy; 2005-present the <a href=\"https://modx.com\" target=\"_blank\">MODX</a> Content Management Framework (CMF) project. All rights reserved. MODX is licensed under the GNU&nbsp;GPL.</p>\n</footer>\n\n<script>\n    // Load the Open Sans font\n    try {\n        document.addEventListener(\"DOMContentLoaded\", function() { // prevent a Flash Of Unstyled Text (FOUT)\n            document.querySelector(\'head\').innerHTML += \"<link href=\'https://fonts.googleapis.com/css?family=Open+Sans:400,700\' rel=\'stylesheet\' type=\'text/css\'>\";\n            document.body.classList.add(\'loaded\');\n        });\n    } catch (e) { }\n\n    // Shuffle the vendors to prevent favoritism of one vendor over the other\n    // with thanks to http://james.padolsey.com/javascript/shuffling-the-dom/\n    function shuffle(elems) {\n        var allElems = (function(){\n            var ret = [], l = elems.length;\n            while (l--) {\n                if (elems[l].className !== \'modxextras\') {\n                    ret[ret.length] = elems[l];\n                }\n            }\n            return ret;\n        })();\n\n        var shuffled = (function(){\n            var l = allElems.length, ret = [];\n            while (l--) {\n                var random = Math.floor(Math.random() * allElems.length),\n                        randEl = allElems[random].cloneNode(true);\n                allElems.splice(random, 1);\n                ret[ret.length] = randEl;\n            }\n            return ret;\n        })(), l = elems.length;\n\n        // To make sure the MODX logo stays #1, we lower the count by one here (shuffling 3 instead of 4 items)\n        // and refer to elems[l+1] in the loop below. This matches because allElems was also filtered to not include\n        // the official MODX logo.\n        l--;\n        while (l--) {\n            elems[l+1].parentNode.insertBefore(shuffled[l], elems[l+1].nextSibling);\n            elems[l+1].parentNode.removeChild(elems[l+1]);\n        }\n    }\n    shuffle(document.querySelectorAll(\'.companies li\'));\n</script>\n\n</body>\n</html>\n', 0, NULL, 0, '', ''),
(2, 1, 0, 'home', '', 0, 0, '', 0, '[[$header?]]\n[[$navbar?]]\n[[*content]]\n[[$footer?]]', 0, 'a:0:{}', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_tmplvars`
--

CREATE TABLE `modx_site_tmplvars` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_preprocess` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `locked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `elements` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `display` varchar(20) NOT NULL DEFAULT '',
  `default_text` mediumtext DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `input_properties` text DEFAULT NULL,
  `output_properties` text DEFAULT NULL,
  `static` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `static_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_tmplvar_access`
--

CREATE TABLE `modx_site_tmplvar_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `documentgroup` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_tmplvar_contentvalues`
--

CREATE TABLE `modx_site_tmplvar_contentvalues` (
  `id` int(10) UNSIGNED NOT NULL,
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contentid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_site_tmplvar_templates`
--

CREATE TABLE `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `templateid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_system_eventnames`
--

CREATE TABLE `modx_system_eventnames` (
  `name` varchar(50) NOT NULL,
  `service` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `groupname` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`name`, `service`, `groupname`) VALUES
('OnBeforeCacheUpdate', 4, 'System'),
('OnBeforeChunkFormDelete', 1, 'Chunks'),
('OnBeforeChunkFormSave', 1, 'Chunks'),
('OnBeforeDocFormDelete', 1, 'Resources'),
('OnBeforeDocFormSave', 1, 'Resources'),
('OnBeforeEmptyTrash', 1, 'Resources'),
('OnBeforeManagerLogin', 2, 'Security'),
('OnBeforeManagerLogout', 2, 'Security'),
('OnBeforeManagerPageInit', 2, 'System'),
('OnBeforePluginFormDelete', 1, 'Plugins'),
('OnBeforePluginFormSave', 1, 'Plugins'),
('OnBeforeRegisterClientScripts', 5, 'System'),
('OnBeforeSaveWebPageCache', 4, 'System'),
('OnBeforeSnipFormDelete', 1, 'Snippets'),
('OnBeforeSnipFormSave', 1, 'Snippets'),
('OnBeforeTempFormDelete', 1, 'Templates'),
('OnBeforeTempFormSave', 1, 'Templates'),
('OnBeforeTVFormDelete', 1, 'Template Variables'),
('OnBeforeTVFormSave', 1, 'Template Variables'),
('OnBeforeUserActivate', 1, 'Users'),
('OnBeforeUserDeactivate', 1, 'Users'),
('OnBeforeUserDuplicate', 1, 'Users'),
('OnBeforeUserFormDelete', 1, 'Users'),
('OnBeforeUserFormSave', 1, 'Users'),
('OnBeforeUserGroupFormRemove', 1, 'User Groups'),
('OnBeforeUserGroupFormSave', 1, 'User Groups'),
('OnBeforeWebLogin', 3, 'Security'),
('OnBeforeWebLogout', 3, 'Security'),
('OnCacheUpdate', 4, 'System'),
('OnCategoryBeforeRemove', 1, 'Categories'),
('OnCategoryBeforeSave', 1, 'Categories'),
('OnCategoryRemove', 1, 'Categories'),
('OnCategorySave', 1, 'Categories'),
('OnChunkBeforeRemove', 1, 'Chunks'),
('OnChunkBeforeSave', 1, 'Chunks'),
('OnChunkFormDelete', 1, 'Chunks'),
('OnChunkFormPrerender', 1, 'Chunks'),
('OnChunkFormRender', 1, 'Chunks'),
('OnChunkFormSave', 1, 'Chunks'),
('OnChunkRemove', 1, 'Chunks'),
('OnChunkSave', 1, 'Chunks'),
('OnContextBeforeRemove', 1, 'Contexts'),
('OnContextBeforeSave', 1, 'Contexts'),
('OnContextFormPrerender', 2, 'Contexts'),
('OnContextFormRender', 2, 'Contexts'),
('OnContextInit', 1, 'Contexts'),
('OnContextRemove', 1, 'Contexts'),
('OnContextSave', 1, 'Contexts'),
('OnDocFormDelete', 1, 'Resources'),
('OnDocFormPrerender', 1, 'Resources'),
('OnDocFormRender', 1, 'Resources'),
('OnDocFormSave', 1, 'Resources'),
('OnDocPublished', 5, 'Resources'),
('OnDocUnPublished', 5, 'Resources'),
('OnElementNotFound', 1, 'System'),
('OnEmptyTrash', 1, 'Resources'),
('OnFileCreateFormPrerender', 1, 'System'),
('OnFileEditFormPrerender', 1, 'System'),
('OnFileManagerBeforeUpload', 1, 'System'),
('OnFileManagerDirCreate', 1, 'System'),
('OnFileManagerDirRemove', 1, 'System'),
('OnFileManagerDirRename', 1, 'System'),
('OnFileManagerFileCreate', 1, 'System'),
('OnFileManagerFileRemove', 1, 'System'),
('OnFileManagerFileRename', 1, 'System'),
('OnFileManagerFileUpdate', 1, 'System'),
('OnFileManagerMoveObject', 1, 'System'),
('OnFileManagerUpload', 1, 'System'),
('OnHandleRequest', 5, 'System'),
('OnInitCulture', 1, 'Internationalization'),
('OnLoadWebDocument', 5, 'System'),
('OnLoadWebPageCache', 4, 'System'),
('OnManagerAuthentication', 2, 'Security'),
('OnManagerLogin', 2, 'Security'),
('OnManagerLoginFormPrerender', 2, 'Security'),
('OnManagerLoginFormRender', 2, 'Security'),
('OnManagerLogout', 2, 'Security'),
('OnManagerPageAfterRender', 2, 'System'),
('OnManagerPageBeforeRender', 2, 'System'),
('OnManagerPageInit', 2, 'System'),
('OnMediaSourceBeforeFormDelete', 1, 'Media Sources'),
('OnMediaSourceBeforeFormSave', 1, 'Media Sources'),
('OnMediaSourceDuplicate', 1, 'Media Sources'),
('OnMediaSourceFormDelete', 1, 'Media Sources'),
('OnMediaSourceFormSave', 1, 'Media Sources'),
('OnMediaSourceGetProperties', 1, 'Media Sources'),
('OnMODXInit', 5, 'System'),
('OnPackageInstall', 2, 'Package Manager'),
('OnPackageRemove', 2, 'Package Manager'),
('OnPackageUninstall', 2, 'Package Manager'),
('OnPageNotFound', 1, 'System'),
('OnPageUnauthorized', 1, 'Security'),
('OnParseDocument', 5, 'System'),
('OnPluginBeforeRemove', 1, 'Plugins'),
('OnPluginBeforeSave', 1, 'Plugins'),
('OnPluginEventBeforeRemove', 1, 'Plugin Events'),
('OnPluginEventBeforeSave', 1, 'Plugin Events'),
('OnPluginEventRemove', 1, 'Plugin Events'),
('OnPluginEventSave', 1, 'Plugin Events'),
('OnPluginFormDelete', 1, 'Plugins'),
('OnPluginFormPrerender', 1, 'Plugins'),
('OnPluginFormRender', 1, 'Plugins'),
('OnPluginFormSave', 1, 'Plugins'),
('OnPluginRemove', 1, 'Plugins'),
('OnPluginSave', 1, 'Plugins'),
('OnPropertySetBeforeRemove', 1, 'Property Sets'),
('OnPropertySetBeforeSave', 1, 'Property Sets'),
('OnPropertySetRemove', 1, 'Property Sets'),
('OnPropertySetSave', 1, 'Property Sets'),
('OnResourceAddToResourceGroup', 1, 'Resources'),
('OnResourceAutoPublish', 1, 'Resources'),
('OnResourceBeforeSort', 1, 'Resources'),
('OnResourceCacheUpdate', 1, 'Resources'),
('OnResourceDelete', 1, 'Resources'),
('OnResourceDuplicate', 1, 'Resources'),
('OnResourceGroupBeforeRemove', 1, 'Security'),
('OnResourceGroupBeforeSave', 1, 'Security'),
('OnResourceGroupRemove', 1, 'Security'),
('OnResourceGroupSave', 1, 'Security'),
('OnResourceRemoveFromResourceGroup', 1, 'Resources'),
('OnResourceSort', 1, 'Resources'),
('OnResourceToolbarLoad', 1, 'Resources'),
('OnResourceTVFormPrerender', 1, 'Resources'),
('OnResourceTVFormRender', 1, 'Resources'),
('OnResourceUndelete', 1, 'Resources'),
('OnRichTextBrowserInit', 1, 'RichText Editor'),
('OnRichTextEditorInit', 1, 'RichText Editor'),
('OnRichTextEditorRegister', 1, 'RichText Editor'),
('OnSiteRefresh', 1, 'System'),
('OnSiteSettingsRender', 1, 'Settings'),
('OnSnipFormDelete', 1, 'Snippets'),
('OnSnipFormPrerender', 1, 'Snippets'),
('OnSnipFormRender', 1, 'Snippets'),
('OnSnipFormSave', 1, 'Snippets'),
('OnSnippetBeforeRemove', 1, 'Snippets'),
('OnSnippetBeforeSave', 1, 'Snippets'),
('OnSnippetRemove', 1, 'Snippets'),
('OnSnippetSave', 1, 'Snippets'),
('OnTempFormDelete', 1, 'Templates'),
('OnTempFormPrerender', 1, 'Templates'),
('OnTempFormRender', 1, 'Templates'),
('OnTempFormSave', 1, 'Templates'),
('OnTemplateBeforeRemove', 1, 'Templates'),
('OnTemplateBeforeSave', 1, 'Templates'),
('OnTemplateRemove', 1, 'Templates'),
('OnTemplateSave', 1, 'Templates'),
('OnTemplateVarBeforeRemove', 1, 'Template Variables'),
('OnTemplateVarBeforeSave', 1, 'Template Variables'),
('OnTemplateVarRemove', 1, 'Template Variables'),
('OnTemplateVarSave', 1, 'Template Variables'),
('OnTVFormDelete', 1, 'Template Variables'),
('OnTVFormPrerender', 1, 'Template Variables'),
('OnTVFormRender', 1, 'Template Variables'),
('OnTVFormSave', 1, 'Template Variables'),
('OnTVInputPropertiesList', 1, 'Template Variables'),
('OnTVInputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderList', 1, 'Template Variables'),
('OnTVOutputRenderPropertiesList', 1, 'Template Variables'),
('OnUserActivate', 1, 'Users'),
('OnUserAddToGroup', 1, 'User Groups'),
('OnUserBeforeAddToGroup', 1, 'User Groups'),
('OnUserBeforeRemove', 1, 'Users'),
('OnUserBeforeRemoveFromGroup', 1, 'User Groups'),
('OnUserBeforeSave', 1, 'Users'),
('OnUserChangePassword', 1, 'Users'),
('OnUserDeactivate', 1, 'Users'),
('OnUserDuplicate', 1, 'Users'),
('OnUserFormDelete', 1, 'Users'),
('OnUserFormPrerender', 1, 'Users'),
('OnUserFormRender', 1, 'Users'),
('OnUserFormSave', 1, 'Users'),
('OnUserGroupBeforeRemove', 1, 'User Groups'),
('OnUserGroupBeforeSave', 1, 'User Groups'),
('OnUserGroupFormSave', 1, 'User Groups'),
('OnUserGroupRemove', 1, 'User Groups'),
('OnUserGroupSave', 1, 'User Groups'),
('OnUserNotFound', 1, 'Users'),
('OnUserProfileBeforeRemove', 1, 'User Profiles'),
('OnUserProfileBeforeSave', 1, 'User Profiles'),
('OnUserProfileRemove', 1, 'User Profiles'),
('OnUserProfileSave', 1, 'User Profiles'),
('OnUserRemove', 1, 'Users'),
('OnUserRemoveFromGroup', 1, 'User Groups'),
('OnUserSave', 1, 'Users'),
('OnWebAuthentication', 3, 'Security'),
('OnWebLogin', 3, 'Security'),
('OnWebLogout', 3, 'Security'),
('OnWebPageComplete', 5, 'System'),
('OnWebPageInit', 5, 'System'),
('OnWebPagePrerender', 5, 'System');

-- --------------------------------------------------------

--
-- Table structure for table `modx_system_settings`
--

CREATE TABLE `modx_system_settings` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`key`, `value`, `xtype`, `namespace`, `area`, `editedon`) VALUES
('access_category_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_context_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('access_resource_group_enabled', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_forward_across_contexts', '', 'combo-boolean', 'core', 'system', NULL),
('allow_manager_login_forgot_password', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_multiple_emails', '1', 'combo-boolean', 'core', 'authentication', NULL),
('allow_tags_in_post', '', 'combo-boolean', 'core', 'system', NULL),
('anonymous_sessions', '1', 'combo-boolean', 'core', 'session', NULL),
('archive_with', '', 'combo-boolean', 'core', 'system', NULL),
('automatic_alias', '1', 'combo-boolean', 'core', 'furls', NULL),
('automatic_template_assignment', 'sibling', 'textfield', 'core', 'site', NULL),
('auto_check_pkg_updates', '1', 'combo-boolean', 'core', 'system', NULL),
('auto_check_pkg_updates_cache_expire', '15', 'numberfield', 'core', 'system', NULL),
('auto_isfolder', '1', 'combo-boolean', 'core', 'site', NULL),
('auto_menuindex', '1', 'combo-boolean', 'core', 'site', NULL),
('base_help_url', '//docs.modx.com/help/', 'textfield', 'core', 'manager', NULL),
('blocked_minutes', '60', 'numberfield', 'core', 'authentication', NULL),
('cache_alias_map', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_context_settings', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_db', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_db_session', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_db_session_lifetime', '', 'numberfield', 'core', 'caching', NULL),
('cache_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_format', '0', 'numberfield', 'core', 'caching', NULL),
('cache_handler', 'xPDO\\Cache\\xPDOFileCache', 'textfield', 'core', 'caching', NULL),
('cache_lang_js', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_noncore_lexicon_topics', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource', '1', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_clear_partial', '', 'combo-boolean', 'core', 'caching', NULL),
('cache_resource_expires', '0', 'numberfield', 'core', 'caching', NULL),
('cache_scripts', '1', 'combo-boolean', 'core', 'caching', NULL),
('clear_cache_refresh_trees', '', 'combo-boolean', 'core', 'caching', NULL),
('compress_css', '1', 'combo-boolean', 'core', 'manager', NULL),
('compress_js', '1', 'combo-boolean', 'core', 'manager', NULL),
('confirm_navigation', '1', 'combo-boolean', 'core', 'manager', NULL),
('container_suffix', '/', 'textfield', 'core', 'furls', NULL),
('context_tree_sort', '1', 'combo-boolean', 'core', 'manager', NULL),
('context_tree_sortby', 'rank', 'textfield', 'core', 'manager', NULL),
('context_tree_sortdir', 'ASC', 'textfield', 'core', 'manager', NULL),
('cultureKey', 'en', 'modx-combo-language', 'core', 'language', NULL),
('date_timezone', '', 'textfield', 'core', 'system', NULL),
('debug', '', 'numberfield', 'core', 'system', NULL),
('default_content_type', '1', 'modx-combo-content-type', 'core', 'site', NULL),
('default_context', 'web', 'modx-combo-context', 'core', 'site', NULL),
('default_duplicate_publish_option', 'preserve', 'textfield', 'core', 'manager', NULL),
('default_media_source', '1', 'modx-combo-source', 'core', 'manager', NULL),
('default_media_source_type', 'MODX\\Revolution\\Sources\\modFileMediaSource', 'modx-combo-source-type', 'core', 'manager', NULL),
('default_per_page', '20', 'textfield', 'core', 'manager', NULL),
('default_template', '1', 'modx-combo-template', 'core', 'site', NULL),
('default_username', '(anonymous)', 'textfield', 'core', 'session', NULL),
('emailsender', 'navodyadivyanjali2@gmail.com', 'textfield', 'core', 'authentication', '2025-12-22 10:39:41'),
('enable_dragdrop', '1', 'combo-boolean', 'core', 'manager', NULL),
('enable_gravatar', '', 'combo-boolean', 'core', 'manager', NULL),
('enable_template_picker_in_tree', '1', 'combo-boolean', 'core', 'manager', NULL),
('error_log_filename', 'error.log', 'textfield', 'core', 'system', NULL),
('error_log_filepath', '', 'textfield', 'core', 'system', NULL),
('error_page', '1', 'numberfield', 'core', 'site', NULL),
('failed_login_attempts', '5', 'numberfield', 'core', 'authentication', NULL),
('feed_modx_news', 'https://feeds.feedburner.com/modx-announce', 'textfield', 'core', 'system', NULL),
('feed_modx_news_enabled', '1', 'combo-boolean', 'core', 'system', NULL),
('feed_modx_security', 'https://forums.modx.com/board.xml?board=294', 'textfield', 'core', 'system', NULL),
('feed_modx_security_enabled', '1', 'combo-boolean', 'core', 'system', NULL),
('form_customization_use_all_groups', '', 'combo-boolean', 'core', 'manager', NULL),
('forward_merge_excludes', 'type,published,class_key', 'textfield', 'core', 'system', NULL),
('friendly_alias_lowercase_only', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_max_length', '0', 'numberfield', 'core', 'furls', NULL),
('friendly_alias_realtime', '', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_restrict_chars', 'pattern', 'textfield', 'core', 'furls', NULL),
('friendly_alias_restrict_chars_pattern', '/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_strip_element_tags', '1', 'combo-boolean', 'core', 'furls', NULL),
('friendly_alias_translit', 'none', 'textfield', 'core', 'furls', NULL),
('friendly_alias_translit_class', 'translit.modTransliterate', 'textfield', 'core', 'furls', NULL),
('friendly_alias_translit_class_path', '{core_path}components/', 'textfield', 'core', 'furls', NULL),
('friendly_alias_trim_chars', '/.-_', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiter', '-', 'textfield', 'core', 'furls', NULL),
('friendly_alias_word_delimiters', '-_', 'textfield', 'core', 'furls', NULL),
('friendly_urls', '', 'combo-boolean', 'core', 'furls', NULL),
('friendly_urls_strict', '', 'combo-boolean', 'core', 'furls', NULL),
('global_duplicate_uri_check', '', 'combo-boolean', 'core', 'furls', NULL),
('hidemenu_default', '', 'combo-boolean', 'core', 'site', NULL),
('inline_help', '1', 'combo-boolean', 'core', 'manager', NULL),
('link_tag_scheme', '-1', 'textfield', 'core', 'site', NULL),
('locale', '', 'textfield', 'core', 'language', NULL),
('lock_ttl', '360', 'numberfield', 'core', 'system', NULL),
('login_background_image', '', 'textfield', 'core', 'authentication', NULL),
('login_help_button', '', 'combo-boolean', 'core', 'authentication', NULL),
('login_logo', '', 'textfield', 'core', 'authentication', NULL),
('log_deprecated', '1', 'combo-boolean', 'core', 'system', NULL),
('log_level', '1', 'numberfield', 'core', 'system', NULL),
('log_snippet_not_found', '1', 'combo-boolean', 'core', 'site', NULL),
('log_target', 'FILE', 'textfield', 'core', 'system', NULL),
('mail_charset', 'UTF-8', 'modx-combo-charset', 'core', 'mail', NULL),
('mail_dkim_domain', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_identity', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_passphrase', '', 'text-password', 'core', 'mail', NULL),
('mail_dkim_privatekeyfile', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_privatekeystring', '', 'textfield', 'core', 'mail', NULL),
('mail_dkim_selector', '', 'textfield', 'core', 'mail', NULL),
('mail_encoding', '8bit', 'textfield', 'core', 'mail', NULL),
('mail_smtp_auth', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_autotls', '1', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_helo', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_hosts', 'localhost', 'textfield', 'core', 'mail', NULL),
('mail_smtp_keepalive', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_pass', '', 'text-password', 'core', 'mail', NULL),
('mail_smtp_port', '587', 'numberfield', 'core', 'mail', NULL),
('mail_smtp_secure', '', 'textfield', 'core', 'mail', NULL),
('mail_smtp_single_to', '', 'combo-boolean', 'core', 'mail', NULL),
('mail_smtp_timeout', '10', 'numberfield', 'core', 'mail', NULL),
('mail_smtp_user', '', 'textfield', 'core', 'mail', NULL),
('mail_use_smtp', '', 'combo-boolean', 'core', 'mail', NULL),
('main_nav_parent', 'topnav', 'textfield', 'core', 'manager', NULL),
('manager_datetime_empty_value', '—', 'textfield', 'core', 'manager', NULL),
('manager_datetime_separator', ', ', 'textfield', 'core', 'manager', NULL),
('manager_date_format', 'Y-m-d', 'textfield', 'core', 'manager', NULL),
('manager_direction', 'ltr', 'textfield', 'core', 'language', NULL),
('manager_favicon_url', 'favicon.ico', 'textfield', 'core', 'manager', NULL),
('manager_login_url_alternate', '', 'textfield', 'core', 'authentication', NULL),
('manager_logo', '', 'textfield', 'core', 'manager', NULL),
('manager_theme', 'default', 'modx-combo-manager-theme', 'core', 'manager', NULL),
('manager_time_format', 'H:i', 'textfield', 'core', 'manager', NULL),
('manager_tooltip_delay', '2300', 'numberfield', 'core', 'manager', NULL),
('manager_tooltip_enable', '1', 'combo-boolean', 'core', 'manager', NULL),
('manager_use_fullname', '', 'combo-boolean', 'core', 'manager', NULL),
('manager_week_start', '0', 'numberfield', 'core', 'manager', NULL),
('mgr_source_icon', 'icon-folder-open-o', 'textfield', 'core', 'manager', NULL),
('mgr_tree_icon_context', 'tree-context', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_sort', 'name', 'textfield', 'core', 'manager', NULL),
('modx_browser_default_viewmode', 'grid', 'textfield', 'core', 'manager', NULL),
('modx_browser_tree_hide_files', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_browser_tree_hide_tooltips', '1', 'combo-boolean', 'core', 'manager', NULL),
('modx_charset', 'UTF-8', 'modx-combo-charset', 'core', 'language', NULL),
('package_installer_at_top', '1', 'combo-boolean', 'core', 'manager', NULL),
('parser_recurse_uncacheable', '1', 'combo-boolean', 'core', 'system', NULL),
('passwordless_activated', '', 'combo-boolean', 'core', 'authentication', NULL),
('passwordless_expiration', '3600', 'textfield', 'core', 'authentication', NULL),
('password_generated_length', '10', 'numberfield', 'core', 'authentication', NULL),
('password_min_length', '8', 'numberfield', 'core', 'authentication', NULL),
('photo_profile_source', '', 'modx-combo-source', 'core', 'manager', NULL),
('phpthumb_allow_src_above_docroot', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxage', '30', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxfiles', '10000', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_maxsize', '100', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_cache_source_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_document_root', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_bgcolor', 'CCCCFF', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_error_fontsize', '1', 'numberfield', 'core', 'phpthumb', NULL),
('phpthumb_error_textcolor', 'FF0000', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_far', 'C', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_imagemagick_path', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_enabled', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_text_message', 'Off-server thumbnailing is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nohotlink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_enabled', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_erase_image', '1', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_require_refer', '', 'combo-boolean', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_text_message', 'Off-server linking is not allowed', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_valid_domains', '{http_host}', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_nooffsitelink_watermark_src', '', 'textfield', 'core', 'phpthumb', NULL),
('phpthumb_zoomcrop', '0', 'textfield', 'core', 'phpthumb', NULL),
('preserve_menuindex', '', 'combo-boolean', 'core', 'manager', NULL),
('principal_targets', 'MODX\\Revolution\\modAccessContext,MODX\\Revolution\\modAccessResourceGroup,MODX\\Revolution\\modAccessCategory,MODX\\Revolution\\Sources\\modAccessMediaSource,MODX\\Revolution\\modAccessNamespace', 'textfield', 'core', 'authentication', NULL),
('proxy_auth_type', 'BASIC', 'textfield', 'core', 'proxy', NULL),
('proxy_host', '', 'textfield', 'core', 'proxy', NULL),
('proxy_password', '', 'text-password', 'core', 'proxy', NULL),
('proxy_port', '', 'numberfield', 'core', 'proxy', NULL),
('proxy_username', '', 'textfield', 'core', 'proxy', NULL),
('publish_default', '', 'combo-boolean', 'core', 'site', NULL),
('quick_search_in_content', '1', 'combo-boolean', 'core', 'manager', NULL),
('quick_search_result_max', '10', 'numberfield', 'core', 'manager', NULL),
('request_controller', 'index.php', 'textfield', 'core', 'gateway', NULL),
('request_method_strict', '', 'combo-boolean', 'core', 'gateway', NULL),
('request_param_alias', 'q', 'textfield', 'core', 'gateway', NULL),
('request_param_id', 'id', 'textfield', 'core', 'gateway', NULL),
('resource_static_allow_absolute', '0', 'combo-boolean', 'core', 'static_resources', NULL),
('resource_static_path', '{assets_path}', 'textfield', 'core', 'static_resources', NULL),
('resource_tree_node_name', 'pagetitle', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_name_fallback', 'alias', 'textfield', 'core', 'manager', NULL),
('resource_tree_node_tooltip', '', 'textfield', 'core', 'manager', NULL),
('richtext_default', '1', 'combo-boolean', 'core', 'manager', NULL),
('search_default', '1', 'combo-boolean', 'core', 'site', NULL),
('send_poweredby_header', '1', 'combo-boolean', 'core', 'system', '2025-12-22 10:39:41'),
('server_offset_time', '0', 'numberfield', 'core', 'system', NULL),
('session_cookie_domain', '', 'textfield', 'core', 'session', NULL),
('session_cookie_httponly', '1', 'combo-boolean', 'core', 'session', NULL),
('session_cookie_lifetime', '604800', 'numberfield', 'core', 'session', NULL),
('session_cookie_path', '', 'textfield', 'core', 'session', NULL),
('session_cookie_samesite', '', 'textfield', 'core', 'session', NULL),
('session_cookie_secure', '', 'combo-boolean', 'core', 'session', NULL),
('session_gc_maxlifetime', '604800', 'textfield', 'core', 'session', NULL),
('session_handler_class', 'MODX\\Revolution\\modSessionHandler', 'textfield', 'core', 'session', NULL),
('session_name', '', 'textfield', 'core', 'session', NULL),
('settings_distro', 'traditional', 'textfield', 'core', 'system', NULL),
('settings_version', '3.1.2-pl', 'textfield', 'core', 'system', NULL),
('set_header', '1', 'combo-boolean', 'core', 'system', NULL),
('show_tv_categories_header', '1', 'combo-boolean', 'core', 'manager', NULL),
('site_name', 'MODX Revolution', 'textfield', 'core', 'site', NULL),
('site_start', '1', 'numberfield', 'core', 'site', NULL),
('site_status', '1', 'combo-boolean', 'core', 'site', NULL),
('site_unavailable_message', '[[%site_unavailable_message]]', 'textfield', 'core', 'site', NULL),
('site_unavailable_page', '0', 'numberfield', 'core', 'site', NULL),
('static_elements_automate_chunks', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_plugins', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_snippets', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_templates', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_automate_tvs', '', 'combo-boolean', 'core', 'static_elements', NULL),
('static_elements_basepath', '', 'textfield', 'core', 'static_elements', NULL),
('static_elements_default_category', '0', 'modx-combo-category', 'core', 'static_elements', NULL),
('static_elements_default_mediasource', '0', 'modx-combo-source', 'core', 'static_elements', NULL),
('static_elements_html_extension', '.tpl', 'textfield', 'core', 'static_elements', NULL),
('symlink_merge_fields', '1', 'combo-boolean', 'core', 'site', NULL),
('syncsite_default', '1', 'combo-boolean', 'core', 'caching', NULL),
('topmenu_show_descriptions', '1', 'combo-boolean', 'core', 'manager', NULL),
('tree_default_sort', 'menuindex', 'textfield', 'core', 'manager', NULL),
('tree_root_id', '0', 'numberfield', 'core', 'manager', NULL),
('tvs_below_content', '', 'combo-boolean', 'core', 'manager', NULL),
('unauthorized_page', '1', 'numberfield', 'core', 'site', NULL),
('upload_files', 'aac,au,avi,bmp,css,css.map,doc,docx,eot,gif,gz,htm,html,ico,jpeg,jpg,js,js.map,less,md,mp3,mp4,mpeg,mpg,odb,odf,odg,odp,ods,odt,pdf,png,ppt,pptx,psd,rar,scss,svg,svgz,tar,tgz,tiff,ttf,txt,wav,webp,wmv,woff,woff2,xls,xlsx,xml,z,zip', 'textfield', 'core', 'file', NULL),
('upload_file_exists', '1', 'combo-boolean', 'core', 'file', NULL),
('upload_maxsize', '41943040', 'numberfield', 'core', 'file', '2025-12-22 10:39:41'),
('upload_translit', '1', 'combo-boolean', 'core', 'file', NULL),
('upload_translit_restrict_chars_pattern', '/[\\0\\x0B\\t\\n\\r\\f\\a&=+%#<>\"~:`@\\?\\[\\]\\{\\}\\|\\^\'\\\\]/', 'textfield', 'core', 'file', NULL),
('user_nav_parent', 'usernav', 'textfield', 'core', 'manager', NULL),
('use_alias_path', '', 'combo-boolean', 'core', 'furls', NULL),
('use_context_resource_table', '1', 'combo-boolean', 'core', 'caching', NULL),
('use_editor', '1', 'combo-boolean', 'core', 'editor', NULL),
('use_frozen_parent_uris', '', 'combo-boolean', 'core', 'furls', NULL),
('use_multibyte', '1', 'combo-boolean', 'core', 'language', '2025-12-22 10:39:41'),
('use_weblink_target', '', 'combo-boolean', 'core', 'site', NULL),
('welcome_action', 'welcome', 'textfield', 'core', 'manager', NULL),
('welcome_namespace', 'core', 'textfield', 'core', 'manager', NULL),
('welcome_screen', '', 'combo-boolean', 'core', 'manager', '2025-12-22 10:40:05'),
('welcome_screen_url', '//misc.modx.com/revolution/welcome.31.html', 'textfield', 'core', 'manager', NULL),
('which_editor', '', 'modx-combo-rte', 'core', 'editor', NULL),
('which_element_editor', '', 'modx-combo-rte', 'core', 'editor', NULL),
('xhtml_urls', '1', 'combo-boolean', 'core', 'site', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modx_transport_packages`
--

CREATE TABLE `modx_transport_packages` (
  `signature` varchar(191) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `installed` datetime DEFAULT NULL,
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `workspace` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `provider` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `disabled` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `source` tinytext DEFAULT NULL,
  `manifest` text DEFAULT NULL,
  `attributes` mediumtext DEFAULT NULL,
  `package_name` varchar(191) NOT NULL,
  `metadata` text DEFAULT NULL,
  `version_major` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `version_minor` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `version_patch` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `release` varchar(100) NOT NULL DEFAULT '',
  `release_index` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_transport_providers`
--

CREATE TABLE `modx_transport_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `service_url` tinytext DEFAULT NULL,
  `username` varchar(191) NOT NULL DEFAULT '',
  `api_key` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `priority` tinyint(4) NOT NULL DEFAULT 10,
  `properties` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_transport_providers`
--

INSERT INTO `modx_transport_providers` (`id`, `name`, `description`, `service_url`, `username`, `api_key`, `created`, `updated`, `active`, `priority`, `properties`) VALUES
(1, 'modx.com', 'The official MODX transport provider for 3rd party components.', 'https://rest.modx.com/extras/', '', '', '2025-04-02 10:20:59', NULL, 1, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `modx_users`
--

CREATE TABLE `modx_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `cachepwd` varchar(255) NOT NULL DEFAULT '',
  `class_key` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\modUser',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `remote_key` varchar(191) DEFAULT NULL,
  `remote_data` text DEFAULT NULL,
  `hash_class` varchar(100) NOT NULL DEFAULT 'MODX\\Revolution\\Hashing\\modNative',
  `salt` varchar(100) NOT NULL DEFAULT '',
  `primary_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session_stale` text DEFAULT NULL,
  `sudo` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `createdon` int(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_users`
--

INSERT INTO `modx_users` (`id`, `username`, `password`, `cachepwd`, `class_key`, `active`, `remote_key`, `remote_data`, `hash_class`, `salt`, `primary_group`, `session_stale`, `sudo`, `createdon`) VALUES
(1, 'admin', '$2y$10$5mvGQdo40j2ZWwrMGdctOeM7/9MfjAW14Cr9L5Y3RiBlY/HTB.uRy', '', 'MODX\\Revolution\\modUser', 1, NULL, NULL, 'MODX\\Revolution\\Hashing\\modNative', '74eeae3e2ac75e85d9d68c6a09b96c5d', 1, NULL, 1, 1776410070);

-- --------------------------------------------------------

--
-- Table structure for table `modx_user_attributes`
--

CREATE TABLE `modx_user_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `internalKey` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `blockeduntil` int(11) NOT NULL DEFAULT 0,
  `blockedafter` int(11) NOT NULL DEFAULT 0,
  `logincount` int(11) NOT NULL DEFAULT 0,
  `lastlogin` int(11) NOT NULL DEFAULT 0,
  `thislogin` int(11) NOT NULL DEFAULT 0,
  `failedlogincount` int(11) NOT NULL DEFAULT 0,
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(11) NOT NULL DEFAULT 0,
  `gender` tinyint(1) NOT NULL DEFAULT 0,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `website` varchar(255) NOT NULL DEFAULT '',
  `extended` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `address`, `country`, `city`, `state`, `zip`, `fax`, `photo`, `comment`, `website`, `extended`) VALUES
(1, 1, 'Default Admin User', 'navodyadivyanjali2@gmail.com', '', '', 0, 0, 0, 17, 1777012434, 1777013958, 0, '', 0, 0, '', '', '', '', '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modx_user_group_roles`
--

CREATE TABLE `modx_user_group_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `authority` int(10) UNSIGNED NOT NULL DEFAULT 9999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_user_group_roles`
--

INSERT INTO `modx_user_group_roles` (`id`, `name`, `description`, `authority`) VALUES
(1, 'Member', NULL, 9999),
(2, 'Super User', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `modx_user_group_settings`
--

CREATE TABLE `modx_user_group_settings` (
  `group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_user_messages`
--

CREATE TABLE `modx_user_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `recipient` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `date_sent` datetime DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_user_settings`
--

CREATE TABLE `modx_user_settings` (
  `user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `xtype` varchar(75) NOT NULL DEFAULT 'textfield',
  `namespace` varchar(40) NOT NULL DEFAULT 'core',
  `area` varchar(255) NOT NULL DEFAULT '',
  `editedon` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modx_workspaces`
--

CREATE TABLE `modx_workspaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `path` varchar(191) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `attributes` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modx_workspaces`
--

INSERT INTO `modx_workspaces` (`id`, `name`, `path`, `created`, `active`, `attributes`) VALUES
(1, 'Default MODX workspace', '{core_path}', '2025-12-22 11:38:58', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts`
--

CREATE TABLE `payment_receipts` (
  `id` int(11) NOT NULL,
  `reserved_slot_id` int(11) NOT NULL,
  `receipt_no` varchar(50) NOT NULL,
  `receipt_path` text DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'Paid Fully',
  `generated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `generated_by` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `vehicle_number` varchar(100) DEFAULT NULL,
  `parking_location` varchar(100) DEFAULT NULL,
  `expected_parking_duration` text DEFAULT NULL,
  `real_arrived_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `previous_bookings`
--

CREATE TABLE `previous_bookings` (
  `id` int(11) NOT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `price_per_day` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `previous_bookings`
--

INSERT INTO `previous_bookings` (`id`, `vehicle_type`, `start_date`, `end_date`, `name`, `whatsapp_number`, `days`, `price_per_day`, `total_price`) VALUES
(1, 'Suzuki Maruti', '02.01.2025', '05.01.2025', 'Mr Denuwan Kawshalya', '5132937274', 3, 1000.00, 4000.00),
(2, '', '02.01.2025', '06.01.2025', 'Mr Chathura Senarathna', '773112207', 5, 1000.00, 5500.00),
(3, '', '02.01.2025', '06.01.2025', 'Mr Chathura Senarathna', '773112207', 5, 1000.00, 4500.00),
(4, 'Suzuki Every', '05.01.2026', '11.01.2026', 'Mr Mohomad Raazik', '778844877', 6, 1000.00, 7000.00),
(5, 'Honda Vezel', '06.01.2026', '15.01.2026', 'Mr Achuthan Sivasubramanium', '713691024', 9, 1000.00, 10000.00),
(6, 'Honda Vezel', '06.01.2026', '11.01.2026', 'Mr Chaminda Pradeep Kumara', '702235297', 5, 1000.00, 6000.00),
(7, 'MG', '07.01.2026', '10.01.2026', 'Mr Nooditha Charith', '778797479', 4, 1000.00, 4500.00),
(8, 'Honda Freed', '10.01.2026', '14.01.2026', 'Ms Thilani S Dilrukshi', '778777188', 4, 1000.00, 5000.00),
(9, 'Toyota Alllion', '11.01.2026', '15.01.2026', 'Mr Buddika Dinuwan', '767343936', 4, 1000.00, 5000.00),
(10, 'BYD Sealion 6', '12.01.2026', '27.01.2026', 'Mrs Surangi Bullivant', '775585282', 15, 1000.00, 16000.00),
(11, 'Toyota Axio', '13.01.2026', '19.01.2026', 'Mr Devapiran Muthukrishnan', '759324811', 7, 1000.00, 7500.00),
(12, 'Toyota Prius', '13.01.2026', '16.01.2026', 'Mr Kasun Dilantha', '716155188', 3, 1000.00, 4000.00),
(13, 'Suzuki Wagon R', '14.01.2026', '17.01.2026', 'Mr Viraj Heenatigedara', '763525555', 3, 1000.00, 4000.00),
(14, 'KUV 100', '15.01.2026', '21.01.2026', 'Mr Shehan Eeral Gunawardhana', '768633717', 6, 1000.00, 7000.00),
(15, 'Toyota Vitz', '15.01.2026', '20.01.2026', 'Mr Thilina Perawaththa', '717256235', 6, 1000.00, 6500.00),
(16, 'Toyota Vitz', '18.01.2026', '20.01.2026', 'Mr Danura Santhush Silva', '765709218', 2, 1000.00, 3000.00),
(17, 'Mercedes Benz E Class', '18.01.2026', '19.01.2026', 'Mr Sumithra Fernando', '777722958', 2, 1000.00, 2500.00),
(18, 'Honda Fit', '19.01.2026', '23.01.2026', 'Mr Sebamalai Pathirana', '774498857', 4, 1000.00, 5000.00),
(19, 'Perodua Ativa', '23.01.2026', '25.01.2026', 'Mr Prabath Priyankara', '716499138', 3, 1000.00, 3500.00),
(20, 'Toyota 250', '23.01.2026', '28.01.2026', 'Mr Priyantha Wikumsiri', '712260700', 5, 1000.00, 6000.00),
(21, 'Toyota Axio', '23.01.2026', '25.01.2026', 'Mr Devapiran Muthukrishnan', '759324811', 3, 1000.00, 3500.00),
(22, 'Japan Alto', '24.12.2025', '30.12.2025', 'Ariyarathna Herath', '771303449', 6, 1000.00, 7000.00),
(23, 'BYD Atto3', '27.01.2026', '07.02.2026', 'Mr Upul Liyanage', '777552055', 11, 1000.00, 12000.00),
(24, 'Toyota Prius', '28.01.2026', '31.01.2026', 'Mr Chathuranga Neththikumara', '775992063', 4, 1000.00, 4500.00),
(25, 'Renault Kwid', '28.01.2026', '01.02.2026', 'Mr Dilan Wijesinghe', '773476848', 5, 1000.00, 5500.00),
(26, 'Honda Fit Shuttle', '28.01.2026', '01.02.2026', 'Mr Arutselvan Arumugam', '727644644', 5, 1000.00, 5000.00),
(27, 'Honda Vezel', '29.01.2026', '04.02.2026', 'Mr Mohomad Zeemath', '754640451', 6, 1000.00, 7000.00),
(28, 'Mitsubishi Double Cab', '30.01.2026', '06.02.2026', 'Mr Thushan Amarasena', '775732965', 8, 1000.00, 9000.00),
(29, 'BYD', '01.02.2026', '05.02.2026', 'Mr Ajith Rohana Wijesundara', '777303467', 5, 1000.00, 6000.00),
(30, 'Honda Vezel', '01.02.2026', '06.02.2026', 'Mr Kauzer Niyazi', '740110224', 6, 1000.00, 4500.00),
(31, 'Suzuki Wagon R', '01.02.2026', '04.02.2026', 'Mr Rantha Nileeshan', '773946088', 4, 1000.00, 6500.00),
(32, 'Benz', '02.02.2026', '07.02.2026', 'Mr Dulip Leroy', '712443242', 6, 1000.00, 8000.00),
(33, 'Toyota Harier', '02.02.2026', '09.02.2026', 'Mrs Manjula Sandamali Senanayake', '718683030', 7, 1000.00, 2500.00),
(34, 'Toyota Tank', '03.02.2026', '04.02.2026', 'Mr T Kishokumar', '778383894', 2, 1000.00, 6000.00),
(35, 'Toyota Taisor', '03.02.2026', '08.02.2026', 'Ms Amoda Dewanmini', '777103969', 5, 1000.00, 12000.00),
(36, 'Toyota Axio', '04.02.2026', '15.02.2026', 'Dr D M A Fernando', '740519595', 11, 1000.00, 2500.00),
(37, 'Honda Vezel', '04.02.2026', '06.02.2026', 'Mr Devapiran Muthukrishnan', '759324811', 2, 1000.00, 6500.00),
(38, 'Hyundai Tucson', '05.02.2026', '11.02.2026', 'Mr Aruna Samantha', '740242948', 6, 1000.00, 11500.00),
(39, 'Nissan Clipper', '05.02.2026', '15.02.2026', 'Mr Joe Rathnayake', '771761294', 11, 1000.00, 6000.00),
(40, 'Suzuki Wagon R', '06.02.2026', '11.02.2026', 'Mr Fazran Mulaffer', '779221223', 5, 1000.00, 5000.00),
(41, 'Renault Kwid', '06.02.2026', '10.02.2026', 'Mr Dhanushka Bandara Herath', '713485124', 4, 1000.00, 4000.00),
(42, 'Toyota Allion', '06.02.2026', '09.02.2026', 'Mr Hanifa Alfahath', '717596577', 3, 1000.00, 2000.00),
(43, 'Suzuki Alto', '07.02.2026', '08.02.2026', 'Mr Kumudu Sampath', '773431453', 2, 1000.00, 8500.00),
(44, 'Suzuki Suzuki', '07.02.2026', '14.07.2026', 'Mr Kevin Bruno', '33767979616', 8, 1000.00, 8500.00),
(45, 'Toyota Yaris', '08.02.2026', '15.02.2026', 'Mr Shifan Muhammadu', '777842521', 8, 1000.00, 4000.00),
(46, 'Honda Freed', '08.02.2026', '11.02.2026', 'Mr Samith Nandana Premasiri', '775536595', 3, 1000.00, 4000.00),
(47, 'Suzuki Alto', '08.02.2026', '11.02.2026', 'Ms Thilani S Dilrukshi', '775536595', 3, 1000.00, 3000.00),
(48, 'Nissan Quashcai', '09.02.2026', '11.02.2026', 'Mr Janaka Sanjeewa Weerasooriya', '743361768', 2, 1000.00, 5000.00),
(49, 'Daihatsu Terios', '09.02.2026', '13.02.2026', 'Dr Gamini Jayakody', '714429792', 4, 1000.00, 12500.00),
(50, 'Suzuki Wagon R', '10.02.2026', '21.02.2026', 'Mr George Lawrance', '717364491', 12, 1000.00, 5500.00),
(51, 'Honda Inbox', '12.02.2026', '16.02.2026', 'Mr Mohomad Imran', '773974008', 5, 1000.00, 3500.00),
(52, 'Toyota Aqua', '12.02.2026', '15.02.2026', 'Mr Nashan Mohomad', '741665336', 4, 1000.00, 4500.00),
(53, 'Suzuki Solio Bandit', '12.02.2026', '15.02.2026', 'Mr Anuradha Sanjeewa Jayasena', '766112184', 4, 1000.00, 4500.00),
(54, 'Suzuki Wagon R', '12.02.2026', '15.02.2026', 'Mr Mohomad Surfaraaz', '777637918', 4, 1000.00, 5500.00),
(55, 'Suzuki Swift', '13.02.2026', '17.02.2026', 'Mr Ravi Sindhujan', '713205088', 5, 1000.00, 10000.00),
(56, 'Toyota Aqua', '13.02.2026', '19.02.2026', 'Mr Dmitrii Malashchitskii', '79169341144', 9, 1000.00, 6000.00),
(57, 'Toyota CHR', '13.02.2026', '19.02.2026', 'Mr Nilanga Wijerathna', '771436443', 5, 1000.00, 5000.00),
(58, 'Suzuki Fronx', '14.02.2026', '18.02.2026', 'Mr Kapila Eranda Saman', '711795791', 4, 1000.00, 6000.00),
(59, 'Suzuki Wagon R', '15.02.2026', '22.02.2026', 'Mr Tharindu Kanchana Bandara', '741937619', 5, 1000.00, 10500.00),
(60, 'Toyota Prius', '15.02.2026', '24.02.2026', 'Mr Sergei', '00 79261249879', 10, 1000.00, 4000.00),
(61, 'Toyota Fortuner', '17.02.2026', '20.02.2026', 'Mr Kasun Dilantha', '716155188', 3, 1000.00, 2500.00),
(62, 'BYD', '19.02.2026', '20.02.2026', 'Mr Asanga Loku Kodikara Arachchige', '39 3384926058', 2, 1000.00, 3500.00),
(63, 'Toyota Axio', '19.02.2026', '21.02.2026', 'Mr Sanjeewa Sampath', '766454555', 3, 1000.00, 5500.00),
(64, 'BYD Sealion 6', '20.02.2026', '24.02.2026', 'Mr Devapiran Muthukrishnan', '759324811', 5, 1000.00, 7000.00),
(65, 'Daihatsu Charade', '22.02.2026', '28.02.2026', 'Mr Prabath Pathirana', '777747247', 6, 1000.00, 6000.00),
(66, 'Toyota Roomy', '24.02.2026', '01.03.2026', 'Mr Anushanka Saubhagya', '775808312', 5, 1000.00, 3500.00),
(67, 'Suzuki Swift', '25.02.2026', '27.02.2026', 'Mr Dinesh Ukuwela', '714146868', 3, 1000.00, 6000.00),
(68, 'Toyota Aqua', '26.02.2026', '03.03.2026', 'Mr Ashan Alwis', '772409301', 5, 1000.00, 5000.00),
(69, 'Cherry QQ', '26.02.2026', '02.03.2026', 'Mrs Nethma Mahesha', '769367576', 4, 1000.00, 4500.00),
(70, 'Honda Vezel', '27.02.2026', '02.03.2026', 'Mr Nilantha Roshan Abeysinghe', '775137802', 4, 1000.00, 3000.00),
(71, 'Honda Vezel', '28.02.2026', '02.03.2026', 'Mrs Chaushalya De Silva', '773330719', 2, 1000.00, 3000.00);

-- --------------------------------------------------------

--
-- Table structure for table `reserved_slots`
--

CREATE TABLE `reserved_slots` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_number` varchar(255) NOT NULL,
  `vehicle_number` varchar(255) NOT NULL,
  `slot_number` varchar(10) NOT NULL,
  `vehicle_type` enum('car','van','bus') NOT NULL,
  `hometown` varchar(100) NOT NULL,
  `flight_number` varchar(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `whatsapp_number` varchar(20) NOT NULL,
  `days` float UNSIGNED NOT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `extra_services` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `pdf_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `booking_type` enum('direct booking','website') NOT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `meter_reading` int(11) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_trashed` tinyint(1) NOT NULL DEFAULT 0,
  `receiver_name` varchar(150) NOT NULL,
  `air_ticket_image_url` longtext NOT NULL,
  `passport_copy_image_url` longtext NOT NULL,
  `passenger_count` int(11) DEFAULT NULL,
  `end_date_edited` datetime DEFAULT NULL,
  `late_fee_percent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `total_price_final` decimal(12,2) DEFAULT NULL,
  `late_fee_amount` decimal(12,2) DEFAULT NULL,
  `end_date_edit_reason` varchar(255) DEFAULT NULL,
  `end_date_edited_at` datetime DEFAULT NULL,
  `end_date_edited_by` varchar(255) DEFAULT NULL,
  `status` enum('pending','send_to_finance','accepted','') NOT NULL DEFAULT 'pending',
  `is_no_show` tinyint(1) NOT NULL DEFAULT 0,
  `no_show_reason` text DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_updated_by` int(11) DEFAULT NULL,
  `vehicle_status` enum('pending','completed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserved_slots`
--

INSERT INTO `reserved_slots` (`id`, `reference_number`, `vehicle_number`, `slot_number`, `vehicle_type`, `hometown`, `flight_number`, `start_date`, `end_date`, `name`, `email`, `whatsapp_number`, `days`, `price_per_day`, `total_price`, `extra_services`, `pdf_path`, `created_at`, `updated_at`, `booking_type`, `created_by`, `remarks`, `meter_reading`, `images`, `is_trashed`, `receiver_name`, `air_ticket_image_url`, `passport_copy_image_url`, `passenger_count`, `end_date_edited`, `late_fee_percent`, `total_price_final`, `late_fee_amount`, `end_date_edit_reason`, `end_date_edited_at`, `end_date_edited_by`, `status`, `is_no_show`, `no_show_reason`, `payment_status`, `payment_updated_by`, `vehicle_status`) VALUES
(6, 'D3-AP-01', '', 'D3', 'car', 'Piliyandala', 'MH178', '2026-01-15 00:00:00', '2026-01-18 00:00:00', 'Charitha priyangani', 'madhu940303@gmail.con', '0713459676', 4, 1000.00, 4000.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_D3-AP-01.pdf', '2026-01-13 03:32:18', '2026-01-13 03:32:19', 'website', 'system', '', NULL, NULL, 0, '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(8, 'F1-AP-01', '', 'F1', 'car', 'Kandy', 'G9503', '2026-01-18 00:00:00', '2026-01-28 00:00:00', 'M.Riyazi', 'mamriyazi@gmail.com', '0777258131', 11, 1000.00, 11000.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_F1-AP-01.pdf', '2026-01-14 15:27:40', '2026-01-14 15:27:41', 'website', 'system', '', NULL, NULL, 0, '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(9, 'E1-AP-01', '', 'E1', 'car', 'Colombo ', '6E 1180', '2026-01-15 00:00:00', '2026-01-17 00:00:00', 'Shifnas ', 'shifnasrock@gmail.com', '0775635777', 3, 1000.00, 4000.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_E1-AP-01.pdf', '2026-01-14 17:47:43', '2026-01-14 17:47:43', 'website', 'system', '', NULL, NULL, 0, '', '', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(15, 'D3-AP-02', '', 'D3', 'car', 'Panadura', 'GF145', '2026-01-24 13:00:00', '2026-01-26 19:00:00', 'Prashan Jayasundera', 'prashan83338@gmail.com', '61410388383', 2.25, 1000.00, 3250.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_D3-AP-02.pdf', '2026-01-22 04:38:32', '2026-01-22 04:38:34', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/6971a9c80bbf1.png', 'https://www.airportparking.lk//uploads/6971a9c82a69c.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(16, 'F4-AP-01', '', 'F4', 'van', 'Homagama', 'FD 143, FD 140', '2026-01-30 00:05:00', '2026-02-06 23:00:00', 'Thushan Amarasena', 'thushan.amarasena@gmail.com', '94775732965', 7.34, 1000.00, 7343.75, '', '/home/airpor26/public_html/assets/invoices/Invoice_F4-AP-01.pdf', '2026-01-22 15:19:17', '2026-01-30 10:32:59', 'website', 'system', '', 0, '[]', 0, '', 'https://www.airportparking.lk//uploads/69723ff32a9e4.jpg', 'https://www.airportparking.lk//uploads/69723ff3805e8.jpg', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(17, 'A2-AP-01', '', 'A2', 'car', 'Kandy', 'AI2275', '2026-01-28 06:00:00', '2026-01-31 16:00:00', 'Chathuranga Neththikumara', 'chathuranganeththikumara@hotmail.com', '94775992063', 3.42, 1000.00, 4416.67, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_A2-AP-01.pdf', '2026-01-26 01:00:50', '2026-01-26 01:00:52', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/6976bcc1c2157.jpeg', 'https://www.airportparking.lk//uploads/6976bcc21ecfb.jpeg', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(19, 'A7-AP-01', '', 'A7', 'car', 'Thalawathugoda', 'Ul181', '2026-02-11 15:25:00', '2026-02-15 15:25:00', 'Bathiya', 'bpr@gmail.com', '0713660275', 4, 1000.00, 5000.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_A7-AP-01.pdf', '2026-01-30 09:57:24', '2026-01-30 09:57:25', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/697c808427538.jpeg', 'https://www.airportparking.lk//uploads/697c808427791.jpeg', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(20, 'B3-AP-01', '', 'B3', 'car', 'POLONNARUWA', 'G9503', '2026-02-08 13:11:00', '2026-02-16 13:11:00', 'DILMI METHSALA', 'SVSTHUSHAN@GMAIL.COM', '94775106476', 8, 1000.00, 8000.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_B3-AP-01.pdf', '2026-02-01 09:18:09', '2026-02-01 09:18:10', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/697f1a5081ed9.jpeg', 'https://www.airportparking.lk//uploads/697f1a50abcab.jpeg', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(22, 'B3-AP-02', '', 'B3', 'car', 'Kandy ', 'EK 2148', '2026-02-12 14:00:00', '2026-02-15 23:00:00', 'BHA Sanjeewa Jayasena ', 'sabhewage@gmail.com', '0766112184', 3.38, 1000.00, 3375.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_B3-AP-02.pdf', '2026-02-12 01:14:42', '2026-02-12 01:14:43', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/698d297fcb8da.png', 'https://www.airportparking.lk//uploads/698d298088f7f.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(23, 'B3-AP-03', '', 'B3', 'car', 'Kandy ', 'EK 2148', '2026-02-12 14:00:00', '2026-02-15 23:00:00', 'B bc A Sanjeewa Jayasena ', 'sabhewage@gmail.com', '0766112184', 3.38, 1000.00, 4375.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_B3-AP-03.pdf', '2026-02-12 01:19:01', '2026-02-12 01:19:01', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/698d2a82d7e8e.png', 'https://www.airportparking.lk//uploads/698d2a837b8b8.png', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(24, 'C5-AP-01', '', 'C5', 'car', 'weligama', 'GF145', '2026-02-15 08:00:00', '2026-02-24 18:00:00', 'Sergei', '1249879@gmail.com', '79261249879', 9.42, 1000.00, 10417.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_C5-AP-01.pdf', '2026-02-14 16:38:03', '2026-02-14 16:38:04', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/6990a4ead252a.jpeg', 'https://airportparking.lk//uploads/6990a4ead268b.jpeg', 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(26, 'C8-AP-01', '', 'C8', 'car', 'Colombo ', 'UL308,307', '2026-02-26 09:00:00', '2026-03-02 12:00:00', 'Nethma Maheesha', 'nethmamaheesha9344@gmail.com', '769367576', 4.13, 1000.00, 5125.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_C8-AP-01.pdf', '2026-02-21 03:51:19', '2026-02-21 03:51:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69992bb6178a7.jpg', 'https://www.airportparking.lk//uploads/69992bb6b8c24.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(27, 'F1-AP-02', '', 'F1', 'car', 'Kandy', 'UL318', '2026-02-22 21:30:00', '2026-02-28 17:30:00', 'Prabath Pathirana ', 'Acc@live.co.uk', '0777747247', 5.83, 1000.00, 6833.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_F1-AP-02.pdf', '2026-02-22 12:09:02', '2026-02-22 12:09:03', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/699af1dc26207.png', 'https://airportparking.lk//uploads/699af1ddab2a4.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(28, 'D4-AP-01', '', 'D4', 'car', 'Piliyandala', 'UL119', '2026-03-28 12:20:00', '2026-03-31 17:00:00', 'Nuwan Abeysekara', 'abeynu@hotmail.com', '0772893030', 3.19, 1000.00, 4194.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_D4-AP-01.pdf', '2026-02-25 10:12:08', '2026-02-25 10:12:09', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/699ecaf8d62c4.pdf', 'https://www.airportparking.lk//uploads/699ecaf8d63e9.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(29, 'C5-AP-02', '', 'C5', 'car', 'Pannipitiya', 'FD143', '2026-03-12 23:00:00', '2026-03-16 23:30:00', 'Danusha Randimal Gunasekara', 'choypch@gmail.com', '713274400', 4.02, 1000.00, 5021.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_C5-AP-02.pdf', '2026-02-27 04:39:48', '2026-02-27 04:39:50', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a120145c4d6.pdf', 'https://www.airportparking.lk//uploads/69a120145c79f.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(30, 'F4-AP-02', '', 'F4', 'car', 'Welimada', 'AK46', '2026-04-15 18:30:00', '2026-04-20 22:30:00', 'Limal Silva', 'limalsachintha96@gmail.com', '94703108912', 5.17, 1000.00, 5167.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_F4-AP-02.pdf', '2026-02-28 03:16:38', '2026-02-28 03:16:39', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a25e16689dd.PNG', 'https://www.airportparking.lk//uploads/69a25e1668af6.jpeg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(31, 'F7-AP-01', '', 'F7', 'van', 'Welimada', 'AK46', '2026-04-15 19:30:00', '2026-04-20 22:30:00', 'Shalitha', 'limalsachintha96@gmail.com', '94703108912', 5.13, 1000.00, 5125.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_F7-AP-01.pdf', '2026-02-28 03:20:01', '2026-02-28 03:20:01', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a25ee174631.PNG', 'https://www.airportparking.lk//uploads/69a25ee17474e.jpeg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(32, 'F6-AP-01', '', 'F6', 'car', 'Welimada', 'AK46', '2026-04-15 19:30:00', '2026-04-20 22:30:00', 'Isiwara', 'limalsachintha96@gmail.com', '94703108912', 5.13, 1000.00, 6125.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_F6-AP-01.pdf', '2026-02-28 03:22:20', '2026-02-28 03:22:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a25f6cb9658.PNG', 'https://www.airportparking.lk//uploads/69a25f6cb97a7.jpeg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(33, 'E3-AP-01', '', 'E3', 'car', 'Dehiwala', 'sq463', '2026-03-05 10:00:00', '2026-03-10 23:00:00', 'Ranjith Tissera', 'rtissera@hotmail.com', '94772487000', 5.54, 1000.00, 5542.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_E3-AP-01.pdf', '2026-03-02 08:57:05', '2026-03-02 08:57:06', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a550e114d0d.jpg', 'https://www.airportparking.lk//uploads/69a550e114ebc.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(34, 'A2-AP-02', '', 'A2', 'car', 'Sri Lanka piliyandala', 'UL121', '2026-04-27 05:24:00', '2026-04-29 22:00:00', 'Inham ifthikar ', 'Inhamift@gmail.com', '94777358015', 2.69, 1000.00, 2692.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_A2-AP-02.pdf', '2026-03-03 00:03:16', '2026-03-03 00:03:18', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69a62543a7191.jpeg', 'https://www.airportparking.lk//uploads/69a6254418cd9.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(35, 'E1-AP-02', '', 'E1', 'car', 'matara', 'SQ469', '2026-03-09 21:00:00', '2026-03-14 00:00:00', 'Isuru Chamin', 'isuru.chamin@gmail.com', '0711218854', 4.13, 1000.00, 5125.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_E1-AP-02.pdf', '2026-03-07 05:09:32', '2026-03-07 05:09:34', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69abb30cd7a93.png', 'https://www.airportparking.lk//uploads/69abb30cd7d03.jpeg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(36, 'B3-AP-04', '', 'B3', 'van', 'Kandy ', 'SQ469', '2026-03-09 20:00:00', '2026-03-15 01:35:00', 'Ruchira Wattetenne', 'ruchiwatt@gmail.com', '94770413572', 5.23, 1000.00, 6233.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_B3-AP-04.pdf', '2026-03-08 16:09:25', '2026-03-08 16:09:27', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69ad9f33592d0.jpg', 'https://www.airportparking.lk//uploads/69ad9f34f25f2.jpeg', 7, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(37, 'C8-AP-02', '', 'C8', 'car', 'Mannar', 'UL 127', '2026-03-11 11:00:00', '2026-03-23 11:30:00', 'Vivin Mexson', 'mexsonvivin@gmail.com', '94763966679', 12.02, 1000.00, 12021.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_C8-AP-02.pdf', '2026-03-09 18:23:10', '2026-03-09 18:23:11', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69af100e0475a.jpeg', 'https://www.airportparking.lk//uploads/69af100e049be.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(38, 'D4-AP-02', '', 'D4', 'car', 'Kurunegala', 'UL 173', '2026-03-10 21:30:00', '2026-03-13 13:00:00', 'Dulain Bandara', 'bandaradulain@gmail.com', '94743700602', 2.65, 1000.00, 2646.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_D4-AP-02.pdf', '2026-03-10 07:58:46', '2026-03-10 07:58:47', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69afcf363dd24.jpeg', 'https://www.airportparking.lk//uploads/69afcf363defe.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(39, 'C4-AP-01', '', 'C4', 'car', 'Kurunegala', 'AK44', '2026-03-24 06:00:00', '2026-03-31 11:00:00', 'W.M. Jeewantha Priyadarshana', 'jeewantha68@yahoo.com', '94772834327', 7.21, 1000.00, 8208.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_C4-AP-01.pdf', '2026-03-10 14:24:13', '2026-03-10 14:24:13', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69b0298baa6db.pdf', 'https://www.airportparking.lk//uploads/69b0298bce6d7.pdf', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(40, 'A3-AP-01', '', 'A3', 'car', 'nittambuwa', '6E 1172 . A321', '2026-03-15 01:00:00', '2026-03-17 17:00:00', 'udayanga karunathilaka', 'udayanga0513@gmail.com', '0719984065', 2.67, 1000.00, 2667.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_A3-AP-01.pdf', '2026-03-11 13:20:37', '2026-03-12 10:33:42', 'website', 'system', '', 0, '[]', 0, '', 'https://www.airportparking.lk//uploads/69b16c25e9feb.pdf', 'https://www.airportparking.lk//uploads/69b16c25ea18b.jpeg', 3, '2026-03-17 17:00:00', 0, 2667.00, 0.00, NULL, '2026-03-12 10:33:42', NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(41, 'A6-AP-02', '', 'A6', 'car', 'Matara', '618-2472215984', '2026-03-28 20:00:00', '2026-03-31 23:59:00', 'T Wijesekara', 'thambaru@gmail.com', '94715987191', 3.17, 1000.00, 4166.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_A6-AP-02.pdf', '2026-03-15 02:09:19', '2026-03-15 02:09:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69b614ce7d142.jpg', 'https://www.airportparking.lk//uploads/69b614cea1cf6.jpg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(42, 'B3-AP-05', '', 'B3', 'car', 'Dehiwala', 'UL402', '2026-03-18 22:30:00', '2026-03-23 16:30:00', 'Ranjith Tissera', 'rtissera@hotmail.com', '94772487000', 4.75, 1000.00, 5750.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_B3-AP-05.pdf', '2026-03-16 10:26:09', '2026-03-16 10:26:11', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69b7dac17050b.pdf', 'https://www.airportparking.lk//uploads/69b7dac174a9b.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(43, 'B4-AP-01', '', 'B4', 'car', 'Kelaniya', 'AK46', '2026-03-22 19:30:00', '2026-03-27 23:00:00', 'Dushshantha', 'dwijekoon22@gmail.com', '94717222240', 5.15, 1000.00, 6146.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_B4-AP-01.pdf', '2026-03-17 05:12:53', '2026-03-17 05:12:54', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69b8e2d514214.pdf', 'https://www.airportparking.lk//uploads/69b8e2d514540.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(44, 'E1-AP-03', '', 'E1', 'car', 'MORATUWA', 'FD141', '2026-04-23 19:30:00', '2026-04-30 23:45:00', 'SUJEEWA PEIRIS', 'sujeewakpeiris@gmail.com', '0777365862', 7.18, 1000.00, 8177.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_E1-AP-03.pdf', '2026-03-20 06:51:19', '2026-03-20 06:51:21', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69bcee67441d9.pdf', 'https://airportparking.lk//uploads/69bcee6744441.JPG', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(45, 'E1-AP-04', '', 'E1', 'car', 'Yattogoda', 'FD141', '2026-03-24 20:00:00', '2026-03-30 23:30:00', 'Bimsara Rathnayaka', 'bimsararathnayaka7@gmail.com', '94713152568', 6.15, 1000.00, 7146.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_E1-AP-04.pdf', '2026-03-20 10:33:09', '2026-03-20 10:33:09', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69bd22658010e.jpeg', 'https://www.airportparking.lk//uploads/69bd2265802a5.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(46, 'E2-AP-01', '', 'E2', 'car', 'Panadura', 'NJB67R', '2026-03-31 16:00:00', '2026-04-05 12:00:00', 'W.A.S.R.Kumar', 'rwa.cmb@gmail.com', '0777234264', 4.83, 1000.00, 5833.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_E2-AP-01.pdf', '2026-03-20 15:40:08', '2026-03-20 15:40:08', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69bd6a5772d01.pdf', 'https://airportparking.lk//uploads/69bd6a584b9f9.pdf', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(47, 'F4-AP-03', '', 'F4', 'car', 'Colombo', 'FD141', '2026-03-24 21:00:00', '2026-03-30 23:30:00', 'Renato Dominik Fernando Kumin', 'renatokuemin@mac.com', '94770062967', 6.1, 1000.00, 7104.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_F4-AP-03.pdf', '2026-03-21 09:09:57', '2026-03-21 09:09:58', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69be60653ce7c.png', 'https://airportparking.lk//uploads/69be60653d08d.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(48, 'C1-AP-01', '', 'C1', 'car', 'Kandy', 'MH 178', '2026-04-05 19:00:00', '2026-04-10 23:55:00', 'Upul', 'upulkumara4455@gmail.com', '0773558123', 5.2, 1000.00, 6205.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_C1-AP-01.pdf', '2026-03-22 01:55:50', '2026-03-22 01:55:52', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69bf4c257d892.jpg', 'https://www.airportparking.lk//uploads/69bf4c2643c06.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(50, 'G8-AP-01', '', 'G8', 'car', 'Jayawardenepura', 'CA 426', '2026-03-27 19:30:00', '2026-04-01 09:00:00', 'Eranga Darshana', 'lakshitha6812@gmail.com', '0774548001', 4.56, 1000.00, 5563.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-01.pdf', '2026-03-26 11:25:53', '2026-03-26 11:25:54', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69c517bf95391.pdf', 'https://airportparking.lk//uploads/69c517c0d742d.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(51, 'G2-AP-01', '', 'G2', 'car', 'Colombo', 'CBO 2008', '2026-04-08 05:00:00', '2026-04-13 04:00:00', 'Patric Rukshan', 'lakshitha6812@gmail.com', '0719434243', 4.96, 1000.00, 5958.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-01.pdf', '2026-03-27 04:08:49', '2026-03-27 04:08:50', 'website', '16', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69c602d15a8d6.jpeg', 'https://airportparking.lk//uploads/69c602d15ab5e.jpeg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(52, 'G5-AP-01', '', 'G5', 'car', 'Horana', '8D921', '2026-03-28 04:00:00', '2026-03-29 13:00:00', 'Tharindu Gunathunga', 'thariduke12@gmail.com', '94712327329', 1.38, 1000.00, 2375.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-01.pdf', '2026-03-27 14:53:43', '2026-03-27 14:53:43', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69c699f7bc013.jpg', 'https://www.airportparking.lk//uploads/69c699f7bc281.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(53, 'G1-AP-01', '', 'G1', 'car', 'Yakkalamulla', 'FD141', '2026-03-31 23:15:00', '2026-04-05 23:15:00', 'Amila Nuwan Thilina', 'thilina58149@gmail.com', '94702568684', 5, 1000.00, 6000.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-01.pdf', '2026-03-29 16:05:23', '2026-03-29 16:05:24', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69c94dc33a881.png', 'https://www.airportparking.lk//uploads/69c94dc33aa52.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(54, 'G3-AP-01', '', 'G3', 'car', 'Colombo', 'UL 127', '2026-03-30 11:30:00', '2026-03-31 01:30:00', 'Muthukrishnan', 'muththu@gmail.com', '94759324811', 0.58, 1000.00, 1583.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G3-AP-01.pdf', '2026-03-30 05:41:13', '2026-03-30 05:41:15', 'website', '16', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69ca0cf9e1e20.PNG', 'https://airportparking.lk//uploads/69ca0cf9e2048.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(55, 'G2-AP-02', '', 'G2', 'car', 'Colombo', 'Y6VINB', '2026-03-30 23:00:00', '2026-04-01 22:15:00', 'Kasun Dilantha', 'kasun@gmaIl.com', '94714372856', 1.97, 1000.00, 2969.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-02.pdf', '2026-03-30 07:05:48', '2026-03-30 07:05:48', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69ca20cc40e6f.PNG', 'https://airportparking.lk//uploads/69ca20cc40fa5.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(56, 'G1-AP-02', '', 'G1', 'van', 'KANDY', 'UL360', '2026-04-11 19:00:00', '2026-04-23 19:00:00', 'D G S SILVA', 'bvcocopvt@gmail.com', '0772317460', 12, 1000.00, 13000.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-02.pdf', '2026-03-30 09:32:28', '2026-03-30 09:32:28', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69ca432c4684a.pdf', 'https://www.airportparking.lk//uploads/69ca432c469ab.jpeg', 4, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(57, 'G5-AP-02', '', 'G5', 'car', 'Colombo', 'EK 2041', '2026-03-30 23:30:00', '2026-04-01 22:10:00', 'Shafraz Cadar', 'shafraz@gmail.com', '94777637918', 1.94, 1000.00, 2944.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-02.pdf', '2026-03-30 12:17:20', '2026-03-30 12:17:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69ca69d0402df.PNG', 'https://airportparking.lk//uploads/69ca69d040448.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(58, 'G2-AP-03', '', 'G2', 'car', 'Batticaloa', ' FD 141', '2026-04-11 19:00:00', '2026-04-21 12:00:00', 'Stanly Prashanth', 'stanlyprashanth@gmail.com', '94773605967', 9.71, 1000.00, 10208.00, 'Shuttle One Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-03.pdf', '2026-04-01 09:13:09', '2026-04-22 10:38:29', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69cce1a463385.jpeg', 'https://www.airportparking.lk//uploads/69cce1a4b60b2.jpeg', 2, NULL, 0, 10208.00, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(59, 'G7-AP-01', '', 'G7', 'car', 'Kandy ', 'UL 101 ', '2026-04-13 03:00:00', '2026-04-15 23:45:00', 'J R Lanka Francis ', 'lankafra@gmail.com', '0718162484', 2.86, 1000.00, 3865.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G7-AP-01.pdf', '2026-04-04 08:34:36', '2026-04-04 08:34:37', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d0cd1c14324.jpeg', 'https://www.airportparking.lk//uploads/69d0cd1c145f5.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(60, 'G4-AP-01', '', 'G4', 'car', 'Mattegoda', 'ul173', '2026-04-15 21:30:00', '2026-04-19 00:00:00', 'Sobitha Weerasekera', 'sobithaw@gmail.com', '0774666560', 3.1, 1000.00, 4104.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G4-AP-01.pdf', '2026-04-04 09:31:33', '2026-04-04 09:31:33', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d0da73b30a4.pdf', 'https://www.airportparking.lk//uploads/69d0da7418626.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(61, 'G8-AP-02', '', 'G8', 'car', 'ragama', 'G9588', '2026-04-09 22:00:00', '2026-04-21 03:00:00', 'AAC NIROSHAN', 'nchathu3d@gmail.com', '715195285', 11.21, 1000.00, 11208.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-02.pdf', '2026-04-04 15:37:19', '2026-04-04 15:37:19', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d1302f27519.jpg', 'https://www.airportparking.lk//uploads/69d1302f2770a.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(62, 'G7-AP-02', '', 'G7', 'car', 'Matale ', 'QR663', '2026-04-12 01:00:00', '2026-04-26 19:01:00', 'Samantha ', 'samanpriya83@yahoo.com', '94711424228', 14.75, 1000.00, 15751.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G7-AP-02.pdf', '2026-04-04 16:10:59', '2026-04-04 16:10:59', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d1381115079.jpeg', 'https://www.airportparking.lk//uploads/69d138115889e.png', 4, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(63, 'G8-AP-03', '', 'G8', 'car', 'Billericay', '0921', '2026-04-10 04:30:00', '2026-04-17 12:00:00', 'Miss Georgia Cole', 'georgiacole04@gmail.com', '447415270363', 7.31, 1000.00, 8313.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-03.pdf', '2026-04-06 17:39:48', '2026-04-06 17:39:49', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d3efe33de34.png', 'https://www.airportparking.lk//uploads/69d3efe3a37cf.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(64, 'G8-AP-04', '', 'G8', 'car', 'Piliyandala', 'CX611', '2026-04-08 22:30:00', '2026-04-13 00:30:00', 'S.Akilan', 'sivagnanam.akilan@gmail.com', '0776117211', 4.08, 1000.00, 5083.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-04.pdf', '2026-04-07 11:04:52', '2026-04-07 11:04:53', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d4e4d357627.jpeg', 'https://www.airportparking.lk//uploads/69d4e4d3b54f6.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(65, 'G8-AP-05', '', 'G8', 'car', 'Kandy', 'FD141', '2026-04-18 14:00:00', '2026-04-24 23:45:00', 'Pathum Wattegama', 'pathum24u@gmail.com', '0777104335', 6.41, 1000.00, 7406.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-05.pdf', '2026-04-07 15:02:10', '2026-04-07 15:02:10', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d51c725efd8.pdf', 'https://www.airportparking.lk//uploads/69d51c725f239.pdf', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(66, 'G3-AP-02', '', 'G3', 'car', 'T.Rasaroopan', '6E1174', '2026-04-12 05:30:00', '2026-04-17 23:00:00', 'T.Rasaroopan', 'trroopan@yahoo.com', '0716874576', 5.73, 1000.00, 6729.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G3-AP-02.pdf', '2026-04-08 09:24:06', '2026-04-08 09:24:07', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d61eb3c4a3e.pdf', 'https://www.airportparking.lk//uploads/69d61eb49885f.pdf', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(67, 'G6-AP-01', '', 'G6', 'van', 'Badulla', 'UL 127', '2026-04-11 13:35:00', '2026-04-19 17:20:00', 'P V Pushpakumar', 'ashi95831@gmail.com', '94783483418', 8.16, 1000.00, 9156.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G6-AP-01.pdf', '2026-04-08 12:44:18', '2026-04-08 12:44:18', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d64d9fe01e5.png', 'https://www.airportparking.lk//uploads/69d64da0cf39e.jpeg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(68, 'G9-AP-01', '', 'G9', 'car', 'Kandy', 'MH 178', '2026-04-16 20:00:00', '2026-04-22 23:55:00', 'Chathuranga Neththikumara', 'chathuranganeththikumara@hotmail.com', '94775992063', 6.16, 1000.00, 8163.00, 'Body Wash & Vacuum, Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G9-AP-01.pdf', '2026-04-08 14:31:23', '2026-04-08 14:31:23', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d666ba489ad.png', 'https://www.airportparking.lk//uploads/69d666bb060a3.jpeg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(69, 'G5-AP-03', '', 'G5', 'car', 'Colombo ', 'AK47', '2026-04-08 23:00:00', '2026-04-12 22:45:00', 'Itsvan Norbert', 'inquiry@airportparking.lk', '36203535004', 3.99, 1000.00, 4490.00, 'Shuttle One Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-03.pdf', '2026-04-08 18:21:48', '2026-04-22 10:37:54', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d69cbca536b.jpeg', 'https://www.airportparking.lk//uploads/69d69cbca5524.jpeg', 1, NULL, 0, 8980.00, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(70, 'G10-AP-01', '', 'G10', 'car', 'Colombo', 'Mh7212l', '2026-04-10 09:00:00', '2026-04-15 23:30:00', 'Jeehyung Lee ', 'lpgfull@gmail.com', '94740777312', 5.6, 1000.00, 6604.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G10-AP-01.pdf', '2026-04-09 01:17:16', '2026-04-09 01:17:17', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d6fe1bd0fbf.jpg', 'https://www.airportparking.lk//uploads/69d6fe1bd1353.jpg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(71, 'G2-AP-04', '', 'G2', 'car', 'Panadura', 'UL-402', '2026-04-14 19:30:00', '2026-04-20 17:00:00', 'Prasanga Fernando', 'amali.kumu.f@gmail.com', '94772513736', 5.9, 1000.00, 6896.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-04.pdf', '2026-04-09 02:27:43', '2026-04-09 02:27:45', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69d70e9fc716c.png', 'https://airportparking.lk//uploads/69d70e9fc72ed.jpeg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(72, 'G1-AP-03', '', 'G1', 'car', 'Nugegoda', 'UL308', '2026-04-10 10:00:00', '2026-04-15 22:00:00', 'Sankha Rathnayake', 'sankhaucsc@gmail.com', '94716194060', 5.5, 1000.00, 6500.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-03.pdf', '2026-04-09 12:58:52', '2026-04-09 12:58:54', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d7a28b51baf.png', 'https://www.airportparking.lk//uploads/69d7a28b81ecd.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(73, 'G10-AP-02', '', 'G10', 'car', 'Wariyapola', 'Air china (CA-426)', '2026-04-11 21:15:00', '2026-04-19 21:55:00', 'Dilruk kumara', 'bancojobs@gmail.com', '94777444866', 8.03, 1000.00, 8028.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G10-AP-02.pdf', '2026-04-09 14:50:02', '2026-04-09 14:50:02', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d7bc9a98ad5.jpeg', 'https://www.airportparking.lk//uploads/69d7bc9a98c83.jpeg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(74, 'G5-AP-04', '', 'G5', 'car', 'Colombo ', 'UL315', '2026-04-10 04:30:00', '2026-04-14 16:00:00', 'Rohan Priyantha', 'lakshitha6812@gmail.com', '94711878251', 4.48, 1000.00, 5479.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-04.pdf', '2026-04-09 17:10:30', '2026-04-09 17:10:30', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d7dd868c1e2.png', 'https://www.airportparking.lk//uploads/69d7dd868c4d7.jpeg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(75, 'G1-AP-04', '', 'G1', 'car', 'Colombo', 'SQ 800', '2026-04-14 05:00:00', '2026-04-19 19:00:00', 'Suranga Gamage', 'Surangaa@gmail.com', '94718140322', 5.58, 1000.00, 6583.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-04.pdf', '2026-04-10 06:00:50', '2026-04-10 06:00:52', 'website', '16', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69d89212cf4c6.jpeg', 'https://airportparking.lk//uploads/69d89212cf673.jpeg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(76, 'G7-AP-03', '', 'G7', 'car', 'Colombo', 'SQ 483', '2026-04-14 05:00:00', '2026-04-19 19:00:00', 'Suranga Gamage', 'Surangaa@gmail.com', '94718140322', 5.58, 1000.00, 6583.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G7-AP-03.pdf', '2026-04-10 06:28:49', '2026-04-10 06:28:49', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69d898a194b46.jpeg', 'https://airportparking.lk//uploads/69d898a194c7e.jpeg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(77, 'G5-AP-05', '', 'G5', 'car', 'Ratmalana', '8D921', '2026-04-11 02:00:00', '2026-04-14 11:45:00', 'T N C Fernando ', 'nilankafernandopcu@gmail.com', '0774053883', 3.41, 1000.00, 4406.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-05.pdf', '2026-04-10 10:06:37', '2026-04-22 10:36:31', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d8cbadccf66.jpg', 'https://www.airportparking.lk//uploads/69d8cbadcd183.jpg', 2, NULL, 0, 4406.00, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(78, 'G8-AP-06', '', 'G8', 'car', 'Pelawatte', 'AK44', '2026-04-11 08:30:00', '2026-04-19 23:30:00', 'Benson Wallace', 'benson.wallace@gmail.com', '94770216291', 8.63, 1000.00, 9625.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-06.pdf', '2026-04-10 13:07:19', '2026-04-10 13:07:19', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d8f60628c13.png', 'https://www.airportparking.lk//uploads/69d8f60628d34.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(79, 'G7-AP-04', '', 'G7', 'car', 'ETHUL KOTTE', 'UL 314', '2026-04-12 04:00:00', '2026-04-17 16:00:00', 'HRNT Ranaweera', 'nipun.ranaweera08@gmail.com', '61438139507', 5.5, 1000.00, 7500.00, 'Body Wash & Vacuum, Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G7-AP-04.pdf', '2026-04-10 13:40:44', '2026-04-22 10:39:33', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69d8fddbe162f.pdf', 'https://www.airportparking.lk//uploads/69d8fddc00851.pdf', 3, NULL, 0, 7500.00, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(80, 'G8-AP-07', '', 'G8', 'car', 'Matara ', 'MH 178', '2026-04-14 19:00:00', '2026-04-19 01:00:00', 'H.ABEYSINGHE', 'hihiran@gmail.com', '0773300323', 4.25, 1000.00, 4250.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G8-AP-07.pdf', '2026-04-11 06:48:19', '2026-04-11 06:48:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69d9eeb3b3b2c.jpg', 'https://airportparking.lk//uploads/69d9eeb3b3e10.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(81, 'G1-AP-05', '', 'G1', 'car', 'Kandy', '6E1174', '2026-04-12 07:00:00', '2026-04-19 21:00:00', 'BMMM Zuhry Hassan ', 'zuhryhasan@gmail.com', '0773817482', 7.58, 1000.00, 7583.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-05.pdf', '2026-04-11 11:19:04', '2026-04-11 11:19:04', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69da2e2876cd1.jpg', 'https://www.airportparking.lk//uploads/69da2e2876f5a.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(82, 'G2-AP-05', '', 'G2', 'car', 'Homagama', 'SQ469', '2026-04-25 21:30:00', '2026-05-02 22:59:00', 'Chivantha GalAnga', 'lahirugalanga@gmail.com', '94718739205', 7.06, 1000.00, 8062.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-05.pdf', '2026-04-11 14:04:29', '2026-04-11 14:04:29', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69da54ebdccd2.jpg', 'https://www.airportparking.lk//uploads/69da54ec2898b.jpg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(83, 'G6-AP-02', '', 'G6', 'car', 'Thambuttegama', 'UL 404', '2026-04-13 07:35:00', '2026-04-17 15:45:00', 'Gamage Ajith Pushpakumara', 'gayendrakaveesh441@gmail.com', '0712260700', 4.34, 1000.00, 4340.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G6-AP-02.pdf', '2026-04-12 11:59:30', '2026-04-12 11:59:32', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69db8922dac62.jpg', 'https://www.airportparking.lk//uploads/69db8922daf8f.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(84, 'G10-AP-03', '', 'G10', 'car', 'Anuradhapura', 'UL 404', '2026-04-13 07:35:00', '2026-04-17 15:45:00', 'PRIYANTHA WIKUMSIRI', 'gayendrakaveesh441@gmail.com', '0777007961', 4.34, 1000.00, 4340.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G10-AP-03.pdf', '2026-04-12 12:22:24', '2026-04-12 12:22:24', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69db8e7ee0c93.jpg', 'https://www.airportparking.lk//uploads/69db8e7f0e301.jpg', 5, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(85, 'G3-AP-03', '', 'G3', 'car', 'RAJAGIRIYA', 'UL308', '2026-04-14 08:30:00', '2026-04-16 23:30:00', 'YUJI KIYOMOTO', 'yuji.kiyomoto@gmail.com', '94773082119', 2.63, 1000.00, 3625.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G3-AP-03.pdf', '2026-04-13 05:20:39', '2026-04-22 10:34:17', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69dc7d270eb82.pdf', 'https://www.airportparking.lk//uploads/69dc7d270ee7a.jpeg', 1, NULL, 0, 3625.00, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(86, 'G6-AP-03', '', 'G6', 'car', 'Panadura', 'UL 101', '2026-04-15 04:30:00', '2026-04-18 19:30:00', 'Shehastha Hettiarachchi', 'mevinushehastha@gmail.com', '94772527495', 3.63, 1000.00, 4625.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G6-AP-03.pdf', '2026-04-13 05:32:35', '2026-04-13 05:32:35', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69dc7ff3d6d9d.png', 'https://www.airportparking.lk//uploads/69dc7ff3d6f5b.jpg', 3, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(87, 'G10-AP-04', '', 'G10', 'car', 'Horana', 'UL 101', '2026-04-16 04:30:00', '2026-04-19 17:00:00', 'Tharindu Gunathunga', 'thariduke12@gmail.com', '94712327329', 3.52, 1000.00, 4521.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G10-AP-04.pdf', '2026-04-14 02:57:36', '2026-04-14 02:57:37', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69ddad2006350.png', 'https://www.airportparking.lk//uploads/69ddad20067fb.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, NULL, NULL, 'pending'),
(88, 'G2-AP-06', '', 'G2', 'car', 'Horana', 'OD 298', '2026-04-27 23:00:00', '2026-05-02 03:15:00', 'Tharindu Gunathunga', 'thariduke12@gmail.com', '94712327329', 4.18, 1000.00, 6177.00, 'Body Wash & Vacuum, Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-06.pdf', '2026-04-14 03:05:45', '2026-04-22 10:12:27', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69ddaf0998eb3.png', 'https://www.airportparking.lk//uploads/69ddaf0999011.jpg', 5, NULL, 0, 9265.50, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(89, 'G2-AP-07', '', 'G2', 'car', 'Angoda', 'FD141', '2026-04-24 20:30:00', '2026-04-26 23:30:00', 'viraj priyadarshana perera', 'kviraj.perera@gmail.com', '94777750165', 2.13, 1000.00, 3125.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G2-AP-07.pdf', '2026-04-14 08:34:43', '2026-04-23 12:32:03', 'website', 'system', '', 9000, '[\"C:\\\\xampp\\\\htdocs\\\\airport\\\\assets\\\\includes\\\\uploads\\\\G2-AP-07\\\\image_0.png\"]', 0, '', 'https://www.airportparking.lk//uploads/69ddfc222337c.jpg', 'https://www.airportparking.lk//uploads/69ddfc2266e88.jpg', 1, '2026-04-26 23:30:00', 0, 3125.00, 0.00, NULL, '2026-04-23 14:32:03', NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'completed'),
(90, 'G6-AP-04', '', 'G6', 'car', 'Wellawa, Kurunegala', 'UL306', '2026-04-15 21:00:00', '2026-04-19 13:00:00', 'Harshana Henarath', 'harshana22@gmail.com', '94718153766', 3.67, 1000.00, 4667.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G6-AP-04.pdf', '2026-04-14 09:05:54', '2026-04-22 09:19:20', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69de0370ad0c6.png', 'https://www.airportparking.lk//uploads/69de0370ebb6b.jpeg', 4, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(91, 'G1-AP-06', '', 'G1', 'car', 'Kalmunai ', 'UL121', '2026-04-16 17:45:00', '2026-04-21 17:45:00', 'Fahim', 'pm.abufahim@gmail.com', '94777656926', 5, 1000.00, 5500.00, 'Shuttle One Way', '/home/airpor26/public_html/assets/invoices/Invoice_G1-AP-06.pdf', '2026-04-14 12:18:46', '2026-04-22 10:32:11', 'website', 'system', '', 9000, '[\"C:\\\\xampp\\\\htdocs\\\\airport\\\\assets\\\\includes\\\\uploads\\\\G1-AP-06\\\\image_0.webp\"]', 0, '', 'https://www.airportparking.lk//uploads/69de30a6be173.jpeg', 'https://www.airportparking.lk//uploads/69de30a6be374.jpeg', 4, '2026-04-21 20:45:00', 25, 8250.00, 1375.00, NULL, '2026-04-22 10:32:27', NULL, 'pending', 0, NULL, 'Paid Fully', 1, 'pending'),
(92, 'G5-AP-06', '', 'G5', 'car', 'Colombo', 'UL 119', '2026-04-18 09:00:00', '2026-04-21 17:00:00', 'Prabath Madusanka', 'lakshitha6812@gmail.com', '771286916', 3.33, 1000.00, 4333.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-06.pdf', '2026-04-15 12:01:50', '2026-04-20 08:39:55', 'website', '16', '', NULL, NULL, 0, '', 'https://airportparking.lk//uploads/69df7e2e0fced.PNG', 'https://airportparking.lk//uploads/69df7e2e0febb.jpeg', 6, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'accepted', 0, NULL, NULL, NULL, 'pending'),
(93, 'G5-AP-07', '', 'G5', 'car', 'Aluthgama', 'Xxxx', '2026-04-16 17:25:00', '2026-04-17 17:25:00', 'Kanishka Apsari', 'apsarikanishka7@gmail.com', '771835349', 1, 1000.00, 1000.00, '', '/home/airpor26/public_html/assets/invoices/Invoice_G5-AP-07.pdf', '2026-04-16 11:58:14', '2026-04-20 08:39:55', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69e0ced693cb8.jpg', 'https://www.airportparking.lk//uploads/69e0ced693e95.jpg', 1, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'accepted', 0, NULL, NULL, NULL, 'pending'),
(94, 'G9-AP-02', '', 'G9', 'car', 'Matale', 'Q8YUYL ', '2026-05-05 23:15:00', '2026-05-10 22:15:00', 'G.P.J.Kumara', 'pasanjanith10@gmail.com', '94711850128', 4.96, 1000.00, 5958.00, 'Shuttle Two Way', '/home/airpor26/public_html/assets/invoices/Invoice_G9-AP-02.pdf', '2026-04-17 06:59:15', '2026-04-20 08:39:55', 'website', 'system', '', NULL, NULL, 0, '', 'https://www.airportparking.lk//uploads/69e1da42906a0.jpg', 'https://www.airportparking.lk//uploads/69e1da429d790.jpg', 2, NULL, 0, NULL, 0.00, NULL, NULL, NULL, 'accepted', 0, NULL, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `sent_invoices`
--

CREATE TABLE `sent_invoices` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(50) NOT NULL,
  `reserved_slot_id` int(10) UNSIGNED NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `invoice_amount` decimal(10,2) NOT NULL,
  `batch_total_amount` decimal(10,2) NOT NULL,
  `sent_at` datetime NOT NULL DEFAULT current_timestamp(),
  `sent_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff','finance') DEFAULT 'admin',
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '$2a$12$YXhLtNf9YpUtHCqN0qEl.OJzb3PoQZPV6x9Qyg/bLLmHqdEgmapgG', 'admin', 'active', '2025-10-20 06:19:02', '2026-03-10 12:29:27'),
(12, 'Primali', 'cashier@explorevacations.lk', '$2y$10$o1hjT2w6XTBBGl1fgAV.NuvzFD.vCjNJqBHcBZCLk5E53Je.tmG/a', 'finance', 'active', '2026-01-07 05:09:19', '2026-03-26 06:16:10'),
(13, 'gayan', 'gayan@explorevacations.lk', '$2y$10$echuLbW5H/C1TXjHON44Oe9DavV6p4CTYlPnLYksivhbvdyT2wlaO', 'staff', 'active', '2026-01-14 13:01:50', '2026-01-14 13:01:50'),
(14, 'Shermal Perera', 'shermal@explorevacations.lk', '$2y$10$VgU6RvDLWRaV.vV9qCaMxekJGRUsAfLHoBU8oNVmo95FHuUBIp0vS', 'admin', 'active', '2026-01-26 18:46:33', '2026-01-26 18:46:33'),
(15, 'GroupGeneralManager', 'gm@explorevacations.lk', '$2y$10$Me7okdGOEIYi.QfUkQmnX..5iUM5nZRISBoIALFuOL9rwzBjv1yku', 'admin', 'active', '2026-02-19 11:40:31', '2026-02-19 11:43:03'),
(16, 'Lakshitha Rajapaksha', 'inquiry@airportparking.lk', '$2y$10$wlLPJt0b8lgKbVQO5t4IzuObUcwFhjgv5aJUWOUhFphWH8LpArXri', 'staff', 'active', '2026-03-12 10:29:07', '2026-03-12 10:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `website_customer`
--

CREATE TABLE `website_customer` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `remember_token` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modxwl_access_actiondom`
--
ALTER TABLE `modxwl_access_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modxwl_access_category`
--
ALTER TABLE `modxwl_access_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_context`
--
ALTER TABLE `modxwl_access_context`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modxwl_access_elements`
--
ALTER TABLE `modxwl_access_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_media_source`
--
ALTER TABLE `modxwl_access_media_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_menus`
--
ALTER TABLE `modxwl_access_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modxwl_access_namespace`
--
ALTER TABLE `modxwl_access_namespace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_permissions`
--
ALTER TABLE `modxwl_access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template` (`template`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modxwl_access_policies`
--
ALTER TABLE `modxwl_access_policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `class` (`class`),
  ADD KEY `template` (`template`);

--
-- Indexes for table `modxwl_access_policy_templates`
--
ALTER TABLE `modxwl_access_policy_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modxwl_access_policy_template_groups`
--
ALTER TABLE `modxwl_access_policy_template_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modxwl_access_resources`
--
ALTER TABLE `modxwl_access_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_resource_groups`
--
ALTER TABLE `modxwl_access_resource_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`,`target`,`principal`,`authority`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_access_templatevars`
--
ALTER TABLE `modxwl_access_templatevars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modxwl_actiondom`
--
ALTER TABLE `modxwl_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set` (`set`),
  ADD KEY `action` (`action`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`),
  ADD KEY `for_parent` (`for_parent`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modxwl_actions_fields`
--
ALTER TABLE `modxwl_actions_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action` (`action`),
  ADD KEY `type` (`type`),
  ADD KEY `tab` (`tab`);

--
-- Indexes for table `modxwl_active_users`
--
ALTER TABLE `modxwl_active_users`
  ADD PRIMARY KEY (`internalKey`);

--
-- Indexes for table `modxwl_categories`
--
ALTER TABLE `modxwl_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`parent`,`category`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modxwl_categories_closure`
--
ALTER TABLE `modxwl_categories_closure`
  ADD PRIMARY KEY (`ancestor`,`descendant`);

--
-- Indexes for table `modxwl_content_type`
--
ALTER TABLE `modxwl_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modxwl_context`
--
ALTER TABLE `modxwl_context`
  ADD PRIMARY KEY (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modxwl_context_resource`
--
ALTER TABLE `modxwl_context_resource`
  ADD PRIMARY KEY (`context_key`,`resource`);

--
-- Indexes for table `modxwl_context_setting`
--
ALTER TABLE `modxwl_context_setting`
  ADD PRIMARY KEY (`context_key`,`key`);

--
-- Indexes for table `modxwl_dashboard`
--
ALTER TABLE `modxwl_dashboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `hide_trees` (`hide_trees`);

--
-- Indexes for table `modxwl_dashboard_widget`
--
ALTER TABLE `modxwl_dashboard_widget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `lexicon` (`lexicon`);

--
-- Indexes for table `modxwl_dashboard_widget_placement`
--
ALTER TABLE `modxwl_dashboard_widget_placement`
  ADD PRIMARY KEY (`user`,`dashboard`,`widget`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modxwl_deprecated_call`
--
ALTER TABLE `modxwl_deprecated_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `method` (`method`),
  ADD KEY `call_count` (`call_count`),
  ADD KEY `caller` (`caller`),
  ADD KEY `caller_file` (`caller_file`),
  ADD KEY `caller_line` (`caller_line`);

--
-- Indexes for table `modxwl_deprecated_method`
--
ALTER TABLE `modxwl_deprecated_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `definition` (`definition`);

--
-- Indexes for table `modxwl_documentgroup_names`
--
ALTER TABLE `modxwl_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modxwl_document_groups`
--
ALTER TABLE `modxwl_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_group` (`document_group`),
  ADD KEY `document` (`document`);

--
-- Indexes for table `modxwl_element_property_sets`
--
ALTER TABLE `modxwl_element_property_sets`
  ADD PRIMARY KEY (`element`,`element_class`,`property_set`);

--
-- Indexes for table `modxwl_extension_packages`
--
ALTER TABLE `modxwl_extension_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modxwl_fc_profiles`
--
ALTER TABLE `modxwl_fc_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `modxwl_fc_profiles_usergroups`
--
ALTER TABLE `modxwl_fc_profiles_usergroups`
  ADD PRIMARY KEY (`usergroup`,`profile`);

--
-- Indexes for table `modxwl_fc_sets`
--
ALTER TABLE `modxwl_fc_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile` (`profile`),
  ADD KEY `action` (`action`),
  ADD KEY `active` (`active`),
  ADD KEY `template` (`template`);

--
-- Indexes for table `modxwl_lexicon_entries`
--
ALTER TABLE `modxwl_lexicon_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `topic` (`topic`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `modxwl_manager_log`
--
ALTER TABLE `modxwl_manager_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_occurred` (`user`,`occurred`);

--
-- Indexes for table `modxwl_media_sources`
--
ALTER TABLE `modxwl_media_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `is_stream` (`is_stream`);

--
-- Indexes for table `modxwl_media_sources_contexts`
--
ALTER TABLE `modxwl_media_sources_contexts`
  ADD PRIMARY KEY (`source`,`context_key`);

--
-- Indexes for table `modxwl_media_sources_elements`
--
ALTER TABLE `modxwl_media_sources_elements`
  ADD PRIMARY KEY (`source`,`object`,`object_class`,`context_key`);

--
-- Indexes for table `modxwl_membergroup_names`
--
ALTER TABLE `modxwl_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`),
  ADD KEY `dashboard` (`dashboard`);

--
-- Indexes for table `modxwl_member_groups`
--
ALTER TABLE `modxwl_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modxwl_menus`
--
ALTER TABLE `modxwl_menus`
  ADD PRIMARY KEY (`text`),
  ADD KEY `parent` (`parent`),
  ADD KEY `action` (`action`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `modxwl_namespaces`
--
ALTER TABLE `modxwl_namespaces`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `modxwl_property_set`
--
ALTER TABLE `modxwl_property_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `modxwl_register_messages`
--
ALTER TABLE `modxwl_register_messages`
  ADD PRIMARY KEY (`topic`,`id`),
  ADD KEY `created` (`created`),
  ADD KEY `valid` (`valid`),
  ADD KEY `accessed` (`accessed`),
  ADD KEY `accesses` (`accesses`),
  ADD KEY `expires` (`expires`);

--
-- Indexes for table `modxwl_register_queues`
--
ALTER TABLE `modxwl_register_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modxwl_register_topics`
--
ALTER TABLE `modxwl_register_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modxwl_session`
--
ALTER TABLE `modxwl_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access` (`access`);

--
-- Indexes for table `modxwl_site_content`
--
ALTER TABLE `modxwl_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `published` (`published`),
  ADD KEY `pub_date` (`pub_date`),
  ADD KEY `unpub_date` (`unpub_date`),
  ADD KEY `parent` (`parent`),
  ADD KEY `isfolder` (`isfolder`),
  ADD KEY `template` (`template`),
  ADD KEY `menuindex` (`menuindex`),
  ADD KEY `searchable` (`searchable`),
  ADD KEY `cacheable` (`cacheable`),
  ADD KEY `hidemenu` (`hidemenu`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `context_key` (`context_key`),
  ADD KEY `uri` (`uri`(191)),
  ADD KEY `uri_override` (`uri_override`),
  ADD KEY `hide_children_in_tree` (`hide_children_in_tree`),
  ADD KEY `show_in_tree` (`show_in_tree`),
  ADD KEY `cache_refresh_idx` (`parent`,`menuindex`,`id`);
ALTER TABLE `modxwl_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`longtitle`,`description`,`introtext`,`content`);

--
-- Indexes for table `modxwl_site_htmlsnippets`
--
ALTER TABLE `modxwl_site_htmlsnippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modxwl_site_plugins`
--
ALTER TABLE `modxwl_site_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modxwl_site_plugin_events`
--
ALTER TABLE `modxwl_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`event`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `modxwl_site_snippets`
--
ALTER TABLE `modxwl_site_snippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `moduleguid` (`moduleguid`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modxwl_site_templates`
--
ALTER TABLE `modxwl_site_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templatename` (`templatename`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modxwl_site_tmplvars`
--
ALTER TABLE `modxwl_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `rank` (`rank`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modxwl_site_tmplvar_access`
--
ALTER TABLE `modxwl_site_tmplvar_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmplvar_template` (`tmplvarid`,`documentgroup`);

--
-- Indexes for table `modxwl_site_tmplvar_contentvalues`
--
ALTER TABLE `modxwl_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tv_cnt` (`tmplvarid`,`contentid`),
  ADD KEY `tmplvarid` (`tmplvarid`),
  ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `modxwl_site_tmplvar_templates`
--
ALTER TABLE `modxwl_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Indexes for table `modxwl_system_eventnames`
--
ALTER TABLE `modxwl_system_eventnames`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `modxwl_system_settings`
--
ALTER TABLE `modxwl_system_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `modxwl_transport_packages`
--
ALTER TABLE `modxwl_transport_packages`
  ADD PRIMARY KEY (`signature`),
  ADD KEY `workspace` (`workspace`),
  ADD KEY `provider` (`provider`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `package_name` (`package_name`),
  ADD KEY `version_major` (`version_major`),
  ADD KEY `version_minor` (`version_minor`),
  ADD KEY `version_patch` (`version_patch`),
  ADD KEY `release` (`release`),
  ADD KEY `release_index` (`release_index`);

--
-- Indexes for table `modxwl_transport_providers`
--
ALTER TABLE `modxwl_transport_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `api_key` (`api_key`),
  ADD KEY `username` (`username`),
  ADD KEY `active` (`active`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `modxwl_users`
--
ALTER TABLE `modxwl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `remote_key` (`remote_key`),
  ADD KEY `primary_group` (`primary_group`);

--
-- Indexes for table `modxwl_user_attributes`
--
ALTER TABLE `modxwl_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `internalKey` (`internalKey`);

--
-- Indexes for table `modxwl_user_group_roles`
--
ALTER TABLE `modxwl_user_group_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `authority` (`authority`);

--
-- Indexes for table `modxwl_user_group_settings`
--
ALTER TABLE `modxwl_user_group_settings`
  ADD PRIMARY KEY (`group`,`key`);

--
-- Indexes for table `modxwl_user_messages`
--
ALTER TABLE `modxwl_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modxwl_user_settings`
--
ALTER TABLE `modxwl_user_settings`
  ADD PRIMARY KEY (`user`,`key`);

--
-- Indexes for table `modxwl_workspaces`
--
ALTER TABLE `modxwl_workspaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `modx_access_actiondom`
--
ALTER TABLE `modx_access_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modx_access_category`
--
ALTER TABLE `modx_access_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_context`
--
ALTER TABLE `modx_access_context`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modx_access_elements`
--
ALTER TABLE `modx_access_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_media_source`
--
ALTER TABLE `modx_access_media_source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_menus`
--
ALTER TABLE `modx_access_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`);

--
-- Indexes for table `modx_access_namespace`
--
ALTER TABLE `modx_access_namespace`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_permissions`
--
ALTER TABLE `modx_access_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template` (`template`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modx_access_policies`
--
ALTER TABLE `modx_access_policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `class` (`class`),
  ADD KEY `template` (`template`);

--
-- Indexes for table `modx_access_policy_templates`
--
ALTER TABLE `modx_access_policy_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modx_access_policy_template_groups`
--
ALTER TABLE `modx_access_policy_template_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modx_access_resources`
--
ALTER TABLE `modx_access_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_resource_groups`
--
ALTER TABLE `modx_access_resource_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`,`target`,`principal`,`authority`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_access_templatevars`
--
ALTER TABLE `modx_access_templatevars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target` (`target`),
  ADD KEY `principal_class` (`principal_class`),
  ADD KEY `principal` (`principal`),
  ADD KEY `authority` (`authority`),
  ADD KEY `policy` (`policy`),
  ADD KEY `context_key` (`context_key`);

--
-- Indexes for table `modx_actiondom`
--
ALTER TABLE `modx_actiondom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set` (`set`),
  ADD KEY `action` (`action`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`),
  ADD KEY `for_parent` (`for_parent`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modx_actions_fields`
--
ALTER TABLE `modx_actions_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action` (`action`),
  ADD KEY `type` (`type`),
  ADD KEY `tab` (`tab`);

--
-- Indexes for table `modx_active_users`
--
ALTER TABLE `modx_active_users`
  ADD PRIMARY KEY (`internalKey`);

--
-- Indexes for table `modx_categories`
--
ALTER TABLE `modx_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`parent`,`category`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modx_categories_closure`
--
ALTER TABLE `modx_categories_closure`
  ADD PRIMARY KEY (`ancestor`,`descendant`);

--
-- Indexes for table `modx_content_type`
--
ALTER TABLE `modx_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modx_context`
--
ALTER TABLE `modx_context`
  ADD PRIMARY KEY (`key`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modx_context_resource`
--
ALTER TABLE `modx_context_resource`
  ADD PRIMARY KEY (`context_key`,`resource`);

--
-- Indexes for table `modx_context_setting`
--
ALTER TABLE `modx_context_setting`
  ADD PRIMARY KEY (`context_key`,`key`);

--
-- Indexes for table `modx_dashboard`
--
ALTER TABLE `modx_dashboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `hide_trees` (`hide_trees`);

--
-- Indexes for table `modx_dashboard_widget`
--
ALTER TABLE `modx_dashboard_widget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `lexicon` (`lexicon`);

--
-- Indexes for table `modx_dashboard_widget_placement`
--
ALTER TABLE `modx_dashboard_widget_placement`
  ADD PRIMARY KEY (`user`,`dashboard`,`widget`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modx_deprecated_call`
--
ALTER TABLE `modx_deprecated_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `method` (`method`),
  ADD KEY `call_count` (`call_count`),
  ADD KEY `caller` (`caller`),
  ADD KEY `caller_file` (`caller_file`),
  ADD KEY `caller_line` (`caller_line`);

--
-- Indexes for table `modx_deprecated_method`
--
ALTER TABLE `modx_deprecated_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `definition` (`definition`);

--
-- Indexes for table `modx_documentgroup_names`
--
ALTER TABLE `modx_documentgroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modx_document_groups`
--
ALTER TABLE `modx_document_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_group` (`document_group`),
  ADD KEY `document` (`document`);

--
-- Indexes for table `modx_element_property_sets`
--
ALTER TABLE `modx_element_property_sets`
  ADD PRIMARY KEY (`element`,`element_class`,`property_set`);

--
-- Indexes for table `modx_extension_packages`
--
ALTER TABLE `modx_extension_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modx_fc_profiles`
--
ALTER TABLE `modx_fc_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `rank` (`rank`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `modx_fc_profiles_usergroups`
--
ALTER TABLE `modx_fc_profiles_usergroups`
  ADD PRIMARY KEY (`usergroup`,`profile`);

--
-- Indexes for table `modx_fc_sets`
--
ALTER TABLE `modx_fc_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile` (`profile`),
  ADD KEY `action` (`action`),
  ADD KEY `active` (`active`),
  ADD KEY `template` (`template`);

--
-- Indexes for table `modx_lexicon_entries`
--
ALTER TABLE `modx_lexicon_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `topic` (`topic`),
  ADD KEY `namespace` (`namespace`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `modx_manager_log`
--
ALTER TABLE `modx_manager_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_occurred` (`user`,`occurred`);

--
-- Indexes for table `modx_media_sources`
--
ALTER TABLE `modx_media_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `is_stream` (`is_stream`);

--
-- Indexes for table `modx_media_sources_contexts`
--
ALTER TABLE `modx_media_sources_contexts`
  ADD PRIMARY KEY (`source`,`context_key`);

--
-- Indexes for table `modx_media_sources_elements`
--
ALTER TABLE `modx_media_sources_elements`
  ADD PRIMARY KEY (`source`,`object`,`object_class`,`context_key`);

--
-- Indexes for table `modx_membergroup_names`
--
ALTER TABLE `modx_membergroup_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent` (`parent`),
  ADD KEY `rank` (`rank`),
  ADD KEY `dashboard` (`dashboard`);

--
-- Indexes for table `modx_member_groups`
--
ALTER TABLE `modx_member_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `modx_menus`
--
ALTER TABLE `modx_menus`
  ADD PRIMARY KEY (`text`),
  ADD KEY `parent` (`parent`),
  ADD KEY `action` (`action`),
  ADD KEY `namespace` (`namespace`);

--
-- Indexes for table `modx_namespaces`
--
ALTER TABLE `modx_namespaces`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `modx_property_set`
--
ALTER TABLE `modx_property_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `modx_register_messages`
--
ALTER TABLE `modx_register_messages`
  ADD PRIMARY KEY (`topic`,`id`),
  ADD KEY `created` (`created`),
  ADD KEY `valid` (`valid`),
  ADD KEY `accessed` (`accessed`),
  ADD KEY `accesses` (`accesses`),
  ADD KEY `expires` (`expires`);

--
-- Indexes for table `modx_register_queues`
--
ALTER TABLE `modx_register_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `modx_register_topics`
--
ALTER TABLE `modx_register_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `modx_session`
--
ALTER TABLE `modx_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access` (`access`);

--
-- Indexes for table `modx_site_content`
--
ALTER TABLE `modx_site_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`),
  ADD KEY `published` (`published`),
  ADD KEY `pub_date` (`pub_date`),
  ADD KEY `unpub_date` (`unpub_date`),
  ADD KEY `parent` (`parent`),
  ADD KEY `isfolder` (`isfolder`),
  ADD KEY `template` (`template`),
  ADD KEY `menuindex` (`menuindex`),
  ADD KEY `searchable` (`searchable`),
  ADD KEY `cacheable` (`cacheable`),
  ADD KEY `hidemenu` (`hidemenu`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `context_key` (`context_key`),
  ADD KEY `uri` (`uri`(191)),
  ADD KEY `uri_override` (`uri_override`),
  ADD KEY `hide_children_in_tree` (`hide_children_in_tree`),
  ADD KEY `show_in_tree` (`show_in_tree`),
  ADD KEY `cache_refresh_idx` (`parent`,`menuindex`,`id`);
ALTER TABLE `modx_site_content` ADD FULLTEXT KEY `content_ft_idx` (`pagetitle`,`longtitle`,`description`,`introtext`,`content`);

--
-- Indexes for table `modx_site_htmlsnippets`
--
ALTER TABLE `modx_site_htmlsnippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modx_site_plugins`
--
ALTER TABLE `modx_site_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modx_site_plugin_events`
--
ALTER TABLE `modx_site_plugin_events`
  ADD PRIMARY KEY (`pluginid`,`event`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `modx_site_snippets`
--
ALTER TABLE `modx_site_snippets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `moduleguid` (`moduleguid`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modx_site_templates`
--
ALTER TABLE `modx_site_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templatename` (`templatename`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modx_site_tmplvars`
--
ALTER TABLE `modx_site_tmplvars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`),
  ADD KEY `locked` (`locked`),
  ADD KEY `rank` (`rank`),
  ADD KEY `static` (`static`);

--
-- Indexes for table `modx_site_tmplvar_access`
--
ALTER TABLE `modx_site_tmplvar_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmplvar_template` (`tmplvarid`,`documentgroup`);

--
-- Indexes for table `modx_site_tmplvar_contentvalues`
--
ALTER TABLE `modx_site_tmplvar_contentvalues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tv_cnt` (`tmplvarid`,`contentid`),
  ADD KEY `tmplvarid` (`tmplvarid`),
  ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `modx_site_tmplvar_templates`
--
ALTER TABLE `modx_site_tmplvar_templates`
  ADD PRIMARY KEY (`tmplvarid`,`templateid`);

--
-- Indexes for table `modx_system_eventnames`
--
ALTER TABLE `modx_system_eventnames`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `modx_system_settings`
--
ALTER TABLE `modx_system_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `modx_transport_packages`
--
ALTER TABLE `modx_transport_packages`
  ADD PRIMARY KEY (`signature`),
  ADD KEY `workspace` (`workspace`),
  ADD KEY `provider` (`provider`),
  ADD KEY `disabled` (`disabled`),
  ADD KEY `package_name` (`package_name`),
  ADD KEY `version_major` (`version_major`),
  ADD KEY `version_minor` (`version_minor`),
  ADD KEY `version_patch` (`version_patch`),
  ADD KEY `release` (`release`),
  ADD KEY `release_index` (`release_index`);

--
-- Indexes for table `modx_transport_providers`
--
ALTER TABLE `modx_transport_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `api_key` (`api_key`),
  ADD KEY `username` (`username`),
  ADD KEY `active` (`active`),
  ADD KEY `priority` (`priority`);

--
-- Indexes for table `modx_users`
--
ALTER TABLE `modx_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `class_key` (`class_key`),
  ADD KEY `remote_key` (`remote_key`),
  ADD KEY `primary_group` (`primary_group`);

--
-- Indexes for table `modx_user_attributes`
--
ALTER TABLE `modx_user_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `internalKey` (`internalKey`);

--
-- Indexes for table `modx_user_group_roles`
--
ALTER TABLE `modx_user_group_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `authority` (`authority`);

--
-- Indexes for table `modx_user_group_settings`
--
ALTER TABLE `modx_user_group_settings`
  ADD PRIMARY KEY (`group`,`key`);

--
-- Indexes for table `modx_user_messages`
--
ALTER TABLE `modx_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modx_user_settings`
--
ALTER TABLE `modx_user_settings`
  ADD PRIMARY KEY (`user`,`key`);

--
-- Indexes for table `modx_workspaces`
--
ALTER TABLE `modx_workspaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `name` (`name`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reserved_slot_id` (`reserved_slot_id`),
  ADD KEY `generated_by` (`generated_by`);

--
-- Indexes for table `previous_bookings`
--
ALTER TABLE `previous_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserved_slots`
--
ALTER TABLE `reserved_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_invoices`
--
ALTER TABLE `sent_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reserved_slot_id` (`reserved_slot_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `website_customer`
--
ALTER TABLE `website_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_access_actiondom`
--
ALTER TABLE `modxwl_access_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_category`
--
ALTER TABLE `modxwl_access_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_context`
--
ALTER TABLE `modxwl_access_context`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modxwl_access_elements`
--
ALTER TABLE `modxwl_access_elements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_media_source`
--
ALTER TABLE `modxwl_access_media_source`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_menus`
--
ALTER TABLE `modxwl_access_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_namespace`
--
ALTER TABLE `modxwl_access_namespace`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_permissions`
--
ALTER TABLE `modxwl_access_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `modxwl_access_policies`
--
ALTER TABLE `modxwl_access_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `modxwl_access_policy_templates`
--
ALTER TABLE `modxwl_access_policy_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modxwl_access_policy_template_groups`
--
ALTER TABLE `modxwl_access_policy_template_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modxwl_access_resources`
--
ALTER TABLE `modxwl_access_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_resource_groups`
--
ALTER TABLE `modxwl_access_resource_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_access_templatevars`
--
ALTER TABLE `modxwl_access_templatevars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_actiondom`
--
ALTER TABLE `modxwl_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_actions_fields`
--
ALTER TABLE `modxwl_actions_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `modxwl_categories`
--
ALTER TABLE `modxwl_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_content_type`
--
ALTER TABLE `modxwl_content_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modxwl_dashboard`
--
ALTER TABLE `modxwl_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_dashboard_widget`
--
ALTER TABLE `modxwl_dashboard_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modxwl_deprecated_call`
--
ALTER TABLE `modxwl_deprecated_call`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_deprecated_method`
--
ALTER TABLE `modxwl_deprecated_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_documentgroup_names`
--
ALTER TABLE `modxwl_documentgroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_document_groups`
--
ALTER TABLE `modxwl_document_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_extension_packages`
--
ALTER TABLE `modxwl_extension_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_fc_profiles`
--
ALTER TABLE `modxwl_fc_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_fc_sets`
--
ALTER TABLE `modxwl_fc_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_lexicon_entries`
--
ALTER TABLE `modxwl_lexicon_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_manager_log`
--
ALTER TABLE `modxwl_manager_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT for table `modxwl_media_sources`
--
ALTER TABLE `modxwl_media_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_membergroup_names`
--
ALTER TABLE `modxwl_membergroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_member_groups`
--
ALTER TABLE `modxwl_member_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_property_set`
--
ALTER TABLE `modxwl_property_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_register_queues`
--
ALTER TABLE `modxwl_register_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_register_topics`
--
ALTER TABLE `modxwl_register_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_site_content`
--
ALTER TABLE `modxwl_site_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `modxwl_site_htmlsnippets`
--
ALTER TABLE `modxwl_site_htmlsnippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modxwl_site_plugins`
--
ALTER TABLE `modxwl_site_plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_site_snippets`
--
ALTER TABLE `modxwl_site_snippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_site_templates`
--
ALTER TABLE `modxwl_site_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_site_tmplvars`
--
ALTER TABLE `modxwl_site_tmplvars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_site_tmplvar_access`
--
ALTER TABLE `modxwl_site_tmplvar_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_site_tmplvar_contentvalues`
--
ALTER TABLE `modxwl_site_tmplvar_contentvalues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_transport_providers`
--
ALTER TABLE `modxwl_transport_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_users`
--
ALTER TABLE `modxwl_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_user_attributes`
--
ALTER TABLE `modxwl_user_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modxwl_user_group_roles`
--
ALTER TABLE `modxwl_user_group_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modxwl_user_messages`
--
ALTER TABLE `modxwl_user_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modxwl_workspaces`
--
ALTER TABLE `modxwl_workspaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_access_actiondom`
--
ALTER TABLE `modx_access_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_category`
--
ALTER TABLE `modx_access_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_context`
--
ALTER TABLE `modx_access_context`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modx_access_elements`
--
ALTER TABLE `modx_access_elements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_media_source`
--
ALTER TABLE `modx_access_media_source`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_menus`
--
ALTER TABLE `modx_access_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_namespace`
--
ALTER TABLE `modx_access_namespace`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_permissions`
--
ALTER TABLE `modx_access_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `modx_access_policies`
--
ALTER TABLE `modx_access_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `modx_access_policy_templates`
--
ALTER TABLE `modx_access_policy_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modx_access_policy_template_groups`
--
ALTER TABLE `modx_access_policy_template_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modx_access_resources`
--
ALTER TABLE `modx_access_resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_resource_groups`
--
ALTER TABLE `modx_access_resource_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_access_templatevars`
--
ALTER TABLE `modx_access_templatevars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_actiondom`
--
ALTER TABLE `modx_actiondom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_actions_fields`
--
ALTER TABLE `modx_actions_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `modx_categories`
--
ALTER TABLE `modx_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_content_type`
--
ALTER TABLE `modx_content_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modx_dashboard`
--
ALTER TABLE `modx_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_dashboard_widget`
--
ALTER TABLE `modx_dashboard_widget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modx_deprecated_call`
--
ALTER TABLE `modx_deprecated_call`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modx_deprecated_method`
--
ALTER TABLE `modx_deprecated_method`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modx_documentgroup_names`
--
ALTER TABLE `modx_documentgroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_document_groups`
--
ALTER TABLE `modx_document_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_extension_packages`
--
ALTER TABLE `modx_extension_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_fc_profiles`
--
ALTER TABLE `modx_fc_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_fc_sets`
--
ALTER TABLE `modx_fc_sets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_lexicon_entries`
--
ALTER TABLE `modx_lexicon_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_manager_log`
--
ALTER TABLE `modx_manager_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=466;

--
-- AUTO_INCREMENT for table `modx_media_sources`
--
ALTER TABLE `modx_media_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_membergroup_names`
--
ALTER TABLE `modx_membergroup_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_member_groups`
--
ALTER TABLE `modx_member_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_property_set`
--
ALTER TABLE `modx_property_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_register_queues`
--
ALTER TABLE `modx_register_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modx_register_topics`
--
ALTER TABLE `modx_register_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modx_site_content`
--
ALTER TABLE `modx_site_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `modx_site_htmlsnippets`
--
ALTER TABLE `modx_site_htmlsnippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modx_site_plugins`
--
ALTER TABLE `modx_site_plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_site_snippets`
--
ALTER TABLE `modx_site_snippets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modx_site_templates`
--
ALTER TABLE `modx_site_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modx_site_tmplvars`
--
ALTER TABLE `modx_site_tmplvars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_site_tmplvar_access`
--
ALTER TABLE `modx_site_tmplvar_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_site_tmplvar_contentvalues`
--
ALTER TABLE `modx_site_tmplvar_contentvalues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_transport_providers`
--
ALTER TABLE `modx_transport_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_users`
--
ALTER TABLE `modx_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_user_attributes`
--
ALTER TABLE `modx_user_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modx_user_group_roles`
--
ALTER TABLE `modx_user_group_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modx_user_messages`
--
ALTER TABLE `modx_user_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modx_workspaces`
--
ALTER TABLE `modx_workspaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `previous_bookings`
--
ALTER TABLE `previous_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `reserved_slots`
--
ALTER TABLE `reserved_slots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `sent_invoices`
--
ALTER TABLE `sent_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `website_customer`
--
ALTER TABLE `website_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sent_invoices`
--
ALTER TABLE `sent_invoices`
  ADD CONSTRAINT `fk_sent_invoices_reserved_slot` FOREIGN KEY (`reserved_slot_id`) REFERENCES `reserved_slots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
