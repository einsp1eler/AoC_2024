# DO NOT TRY THIS AT HOME

function not_in_grid(vec, input, target)
    if vec[1] < 1 || vec[1] > length(input) || vec[2] < 1 || vec[2] > length(input[1]) || input[vec[1]][vec[2]] != target
        return true
    end
    return false
end

function navigate_grid(vec, input, visited, target, region, a, b)
    if vec[1] < 1 || vec[1] > length(input) || vec[2] < 1 || vec[2] > length(input[1]) || input[vec[1]][vec[2]] != target
        return [b, region]
    elseif vec in visited
        return [0, region]
    end
    push!(visited, vec)
    push!(region, vec)
    sum = a
    sum += navigate_grid(vec+[0, 1], input, visited, target, region, a, b)[1]
    sum += navigate_grid(vec+[1, 0], input, visited, target, region, a, b)[1]
    sum += navigate_grid(vec+[0, -1], input, visited, target, region, a, b)[1]
    sum += navigate_grid(vec+[-1, 0], input, visited, target, region, a, b)[1]
    return [sum, sort(region)]
end

input = [collect(line) for line in readlines("Input/Day12.txt")]

visited = Set()

result = sum(navigate_grid([y, x], input, copy(visited), input[y][x], [], 1, 0)[1] * navigate_grid([y, x], input, visited, input[y][x], [], 0, 1)[1] for y in eachindex(input) for x in eachindex(input[y]) if !([y, x] in visited))
println(result)

visited = Set()

result_sides = Set([navigate_grid([y, x], input, copy(visited), input[y][x], [], 1, 0) for y in eachindex(input) for x in eachindex(input[y]) if !([y, x] in visited)])

result_2 = 0
for region in result_sides
    sum_sides = 0
    for reg_vec in region[2]
        sum_sides += not_in_grid(reg_vec+[1, 0], input, input[reg_vec[1]][reg_vec[2]]) && not_in_grid(reg_vec+[0, 1], input, input[reg_vec[1]][reg_vec[2]])
        sum_sides += not_in_grid(reg_vec+[1, 0], input, input[reg_vec[1]][reg_vec[2]]) && not_in_grid(reg_vec+[0, -1], input, input[reg_vec[1]][reg_vec[2]])
        sum_sides += not_in_grid(reg_vec+[-1, 0], input, input[reg_vec[1]][reg_vec[2]]) && not_in_grid(reg_vec+[0, -1], input, input[reg_vec[1]][reg_vec[2]])
        sum_sides += not_in_grid(reg_vec+[-1, 0], input, input[reg_vec[1]][reg_vec[2]]) && not_in_grid(reg_vec+[0, 1], input, input[reg_vec[1]][reg_vec[2]])
        sum_sides += not_in_grid(reg_vec+[-1, -1], input, input[reg_vec[1]][reg_vec[2]]) && !(not_in_grid(reg_vec+[-1, 0], input, input[reg_vec[1]][reg_vec[2]])) && !(not_in_grid(reg_vec+[0, -1], input, input[reg_vec[1]][reg_vec[2]]))
        sum_sides += not_in_grid(reg_vec+[1, 1], input, input[reg_vec[1]][reg_vec[2]]) && !(not_in_grid(reg_vec+[0, 1], input, input[reg_vec[1]][reg_vec[2]])) && !(not_in_grid(reg_vec+[1, 0], input, input[reg_vec[1]][reg_vec[2]]))
        sum_sides += not_in_grid(reg_vec+[1, -1], input, input[reg_vec[1]][reg_vec[2]]) && !(not_in_grid(reg_vec+[1, 0], input, input[reg_vec[1]][reg_vec[2]])) && !(not_in_grid(reg_vec+[0, -1], input, input[reg_vec[1]][reg_vec[2]]))
        sum_sides += not_in_grid(reg_vec+[-1, 1], input, input[reg_vec[1]][reg_vec[2]]) && !(not_in_grid(reg_vec+[-1, 0], input, input[reg_vec[1]][reg_vec[2]])) && !(not_in_grid(reg_vec+[0, 1], input, input[reg_vec[1]][reg_vec[2]]))
    end
    global result_2 += region[1] * sum_sides
end
println(result_2)