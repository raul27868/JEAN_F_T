<?php 
error_reporting(E_ALL);
ini_set('display_errors', 1);
 


$USER = $_POST['user'];

 
$DIR = preg_replace("/\r|\n/", "",shell_exec('pwd'))  . '/users/' . $USER;



#Vacia el ultimo blog
$comando  = 'echo "" > '. $DIR . '/log/last_log.txt';
`$comando`;

$FECHA = `date +"%Y-%m-%d"`;
$FECHA = str_replace("\n", "",$FECHA);

$MESSAGE = $_POST['message'];



//Parametros:
//		user
//		token
//		search_id
//		text
$comando  = 'perl ' . $DIR . '/../../wyylde_bot.pl '.$USER.' '.$_POST['token'].' ' . $_POST['search'] . ' ' .  $_POST['message']  . '>> '.$DIR.'/tmp/'.$FECHA.'_log_wyylde.txt 2>&1 &';
 
  $comando  = 'perl ' . $DIR . '/../../wyylde_bot.pl '.$USER.' '.$_POST['token'].' ' . $_POST['search'] . ' ' .  $_POST['message']  .   ' ' .  $_POST['totalmessages'] . ' >> '.$DIR.'/tmp/'.$FECHA.'_log_wyylde.txt 2>&1 &';


$sal = `$comando`;

echo '<pre>';
echo $comando ;
echo "\n......................................................................\n";
echo $sal;
echo '</pre>';

 exit;
 

 
?>