<?php
session_start();
require_once 'connect.php';
require_once 'protect.php';
session_destroy();
$_SESSION['uid'] = 1;
if (isset($_POST['submit'])) {
    $shout = protect($_POST['shout']);
    if (strlen($shout) > 255) {
        echo 'Your shout should be < 255 caracters long';
    } else
    if ($shout !== '') {
        if (isset($_POST['name'])) {
            $name = protect($_POST['name']);
            $q = mysql_query("SELECT `username` FROM `users` WHERE `username` = '$name'");
            if (mysql_num_rows($q) > 0) {
                echo 'That username is already taken.';
            } else
            if (strlen($name) > 32) {
                echo 'Name cannot be more than 32 chracters long.';
            } else {
                mysql_query("INSERT INTO `shouts` SET `user_id`=0,`date_posted`= NOW(), `message` = '$shout',`name`= '$name'") or die(mysql_error());
            }
        } else {
            mysql_query("INSERT INTO `shouts` SET `user_id` = {$_SESSION['uid']}, `date_posted`= NOW(), `message`= '$shout'") or die(mysql_error());
        }
    }
}
?>
<html>
    <title>Shout Box</title>
    <head>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#shoutbox').load('shouts.php');
                setInterval(function() {
                    $('#shoutbox').load('shouts.php');
                }, 1000);
            });
        </script>
    </head>
    <body>
        <div id="shoutbox">

        </div>
        <p>Give a shout yourself!</p>
        <form method = "POST" name = "formname" action = "">
            <input type = "text" name = "shout">
            <?php if (!isset($_SESSION['uid'])) { ?>
                <input type = "text" name = "name">
            <?php } ?>
            <input name = "submit" type = "submit" value = "Shout!">
        </form>

    </body>
</html>