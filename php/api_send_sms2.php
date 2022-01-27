<?php
if(isset($_GET['userid']))
{
$userid=$_GET['userid'];
$pass=$_GET['pass'];
$mob=$_GET['phone'];
$msg=$_GET['msg'];
extract($_GET);
$url = 'http://www.razak.krishsms.com/postsms.aspx';
$fields = array('userid'=>urlencode($userid),
'pass'=>urlencode($pass),
'phone'=>urlencode($mob),
'msg'=>urlencode($msg));
foreach($fields as $key=>$value)
{
$fields_string .= $key.'='.$value.'&';
}
rtrim($fields_string,'&');
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_POST,count($fields));
curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
$result = curl_exec($ch);
curl_close($ch);
}
else
{
	echo "Not Post";
}
?>
