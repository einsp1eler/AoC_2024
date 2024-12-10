function navigate_grid(vec, input, num, targets, part)
    if vec[1] < 1 || vec[1] > length(input) || vec[2] < 1 || vec[2] > length(input[1]) || input[vec[1]][vec[2]] != num || vec in targets
        return 0
    end
    sum = 0
    if input[vec[1]][vec[2]] == num
        if num == 9
            part == 1 && push!(targets, vec)
            return 1
        else
            sum += navigate_grid(vec+[0, 1], input, num+1, targets, part)
            sum += navigate_grid(vec+[1, 0], input, num+1, targets, part)
            sum += navigate_grid(vec+[0, -1], input, num+1, targets, part)
            sum += navigate_grid(vec+[-1, 0], input, num+1, targets, part)
        end
    end

    return sum
end

input = [[parse(Int, x) for x in sublist] for sublist in [collect(line) for line in readlines("Input/Day10.txt")]]

start_list = [[y, x] for y in eachindex(input) for x in eachindex(input[y]) if input[y][x] == 0]

result = sum(navigate_grid(vec, input, 0, Set(), 1) for vec in start_list)
println(result)

result_p2 = sum(navigate_grid(vec, input, 0, Set(), 2) for vec in start_list)
println(result_p2)