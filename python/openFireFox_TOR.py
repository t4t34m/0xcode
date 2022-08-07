from selenium import webdriver
options = webdriver.FirefoxOptions()
options.add_argument('--proxy-server=socks5://localhost:9150')
driver = webdriver.Firefox(executable_path=r'/usr/bin/geckodriver', firefox_options=options)
driver.get('https://check.torproject.org/')
