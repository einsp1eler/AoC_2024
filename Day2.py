def report_is_safe(report):
    differences = [report[i] - report[i - 1] for i in range(1, len(report))]
    
    return all(1 <= diff <= 3 for diff in differences) or all(-3 <= diff <= -1 for diff in differences)

def report_is_tolerable(report):
    for i in range(len(report)):
        if report_is_safe(report[:i] + report[i + 1:]): return True
    return False

with open('Input/Day2.txt', 'r') as inputfile:
    lines = inputfile.readlines()

lines = [[int(x) for x in line.split()] for line in lines]

safe_reports = sum(1 for line in lines if report_is_safe(line))
print(safe_reports)

tolerated_reports = sum(1 for line in lines if report_is_tolerable(line))
print(tolerated_reports)