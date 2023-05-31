clc; clear; close all;
 
%%% Matang
% membaca file citra
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);
% inisialisasi variabel ciri_matang
ciri_matang = zeros(jumlah_file,10);
target_matang = zeros(jumlah_file,1);
 
for n = 1:jumlah_file
    % membaca citra RGB
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    % konversi citra RGB menjadi grayscale
    Img_gray = rgb2gray(Img);
    % konversi citra grayscale menjadi biner
    bw = imbinarize(Img_gray);
    % operasi morfologi
    bw = imcomplement(bw);
    bw = imfill(bw,'holes');
    bw = bwareaopen(bw,100);
    % ekstraksi ciri warna RGB
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % ekstraksi ciri warna HSV
    HSV = rgb2hsv(Img);
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    H(~bw) = 0;
    S(~bw) = 0;
    V(~bw) = 0;
    Hue = sum(sum(H))/sum(sum(bw));
    Saturation = sum(sum(S))/sum(sum(bw));
    Value = sum(sum(V))/sum(sum(bw));
    % ekstraksi ciri tekstur GLCM
    Img_gray(~bw) = 0;
    GLCM = graycomatrix(Img_gray,'Offset',[0 1; -1 1; -1 0; -1 -1]);
    stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
    Contrast = mean(stats.Contrast);
    Correlation = mean(stats.Correlation);
    Energy = mean(stats.Energy);
    Homogeneity = mean(stats.Homogeneity);
    % mengisi hasil ekstraksi ciri pada variabel ciri_matang
    ciri_matang(n,1) = Red;
    ciri_matang(n,2) = Green;
    ciri_matang(n,3) = Blue;
    ciri_matang(n,4) = Hue;
    ciri_matang(n,5) = Saturation;
    ciri_matang(n,6) = Value;
    ciri_matang(n,7) = Contrast;
    ciri_matang(n,8) = Correlation;
    ciri_matang(n,9) = Energy;
    ciri_matang(n,10) = Homogeneity;
    % mengisi nilai target pada variabel target_matang
    target_matang(n,1) = 1;
end
 
%%% Mentah
% membaca file citra
nama_folder = 'Data Uji/Mentah';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);
% inisialisasi variabel ciri_mentah
ciri_mentah = zeros(jumlah_file,10);
target_mentah = zeros(jumlah_file,1);
 
for n = 1:jumlah_file
    % membaca citra RGB
    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    % konversi citra RGB menjadi grayscale
    Img_gray = rgb2gray(Img);
    % konversi citra grayscale menjadi biner
    bw = imbinarize(Img_gray);
    % operasi morfologi
    bw = imcomplement(bw);
    bw = imfill(bw,'holes');
    bw = bwareaopen(bw,100);
    % ekstraksi ciri warna RGB
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    % ekstraksi ciri warna HSV
    HSV = rgb2hsv(Img);
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
    H(~bw) = 0;
    S(~bw) = 0;
    V(~bw) = 0;
    Hue = sum(sum(H))/sum(sum(bw));
    Saturation = sum(sum(S))/sum(sum(bw));
    Value = sum(sum(V))/sum(sum(bw));
    % ekstraksi ciri tekstur GLCM
    Img_gray(~bw) = 0;
    GLCM = graycomatrix(Img_gray,'Offset',[0 1; -1 1; -1 0; -1 -1]);
    stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
    Contrast = mean(stats.Contrast);
    Correlation = mean(stats.Correlation);
    Energy = mean(stats.Energy);
    Homogeneity = mean(stats.Homogeneity);
    % mengisi hasil ekstraksi ciri pada variabel ciri_mentah
    ciri_mentah(n,1) = Red;
    ciri_mentah(n,2) = Green;
    ciri_mentah(n,3) = Blue;
    ciri_mentah(n,4) = Hue;
    ciri_mentah(n,5) = Saturation;
    ciri_mentah(n,6) = Value;
    ciri_mentah(n,7) = Contrast;
    ciri_mentah(n,8) = Correlation;
    ciri_mentah(n,9) = Energy;
    ciri_mentah(n,10) = Homogeneity;
    % mengisi nilai target pada variabel target_mentah
    target_mentah(n,1) = 2;
end
 
% menyusun target_uji
target_uji = [target_matang;target_mentah];
 
% memanggil variabel attorder (urutan ciri dengan nilai gain tertinggi)
load('attorder.mat')
 
% seleksi ciri berdasarkan 5 nilai gain tertinggi
ciri_matang_seleksi = zeros(numel(target_matang),5);
ciri_mentah_seleksi = zeros(numel(target_mentah),5);
for k = 1:5
    ciri_matang_seleksi(:,k) = ciri_matang(:,attorder(k));
    ciri_mentah_seleksi(:,k) = ciri_mentah(:,attorder(k));
end
 
% memanggil nilai bobot jaringan hasil pelatihan
load('wtnet1.mat');
load('wtnet2.mat');
 
% menghitung jarak masing2 kelas dengan titik pusat masing2 model SOM
pfn1 = dist(wtnet1,[ciri_matang_seleksi;ciri_mentah_seleksi]');
pfn2 = dist(wtnet2,[ciri_matang_seleksi;ciri_mentah_seleksi]');
 
% menghitung jarak terpendek
Group = zeros(numel(target_uji),2);
for i = 1:numel(target_uji)
    Group(i,:) = [min(pfn1(:,i)),min(pfn2(:,i))];
end
 
% membaca nilai keluaran hasil pengujian
[~,Groupmin] = min(Group,[],2);
 
% menghitung nilai akurasi pengujian
akurasi = (sum(target_uji==Groupmin)/numel(target_uji))*100;
 
% menampilkan nilai akurasi pengujian
disp(['Akurasi Pengujian = ',num2str(akurasi),' %'])