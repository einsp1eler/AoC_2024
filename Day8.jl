input = [collect(line) for line in readlines("Input/Day8.txt")]

symboldict = Dict()
for y in eachindex(input), x in eachindex(input[y])
    if input[y][x] != '.'
        push!(get!(symboldict, input[y][x], Vector()), [y, x])
    end
end

resultset1 = Set()
resultset2 = Set()
for key in keys(symboldict)
    for vec in 1:(length(symboldict[key]) - 1), i in vec+1:(length(symboldict[key]))
        diff = symboldict[key][vec] - symboldict[key][i]
        vector1 = symboldict[key][vec] + diff
        if 0 < vector1[1] <= length(input) && 0 < vector1[2] <= length(input)
            push!(resultset1, vector1)
        end
        while 0 < vector1[1] <= length(input) && 0 < vector1[2] <= length(input)
            push!(resultset2, vector1)
            vector1 += diff
        end
        vector2 = symboldict[key][i] + diff * -1
        if 0 < vector2[1] <= length(input) && 0 < vector2[2] <= length(input)
            push!(resultset1, vector2)
        end
        while 0 < vector2[1] <= length(input) && 0 < vector2[2] <= length(input)
            push!(resultset2, vector2)
            vector2 += diff * -1
        end
    end
    union!(resultset2, symboldict[key])
end

println(length(resultset1))
println(length(resultset2))