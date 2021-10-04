# admission_task

## Specification

1.  The app can be run in the console with ./agenda.  
      
    
2.  The app should read from and write to a agenda.txt text file. Each reminder occupies a single line in this file. Here is an example file that has 2 tasks.  
      
x 15:20 first task

13:20 12:30 another task

13:20 15:30 yet another task

  

When a task is completed, the time of completion would be added to the agenda.txt file for the respective entry

3.    
    

13:20 12:30 another task

1.  the time 13:20 denotes the time of completion of the task
    
2.  the time 12:30 denotes the deadline for the task
    
3.  “another task” denotes the details of the agenda
    

x 15:20 first task

4.  the letter x denotes that the task has not been completed
    
5.  the time 15:20 denotes the deadline for the task
    
6.  “first task” denotes the details of the agenda
    

4.  The time when the task is marked as completed is recorded in the hh:mm 24 hour format (ISO 8601). For example, the time 4:05 AM is represented as 04:05 and the time 5:25 PM is represented as 17:25.  
      
    

The application must open the file agenda.txt from where the app is run, and not where the app is located. For example, if we invoke the app like this:  
  
$ cd /path/to/plans

$ /path/to/apps/agenda ls

5.    
      
    The application should look for the text files in /path/to/plans, since that is the user’s current directory.  
      
    

## Usage

### 1. Help

Executing the command without any arguments, or with a single argument help prints the CLI usage.

$ ./agenda help

Usage :-

$ ./agenda add # Add a new task to the agenda; This invokes a multiline input to input the task and the time for the task

$ ./agenda ls # Show remaining tasks

$ ./agenda del NUMBER # Delete a task

$ ./agenda done NUMBER # Mark a task as completed now.

$ ./agenda help # Show usage

$ ./agenda report # Statistics

  

### 2. List all pending tasks

Use the ls command to see all the tasks that are not yet complete. The task with the closest deadline should be displayed first.

$ ./agenda ls

[2] change light bulb

[1] water the plants

  

### 3. Add a new task

Use the add command. The text of the task should be enclosed within double quotes (otherwise only the first word is considered as the task text, and the remaining words are treated as different arguments).

$ ./agenda add "the thing i need to do"

Added task: "the thing i need to do"

  

### 4. Delete a task

Use the del command to remove a task by its number.

$ ./agenda del 3

Deleted task #3

  

Attempting to delete a non-existent task should display an error message.

$ ./agenda del 5

Error: task #5 does not exist. Nothing deleted.

  

### 5. Mark a task as completed

Use the done command to mark a task as completed by its number.

$ ./agenda done 1

Marked task #1 as done.

  

Attempting to mark a non-existed task as completed will display an error message.

$ ./agenda done 5

Error: task #5 does not exist.

  

### 6. Generate a report

Use the report command to see the latest tally of pending and completed tasks.

$ ./agenda report

yyyy-mm-dd Pending : 1 Completed : 4
