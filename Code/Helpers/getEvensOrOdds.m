function feo = evensOrOdds(f, string)
    if string == "even"
        feo = f(1:2:end);

    elseif string == "odd"
        feo = f(2:2:end);

    else
        fprintf('Error in getEvensOrOdds')

    end
end