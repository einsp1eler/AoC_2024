with open('Input/Day4.txt', 'r') as inputfile:
    lines = inputfile.readlines()

xmasresult = 0
for y in range(len(lines)):
    xmasresult += lines[y].count('XMAS') + lines[y].count('SAMX')
    if y < len(lines) - 3:
        for x in range(len(lines[y])):
            if (lines[y][x] == 'X' and lines[y+1][x] == 'M' and lines[y+2][x] == 'A' and lines[y+3][x] == 'S') or (lines[y][x] == 'S' and lines[y+1][x] == 'A' and lines[y+2][x] == 'M' and lines[y+3][x] == 'X'):
                xmasresult += 1
            if x < len(lines[y]) - 3:
                if (lines[y][x] == 'X' and lines[y+1][x+1] == 'M' and lines[y+2][x+2] == 'A' and lines[y+3][x+3] == 'S') or (lines[y][x] == 'S' and lines[y+1][x+1] == 'A' and lines[y+2][x+2] == 'M' and lines[y+3][x+3] == 'X'):
                    xmasresult += 1
            if x > 2:
                if (lines[y][x] == 'X' and lines[y+1][x-1] == 'M' and lines[y+2][x-2] == 'A' and lines[y+3][x-3] == 'S') or (lines[y][x] == 'S' and lines[y+1][x-1] == 'A' and lines[y+2][x-2] == 'M' and lines[y+3][x-3] == 'X'):
                    xmasresult += 1

print(xmasresult)

masresult = 0
for y in range(len(lines) - 2):
    for x in range(len(lines[y]) - 2):
        if lines[y+1][x+1] == 'A' and ((lines[y][x] == 'M' and lines[y+2][x+2] == 'S' and ((lines[y][x+2] == 'S' and lines[y+2][x] == 'M') or (lines[y][x+2] == 'M' and lines[y+2][x] == 'S'))) or (lines[y][x] == 'S' and lines[y+2][x+2] == 'M' and ((lines[y][x+2] == 'M' and lines[y+2][x] == 'S') or lines[y][x+2] == 'S' and lines[y+2][x] == 'M'))):
            masresult += 1

print(masresult)

# masresult as a One-Liner
masresult = sum(lines[y+1][x+1] == 'A' and ((lines[y][x] == 'M' and lines[y+2][x+2] == 'S' and ((lines[y][x+2] == 'S' and lines[y+2][x] == 'M') or (lines[y][x+2] == 'M' and lines[y+2][x] == 'S'))) or (lines[y][x] == 'S' and lines[y+2][x+2] == 'M' and ((lines[y][x+2] == 'M' and lines[y+2][x] == 'S') or lines[y][x+2] == 'S' and lines[y+2][x] == 'M'))) for y in range(len(lines) - 2) for x in range(len(lines[y]) - 2))
print(masresult)
