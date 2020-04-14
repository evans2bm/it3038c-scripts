import json
import requests


r = requests.get('http://api.openweathermap.org/data/2.5/weather?zip=45335,us&appid=2cfa958f262d30f866068df496f612b1' )
data = r.json()
print(data['weather'][0]['description'])

