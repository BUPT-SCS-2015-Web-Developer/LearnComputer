<?php
    include_once('config.php');
    session_start();

    if (!isset($_SESSION['UserID'])){
        
        die();
    } 

    if ($_SERVER['REQUEST_METHOD']=="GET"){
        if ((!isset($_GET['UserID'])||empty($_GET['UserID']))) {
            print('2');
            die();
        }
    
        if ($_GET['UserID']!==$_SESSION['UserID']){
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
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            if ((isset($_GET['MediaID'])) && (!empty($_GET['MediaID']))){
                $stmt = $dbh->prepare("SELECT media.filename,media.title,studytime.time,media.MediaID  FROM media left join studytime on studytime.MediaID=media.MediaID and studytime.UserID= ? WHere media.MediaID = ? ");
                $stmt -> execute(array($_GET['UserID'],$_GET['MediaID']));
                if ($row = $stmt->fetch(PDO::FETCH_NAMED)) {
                    $result = array(
                        "result"=>"succeeded",
                        "media"=>$row
                    );
                    print(json_encode($result));
                } else {
                    print('{"result":"forbidden"}');
                }
            }

            if ((isset($_GET['ClassType'])) && (!empty($_GET['ClassType']))){

                $stmt = $dbh->prepare("SELECT media.filename,media.title,studytime.time,media.MediaID  FROM media left join studytime on studytime.MediaID=media.MediaID and studytime.UserID= ? WHere media.type = ? ");
                $stmt -> execute(array($_GET['UserID'],$_GET['ClassType']));
                if ($row = $stmt->fetchall(PDO::FETCH_NAMED)) {
                    $result = array(
                        "result"=>"succeeded",
                        "media"=>$row
                    );
                    print(json_encode($result));
                } else {
                    print('{"result":"forbidden"}');
                }
            }
    
        } catch (PDOExveption $e){
            //print($e->getMessage());
            print('{"result":"forbidden"}');
        }
    } else {
        try {
            $dbh = new PDO("mysql:host={$db_config['host']};dbname={$db_config['dbName']}", $db_config['user'], $db_config['pwd'], array(PDO::ATTR_PERSISTENT => true, PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        } catch (PDOExveption $e) {
            print('{"result":"Database Fatal"}');
            die();
        }

        try {
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $dbh->prepare("SELECT time FROM studytime WHERE UserID = ? and MediaID = ? ");
            $stmt -> execute(array($_POST['UserID'],$_POST['MediaID']));

            if ($row = $stmt->fetch(PDO::FETCH_NAMED)){
                $stmt = $dbh->prepare("UPDATE studytime SET time = ? WHERE UserID = ? and MediaID = ? ");
                $stmt -> execute(array($_POST['time'],$_POST['UserID'],$_POST['MediaID']));
                    print('{"result":"succeeded"}');
            } else {
                $stmt = $dbh->prepare("INSERT INTO studytime (time,UserID,MediaID) VALUES ( ? , ? , ? )");
                $stmt -> execute(array($_POST['time'],$_POST['UserID'],$_POST['MediaID'])); 
                print('{"result":"succeeded"}');
            }
        } catch (PDOExveption $e){
            print($e->getMessage());
            print('{"result":"forbidden"}');
        }

    }
    

?>