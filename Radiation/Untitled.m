A = 1:100;
l = length(A)
x = A(l)
tol = 0.05;
r = 0;
sat = 0;
for i=1:l
    if abs(x-A(i))<tol*x
        r = r+1;
        if r==3
            return
        end
    else
        r = 0;
    end
end
i
sat = mean(A(i:l))