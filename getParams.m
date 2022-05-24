function [params] = getParams()

    params.h=0.5;
    params.L=255;
    params.K=200;
    params.C = (params.K*params.L).^(2*0.5);
    
end

