<?php
    include_once('config.php');
    session_start();
    unset($_SESSION['UserID']);
    if (!isset($_POST['displayname'])||empty($_POST['displayname'])){
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
        $stmt = $dbh->prepare("SELECT UserID FROM user WHERE displayname = ?");
        $stmt ->execute(array($_POST['displayname']));
        if ($row = $stmt->fetch(PDO::FETCH_NAMED)) {
                $result = array(
                    "result" => "succeeded",
                    "displayname" => $_POST['displayname'],
                    "UserID" => $row['UserID']
                );
                $_SESSION['UserID']=$row['UserID'];
                print(json_encode($result));

        } else {
            print('{"result":"failed"}');
        }
    
    }catch (Exception $e){
        //$dbh->rollBack();
        //print('{"result":"failed"}');
        print($e->getMessage());
    }

?>