using Caching

@cache function add_nums(num, t)
    t <= 0 && return 1
    length(string(num)) % 2 == 0 && return add_nums(parse(Int, string(num)[length(string(num))÷2+1:end]), t - 1) + add_nums(parse(Int, string(num)[1:length(string(num))÷2]), t - 1)
    num == 0 && return add_nums(2024, t-2)
    return add_nums(num*2024, t-1)
end

input = [parse(Int, x) for x in split(readlines("Input/Day11.txt")[1], " ")]

result = sum(add_nums(num, 75) for num in input)
println(result)