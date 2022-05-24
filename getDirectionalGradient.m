function  [g]=getDirectionalGradient(f)

    [nRows,nCols]=size(f);
    g=zeros(nRows,nCols,4);

    kernel1=zeros(5);
    Kt=1/16*[3 10 3;0 0 0; -3 -10 -3];
    kernel1(2:4,2:4)=Kt;
    kernel2=kernel1';
    kernel3=1/16*[ 0     0     3     0     0;
        0    10     0     0     0;
        3     0     0     0    -3;
        0     0     0   -10     0;
        0     0    -3     0     0];
    kernel4=rot90(kernel3);

    g(:,:,1)=filter2(kernel1,f,'same');
    g(:,:,2)=filter2(kernel2,f,'same');
    g(:,:,3)=filter2(kernel3,f,'same');
    g(:,:,4)=filter2(kernel4,f,'same');
end
