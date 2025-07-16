import datetime
def current_datetime():
    now = datetime.now()
    return now.strftime("%Y-%m-%d %H:%M:%S")