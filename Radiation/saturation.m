function [sat] = satu(A)
    l = length(A);
    x = A(l);
    sat = x;
    tol = 0.05;
    for i=1:l
        if abs(x-A(l-i+1))>tol*x
            return
        end
        sat = sat+A(l-i+1);
    end
end