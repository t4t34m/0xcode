<?php
if (!function_exists('get_headers')) {
        function get_headers($Url, $Format= 0, $Depth= 0) {
                if ($Depth > 5) return;
                $Parts = parse_url($Url);
                if (!array_key_exists('path', $Parts))   $Parts['path'] = '/';
                if (!array_key_exists('port', $Parts))   $Parts['port'] = 80;
                if (!array_key_exists('scheme', $Parts)) $Parts['scheme'] = 'http';
                $Return = array();
                $fp = fsockopen($Parts['host'], $Parts['port'], $errno, $errstr, 30);
                if ($fp) {
                        $Out = 'GET '.$Parts['path'].(isset($Parts['query']) ? '?'.@$Parts['query'] : '')." HTTP/1.1\r\n".
                            'Host: '.$Parts['host'].($Parts['port'] != 80 ? ':'.$Parts['port'] : '')."\r\n".
                            'Connection: Close'."\r\n";
                        fwrite($fp, $Out."\r\n");
                        $Redirect = false; $RedirectUrl = '';
                        while (!feof($fp) && $InLine = fgets($fp, 1280)) {
                                if ($InLine == "\r\n") break;
                                $InLine = rtrim($InLine);
                                list($Key, $Value) = explode(': ', $InLine, 2);
                                if ($Key == $InLine) {
                                        if ($Format == 1)
                                                $Return[$Depth] = $InLine;
                                        else    $Return[] = $InLine;

                                        if (strpos($InLine, 'Moved') > 0) $Redirect = true;
                                } else {
                                        if ($Key == 'Location') $RedirectUrl = $Value;
                                        if ($Format == 1)
                                                $Return[$Key] = $Value;
                                        else    $Return[] = $Key.': '.$Value;
                                }
                        }
                        fclose($fp);
                        if ($Redirect && !empty($RedirectUrl)) {
                                $NewParts = parse_url($RedirectUrl);
                                if (!array_key_exists('host', $NewParts))   $RedirectUrl = $Parts['host'].$RedirectUrl;
                                if (!array_key_exists('scheme', $NewParts)) $RedirectUrl = $Parts['scheme'].'://'.$RedirectUrl;
                                $RedirectHeaders = get_headers($RedirectUrl, $Format, $Depth+1);
                                if ($RedirectHeaders) $Return = array_merge_recursive($Return, $RedirectHeaders);
                        }
                        return $Return;
                }
                return false;
        }}
echo json_encode(get_headers("https://www.target.com"));
?>
