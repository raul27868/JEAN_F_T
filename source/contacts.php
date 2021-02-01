<table id="table_contacts" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>nickname</th>
                                            <th>gender</th>
                                            <th>postal_address</th>
                                            <th>followers</th>
                                        </tr>
                                    </thead>
                                    <tbody>


<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include "./config.php";



/* Obtiene las busqueda guardadas del usuario */
/**********************************************/
$comando  = "curl 'https://www.wyylde.com/rest/my/contacts?online=0' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: es-ES,es;q=0.8,en;q=0.6' -H 'Authorization: Bearer ". $_POST["token"]."' -H 'Accept: application/json, text/plain, */*'  -H 'User-Agent: ".$UserAgent."' -H 'Connection: keep-alive' -H 'If-Modified-Since: Mon, 26 Jul 1997 05:00:00 GMT' -H 'X-version: 1510139124622' -H 'Referer: https://www.wyylde.com/dashboard/wall' --compressed";
	 

$ret = json_decode( shell_exec($comando));

#var_dump( $ret->data->users) ;

if( $ret->status == 'success' ){
    
    foreach ($ret->data->users as &$data) {

        #print var_dump($data->card);

        echo '<tr class="userrow" id="' . $data->card->id . '">';
            echo '<td>' .$data->card->nickname  .'</td>';
            echo '<td>' .$data->card->p1_gender  .'</td>';
            echo '<td>' .$data->card->postal_address  .'</td>';
            echo '<td>' .$data->card->nb_followers  .'</td>';
        echo '</tr>';
    }
    
}


 
 
?>

</table>