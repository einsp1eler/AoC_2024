with open('Input/Day1.txt', 'r') as inputfile:
    lines = inputfile.readlines()

left_nums = sorted([int(line.split()[0]) for line in lines])
right_nums = sorted([int(line.split()[1]) for line in lines])

distance = sum(abs(left_nums[i] - right_nums[i]) for i in range(len(left_nums)))
print(distance)

similarity = sum(right_nums.count(num) * num for num in left_nums)
print(similarity)