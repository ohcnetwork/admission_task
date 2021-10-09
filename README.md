# admission_task | priority list

Build a CLI Priority List that maintains a list  of items to be done and in the order of their priorities. The app would use a file to store the persistent data.

## Specification

1.  The app can be run in the console with ./plist.  
      
    
2.  The app should read from and write to a list.txt text file. Each item occupies a single line in this file. Here is an example file that has 2 items.  
        
    x 5 first task

    o 2 yet another task

3. Each line represents the following
    o 2 yet another task

    i.  the letter x denotes the item has been completed the letter o denotes the task as incomplete
        
    ii.  2 denotes the priority of the item

    iii. “yet another task” denotes the details of the agenda
    
4.  Priority can be any integer greater than or equal to 1. 1 being the highest priority
   
5.  When a new item is created with the priority of an existing item, the priority of the existing item is incremented. 
   
6. There shall never be 2 incomplete tasks with the same priority 
   
The application must open the file list.txt from where the app is run, and not where the app is located. For example, if we invoke the app like this:  
  
```
$ cd /path/to/plans

$ /path/to/apps/plist ls
```
      
    The application should look for the text files in /path/to/plans, since that is the user’s current directory.  
      

## Usage

### 1. Help

Executing the command without any arguments, or with a single argument help prints the CLI usage.

$ ./plist help

Usage :-
```
$ ./plist 2 hello world # Add a new item with priority 2 and text "hello world" to the list

$ ./plist ls # Show incomplete priority list items sorted by priority in ascending order

$ ./plist del PRIORITY_NUMBER # Delete the incomplete item with the given PRIORITY_NUMBER

$ ./plist done PRIORITY_NUMBER # Mark the incomplete item with the given PRIORITY_NUMBER as complete

$ ./plist help # Show usage

$ ./plist report # Statistics
```
  

### 2. List all pending items

Use the ls command to see all the items that are not yet complete, in ascending order of priority. 

$ ./plist ls

[2] change light bulb

[5] water the plants

  

### 3. Add a new item

Use the add command. The text of the task should be enclosed within double quotes (otherwise only the first word is considered as the item text, and the remaining words are treated as different arguments).

$ ./plist add 5 "the thing i need to do"

Added task: "the thing i need to do" with priority 5

  

### 4. Delete an item

Use the del command to remove an item by its number.

$ ./plist del 3

Deleted item with priority 3

  

Attempting to delete a non-existent item should display an error message.

$ ./plist del 5

Error: item with priority 5 does not exist. Nothing deleted.

  

### 5. Mark a task as completed

Use the done command to mark an item as completed by its priority number.

$ ./plist done 1

Marked item as done.

  

Attempting to mark a non-existed item as completed will display an error message.

$ ./plist done 5

Error: no incomplete item with priority 5 exists.

  

### 6. Generate a report

Show the number of complete and incomplete items in the list. and the complete and incomplete items grouped together.

$ ./plist report

Pending : 2
1 this is a pending task
4 this is a pending task with priority 4

Completed : 3
completed task
another completed task
yet another completed task
