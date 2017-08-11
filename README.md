# Windows Batch utils

app_tattler.bat - records if program is open or not by saving the time of last check to a file io the checking_directory. 
usage app_tattler.bat program.exe checking_directory

bg_task.vbs -  it uses vbs to run some command line headless. Only tested with .bat files.
usage bg_task.vbs program arg1 arg2 arg3

dir_count.bat - echos the count of items in a specified directory.

is_running - echos yes or no if the specified program.exe is currently running.


is_scheduled.bat - echos yes or no if the specified taskname is scheduled in the root of scheduled tasks

sleep_ping.bat - function to delay, accurate to seconds.

timestamp.bat - echos current time accurate to the minute.

var_line_parser.bat - given a file with one line in it of the form name1=value1 name2=value2 ENDECHO, set variables in the environment with name=value etc...