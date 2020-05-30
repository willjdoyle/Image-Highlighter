%Image Highlighting Program V1.0
%William Doyle
%This program highlights similar-colored pixels to the ones entered by the
%user. Future configuration options to be used. Confirm to work with .jpg
%and .png, should work for other formats but have not yet tested it.

%image input
imgPath = input('Please enter the .jpg or .png image pathway: ', 's');
[img, cmap] = imread(imgPath);
width = size(img, 2);
height = size(img, 1);

hexInput = input('Please enter the hex value of the color you want to highlight: #', 's'); %user-input hex
tol = input('Enter the absolute RGB tolerance (default: +/- 32): '); %variation in r, g, b values from hexInput

defaultColor = input('Please enter the highlighting color: target(t)/pink(p)/black(b)/white(w): ', 's');

%converting hex to rgb
userR = hex2dec(hexInput(1:2));
userG = hex2dec(hexInput(3:4));
userB = hex2dec(hexInput(5:6));

%highlighting color switch
switch(defaultColor)
    case 't'
        defaultR = userR;
        defaultG = userG; %add counter to count how many pixels were changed, as # and percent
        defaultB = userB;
    case 'p'
        defaultR = 255;
        defaultG = 0;
        defaultB = 127;
    case 'b'
        defaultR = 0;
        defaultG = 0;
        defaultB = 0;
    case 'w'
        defaultR = 255;
        defaultG = 255;
        defaultB = 255;
    otherwise
        fprintf('Default color not correctly chosen. Defaulting to target.');
        defaultR = userR;
        defaultG = userG;
        defaultB = userB;
end

%main loop to amplify colors and increment color counts
for i = 1:1:height
    for j = 1:1:width
        if((img(i, j, 1) >= userR - tol && img(i, j, 1) <= userR + tol) && ... %fits red tolerance
           (img(i, j, 2) >= userG - tol && img(i, j, 2) <= userG + tol) && ... %fits green tolerance
           (img(i, j, 3) >= userB - tol && img(i, j, 3) <= userB + tol)) %fits blue tolerance
        
            img(i, j, 1) = defaultR;
            img(i, j, 2) = defaultG;
            img(i, j, 3) = defaultB;
        end
     end
end

imshow(img, cmap)