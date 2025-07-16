import string
import random
def generate(length=8):
    pool = string.ascii_letters + string.digits
    return ''.join(random.choices(pool, k=length))

