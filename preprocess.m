function [refImg,disImg] = preprocess(refImg,disImg)
    refImg = double(refImg);
    disImg = double(disImg);

    if size(refImg,3)==3 
        refImg = 0.299 * double(refImg(:,:,1)) + 0.587 * double(refImg(:,:,2)) + 0.114 * double(refImg(:,:,3));
        disImg = 0.299 * double(disImg(:,:,1)) + 0.587 * double(disImg(:,:,2)) + 0.114 * double(disImg(:,:,3));
    end
end

