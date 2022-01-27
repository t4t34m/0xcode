<?php
#coded by t4t34m
ini_set('memory_limit', '-1');
error_reporting(1);
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
$conn = new PDO("mysql:host=localhost;dbname=t4t34m_hacked", 'r00t', 'Passwordddddddddddd');
$json = file_get_contents("/var/www/html/f/db111003.json");
$jsonFile = '/var/www/html/f/db111003.json';
$tableName = 'dbJSON';
$jsonData = json_decode(file_get_contents($jsonFile), true);
foreach ($jsonData as $id=>$row) {
    $insertPairs = array();
    foreach ($row as $key=>$val) {
        $insertPairs[addslashes($key)] = addslashes($val);
    }
    $insertKeys = '`' . implode('`,`', array_keys($insertPairs)) . '`';
    $insertVals = '"' . implode('","', array_values($insertPairs)) . '"';
    #echo "INSERT INTO `{$tableName}` ({$insertKeys}) VALUES ({$insertVals});" . "\n";
    $servername = "localhost";
    $username = "r00t";
    $password = "Passwordddddddddddd";
    $dbname = "t4t34m_hacked";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = "INSERT INTO `{$tableName}` ({$insertKeys}) VALUES ({$insertVals});";
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
}
?>
