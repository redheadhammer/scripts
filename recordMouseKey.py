
import time
import json
import os
from pynput import mouse, keyboard
import platform
from datetime import date

print("Hold right click for 2 seconds then release to end the recording for mouse")
print("Click 'ESC' to end the recording for keyboard")
print("Both are needed to finish recording")

recording = [] 
count = 0
DIR_NAME = "Salesforce_Recordings"

def on_press(key):
    try:
        json_object = {
            'action':'pressed_key', 
            'key':key.char, 
            '_time': time.time()
        }
    except AttributeError:
        # if key == keyboard.Key.esc:
        if key == keyboard.Key.alt_r:
            print("Keyboard recording ended.")
            writeToFile(recording)
            return False

        json_object = {
            'action':'pressed_key', 
            'key':str(key), 
            '_time': time.time()
        }
        
    recording.append(json_object)


def on_release(key):
    try:
        json_object = {
            'action':'released_key', 
            'key':key.char, 
            '_time': time.time()
        }
    except AttributeError:
        json_object = {
            'action':'released_key', 
            'key':str(key), 
            '_time': time.time()
        }

    recording.append(json_object)
        

def on_move(x, y):
    if len(recording) >= 1:
        if (recording[-1]['action'] == "pressed" and \
            recording[-1]['button'] == 'Button.left') or \
            (recording[-1]['action'] == "moved" and \
            time.time() - recording[-1]['_time'] > 0.02):
            json_object = {
                'action':'moved', 
                'x':x, 
                'y':y, 
                '_time':time.time()
            }

            recording.append(json_object)


def on_click(x, y, button, pressed):
    json_object = {
        'action':'clicked' if pressed else 'unclicked', 
        'button':str(button), 
        'x':x, 
        'y':y, 
        '_time':time.time()
    }

    recording.append(json_object)

    if len(recording) > 1:
        if recording[-1]['action'] == 'unclicked' and \
           recording[-1]['button'] == 'Button.right' and \
           recording[-1]['_time'] - recording[-2]['_time'] > 2:
            with open('recording.json', 'w') as f:
                json.dump(recording, f)
            print("Mouse recording ended.")
            return False


def on_scroll(x, y, dx, dy):
    json_object = {
        'action': 'scroll', 
        'vertical_direction': int(dy), 
        'horizontal_direction': int(dx), 
        'x':x, 
        'y':y, 
        '_time': time.time()
    }

    recording.append(json_object)


def createDir():
    if platform.system() == "Windows":
        desktop_path = os.path.join(os.environ['USERPROFILE'], 'Desktop')
        full_path = f'{os.path.join(desktop_path, DIR_NAME)}\\'
    elif platform.system() == "Linux":
        desktop_path = f"{os.path.expanduser('~')}"
        full_path = f'{os.path.join(desktop_path, DIR_NAME)}/'
    else:
        print("Operating system not currently supported.")
        exit(1)

    try:
        os.makedirs(full_path)
    except FileExistsError:
        pass

    return full_path


def writeToFile(data):
    file = input("Enter file Name\n").replace(" ", "_")
    todayDate = str(date.today()).replace("-", "_")
    prefix = createDir()
    fileName = f"{prefix}{file}_{todayDate}.json"

    with open(fileName, "w") as f:
        json.dump({'data': data}, f)

    print('File saved at: ', fileName)
    exit(0)


def start_recording():
    keyboard_listener = keyboard.Listener(
        on_press=on_press,
        # on_release=on_release
        )

    mouse_listener = mouse.Listener(
            on_click=on_click,
            on_scroll=on_scroll,
            on_move=on_move)

    keyboard_listener.start()
    mouse_listener.start()
    keyboard_listener.join()
    mouse_listener.join()


if __name__ == "__main__":
    start_recording()
    
