%Image Highlighting Program V1.1
%William Doyle
%This program highlights similar-colored pixels to the ones entered by the
%user. Future configuration options to be used. Confirm to work with .jpg
%and .png, should work for other formats but have not yet tested it.
%This program is licensed under GNU AGPL v3.0

%image input
imgPath = input('Please enter the image pathway: ', 's');

%handshake to determine image type because MATLAB does not allow indexing
%into temporary array
temp = imfinfo(imgPath); 
fileType = temp(1).Format();

imgGifArray = []; %empty array for remaking .gif's

%converting to index image and getting width, height, and frames (for .gif's)
if(fileType == 'GIF')
    [img, cmap] = imread(imgPath, 'frames', 'all');
    temp = size(img);
    numFrames = temp(4); %.gif frames
else
    [img, cmap] = imread(imgPath);
    numFrames = 1; %default value (1 frame for non-.gif's)
end
width = size(img, 2);
height = size(img, 1);

hexInput = input('Please enter the hex value of the color you want to highlight: #', 's'); %user-input hex

%converting user-input hex to rgb
userR = hex2dec(hexInput(1:2));
userG = hex2dec(hexInput(3:4));
userB = hex2dec(hexInput(5:6));

tol = input('Enter the absolute RGB tolerance (default: +/- 32): '); %variation in r, g, b values from hexInput

%highlight color input is split because .gif's can only handle 
%black easily without decreasing efficieny from O(mno) to O(mnop)
if(fileType == 'GIF')
    fprintf('.gif highlighting can only be done in black.\n');
    defaultGifAddress = length(cmap); %pointing to black in cmap (always first index)
else
    defaultColor = input('Please enter the highlighting color: target(t)/pink(p)/black(b)/white(w)/other hex #: ', 's');
    
        switch(defaultColor)
        case 't'
            defaultR = userR;
            defaultG = userG;
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
            defaultR = hex2dec(defaultColor(1:2));
            defaultG = hex2dec(defaultColor(3:4));
            defaultB = hex2dec(defaultColor(5:6));
        end
end

%main loop to amplify colors and increment pixel change count
for currentFrame  = 1:1:numFrames
    count = 0; %count of changed pixels
    
    if(fileType == 'GIF')
        currentImg = img(:,:,1,currentFrame); %current frame of .gif, if there is a .gif
    end
    
    for i = 1:1:height
        for j = 1:1:width
            %process .gif's here frame-by-frame
            if(fileType == 'GIF')
                if(255*cmap(1+currentImg(i,j),1) >= userR - tol && 255*cmap(1+currentImg(i,j),1) <= userR + tol) && ... %fits red tolerance
               (255*cmap(1+currentImg(i,j),2) >= userG - tol && 255*cmap(1+currentImg(i,j),2) <= userG + tol) && ... %fits green tolerance
               (255*cmap(1+currentImg(i,j),3) >= userB - tol && 255*cmap(1+currentImg(i,j),3) <= userB + tol) %fits blue tolerance

                currentImg(i, j) = defaultGifAddress;

                count = count + 1; %incrementing # changed pixels
                end
            %all other non-.gif's are processed here
            else
                if((img(i, j, 1) >= userR - tol && img(i, j, 1) <= userR + tol) && ... %fits red tolerance
                   (img(i, j, 2) >= userG - tol && img(i, j, 2) <= userG + tol) && ... %fits green tolerance
                   (img(i, j, 3) >= userB - tol && img(i, j, 3) <= userB + tol)) %fits blue tolerance

                    img(i, j, 1) = defaultR;
                    img(i, j, 2) = defaultG;
                    img(i, j, 3) = defaultB;

                    count = count + 1; %incrementing # changed pixels
                end
            end
        end
    end
    
    if(fileType == 'GIF')
        imgGifArray = cat(4, imgGifArray, currentImg); %array of .gif frames appended to each other on dimension 4
    end

    fprintf("For frame %d, %d pixels were highlighted, or %.2f%% of the total.\n", currentFrame, count, count/(width*height)*100);
    
    
end

%printing modified image/gif
if(fileType == 'GIF')
    implay(immovie(imgGifArray, cmap)) %uses matlab movie player
else
    imshow(img, cmap)
end