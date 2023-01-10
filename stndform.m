function [S,eqv] = stndform(G)

% function to transform a generator matrix G in standard form, using an
% equivalent code if necessary. The output is the matrix S in standard form
% and a logical value to understand if we are considering an equivalent
% code. 
% G generator matrix
% S standard form
% eqv true if equivalent code was necessary

S = G;
eqv = false;
k = size(G,1);
n = size(G,2);
if n <= k %in a linear code the matrix should be a nxk where the code is a [n,k,d]-code
    error('G must have more column than rows');
end
for j=1:k
    if S(j,j) == false                      % we need to create an eyes(nk) matrix so we check the diagonal
        index = find(S(j:k,j),1)+j-1;      % index of the first nonzero element of the j-row from j to nk
        if ~isempty(index)
            temp = S(index,:);              % we swap the index-row with the j-row
            S(index,:) = S(j,:);
            S(j,:) = temp;
        else
            index = find(S(j,j:n),1)+j-1;   % index of the first nonzero element of the j-column from j to n
            if ~isempty(index)
                temp = S(:,index);          % we swap the index-column with the j-column
                S(:,index) = S(:,j);
                S(:,j) = temp;
                eqv = true;                 % By swapping columns we've created an equivalent code
            end
        end
    end
    for i=1:j-1
        if S(i,j) == true
            S(i,j:n) = xor(S(i,j:n),S(j,j:n)); % XOR process because we are working with bytes
        end
    end
    for i=j+1:nk
        if S(i,j) == true
            S(i,j:n) = xor(S(i,j:n),S(j,j:n));
        end
    end
end
end