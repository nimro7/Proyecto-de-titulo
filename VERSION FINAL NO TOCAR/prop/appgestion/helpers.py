from django.utils.text import slugify
# Python3 code to demonstrate
# generating random strings 
# using random.choices()
import string
import random
# initializing size of string 
# using random.choices()
# generating random strings 
def generate_random_string(N):
    res = ''.join(random.choices(string.ascii_uppercase +
                             string.digits, k = N))
    return res
  

def generate_slug(text):
    new_slug = slugify(text)
    from .models import Projecto5
    if Projecto5.objects.filter(slug=new_slug).first():
        generate_slug(text + generate_random_string(5))
    return new_slug