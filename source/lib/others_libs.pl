use Time::HiRes;
use Encode;
#use XML::Simple;

our $__PATRON_EMAIL = '[^\/_a-zA-Z\x2E\x2D\d]([_a-zA-Z\x2E\x2D\d]+\@[_a-zA-Z\x2E\x2D\d]+\.[_a-zA-Z\x2E\x2D\d]+)[^_a-zA-Z\x2E\x2D\d]'; 

our @__EMAIL_NO_VALID = ('your@email.com','example@example.com' );

sub HOY{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

	return sprintf("%04d", $year+1900). '-' . sprintf("%02d", $mon+1) . '-' . sprintf("%02d", $mday);
}

sub AYER{
	my $today = time;
	my $yesterday = $today - 60 * 24 * 60;
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($yesterday);

	return sprintf("%04d", $year+1900). '-' . sprintf("%02d", $mon+1) . '-' . sprintf("%02d", $mday);
}

sub MANANA{
	my $today = time;
	my $yesterday = $today + 60 * 24 * 60;
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($yesterday);

	return sprintf("%04d", $year+1900). '-' . sprintf("%02d", $mon+1) . '-' . sprintf("%02d", $mday);
}

sub AHORA{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

	return sprintf("%02d", $hour). ':' . sprintf("%02d", $min) . ':' . sprintf("%02d", $sec);
}

 

our %DAYS ;
$DAYS{'Wednesday'}='Miercoles';
$DAYS{'Saturday'}='Sabado';
$DAYS{'Monday'}='Lunes';
$DAYS{'Friday'}='Viernes';
$DAYS{'Tuesday'}='Martes';
$DAYS{'Sunday'}='Domingo';
$DAYS{'Thursday'}='Jueves';

our %MONTHS ;
$MONTHS{'Jan'}='01';
$MONTHS{'Feb'}='02';
$MONTHS{'Mar'}='03';
$MONTHS{'Apr'}='04';
$MONTHS{'May'}='05';
$MONTHS{'Jun'}='06';
$MONTHS{'Jul'}='07';
$MONTHS{'Aug'}='08';
$MONTHS{'Sep'}='09';
$MONTHS{'Oct'}='10';
$MONTHS{'Nov'}='11';
$MONTHS{'Dec'}='12';

$MONTHS{'January'}='01';
$MONTHS{'February'}='02';
$MONTHS{'March'}='03';
$MONTHS{'April'}='04';
$MONTHS{'May'}='05';
$MONTHS{'June'}='06';
$MONTHS{'July'}='07';
$MONTHS{'August'}='08';
$MONTHS{'September'}='09';
$MONTHS{'October'}='10';
$MONTHS{'November'}='11';
$MONTHS{'December'}='12';
$MONTHS{'01'}='January';
$MONTHS{'02'}='February';
$MONTHS{'03'}='March';
$MONTHS{'04'}='April';
$MONTHS{'05'}='May';
$MONTHS{'06'}='June';
$MONTHS{'07'}='July';
$MONTHS{'08'}='August';
$MONTHS{'09'}='September';
$MONTHS{'10'}='October';
$MONTHS{'11'}='November';
$MONTHS{'12'}='December';
$MONTHS{'Enero'}='01';
$MONTHS{'Febrero'}='02';
$MONTHS{'Marzo'}='03';
$MONTHS{'Abril'}='04';
$MONTHS{'Mayo'}='05';
$MONTHS{'Junio'}='06';
$MONTHS{'Julio'}='07';
$MONTHS{'Agosto'}='08';
$MONTHS{'Septiembre'}='09';
$MONTHS{'Octubre'}='10';
$MONTHS{'Noviembre'}='11';
$MONTHS{'Diciembre'}='12';
$MONTHS{'enero'}='01';
$MONTHS{'febrero'}='02';
$MONTHS{'marzo'}='03';
$MONTHS{'abril'}='04';
$MONTHS{'mayo'}='05';
$MONTHS{'junio'}='06';
$MONTHS{'julio'}='07';
$MONTHS{'agosto'}='08';
$MONTHS{'septiembre'}='09';
$MONTHS{'octubre'}='10';
$MONTHS{'noviembre'}='11';
$MONTHS{'diciembre'}='12';

our %MES;
$MES{'enero'} = '01';
$MES{'febrero'} = '02';
$MES{'marzo'} = '03';
$MES{'abril'} = '04';
$MES{'mayo'} = '05';
$MES{'junio'} = '06';
$MES{'julio'} = '07';
$MES{'agosto'} = '08';
$MES{'septiembre'} = '09';
$MES{'octubre'} = '10';
$MES{'noviembre'} = '11';
$MES{'diciembre'} = '12';

$MES{'01'}='enero';
$MES{'02'}='febrero';
$MES{'03'}='marzo';
$MES{'04'}='abril';
$MES{'05'}='mayo';
$MES{'06'}='junio';
$MES{'07'}='julio';
$MES{'08'}='agosto';
$MES{'09'}='septiembre';
$MES{'10'}='octubre';
$MES{'11'}='noviembre';
$MES{'12'}='diciembre';
$MES{'1'}='enero';
$MES{'2'}='febrero';
$MES{'3'}='marzo';
$MES{'4'}='abril';
$MES{'5'}='mayo';
$MES{'6'}='junio';
$MES{'7'}='julio';
$MES{'8'}='agosto';
$MES{'9'}='septiembre';

$MONTHS_TRAD{'January'}='enero';
$MONTHS_TRAD{'February'}='febreo';
$MONTHS_TRAD{'March'}='marzo';
$MONTHS_TRAD{'April'}='abril';
$MONTHS_TRAD{'May'}='mayo';
$MONTHS_TRAD{'June'}='junio';
$MONTHS_TRAD{'July'}='julio';
$MONTHS_TRAD{'August'}='agosto';
$MONTHS_TRAD{'September'}='septiembre';
$MONTHS_TRAD{'October'}='octubre';
$MONTHS_TRAD{'November'}='noviembre';
$MONTHS_TRAD{'December'}='diciembre';


#Otros agentes: http://www.useragentstring.com/pages/useragentstring.php
our @AGENTES=(
'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2224.3 Safari/537.36',
'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36',
'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36',
'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2309.372 Safari/537.36',
'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2117.157 Safari/537.36',
'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/51.0.2704.79 Chrome/51.0.2704.79 Safari/537.36',
'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0',
'Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0',
'Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0',
'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/29.0',
'Mozilla/5.0 (X11; OpenBSD amd64; rv:28.0) Gecko/20100101 Firefox/28.0',
'Mozilla/5.0 (X11; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0',
'Mozilla/5.0 (Windows NT 6.1; rv:27.3) Gecko/20130101 Firefox/27.3',
'Mozilla/5.0 (Windows NT 6.2; Win64; x64; rv:27.0) Gecko/20121011 Firefox/27.0',
'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0',
'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0',
'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0',
'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0',
'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:24.0) Gecko/20100101 Firefox/24.0',
'Mozilla/5.0 (Windows NT 6.2; rv:22.0) Gecko/20130405 Firefox/23.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20130406 Firefox/23.0',
'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:23.0) Gecko/20131011 Firefox/23.0',
'Mozilla/5.0 (Windows NT 6.2; rv:22.0) Gecko/20130405 Firefox/22.0',
'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:22.0) Gecko/20130328 Firefox/22.0',
'Mozilla/5.0 (Windows NT 6.1; rv:22.0) Gecko/20130405 Firefox/22.0',
'Mozilla/5.0 (Microsoft Windows NT 6.2.9200.0); rv:22.0) Gecko/20130405 Firefox/22.0',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 7.0; InfoPath.3; .NET CLR 3.1.40767; Trident/6.0; en-IN)',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/5.0)',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/4.0; InfoPath.2; SV1; .NET CLR 2.0.50727; WOW64)',
'Mozilla/5.0 (compatible; MSIE 10.0; Macintosh; Intel Mac OS X 10_7_3; Trident/6.0)',
'Mozilla/4.0 (Compatible; MSIE 8.0; Windows NT 5.2; Trident/6.0)',
'Mozilla/4.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/5.0)',
'Mozilla/1.22 (compatible; MSIE 10.0; Windows 3.1)',
'Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))',
'Mozilla/5.0 (Windows; U; MSIE 9.0; Windows NT 9.0; en-US)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 7.1; Trident/5.0)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8; Zune 4.7',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; chromeframe/12.0.742.112)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 2.0.50727; Media Center PC 6.0)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; Tablet PC 2.0; InfoPath.3; .NET4.0C; .NET4.0E)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; yie8)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; .NET CLR 1.1.4322; .NET4.0C; Tablet PC 2.0)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; FunWebProducts)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; chromeframe/13.0.782.215)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; chromeframe/11.0.696.57)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0) chromeframe/10.0.648.205',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0; GTB7.4; InfoPath.1; SV1; .NET CLR 2.8.52393; WOW64; en-US)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0; chromeframe/11.0.696.57)',
'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/4.0; GTB7.4; InfoPath.3; SV1; .NET CLR 3.1.76908; WOW64; en-US)',
);



@UNIQUE_INDEX = ();
#http://www.degraeve.com/reference/specialcharacters.php - Special Characters in HTML

###########################################################
#Funcion concat
#   Concatena como texto los parametros pasados como parametro. Se crea esta funcion para usarla en el apartado de formulas
#	Parametros:
#		- cadenas de texto
 
sub concat{

my $resultado = '';
	foreach my $elemento (@_) 	{
	
	$resultado = $resultado .   $elemento ;
	
	} 
return $resultado;
}

###########################################################
#Funcion OR
#   Simula la funcion OR para poder usarla en las funciones. El || no funciona.
#	Parametros:
#		- cadenas de texto
 
sub OR{

my $resultado = '';

foreach my $elemento (@_) 	{
	if (eval($elemento)) {
		return 1;
	}
} 
return $resultado;
}

###########################################################
#Funcion nvl
#   Simula la funcion nvl. 
#	Parametros:
#		- cadenas de texto
sub nvl {
my($valor, $defecto) = @_;
	if ($valor  ) {
		return $valor;
	}
	else {
		return $defecto;
	}
} 
###########################################################
#Funcion replace
#   Simula la funcion replace. Reemplazar texto en una cadena 
#	Parametros:
#		- cadenas de texto, cadena a reemplazar, cadena de reemplazo
sub replace {
my($cadena, $cambia, $por) = @_;

#print "Cadena: " . $cadena . "\n";
#print "Cambia: " . $cambia . "\n";
#print "Por: " . $por . "\n";

#$cadena =~ s/[\n\r]//g;
$cadena =~ s/$cambia/$por/g;
return $cadena;

} 

 
###########################################################
#Funcion lpad
#   Simula la funcion lpad. Se crea esta funcion para usarla en el apartado de formulas
#	Parametros:
#		- cadenas de texto
sub lpad {
my($str, $len, $chr) = @_;
$chr = " " unless (defined($chr));
return substr(($chr x $len) . $str, -1 * $len, $len);
} 

###########################################################
#Funcion rpad
#   Simula la funcion rpad. Se crea esta funcion para usarla en el apartado de formulas
#	Parametros:
#		- cadenas de texto
sub rpad {
my($str, $len, $chr) = @_;
$chr = " " unless (defined($chr));
return substr($str . ($chr x $len), 0, $len);
}

###########################################################
#Funcion print_r
#   Simula la funcion print_r de PHP para escribir estructuras 
#	Parametros:
   
sub print_r {
    package print_r;
    our $level;
    our @level_index;
    if ( ! defined $level ) { $level = 0 };
    if (! @level_index) { $level_index[$level] = 0 };

    for ( @_ ) {
        my $element = $_;
        my $index   = $level_index[$level];

        print "\t" x $level . "[$index] => ";

        if ( ref($element) eq 'ARRAY' ) {
            my $array = $_;

            $level_index[++$level] = 0;

            print "(Array)\n";

            for ( @$array ) {
                main::print_r( $_ );
            }
            --$level if ( $level > 0 );
        } elsif ( ref($element) eq 'HASH' ) {
            my $hash = $_;

            print "(Hash)\n";

            ++$level;

            for ( keys %$hash ) {
                $level_index[$level] = $_;
                main::print_r( $$hash{$_} );
            }
        } else {
            print "$element\n";
        }

        $level_index[$level]++;
    }
} # End print_r

###########################################################
#Funcion url_encode
#   Codifica los caracteres especiales de una url 
#	Parametros: url

sub url_encode {

    my $text = shift;

	$text =~ s/([^a-z0-9_.!~*'(  ) -])/sprintf "%%%02X", ord($1)/gei;

    $text =~ s/ /+/g;

	$text =~ s/\:/%3A/g;
	$text =~ s/\//%2F/g;

    return $text;

}

###########################################################
#Funcion url_decode
#   Convierte caracteres UTF-8 UTF-16 a entidades HTML
#	Parametros: texto

sub f_convert_html_entities{
	$ret = shift;

 	$ret =~ s/\xc2\xa1/&\#x00A1;/gi;
	$ret =~ s/\xc2\xa2/&\#x00A2;/gi;
	$ret =~ s/\xc2\xa3/&\#x00A3;/gi;
	$ret =~ s/\xc2\xa4/&\#x00A4;/gi;
	$ret =~ s/\xc2\xa5/&\#x00A5;/gi;
	$ret =~ s/\xc2\xa6/&\#x00A6;/gi;
	$ret =~ s/\xc2\xa7/&\#x00A7;/gi;
	$ret =~ s/\xc2\xa8/&\#x00A8;/gi;
	$ret =~ s/\xc2\xa9/&\#x00A9;/gi;
	$ret =~ s/\xc2\xaa/&\#x00AA;/gi;
	$ret =~ s/\xc2\xab/&\#x00AB;/gi;
	$ret =~ s/\xc2\xac/&\#x00AC;/gi;
	$ret =~ s/\xc2\xad/&\#x00AD;/gi;
	$ret =~ s/\xc2\xae/&\#x00AE;/gi;
	$ret =~ s/\xc2\xaf/&\#x00AF;/gi;
	$ret =~ s/\xc2\xb0/&\#x00B0;/gi;
	$ret =~ s/\xc2\xb1/&\#x00B1;/gi;
	$ret =~ s/\xc2\xb2/&\#x00B2;/gi;
	$ret =~ s/\xc2\xb3/&\#x00B3;/gi;
	$ret =~ s/\xc2\xb4/&\#x00B4;/gi;
	$ret =~ s/\xc2\xb5/&\#x00B5;/gi;
	$ret =~ s/\xc2\xb6/&\#x00B6;/gi;
	$ret =~ s/\xc2\xb7/&\#x00B7;/gi;
	$ret =~ s/\xc2\xb8/&\#x00B8;/gi;
	$ret =~ s/\xc2\xb9/&\#x00B9;/gi;
	$ret =~ s/\xc2\xba/&\#x00BA;/gi;
	$ret =~ s/\xc2\xbb/&\#x00BB;/gi;
	$ret =~ s/\xc2\xbc/&\#x00BC;/gi;
	$ret =~ s/\xc2\xbd/&\#x00BD;/gi;
	$ret =~ s/\xc2\xbe/&\#x00BE;/gi;
	$ret =~ s/\xc2\xbf/&\#x00BF;/gi;
	$ret =~ s/\xc3\x80/&\#x00C0;/gi;
	$ret =~ s/\xc3\x81/&\#x00C1;/gi;
	$ret =~ s/\xc3\x82/&\#x00C2;/gi;
	$ret =~ s/\xc3\x83/&\#x00C3;/gi;
	$ret =~ s/\xc3\x84/&\#x00C4;/gi;
	$ret =~ s/\xc3\x85/&\#x00C5;/gi;
	$ret =~ s/\xc3\x86/&\#x00C6;/gi;
	$ret =~ s/\xc3\x87/&\#x00C7;/gi;
	$ret =~ s/\xc3\x88/&\#x00C8;/gi;
	$ret =~ s/\xc3\x89/&\#x00C9;/gi;
	$ret =~ s/\xc3\x8a/&\#x00CA;/gi;
	$ret =~ s/\xc3\x8b/&\#x00CB;/gi;
	$ret =~ s/\xc3\x8c/&\#x00CC;/gi;
	$ret =~ s/\xc3\x8d/&\#x00CD;/gi;
	$ret =~ s/\xc3\x8e/&\#x00CE;/gi;
	$ret =~ s/\xc3\x8f/&\#x00CF;/gi;
	$ret =~ s/\xc3\x90/&\#x00D0;/gi;
	$ret =~ s/\xc3\x91/&\#x00D1;/gi;
	$ret =~ s/\xc3\x92/&\#x00D2;/gi;
	$ret =~ s/\xc3\x93/&\#x00D3;/gi;
	$ret =~ s/\xc3\x94/&\#x00D4;/gi;
	$ret =~ s/\xc3\x95/&\#x00D5;/gi;
	$ret =~ s/\xc3\x96/&\#x00D6;/gi;
	$ret =~ s/\xc3\x97/&\#x00D7;/gi;
	$ret =~ s/\xc3\x98/&\#x00D8;/gi;
	$ret =~ s/\xc3\x99/&\#x00D9;/gi;
	$ret =~ s/\xc3\x9a/&\#x00DA;/gi;
	$ret =~ s/\xc3\x9b/&\#x00DB;/gi;
	$ret =~ s/\xc3\x9c/&\#x00DC;/gi;
	$ret =~ s/\xc3\x9d/&\#x00DD;/gi;
	$ret =~ s/\xc3\x9e/&\#x00DE;/gi;
	$ret =~ s/\xc3\x9f/&\#x00DF;/gi;
	$ret =~ s/\xc3\xa0/&\#x00E0;/gi;
	$ret =~ s/\xc3\xa1/&\#x00E1;/gi;
	$ret =~ s/\xc3\xa2/&\#x00E2;/gi;
	$ret =~ s/\xc3\xa3/&\#x00E3;/gi;
	$ret =~ s/\xc3\xa4/&\#x00E4;/gi;
	$ret =~ s/\xc3\xa5/&\#x00E5;/gi;
	$ret =~ s/\xc3\xa6/&\#x00E6;/gi;
	$ret =~ s/\xc3\xa7/&\#x00E7;/gi;
	$ret =~ s/\xc3\xa8/&\#x00E8;/gi;
	$ret =~ s/\xc3\xa9/&\#x00E9;/gi;
	$ret =~ s/\xc3\xaa/&\#x00EA;/gi;
	$ret =~ s/\xc3\xab/&\#x00EB;/gi;
	$ret =~ s/\xc3\xac/&\#x00EC;/gi;
	$ret =~ s/\xc3\xad/&\#x00ED;/gi;
	$ret =~ s/\xc3\xae/&\#x00EE;/gi;
	$ret =~ s/\xc3\xaf/&\#x00EF;/gi;
	$ret =~ s/\xc3\xb0/&\#x00F0;/gi;
	$ret =~ s/\xc3\xb1/&\#x00F1;/gi;
	$ret =~ s/\xc3\xb2/&\#x00F2;/gi;
	$ret =~ s/\xc3\xb3/&\#x00F3;/gi;
	$ret =~ s/\xc3\xb4/&\#x00F4;/gi;
	$ret =~ s/\xc3\xb5/&\#x00F5;/gi;
	$ret =~ s/\xc3\xb6/&\#x00F6;/gi;
	$ret =~ s/\xc3\xb7/&\#x00F7;/gi;
	$ret =~ s/\xc3\xb8/&\#x00F8;/gi;
	$ret =~ s/\xc3\xb9/&\#x00F9;/gi;
	$ret =~ s/\xc3\xba/&\#x00FA;/gi;
	$ret =~ s/\xc3\xbb/&\#x00FB;/gi;
	$ret =~ s/\xc3\xbc/&\#x00FC;/gi;
	$ret =~ s/\xc3\xbd/&\#x00FD;/gi;
	$ret =~ s/\xc3\xbe/&\#x00FE;/gi;
	$ret =~ s/\xc3\xbf/&\#x00FF;/gi;


	return $ret;
}


###########################################################
#Funcion url_decode
#   Codifica los caracteres especiales de una url 
#	Parametros: url


sub url_decode {

    my $text = shift;

    $text =~ tr/\+/ /;

    $text =~ s/%([a-f0-9][a-f0-9])/chr( hex( $1 ) )/gei;


    return $text;

}
###########################################################
#Funcion unicode_decode
#   Decodifica una cadena que tiene caracteres con codificacion Unicode.p.ej \u0041
#     Solo para los ASCII que llevan 4 digitos
#	Parametros: cadena
sub unicode_decode {

    my $text = shift;

    $text =~ s/\\u([a-f0-9][a-f0-9][a-f0-9][a-f0-9])/chr( hex( $1 ) )/gei;

   return $text;
}


###########################################################
#Funcion ascii_to_htmlcode
#   Decodifica una cadena con los valores superiores en ascii a 255 en correspondientes html codes.
#	Parametros: cadena
sub ascii_to_htmlcode {
    my $text = shift;
    my $_ret_;

	for($i = 0; $i < length($text); $i++) 	{
		$c=substr($text,$i,1); 
		if( int ord($c) > 128){ 
			print "\n" . $c ."==". ord($c). "..__ Cambia por" . "&#" . ord($c) .";" ; 
			$_ret_= $_ret_ . '&#' . ord($c) .';'
		}
		else{
			$_ret_= $_ret_ . $c;
		} ; 
	} 
	return $_ret_;
}

###########################################################
#Funcion ascii_to_hex
#   Decodifica una cadena con los valores hexadecimales ascii
#	Parametros: cadena
sub ascii_to_hex {

    my $text = shift;
    my $new;

	for($i = 0; $i < length($text); $i++) {
		$new = $new . '\x{' . sprintf("%x", ord(substr($text,$iim,1))) . '}';
	}


   return $new;
}
###########################################################
#Funcion HTML_Decoder
#   Decodifica una cadena que tiene caracteres con codificacion HTML.p.ej &#98;
#	Parametros: cadena
#http://www.degraeve.com/reference/specialcharacters.php
sub HTML_Decoder {
    my $text = shift;
    $text =~ s/&#(\d+);/chr( int( $1 ) )/gei;
	$text =~ s/&#x([^;]+);/chr( hex( $1 ) )/gei;
    return $text;
}

###########################################################
#Funcion HTML_Encoder
#   Decodifica una cadena que tiene caracteres con codificacion HTML.p.ej &#98;
#	Parametros: cadena
#http://www.degraeve.com/reference/specialcharacters.php
sub HTML_Encoder {

my $text = shift;
my $new_text;

for($ii = 0; $ii < length($text); $ii++) {

	if (ord(substr($text, $ii , 1)) > 123) {
		$new_text = $new_text . "&#".   sprintf("%0D", ord(substr($text, $ii , 1))) . ";";
		#print "--->" . ord(substr($text, $ii , 1)) .  "    :  &#".   sprintf("%0D", ord(substr($text, $ii , 1))) . ";" . "\n";
	}
	else{
		$new_text = $new_text . substr($text, $ii , 1);
	}
}

return $new_text;
}

###########################################################
#Funcion convert_to_utf
#   Convierete caracteres no ascii al codigo utf-8.
#	Parametros: cadena
#PENDIENTE. convertir desde utf-8 a unicode para que sean validas las urls: http://www.utf8-chartable.de/unicode-utf8-table.pl?start=256&utf8=0x&unicodeinhtml=hex

sub convert_to_utf {
    my $text = shift;
	$text =~ s/([^\/a-z0-9_\.!~\*,\s'\(\)\-\s])/sprintf "{%d}", ord($1)/gei;
    #$text =~ tr/ /+/;
    return $text;
}

###########################################################
#Funcion typeOf
#   Devuelve el tipo de una varible
#	Parametros: variable

sub typeOf {
	my $val = shift;

	use Carp qw(confess);
	if ( ! defined $val ) {
		return 'null';
	} elsif ( ! ref($val) ) {
		if ( $val =~ /^-?\d+$/ ) {
			return 'int';
		} elsif ( $val =~ /^-?\d+(\.\d+)?$/ ) {
			return 'float';
		} else {
			return 'string';
		}
	} else {
		my $type = ref($val);
		if ( $type eq 'HASH' || $type eq 'ARRAY' ) {
			return 'array';
		} elsif ( $type eq 'CODE' || $type eq 'REF' || $type eq 'GLOB' || $type eq 'LVALUE' ) {
			return $type;
		} else {
			# Object...
			return 'obj';
		}
	}
}

##################################################################################################################
sub f_Completa_URL{
###########################################################
#Funcion Completa al url con el host
#   Devuelve la url completa
#	Parametros: url .url completa o incompleta, sin dominio. Si es completa devuelve el mismo valor. Si es incompleta se completa con el host
#	HOST      : host. es una url en que se sabe que esta el domino

my $p_url = shift;
my $p_host = shift;

#Si es una instruccion curl no se procesa
if ($p_url =~ /^curl /) {
	return $p_url
}

#print "URL  :" . $p_url  . "\n";
#print "HOST :" . $p_host  . "\n";

my $comodin = '/' if !($p_url =~ /^\//); #Pone una barra final en el host si no la trae la url
my $s = 's' if ($p_url =~ /^https/);     #Pone una s en http

if ($p_url =~ /^https?\:\/\// ) {
}
else
{
	if ($p_url) {
		#$p_url  =  "http" .$s ."://". URI->new($p_host)->ihost . $comodin .$p_url ;
		$p_host =~ m/(https*\:\/\/[^\x2F]+)/;
		#print "Url: " . $p_host . "\n";
		#print "Host: " . $1 . "\n";
		$p_url  =   $1  . $comodin .$p_url ;
		print "Se completa la url  : " . $p_url . "\n";
	}
}

return $p_url;
}

##################################################################################################################
sub f_Dominio{
###########################################################
#Funcion Devuelve el dominio de una url
#	Parametros: url .url completa o incompleta

my $p_url = shift;

#Usando la libreria
#return URI->new($p_url)->host;

#print $p_url;

#Aqui esta la cadena de dominios pero no se ve!!!!!
$_dominios ="(?:capital|com\.mx|com|co\.uk|gov\.uk|co\.za|com\.au|co.nz|org\.uk|com\.ph|gov.za|com|edu|net|ac|ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|asia|at|[^\.]au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cat|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|coop|cr|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|ec|ee|eg|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ph|hu|id|ie|il|im|in|info|int|io|iq|ir|is|it|je|jm|jo|jobs|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mil|mk|ml|mm|mn|mo|mobi|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|nf|ng|ni|nl|no|np|nr|nu|[^\.]nz|om|org|pa|pe|pf|pg|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sy|sz|tc|td|tel|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|travel|tt|tv|tw|tz|ua|ug|[^\.]uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|xn|xxx|ye|yt|[^\.]za|zm|zw)";

if ( $p_url =~ /([\w_\-]+\.$_dominios)$/  ) {
    #print "1\n";
	return $+;
}
if ( $p_url =~ /(?:https*\:\/\/)*[^\.]+\.([^\.]+\.$_dominios)$/  ) {
	#print "2\n";
	return $+;
}

if ( $p_url =~ /(?:https*\:\/\/)*([^\.]+\.\w{2,3}\.\w{2,3})[\/\?]/  ) {
	#print "3\n";
	return $+;
}

if ( $p_url =~ /(?:https*\:\/\/)*.*\.([\w\-]{3,}\.\w{2,3})[\/\?\:]/  ) {
	#print "4\n";
	return $+;
}

if ( $p_url =~ /(?:https*\:\/\/)*([^\.]+\.\w{2,3}\.\w{2,3})$/  ) {
	#print "5\n";
	return $+;
}
if ( $p_url =~ /(?:https*\:\/\/)*.*\.(\w{3,}\.\w{2,3})$/  ) {
	#print "6\n";
	return $+;
}

if ( $p_url =~ /(?:https*\:\/\/)*(\w{3,}\.\w{2,3})[\/\?\:]*/  ) {
	#print "7\n";
	return $+;
}


return '';

}


##################################################################################################################
sub contar{
###########################################################
#Funcion Devuelve el numero de veces que una cadena se encuentra en otra
#	Parametros: url .url completa o incompleta
my($p_cadena, $p_buscar ) = @_;

#$count = () = $string =~ /$p_buscar/g; 
my @encontrados = ($p_cadena =~ m/$p_buscar/g);
 
return scalar @encontrados;

}
###########################################################
#Funcion Convierte un valor numerico en segundos en fecha
#   Devuelve el tipo de una varible
#	Parametros: variable

sub sec2date{

$sse = shift;
$days = 0;
$hours = 0;
$mins = 0;
$secs = 0;
$year = 0;
$month = "";

if ($sse eq "-v") {
  print "This is sec2date, version 1.1, 1/12/98\n";
  exit;
}

unless ($sse) {
  print "Usage: sec2date seconds\n";
  exit;
  }

&days;
&year;
&month;
&date;
&weekday;
&hours;
&mins;
&secs;

if ($hours < 10) { $hours = "0" . $hours; }
if ($mins < 10) { $mins = "0" . $mins; }
if ($secs < 10) { $secs = "0" . $secs; }

return ("$wday $month $date $hours:$mins:$secs $year");



}



sub days {

$day_r = $sse / 86400;
  if ($day_r < 1) {
    $day_i = 0;
  } else {
    $day_i = int ($day_r);
  }
$days = $day_i;
}

sub year {

    if ($days <= 789) { $leap = 0;
    } elsif ($days <= 2249) { $leap = 1;
    } else {
        $leap = int ((($days - 2250) / 1460) + 1);
    }
    $years_r = ($day_r - $leap) / 365 ;
    $years_i = int ($years_r);
    $year = $years_i + 1970;
        if ($year % 4 == 0) {
            $leap_n = 1;
        } else { $leap_n = 0;
        }
}

sub month {

   $months_r = $years_r - $years_i;
   $months_l = $months_r * 12;
   $months_i = int ($months_l);
     if ($months_i == 0) {
       $m_a = 0;
       $m_a = $months_i;
     } else { $m_a = $months_i; }

   @month = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
   $month = $month[$m_a];
}

sub date {

   if (($m_a == 3) || ($m_a == 5) || ($m_a == 8) || ($m_a == 10)) {
       $days_mon = 30;
   } elsif (($m_a == 1) && ($leap_n == 1)) {
       $days_mon = 29;
   } elsif (($m_a == 1) && ($leap_n == 0)) {
       $days_mon = 28;
   } else { $days_mon = 31; }
   $date_r = $months_l - $months_i;
   $date = (int ($date_r * $days_mon)) + 1;
   if ($date == 0) { $date = 1; }
}

sub weekday {

    $wday_r = $days % 7;
    @wday = ("Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed");
    $wday = $wday[$wday_r];
}

sub hours {

$day_l = abs (($day_r - $day_i) * 24);
$hour_r = $day_l;
 if ($hour_r < 1) {
    $hour_i = 0;
  } else {
    $hour_i = int ($hour_r);
  }
$hours = $hour_i;
}

sub mins {

$hour_l = abs (($hour_r - $hour_i) * 60);
$min_r = $hour_l;
 if ($min_r < 1) {
    $min_i = 0;
  } else {
    $min_i = int ($min_r);
  }
$mins = $min_i;
}

sub secs {

$min_l = abs (($min_r - $min_i) * 60);
$sec_r =  $min_l;
$sec_i = int ($sec_r);
$sec_l = $sec_r - $sec_i;
$secs = $sec_i;
  if ($sec_l >= 0.5) { $secs++; }
}
###########################################################

###########################################################
#Funcion f_address
#   Devuelve zip|city|country
#	Parametros: address
sub f_address {

my $d = shift;

my $zip  ;
my $city  ;
my $country  ;

#ZIP CODE
###############################################################################################
if ($d =~ /\s(\d{4,6}(?:\-\d{4,6})*)/ ) {
	$zip = $1;
}

#UK
if ($d =~ /\s([A-Z]{1,2}\d{1,2}[A-Z]*\s\d[A-Z]{2})/ ) {
	$zip = $1;
}
#ARGENTINA
if ($d =~ /\s([A-Z]\d{4}[A-Z]{3})/ ) {
	$zip = $1;
}
###############################################################################################

$zip .= '';
#CITY
###############################################################################################
if ($d =~ /,\s*([^,]*$zip[^,]*)/ ) { #Ciudad o Estado asociado al grupo(entre comas) al ZIP
	$city = $1;
	$city =~ s/\s*$zip\s*//;

	if ($d =~ /\s([^,]+),\s[A-Z]{2}\s$zip$/) { #En caso usa el zip no esta asociado a la ciudad si no al estado, la ciudad es el grupo (entre comas) anterior
		$city = $1;
	}

}

#COUNTRY
###############################################################################################
if ($d =~ /.*,\s*(.*)/ ) {
	$country = $1;
	if ( $country =~ /$zip/) {  #El pais no esta en la ultima posicion porque tiene el Zip. Ocurre en USA
		$country = '';
	}
	else{
		my $t = scalar($1=~y///c);
		if ($t > 2){
			$country = $1 if ($t gt 2);
		}
		else{
			$country = '';	
		}
	}
}





#En algunos paises el Zip va al final como un elemento (separado por comas) independiente.P.ej Rusia
if (!$country) {
	if ($d =~ /.*,\s*([^,]+),\s*([^,]+),\s*$zip/ ) {
		$city = $1;
		$country = $2 if (scalar($2=~y///c) gt 2);
	}
}

return   $zip . ";" . $city . ";" . $country ;

}

 
###########################################################
#Funcion f_locations
#   Devuelve un array con las urls en las cabeceras Location al llamara a una url pasada por parametro
#	Parametros: url , GET o POST (por defecto GET
sub f_locations{
$p_url		= shift;
if ($PARAM[-1] =~ /^POST$/ ) {
	$p_GET_POST = 'POST' ;
}
else{
	$p_GET_POST = 'GET' ;
}

my ($output_page, $output_headers , @LOCATIONS) = GET_POST($p_GET_POST, $p_url, '', 'NO', '');
return @LOCATIONS;

}

###########################################################
#Funcion f_adapta_curl
#   Devuelve:
#				convierte una cadena de valores a valores pasados por CURL del estilo "%"3D
#	Parametros: url, patron1, patron2, ... GET_POST, NO_CR
sub f_adapta_curl{
my $t = shift;

my $ret = '';
foreach $char (split //, $t) {
  if (  ord($char)==45 || ord($char)==46 || ord($char)==95 || ( 65 <= ord($char) && ord($char) <= 90)  ||    ( 97 <= ord($char) && ord($char) <= 122) ||    ( 48 <= ord($char) && ord($char) <= 57)  )  {
	   		$ret = $ret . $char ;
  }
  else{
	  		$ret = $ret . sprintf('"%"%X',ord($char));
  }
}
return $ret ;


}


###########################################################
#Funcion f_code_in_page
#   Devuelve:
#				nulo o el patron encontrado en una url para un patron dado
#	Parametros: url, patron1, patron2, ... GET_POST, NO_CR
sub f_code_in_page{

my $p_url = shift;
#my $p_code = shift ;
my $p_GET_POST ;
my $p_ANON ='';


my @PARAM = @_;
my @RETURN = ();
my $print_page;



if ($PARAM[-1] =~ /^POST$/ || $PARAM[-2] =~ /^POST$/ || $PARAM[-3] =~ /^POST$/) {
	$p_GET_POST = 'POST' ;
}
else{
	$p_GET_POST = 'GET' ;
}

if ($PARAM[-1] =~ /^ANON$/ || $PARAM[-2] =~ /^ANON$/ || $PARAM[-3] =~ /^ANON$/) {
	$p_ANON = 'SI' ;
}
else{
	$p_ANON = 'NO' ;
}

print "Url:     " . $p_url . "\n";
print "GET_POST:" . $p_GET_POST . "\n";

my ($output_page, $output_headers , @LOCATIONS) = GET_POST($p_GET_POST, $p_url, '', $p_ANON, '');

 

#p_( "------------------------------------------------ \n");
#p_( " " . $output_headers . "\n");
#p_( " " . $output_page . "\n");
#print_r(@LOCATIONS);
#p_( "------------------------------------------------ \n");

if ($LOCATIONS[-1]) {
	#Hace el redirecionamiento automaticamente
	p_('Redirect...: ' . $LOCATIONS[-1] . "\n");
	my $slah;
	if ($LOCATIONS[-1]) {
		if ($LOCATIONS[-1] !~ /^http/) { #El redireccionamiento no contiene la url completa
			if ($p_url =~ /^(https*:\/\/)([^\/]+)/ ) {
				$PROTOC_TMP = $1;
				$DOMAIN_TMP = $2;
				$slah = '/' if ( !($DOMAIN_TMP =~ /\/$/) && !($LOCATIONS[-1] =~ /^\//) ) ; #Se añade un slash / si no lo tiene ni el dominio al final o la pagina al principio
			}
			$LOCATIONS[-1] = $PROTOC_TMP . $DOMAIN_TMP . $slah . $LOCATIONS[-1];
		}
	}
	($output_page, $output_headers , @LOCATIONS) = GET_POST('GET', $LOCATIONS[-1], '', 'NO', '');
}


$OUTPUT  = $output_page;
if ($PARAM[-1] =~ /^NO_CR$/ || $PARAM[-2] =~ /^NO_CR$/ ) {
		$OUTPUT =~ s/[\n\r]//g ;
}

foreach my $p_code (@_) 	{

	if ($p_code eq 'POST' || $p_code eq 'GET' || $p_code eq 'NO_CR' || $p_code eq 'ANON'  ) {
		#print "No es patron\n";
	}
	else{
			print "------------------------------------------------ \n";
			print "Patron " . $p_code . "\n";
			#print "------------------------------------------------ \n";

			my $p_code_tmp = $p_code;
			if ($p_code_tmp =~ /(TAGS\s*\{[^\}]*\})/) {
				$p_code_tmp = parse_TAGS($p_code);
			}#Fin de if ($PATRON =~ /(TAGS\s*\{[^\}]*\})/) {

			if ($OUTPUT =~ /$p_code_tmp/i) {
				my $text = $+;
				push(@RETURN, $text); 
				print "\tENCONTRADO >>>" . $text . "<<< \n\n";

			} 
			else{
				push(@RETURN, ""); 
				#print $output_page;
				if ($output_page =~ m/(Error:\d+)/) {
					print "Error en f_code_in_page" . $1 . "\n";
				}
				else{
					print "\tNo Encontrado patron $p_code en f_code_in_page" . "\n\n";
					#print "----------------------+-------------------------- \n";
					$print_page = 'YES';
					#print "\n--------------------+---------------------------- \n";
				}
			}
	}
}

if ($print_page eq 'YES' ) {
	#print $OUTPUT;
}


if (@RETURN == 1) {
	$RETURN[0];
} 
else{
	return @RETURN;
}




#my @v_found = ($output_page =~ m/$p_code/g);
#return join(";", @v_found);

} 

###########################################################
#Funcion exists_reg
#   Devuelve 1 o 0 dependiendo de si alguno de los elementos del hash del 2º parametro está contenido en la cedena del primer parametro
#	Parametros: 
#			1. cadena de texto
#			2. hash con cadenas .p.ej @MAKES = ("Lexus", "Mercedes"); se pueden definir en el parametro general include_1=
sub exists_reg{



#Si el hash es nulo se da por OK
if (!@{$_[1]}) {
    #print "Es nulo\n";
	#print @{$_[1]};
	return 1;
}

foreach $key (@{$_[1]}) {
	#print $key . "\n";
	#print $_[0] . "\n";
	if (   lc($_[0]) =~ m/$key/i ) {
		return $key;
	}
}
return '';
}

###########################################################
#Funcion today_date
#   Devuelve Fecha y hora actuales en una zona horaria 2 valores fecha y hora con formato yyyymmdd y hhmiss
#	Parametros: 
#			1. GMT 0, 1 -1, etc... Si no se especifica es 0

sub today_date{
my $p_gmt = shift;
if (!$p_gmt) {
	$p_gmt = 0;
}

my	$v_hour;
my	$v_min;
my	$v_sec;
my  $v_PM;
my	$v_day  ;
my	$v_month ;
my	$v_year ;



#http://www.timegenie.com/timezones
my %GMT ;
#$GMT{'+12'}='http://24timezones.com/world_directory/current_wellington_time.php';
#$GMT{'+11'}='http://24timezones.com/world_directory/current_noumea_time.php';
#$GMT{'+10'}='http://24timezones.com/world_directory/current_sydney_time.php';
#$GMT{'+9'}='http://24timezones.com/world_directory/current_tokyo_time.php';
#$GMT{'+8'}='http://24timezones.com/world_directory/current_manila_time.php';
#$GMT{'+7'}='http://24timezones.com/world_directory/current_krasnoyarsk_time.php';
#$GMT{'+6'}='http://24timezones.com/world_directory/current_astana_time.php';
#$GMT{'+5'}='http://24timezones.com/world_directory/current_karachi_time.php';
#$GMT{'+4'}='http://24timezones.com/world_directory/current_dubai_time.php';
#$GMT{'+3'}='http://24timezones.com/world_directory/current_moscow_time.php';
#$GMT{'+2'}='http://24timezones.com/world_directory/current_helsinki_time.php';
#$GMT{'+1'}='http://24timezones.com/world_directory/current_madrid_time.php';
#$GMT{'0'}='http://24timezones.com/world_directory/current_london_time.php';
#$GMT{'-1'}='http://24timezones.com/world_directory/current_azores_time.php';
#$GMT{'0'}='http://24timezones.com/world_directory/current_london_time.php';
#$GMT{'-3'}='http://24timezones.com/world_directory/current_sao_paulo_time.php';
#$GMT{'-4'}='http://24timezones.com/world_directory/current_la_paz_time.php';
#$GMT{'-5'}='http://24timezones.com/world_directory/current_new_york_time.php';
#$GMT{'-6'}='http://24timezones.com/world_directory/current_mexico_city_time.php';
#$GMT{'-7'}='http://24timezones.com/world_directory/current_calgary_time.php';
#$GMT{'-8'}='http://24timezones.com/world_directory/current_los_angeles_time.php';
#$GMT{'-9'}='';
#$GMT{'-10'}='http://24timezones.com/world_directory/current_honolulu_time.php';
#$GMT{'-11'}='';

$GMT{'+12'}='http://www.timeanddate.com/worldclock/city.html?n=264';
$GMT{'+11'}='http://www.timeanddate.com/worldclock/city.html?n=723';
$GMT{'+10'}='http://www.timeanddate.com/worldclock/city.html?n=240';
$GMT{'+9'}='http://www.timeanddate.com/worldclock/city.html?n=248';
$GMT{'+8'}='http://www.timeanddate.com/worldclock/city.html?n=145';
$GMT{'+7'}='http://www.timeanddate.com/worldclock/city.html?n=372';
$GMT{'+6'}='http://www.timeanddate.com/worldclock/city.html?n=921';
$GMT{'+5'}='http://www.timeanddate.com/worldclock/city.html?n=757';
$GMT{'+4'}='http://www.timeanddate.com/worldclock/city.html?n=776';
$GMT{'+3'}='http://www.timeanddate.com/worldclock/city.html?n=166';
$GMT{'+2'}='http://www.timeanddate.com/worldclock/city.html?n=101';
$GMT{'+1'}='http://www.timeanddate.com/worldclock/city.html?n=141';
$GMT{'0'}='http://www.timeanddate.com/worldclock/city.html?n=136';
$GMT{'-1'}='http://www.timeanddate.com/worldclock/city.html?n=271';
$GMT{'-3'}='http://www.timeanddate.com/worldclock/city.html?n=233';
$GMT{'-4'}='http://www.timeanddate.com/worldclock/city.html?n=124';
$GMT{'-5'}='http://www.timeanddate.com/worldclock/city.html?n=179';
$GMT{'-6'}='http://www.timeanddate.com/worldclock/city.html?n=155';
$GMT{'-7'}='http://www.timeanddate.com/worldclock/city.html?n=55';
$GMT{'-8'}='http://www.timeanddate.com/worldclock/city.html?n=137';
$GMT{'-9'}='';
$GMT{'-10'}='http://www.timeanddate.com/worldclock/city.html?n=103';
$GMT{'-11'}='';

 
my $url = $GMT{$p_gmt};
if (!$url) {
	return ('' , '');
}

#Conexion
my $mech = WWW::Mechanize->new();                  


$mech->default_header('User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100101 Firefox/5.0');
$mech->default_header('Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
$mech->default_header('Accept-Language' => 'en');
my $can_accept = HTTP::Message::decodable;
$mech->default_header('Accept-Encoding' => $can_accept);
$mech->default_header('Accept-Charset' => 'ISO-8859-1,utf-8;q=0.7,*;q=0.7');
#$mech->default_header('Keep-Alive' => '115');
$mech->default_header('Connection' => 'keep-alive');
$mech->default_header('Content-Type' => 'application/x-www-form-urlencoded');
$mech->default_header('Host' => 'www.timeanddate.com');

$mech->get($url);
my $output_page = $mech->content();               
#print  "$output_page";                     

#01:49:17 AM, Thursday 15, September 2011
#if ($output_page =~ m/<span id="currentTime">(\d{2}):(\d{2}):(\d{2})\s([AMP]{2}),\s*[^\s]*\s(\d+),\s*([^\s]+)\s(\d+)/) {
#	$v_hour  = $1;
#	$v_min   = $2;
#	$v_sec   = $3;
#	$v_PM    = $4;
#	$v_day   = $5;
#	$v_month = $MONTHS{$6};
#	$v_year  = $7;
#}


#<strong id=ct  class=big>Thursday, 2 February 2012, 20:38:58Hour : 20
if ($output_page =~ m/Current Time<\/th><td><strong id=ct\s*class=big>([^,]{3})[^,]+,\s*(\d+)\s([^\s]+)\s*(\d+),\s*(\d+):(\d+):(\d+)/) {
	$v_day_n = $1;
	$v_hour  = $5;
	$v_min   = $6;
	$v_sec   = $7;
	$v_PM    = '';
	$v_day   = $2;
	$v_month = $MONTHS{$3};
	$v_month_n = substr $3,0,3;
	$v_year  = $4;
}

if ($v_PM eq 'PM' && $v_hour != '12') {
	$v_hour += 12;
}
$v_hour = sprintf("%02d", $v_hour) ;
$v_min  = sprintf("%02d", $v_min)  ;
$v_sec  = sprintf("%02d", $v_sec)  ;
$v_day  = sprintf("%02d", $v_day)  ;

#print "Hour : " .   $v_hour . "\n";
#print "Min  : " .   $v_min  . "\n";
#print "Sec  : " .   $v_sec  . "\n";
#print "Day  : " .   $v_day  . "\n";
#print "Moth : " .   $v_month . "\n";
#print "Year : " .   $v_year . "\n";

#Thu Feb  2 21:42:08 2012
return ($v_year . '-' . $v_month . '-' . $v_day . ' ' . $v_hour . $v_min . $v_sec );
#return ($v_day_n . ' ' . $v_month_n . ' ' .  $v_day . ' ' . $v_hour . ':' . $v_min . ':' .$v_sec . ' ' . $v_year) ;

} 


###########################################################
#Funcion parsedate
#   Devuelve numero en segundos de la fecha/hora del parametro
#	Parametros: 
#			1. yyyy-mm-dd hh:mi:ss (se puede usar cualquier caracter para separar los valores que no se alfanumerico
#		Sierve para hacer cuentas con fechas . Por ejemplo si quiero restar dias , resto 3600*24 para restar a 1 dia a la fecha actual
sub parsedate { 
  my($s) = @_;
  my($year, $month, $day, $hour, $minute, $second);

print $s;

  if($s =~ m{^\s*(\d{1,4})\W*0*(\d{1,2})\W*0*(\d{1,2})[\W\s]+
                 (\d{1,2})\W*(\d{2})\W*(\d{2})}x) {
    $year = $1;  $month = $2;   $day = $3;
    $hour = $4;  $minute = $5;  $second = $6;
    $hour |= 0;  $minute |= 0;  $second |= 0;  # defaults.
    $year = ($year<100 ? ($year<70 ? 2000+$year : 1900+$year) : $year);

#	print "\n";
#	print $year;
#	print "\n";
#	print $month;
#	print "\n";
#	print $day;
#	print "\n";
#	print $hour;
#	print "\n";
#	print $minute;
#	print "\n";
#	print $second;


    return timelocal($second,$minute,$hour,$day,$month-1,$year);  
  }
  return -1;
}

###########################################################
#Funcion parsedate
#   Devuelve un numero codicado para la cadena de texto
#	Parametros: 
#			1. yyyy-mm-dd hh:mi:ss (se puede usar cualquier caracter para separar los valores que no se alfanumerico
#		Sierve para hacer cuentas con fechas . Por ejemplo si quiero restar dias , resto 3600*24 para restar a 1 dia a la fecha actual
sub mini_rsa{
my $cadena = $_[0];

my $ii = 0;
my $valor = 200;


while ( $ii < length($cadena) ) {

	$valor = $valor +  $ii * int ord(substr($cadena,$ii, 1) );
	$ii++;
}

return int $valor;

}
#################################################################################################################
#Send a email
#
#	Parameter:
#		$p_from   = email from;
#		$p_name   = name to(optional);
#		$p_to     = email to;
#		$p_subjet = subject;
#		$p_body   = body;
#		$p_file   = file attached(optional);
#		$p_smtp	  = smtp server(optional);
#		$p_user   = smtp user(optional);
#		$p_pass   = smtp password(optional);

sub send_mail
{
$p_from   = shift;
$p_name   = shift;
$p_to     = shift;
$p_subjet = shift;
$p_body   = shift;
$p_file   = shift;
$p_smtp	  = shift;
$p_user   = shift;
$p_pass   = shift;

$p_from   =~ s/[\\]//g;

#print "------------\n";
#print $p_to ;
#print "------------\n";

use LWP::UserAgent;

my $agent = LWP::UserAgent->new;

my $url='http://www.raulreyero.com/projects/mail.php';
#my $url='http://184.82.243.108/lib/mail/mail.php';

my $username = "";         
my $password = "";

$agent->default_header('User-Agent' => "Mozilla/5.0 ('Windows; U; Windows NT 5.1; es-ES; rv:1.9.2.15) Gecko/20110303 Firefox/3.6.15 (' .NET CLR 3.5.30729)");
$agent->default_header('Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
$agent->default_header('Accept-Language' => 'en');
$agent->default_header('Accept-Charset' => 'ISO-8859-1,utf-8;q=0.7,*;q=0.7');
$agent->default_header('Keep-Alive' => '115');
$agent->default_header('Connection' => 'keep-alive');
$agent->default_header('Referer' => 'http://intercambiostfcd.com/engine/login.php');
$agent->default_header('Content-Type' => 'application/x-www-form-urlencoded');

my $response = $agent->post( $url , 	[
"realname" =>$p_name,	
"from" => $p_from,
"email" => $p_to ,
"file" => $p_file , 
"subject" => $p_subjet , 
"content" => $p_body ,
"smtp" => $p_smtp,
"user" => $p_user,
"pass" => $p_pass,
] );

print $response->as_string;

return 1;
}

#################################################################################################################

###########################################################
#Funcion hide
#   Devuelve una url que oculta el Referer del origen
#	Parametros: 
#			1. url
sub hide { 
  $url = shift;
  #return 'http://href.li/?' . $url;
  return 'http://anonymouse.org/cgi-bin/anon-www.cgi/' . $url;


}

###########################################################
#Funcion f_lon_lat_google_old
#   Devuelve  error, precision(http://code.google.com/intl/es/apis/maps/documentation/geocoding/v2/#GeocodingAccuracy) latitud y longitud de google maps
#	Parametros: 
#			1. address
#			2. parametros adicionales en la url de google maps. p.ej &gl=UK para indicar el pais
# Antigua API https://developers.google.com/maps/documentation/geocoding/v2/?hl=es
sub f_lon_lat_google_old { 

$address = shift;
$param   = shift;

$_url=  'http://maps.googleapis.com/maps/geo?sensor=false&output=csv&q=' . url_encode($address ) . $param;


$return = f_code_in_page($_url , "(.*)"   );

if ($return =~ /(.*),(.*),(.*),(.*)/ ) {
	return ($1, $2 , $4 , $3);
}

return ('' , '', '', '');


}


###########################################################
#Funcion f_lon_lat_google
#   Devuelve  error, precision(http://code.google.com/intl/es/apis/maps/documentation/geocoding/v2/#GeocodingAccuracy) latitud y longitud de google maps y zip code
#	Parametros: 
#			1. address
#			2. parametros adicionales en la url de google maps. p.ej &gl=UK para indicar el pais
# Limite https://developers.google.com/maps/documentation/geocoding/#Limits 
#   2500 llamadas al dia

sub f_lon_lat_google  { 

$address = shift;
$param   = shift;

#Old API
#$_url=  'http://maps.googleapis.com/maps/geo?sensor=false&output=csv&q=' . url_encode($address ) . $param;
#$_url=  'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=' . url_encode($address ) . $param;

$_url=  'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=' .  $address   . $param;

($lat,$lon,$zip	) = f_code_in_page($_url , '\"location\"\s*\:\s*{\s*\"lat\" :([^,]+)' , '\"location\"\s*\:\s*{\s*\"lat\" :[^,]+,\s*\"lng\"\s*:\s*([^}]+)' ,'"short_name"\s*:\s*"([^"]+)",\s*"types"\s*:\s*\[\s*"postal_code"'  );

$lat =~ s/[\n\r]//g;
$lat =~ s/^\s+//g;
$lat =~ s/\s+$//g;

$lon =~ s/[\n\r]//g;
$lon =~ s/^\s+//g;
$lon =~ s/\s+$//g;


return ('', '' ,  $lon , $lat, $zip );

}



###########################################################
#Funcion f_lon_lat_google_address
#   Devuelve  direccion compeleta, calle, numero, localidad, area1, area2, pais, codigo postal
#	Parametros: 
#			1. latitud, longitud
# Limite https://developers.google.com/maps/documentation/geocoding/#Limits 
#   2500 llamadas al dia
sub f_lon_lat_google_address { 

$lat = shift;
$lon = shift;
my %LOC;
my @VARIABLES=('route' , 'street_number' , 'locality' , 'administrative_area_level_1', 'administrative_area_level_2' , 'country' , 'postal_code');

$_url=  'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=' . $lat . ',' . $lon   ;

$json = f_code_in_page($_url , '([\W\w]+)'   );
if ($json =~  /"formatted_address"\s*:\s*"([^"]+)/) {
	$LOC{address} = $+;
}


foreach $v (@VARIABLES) {
	if ($json =~  /"long_name"\s*:\s*"([^"]+)",\s*"short_name"\s*:\s*"[^"]+",\s*"types"\s*:\s*\[ "$v"/) {
		$LOC{$v} = $+;
	}
}


return $LOC{address} , $LOC{route}, $LOC{street_number}, $LOC{locality}, $LOC{administrative_area_level_1}, $LOC{administrative_area_level_2}, $LOC{country}, $LOC{postal_code};

}

###########################################################
#Funcion f_lon_lat_google_address
#   Devuelve  direccion compeleta, calle, numero, localidad, area1, area2, pais, codigo postal
#	Parametros: 
#			1. latitud, longitud
sub f_lon_lat_google_address_JSON { 
#use JSON;

$lat = shift;
$lon = shift;

$_url=  'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=' . $lat . ',' . $lon   ;

$json = f_code_in_page($_url , '([\W\w]+)'   );
#print $json;
my $data = decode_json $json;





my @dat = @{ $data->{'results'}[0]{'address_components'} };
foreach my $leg (@dat) {
	# print_r( $leg->{types}[0]);
	#print_r( $leg->{long_name});
	$LOC{$leg->{types}[0]} = $leg->{long_name};
}

return $data->{'results'}[0]{'formatted_address'} , $LOC{route}, $LOC{street_number}, $LOC{locality}, $LOC{administrative_area_level_1}, $LOC{administrative_area_level_2}, $LOC{country}, $LOC{postal_code};

}


###########################################################
#Funcion download
#   Realiza la descarga de un fichero 
#	Parametros: 
#			1. url
#			2. nombre del fichero a descarga, incluida la ruta. Es opcional, si no existe se descarga en el mismo sitio donde se ejecuta
sub download { 

$url  = shift;
$file = shift;

if ($file) {
	$program = 'curl -o' . $file . ' ' . $url ;
}
else{
	$program = 'wget ' . ' ' . $url ;
}

print $program . "\n";

print system ($program . ' >> /dev/null &' );
 
return 1;

}

###########################################################
#Funcion create_dir
#   Crea un directorio o estructura de directorios
#	Parametros: 
#			1. ruta a crear
sub create_dir { 

my $path  = shift;

print "This folder is " . getcwd(); 
my $completo = '';

my @carpetas = split(/\//, $path);

foreach my $elemento (@carpetas) {
	
	$completo = $completo .  $elemento . '/' ;
	


	if (!(-d $completo)  ) {
		print "Se va a crear " . $completo . "\n"; 
		system ('mkdir ' . $completo );
	}
}

 
return 1;
}


###########################################################
#Funcion image
#   Crea el codigo html para una imagen
#	Parametros: 
#			1. Imagen a cargar
#			2. Alto de la imagen, 75px si se omite
#			2. Ancho de la imagen, 75px si se omite

sub image { 

$url = shift;
$height = shift;
$width = shift;

my $style ;
if ($height) {
	$style = 'style=\'height:' . $height . 'px; width:' . $width . 'px;\''
}

return '<img ' . $style .' src=\'' . $url . '\' ></img>';

}

###########################################################
#Funcion get_email
#   Devuelve :
#		-la direccion de correo encontrado en la pagina pasada como parametro o alguna pagina que contenga la palabra contact o tenga un texto asociado con contact 
#		-la url donde ha encontrado la direccion de correo
#	Parametros: 
#			1. Url del sitio a escanear
#			2. Opcional. Palabras asociadas que se desean buscar asociadas a paginas internas de contact
sub get_email { 

my $url = shift;
my @PARAM = @_;					#Lista de palabras pasadas por parametro
my @Lista = ('contact' , 'about'   );		#Lista por defecto
my @VALIDOS;

#Si se pasa en el segundo parametro '_ALL_' se extraen todos las direcciones de correo
my $TODOS ;
if ( exists_reg('_ALL_' , \@PARAM) ne '1') {
	$TODOS  =1;
}

if (!($url)) {
	return ('','');
}

#Une las dos listas
push(@Lista , @PARAM);

#Elimina duplicados
foreach $elemento ( @Lista ) {
    push @Nuevo_Lista, $elemento if not $visto_antes{$elemento}++;
}

#Obtiene el contenido de la pagina
$command = 'curl -L --max-time 15 -L -s  "'.$url.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
$output_page = `$command`;
#my ($output_page, $output_headers , @LOCATIONS) = GET_POST($p_GET_POST, $url, '', 'NO', '');
#print $output_page;

if ( $output_page =~ />The document has moved <a[^>]+href=['"]([^'"]+)/ ) {
	$command = 'curl -L --max-time 15 -L -s  "'.$+.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
	$output_page = `$command`;

	#($output_page, $output_headers , @LOCATIONS) = GET_POST($p_GET_POST, $+, '', 'NO', '');
}

$output_page = HTML_Decoder($output_page);

#Busca un Email
#if ($output_page =~ /$__PATRON_EMAIL/ ) {
my @encontrados  = ($output_page =~ m/$__PATRON_EMAIL/g);
if ( @encontrados  ) {
	#print "Encontrados:\n";
	#print_r(@encontrados);
	#print "\n";

	
	#Revisa que el e-mail no es valido
	foreach my $e (@encontrados) 	{
		if (!exists_reg( $e,  \@__EMAIL_NO_VALID)  ) {
			#print "Encontrado Email: >" . $e . "<\n";
			if ($TODOS) {
				push(@VALIDOS, $e);
			}
			else{
				return ($1,$url);
			}
		}
	}
}
else{
	#print "No encontrado Email\n";
}

#Recorre para encontrar paginas de Contact segun la lista
foreach my $elemento (@Nuevo_Lista) 	{
	$PATRON = '<[aA][^>]+href=[\'"]*\/*([^\'"\s]*' . $elemento . '[^-\'"\s]*)|<[aA][^>]+href=["\']\/*([^"\']+)["\'][^>]*>[^<]*' . $elemento . '[^<]*<|<frame[^>]+src=[\'"]([^\'"]+)' ;
	#print "Analizando ";
	#print $PATRON;
	#print "\n";

	if ($output_page =~ /$PATRON/i ) {
		$CONTACT = $+;
		#print "Encontrado Contact: " . $1 . "\n";
		if (  !($CONTACT =~ /^http/) ) {
			#print $CONTACT ."\n";
			$CONTACT =~ s/^\///;
			$url =~ s/\/$//;
			$CONTACT = $url . '/' . $CONTACT;		#Anade la url si no la tiene.
		}

		$command = 'curl -L --max-time 15 -L -s  "'.$CONTACT.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
		$output_page = `$command`;


 		#my ($output_page, $output_headers , @LOCATIONS) = GET_POST($p_GET_POST, $CONTACT, '', 'NO', '');
		my @encontrados  = ($output_page =~ m/$__PATRON_EMAIL/g);

		#print_r(@encontrados);
		if ( @encontrados  ) {
		#Revisa que el e-mail no es valido
			foreach my $e (@encontrados) 	{
				if (!exists_reg( $e,  \@__EMAIL_NO_VALID)   ) {
					#print "Encontrado Email: " . $e . "\n";

					#Para devolver varios.
					#return ($1,$url);
					push(@VALIDOS, $e);
				}
			}#foreach my $e (@encontrados)

			#Con keys %{{ map ... elimina diplicados
			return (join(';', keys %{{ map { $_ => 1 } @VALIDOS }}) ,$CONTACT) ;
			#return (join(';', @VALIDOS) ,$CONTACT) ;

		}#if ( @encontrados  ) {
	}#if ($output_page =~ /$PATRON/i ) {
} 

return ('','');

}

###########################################################
#Funcion scrap_email. Version sencilla de get_email
#   Devuelve :
#		-Array con los emails encontrados por get_email
#	Parametros: 
#			1. Url del sitio a escanear

sub scrap_email{

($EMAILS , $page)=get_email(@_[0]);
return $EMAILS;
}

###########################################################
#Funcion unique_index
#   Crea un fichero para almacenar el dato pasado por parametro. Se comprueba si existe en el fichero/array. Si existe devuelve 1. Si no devuelve 0 y lo graba en el fichero/array
#	Se puede usar el parametro f (Fichero) cuando hay que hacer varias extracciones o se prevee un numero alto de registros.
#	Parametros: 
#			1. valor del indice
#			2. usar fichero f=fichero, otro valor o nulo para usar memoria (ARRAY)
sub unique_index { 
$INDEX = shift;
$I_FILE = shift;

my $_file;

if ($I_FILE  ) {
	
	if ($I_FILE eq 'f' ) {
		$_file = "UNIQUE_INDEX.txt";
	}
	else{
		$_file = $I_FILE . ".txt";
	}

	if (-e $_file) {
		open FILE_UNIQUE, "<" . $_file  or die $!;
	}
	else{
		open FILE_UNIQUE, ">" . $_file or die $!;
		print FILE_UNIQUE   $INDEX . "\n\r";
		close FILE_UNIQUE;
		return "0";
	}
	
	while(my $line = <FILE_UNIQUE>){
		$line =~ s/[\n\r]//g;
		#print "Linea >" . $line . "<\n";
		#print "Indice>" . $PATRON . "<\n";
		if($line =~ /^$INDEX$/){
			print "Existe\n";
			close FILE_UNIQUE;
			return "1";
		}
	}
	close FILE_UNIQUE;

	open (FILE_UNIQUE, "+>>", $_file) or die $!;
	#print "No existe:" .  $INDEX ;print "\n";
	print FILE_UNIQUE   $INDEX . "\n\r";
	close FILE_UNIQUE;
	return "0";
}
else{
	if ( grep( /^$INDEX$/, @UNIQUE_INDEX ) ) {
		#print "  *Encontrado\n";
		return "1";
	}
	else{
		push(@UNIQUE_INDEX, $INDEX); 
		#print "  *NO Encontrado\n";
	    return "0";
	}
}


}
#Funcion mod
#   Calcula el modulo m % n
#	Parametros: 
#			1. Valor de m
#			2. Valor de n
sub mod {
  use integer;
  my ($a, $b) = @_;
  my $tmp = $a / $b;
  return  $a - ($b * $tmp) ;
}
#Funcion promptUser
#   Pregunta al usuario valores por teclado. Solo para uso de ejecuciones desde linea de comandos
#	Parametros: 
#			1. Texto de la pregunta
#			2. Valor por defecto si el usuario no teclea nada 
sub promptENTER {

   print "Please, ENTER to continue...:";

   $| = 1;               # force a flush after our print
   $ENTER = <STDIN>;         # get the input from STDIN (presumably the keyboard)

	return 1;
}

#Funcion promptUser
#   Pregunta al usuario valores por teclado. Solo para uso de ejecuciones desde linea de comandos
#	Parametros: 
#			1. Texto de la pregunta
#			2. Valor por defecto si el usuario no teclea nada 
sub promptUser {

   #-------------------------------------------------------------------#
   #  two possible input arguments - $promptString, and $defaultValue  #
   #  make the input arguments local variables.                        #
   #-------------------------------------------------------------------#

   local($promptString,$defaultValue) = @_;

   #-------------------------------------------------------------------#
   #  if there is a default value, use the first print statement; if   #
   #  no default is provided, print the second string.                 #
   #-------------------------------------------------------------------#

   if ($defaultValue) {
      print $promptString, "[", $defaultValue, "]: ";
   } else {
      print $promptString, ": ";
   }

   $| = 1;               # force a flush after our print
   $ENTER = <STDIN>;     # get the input from STDIN (presumably the keyboard)

   chomp($ENTER);

   #-----------------------------------------------------------------#
   #  if we had a $default value, and the user gave us input, then   #
   #  return the input; if we had a default, and they gave us no     #
   #  no input, return the $defaultValue.                            #
   #                                                                 # 
   #  if we did not have a default value, then just return whatever  #
   #  the user gave us.  if they just hit the <enter> key,           #
   #  the calling routine will have to deal with that.               #
   #-----------------------------------------------------------------#

   if ("$defaultValue") {
      return $ENTER ? $ENTER : $defaultValue;    # return $_ if it has a value
   } else {
      return $ENTER;
   }
}

#Funcion initcap
#   Convierte un texto la primera letra en mayusculas y el resto a minusculas
#	Parametros: 
#			1. Texto 
sub initcap {

	$w = shift;
	$w =~ s/(?<=\w)(.)/\l$1/g;
	return $w;

}

#Funcion decode_special_character
#   Convierte caracteres especiales usados en HTML en sus equivalentes.
#	Parametros: 
#			1. Texto 
sub decode_special_character{

$text = shift;
my @encontrados  = ($text =~ m/(&[^;]+;)/g);
foreach my $elemento (@encontrados) {
	$text =~ s/$elemento/$SPECIAL{$elemento}/g;
}

 


return $text;

}

#   Convierte caracteres Unicode U\00e1 a caracteres en HTML  .
#	Parametros: 
#			1. Texto 
sub Unicode_to_HTML
{

$text = shift;
my @encontrados  = ($text =~ m/\\u(....)/ig);

print "Texto:>" . $text . "<";

foreach my $elemento (@encontrados) {
	$elemento = lc $elemento;

	print "Elemento:" . $elemento;
	print "Cambio: " . $_Unicode_to_HTML{ $elemento};
	
	$PATRON = '\\\[Uu]' . $elemento;
	$text =~ s/$PATRON/$_Unicode_to_HTML{ $elemento}/gie;
}

#$_Unicode_to_HTML{'\u00a2'} = '&cent;';
#\u00f3
 
return $text;


}


##################################################################################################################
sub f_Last_URL{
###########################################################
#Funcion Devuelve la ultima URL completa (con comienzo con http) de una Url que va a ser redirigida una o varias veces
#	Parametros: url .url completa

#PENDIENTE: http://www.topcashback.com/earncashback.aspx?mpurl=wayside-gardens

my $p_url = shift;
my $p_ANON ='';

my @PARAM = @_;
my $METODO = 'GET';

if ($PARAM[-1] =~ /^POST$/ || $PARAM[-2] =~ /^POST$/  ) {
	$METODO = 'POST';
}

if ($PARAM[-1] =~ /^ANON$/ || $PARAM[-2] =~ /^ANON$/ ) {
	$p_ANON = 'SI' ;
}
else{
	$p_ANON = 'NO' ;
}



my $html_page;
my $headers_page;
my @LOCATIONS_TMP ;


#constats.pl Contiene los valores para detectar redirecciones
#<meta http-equiv=REFRESH content=3;url=
#top.location.href = "http://www.dpbolvw.net/click-5464610-10828995?SID=100897";    
#http://www.topcashback.com/redirect.aspx?mpurl=walgreens&instant=False&url=http://www.dpbolvw.net/click-5464610-10828995?SID=100897
#<meta http-equiv="refresh" content="3;url=/default.aspx?code=404"><a href="default.aspx">Click here to continue to the website.</a>  You should be redirected automatically in a few seconds...
#<meta http-equiv="Refresh" content="0;url=http://www.2bstores.com/?extid=af_gan_k107195_Coupon Cactus&=&utm_source=affiliatetraction&utm_medium=googleaffiliatenetwork&utm_campaign=http://www.2bstores.com/?extid=af_gan_k107195_Coupon Cactus">


$FIN=1;
$new_url = $p_url;
my $new_url_ant ; #Para evitar que se cicle
while ($FIN) {
	$FIN = 0;
	($html_page, $headers_page , @LOCATIONS_TMP ) = GET_POST($METODO, $new_url, '', $p_ANON, '');

	#Si aparece un javascript con la redireccion se devuelve.
	if ($html_page =~ /<script>[\s\r\n\t]*window.location=['"]([^'"]+)['"]</) {
		return $+;
	}

	$html_page =~ s/[\n\r\t]//g;
	if (@LOCATIONS_TMP) {
		$new_url = $LOCATIONS_TMP[-1];
	}
	
	#p_ ($html_page)  ;
	#print("--------------------------------------------------------\n");
	#print_r(@LOCATIONS_TMP);
	#print("\n--------------------------------------------------------\n");

	foreach my $dom ( @HOST_REDIRECT){
		#p_( "\nBuscando..." . $dom . "\n") ;
		if ($html_page =~ /$dom/i) {
			$new_url_ant = $new_url;
			$new_url = $1;
			$u1 = url_encode($new_url);
			$u2 = url_encode($new_url_ant);
			#print "--------------------------\n";
			#print "Ant: " . $u1 . "\n";
			#print "New: " . $u2 . "\n";
			#print "--------------------------\n";
			if ( $u1 !=~ $u2  && $new_url =~ /^http/ ) {
				#p_(  "Encontrado: $new_url para $dom\n") ;
				$FIN = 1;
			}
		}
	}
}

#Si hay valores en @LOCATIONS_TMP se devuelve la ultima url completa de @LOCATIONS_TMP
if (@LOCATIONS_TMP) {
#Devuelve la ultima url completa (con http:)8 
#PENDIENTE: se podria devolver la ultima url pero añadiendo el dominio
	$i=-1;
	while ($LOCATIONS_TMP[$i]) {
		if ($LOCATIONS_TMP[$i] =~ /^http/ ) {
			return $LOCATIONS_TMP[$i];	
		}
		$i--;
	}
	p_("Devuelve " . $LOCATIONS_TMP[-1] . "\n" );
	return $LOCATIONS_TMP[-1];
}	
else{# En la ultima consulta no hay valores en @LOCATIONS_TMP. Se devuelve la ultima url
	return $new_url;
}


}


##################################################################################################################
sub f_First_URL{
###########################################################
#Funcion Devuelve la ultima URL completa (con comienzo con http) de una Url que va a ser redirigida una o varias veces
#	Parametros: url .url completa

#PENDIENTE: http://www.topcashback.com/earncashback.aspx?mpurl=wayside-gardens

my $p_url = shift;
my $p_ANON ='';

my @PARAM = @_;
my $METODO = 'GET';

if ($PARAM[-1] =~ /^POST$/ || $PARAM[-2] =~ /^POST$/  ) {
	$METODO = 'POST';
}

if ($PARAM[-1] =~ /^ANON$/ || $PARAM[-2] =~ /^ANON$/ ) {
	$p_ANON = 'SI' ;
}
else{
	$p_ANON = 'NO' ;
}



my $html_page;
my $headers_page;
my @LOCATIONS_TMP ;


#constats.pl Contiene los valores para detectar redirecciones
#<meta http-equiv=REFRESH content=3;url=
#top.location.href = "http://www.dpbolvw.net/click-5464610-10828995?SID=100897";    
#http://www.topcashback.com/redirect.aspx?mpurl=walgreens&instant=False&url=http://www.dpbolvw.net/click-5464610-10828995?SID=100897
#<meta http-equiv="refresh" content="3;url=/default.aspx?code=404"><a href="default.aspx">Click here to continue to the website.</a>  You should be redirected automatically in a few seconds...
#<meta http-equiv="Refresh" content="0;url=http://www.2bstores.com/?extid=af_gan_k107195_Coupon Cactus&=&utm_source=affiliatetraction&utm_medium=googleaffiliatenetwork&utm_campaign=http://www.2bstores.com/?extid=af_gan_k107195_Coupon Cactus">


$FIN=1;
$new_url = $p_url;
my $new_url_ant ; #Para evitar que se cicle
while ($FIN) {
	$FIN = 0;
	($html_page, $headers_page , @LOCATIONS_TMP ) = GET_POST($METODO, $new_url, '', $p_ANON, '');
	$html_page =~ s/[\n\r\t]//g;
	if (@LOCATIONS_TMP) {
		$new_url = $LOCATIONS_TMP[-1];
	}
	
	#p_ ($html_page)  ;
	#print("--------------------------------------------------------\n");
	#print_r(@LOCATIONS_TMP);
	#print("\n--------------------------------------------------------\n");

	foreach my $dom ( @HOST_REDIRECT){
		#p_( "\nBuscando..." . $dom . "\n") ;
		if ($html_page =~ /$dom/i) {
			$new_url_ant = $new_url;
			$new_url = $1;
			$u1 = url_encode($new_url);
			$u2 = url_encode($new_url_ant);
			#print "--------------------------\n";
			#print "Ant: " . $u1 . "\n";
			#print "New: " . $u2 . "\n";
			#print "--------------------------\n";
			if ( $u1 !=~ $u2  && $new_url =~ /^http/ ) {
				#p_(  "Encontrado: $new_url para $dom\n") ;
				$FIN = 1;
			}
		}
	}
}

#Si hay valores en @LOCATIONS_TMP se devuelve la primera url completa de @LOCATIONS_TMP
#print_r(@LOCATIONS_TMP);

if (@LOCATIONS_TMP) {
#Devuelve la primera url completa (con http:)
#PENDIENTE: se podria devolver la ultima url pero añadiendo el dominio
	$i=0;
	while ($LOCATIONS_TMP[$i]) {
		if ($LOCATIONS_TMP[$i] =~ /^http/ ) {
			return $LOCATIONS_TMP[$i];	
		}
		$i++;
	}
	p_("Devuelve " . $LOCATIONS_TMP[0] . "\n" );
	return $LOCATIONS_TMP[0];
}	
else{# En la ultima consulta no hay valores en @LOCATIONS_TMP. Se devuelve la ultima url
	return $new_url;
}


}



###########################################################
#Funcion f_cambia_agente
#   Cambia el agente o navegador con el que se hace la conexion de entre la lista de @AGENTES
#	Parametros:
#		- Ninguno
sub f_cambia_agente{

	$v_PARAMETROS{GENERAL}{'User-Agent'} = $AGENTES[int rand(int @AGENTES)];

	print "Nuevo Agente:" . $v_PARAMETROS{GENERAL}{'User-Agent'} . "\n";

}


##################################################################################################################
sub f_download_file{
###########################################################
#Funcion Descarga el ficgero asocido a una url
#	Parametros: 
#		1. url 
#		2. Fichero
#		3. Si la llamada es con GET o POST

my $p_url = shift;
my $p_file = shift;
my $p_method = shift;

if ( !$p_method ) {
	$p_method = "GET";
}

my ($output_page, $output_headers , @LOCATIONS) = GET_POST($p_method , $p_url, '', 'NO', '');
print_r($output_headers);

open (FILE_DOWNLOAD, ">", $p_file) or die $!;
binmode FILE_DOWNLOAD;
print FILE_DOWNLOAD   $output_page ;
close FILE_DOWNLOAD;

return 1;

}

###########################################################
#Funcion Obtener la IP que se ve en el exterior.Necesita la variable @MYIP (en constats.pl)
#	Parametros: 
sub f_myip{
 
my $_i = int(rand( (int @MYIP))/2) ;

$_IP = f_code_in_page	($MYIP[2*$_i] , $MYIP[(2*$_i)+1] );

if ($_IP) {
	return $_IP;
}
else{
	return f_myip();
}

}

###########################################################
#Funcion PageRank . Obtiene el Page Rank de Google de  enlace.
#	Parametros: url
sub PageRank{
	eval('use WWW::Google::PageRank');
	my $url = shift;
	my $pr = WWW::Google::PageRank->new;
	return  scalar($pr->get($url));

}

###########################################################
#Funcion Crea texto enriquezido apra .rtf
#	Parametros: 
sub crea_rtf{
 my $title = shift;
 my $body  = shift;
 
#$title =~ s/\\'/'/g;
#$body =~ s/\\'/'/g;

$body =~ s/<br>/\\\\par\n----------------------------\\\\par\n/g;

if ($title) {
	$title = '{\\\rtf1\\\ansi{\\\fonttbl\\\f0\\\fswiss Helvetica;}\\\f0\\\pard' . "\n" . '{\\\fs48 ' . $title . '}\\\par\\\par' . "\n";
}


return $title . $body . '\\\par';

}

###########################################################
#Funcion crea un fichero con el contenido como parametro
#	Parametros: 
sub crea_file{
 my $name = shift;
 my $content  = shift;

print "Se abre el fichero " . $name . "\n";
 open (FILE_, "+>", $name) or die $!;

 print FILE_ $content;
 close FILE_;
 return 1;
}

###########################################################
#Funcion crea un fichero con el contenido como parametro
#	Parametros: 
sub pause{
 my $p = shift;
 
 sleep $p;

}

###########################################################
#Funcion borrar duplicados de un array
#	Parametros: 
#		1. Array 
sub del_dup(){

$arr = shift;


 
my %hash   = map { $_ => 1 } @{$arr};
my @unique = keys %hash;

return @unique;

}


###########################################################
#Funcion borrar un elemento de un array
#	Parametros: 
#		1. Array 
#		2. Elemento
sub del_array {
    my $index = 0;
	
	my $element = shift;
	my @RET = @_;
	
	for my $value (@RET) {
	  #print "testing $value\n";
	  if ( $value == $element or $value eq $element ) {
		print "removed value $value\n";
		splice @RET, $index, 1;
	  }
	  $index++;
	}
	return @RET;
}


###########################################################
#Funcion crea un fichero con el contenido como parametro
#	Parametros: 
#		1. hash con el nombre del fichero como clave y la url como valor 
#		2. Carpeta de descarga
sub download_files{
	my $_FILES = shift;
	my $p_folder = shift;
	my $p_pause = shift;

	#Create the folder
	unless(-d $p_folder){
			print "Folder ". $folder . " creating\n";
			mkdir($p_folder) || die "Unable to create directory <$!>\n";
	}
	
	my $count = 1;
	$p_folder .=   '/' ;
	$p_folder =~ s/\/\//\//;
	foreach my $file ( keys %{$_FILES}) { 
		my $url = $_FILES->{$file};
		$url =~ s/^\s+//;
		if ($url =~ /^http/) {
			#print $count . "--" .$url  . "\n"; 
			$comando = 'wget -O"'. $p_folder . $file  . '" ' . $url . "\n";
			print "---->" . $comando . "\n";
			system($comando);
			$count++;
		}
		if ($p_pause) { 
			pause( $p_pause);
		}
	}
	#$comando = 'zip -j ./tmp/' . $p_name . '.zip ./tmp/' . $p_name . '*' . "\n";
	#system($comando);
	#$comando = 'rm ./tmp/' . $p_name . '*.jpg' . "\n";
	#system($comando);
	return 1;
}

###########################################################
#Funcion f_Convert_UNICODE
#   Convierte los caracteres no compatibles con UNICODE
#	Parametros:
#		- Cadena de texto

sub f_Convert_UNICODE{

my $text = shift;
my $ret = '';

for (my $i=0;  $i < length($text) ;  $i++ ) {
	$_c = substr ($text , $i , 1);
	
	
	if (ord($_c) > 122) { #Si es mayor que los caracteres ascii convencionales
		$ret .= "&#x" .  sprintf("%x", ord($_c))  . ";" ;
 	}
	else{
		if ($_c eq "&" ) {
			$ret .= "&amp;";
		}
		else{
			$ret .= $_c;
		}
		
	}
}


return $ret;
}

###########################################################
#Funcion f_XML_Compatible
#   Convierte los caracteres no compatibles con UNICODE
#	Parametros:
#		- Cadena de texto

sub f_XML_Compatible{

my $text = shift;
my $ret = '';

for (my $i=0;  $i < length($text) ;  $i++ ) {
	$_c = substr ($text , $i , 1);
	#print "\t ........>" . $_c . "<   >" .  ord($_c) . "<\n";
	
	if ( ord($_c)  <  126) { #Si es mayor que los caracteres ascii convencionales
			$ret .= $_c;
 	}
}

return $ret;
}


###########################################################
#Funcion f_Convert_To_Timestamp 
#   Convierte una fecha a formato Timestamp 
#	Parametros:
#		- Fecha con formato yyyy-mm-dd hh:mi:ss

sub f_Convert_To_Timestamp{

my $fecha = shift;

my ($year,$mon,$mday,$hour,$min,$sec) = split(/[\-\:\s]/, $fecha ); 
my $time = timelocal($sec,$min,$hour,$mday,$mon-1,$year); 
return  $time;

}

 
###########################################################
#Funcion f_Convert_Timestamp 
#   Convierte un valor numerico Timestamp en fecha
#	Parametros:
#		- Numero

sub f_Convert_Timestamp{
use Date::Parse;
	my $number = shift;

	$com = "date -d @" . $number;
	return `$com`;
}

###########################################################
#Funcion genera_urls 
#   Genera de forma forzada urls a analizar a un esquema dado
#	Parametros:
#		- URL. Se utilizara %%%20..30%%% para generar 11 urls con los valores 20 a 30 donde aparece el patron %%%20..30%%%
#		- Esquema al que se asociara
sub genera_urls{
my $TMP_URL = shift;
my $TMP_ESQUEMA = shift;

my %tmp_gen;

#PENDIENTE. Para post generar el valor de la cadena url_POST_data


if ($TMP_URL =~ m/%%%(\d+)\.\.(\d+)%%%/) {
	#print "Encontrado\n";
	#print $1 . "--" . $2 . "\n";
	$from = $1;
	$to   = $2;
}
else{
	#No hay comodines, solo genera una URL
		my $_indice = rand();
		$tmp_gen{$_indice}{esquema} = $TMP_ESQUEMA;
		$tmp_gen{$_indice}{codigo} = $_indice;
		$tmp_gen{$_indice}{url} = $NEW_URL;
		$tmp_gen{$_indice}{url_POST_data} = '';
}

for($i = $from; $i <= $to; $i++) {
	$NEW_URL = $TMP_URL;
	$NEW_URL =~ s/%%%$from\.\.$to%%%/$i/;
		#print $NEW_URL . "\n";
		$tmp_gen{'new_url'.$i}{esquema} = $TMP_ESQUEMA;
		$tmp_gen{'new_url'.$i}{codigo} = 'new_url'.$i;
		$tmp_gen{'new_url'.$i}{url} = $NEW_URL;
		$tmp_gen{'new_url'.$i}{url_POST_data} = '';
}

return %tmp_gen;

}

#################################################################################################################
#Funcion whitepages
#	Obtiene el telefono para una direccion postal y nombre.
#	Parameterss: 
#			1. address
#			2. name 
#	Return 
#			phone
#################################################################################################################
sub whitepages {
my $_address = shift;
my $_name = shift;
my $_phone;

$_name =~ s/\s+/ /g; #Elimina espacios de mas 

if( $_address =~ /P\s*O BOX/){
	p_("Es una direccion de apartado postal\n");
	return "";
}

my $_name2 ; # Se precee que venga el apellido primero. Se toma la primera palabra (apellido) y se pone al final
if ($_name =~ /^([^\s]+) (.*)/) {
	$_name2 = $2 . ' ' . $1;
	$_name2 =~ s/\s+/ /g;#Elimina espacios de mas 
}
 

$_address =~ s/\s+/ /g;	#Elimina espacios de mas 
$_address =~ s/ /+/g;	#Reemplaza espacios por +
$_address =~ s/,/%2C/g;	#Reemplaza espacios por %2C

my ($output_page, $output_headers , @LOCATIONS) = GET_POST('GET', 'http://www.whitepages.com/search/FindNearby?street=' . $_address . '&where=', '', 'NO', '');
#print $output_page;

my @_encontrados ;
if ( $output_page =~ /Here are some nearby results/) {
	p_("Varios Resultados para esta direccion en whitepages.com\n");
}

@_encontrados = ($output_page =~ m/<li class="basic_info">\s*<a href="([^"]+)"[^>]*>([^<]+)/g);
print_r(@_encontrados);
while(@_encontrados) 	{
	 $_url = shift (@_encontrados);
	 $_item = shift (@_encontrados);
	if ($_item =~ /$_name/i || $_item =~ /$_name2/i ) {
		p_('Encontrado:' . $_item . 'url:' .$_url );
		my ($output_page, $output_headers , @LOCATIONS) = GET_POST('GET', $_url, '', 'NO', '');
		#print $output_page;
		if ( $output_page =~ /<p class=["'][^'"]*result_phone[^'"]+["']>([^<]+)/) {
			$_phone = $+;
			$_phone =~ s/[\n\r]//g;
			p_('Encontrado Telefono!!!:' . $_phone  );
			return $_phone;
		}
	}
}
return '';


}

#################################################################################################################
#Funcion char2utf8
#	Sustituye los caracteres especiales por su equivalente en UTF-8
#	http://www.utf8-chartable.de/
#	Parameterss: 
#			1. address
#			2. name 
#	Return 
#			phone
#################################################################################################################
sub char2utf8 {
my $text = shift;

my $r = '';

for($i = 0; $i < length($text); $i++) {
	if ($CHAR2UTF8{substr($text,$i,1)}) {
		#print "<" . $a . ">............" . $CHAR2UTF8{$a} . "\n";
		$r = $r . $CHAR2UTF8{substr($text,$i,1)};
	}
	else{
		$r = $r . substr($text,$i,1);
	}

}
return $r;


 }

#################################################################################################################
#Funcion del_acentos
#	Sustituye las letras con acentos por las mismas sin ellas.
#	Parameterss: 
#			1. address
#			2. name 
#	Return 
#			phone
#################################################################################################################
sub del_acentos {

$text = shift;
my @encontrados  = ($text =~ m/(.)/g);
foreach my $a (keys %ACENTO){
	$text =~ s/$a/$ACENTO{$a}/ig;
}

return $text;

}

#################################################################################################################
#Funcion convert_secs_to_time
#	Convierte una fecha en segundos
#	Parameterss: 
#			1. seconds
#	Return 
#			date
#################################################################################################################

sub convert_secs_to_time { 
  my $time = shift; 
  my $days = int($time / 86400); 
  $time -= ($days * 86400); 
  my $hours = int($time / 3600); 
  $time -= ($hours * 3600); 
  my $minutes = int($time / 60); 
  my $seconds = $time % 60; 
  
  $days = $days < 1 ? '' : $days .'d '; 
  $hours = $hours < 1 ? '' : $hours .'h '; 
  $minutes = $minutes < 1 ? '' : $minutes . 'm '; 
  $time = $days . $hours . $minutes . $seconds . 's'; 
  return $time; 
}


#################################################################################################################
#Funcion require_dropbox
#	#Carga un fichero de configuracion desde dropbox con require
#	Parameterss: 
#			1. local file eg.  ./data/test.txt
#			2. remote file eg. /ShareTaxRecovery/20130614/test.txt
#	Return 
#			1=ok or 0=fail
#################################################################################################################

sub require_dropbox{
	
	my $file_dropbox = shift;

	$file_name = $file_dropbox;
	$file_name =~ s/\/*(?:[^\/]+\/)+//g;
	
	$ret = dropbox('download' , $file_dropbox , './tmp/' . $file_name);

	if ($INC{'./tmp/' . $file_name}) {
		delete $INC{'./tmp/' . $file_name};
	}
	
	require('./tmp/' . $file_name);
}

#################################################################################################################
#Funcion dropbox_uploader
#	Descarga o sube un fichero de/a dropbox.
#	Parameterss: 
#			1. local file eg.  ./data/test.txt
#			2. remote file eg. /ShareTaxRecovery/20130614/test.txt
#	Return 
#			1=ok or 0=fail
#################################################################################################################
sub dropbox {

$action = shift;	#upload o download
$file1 = shift;		#local to upload, remote to download
$file2 = shift;		#remote to upload, local to download
$folder_win = shift; #Carpeta de DropBox local



#Para Windos se usa un COPY
if ($^O =~ /.*Win.*/) {

	if ($action eq 'download') {
			$file1 =~ s/^[\/\\]//;
			$file1 =~ s/[\/\\]/\x5C/g;

			$file2 =~ s/[\/\\]/\x5C/g;

			$folder_win =~ s/[\/\\]$//;
			$folder_win =~ s/[\/\\]/\x5C/g;

			$file1 = $folder_win . "\\" . $file1;
			system('copy ' . $file1 . ' ' . $file2);
			return 1;
	}

	if ($action eq 'upload') {
			$file1 =~ s/[\/\\]/\x5C/g;

			$file2 =~ s/^[\/\\]//;
			$file2 =~ s/[\/\\]/\x5C/g;

			$folder_win =~ s/[\/\\]$//;
			$folder_win =~ s/[\/\\]/\x5C/g;

			$folder = $file2;
			$folder =~ s/[\/\\][^\/\\]+$//;
			$folder = $folder_win ."\\".$folder;
			
			#Si no existe la carpeta la crea.
			if ( !(-e $folder)) {
				system('mkdir ' . $folder  );
			}

			$file2 = $folder_win . "\\" . $file2;
			system('copy ' . $file1 . ' ' . $file2);
			return 1;
	}



}


$command = 'bash ' . $directorio .  './util/dropbox/dropbox_uploader.sh' ;

#my @lines = qx/$command 'upload' $local $remote/;
print $command . ' ' . $action .' '. $file1.' '. $file2;
print "\n";

@result = `$command $action $file1 $file2`;


if ($result[-1] =~ /> DONE/) {
	print $action . " to/from dropbox OK\n."  ;
	return 1;
}
else{
	print "ERROR on dropbox:" . $result[-1] . "\n"  ;
	return 0;
}

}

sub f_add_dias_hoy
{

use Date::Calc qw(Add_Delta_Days);

$DIAS = shift;

%_MOTHS = ( 
Jan => 1,
Feb => 2,
Mar => 3,
Apr => 4,
May => 5,
Jun => 6,
Jul => 7,
Aug => 8,
Sep => 9,
Oct => 10,
Nov => 11,
Dec => 12
);

%_MOTHS_INV = ( 
  1 => 'Jan',
  2 => 'Feb',
  3 => 'Mar',
  4 => 'Apr',
  5 => 'May',
  6 => 'Jun',
  7 => 'Jul',
  8 => 'Aug',
  9 => 'Sep',
  10 => 'Oct',
  11 => 'Nov',
  12 => 'Dec',
);

$timestamp = join(' ', localtime(time));
#print $timestamp  . "\n";

#perl -e "@timeData = localtime(time); print join(' ', @timeData);"

#7 59 8 17 3 112 2 107 1

#if ( $timestamp =~ /[^\s]+ ([^\s]+) ([^\s]+) [^\:]+:[^\:]+:[^\:]+ (.*)/ ) {
if ( $timestamp =~ /(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/ ) {
	$year  = int $6 +1900 ;
	$month = int $5+1 ;
	$day   = $4;
}
#print "year=" . $year  . "\n";
#print "moth=" . $month . "\n";;
#print "day="  . $day . "\n";
	
($year, $month, $day) = Add_Delta_Days($year, $month ,$day, $DIAS );
$day = sprintf("%02s", $day ) ;
$month = sprintf("%02s", $month ) ;

#$YESTERDAY  = $_MOTHS_INV{$month} . " " . $day;
$YESTERDAY  = $year . $month . $day;

#print "YESTERDAY=" . $YESTERDAY  . "\n";

return $YESTERDAY;

}

#######################################################################################################
sub timestamp {
  return localtime (time);
}


#Compone un mensaje a partid de un array
#########################################################################################
# El array debe estar fevinido por varias lineas con formato: 
#  ["Is it still available?","Is it still 4-sale?","Do you still have it?","Has it been sold, yet?","Still available?"],
#La llamada se hace con:
#	rand_message(\@MENSAJE);

sub rand_message{
my $text_body ='';

@_M = shift;
  
foreach (@{$_M[0]}) {
 
	my $line = encode("utf8", $_->[int rand(@{$_})]);


	#print "Linea..." . $line . "\n";
	if ($line =~ /\$/ ) {
		$line = eval($line);
	    #print "Encontrado $: " . $line . "\n";

	}
	#print "Linea..." . $line . "\n";
	$text_body = $text_body . $line ;
} 

return $text_body;
}

################################################################################################
our %CHAR2UTF8;
$CHAR2UTF8{"¡"}="\xc2\xa1";
$CHAR2UTF8{"¢"}="\xc2\xa2";
$CHAR2UTF8{"£"}="\xc2\xa3";
$CHAR2UTF8{"¤"}="\xc2\xa4";
$CHAR2UTF8{"¥"}="\xc2\xa5";
$CHAR2UTF8{"¦"}="\xc2\xa6";
$CHAR2UTF8{"§"}="\xc2\xa7";
$CHAR2UTF8{"¨"}="\xc2\xa8";
$CHAR2UTF8{"©"}="\xc2\xa9";
$CHAR2UTF8{"ª"}="\xc2\xaa";
$CHAR2UTF8{"«"}="\xc2\xab";
$CHAR2UTF8{"¬"}="\xc2\xac";
$CHAR2UTF8{"­"}="\xc2\xad";
$CHAR2UTF8{"®"}="\xc2\xae";
$CHAR2UTF8{"¯"}="\xc2\xaf";
$CHAR2UTF8{"°"}="\xc2\xb0";
$CHAR2UTF8{"±"}="\xc2\xb1";
$CHAR2UTF8{"²"}="\xc2\xb2";
$CHAR2UTF8{"³"}="\xc2\xb3";
$CHAR2UTF8{"´"}="\xc2\xb4";
$CHAR2UTF8{"µ"}="\xc2\xb5";
$CHAR2UTF8{"¶"}="\xc2\xb6";
$CHAR2UTF8{"·"}="\xc2\xb7";
$CHAR2UTF8{"¸"}="\xc2\xb8";
$CHAR2UTF8{"¹"}="\xc2\xb9";
$CHAR2UTF8{"º"}="\xc2\xba";
$CHAR2UTF8{"»"}="\xc2\xbb";
$CHAR2UTF8{"¼"}="\xc2\xbc";
$CHAR2UTF8{"½"}="\xc2\xbd";
$CHAR2UTF8{"¾"}="\xc2\xbe";
$CHAR2UTF8{"¿"}="\xc2\xbf";
#$CHAR2UTF8{"À"}="\xc3\x80";
#$CHAR2UTF8{"Á"}="\xc3\x81";
#$CHAR2UTF8{"Â"}="\xc3\x82";
#$CHAR2UTF8{"Ã"}="\xc3\x83";
#$CHAR2UTF8{"Ä"}="\xc3\x84";
#$CHAR2UTF8{"Å"}="\xc3\x85";
$CHAR2UTF8{"Æ"}="\xc3\x86";
$CHAR2UTF8{"Ç"}="\xc3\x87";
$CHAR2UTF8{"È"}="\xc3\x88";
$CHAR2UTF8{"É"}="\xc3\x89";
$CHAR2UTF8{"Ê"}="\xc3\x8a";
$CHAR2UTF8{"Ë"}="\xc3\x8b";
$CHAR2UTF8{"Ì"}="\xc3\x8c";
$CHAR2UTF8{"Í"}="\xc3\x8d";
$CHAR2UTF8{"Î"}="\xc3\x8e";
$CHAR2UTF8{"Ï"}="\xc3\x8f";
$CHAR2UTF8{"Ð"}="\xc3\x90";
$CHAR2UTF8{"Ñ"}="\xc3\x91";
$CHAR2UTF8{"Ò"}="\xc3\x92";
$CHAR2UTF8{"Ó"}="\xc3\x93";
$CHAR2UTF8{"Ô"}="\xc3\x94";
$CHAR2UTF8{"Õ"}="\xc3\x95";
$CHAR2UTF8{"Ö"}="\xc3\x96";
$CHAR2UTF8{"×"}="\xc3\x97";
$CHAR2UTF8{"Ø"}="\xc3\x98";
$CHAR2UTF8{"Ù"}="\xc3\x99";
$CHAR2UTF8{"Ú"}="\xc3\x9a";
$CHAR2UTF8{"Û"}="\xc3\x9b";
$CHAR2UTF8{"Ü"}="\xc3\x9c";
$CHAR2UTF8{"Ý"}="\xc3\x9d";
$CHAR2UTF8{"Þ"}="\xc3\x9e";
$CHAR2UTF8{"ß"}="\xc3\x9f";
$CHAR2UTF8{"à"}="\xc3\xa0";
$CHAR2UTF8{"á"}="\xc3\xa1";
$CHAR2UTF8{"â"}="\xc3\xa2";
#$CHAR2UTF8{"ã"}="\xc3\xa3";
$CHAR2UTF8{"ä"}="\xc3\xa4";
$CHAR2UTF8{"å"}="\xc3\xa5";
$CHAR2UTF8{"æ"}="\xc3\xa6";
$CHAR2UTF8{"ç"}="\xc3\xa7";
$CHAR2UTF8{"è"}="\xc3\xa8";
$CHAR2UTF8{"é"}="\xc3\xa9";
$CHAR2UTF8{"ê"}="\xc3\xaa";
$CHAR2UTF8{"ë"}="\xc3\xab";
$CHAR2UTF8{"ì"}="\xc3\xac";
$CHAR2UTF8{"í"}="\xc3\xad";
$CHAR2UTF8{"î"}="\xc3\xae";
$CHAR2UTF8{"ï"}="\xc3\xaf";
$CHAR2UTF8{"ð"}="\xc3\xb0";
$CHAR2UTF8{"ñ"}="\xc3\xb1";
$CHAR2UTF8{"ò"}="\xc3\xb2";
$CHAR2UTF8{"ó"}="\xc3\xb3";
$CHAR2UTF8{"ô"}="\xc3\xb4";
$CHAR2UTF8{"õ"}="\xc3\xb5";
$CHAR2UTF8{"ö"}="\xc3\xb6";
$CHAR2UTF8{"÷"}="\xc3\xb7";
$CHAR2UTF8{"ø"}="\xc3\xb8";
$CHAR2UTF8{"ù"}="\xc3\xb9";
$CHAR2UTF8{"ú"}="\xc3\xba";
$CHAR2UTF8{"û"}="\xc3\xbb";
$CHAR2UTF8{"ü"}="\xc3\xbc";
$CHAR2UTF8{"ý"}="\xc3\xbd";
$CHAR2UTF8{"þ"}="\xc3\xbe";
$CHAR2UTF8{"ÿ"}="\xc3\xbf";



$SPECIAL{'&Aacute;'}='Á';
$SPECIAL{'&aacute;'}='á';
$SPECIAL{'&Acirc;'}='Â';
$SPECIAL{'&acirc;'}='â';
$SPECIAL{'&acute;'}='´';
$SPECIAL{'&AElig;'}='Æ';
$SPECIAL{'&aelig;'}='æ';
$SPECIAL{'&Agrave;'}='À';
$SPECIAL{'&agrave;'}='à';
$SPECIAL{'&amp;'}='&';
$SPECIAL{'&Aring;'}='Å';
$SPECIAL{'&aring;'}='å';
$SPECIAL{'&Atilde;'}='Ã';
$SPECIAL{'&atilde;'}='ã';
$SPECIAL{'&Auml;'}='Ä';
$SPECIAL{'&auml;'}='ä';
$SPECIAL{'&brvbar;'}='¦';
$SPECIAL{'&brkbar;'}='¦';
$SPECIAL{'&Ccedil;'}='Ç';
$SPECIAL{'&ccedil;'}='ç';
$SPECIAL{'&cedil;'}='¸';
$SPECIAL{'&cent;'}='¢';
$SPECIAL{'&copy;'}='©';
$SPECIAL{'&curren;'}='¤';
$SPECIAL{'&deg;'}='°';
$SPECIAL{'&divide;'}='÷';
$SPECIAL{'&Eacute;'}='É';
$SPECIAL{'&eacute;'}='é';
$SPECIAL{'&Ecirc;'}='Ê';
$SPECIAL{'&ecirc;'}='ê';
$SPECIAL{'&Egrave;'}='È';
$SPECIAL{'&egrave;'}='è';
$SPECIAL{'&ETH;'}='Ð';
$SPECIAL{'&eth;'}='ð';
$SPECIAL{'&Euml;'}='Ë';
$SPECIAL{'&euml;'}='ë';
$SPECIAL{'&frac12;'}='½';
$SPECIAL{'&frac14;'}='¼';
$SPECIAL{'&frac34;'}='¾';
$SPECIAL{'&frasl;'}='/';
$SPECIAL{'&gt;'}='>';
$SPECIAL{'&Iacute;'}='Í';
$SPECIAL{'&iacute;'}='í';
$SPECIAL{'&Icirc;'}='Î';
$SPECIAL{'&icirc;'}='î';
$SPECIAL{'&iexcl;'}='¡';
$SPECIAL{'&Igrave;'}='Ì';
$SPECIAL{'&igrave;'}='ì';
$SPECIAL{'&iquest;'}='¿';
$SPECIAL{'&Iuml;'}='Ï';
$SPECIAL{'&iuml;'}='ï';
$SPECIAL{'&laquo;'}='«';
$SPECIAL{'&lt;'}='<';
$SPECIAL{'&macr;'}='¯';
$SPECIAL{'&hibar;'}='¯';
$SPECIAL{'&mdash;'}='—';
$SPECIAL{'&micro;'}='µ';
$SPECIAL{'&middot;'}='·';
$SPECIAL{'&nbsp;'}=' ';
$SPECIAL{'&ndash;'}='–';
$SPECIAL{'&not;'}='¬';
$SPECIAL{'&Ntilde;'}='Ñ';
$SPECIAL{'&ntilde;'}='ñ';
$SPECIAL{'&Oacute;'}='Ó';
$SPECIAL{'&oacute;'}='ó';
$SPECIAL{'&Ocirc;'}='Ô';
$SPECIAL{'&ocirc;'}='ô';
$SPECIAL{'&Ograve;'}='Ò';
$SPECIAL{'&ograve;'}='ò';
$SPECIAL{'&ordf;'}='ª';
$SPECIAL{'&ordm;'}='º';
$SPECIAL{'&Oslash;'}='Ø';
$SPECIAL{'&oslash;'}='ø';
$SPECIAL{'&Otilde;'}='Õ';
$SPECIAL{'&otilde;'}='õ';
$SPECIAL{'&Ouml;'}='Ö';
$SPECIAL{'&ouml;'}='ö';
$SPECIAL{'&para;'}='¶';
$SPECIAL{'&plusmn;'}='±';
$SPECIAL{'&pound;'}='£';
$SPECIAL{'&quot;'}='"';
$SPECIAL{'&raquo;'}='»';
$SPECIAL{'&reg;'}='®';
$SPECIAL{'&sect;'}='§';
$SPECIAL{'&shy;'}='­';
$SPECIAL{'&sup1;'}='¹';
$SPECIAL{'&sup2;'}='²';
$SPECIAL{'&sup3;'}='³';
$SPECIAL{'&szlig;'}='ß';
$SPECIAL{'&THORN;'}='Þ';
$SPECIAL{'&thorn;'}='þ';
$SPECIAL{'&times;'}='×';
$SPECIAL{'&Uacute;'}='Ú';
$SPECIAL{'&uacute;'}='ú';
$SPECIAL{'&Ucirc;'}='Û';
$SPECIAL{'&ucirc;'}='û';
$SPECIAL{'&Ugrave;'}='Ù';
$SPECIAL{'&ugrave;'}='ù';
$SPECIAL{'&uml;'}='¨';
$SPECIAL{'&die;'}='¨';
$SPECIAL{'&Uuml;'}='Ü';
$SPECIAL{'&uuml;'}='ü';
$SPECIAL{'&Yacute;'}='Ý';
$SPECIAL{'&yacute;'}='ý';
$SPECIAL{'&yen;'}='¥';
$SPECIAL{'&yuml;'}='ÿ';
$SPECIAL{'&trade;'}='™';
$SPECIAL{'&euro;'}='€';


our %_HTML_ENCODE;
$_HTML_ENCODE{'¡'}='&#161;';
$_HTML_ENCODE{'¢'}='&#162;';
$_HTML_ENCODE{'£'}='&#163;';
$_HTML_ENCODE{'¤'}='&#164;';
$_HTML_ENCODE{'¥'}='&#165;';
$_HTML_ENCODE{'¦'}='&#166;';
$_HTML_ENCODE{'§'}='&#167;';
$_HTML_ENCODE{'¨'}='&#168;';
$_HTML_ENCODE{'©'}='&#169;';
$_HTML_ENCODE{'ª'}='&#170;';
$_HTML_ENCODE{'«'}='&#171;';
$_HTML_ENCODE{'¬'}='&#172;';
$_HTML_ENCODE{'­'}='&#173;';
$_HTML_ENCODE{'®'}='&#174;';
$_HTML_ENCODE{'¯'}='&#175;';
$_HTML_ENCODE{'°'}='&#176;';
$_HTML_ENCODE{'±'}='&#177;';
$_HTML_ENCODE{'²'}='&#178;';
$_HTML_ENCODE{'³'}='&#179;';
$_HTML_ENCODE{'´'}='&#180;';
$_HTML_ENCODE{'µ'}='&#181;';
$_HTML_ENCODE{'¶'}='&#182;';
$_HTML_ENCODE{'·'}='&#183;';
$_HTML_ENCODE{'¸'}='&#184;';
$_HTML_ENCODE{'¹'}='&#185;';
$_HTML_ENCODE{'º'}='&#186;';
$_HTML_ENCODE{'»'}='&#187;';
$_HTML_ENCODE{'¼'}='&#188;';
$_HTML_ENCODE{'½'}='&#189;';
$_HTML_ENCODE{'¾'}='&#190;';
$_HTML_ENCODE{'¿'}='&#191;';
$_HTML_ENCODE{'À'}='&#192;';
$_HTML_ENCODE{'Á'}='&#193;';
$_HTML_ENCODE{'Â'}='&#194;';
$_HTML_ENCODE{'Ã'}='&#195;';
$_HTML_ENCODE{'Ä'}='&#196;';
$_HTML_ENCODE{'Å'}='&#197;';
$_HTML_ENCODE{'Æ'}='&#198;';
$_HTML_ENCODE{'Ç'}='&#199;';
$_HTML_ENCODE{'È'}='&#200;';
$_HTML_ENCODE{'É'}='&#201;';
$_HTML_ENCODE{'Ê'}='&#202;';
$_HTML_ENCODE{'Ë'}='&#203;';
$_HTML_ENCODE{'Ì'}='&#204;';
$_HTML_ENCODE{'Í'}='&#205;';
$_HTML_ENCODE{'Î'}='&#206;';
$_HTML_ENCODE{'Ï'}='&#207;';
$_HTML_ENCODE{'Ð'}='&#208;';
$_HTML_ENCODE{'Ñ'}='&#209;';
$_HTML_ENCODE{'Ò'}='&#210;';
$_HTML_ENCODE{'Ó'}='&#211;';
$_HTML_ENCODE{'Ô'}='&#212;';
$_HTML_ENCODE{'Õ'}='&#213;';
$_HTML_ENCODE{'Ö'}='&#214;';
$_HTML_ENCODE{'×'}='&#215;';
$_HTML_ENCODE{'Ø'}='&#216;';
$_HTML_ENCODE{'Ù'}='&#217;';
$_HTML_ENCODE{'Ú'}='&#218;';
$_HTML_ENCODE{'Û'}='&#219;';
$_HTML_ENCODE{'Ü'}='&#220;';
$_HTML_ENCODE{'Ý'}='&#221;';
$_HTML_ENCODE{'Þ'}='&#222;';
$_HTML_ENCODE{'ß'}='&#223;';
$_HTML_ENCODE{'à'}='&#224;';
$_HTML_ENCODE{'á'}='&#225;';
$_HTML_ENCODE{'â'}='&#226;';
$_HTML_ENCODE{'ã'}='&#227;';
$_HTML_ENCODE{'ä'}='&#228;';
$_HTML_ENCODE{'å'}='&#229;';
$_HTML_ENCODE{'æ'}='&#230;';
$_HTML_ENCODE{'ç'}='&#231;';
$_HTML_ENCODE{'è'}='&#232;';
$_HTML_ENCODE{'é'}='&#233;';
$_HTML_ENCODE{'ê'}='&#234;';
$_HTML_ENCODE{'ë'}='&#235;';
$_HTML_ENCODE{'ì'}='&#236;';
$_HTML_ENCODE{'í'}='&#237;';
$_HTML_ENCODE{'î'}='&#238;';
$_HTML_ENCODE{'ï'}='&#239;';
$_HTML_ENCODE{'ð'}='&#240;';
$_HTML_ENCODE{'ñ'}='&#241;';
$_HTML_ENCODE{'ò'}='&#242;';
$_HTML_ENCODE{'ó'}='&#243;';
$_HTML_ENCODE{'ô'}='&#244;';
$_HTML_ENCODE{'õ'}='&#245;';
$_HTML_ENCODE{'ö'}='&#246;';
$_HTML_ENCODE{'÷'}='&#247;';
$_HTML_ENCODE{'ø'}='&#248;';
$_HTML_ENCODE{'ù'}='&#249;';
$_HTML_ENCODE{'ú'}='&#250;';
$_HTML_ENCODE{'û'}='&#251;';
$_HTML_ENCODE{'ü'}='&#252;';
$_HTML_ENCODE{'ý'}='&#253;';
$_HTML_ENCODE{'þ'}='&#254;';
$_HTML_ENCODE{'ÿ'}='&#255;';
$_HTML_ENCODE{' '}= ' ';	#Caracter extraño. Ascii 106. No se ve pero está. Hace que falle en XML

our %ACENTO;
$ACENTO{'À'} = 'A';
$ACENTO{'Á'} = 'A';
$ACENTO{'Â'} = 'A';
$ACENTO{'Ã'} = 'A';
$ACENTO{'Ä'} = 'A';
$ACENTO{'Å'} = 'A';
$ACENTO{'Æ'} = 'A';
$ACENTO{'Ç'} = 'C';
$ACENTO{'È'} = 'E';
$ACENTO{'É'} = 'E';
$ACENTO{'Ê'} = 'E';
$ACENTO{'Ë'} = 'E';
$ACENTO{'Ì'} = 'I';
$ACENTO{'Í'} = 'I';
$ACENTO{'Î'} = 'I';
$ACENTO{'Ï'} = 'I';
$ACENTO{'Ò'} = 'O';
$ACENTO{'Ó'} = 'O';
$ACENTO{'Ô'} = 'O';
$ACENTO{'Õ'} = 'O';
$ACENTO{'Ö'} = 'O';
$ACENTO{'Ø'} = 'O';
$ACENTO{'Ù'} = 'U';
$ACENTO{'Ú'} = 'U';
$ACENTO{'Û'} = 'U';
$ACENTO{'Ü'} = 'U';
$ACENTO{'Ý'} = 'Y';
$ACENTO{'à'} = 'a';
$ACENTO{'á'} = 'a';
$ACENTO{'â'} = 'a';
$ACENTO{'ã'} = 'a';
$ACENTO{'ä'} = 'a';
$ACENTO{'å'} = 'a';
$ACENTO{'æ'} = 'a';
$ACENTO{'ç'} = 'c';
$ACENTO{'è'} = 'e';
$ACENTO{'é'} = 'e';
$ACENTO{'ê'} = 'e';
$ACENTO{'ë'} = 'e';
$ACENTO{'ì'} = 'i';
$ACENTO{'í'} = 'i';
$ACENTO{'î'} = 'i';
$ACENTO{'ï'} = 'i';
$ACENTO{'ò'} = 'o';
$ACENTO{'ó'} = 'o';
$ACENTO{'ô'} = 'o';
$ACENTO{'õ'} = 'o';
$ACENTO{'ö'} = 'o';
$ACENTO{'ø'} = 'o';
$ACENTO{'ù'} = 'u';
$ACENTO{'ú'} = 'u';
$ACENTO{'û'} = 'u';
$ACENTO{'ü'} = 'u';
$ACENTO{'ý'} = 'y';



$ACENTO{'&#192;'} = 'A';
$ACENTO{'&#193;'} = 'A';
$ACENTO{'&#194;'} = 'A';
$ACENTO{'&#195;'} = 'A';
$ACENTO{'&#196;'} = 'A';
$ACENTO{'&#197;'} = 'A';
$ACENTO{'&#198;'} = 'A';
$ACENTO{'&#199;'} = 'C';
$ACENTO{'&#200;'} = 'E';
$ACENTO{'&#201;'} = 'E';
$ACENTO{'&#202;'} = 'E';
$ACENTO{'&#203;'} = 'E';
$ACENTO{'&#204;'} = 'I';
$ACENTO{'&#205;'} = 'I';
$ACENTO{'&#206;'} = 'I';
$ACENTO{'&#207;'} = 'I';
$ACENTO{'&#210;'} = 'O';
$ACENTO{'&#211;'} = 'O';
$ACENTO{'&#212;'} = 'O';
$ACENTO{'&#213;'} = 'O';
$ACENTO{'&#214;'} = 'O';
$ACENTO{'&#216;'} = 'O';
$ACENTO{'&#217;'} = 'U';
$ACENTO{'&#218;'} = 'U';
$ACENTO{'&#219;'} = 'U';
$ACENTO{'&#220;'} = 'U';
$ACENTO{'&#221;'} = 'Y';
$ACENTO{'&#224;'} = 'a';
$ACENTO{'&#225;'} = 'a';
$ACENTO{'&#226;'} = 'a';
$ACENTO{'&#227;'} = 'a';
$ACENTO{'&#228;'} = 'a';
$ACENTO{'&#229;'} = 'a';
$ACENTO{'&#230;'} = 'a';
$ACENTO{'&#231;'} = 'c';
$ACENTO{'&#232;'} = 'e';
$ACENTO{'&#233;'} = 'e';
$ACENTO{'&#234;'} = 'e';
$ACENTO{'&#235;'} = 'e';
$ACENTO{'&#236;'} = 'i';
$ACENTO{'&#237;'} = 'i';
$ACENTO{'&#238;'} = 'i';
$ACENTO{'&#239;'} = 'i';
$ACENTO{'&#242;'} = 'o';
$ACENTO{'&#243;'} = 'o';
$ACENTO{'&#244;'} = 'o';
$ACENTO{'&#245;'} = 'o';
$ACENTO{'&#246;'} = 'o';
$ACENTO{'&#248;'} = 'o';
$ACENTO{'&#249;'} = 'u';
$ACENTO{'&#250;'} = 'u';
$ACENTO{'&#251;'} = 'u';
$ACENTO{'&#252;'} = 'u';
$ACENTO{'&#253;'} = 'y';
$ACENTO{'&Agrave;'} = 'A';
$ACENTO{'&Aacute;'} = 'A';
$ACENTO{'&Acirc;'} = 'A';
$ACENTO{'&Atilde;'} = 'A';
$ACENTO{'&Auml;'} = 'A';
$ACENTO{'&Aring;'} = 'A';
$ACENTO{'&AElig;'} = 'A';
$ACENTO{'&Ccedil;'} = 'C';
$ACENTO{'&Egrave;'} = 'E';
$ACENTO{'&Eacute;'} = 'E';
$ACENTO{'&Ecirc;'} = 'E';
$ACENTO{'&Euml;'} = 'E';
$ACENTO{'&Igrave;'} = 'I';
$ACENTO{'&Iacute;'} = 'I';
$ACENTO{'&Icirc;'} = 'I';
$ACENTO{'&Iuml;'} = 'I';
$ACENTO{'&Ograve;'} = 'O';
$ACENTO{'&Oacute;'} = 'O';
$ACENTO{'&Ocirc;'} = 'O';
$ACENTO{'&Otilde;'} = 'O';
$ACENTO{'&Ouml;'} = 'O';
$ACENTO{'&Oslash;'} = 'O';
$ACENTO{'&Ugrave;'} = 'U';
$ACENTO{'&Uacute;'} = 'U';
$ACENTO{'&Ucirc;'} = 'U';
$ACENTO{'&Uuml;'} = 'U';
$ACENTO{'&Yacute;'} = 'Y';
$ACENTO{'&agrave;'} = 'a';
$ACENTO{'&aacute;'} = 'a';
$ACENTO{'&acirc;'} = 'a';
$ACENTO{'&atilde;'} = 'a';
$ACENTO{'&auml;'} = 'a';
$ACENTO{'&aring;'} = 'a';
$ACENTO{'&aelig;'} = 'a';
$ACENTO{'&ccedil;'} = 'c';
$ACENTO{'&egrave;'} = 'e';
$ACENTO{'&eacute;'} = 'e';
$ACENTO{'&ecirc;'} = 'e';
$ACENTO{'&euml;'} = 'e';
$ACENTO{'&igrave;'} = 'i';
$ACENTO{'&iacute;'} = 'i';
$ACENTO{'&icirc;'} = 'i';
$ACENTO{'&iuml;'} = 'i';
$ACENTO{'&ograve;'} = 'o';
$ACENTO{'&oacute;'} = 'o';
$ACENTO{'&ocirc;'} = 'o';
$ACENTO{'&otilde;'} = 'o';
$ACENTO{'&ouml;'} = 'o';
$ACENTO{'&oslash;'} = 'o';
$ACENTO{'&ugrave;'} = 'u';
$ACENTO{'&uacute;'} = 'u';
$ACENTO{'&ucirc;'} = 'u';
$ACENTO{'&uuml;'} = 'u';
$ACENTO{'&yacute;'} = 'y';
$ACENTO{'&#xC0;'} = 'A';
$ACENTO{'&#xC1;'} = 'A';
$ACENTO{'&#xC2;'} = 'A';
$ACENTO{'&#xC3;'} = 'A';
$ACENTO{'&#xC4;'} = 'A';
$ACENTO{'&#xC5;'} = 'A';
$ACENTO{'&#xC6;'} = 'A';
$ACENTO{'&#xC7;'} = 'C';
$ACENTO{'&#xC8;'} = 'E';
$ACENTO{'&#xC9;'} = 'E';
$ACENTO{'&#xCA;'} = 'E';
$ACENTO{'&#xCB;'} = 'E';
$ACENTO{'&#xCC;'} = 'I';
$ACENTO{'&#xCD;'} = 'I';
$ACENTO{'&#xCE;'} = 'I';
$ACENTO{'&#xCF;'} = 'I';
$ACENTO{'&#xD2;'} = 'O';
$ACENTO{'&#xD3;'} = 'O';
$ACENTO{'&#xD4;'} = 'O';
$ACENTO{'&#xD5;'} = 'O';
$ACENTO{'&#xD6;'} = 'O';
$ACENTO{'&#xD8;'} = 'O';
$ACENTO{'&#xD9;'} = 'U';
$ACENTO{'&#xDA;'} = 'U';
$ACENTO{'&#xDB;'} = 'U';
$ACENTO{'&#xDC;'} = 'U';
$ACENTO{'&#xDD;'} = 'Y';
$ACENTO{'&#xE0;'} = 'a';
$ACENTO{'&#xE1;'} = 'a';
$ACENTO{'&#xE2;'} = 'a';
$ACENTO{'&#xE3;'} = 'a';
$ACENTO{'&#xE4;'} = 'a';
$ACENTO{'&#xE5;'} = 'a';
$ACENTO{'&#xE6;'} = 'a';
$ACENTO{'&#xE7;'} = 'c';
$ACENTO{'&#xE8;'} = 'e';
$ACENTO{'&#xE9;'} = 'e';
$ACENTO{'&#xEA;'} = 'e';
$ACENTO{'&#xEB;'} = 'e';
$ACENTO{'&#xEC;'} = 'i';
$ACENTO{'&#xED;'} = 'i';
$ACENTO{'&#xEE;'} = 'i';
$ACENTO{'&#xEF;'} = 'i';
$ACENTO{'&#xF2;'} = 'o';
$ACENTO{'&#xF3;'} = 'o';
$ACENTO{'&#xF4;'} = 'o';
$ACENTO{'&#xF5;'} = 'o';
$ACENTO{'&#xF6;'} = 'o';
$ACENTO{'&#xF8;'} = 'o';
$ACENTO{'&#xF9;'} = 'u';
$ACENTO{'&#xFA;'} = 'u';
$ACENTO{'&#xFB;'} = 'u';
$ACENTO{'&#xFC;'} = 'u';
$ACENTO{'&#xFD;'} = 'y';
$ACENTO{"\x{C0}"} = "A";
$ACENTO{"\x{C1}"} = "A";
$ACENTO{"\x{C2}"} = "A";
$ACENTO{"\x{C3}"} = "A";
$ACENTO{"\x{C4}"} = "A";
$ACENTO{"\x{C5}"} = "A";
$ACENTO{"\x{C6}"} = "A";
$ACENTO{"\x{C7}"} = "C";
$ACENTO{"\x{C8}"} = "E";
$ACENTO{"\x{C9}"} = "E";
$ACENTO{"\x{CA}"} = "E";
$ACENTO{"\x{CB}"} = "E";
$ACENTO{"\x{CC}"} = "I";
$ACENTO{"\x{CD}"} = "I";
$ACENTO{"\x{CE}"} = "I";
$ACENTO{"\x{CF}"} = "I";
$ACENTO{"\x{D0}"} = "D";
$ACENTO{"\x{D1}"} = "N";
$ACENTO{"\x{D2}"} = "O";
$ACENTO{"\x{D3}"} = "O";
$ACENTO{"\x{D4}"} = "O";
$ACENTO{"\x{D5}"} = "O";
$ACENTO{"\x{D6}"} = "O";
$ACENTO{"\x{D7}"} = "x";
$ACENTO{"\x{D8}"} = "O";
$ACENTO{"\x{D9}"} = "U";
$ACENTO{"\x{DA}"} = "U";
$ACENTO{"\x{DB}"} = "U";
$ACENTO{"\x{DC}"} = "U";
$ACENTO{"\x{DD}"} = "Y";
$ACENTO{"\x{DE}"} = "P";
$ACENTO{"\x{DF}"} = "b";
$ACENTO{"\x{E0}"} = "a";
$ACENTO{"\x{E1}"} = "a";
$ACENTO{"\x{E2}"} = "a";
$ACENTO{"\x{E3}"} = "a";
$ACENTO{"\x{E4}"} = "a";
$ACENTO{"\x{E5}"} = "a";
$ACENTO{"\x{E6}"} = "a";
$ACENTO{"\x{E7}"} = "c";
$ACENTO{"\x{E8}"} = "e";
$ACENTO{"\x{E9}"} = "e";
$ACENTO{"\x{EA}"} = "e";
$ACENTO{"\x{EB}"} = "e";
$ACENTO{"\x{EC}"} = "i";
$ACENTO{"\x{ED}"} = "i";
$ACENTO{"\x{EE}"} = "i";
$ACENTO{"\x{EF}"} = "i";
$ACENTO{"\x{F0}"} = "o";
$ACENTO{"\x{F1}"} = "n";
$ACENTO{"\x{F2}"} = "o";
$ACENTO{"\x{F3}"} = "o";
$ACENTO{"\x{F4}"} = "o";
$ACENTO{"\x{F5}"} = "o";
$ACENTO{"\x{F6}"} = "o";
$ACENTO{"\x{F7}"} = "/";
$ACENTO{"\x{F8}"} = "o";
$ACENTO{"\x{F9}"} = "u";
$ACENTO{"\x{FA}"} = "u";
$ACENTO{"\x{FB}"} = "u";
$ACENTO{"\x{FC}"} = "u";
$ACENTO{"\x{FD}"} = "y";
$ACENTO{"\x{FE}"} = "p";
$ACENTO{"\x{FF}"} = "y";
$ACENTO{"Ğ"} = "G";
$ACENTO{"ğ"} = "g";
$ACENTO{"ş"} = "ş";
$ACENTO{"Ş"} = "s";
 


our %_Unicode_to_HTML;
$_Unicode_to_HTML{'00a2'} = '&cent;';
$_Unicode_to_HTML{'00a3'} = '&pound;';
$_Unicode_to_HTML{'20ac'} = '&euro;';
$_Unicode_to_HTML{'00a5'} = '&yen;';
$_Unicode_to_HTML{'00b0'} = '&deg;';
$_Unicode_to_HTML{'00bc'} = '&frac14;';
$_Unicode_to_HTML{'0152'} = '&OElig;';
$_Unicode_to_HTML{'00bd'} = '&frac12;';
$_Unicode_to_HTML{'0153'} = '&oelig;';
$_Unicode_to_HTML{'00be'} = '&frac34;';
$_Unicode_to_HTML{'0178'} = '&Yuml;';
$_Unicode_to_HTML{'00a1'} = '&iexcl;';
$_Unicode_to_HTML{'00ab'} = '&laquo;';
$_Unicode_to_HTML{'00bb'} = '&raquo;';
$_Unicode_to_HTML{'00bf'} = '&iquest;';
$_Unicode_to_HTML{'00c0'} = '&Agrave;';
$_Unicode_to_HTML{'00c1'} = '&Aacute;';
$_Unicode_to_HTML{'00c2'} = '&Acirc;';
$_Unicode_to_HTML{'00c3'} = '&Atilde;';
$_Unicode_to_HTML{'00c4'} = '&Auml;';
$_Unicode_to_HTML{'00c5'} = '&Aring;';
$_Unicode_to_HTML{'00c6'} = '&AElig;';
$_Unicode_to_HTML{'00c7'} = '&Ccedil;';
$_Unicode_to_HTML{'00c8'} = '&Egrave;';
$_Unicode_to_HTML{'00c9'} = '&Eacute;';
$_Unicode_to_HTML{'00ca'} = '&Ecirc;';
$_Unicode_to_HTML{'00cb'} = '&Euml;';
$_Unicode_to_HTML{'00cc'} = '&Igrave;';
$_Unicode_to_HTML{'00cd'} = '&Iacute;';
$_Unicode_to_HTML{'00ce'} = '&Icirc;';
$_Unicode_to_HTML{'00cf'} = '&Iuml;';
$_Unicode_to_HTML{'00d0'} = '&ETH;';
$_Unicode_to_HTML{'00d1'} = '&Ntilde;';
$_Unicode_to_HTML{'00d2'} = '&Ograve;';
$_Unicode_to_HTML{'00d3'} = '&Oacute;';
$_Unicode_to_HTML{'00d4'} = '&Ocirc;';
$_Unicode_to_HTML{'00d5'} = '&Otilde;';
$_Unicode_to_HTML{'00d6'} = '&Ouml;';
$_Unicode_to_HTML{'00d8'} = '&Oslash;';
$_Unicode_to_HTML{'00d9'} = '&Ugrave;';
$_Unicode_to_HTML{'00da'} = '&Uacute;';
$_Unicode_to_HTML{'00db'} = '&Ucirc;';
$_Unicode_to_HTML{'00dc'} = '&Uuml;';
$_Unicode_to_HTML{'00dd'} = '&Yacute;';
$_Unicode_to_HTML{'00de'} = '&THORN;';
$_Unicode_to_HTML{'00df'} = '&szlig;';
$_Unicode_to_HTML{'00e0'} = '&agrave;';
$_Unicode_to_HTML{'00e1'} = '&aacute;';
$_Unicode_to_HTML{'00e2'} = '&acirc;';
$_Unicode_to_HTML{'00e3'} = '&atilde;';
$_Unicode_to_HTML{'00e4'} = '&auml;';
$_Unicode_to_HTML{'00e5'} = '&aring;';
$_Unicode_to_HTML{'00e6'} = '&aelig;';
$_Unicode_to_HTML{'00e7'} = '&ccedil;';
$_Unicode_to_HTML{'00e8'} = '&egrave;';
$_Unicode_to_HTML{'00e9'} = '&eacute;';
$_Unicode_to_HTML{'00ea'} = '&ecirc;';
$_Unicode_to_HTML{'00eb'} = '&euml;';
$_Unicode_to_HTML{'00ec'} = '&igrave;';
$_Unicode_to_HTML{'00ed'} = '&iacute;';
$_Unicode_to_HTML{'00ee'} = '&icirc;';
$_Unicode_to_HTML{'00ef'} = '&iuml;';
$_Unicode_to_HTML{'00f0'} = '&eth;';
$_Unicode_to_HTML{'00f1'} = '&ntilde;';
$_Unicode_to_HTML{'00f2'} = '&ograve;';
$_Unicode_to_HTML{'00f3'} = '&oacute;';
$_Unicode_to_HTML{'00f4'} = '&ocirc;';
$_Unicode_to_HTML{'00f5'} = '&otilde;';
$_Unicode_to_HTML{'00f6'} = '&ouml;';
$_Unicode_to_HTML{'00f8'} = '&oslash;';
$_Unicode_to_HTML{'00f9'} = '&ugrave;';
$_Unicode_to_HTML{'00fa'} = '&uacute;';
$_Unicode_to_HTML{'00fb'} = '&ucirc;';
$_Unicode_to_HTML{'00fc'} = '&uuml;';
$_Unicode_to_HTML{'00fd'} = '&yacute;';
$_Unicode_to_HTML{'00fe'} = '&thorn;';
$_Unicode_to_HTML{'00ff'} = '&yuml;';

###########################################################
#Funcion XML_Parse
#   Convierte un xml en un hash de perl 
#	Parametros: 
#			- el fichero que se quiere analizar
#           - el atributo que identifica univocamente cada registro, Si se omite se usa el primero.
#	Devuelve
#			- hash
	#El xml debe ser de la forma:
	#<JOBSS>
	#	<JOBS>
	#		<JOBIDENT><![CDATA[ 17444 ]]></JOBIDENT>
	#		.............................................
	#	</JOBS>
	#<JOBS>

	#Deveulve un HASH de la forma
	# $DATA{ID}{CAMPO}=.....

sub XML_Parse{
	#El xml debe ser de la forma:
	#<JOBSS>
	#	<JOBS>
	#		<JOBIDENT><![CDATA[ 17444 ]]></JOBIDENT>
	#		.............................................
	#	</JOBS>
	#<JOBS>

	#Deveulve un HASH de la forma
	# $DATA{ID}{CAMPO}=.....


	$FILE	= shift; #Es el fichero que se quiere analizar
	$_ID		= shift; #Es el atributo que identifica univocamente cada registro, Si se omite se usa el primero.
	
	my %RET;

	$xml = new XML::Simple;

	# read XML file
	@data = $xml->XMLin($FILE);

	#Extrae la clave
	my ($KEY) = grep {$value ~~ $hash{$_}} keys %{$data[0]};
 
 
	#print_r($data[0]->{$KEY}[0]);
	#print "\n+++++++++++++++++++++++++++++++++++\n";


	foreach $d (@{$data[0]->{$KEY}}) {
 		#print_r($d);
		foreach my $key (sort(keys %{$d})) {
				#Si no tiene tipo de dato es que es un dato si no es que está vacio
				if (ref($d->{$key}) eq '') {				
					#print "Por aqui\n";
					#print $key, '=', $d->{$key}, "\n";          
					$RET{$d->{$_ID}}{$key} = $d->{$key};        
				}else{
					$RET{$d->{$_ID}}{$key} = '';
				}




		}
	
		 
	}

	return %RET; 

}


###########################################################
#Funcion get_redes_sociales
#   Obtiene las redes sociales . Devuelve: facebook, twitter, linkedin, instagram, youtube, plus.google.
#	Parametros: web

sub get_redes_sociales{

	$web = shift ;

 ## PENDIENTE. Mejorar el redirecionamiento con nodejs , casper
 ###    Por  ejemplo http://www.uhu.es


	$command = 'curl -L --max-time 15 -L -s  "'.$web.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
	$sal = `$command`;
 
	if ($sal =~ /<meta http-equiv="refresh"[^>]+URL=([^"\s]+)"/) {
		$command = 'curl -L --max-time 15 -L -s  "'.$+.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
		$sal = `$command`;
	}



	if ($sal =~ /onload="javascript:location.replace\('([^']+)/) {
		$command = 'curl -L --max-time 15 -L -s  "'.$+.'" -H "Accept-Encoding: gzip, deflate, sdch" -H "Accept-Language: es-ES,es;q=0.8,en;q=0.6" -H "Upgrade-Insecure-Requests: 1" -H "User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" -H "Connection: keep-alive" --compressed --insecure';
		$sal = `$command`;
	}

 
 


	@REG = (
				'[\'"]((?:https*:)*//[^\'"]*facebook.com[^"\']+)' , 
				'[\'"]((?:https*:)*//[^\'"]*twitter.com/[^\'"]+)' ,
				'[\'"]((?:https*:)*//[^\'"]*linkedin.com/[^\'"]+)' ,
				'[\'"]((?:https*:)*//[^\'"]*instagram.com/[^\'"]+)' ,
				'[\'"]((?:https*:)*//[^\'"]*youtube.com/[^\'"]+)', 
				'[\'"]((?:https*:)*//[^\'"]*plus.google.com/[^\'"]+)' 
	);
	
	@DATA = ();
	for $p ( @REG){

		$found = '';
		($found) = ($sal =~ /$p/)  ;

		if ($found =~ /^\/\//) {
			$found = 'http:'  . $found;
			#print "Encontrado:" . $found . "\n";
		}
 
		$found =~ s/,/%2C/g;
		$found =~ s/;/%3B/g;
 

		push (@DATA, $found);

	}

	return @DATA;

}

###########################################################
#Funcion convert_to_form
#   Convierte caracteres no ascii al codigo que transforma el navegador.
#	Parametros: cadena

sub convert_to_form {
    my $text = shift;

	#$text =~ s/([^0-9a-zA-Z])/ sprintf("%0X",$1)/gie;
	
	$text2 ='';

	for($ii = 0; $ii < length($text); $ii++) {
		if(substr($text, $ii , 1) =~ /[0-9a-zA-Z\n\s]/){
			$text2 = $text2 . substr($text, $ii , 1);
		}else{
			$text2 = $text2 . "%".sprintf("%0X", ord(substr($text, $ii , 1)));
		}
	}

	$text2 =~ s/ /+/g;
	$text2 =~ s/\n/%0D%0A/g;

	return $text2;

}

sub p_{
	print ($_[0]);
}


###########################################################
#Funcion plog
#   Escribe un log
#	Parametros: texto. Debe estar definido $v_PARAMETROS{GENERAL}{'log_file'}
sub plog{
	my $text = shift;
	#Crea el fichero del log si se pasa como parametro

	if($v_PARAMETROS{GENERAL}{'log_file'} ne ''){

		if (-e $v_PARAMETROS{GENERAL}{'log_file'}){
 			open( FILE_LOG, '>>', $v_PARAMETROS{GENERAL}{'log_file'} )  or die "Could not open file " . $v_PARAMETROS{GENERAL}{'log_file'} . " $!";
		}
		else{
			open(FILE_LOG, '>', $v_PARAMETROS{GENERAL}{'log_file'} )  or die "Could not open file " . $v_PARAMETROS{GENERAL}{'log_file'} . " $!";
		}
		print FILE_LOG     HOY() . ' ' . AHORA() . " | " .  $text . "\n";
		close(FILE_LOG);
	}
}


1
