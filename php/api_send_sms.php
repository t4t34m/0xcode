<?php
extract($_GET);
$msg="TEsTedByJM511";
$mob="14176984815";
$url = 'http://sms.optimusits.com/sms_send.php';
$fields = array('razak'=>urlencode('nnt'),
'pass'=>urlencode('nntnlr123'),
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
?>
