from selenium import webdriver
from time import sleep
driver = webdriver.Chrome()
fake_lat = "48.8567"
fake_long = "2.3508"
driver.get('http://xxxx.com')
sleep(10)

javascript = '''
var latlng = new google.maps.LatLng(%s, %s);
var myOptions = {
    zoom: 15,
    center: latlng,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
var marker = new google.maps.Marker({
    position: latlng, 
    map: map, 
    title:"You are here!"
  });
''' % (fake_lat, fake_long)
driver.execute_script(javascript)
