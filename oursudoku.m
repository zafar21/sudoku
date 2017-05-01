function X=oursudoku(X)
[X,Xcell]=UpdateRecursively(X);
if ~valid_input(X) || any(any(cellfun(@isempty,Xcell)))
    return %unsolvable
end
if any(X(:)==0)
    firstzero=find(X==0,1);
    Y=X;
    for i=Xcell{firstzero}
        X=Y;
        X(firstzero)=i;
        X=oursudoku(X);
        if X>0
            if valid_input(X)
                return %solved
            end
        end
        end
    end
end