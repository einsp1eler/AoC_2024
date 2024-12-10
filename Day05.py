with open('Input/Day5.txt', 'r') as inputfile:
    input = inputfile.readlines()

rulelist = [line.replace('\n', '').split('|') for line in input if '|' in line]
numbers = [line.replace('\n', '').split(',') for line in input if ',' in line]

result = sum(int(line[len(line)//2]) for line in numbers if all(line.index(a) < line.index(b) for a, b in rulelist if a in line and b in line))
print(result)

""" result as a One-Liner
result = sum(int(orderline[len(orderline)//2]) for orderline in [line.split(',') for line in input if ',' in line] if all(orderline.index(a) < orderline.index(b) for a, b in [line.replace('\n', '').split('|') for line in input if '|' in line] if a in orderline and b in orderline))
print(result)
"""

unordered_lines = []
for line in numbers:
    unordered = True
    while unordered:
        for a, b in rulelist:
            if a in line and b in line and not line.index(a) < line.index(b):
                if abs(line.index(a) - line.index(b)) == 1:
                    if line in unordered_lines: unordered_lines.remove(line)
                    line[line.index(a)], line[line.index(b)] = line[line.index(b)], line[line.index(a)]
                    unordered_lines.append(line)
        if all(line.index(a) < line.index(b) for a, b in rulelist if a in line and b in line):
            unordered = False
   
result_unordered = sum(int(line[len(line)//2]) for line in unordered_lines)
print(result_unordered)