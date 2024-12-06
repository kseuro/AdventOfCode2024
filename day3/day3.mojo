from pathlib import Path
from python import Python


def main():
    print("Hello, Day 3!")

    var re = Python.import_module("re")
    file = Path("input.txt").read_text()
    result = re.findall(
        "mul\\([0-9]+,[0-9]+\\)|do\\(\\)|don't\\(\\)", str(file)
    )

    total_part1 = 0
    total_part2 = 0
    eval = True
    for instruction in result:
        if instruction == "do()":
            eval = True
        elif instruction == "don't()":
            eval = False
        else:
            numbers = str(instruction)[4:-1].split(",")
            result = int(numbers[0]) * int(numbers[1])
            total_part1 += result
            if eval:
                total_part2 += result
    print("Total Part 1", total_part1)
    print("Total Part 2", total_part2)
