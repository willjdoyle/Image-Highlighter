# Image-Highlighter

Image Highlighter has the user input a .jpg, .png, .tiff, or .gif file, specify a certain color (and tolerance from that color), and then the program will output the target image with the target color pixels highlighted. Image Highlighter is currently in v1.1.

## Installation

Download the ImageHighlighter.m file and open it via MATLAB R2019B or later.

## How to Run

Start ImageHighlighter.m from the MATLAB script header and follow the prompts.

### Inputs

First it will ask for the file pathway to the .png/.jpg image. Below is an example input: 
```
Please enter the image pathway: C:\Users\user\Pictures\pic.jpg
```

Next, enter the hex color value that you would like to highlight without the "#". The input is not case-sensitive. Below is an example:
```
Please enter the hex value of the color you want to highlight: #eb4034
```

You will then be asked for the "absolute RGB tolerance". This is just the +/- offset from the target RGB value you entered, and the program will highlight pixels in this range. For example, if your hex value converted to RGB was (200, 170, 0) and your tolerance was 30, then it would highlight any pixel from (170, 140, 0) to (230, 200, 30). A tolerance of 0 means that only pixels exactly matching the hex value will be highlighted. An input example is shown below:
```
Enter the absolute RGB tolerance (default: +/- 32): 20
```

Finally, you need to enter either "t", "p", "b", or "w" for the highlighting color for non-.gif's. .gif's are currently only able to be highlighted in black. The highlight color will replace pixels in the tolerance with that color (pink, black, or white). The "target" color is the hex color that you entered originally.
Here is an example for a .jpg, .png, or .tiff input:
```
Please enter the highlighting color: target(t)/pink(p)/black(b)/white(w)/other hex #: p
```
For .gif's, the following output will display to console with no input necessary.
```
.gif highlighting can only be done in black.
```

### Outputs

For .jpg's, .png's, and .tiff's, the output will be a MATLAB figure with the appropriately highlighted image.
For .gif's, the output will be a slideshow of each frame in the MATLAB Movie Player.

## Issues

### Issue Templates
To submit a bug report or request a feature, please use the templates located in [template folder](.github/ISSUE_TEMPLATE).

### Known Issues
There is currently a known problem that can occur with .gif's where certain frames may be dropped because there is an error reading them. I am currently investigating this and it will be addressed in the v1.2.

## Versioning

Image Highlighter is currently on v1.1. A full changelog can be found in the Dev Roadmap in the Projects tab.

## Authors

Image Highlighter was developed in its entirity by William Doyle.

## License

This project is licensed under the GNU AGPL v3.0 License. Please see [LICENSE](LICENSE) for more details.