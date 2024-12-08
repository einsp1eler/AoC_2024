function is_addable(result, interim, numlist)
    if interim > result
        return false
    end
    if isempty(numlist)
        return result == interim
    end
    return is_addable(result, interim + numlist[1], numlist[2:end]) || is_addable(result, interim * numlist[1], numlist[2:end])
end

function is_addable_part2(result, interim, numlist)
    if interim > result
        return false
    end
    if isempty(numlist)
        return result == interim
    end
    return is_addable_part2(result, interim + numlist[1], numlist[2:end]) || is_addable_part2(result, interim * numlist[1], numlist[2:end]) || is_addable_part2(result, parse(Int, "$(string(interim))$(string(numlist[1]))"), numlist[2:end])
end

input = readlines("Input/Day7.txt")

resultlist = [parse(Int, split(line, ":")[1]) for line in input]

numlist = [[parse(Int, x) for x in split(split(line, ":")[2])] for line in input]

result = sum(resultlist[i] for i in 1:length(resultlist) if is_addable(resultlist[i], numlist[i][1], numlist[i][2:end]))
println(result)

result_concat = sum(resultlist[i] for i in 1:length(resultlist) if is_addable_part2(resultlist[i], numlist[i][1], numlist[i][2:end]))
println(result_concat)