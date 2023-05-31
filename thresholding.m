function y=thresholding(x, thresh)
y = ones(size(x));
%perulangan pada thresholding
for i=1:size(y,1)
    for j=1:size(y,2)
        %jika nilai pixel lebih kecil dari nilai tresholding maka akan
        %bernilai 0
        if (x(i,j)<thresh)
            y(i,j)=0;
        %jika nilai pixel lebih besar dari nilai tresholding maka akan
        %bernilai 1
        else
            y(i,j)=1;
        end
    end
end
end