function encryptd = affcip(l,k,txt)

% perform the affine cipher encryption of w using parameters lambda and kappa
% l=lambda (note that lambda must be invertible mod36) 
% k=kappa
% Note that you can easily import plain text useble here by w = cell2mat(convertStringsToChars(importdata('File.txt')))

if gcd(l,26)~=1 
    error('Lambda l must be invertible mod26. Retry with a different number'); 
else
    index=('A':'Z'); %you need to choose the cipher
    encryptd=txt;
    for i=1:length(txt)
        if txt(i)~=' '&&txt(i)~='.'
            p = find(index==txt(i));
            encryptd(i)=index(mod(l*(p-1)+k,26)+1);
        end
    end
end
end