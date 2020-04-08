import requests, re
from bs4 import BeautifulSoup

data = requests.get("https://www.nike.com/t/air-max-alpha-savage-mens-training-shoe-n5K77G/AT3378-011").content
soup = BeautifulSoup(data, "html.parser")
span = soup.find("h1",{"class":"headline-2 css-33lwh4"})
title = span.text
span = soup.find("div", {"class":"css-b9fpep"})
price = span.text
print("%s -- %s" % (title, price))