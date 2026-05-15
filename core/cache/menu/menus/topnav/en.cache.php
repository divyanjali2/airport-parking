<?php  return array (
  0 => 
  array (
    'text' => 'Content',
    'parent' => 'topnav',
    'action' => '',
    'description' => '',
    'icon' => '<i class="icon-file-text-o icon"></i>',
    'menuindex' => 0,
    'params' => '',
    'handler' => '',
    'permissions' => 'menu_site',
    'namespace' => 'core',
    'id' => 'site',
    'children' => 
    array (
      0 => 
      array (
        'text' => 'Create Resource',
        'parent' => 'site',
        'action' => 'resource/create',
        'description' => 'Create a Resource — usually a web page',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'new_document',
        'namespace' => 'core',
        'id' => 'new_resource',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      1 => 
      array (
        'text' => 'Clear Cache',
        'parent' => 'site',
        'action' => '',
        'description' => 'Delete Cache files in all Contexts',
        'icon' => '',
        'menuindex' => 1,
        'params' => '',
        'handler' => 'MODx.clearCache(); return false;',
        'permissions' => 'empty_cache',
        'namespace' => 'core',
        'id' => 'refresh_site',
        'children' => 
        array (
          0 => 
          array (
            'text' => 'Refresh URIs',
            'parent' => 'refresh_site',
            'action' => '',
            'description' => 'Regenerate system Resource URIs.',
            'icon' => '',
            'menuindex' => 0,
            'params' => '',
            'handler' => 'MODx.refreshURIs(); return false;',
            'permissions' => 'empty_cache',
            'namespace' => 'core',
            'id' => 'refreshuris',
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
        'text' => 'Delete Locks',
        'parent' => 'site',
        'action' => '',
        'description' => 'Delete all locks on Manager pages',
        'icon' => '',
        'menuindex' => 2,
        'params' => '',
        'handler' => 'MODx.removeLocks();return false;',
        'permissions' => 'remove_locks',
        'namespace' => 'core',
        'id' => 'remove_locks',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      3 => 
      array (
        'text' => 'Site Schedule',
        'parent' => 'site',
        'action' => 'resource/site_schedule',
        'description' => 'View Resources with upcoming publish or unpublish dates.',
        'icon' => '',
        'menuindex' => 3,
        'params' => '',
        'handler' => '',
        'permissions' => 'view_document',
        'namespace' => 'core',
        'id' => 'site_schedule',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      4 => 
      array (
        'text' => 'Content Types',
        'parent' => 'site',
        'action' => 'system/contenttype',
        'description' => 'Add content types for resources, such as .html, .js, etc.',
        'icon' => '',
        'menuindex' => 4,
        'params' => '',
        'handler' => '',
        'permissions' => 'content_types',
        'namespace' => 'core',
        'id' => 'content_types',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      5 => 
      array (
        'text' => 'Trash',
        'parent' => 'site',
        'action' => 'resource/trash',
        'description' => 'Manage deleted resources.',
        'icon' => '',
        'menuindex' => 5,
        'params' => '',
        'handler' => '',
        'permissions' => 'menu_trash',
        'namespace' => 'core',
        'id' => 'trash',
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
    'text' => 'Media',
    'parent' => 'topnav',
    'action' => '',
    'description' => '',
    'icon' => '<i class="icon-file-image-o icon"></i>',
    'menuindex' => 1,
    'params' => '',
    'handler' => '',
    'permissions' => 'file_manager',
    'namespace' => 'core',
    'id' => 'media',
    'children' => 
    array (
      0 => 
      array (
        'text' => 'Media Browser',
        'parent' => 'media',
        'action' => 'media/browser',
        'description' => 'View, upload and manage media',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'file_manager',
        'namespace' => 'core',
        'id' => 'file_browser',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
      1 => 
      array (
        'text' => 'Media Sources',
        'parent' => 'media',
        'action' => 'source',
        'description' => 'Media sources for use of media from remote services or servers',
        'icon' => '',
        'menuindex' => 1,
        'params' => '',
        'handler' => '',
        'permissions' => 'sources',
        'namespace' => 'core',
        'id' => 'sources',
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
    'text' => 'Extras',
    'parent' => 'topnav',
    'action' => '',
    'description' => '',
    'icon' => '<i class="icon-cube icon"></i>',
    'menuindex' => 2,
    'params' => '',
    'handler' => '',
    'permissions' => 'components',
    'namespace' => 'core',
    'id' => 'components',
    'children' => 
    array (
      0 => 
      array (
        'text' => 'Installer',
        'parent' => 'components',
        'action' => 'workspaces',
        'description' => 'Manage Add-ons and Distributions',
        'icon' => '',
        'menuindex' => 0,
        'params' => '',
        'handler' => '',
        'permissions' => 'packages',
        'namespace' => 'core',
        'id' => 'installer',
        'children' => 
        array (
        ),
        'controller' => '',
      ),
    ),
    'controller' => '',
  ),
);