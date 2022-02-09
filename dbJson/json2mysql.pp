<?php
ini_set('memory_limit', '-1');
$conn = new PDO("mysql:host=localhost;dbname=hacked", 'root', 'password');
#$json = file_get_contents("data.json");
$json = 'data.json';
$tableName = 'DB4';
$jsonData = json_decode(file_get_contents($json), true);

foreach ($jsonData as $id=>$row) {
    $inseRt = array();
    foreach ($row as $key=>$val) {
        $inseRt[addslashes($key)] = addslashes($val);
    }
    $insertKeys = '`' . implode('`,`', array_keys($inseRt)) . '`';
    $insertVals = '"' . implode('","', array_values($inseRt)) . '"';

    echo "INSERT INTO `{$tableName}` ({$insertKeys}) VALUES ({$insertVals});" . "\n"; 
} 
?>


