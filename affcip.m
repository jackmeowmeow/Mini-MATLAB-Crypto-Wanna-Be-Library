function encryptd = affcip()

    % Perform the affine cipher encryption of a sentence using keys lambda and kappa
    % This code use the classic latin alphabet
    % l_key = lambda (note that lambda must be invertible mod36) 
    % k_key = kappa
    
    l_key = 0.1; % not integer assignment for entering the while cycles later
    k_key = 0.1;
    
    disp('An affine cipher encrypt a phrase using a function l*x+k, where x is\n every single character in the phrase');
    txt = input('Enter a phrase that you wish to encrypt it: ','s');
    
    while mod(l_key,1)~=0 % lambda needs to be an integer
        l_key = input ('\nEnter lambda: ');
        while isempty(l_key)
            l_key = input ('You must insert a key value. \nPlease, enter lambda: ');
        end
        while gcd(l_key,26)~=1
            l_key = input ('Lambda l must be an integer invertible mod26. \nEnter lambda: ');
        end
    end
 
    while mod(k_key,1)~=0 % kappa needs to be an integer
         k_key = input ('\nEnter kappa: ');  
         if isempty(k_key)
            k_key = 0;
         end
    end
    
    encryptd = txt;
    l_key = mod(l_key,26);  % to make sure that are keys are integers between zero and 25
    k_key = mod(k_key,26);
    index=('a':'z');        % if you want to change the cipher you need to change also the modulo 26
    for i=1:length(txt)
        if isletter(txt(i)) % it does not change spaces or punctation
            p = find(index==txt(i));
            encryptd(i) = index(mod(l_key*(p-1)+k_key,26)+1);
        end
    end
end