function [refImg,disImg] = automaticDownsampling(refImg,disImg)

    [nRows,nCols]=size(refImg);
    f = max(1,round(min(nRows,nCols)/256));
    if(f>1)
        lpf = ones(f,f);
        lpf = lpf/sum(lpf(:));
        refImg = imfilter(refImg,lpf,'symmetric','same');
        disImg = imfilter(disImg,lpf,'symmetric','same');

        refImg = refImg(1:f:end,1:f:end);
        disImg = disImg(1:f:end,1:f:end);
    end

end

