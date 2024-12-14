input = readlines("Input/Day14.txt")

pos = [[parse(Int, split(m.match, ',')[1]), parse(Int, split(m.match, ',')[2])] for line in input for m in eachmatch(r"(?<=[p][=])(-?\d+),(-?\d+)", line)]
dir = [[parse(Int, split(m.match, ',')[1]), parse(Int, split(m.match, ',')[2])] for line in input for m in eachmatch(r"(?<=[v][=])(-?\d+),(-?\d+)", line)]

grid_x = 101
grid_y = 103
it = 1
unfinished_p1 = true
unfinished_p2 = true
while unfinished_p1 || unfinished_p2
    new_pos_list = []
    coorddict = Dict()
    for i in eachindex(pos)
        new_vector = pos[i] + dir[i]*it
        push!(new_pos_list, [mod(new_vector[1], grid_x), mod(new_vector[2], grid_y)])
        push!(get!(coorddict, new_pos_list[i][2], Vector()), new_pos_list[i][1])
    end

    if it == 100
        filter!(x -> x[1] != (grid_x-1)/2 && x[2] != (grid_y-1)/2, new_pos_list)

        q1 = sum(1 for vec in new_pos_list if vec[1] < (grid_x-1)/2 && vec[2] < (grid_y-1)/2)
        q2 = sum(1 for vec in new_pos_list if vec[1] > (grid_x-1)/2 && vec[2] < (grid_y-1)/2)
        q3 = sum(1 for vec in new_pos_list if vec[1] < (grid_x-1)/2 && vec[2] > (grid_y-1)/2)
        q4 = sum(1 for vec in new_pos_list if vec[1] > (grid_x-1)/2 && vec[2] > (grid_y-1)/2)
        println(q1*q2*q3*q4)
        global unfinished_p1 = false
    end

    lengths = sort([length(Set(val)) for val in values(coorddict)], rev=true)
    if lengths[2] > 31
        println(it)
        global unfinished_p2 = false
    end
    global it += 1
end