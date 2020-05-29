# csci-241-ch07-1
DOS_file_time 

Suppose the time field of a file directory entry uses bits 0-4 for 2-second increments, bits 5-10 for minutes, and bits 11-15 for hours (24-hour clock). Write a procedure named ShowFileTime that receives a binary file time value in the AX register and displays the time in hh:mm:ss format. For example of input 1207h, the binary 0001 0,010 000,0 0111 indicates a time of 02:16:14, in hh:mm:ss format:
00010 010000 00111
For simplicity, we want to input 4-digit hexadecimal and show its binary to verify. For this, you can call ReadHex and WriteBinB. Then you can call your ShowFileTime to display the file time. You may call WriteDec, WriteChar, and consider prefixed zeros. Run your program; the screen will be like this:
C:\Teaching\CSCI241\KipIrvine\Prog_Ex_SM\ch07\Debug>project
Please enter 16-bit hexadecimal (4-digit, e.g., 1207): A103
Your equivalent binary is 1010 0001 0000 0011
Your DOS file time is 20:08:06

C:\Teaching\CSCI241\KipIrvine\Prog_Ex_SM\ch07\Debug>project
Please enter 16-bit hexadecimal (4-digit, e.g., 1207): 1207
Your equivalent binary is 0001 0010 0000 0111
Your DOS file time is 02:16:14
Two requirements:
DRY: Any reusable helper procedure is possible, such as displaying a leading zero if the value of hours, minutes, or seconds less than 10
Use shifting or rotation instructions only to get time pieces, without AND and MUL. Try less instructions, probably only 5 or less shift or rotate
Consider start which part first, hour or second?
Advanced discussion (not required): A possible issue is display of invalid hours, minutes, and seconds. For a real world app, you do need to check hours 0 to 23, minutes 0 to 59, and seconds 0 to 59 from the the user input. Since purpose of this is to practice shift and rotate instructions, you can simply ignore the error checking without caring about these.
