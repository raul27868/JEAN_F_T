<?php 

 
$DIR = preg_replace("/\r|\n/", "",shell_exec('pwd'))  . '/users/' . $USER;

$USER = $_POST['user'];

#Para el proceso
$comando  = 'pkill -f "wyylde_bot.pl '.$USER.'" ';
`$comando`;

  $comando  = 'pkill -f "wyylde_bot_v2.pl '.$USER.'" ';
`$comando`;

 

 
?> 