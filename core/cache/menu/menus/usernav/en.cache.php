<?php  return array (
  0 => 
  array (
    'text' => 'User',
    'parent' => 'usernav',
    'action' => '',
    'description' => '',
    'icon' => '<span id="user-avatar" title="{$username}">{$userImage}</span> <span id="user-username">{$username}</span>',
    'menuindex' => 0,
    'params' => '',
    'handler' => '',
    'permissions' => 'menu_user',
    'namespace' => 'core',
    'id' => 'user',
    'children' => 
    array (
      0 => 
      array (
        'text' => '{$username}',
        'parent' => 'user',
        'action' => 'security/profile',
        'description' => 'Edit account email, password or info',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'change_profile',
        'namespace' => 'core',
        'id' => '{$username}',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      1 => 
      array (
        'text' => 'Messages',
        'parent' => 'user',
        'action' => 'security/message',
        'description' => 'View and send messages',
        'icon' => '',
        'menuindex' => 1,
        'params' => '',
        'handler' => '',
        'permissions' => 'messages',
        'namespace' => 'core',
        'id' => 'messages',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      2 => 
      array (
        'text' => 'Logout',
        'parent' => 'user',
        'action' => 'security/logout',
        'description' => 'Log out of the Manager',
        'icon' => '',
        'menuindex' => 2,
        'params' => '',
        'handler' => 'MODx.logout(); return false;',
        'permissions' => 'logout',
        'namespace' => 'core',
        'id' => 'logout',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
    ),
    'controller' => '',
  ),
  1 => 
  array (
    'text' => 'Access',
    'parent' => 'usernav',
    'action' => '',
    'description' => '',
    'icon' => '<i class="icon-user-lock icon"></i>',
    'menuindex' => 1,
    'params' => '',
    'handler' => '',
    'permissions' => 'access_permissions',
    'namespace' => 'core',
    'id' => 'access',
    'children' => 
    array (
      0 => 
      array (
        'text' => 'Users',
        'parent' => 'access',
        'action' => 'security/user',
        'description' => 'Manage Users and their Permissions',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'view_user',
        'namespace' => 'core',
        'id' => 'users',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      1 => 
      array (
        'text' => 'Resource Groups',
        'parent' => 'access',
        'action' => 'security/resourcegroup',
        'description' => 'Assign Resources to Groups',
        'icon' => '',
        'menuindex' => 1,
        'params' => '',
        'handler' => '',
        'permissions' => 'access_permissions',
        'namespace' => 'core',
        'id' => 'resource_groups',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      2 => 
      array (
        'text' => 'Access Control Lists',
        'parent' => 'access',
        'action' => 'security/permission',
        'description' => 'Manage Permissions through Groups, Roles and Access Policies',
        'icon' => '',
        'menuindex' => 2,
        'params' => '',
        'handler' => '',
        'permissions' => 'access_permissions',
        'namespace' => 'core',
        'id' => 'acls',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      3 => 
      array (
        'text' => 'Flush Your Permissions',
        'parent' => 'access',
        'action' => '',
        'description' => 'Reload this session’s Permissions',
        'icon' => '',
        'menuindex' => 3,
        'params' => '',
        'handler' => 'MODx.msg.confirm({
                            title: _(\'flush_access\')
                            ,text: _(\'flush_access_confirm\')
                            ,url: MODx.config.connector_url
                            ,params: {
                                action: \'security/access/flush\'
                            }
                            ,listeners: {
                                \'success\': {fn:function() { location.href = \'./\'; },scope:this},
                                \'failure\': {fn:function(response) { Ext.MessageBox.alert(\'failure\', response.responseText); },scope:this},
                            }
                        });',
        'permissions' => 'access_permissions',
        'namespace' => 'core',
        'id' => 'flush_access',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      4 => 
      array (
        'text' => 'Logout All Users',
        'parent' => 'access',
        'action' => '',
        'description' => 'Immediately destroy all sessions',
        'icon' => '',
        'menuindex' => 4,
        'params' => '',
        'handler' => 'MODx.msg.confirm({
                            title: _(\'flush_sessions\')
                            ,text: _(\'flush_sessions_confirm\')
                            ,url: MODx.config.connector_url
                            ,params: {
                                action: \'security/flush\'
                            }
                            ,listeners: {
                                \'success\': {fn:function() { location.href = \'./\'; },scope:this}
                            }
                        });',
        'permissions' => 'flush_sessions',
        'namespace' => 'core',
        'id' => 'flush_sessions',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
    ),
    'controller' => '',
  ),
  2 => 
  array (
    'text' => 'Admin',
    'parent' => 'usernav',
    'action' => '',
    'description' => '',
    'icon' => '<i class="icon-gear icon"></i>',
    'menuindex' => 2,
    'params' => '',
    'handler' => '',
    'permissions' => 'settings',
    'namespace' => 'core',
    'id' => 'admin',
    'children' => 
    array (
      0 => 
      array (
        'text' => 'System Settings',
        'parent' => 'admin',
        'action' => 'system/settings',
        'description' => 'Configure all system settings',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'settings',
        'namespace' => 'core',
        'id' => 'system_settings',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      1 => 
      array (
        'text' => 'Form Customization',
        'parent' => 'admin',
        'action' => 'security/forms',
        'description' => 'Create bespoke MODX Manager interfaces',
        'icon' => '',
        'menuindex' => 1,
        'params' => '',
        'handler' => '',
        'permissions' => 'customize_forms',
        'namespace' => 'core',
        'id' => 'form_customization',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      2 => 
      array (
        'text' => 'Property Sets',
        'parent' => 'admin',
        'action' => 'element/propertyset',
        'description' => 'Manage Element property sets',
        'icon' => '',
        'menuindex' => 2,
        'params' => '',
        'handler' => '',
        'permissions' => 'property_sets',
        'namespace' => 'core',
        'id' => 'propertysets',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      3 => 
      array (
        'text' => 'Menus',
        'parent' => 'admin',
        'action' => 'system/action',
        'description' => 'Manage the main Manager menu',
        'icon' => '',
        'menuindex' => 3,
        'params' => '',
        'handler' => '',
        'permissions' => 'actions',
        'namespace' => 'core',
        'id' => 'edit_menu',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      4 => 
      array (
        'text' => 'Contexts',
        'parent' => 'admin',
        'action' => 'context',
        'description' => 'Manage Contexts and their settings',
        'icon' => '',
        'menuindex' => 4,
        'params' => '',
        'handler' => '',
        'permissions' => 'view_context',
        'namespace' => 'core',
        'id' => 'contexts',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      5 => 
      array (
        'text' => 'Dashboards',
        'parent' => 'admin',
        'action' => 'system/dashboards',
        'description' => 'Manage custom login Dashboards',
        'icon' => '',
        'menuindex' => 5,
        'params' => '',
        'handler' => '',
        'permissions' => 'dashboards',
        'namespace' => 'core',
        'id' => 'dashboards',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      6 => 
      array (
        'text' => 'Namespaces',
        'parent' => 'admin',
        'action' => 'workspaces/namespace',
        'description' => 'Distinguish between Add-on settings',
        'icon' => '',
        'menuindex' => 6,
        'params' => '',
        'handler' => '',
        'permissions' => 'namespaces',
        'namespace' => 'core',
        'id' => 'namespaces',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      7 => 
      array (
        'text' => 'Lexicons',
        'parent' => 'admin',
        'action' => 'workspaces/lexicon',
        'description' => 'Edit Manager language strings',
        'icon' => '',
        'menuindex' => 7,
        'params' => '',
        'handler' => '',
        'permissions' => 'lexicons',
        'namespace' => 'core',
        'id' => 'lexicon_management',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      8 => 
      array (
        'text' => 'Toggle language',
        'parent' => 'admin',
        'action' => '',
        'description' => 'Select the appropriate manager language',
        'icon' => '',
        'menuindex' => 8,
        'params' => '',
        'handler' => '',
        'permissions' => 'language',
        'namespace' => 'core',
        'id' => 'language',
        'children' => 
        array (
          'ar' => 
          array (
            'id' => 'ar',
            'text' => 'Arabic',
            'description' => 'Arabic <b>AR</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("ar"); return false;',
            'permissions' => '',
          ),
          'az' => 
          array (
            'id' => 'az',
            'text' => 'language_az',
            'description' => 'language_az <b>AZ</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("az"); return false;',
            'permissions' => '',
          ),
          'be' => 
          array (
            'id' => 'be',
            'text' => 'Беларуская',
            'description' => 'Belarusian <b>BE</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("be"); return false;',
            'permissions' => '',
          ),
          'bg' => 
          array (
            'id' => 'bg',
            'text' => 'Bulgarian',
            'description' => 'Bulgarian <b>BG</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("bg"); return false;',
            'permissions' => '',
          ),
          'cs' => 
          array (
            'id' => 'cs',
            'text' => 'Čeština',
            'description' => 'Czech <b>CS</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("cs"); return false;',
            'permissions' => '',
          ),
          'da' => 
          array (
            'id' => 'da',
            'text' => 'Danish',
            'description' => 'Danish <b>DA</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("da"); return false;',
            'permissions' => '',
          ),
          'de' => 
          array (
            'id' => 'de',
            'text' => 'Deutsch',
            'description' => 'German <b>DE</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("de"); return false;',
            'permissions' => '',
          ),
          'el' => 
          array (
            'id' => 'el',
            'text' => 'Greek',
            'description' => 'Greek <b>EL</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("el"); return false;',
            'permissions' => '',
          ),
          'en' => 
          array (
            'id' => 'en',
            'text' => 'English',
            'description' => 'English <b>EN</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("en"); return false;',
            'permissions' => '',
          ),
          'es' => 
          array (
            'id' => 'es',
            'text' => 'Spanish',
            'description' => 'Spanish <b>ES</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("es"); return false;',
            'permissions' => '',
          ),
          'et' => 
          array (
            'id' => 'et',
            'text' => 'Estonian',
            'description' => 'Estonian <b>ET</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("et"); return false;',
            'permissions' => '',
          ),
          'fa' => 
          array (
            'id' => 'fa',
            'text' => 'Persian',
            'description' => 'Persian <b>FA</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("fa"); return false;',
            'permissions' => '',
          ),
          'fi' => 
          array (
            'id' => 'fi',
            'text' => 'Finnish',
            'description' => 'Finnish <b>FI</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("fi"); return false;',
            'permissions' => '',
          ),
          'fr' => 
          array (
            'id' => 'fr',
            'text' => 'Français',
            'description' => 'French <b>FR</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("fr"); return false;',
            'permissions' => '',
          ),
          'he' => 
          array (
            'id' => 'he',
            'text' => 'Hebrew',
            'description' => 'Hebrew <b>HE</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("he"); return false;',
            'permissions' => '',
          ),
          'hi' => 
          array (
            'id' => 'hi',
            'text' => 'हिंदी',
            'description' => 'Hindi <b>HI</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("hi"); return false;',
            'permissions' => '',
          ),
          'hu' => 
          array (
            'id' => 'hu',
            'text' => 'magyar',
            'description' => 'Hungarian <b>HU</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("hu"); return false;',
            'permissions' => '',
          ),
          'id' => 
          array (
            'id' => 'id',
            'text' => 'Indonesian',
            'description' => 'Indonesian <b>ID</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("id"); return false;',
            'permissions' => '',
          ),
          'it' => 
          array (
            'id' => 'it',
            'text' => 'Italiano',
            'description' => 'Italian <b>IT</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("it"); return false;',
            'permissions' => '',
          ),
          'ja' => 
          array (
            'id' => 'ja',
            'text' => 'Japanese',
            'description' => 'Japanese <b>JA</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("ja"); return false;',
            'permissions' => '',
          ),
          'nl' => 
          array (
            'id' => 'nl',
            'text' => 'Nederlands',
            'description' => 'Dutch <b>NL</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("nl"); return false;',
            'permissions' => '',
          ),
          'pl' => 
          array (
            'id' => 'pl',
            'text' => 'Polish',
            'description' => 'Polish <b>PL</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("pl"); return false;',
            'permissions' => '',
          ),
          'pt' => 
          array (
            'id' => 'pt',
            'text' => 'Portuguese',
            'description' => 'Portuguese <b>PT</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("pt"); return false;',
            'permissions' => '',
          ),
          'ro' => 
          array (
            'id' => 'ro',
            'text' => 'Romanian',
            'description' => 'Romanian <b>RO</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("ro"); return false;',
            'permissions' => '',
          ),
          'ru' => 
          array (
            'id' => 'ru',
            'text' => 'Русский',
            'description' => 'Russian <b>RU</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("ru"); return false;',
            'permissions' => '',
          ),
          'sl' => 
          array (
            'id' => 'sl',
            'text' => 'language_sl',
            'description' => 'language_sl <b>SL</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("sl"); return false;',
            'permissions' => '',
          ),
          'sv' => 
          array (
            'id' => 'sv',
            'text' => 'Svenska',
            'description' => 'Swedish <b>SV</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("sv"); return false;',
            'permissions' => '',
          ),
          'th' => 
          array (
            'id' => 'th',
            'text' => 'Thai',
            'description' => 'Thai <b>TH</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("th"); return false;',
            'permissions' => '',
          ),
          'tr' => 
          array (
            'id' => 'tr',
            'text' => 'Turkish',
            'description' => 'Turkish <b>TR</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("tr"); return false;',
            'permissions' => '',
          ),
          'uk' => 
          array (
            'id' => 'uk',
            'text' => 'Українська',
            'description' => 'Ukrainian <b>UK</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("uk"); return false;',
            'permissions' => '',
          ),
          'yo' => 
          array (
            'id' => 'yo',
            'text' => 'Yoruba',
            'description' => 'Yoruba <b>YO</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("yo"); return false;',
            'permissions' => '',
          ),
          'zh' => 
          array (
            'id' => 'zh',
            'text' => '简体中文',
            'description' => 'Chinese simplified <b>ZH</b>',
            'parent' => 'language',
            'handler' => 'MODx.switchLanguage("zh"); return false;',
            'permissions' => '',
          ),
        ),
        'controller' => '',
      ),
      9 => 
      array (
        'text' => 'Reports',
        'parent' => 'admin',
        'action' => '',
        'description' => 'Admin reports for your MODX install',
        'icon' => '',
        'menuindex' => 9,
        'params' => '',
        'handler' => '',
        'permissions' => 'menu_reports',
        'namespace' => 'core',
        'id' => 'reports',
        'children' => 
        array (
          0 => 
          array (
            'text' => 'Manager Actions',
            'parent' => 'reports',
            'action' => 'system/logs',
            'description' => 'View the recent manager activity.',
            'icon' => '',
            'menuindex' => 0,
            'params' => '',
            'handler' => '',
            'permissions' => 'mgr_log_view',
            'namespace' => 'core',
            'id' => 'view_logging',
            'children' => 
            array (
            ),
            'controller' => '',
          ),
          1 => 
          array (
            'text' => 'Error Log',
            'parent' => 'reports',
            'action' => 'system/event',
            'description' => 'View the MODX error.log.',
            'icon' => '',
            'menuindex' => 1,
            'params' => '',
            'handler' => '',
            'permissions' => 'view_eventlog',
            'namespace' => 'core',
            'id' => 'eventlog_viewer',
            'children' => 
            array (
            ),
            'controller' => '',
          ),
          2 => 
          array (
            'text' => 'System Info',
            'parent' => 'reports',
            'action' => 'system/info',
            'description' => 'View server information, such as phpinfo, database info, and more.',
            'icon' => '',
            'menuindex' => 2,
            'params' => '',
            'handler' => '',
            'permissions' => 'view_sysinfo',
            'namespace' => 'core',
            'id' => 'view_sysinfo',
            'children' => 
            array (
            ),
            'controller' => '',
          ),
        ),
        'controller' => '',
      ),
    ),
    'controller' => '',
  ),
  3 => 
  array (
    'text' => 'About',
    'parent' => 'usernav',
    'action' => 'help',
    'description' => 'Help!',
    'icon' => '<i class="icon-question-circle icon"></i>',
    'menuindex' => 3,
    'params' => '',
    'handler' => '',
    'permissions' => 'help',
    'namespace' => 'core',
    'id' => 'about',
    'children' => 
    array (
    ),
    'controller' => '',
  ),
);