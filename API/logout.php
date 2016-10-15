<?php
	include_once('config.php');
    session_start();
    unset($_SESSION['UserID']);
    unset($_SESSION['UserType']);
	session_destroy();
    print('{"result":"succeeded"');

?>