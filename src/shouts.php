<?php

require_once 'connect.php';

$q = mysql_query("SELECT `users`.`username`, `shouts`.`user_id`, `shouts`.`message`, `shouts`.`name`  
    FROM `users` 
    INNER JOIN `shouts` ON
    `users`.`id` = `shouts`.`user_id`
    ORDER BY `shouts`.`id`
    DESC LIMIT 20") or die(mysql_error());


$shouts = array();

while ($r = mysql_fetch_assoc($q)) {
    $shouts[] = array(
        'user_id' => $r['user_id'],
        'user_name' => $r['username'],
        'message' => $r['message'],
        'name' => $r['name']
    );
}

foreach ($shouts as $a) {
 $user = ( $a['user_id'] > 0 ) ? $a['user_name'] : $a['name'];
 echo '<h4>'.$user.'</h4>'.$a['message'].'<br>'.  rand(0, 9).'';
}
?>
