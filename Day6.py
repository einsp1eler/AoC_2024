def get_new_direction(state, y, x):
    states = [(y - 1, x), (y, x + 1), (y + 1, x), (y, x - 1)]
    return states[state]

with open('Input/Day6.txt', 'r') as inputfile:
    input = inputfile.readlines()

for y in range(len(input)):
    if input[y].find('^') > -1:
        x = input[y].find('^')
        break

input = [list(line.replace('\n', '')) for line in input]

input[y][x] = 'X'
state = 0
while True:
    y_new, x_new = get_new_direction(state, y, x)
    if y_new == len(input) or x_new == len(input[y]):
        break
    elif input[y_new][x_new] == '#':
        state = (state + 1) % 4
    else:
        y = y_new
        x = x_new
        input[y][x] = 'X'

result = sum(1 for line in input for pos in line if 'X' in pos)
print(result)