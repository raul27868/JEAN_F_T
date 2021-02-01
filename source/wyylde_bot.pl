#!/usr/bin/env perl
use Data::Dumper;
use Time::HiRes;
use Time::Local;

use JSON; 
print Dumper(@_);

require './lib/perl_libs.pl';

#PARAMETROS
########################################################################
my $user = shift;		#usuario
my $token = shift;		#token de conexion que puede pasarse por parametro.
my $search_id = shift; #Es  el identificador de las busqueda
my $mensaje = shift;		#mensaje que se va ha enviar
my $total_mensajes = shift;		#total mensaje que se van ha enviar
########################################################################

	#	blacklist, contacts
	#	https://www.wyylde.com/rest/my/contacts?online=0
	#	https://www.wyylde.com/rest/my/blacklist?version=4.1.0



#Carga los contactos
sub get_contacts{ 
	$token = shift;
	$comando  = "curl -s 'https://www.wyylde.com/rest/my/contacts?online=0' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'Authorization: Bearer ". $token . "' -H 'Accept: application/json, text/plain, */*'  -H 'User-Agent: Mozilla/4.0 (Compatible; MSIE 8.0; Windows NT 5.2; Trident/6.0)' -H 'Connection: keep-alive' -H 'If-Modified-Since: Mon, 26 Jul 1997 05:00:00 GMT' -H 'X-version: 1510139124622' -H 'Referer: https://www.wyylde.com/dashboard/wall' --compressed";

	@RET =  ();
	for my $value (@{decode_json(`$comando`)->{'data'}->{'users'}}) {
		push @RET, %$value->{'card'}{'nickname'};
	}
	return @RET;
}

#Carga la lista negra
sub get_blacklist{ 
	$token = shift;
	$comando  = "curl -s 'https://www.wyylde.com/rest/my/blacklist?version=4.1.0' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'Authorization: Bearer ". $token . "' -H 'Accept: application/json, text/plain, */*'  -H 'User-Agent: Mozilla/4.0 (Compatible; MSIE 8.0; Windows NT 5.2; Trident/6.0)' -H 'Connection: keep-alive' -H 'If-Modified-Since: Mon, 26 Jul 1997 05:00:00 GMT' -H 'X-version: 1510139124622' -H 'Referer: https://www.wyylde.com/dashboard/wall' --compressed";

 	@RET =  ();
	for my $value (@{decode_json(`$comando`)->{'data'}->{'blacklist'}}) {
 		push @RET, %$value->{'nickname'} ;
	}
	return @RET;
}

#Carga la lista negra
print("\BLACKLIST:\n");
@BLACKLIST = get_blacklist($token);
print_r(@BLACKLIST);

#Carga los contactos
print("\CONTACTS:\n");
@CONTACTS = get_contacts($token);
print_r(@CONTACTS);

 
 
if ($search_id eq '') {
	print "Error. El valor de search_id es nulo.\n";
	exit;
}



our $DIR =    "./users/" . $user . '/';

my $FILE_UNIQUE = $DIR ."UNIQUE_wyylde";


#Fichero del log
our	$FECHA =   `date +"%y-%m-%d"`;
$FECHA = replace($FECHA,"\n","");
our $filename = $DIR . "log/last_log.txt";
our $filename_log = $DIR . "log/log_wyylde_". $FECHA.".csv";

print "filename:" . $filename . "\n";
print "filename_log:" . $filename_log . "\n";
 
#Genera un agente
our $UserAgent = @AGENTES[int(rand (int @AGENTES))];
$UserAgent = 'Mozilla/4.0 (Compatible; MSIE 8.0; Windows NT 5.2; Trident/6.0)';

print "\nValor de  User:" . $user . "\n";
print "\nValor de  UserAgent:" . $UserAgent . "\n";
print "\nValor de  token                :" . $token . "\n";
 
print "\nValor de  mensaje:" . $mensaje . "\n";
$mensaje = format_msg($mensaje);
print "\nValor de  mensaje2:" . $mensaje . "\n";


print "\nValor de  total_mensajes:" . $total_mensajes . "\n";


 sub format_msg(){
	$msg = shift;
	$msg =~  s/\+/ /g;
	#$msg =~  s/%0A/\\\\n/gi;
	#$msg =~  s/%0R//gi;

	
	#$msg =~ s/%(..)/"\\x".lc($1)/ge;



	return $msg;
 }
 
 


#Realiza la conexion y devuelve el token
if(!$token){
	print  "No hay token. No se puede continual\n";
	exit;
}

#$search_id = "1510152993";
#PENDIENTE. Tomar el  --data-binary

#Para  obtener los usuarios segun la consulta 
$comando = "curl 'https://www.wyylde.com/rest/search/".$search_id."/profile?contact=1&travel=1' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language:en-us, en;q=1.0,fr-ca, fr;q=0.5,pt-br, pt;q=0.5,es;q=0.5' -H 'Authorization: Bearer ".$token."' -H 'Accept: application/json, text/plain, */*' -H 'Cache-Control: no-cache' -H 'X-device: desktop' -H 'User-Agent: ".$UserAgent."'  -H 'Connection: keep-alive' -H 'If-Modified-Since: Mon, 26 Jul 1997 05:00:00 GMT' -H 'X-version: 1510139124622' -H 'Referer: https://www.wyylde.com/search/back' --compressed";
print $comando;
$sal = `$comando`;



print $sal;
my $users = decode_json($sal)->{'data'}->{'users'};

print Dumper($users);

my $resource, $page, $next;
($resource) = (    decode_json($sal)->{'resource'} =~ /search\/[^\/]+\/profile\/([^\-]+)\-/  );
($page) = ( decode_json($sal)->{'resource'} =~ /profile\/[^\-]+\-(\d+)/ ) ;
($next) = decode_json($sal)->{'data'}->{'next'} ;

$page = $page + 20;

 

print "resource:" . $resource  . "\n";
print "page:" . $page  . "\n";
print "next:" . $next  . "\n";
 
print "comando:" . $comando . "\n";
print "TOTAL:" .  $TOTAL ."\n";
print "total_mensajes:" . $total_mensajes . "\n";
   

 my $TOTAL =0;
 
 while ($comando && $TOTAL < $total_mensajes) {		#Se ejecuta mientras haya $comando.  Al final del while se asigna $comando dependiendo de l numero de mensajes enviados y el parametro $total_mensajes a enviar
	$comando = '';

	foreach $user (  @{$users}) {

		#print Dumper($user);
		my $ID = $user->{'id'};
		my $nickname = $user->{'nickname'};

		print "\n\tValor de  id                :" . $ID . "\n";
		print "\tValor de  nickname:" . $nickname  . "\n";

		if (`grep "^$nickname\$" $FILE_UNIQUE.txt` ) {
			print "\tMessage has already been sent to this user\n";
			f_log($ID,$nickname, "Message has already been sent to this user" , $user->{'p1_age'}, $user->{'p1_gender'},  $user->{'postal_address'}, $user->{'nb_followers'} ,'http:'.$user->{'main_pic'},'https://www.wyylde.com/search-result/'.$ID.'/profil')
		} 
		else{
			 
			if ( !grep( /^$nickname$/, @CONTACTS ) && !grep( /^$nickname$/, @BLACKLIST ) ) {


				#Envia el mensaje 
				$comando = q#curl -s 'https://www.wyylde.com/rest/message/send/~id~' -H 'Origin: https://www.wyylde.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language:en-us, en;q=1.0,fr-ca, fr;q=0.5,pt-br, pt;q=0.5,es;q=0.5' -H 'Authorization: Bearer ~token~' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.wyylde.com/search-result/~id~/profil' -H '~agente~' -H 'Connection: keep-alive' --data-binary '{"id":~id~,"msg":"~mensaje~"}' --compressed#;
				$comando =~ s/~id~/$ID/eg;
				$comando =~ s/~token~/$token/eg;
				$comando =~ s/~mensaje~/$mensaje/eg;
				$comando =~ s/~agente~/$UserAgent/eg;

				print "\nValor de  mensaje:" . $mensaje . "\n";

				print $comando;
				print "\n";

				
				#Ejecuta el envio del mensaje 
				#################################################
				$sal = `$comando`;

				
				my $data = decode_json($sal);
	 
				print "\tValor de  status:" . $data->{'status'} . "\n";
				print "\tValor de  errors:" . $data->{'errors'}[0]{'message'}   . "\n";
				
				my $pic = '';
				if ($user->{'main_pic'}) {
					$pic = 'http:' . $user->{'main_pic'};
				}

				if ( $data->{'status'} eq 'success') {
							unique_index($user->{'nickname'} , $FILE_UNIQUE);
							f_log($ID,$user->{'nickname'}, "Message sent OK" , $user->{'p1_age'}, $user->{'p1_gender'},  $user->{'postal_address'}, $user->{'nb_followers'} ,$pic,'https://www.wyylde.com/search-result/'.$ID.'/profil' );
		
							$TOTAL++;
							print "Mensajes enviados :" . $TOTAL . "\n";
							print "total_mensajes       :" . $total_mensajes . "\n\n";
							if (   $TOTAL >= $total_mensajes) {
								last;
							}

				}
				else{
							f_log($ID,$user->{'nickname'}, "Error sending message." , $user->{'p1_age'}, $user->{'p1_gender'},  $user->{'postal_address'}, $user->{'nb_followers'} ,$pic,'https://www.wyylde.com/search-result/'.$ID.'/profil');

				}
				print "\n";
				print "Haciendo un sleep\n";
				sleep(5+rand(5));
				print "Fin de  sleep\n";

			}
			else{
				print($nickname . " en contacts o blacklist");
			
			}

		} #if (`grep "^$ID\$" `) {



	}	#Fin de foreach $user (  @{$users}) {

	print "Mensajes enviados :" . $TOTAL . "\n";
	print "total_mensajes       :" . $total_mensajes . "\n";
	sleep(2);

	if ($TOTAL < $total_mensajes && $next) {
						#Para  obtener los usuarios segun la consulta 
						$comando = "curl 'https://www.wyylde.com/rest/search/default/profile/".$next."?contact=1&travel=1' -X PUT -H 'X-version: 1511451173061' -H 'Origin: https://www.wyylde.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language:en-us, en;q=1.0,fr-ca, fr;q=0.5,pt-br, pt;q=0.5,es;q=0.5' -H 'Authorization: Bearer ".$token."' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.wyylde.com/search/user' -H 'X-device: desktop' -H 'User-Agent: ".$UserAgent."'  -H 'Connection: keep-alive' --data-binary '{}' --compressed";
						print $comando;
						$sal = `$comando`;

						#print $sal;
						$users = [];
						$users = decode_json($sal)->{'data'}->{'users'};

						#print Dumper($users);

						($resource) = (    decode_json($sal)->{'resource'} =~ /search\/[^\/]+\/profile\/([^\-]+)\-/  );
						($page) = ( decode_json($sal)->{'resource'} =~ /profile\/[^\-]+\-(\d+)/ ) ;
						$page = $page + 20;
						($next) = decode_json($sal)->{'data'}->{'next'} ;


						print "resource:" . $resource  . "\n";
						print "page:" . $page  . "\n";
						print "next:" . $next  . "\n";

 	}

}

$comando = 'cat ' .$filename. ' >> ' . $filename_log ;
`$comando`;






 












sub f_log {

	$f =   `date +"%y-%m-%d<br>%H:%M:%S"`;
	chomp $f;

	#print "Fecha:"  . $f . "\n";
	$separador = ';';
 	
	my $fh;
	if (-e $filename ) {
			open ($fh, '>>:encoding(UTF-8)',$filename) or die "Could not open file '$filename' $!";

	}
	else {
			open ($fh, '>:encoding(UTF-8)', $filename) or die "Could not open file '$filename' $!";
			print $fh "date".$separador."id".$separador."nick".$separador."status".$separador."age".$separador."sex".$separador."location".$separador."followers".$separador."pic".$separador."url" ;
			print $fh "\n";

	}
	
	print $fh $f  ;

 	foreach $c (@_) {
			print $fh $separador.$c;
	}
	print $fh "\n";
	
	close $fh;
 }


#Enviar mensaje
#curl 'https://www.wyylde.com/rest/message/send/3191049' -H 'Cookie: optimizelyEndUserId=oeu1508313707911r0.8967788590822747; PAPVisitorId=xhtM94T6Vsjj90AdWSaYCyQACGOHDsFK; optimizelySegments=%7B%225258991135%22%3A%22false%22%2C%225264371200%22%3A%22referral%22%2C%225265341431%22%3A%22gc%22%7D; optimizelyBuckets=%7B%7D; _ga=GA1.2.1863170972.1508313710; _gid=GA1.2.1404108543.1508313710; __stripe_sid=6511662b-47da-4fce-bc6f-92fc4a2e58a1; __stripe_mid=b3bd8047-83cd-410d-8389-4728b2c3e3da' -H 'Origin: https://www.wyylde.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjcmVhdGV0bSI6MTUwODMyMDE4NywiX19pZCI6IjMxNzY4MTUiLCJfX25hbWUiOiJpbG92aXIiLCJfX3N0YXRlcyI6W10sInBhc3N3b3JkX2hhc2giOiIkMnkkMTAkR3E3YlwvT041ZE5hSkVOMEZUUmxlUGV2NE1hOWxVZVkyNFplU0gyTTcwOWM1eEFqMVwvaU1pRyIsInVwZGF0ZXRtIjoxNTA4MzIwMTg4LCJlbWFpbF9oYXNoIjoiJDJ5JDEwJHQ1SE9XNzdxYzg4blA5a1lJZ2FPb2U3d2FKd3liek5kV2Eyc3NSSFU3d2xxRmpLNHVnbnJ5In0.0rPx6p2Az426KfTJAFf28IEFDRAC2VANv01_WOWOK5w' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.wyylde.com/search-result/3191049/profil' -H 'User-Agent: Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/61.0.3163.100 Chrome/61.0.3163.100 Safari/537.36' -H 'Connection: keep-alive' --data-binary $'{"id":3191049,"msg":"Hola Sara!!\\n\xf1\xe0\xe8\xec\xf2\xf9\\n<>\\nhttp://www.google.es"}' --compressed
#{"resource":"\/message\/send\/3191049","cost":196,"status":"success","errors":[],"duration":0.2917,"data":{"id":"3191049:fe1aa380-b3e9-11e7-8d9d-613142da1cf8","url_id":"fe1aa380-b3e9-11e7-8d9d-613142da1cf8","talkid":"3191049:fe1aa380-b3e9-11e7-8d9d-613142da1cf8","talk_urlid":"3191049\/fe1aa380-b3e9-11e7-8d9d-613142da1cf8"}}

#Despues de enviar mensaje se reenvia a:
#curl 'https://www.wyylde.com/rest/shows' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/61.0.3163.100 Chrome/61.0.3163.100 Safari/537.36' -H 'Accept: application/json, text/plain, */*' -H 'Cache-Control: no-cache' -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjcmVhdGV0bSI6MTUwODMyMDE4NywiX19pZCI6IjMxNzY4MTUiLCJfX25hbWUiOiJpbG92aXIiLCJfX3N0YXRlcyI6W10sInBhc3N3b3JkX2hhc2giOiIkMnkkMTAkR3E3YlwvT041ZE5hSkVOMEZUUmxlUGV2NE1hOWxVZVkyNFplU0gyTTcwOWM1eEFqMVwvaU1pRyIsInVwZGF0ZXRtIjoxNTA4MzIwMTg4LCJlbWFpbF9oYXNoIjoiJDJ5JDEwJHQ1SE9XNzdxYzg4blA5a1lJZ2FPb2U3d2FKd3liek5kV2Eyc3NSSFU3d2xxRmpLNHVnbnJ5In0.0rPx6p2Az426KfTJAFf28IEFDRAC2VANv01_WOWOK5w' -H 'Cookie: optimizelyEndUserId=oeu1508313707911r0.8967788590822747; PAPVisitorId=xhtM94T6Vsjj90AdWSaYCyQACGOHDsFK; optimizelySegments=%7B%225258991135%22%3A%22false%22%2C%225264371200%22%3A%22referral%22%2C%225265341431%22%3A%22gc%22%7D; optimizelyBuckets=%7B%7D; _ga=GA1.2.1863170972.1508313710; _gid=GA1.2.1404108543.1508313710; __stripe_sid=6511662b-47da-4fce-bc6f-92fc4a2e58a1; __stripe_mid=b3bd8047-83cd-410d-8389-4728b2c3e3da' -H 'Connection: keep-alive' -H 'If-Modified-Since: Mon, 26 Jul 1997 05:00:00 GMT' -H 'Referer: https://www.wyylde.com/search-result/3191049/profil' --compressed

sub f_connect {
#NO se usa. Se hice para la conexión a través de  fichero en DROPBOX

# Tue, 17 Oct 2017 13:21:04 GMT

 

#Generar nueva cookie. No hace falta
#$comando  = "curl -c ".$DIR."cookie_wyylde.txt -b ".$DIR."cookie_wyylde.txt 'https://www.wyylde.com/' -H 'If-None-Match: W/\"59e603c0-2500\"' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: ".$UserAgent."' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Connection: keep-alive' -H 'If-Modified-Since: ".$DATE."' --compressed";
#print $comando;	
#$sal = `$comando`;
#print $sal;

#curl 'https://www.wyylde.com/rest/authenticate?version=4.1.0' -X PUT -H 'Origin: https://www.wyylde.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'User-Agent: Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/61.0.3163.100 Chrome/61.0.3163.100 Safari/537.36' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.wyylde.com/' -H 'X-Client-Id: 19394cf3dcf5be2212f77ee69bb82cb3395c2c65f764b8346693662831c3137281f2f64e75c92ed6c3848fe578fa7a69779ff5e874d52fa10a82d242afcfa1c2df1c13e969fb8315f2e80b877' -H 'Cookie: optimizelyEndUserId=oeu1508313707911r0.8967788590822747; PAPVisitorId=xhtM94T6Vsjj90AdWSaYCyQACGOHDsFK; optimizelySegments=%7B%225258991135%22%3A%22false%22%2C%225264371200%22%3A%22direct%22%2C%225265341431%22%3A%22gc%22%7D; optimizelyBuckets=%7B%7D; _ga=GA1.2.1863170972.1508313710; _gid=GA1.2.1404108543.1508313710; __stripe_mid=b3bd8047-83cd-410d-8389-4728b2c3e3da' -H 'Connection: keep-alive' --data-binary '{"login":"ilovir","password":"edcedc75","useCookie":0}' --compressed
$comando  = "curl -s  -c ".$DIR."cookie_wyylde.txt -b ".$DIR."cookie_wyylde.txt 'https://www.wyylde.com/rest/authenticate?version=4.1.0' -X PUT -H 'Origin: https://www.wyylde.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-us, en;q=1.0,fr-ca, fr;q=0.5,pt-br, pt;q=0.5,es;q=0.5' -H 'User-Agent: ".$UserAgent."' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://www.wyylde.com/'  -H 'Connection: keep-alive' --data-binary '{\"login\":\"".$PARAMETERS{'user'}."\",\"password\":\"".$PARAMETERS{'password'}."\",\"useCookie\":0}' --compressed  --insecure";
#print $comando;	
$sal = `$comando`;
#print $sal;

($token) = ($sal =~  /"token":"([^"]+)/);
print "\nValor de  token:" . $token . "\n";

return $token;


}




