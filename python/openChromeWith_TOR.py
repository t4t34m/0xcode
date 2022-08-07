import undetected_chromedriver as uc
import time
uc.TARGET_VERSION = 78    
executable_path='chromedriver',
opts = uc.ChromeOptions()
opts.add_argument(f'--proxy-server=socks5://127.0.0.1:9050')
driver = uc.Chrome(options=opts)
driver.get('https://xxxxxxxxxxxx.com')
time.sleep(39393939)
