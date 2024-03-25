# viewDataUrl.ps1

A helper script that allows you to call `canvas.toDataURL()` from the browser console, copy the result to your clipboard, and then invoke this script to automatically save the image locally and then open it with your default image viewer.

By default this script will save the image in the invoking directory, if you'd like it to save them somewhere else (ex. a temp folder) then update the `$path` variable inside the script.

### Instructions

With an image data URL in your clipboard, simply invoke the script with `./viewDataUrl.ps1`.