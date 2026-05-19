import os
from datetime import datetime
from robot.api.interfaces import ListenerV3
from robot import result, running
from robot.api.deco import not_keyword

ROBOT_LISTENER_API_VERSION = 3


class MyListener(ListenerV3):



    def __init__(self, log_file="mylistener.log"):
        self.my_log_file = os.path.abspath(log_file)
        self.my_log = None
        self._open_log()

    def _open_log(self):
        dirpath = os.path.dirname(self.my_log_file)
        if dirpath:
            os.makedirs(dirpath, exist_ok=True)

        self.my_log = open(self.my_log_file, "a", encoding="utf-8")
        self._write("Listener started")

    def _write(self, message: str):
        if not self.my_log:
            return
        self.my_log.write(f"{datetime.now().isoformat()} - {message}\n")
        self.my_log.flush()

    def start_suite(self, data: running.TestSuite, result: result.TestSuite):
        self._write(f"START SUITE: {data.name}")

    def start_keyword(self, data: result.Keyword, result: result.Keyword):
        self._write(f"START Keyword: {data.name}")

        

    def end_keyword(self, data: result.Keyword, result: result.Keyword):
        self._write(f"End Keyword: {data.name}")

        

    def end_test(self, data: running.TestCase, result: result.TestCase):
        self._write(f"Test '{result.name}' ended with status {result.status}.")

    def close(self):
        if self.my_log and not self.my_log.closed:
            self._write("Listener stopped")
            self.my_log.close()
        super().close()