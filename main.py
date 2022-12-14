# import time module, Observer, FileSystemEventHandler
import sys
import time
import os
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

output_dir = "/mnt/output"

class OnMyWatch:
    # Set the directory on watch
    watchDirectory = "/mnt/source"

    def __init__(self):
        self.observer = Observer()

    def run(self):
        event_handler = Handler()
        self.observer.schedule(event_handler, self.watchDirectory, recursive=True)
        self.observer.start()
        try:
            while True:
                time.sleep(5)
        except:
            self.observer.stop()
            print("Observer Stopped")

        self.observer.join()


class Handler(FileSystemEventHandler):

    @staticmethod
    def on_any_event(event):
        if event.is_directory:
            return None

        elif event.event_type == 'created':

            file_path = event.src_path

            if file_path.endswith(".c"):

                print(file_path)
                filename = os.path.basename(file_path)
                os.system("gcc " + event.src_path + " -o " + output_dir+"/"+filename+".run")
                print("Watchdog received created event - % s" % filename)


if __name__ == '__main__':
    watch = OnMyWatch()
    watch.run()
