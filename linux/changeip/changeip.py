from selenium import webdriver
from selenium.webdriver.common.by import By
import os
import time
###################
os.system('bash /opt/backbox/lab4box/change_ip/myip.sh 2>/dev/null')
###################
time.sleep(2)
browser = webdriver.Firefox(executable_path=r'geckodriver')
browser.get("http://192.168.100.1")
username = browser.find_element(By.ID,"txt_Username")
password = browser.find_element(By.ID,"txt_Password")
username.send_keys("XXXXXXXXXXXXXXXXXXX")
password.send_keys("XXXXXXXXXXXXXXXXX")
browser.find_element(By.NAME, "Submit").click()
browser.get("http://192.168.100.1/html/bbsp/wan/wan.asp")
browser.find_element(By.ID,"wanInstTable_0_1").click()
browser.find_element(By.ID,"UserName").click()
int_user = browser.find_element(By.ID,"UserName")
int_user.clear()
int_user.send_keys("1122332225645727@stc.net.sa")
browser.find_element(By.ID,"ButtonApply").click()
time.sleep(9)
browser.find_element(By.ID,"wanInstTable_0_1").click()
browser.find_element(By.ID,"UserName").click()
int_user = browser.find_element(By.ID,"UserName")
int_user.clear()
int_user.send_keys("ORIGNAL HERE@stc.net.sa")
browser.find_element(By.ID,"ButtonApply").click()
time.sleep(7)
browser.quit()
###################
os.system('bash /opt/backbox/lab4box/change_ip/myip.sh 2>/dev/null')
###################
exit
