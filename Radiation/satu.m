function [sat] = satu(A)
    l = length(A);
    x = A(l);
    tol = 0.01;
    r = 0;
    for i=1:l
        z = abs(x-A(i));
        if z<tol*x
            r = r+1;
            if r==3
                break
            end
        else
            r = 0;
        end
    end
    sat = mean(A(i:l));
end