function navigate_grid(vec, input, num, targets, part)
    if vec[1] < 1 || vec[1] > length(input) || vec[2] < 1 || vec[2] > length(input[1])
        return 0
    end
    if input[vec[1]][vec[2]] == num && num == 9
        if part == 1
            if !(vec in targets)
                push!(targets, vec)
                return 1
            end
            return 0
        end
        return 1
    end
    sum = 0
    if input[vec[1]][vec[2]] == num
        sum += navigate_grid(vec+[0, 1], input, num+1, targets, part)
        sum += navigate_grid(vec+[1, 0], input, num+1, targets, part)
        sum += navigate_grid(vec+[0, -1], input, num+1, targets, part)
        sum += navigate_grid(vec+[-1, 0], input, num+1, targets, part)
    else
        return 0
    end

    return sum
end

input = [[parse(Int, x) for x in sublist] for sublist in [collect(line) for line in readlines("Input/Day10.txt")]]

start_list = [[y, x] for y in eachindex(input) for x in eachindex(input[y]) if input[y][x] == 0]

result = sum(navigate_grid(vec, input, 0, Set(), 1) for vec in start_list)
println(result)

result_p2 = sum(navigate_grid(vec, input, 0, Set(), 2) for vec in start_list)
println(result_p2)