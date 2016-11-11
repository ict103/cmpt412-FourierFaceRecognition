%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CMPT 412 Fourier Face Recognition
% Ivy Tse
% Apr 8, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%retrieve the dataset of faces
faceDB = imageSet('att_faces', 'recursive');

%To select an image for the 30th person's 4th image, 
%type "test = read(faceDB(30), 4);" without the quoation marks
test = read(faceDB(40), 9); 

figure, imshow(test);

%compile the faces of those 40 people in the DB
p1 = read(faceDB(1), 1); p2 = read(faceDB(2), 1);
p3 = read(faceDB(3), 1); p4 = read(faceDB(4), 1);
p5 = read(faceDB(5), 1); p6 = read(faceDB(6), 1);
p7 = read(faceDB(7), 1); p8 = read(faceDB(8), 1);
p9 = read(faceDB(9), 1); p10 = read(faceDB(10), 1);

p11 = read(faceDB(11), 1); p12 = read(faceDB(12), 1);
p13 = read(faceDB(13), 1); p14 = read(faceDB(14), 1);
p15 = read(faceDB(15), 1); p16 = read(faceDB(16), 1);
p17 = read(faceDB(17), 1); p18 = read(faceDB(18), 1);
p19 = read(faceDB(19), 1); p20 = read(faceDB(20), 1);

p21 = read(faceDB(21), 1); p22 = read(faceDB(22), 1);
p23 = read(faceDB(23), 1); p24 = read(faceDB(24), 1);
p25 = read(faceDB(25), 1); p26 = read(faceDB(26), 1);
p27 = read(faceDB(27), 1); p28 = read(faceDB(28), 1);
p29 = read(faceDB(29), 1); p30 = read(faceDB(30), 1);

p31 = read(faceDB(31), 1); p32 = read(faceDB(32), 1);
p33 = read(faceDB(33), 1); p34 = read(faceDB(34), 1);
p35 = read(faceDB(35), 1); p36 = read(faceDB(36), 1);
p37 = read(faceDB(37), 1); p38 = read(faceDB(38), 1);
p39 = read(faceDB(39), 1); p40 = read(faceDB(40), 1);

%create a collage of all 40 subjects using the first image
%from each folder
collage = [p1, p2, p3, p4, p5, p6, p7, p8;
           p9, p10, p11, p12, p13, p14, p15, p16;
           p17, p18, p19, p20, p21, p22, p23, p24;
           p25, p26, p27, p28, p29, p30, p31, p32;
           p33, p34, p35, p36, p37, p38, p39, p40];
       
[testH, testW] = size(test);

f2test = abs(fft2(test)); %compute the Fourieur transform for the test image
ftest = abs(fft(f2test)); %select the top right quadrant from above

%Find Fourier transform for all 400 images in the DB and store them in an
%array called fouriers.
for i = 1:40
    for j = 1:10
        im = read(faceDB(i), j);
        imF2 = abs(fft2(im));
        imF = abs(fft(imF2));
        fouriers{i, j} = imF;
    end 
end

%Calculate the Euclidean Distance of the test subject's image with all
%400 images in the DB and store them in an array called arrayD
for i = 1:40
    for j = 1:10
        arrayD(i, j) = norm(fouriers{i, j} - ftest);
    end
end

%Calculate the average Euclidean distance of the test subject image
%with the 40 subjects in the DB and store the results in an array called
%AverageD
AverageD = mean(arrayD, 2);

%Find the smallest Euclidean distance and its index from the 40 subjects
[best bestIndex] = min(AverageD); 

%Compute the location of the subject with the smallest Euclidean distance
%from the collage
num = bestIndex-1;
row = floor(num/8);
column = mod(num, 8);

%Display the result in a green bounding box
match = insertShape(collage, 'rectangle', [testW*column testH*row testW testH],...
    'LineWidth', 5, 'Color', 'green');
figure, imshow(match);

