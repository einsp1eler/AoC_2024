import re

def get_results(occurences):
    return sum([int(mul[mul.index('(') + 1:mul.index(')')].split(',')[0]) * int(mul[mul.index('(') + 1:mul.index(')')].split(',')[1]) for mul in occurences])

with open('Input/Day3.txt', 'r') as inputfile:
    lines = inputfile.readlines()

result = get_results([match.group() for line in lines for match in re.finditer('mul\(\d+,\d+\)', line)])
print(result)

mullist = []
enabled = True
for line in lines:
    for match in re.finditer("mul\(\d+,\d+\)|(do\(\)|don't\(\))", line):
        if match.group().startswith('mul') and enabled:
            mullist.append(match.group())
        elif match.group() == 'do()':
            enabled = True
        elif match.group() == "don't()":
            enabled = False

restricted_result = get_results(mullist)
print(restricted_result)