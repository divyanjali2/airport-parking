<?php
/* Smarty version 4.5.6, created on 2026-04-24 08:24:24
  from 'C:\xampp\htdocs\airport\manager\templates\default\footer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.6',
  'unifunc' => 'content_69eb0c98168269_18838344',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3640a420c64e925d61203c657c341e547c57877b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\airport\\manager\\templates\\default\\footer.tpl',
      1 => 1776409521,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_69eb0c98168269_18838344 (Smarty_Internal_Template $_smarty_tpl) {
?>    </div>
    <!-- #modx-content-->
    <div id="modx-footer"></div>
</div>
<!-- #modx-container -->

<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['jsbody']->value, 'scr');
$_smarty_tpl->tpl_vars['scr']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['scr']->value) {
$_smarty_tpl->tpl_vars['scr']->do_else = false;
?>
    <?php echo $_smarty_tpl->tpl_vars['scr']->value;?>

<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

</body>
</html>
<?php }
}
