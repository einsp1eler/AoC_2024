with open('Input/Day7.txt', 'r') as inputfile:
    input = inputfile.readlines()

def is_addable(result, interim, numlist):
    if interim > result:
        return False
    if not numlist:
        return result == interim
    return is_addable(result, interim + numlist[0], numlist[1:]) or is_addable(result, interim * numlist[0], numlist[1:])
    
def is_addable_part2(result, interim, numlist):
    if interim > result:
        return False
    if not numlist:
        return result == interim
    return is_addable_part2(result, interim + numlist[0], numlist[1:]) or is_addable_part2(result, interim * numlist[0], numlist[1:]) or is_addable_part2(result, int(f'{interim}{numlist[0]}'), numlist[1:])

resultlist = [int(line.split(':')[0]) for line in input]
numlist = [[int(x) for x in sublist] for sublist in [line.replace('\n', '').split(':')[1].split(' ')[1:] for line in input]]

result = sum(resultlist[i] for i in range(len(resultlist)) if is_addable(resultlist[i], numlist[i][0], numlist[i][1:]))
print(result)

result_concat = sum(resultlist[i] for i in range(len(resultlist)) if is_addable_part2(resultlist[i], numlist[i][0], numlist[i][1:]))
print(result_concat)