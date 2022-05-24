function [quality] = SG_ESSIM(refImg, disImg)

    [refImg,disImg] = preprocess(refImg,disImg);
    [refImg,disImg] = automaticDownsampling(refImg,disImg);

    [nRows,nCols]=size(refImg);

    [gRef]=getDirectionalGradient(refImg);
    [gDis]=getDirectionalGradient(disImg);

    params = getParams();
    
    gradRef=abs(gRef(:,:,[1,3])-gRef(:,:,[2,4])).^0.5;
    gradDis=abs(gDis(:,:,[1,3])-gDis(:,:,[2,4])).^0.5;

    [Y,X]=meshgrid(1:nCols,1:nRows);
    [~,ind3]=max(gradRef,[],3);

    ind=sub2ind([nRows,nCols,2],X(:),Y(:),ind3(:));
    edgeMap=max(gradRef(ind),gradDis(ind));

    H=params.C*exp(-edgeMap/params.h);
    SM=(2*gradRef(ind).*gradDis(ind)+H)./(gradRef(ind).^2+gradDis(ind).^2+H);
    quality=mean2(SM);
end

