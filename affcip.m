function encryptd = affcip()

    % perform the affine cipher encryption of a sentence using keys lambda and kappa
    % l_key = lambda (note that lambda must be invertible mod36) 
    % k_key = kappa

    disp('An affine cipher encrypt a phrase using a function l*x+k, where x is\n every single character in the phrase');
    txt = input('Enter a phrase that you wish to encrypt it: ','s');

    l_key = input ('\nEnter lambda: ');
    while isempty(l_key)
        l_key = input ('You must insert a key value. \nPlease, enter lambda: ');
    end
    while gcd(l_key,26)~=1
        l_key = input ('Lambda l must be invertible mod26. \nEnter lambda: ');
    end

    k_key = input ('\nEnter kappa: ');
    if isempty(k_key)
        k_key = 0;
    end
    encryptd = txt;
    l_key = mod(l_key,26);
    k_key = mod(k_key,26);
    index=('a':'z'); %you need to choose the cipher
    for i=1:length(txt)
        if isletter(txt(i))
            p = find(index==txt(i));
            encryptd(i) = index(mod(l_key*(p-1)+k_key,26)+1);
        end
    end
end