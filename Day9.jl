function isValidPoint(list, point, n)
    for i in point:point+n
        if list[i] != '.' 
            return false
        end
    end
    return true
end

input = readlines("Input/Day9.txt")[1]

resultlist = []
for i in eachindex(input)
    if i % 2 == 1
        append!(resultlist, fill(i ÷ 2, parse(Int, input[i])))
    else
        append!(resultlist, fill('.', parse(Int, input[i])))
    end
end
resultlist_p2 = copy(resultlist)

i = 1
while i <= length(resultlist)
    if resultlist[i] == '.'
        resultlist[i] = resultlist[end]
        deleteat!(resultlist, length(resultlist))
    else global i += 1
    end
end

result = sum(resultlist[i] * (i - 1) for i in eachindex(resultlist))
println(result)

pos_nums = []
for i in reverse(2:length(resultlist_p2))
    if i == length(resultlist_p2) || (resultlist_p2[i] != '.' && resultlist_p2[i+1] != resultlist_p2[i])
        index_end = i
    end
    if resultlist_p2[i] != '.' && resultlist_p2[i-1] != resultlist_p2[i]
        global index_end
        push!(pos_nums, [i, index_end - i])
    end
end

for num in pos_nums
    pointlist = findall(x -> x == '.', resultlist_p2)
    for point in findall(y -> y < num[1], pointlist)
        if isValidPoint(resultlist_p2, pointlist[point], num[2])
            for i in 0:num[2]
                resultlist_p2[i+num[1]], resultlist_p2[i+pointlist[point]] = resultlist_p2[i+pointlist[point]], resultlist_p2[i+num[1]]
            end
            break
        end
    end
end

result_p2 = sum(resultlist_p2[i] * (i - 1) for i in eachindex(resultlist_p2) if resultlist_p2[i] != '.')
println(result_p2)