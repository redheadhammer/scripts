# this is a script to get date of a course published on 
# udemy with the help of api provided by udemy.

from bs4 import BeautifulSoup as bs
import requests

url = input("Enter the url for the course: ")

def createD(value: str):
    print(value)
    dec = {}
    tmpList = value.split(',')
    for item in tmpList:
        key, value = item.split(":", maxsplit=1)
        dec[key] = value
    return dec

response = requests.get(url, timeout=5.0)
soup = bs(response.text, 'html5lib')
match = soup.body['data-clp-course-id']
rec = requests.get(f'https://www.udemy.com/api-2.0/courses/{match}/')
dtt = requests.get(f'https://www.udemy.com/api-2.0/courses/{match}/?fields[course]=created,title')


result = createD(dtt.text)

print(result)
