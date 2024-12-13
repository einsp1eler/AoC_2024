using LinearSolve

is_int(num) = return abs(num - round(num)) < 1e-4

function solve_system(nums_x, nums_y, results_x, results_y)
    result = 0
    for i in 1:2:length(nums_x)
        a::Matrix{Float64} = [nums_x[i] nums_x[i+1]; nums_y[i] nums_y[i+1]]
        b::Vector{Float64} = [results_x[i÷2+1], results_y[i÷2+1]]
        sol = solve(LinearProblem(a, b))
        if is_int(sol.u[1]) && is_int(sol.u[2])
            result += Int.(round(sol.u[1]*3 + sol.u[2]))
        end
    end
    return result
end

input = readlines("Input/Day13.txt")
nums_x = [parse(Int, m.match) for line in input for m in eachmatch(r"(?<=[X][+])\d+", line)]
nums_y = [parse(Int, m.match) for line in input for m in eachmatch(r"(?<=[Y][+])\d+", line)]
results_x = [parse(Int, m.match) for line in input for m in eachmatch(r"(?<=[X][=])\d+", line)]
results_y = [parse(Int, m.match) for line in input for m in eachmatch(r"(?<=[Y][=])\d+", line)]

result_p1 = solve_system(nums_x, nums_y, results_x, results_y)
println(result_p1)
results_x = [x + 10000000000000 for x in results_x]
results_y = [x + 10000000000000 for x in results_y]

result_p2 = solve_system(nums_x, nums_y, results_x, results_y)
println(result_p2)