function [P,Freq,Perc_freq] = countchar(txt)

    % function that return a table P containing how many times a character appears in the text 
    % and a table Q containing the percentage of a character in a plain text.
    % txt must be a string. This only works with the classic affine cipher, if
    % you want to modify it, you need to change the code.
    % T2 and T3 are the column of the two tables.

    index = 'a':'z'; %you need to choose the cipher

    Char = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}';
    Freq = zeros(26,1);

    iter = 0;
    for i=1:length(txt)
        if isletter(txt(i))
            c = find(index==txt(i));
            Freq(c) = Freq(c)+1;
            iter = iter + 1;
        end
    end
    Perc_freq = (Freq(:).*100)./iter;
    P = table(Char,Freq,Perc_freq);
end