from bs4 import BeautifulSoup
import requests, re

r = requests.get('https://analytics.usa.gov').content
soup = BeautifulSoup(r, "lxml")

for link in soup.find_all('a', attrs={'href':re.compile("^https://github.com")}):
    print(link.get('href'))