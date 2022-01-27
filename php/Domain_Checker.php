<?php
#coded by t4t34m

function getip($domain) {
$records = dns_get_record($domain);$res = array();foreach ($records as $r){if ($r['host'] != $domain) continue;if (!isset($r['type'])) continue;
if ($r['type'] == 'A') $res[] = $r['ip']; 
}return $res;}
function getips($domain){$res = getip($domain);if (count($res) == 0){$res = getip($domain);}return $res;}

##
/* IP6 
function getip6($domain) {
$records = dns_get_record($domain);$res = array();foreach ($records as $r){if ($r['host'] != $domain) continue;if (!isset($r['type'])) continue;
if ($r['type'] == 'AAAA') $res[] = $r['ipv6']; 
}return $res;}
function getips6($domain){$res = getip6($domain);if (count($res) == 1){$res = getip6($domain);}else{$res = 'NO IP6 FOUND';}return $res;}
 */

 ##
function serverx($domain) {
$records = dns_get_record($domain);$res = array();foreach ($records as $r){if ($r['host'] != $domain) continue;if (!isset($r['type'])) continue;
if ($r['type'] == 'SOA') $res[] = $r['rname'];
if ($r['type'] == 'SOA') $res[] = $r['mname'];

}return $res;}
function servers($domain){$res = serverx($domain);if (count($res) == 0){$res = serverx($domain);}else{$res = serverx($domain);}return $res;}

 ##
function server_mx($domain) {
$records = dns_get_record($domain);$res = array();foreach ($records as $r){if ($r['host'] != $domain) continue;if (!isset($r['type'])) continue;
if ($r['type'] == 'MX') $res[] = $r['target'];
}return $res;}
function server_mxs($domain){$res = server_mx($domain);if (count($res) == 0){$res = server_mx($domain);}else{$res = server_mx($domain);}return $res;}


 ##
function server_ns($domain) {
$records = dns_get_record($domain);$res = array();foreach ($records as $r){if ($r['host'] != $domain) continue;if (!isset($r['type'])) continue;
if ($r['type'] == 'NS') $res[] = $r['target'];
}return $res;}
function server_nss($domain){$res = server_ns($domain);if (count($res) == 0){$res = server_ns($domain);}else{$res = server_ns($domain);}return $res;}
 ##
if(isset($_POST['id']))
{
$real_url = $_POST['id'];
if(preg_match('/www/',$real_url)){
	$wwwx = explode(".", $real_url);
	$www = 'http://www.'.$wwwx[1].'.'.$wwwx[2];
}else{
	$www = $real_url;
}
$x2 = parse_url($real_url);
$x = $x2[host];
if(preg_match('/www/',$x)){
	$wwwx = explode(".", $x);
	$www = $wwwx[1].'.'.$wwwx[2];
}else{
	$www = $x;
}
$urls = get_headers($real_url, 0);
$data['status'] = $urls;
$data['ip'] = getips($www);
$data['server'] = servers($www);
$data['server_mx'] = server_mxs($www);
$data['server_ns'] = server_nss($www);
echo json_encode($data);
}
?>
