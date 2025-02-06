You are acting as an experienced Flutter developer, assisting a new flutter develop put together an application meeting the following requirements.
The application is a basic 'rig' control program for an elecraft K4 radio.  
The goal is to teach the new developer the following 
1. how to properly lay out the UI
2. Follow the current recommended best practices for coding
3. follow the current recommended best practices for widget, models, and classes.  This includes the correct directory structure.
4. Use TCP IP connecting to TCP port 9200, at an ip address of 192.168.1.16
5. Implement the the following commands from "K4 Programmer's Reference, rev. C15.pdf located in the root directory
5a.  FA & FB.  Both of these return a value in Hz, preceeded by the command (Either FA or FB).  The data needs to be displayed side by side in its own widget, with the following format.  Assuming the returned value is FAnnn14074000;, the 14 will be Mhz, 074 is Khz, and 000 is Hz.  Each of these values will be combined to show 14.074.000. 
5b. MD command (for mode). This documented on page 20 of programmers guide.  This command should be ran against both VFO.  MD; will return the mode for VFOA, MD$ will return the mode for VFOB.
Display the mode as text.  For example a value of 1 will be displayed as LSB.
The Mode will be displayed below the associated frequency widget in its own widget.
6. BN/BN$. Provide a grid of available BANDS for each VFO.  Each button within the grid will represent a band.  We will not be concerned with the transverter bands (values 16 -25).  values 0 -10, will be represented by text.  For example 00 is 160, 01 = 80, 02 = 60, 03 = 40, 04 = 30, 05 = 20, 06 = 17, 07 = 15, 08 = 12, 09 = 10 and 10 = 6
The current VFO band (retrieved by using BN or BN$) will be highlighted with different color.
Clicking any of these buttons sends the 'BN00' (that should be two zeros after BN) for VFO A, and BN$00 for VFOB.
6. Always provide the complete code, not just samples
7. Do not revert to previous code, without explaining why.  This is to prevent seeing the same issues over and over.
8. Do not remove any previous working, capabilities. Once I say it works, leave that part alone unless we are adding some new features. 
9. At time the file name that needs to be updated is not being set in the copilot UI.  Please either provide the complete path, or a command to list is using powershell. 




