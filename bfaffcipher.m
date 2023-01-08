function bfaffcipher(y)

%brute force attack to an affine cipher encryption y
%you need to read all the alternatives

index=strcat('a':'z','0':'9'); %you need to choose the cipher

for mi=1:37
    dcrypt=y;
    if gcd(mi,36)==1
        for ni=0:1:36
            for i = 1:length(y)
                p = find(index==y(i));
                dcrypt(i) = index(mod(mi*(p-1)+ni,36)+1);
            end
            message = sprintf('mi=%d, ni=%d, message = %s',mi,mod(-ni,36),dcrypt);
            disp(message)
        end
    end
end
end