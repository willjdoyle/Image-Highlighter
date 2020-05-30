# Image-Highlighter

Image Highlighter has the user input a .jpg or .png file, specify a certain color (and tolerance from that color), and then the progarm will output the target image with the specified color highlighted with one of four preset options. This is currently version one. Entirely designed by myself using some MATLAB libraries.

## Installation

Download the .m file and open it via MATLAB R2019B or later.

## How to Run

### Inputs

Start Image Highlighter from the MATLAB script header and follow the prompts. First it will ask for the file pathway to the .png/.jpg image. This will be in the format: C:\Users\user\Pictures\pic.jpg. Next, enter the hex color value that you would like to highlight without the "#". You will then be asked for the "absolute RGB tolerance". This is just the +/- offset from the target RGB value you entered that the program will still highlight. For example, if your hex value converted to (200, 170, 0) and your tolerance was 30, then it would highlight any pixel from (170, 140, 0) to (230, 200, 30). Finally, you need to enter either "t", "p", "b", or "w" for the highlighting color. This will replace pixels in the tolerance with that color (pink, black, or white). The "target" color is the hex color that you entered originally.

### Outputs

This will then output a MATLAB figure with the appropriately highlighted image. It does not modify the source image.