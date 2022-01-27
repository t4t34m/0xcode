<?php
#coded by t4t34m
$servername = "localhost";
$username = "r00t";
$password = "FkPaSsSsSsSsSsSsSs";
$db = "t4t34m";
$conn = new mysqli($servername, $username, $password, $db);
if ($conn->connect_error){die("Connection failed: ". $conn->connect_error);}
$url = "https://www.target.com";
$ch = curl_init();
$timeout = 5;
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
$html = curl_exec($ch);
curl_close($ch);
$dom = new DOMDocument();
@$dom->loadHTML($html);
foreach($dom->getElementsByTagName('a') as $link) {
        $links .= $link->getAttribute('href')."<br />";
}
$sql = "insert into hosts(hostname,subs) values ('$url','$links')";
if ($conn->query($sql) === TRUE) {
        echo "Done";
} else {
        echo "Error: ".$sql."<br>".$conn->error;
}
?>
