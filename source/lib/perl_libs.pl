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




1