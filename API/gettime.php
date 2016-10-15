<?php
    include_once('config.php');
    session_start();
    
    if ((!isset($_SESSION['UserID']))||(!isset($_SESSION['UserType'])){
        print('{"result":"forbidden"}');
        die();
    } 

    if ($_SERVER['REQUEST_METHOD']=="GET"){
        if (($_GET['UserID']!==$_SESSION['UserID'])&&($_SESSION['UserType']!=="admin")){
            print('{"result":"forbidden"}');
            die();
        }

        if ((!isset($_GET['UserID'])||empty($_GET['UserID']))
            die();
    
        try {
            $dbh = new PDO("mysql:host={$db_config['host']};dbname={$db_config['dbName']}", $db_config['user'], $db_config['pwd'], [PDO::ATTR_PERSISTENT => true, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"]);
        } catch (PDOExveption $e) {
            print('{"result":"Database Fatal"}');
            die();
        }
    
    
        try{
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            if ((isset($GET['MediaID']) && !empty($GET['MediaID'])){
                $stmt = $dbh->prepare("SELECT studytime.time,media.title FROM studytime,media WHERE studytime.MediaID = media.MediaID and media.MediaID = :MediaID and studytime.UserID = :UserID");
                $stmt -> execute(array($_GET['MediaID'],$_GET['UserID']));
                $row = $stmt->fetch(PDO::FETCH_NAMED);
                $result = array(
                    "result"=>"succeeded",
                    "media"=>$row
                );
                print(json_encode($result));
            }
            if ((isset($GET['ClassType']) && !empty($GET['ClassType'])){
                $stmt = $dbh->prepare("SELECT studytime.time,media.title FROM studytime,media WHERE studytime.MediaID = media.MediaID and media.type = :ClassType and studytime.UserID = :UserID");
                $stmt -> execute(array($_GET['MediaID'],$_GET['UserID']));
                $row = $stmt->fetch(PDO::FETCH_NAMED);
                $result = array(
                    "result"=>"succeeded",
                    "media"=>$row
                );
                print(json_encode($result));
            }
    
        } catch (PDOExveption $e){
            print($e->getMessage());
            print('{"result":"forbidden"}')
        }
    } else {
        try {
            $dbh = new PDO("mysql:host={$db_config['host']};dbname={$db_config['dbName']}", $db_config['user'], $db_config['pwd'], [PDO::ATTR_PERSISTENT => true, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"]);
        } catch (PDOExveption $e) {
            print('{"result":"Database Fatal"}');
            die();
        }

        try {
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $dbh->prepare("UPDATE studytime SET time = :time WHERE UserID = :UserID and MediaID = :MediaID");
            $stmt -> execute(array($_POST['time'],$_POST['MediaID'],$_POST['UserID']));
        } catch (PDOExveption $e){
            print($e->getMessage());
            print('{"result":"forbidden"}')
        }

    }
    

?>