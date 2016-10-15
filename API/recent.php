<?php
    include_once('config.php');
    session_start();
    
    if (!isset($_SESSION['UserID'])){
        print('{"result":"forbidden"}');
        die();
    } 
    

    try {
            $dbh = new PDO("mysql:host={$db_config['host']};dbname={$db_config['dbName']}", $db_config['user'], $db_config['pwd'], array(PDO::ATTR_PERSISTENT => true, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
    } catch (PDOExveption $e) {
            print('{"result":"Database Fatal"}');
            die();
    }
    
    
    try{
        if ($_SERVER['REQUEST_METHOD']=="GET"){
            if ((!isset($_GET['UserID'])||empty($_GET['UserID']))){
                print('{"result":"forbidden"}');
                die();  
            }
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $dbh->prepare("SELECT LastWordID,LastExcelID,LastPowerpointID,LastPhotoshopID,LastID FROM user WHERE UserID = ? ");
            $stmt -> execute(array($_SESSION['UserID']));
            $row = $stmt->fetch(PDO::FETCH_NAMED);
            print(json_encode($row));

        } else {
            
            if ((!isset($_POST['UserID'])||empty($_POST['UserID']))){
                print('{"result":"forbidden"}');
                die();  
            }

            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            if ($_POST['ClassType']=="word") {
                $stmt = $dbh->prepare("UPDATE user SET LastWordID = ? WHERE UserID = ? ");
                $stmt -> execute(array($_POST['MediaID'],$_POST['UserID']));
            } elseif ($_POST['ClassType']=="excel") {
                $stmt = $dbh->prepare("UPDATE user SET LastExcelID = ? WHERE UserID = ? ");
                $stmt -> execute(array($_POST['MediaID'],$_POST['UserID']));
            } elseif ($_POST['ClassType']=="powerpoint") {
                $stmt = $dbh->prepare("UPDATE user SET LastPowerpointID = ? WHERE UserID = ? ");
                $stmt -> execute(array($_POST['MediaID'],$_POST['UserID']));
            } else {
                $stmt = $dbh->prepare("UPDATE user SET LastPowerpointID = ? WHERE UserID = ? ");
                $stmt -> execute(array($_POST['MediaID'],$_POST['UserID']));
            }

            $stmt = $dbh->prepare("UPDATE user SET LastID = ? WHERE UserID = ? ");
            $stmt -> execute(array($_POST['MediaID'],$_POST['UserID']));
            print('{"result":"succeeded"}');
        }
    } catch (PDOExveption $e) {
            print('{"result":"Database Fatal"}');
            die();
    }
?>