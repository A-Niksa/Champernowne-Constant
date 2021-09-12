function digitsNum(flag)
    R = 0
    while(flag!=0)
        flag = div(flag,10)
        R+=1
    end
    return R
end

function nthDigit(flag,n)
    n = digitsNum(flag)+1-n
    return round(big(((flag%big(10.0)^(n) - flag%big(10.0)^(n-1)) / big(10.0)^(n-1))))
end

function numberBlock(n)
    i = 1
    h = 0
    r = 0
    while(n>0)
        m = i*9*10^r
        h += m
        n-=h
        i+=1
        r+=1
    end
    return i-1
end

function endBlock(n)
    R = 0
    r = 0
    for i = 1:n
        m = i*9*10^r
        R+=m
        r+=1
    end
    return R
end

function d(n)
    numB = numberBlock(n)
    numR = n-endBlock(numB-1)
    I = div(numR,numB)
    i = numR%numB
    if i==0
        return Int8(nthDigit(10^(numB-1)+I-1,numB))
    else
        return Int8(nthDigit(10^(numB-1)+I+1,i))
    end
end

println("Please enter the index for the desired decimal digit of Chapernowne's constant: ")
n = readline()
n = parse(Int64,n)
println(n)

println(d(n))