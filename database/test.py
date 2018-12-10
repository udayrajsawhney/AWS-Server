from selenium import webdriver
from selenium.webdriver.common.keys import Keys

chromedriver = 'C:\ChromeDriver\chromedriver.exe'
driver = webdriver.Chrome(chromedriver)
driver.get('http://ec2-52-91-163-175.compute-1.amazonaws.com:3000/register/')
username = driver.find_element_by_name("username")
emailid = driver.find_element_by_name("email")
password = driver.find_element_by_name("password")

username.send_keys("YourUsername")
emailid.send_keys("abcd@gmail.com")
password.send_keys("Pa55worD")

driver.find_element_by_name("register").click()