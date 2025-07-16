def read(filename):
    with open(filename, 'r') as f:
        return f.read()

def write(filename, data):
    with open(filename, 'w') as f:
        f.write(data)

def append(filename, data):
    with open(filename, 'a') as f:
        f.write(data)
