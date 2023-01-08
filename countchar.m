function [P,Q,T2,T3] = countchar(txt)

% function that return a table P containing how many times a character appears in the text 
% and a table Q containing the percentage of a character in a plain text.
% txt must be a string. This only works with the classic affine cipher, if
% you want to modify it, you need to change the code.
% T2 and T3 are the column of the two tables.

index = 'A':'Z'; %you need to choose the cipher

T1={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}';
T2 = zeros(26,1);
for i=1:length(txt)
    if txt(i)~=' '&&txt(i)~='.'
        c = find(index==txt(i));
        T2(c) = T2(c)+1;
    end
end
P=table(T1,T2);
T3 = (T2(:).*100)./length(txt);
Q=table(T1,T3);
end