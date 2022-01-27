<?php
#cmd from nmap to out.xml , from php to mysql 
#coded by t4t34m
#insert into hosts(ip,mac,vendor,hostname,ports,subs,whois,header,services,version,cmd,sslcert,timestamp)
$file = file('out.xml');
$servername = "localhost";
$username = "r00t";
$password = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
$db = "hacked";
$conn = new mysqli($servername, $username, $password, $db);
if ($conn->connect_error){
	die("Connection failed: ". $conn->connect_error);
}
$cmdnmap;
$ip;
$mac;
$vendor;
$hostname;
$port;
$subdomains;
$whoisdomain;
$httpsecheaders;
$ssldomain;
$sslcert;
$portArray = array();
$subArray = array();
$serviceVersionArray = array();
$serviceArray = array();
$hostnameArray = array();
$sslcertArray = array();
$portList;
$subtList;
$sslcertList;
$timestamp;
foreach($file as $line){
	if (strpos($line, 'addrtype="ipv4"') == TRUE){
	preg_match('/addr=".* addrtype/',$line,$results);
	$ip = implode(" ",$results);
	$ip = ltrim($ip, 'addr="');
	$ip = rtrim($ip, '" addrtype');
	print "<br><strong><u>Device</u></strong><br>";
	print "IP Address:  $ip<br>";
	}
	if (strpos($line, 'nmaprun scanner="') == TRUE){
	preg_match('/args=".*" start="/',$line,$results);
	$cmdnmap = implode(" ",$results);
	$cmdnmap1 = explode('"',$cmdnmap);
 	$cmdnmap = $cmdnmap1[1];
	print "CMD: $cmdnmap<br>";
	}
//ssl-cert
	if (strpos($line, 'id="ssl-cert" output=') == TRUE){
	preg_match('/id="ssl-cert" output=".*"><table/',$line,$results);
	$sslcert = implode(" ",$results);
	#$httpsecheaders = preg_replace("/subdomains:/", ' ', $httpsecheaders);
	$sslcert = ltrim($sslcert,'id="ssl-cert" output="');
	$sslcert = rtrim($sslcert, '><table');
	$sslcert = rtrim($sslcert, '"');
	#$httpsecheaders = preg_replace('/ /', ' ', $httpsecheaders);
	#$httpsecheaders = preg_replace('/\r?\n$/', ' ', $httpsecheaders);
	print "ssl cert:  $sslcert<br>";
	array_push($sslcertArray, $sslcert);
	}
	//Get Vendor
	if (strpos($line, 'osmatch name="') == TRUE){
	preg_match('/osmatch name=".*" accuracy/',$line,$results);
	$vendor = implode(" ",$results);
	$vendor = ltrim($vendor,'osmatch name="');
	$vendor = rtrim($vendor, '" accuracy');
	print "OS: $vendor<br>";
	}
	//Get MAC Address
	if (strpos($line, 'addrtype="mac"') == TRUE){
	preg_match('/addr=".*" addrtype/',$line,$results);
	$mac = implode(" ",$results);
	$mac = ltrim($mac,'addr="');
	$mac = rtrim($mac, '" addrtype');
	print "MAC Address: $mac<br>";
	}
	//Get Hostname <hostname name="mod.gov.sa" type="PTR"/>
	if (strpos($line, 'type="PTR"') == TRUE){
	preg_match('/name=".*" type="PTR"/',$line,$results);
	$hostname = implode(" ",$results);
	$hostnamez1 = explode('"',$hostname);
	$hostname = $hostnamez1[1];
	print "Hostname:  $hostname<br>";
	array_push($hostnameArray, $hostname);
}else{
	if(strpos($line, 'type="user"') == TRUE){
	preg_match('/name=".*" type="user"/',$line,$results);
	$hostname = implode(" ",$results);
	$hostnamez = explode('"',$hostname);
	$hostname = $hostnamez[1];
	print "Hostname2:  $hostname<br>";
	array_push($hostnameArray, $hostname);

	}
}
	//http-sec-headers
	if (strpos($line, 'id="http-sec-headers" output=') == TRUE){
	preg_match('/id="http-sec-headers" output=".*"><table/',$line,$results);
	$httpsecheaders = implode(" ",$results);
	#$httpsecheaders = preg_replace("/subdomains:/", ' ', $httpsecheaders);
	$httpsecheaders = ltrim($httpsecheaders,'id="http-sec-headers" output="');
	$httpsecheaders = rtrim($httpsecheaders, '><table');
	$httpsecheaders = rtrim($httpsecheaders, '"');
	#$httpsecheaders = preg_replace('/ /', ' ', $httpsecheaders);
	#$httpsecheaders = preg_replace('/\r?\n$/', ' ', $httpsecheaders);
	print "Header:  $httpsecheaders<br>";
	#array_push($headerArray, $httpsecheaders);
	}
	if (strpos($line, 'id="hostmap-crtsh" output=') == TRUE){
	preg_match('/id="hostmap-crtsh" output=".*"><table/',$line,$results);
	$subdomains = implode(" ",$results);
	$subdomains = preg_replace("/subdomains:/", ' ', $subdomains);
	$subdomains = ltrim($subdomains,'id="hostmap-crtsh" output="');
	$subdomains = rtrim($subdomains, '><table');
	$subdomains = preg_replace('/\r?\n$/', ' ', $subdomains);
	print "SubDomains:  $subdomains<br>";
	array_push($subArray, $subdomains);
	}
if (strpos($line, 'id="whois-domain" output=') == TRUE){
preg_match('/id="whois-domain" output=".*"\/></',$line,$results);
$whoisdomain = implode(" ",$results);
$whoisdomain = preg_replace("/\"\/>/", ' ', $whoisdomain);
$whoisdomain = ltrim($whoisdomain,'id="whois-domain" output="');
$whoisdomain = rtrim($whoisdomain, '"');
$whoisdomain = preg_replace('/\r?\n$/', ' ', $whoisdomain);
if(strpos($whoisdomain, 'provide a domain name') == TRUE){
	print "No doamin was found...<br>";
	$whoisdomain = $ip;
}
print "Whois2:  $whoisdomain<br>";

}
if (strpos($line, 'id="ssl-heartbleed" output=') == TRUE){
preg_match('/id="ssl-heartbleed" output=".*"></',$line,$results);
$ssldomain = implode(" ",$results);
$ssldomain = preg_replace("/></", ' ', $ssldomain);
$ssldomain = ltrim($ssldomain,'id="ssl-heartbleed" output="');
$ssldomain = rtrim($ssldomain, '"');
$ssldomain = preg_replace('/\r?\n$/', ' ', $ssldomain);
print "SSL:  $ssldomain<br>";
}
	//Get Ports
	if (strpos($line, 'portid="') == TRUE){
	preg_match('/portid=".*><state/',$line,$results);
	$port = implode(" ",$results);
	$port = ltrim($port,'portid="');
	$port = rtrim($port, '"><state');
	print "Port: $port<br>";
	array_push($portArray, $port);
	}

// service name="
	if (strpos($line, 'product="') == TRUE){
	preg_match('/product=".*/',$line,$results);
	$service = implode(" ",$results);
	$service = ltrim($service,'product=');
	$servicez = explode('"',$service);
	$service = $servicez[1];
	$serviceVersion = $servicez[3];


 	print "Services : $service  - + - Version: $serviceVersion<br>";
	#array_push($portArray, $port);
	array_push($serviceArray, $service);
	array_push($serviceVersionArray, $serviceVersion);
	}
	//Add Values to Database
	if (strpos($line, '/host>') == TRUE){
	$timestamp = time();
	$portList = implode(", ",$portArray);
	$subdomainList = implode(", ",$subArray);
	$serviceList = implode(", ",$serviceArray);
	$serviceVersionList = implode(", ",$serviceVersionArray);
	$hostnameList = implode(", ",$hostnameArray);
	$sslcertList = implode(" | ",$sslcertArray);
	if(!$hostnameList){$hostnameList="NULL";}else{$hostnameList=$hostnameList;}
	$sql = "insert into hosts(ip,mac,vendor,hostname,ports,subs,whois,header,services,version,cmd,sslcert,timestamp) values ('$ip','$mac','$vendor','$hostnameList','$portList','$subdomainList','$whoisdomain','$httpsecheaders','$serviceList','$serviceVersionList',
	'$cmdnmap','$sslcertList','$timestamp')";
	if ($conn->query($sql) === TRUE) {
		echo "Data Added: $ip  - $mac - $vendor - $hostnameList - $portList - $subdomainList - $whoisdomain - $httpsecheaders - $serviceList - $serviceVersionList - $cmdnmap - $sslcertList - $timestamp <br>";
	} else {
		echo "Error: ".$sql."<br>".$conn->error;
	}
	$cmdnmap = " ";
	$ip = " ";
	$mac = " ";
	$vendor = " ";
	$hostname = " ";
	$subdomains = " ";
	$ssldomain = " ";
	$whoisdomain = " ";
	$httpsecheaders = " ";
	unset($portArray);
	$portArray = array();
	$portList = " ";
	$subdomainList = " ";
	$serviceList = " ";
	$serviceVersionList = " ";
	$hostnameList = " ";
	$sslcertList = " ";
	}
}
$conn->close();
?>
