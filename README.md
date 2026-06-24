# Maze of Succubus translation project.
Manually translated line by line, albeit with the assistance of various MTL tools to speed things up and to fill the gaps of JP knowledge.
If you encounter issues, feel free to let me know.

### Original work by OCTET SOFT. The official game is required to apply this patch.

## Progress
All the content I found is translated, and some other things I didn't find.
There are a ton of skills, but very few are accessible to the player.
Therefore, not all skill names and descriptions are translated, as I believe you would never see them.

## Installation Instructions
You can find the latest release version from the releases page (usually on the right side).  
Download the MazeOfSuccubusEn.zip from there, extract to the game's directory (where the big Game.exe is) and run ApplyPatch.bat.
You should then find the translated game in Maze of Succubus English under the same directory as the folder of the unpatched game.

## Troubleshooting
In case of issues, consider the following advice.
If ApplyPatch.bat did not work correctly, you can also patch the game manually like this:
1. Run evbunpack.exe on Game.exe. You must do this through command line and specify output directory.
2. Run RPGMakerDecrypter-cli.exe on Game.rgss3a in the folder evbunpack extracted to.
3. Copy Game_EN.exe, Data, Graphics, Score, Save and debug.rb to that same folder.

Also, make sure there are no unusual characters in the filepath, like Japanese characters, or you might get some encoding related error when launching the game.
