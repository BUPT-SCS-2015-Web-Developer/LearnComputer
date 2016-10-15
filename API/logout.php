<?php
	include_once('config.php');
    session_start();
    unset($_SESSION['UserID']);
	session_destroy();
    print('{"result":"succeeded"');
?>