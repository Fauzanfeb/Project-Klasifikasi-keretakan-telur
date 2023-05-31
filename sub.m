% I = imread('8RGB.jpg');
% %%  Convert to grayscale image
% Igray = rgb2gray(I);

%  %% Problem: illumination doesn't allow for easy segmentation
% level = 0.69;
% Ithresh = imbinarize(Igray, level);
% Iedge = imgradient(Ithresh);

% fh = figure;
% ah1 = axes('Parent',fh,'Units','normalized','Position',[0.1 0.1 0.15 0.8]);
% imshow(I,'Parent',ah1);
% ah2 = axes('Parent',fh,'Units','normalized','Position',[0.3 0.1 0.15 0.8]);
% imshow(Igray,'Parent',ah2);
% ah3 = axes('Parent',fh,'Units','normalized','Position',[0.5 0.1 0.15 0.8]);
% imshow(Ithresh,'Parent',ah3);
% ah4 = axes('Parent',fh,'Units','normalized','Position',[0.7 0.1 0.15 0.8]);
% imshow(Iedge,'Parent',ah4);

clc;
clear;
close all;
%membaca atau mengambil citra
x=imread('7rgb.jpg');
%Mengubah Citra RGB menjadi greyscale
x2=rgb2gray(x);
%menentukan nilai tresholding
thresh=150;
%melakukan tresholding pada citra greyscale
y=thresholding(x2,thresh);
%melakukan deteksi tepi dengan operator Sobel
f1=[-1 -2 1;0 0 0;1 2 -1];
z = imfilter(y,f1);
% Graythresh
level = graythresh (x);
level = 0.3451;
bw = im2bw (x,level);


%menampilkan
figure,
subplot(1,5,1), imshow(x), title('gambar asli');
subplot(1,5,2), imshow(x2), title('gambar asli');
subplot(1,5,3), imshow(bw), title('Graythresh');
subplot(1,5,4), imshow(y), title('citra thresholding');
subplot(1,5,5), imshow(z), title(' citra deteksi tepi');

    