from robot.api.deco import keyword,library
from robot.libraries.BuiltIn import BuiltIn

@library(
    scope="GLOBAL",
    version="1.0"
)
class Main:
    """
    Example Robot Framework library.

    This library contains custom keywords
    that can be used inside Robot Framework tests.
    """
    
    @keyword("My Log",tags=("console", "custom", "logging"),types={"message":str})
    def my_log(self, message: str):
        """
        Logs a custom message to the Robot Framework console.

        Example:
        | My Log | Hello World |

        Args:
            message (str): Message to be displayed in the console.

        Returns:
            None
        """
        BuiltIn().log_to_console(f"My Log: {message}")