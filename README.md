# Basic K4 Rig Control
## Over TCP IP
### Using Flutter and AI tools

The intent of this project is to both learn Flutter to use effective AI prompts to develop an application to do basic Elecraft Rig Control via TCPIP.

This screen shot was taken from a Windows 10 desktop.  However, it 'may' compile for MacOs, Android, and even Apple IOS.  However I haven't tried compiling against those platforms. 

![Initial screen](screen_shots/basicControl.png?raw=true "Initial Screen Shot")

The basic instructions for github copilot is contained in .github/copilot-instructions.md.

Claude 3.5 Sonnect (Preview) was used to generate the basic code.  

But I've also used ChatGPT 4o with good results.

This is as is, no guarantees are provided.  .

Build commands (WIP)

Build commands (WIP)

dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs


# Make sure all changes are committed
git add .
git commit -m "Add power control feature"

# Push feature branch to remote
git push -u origin feature/power-control

# Switch to master branch
git checkout master

# Merge feature branch into master
git merge feature/power-control

# Push master with merged changes
git push origin master
