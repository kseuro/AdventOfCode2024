from pathlib import Path
from collections import Dict


def solve_part1(filename: String) -> Int32:
    file = Path(filename)
    file_content = file.read_text()
    base_string = file_content.split("\n")

    var left_data = List[Int32]()
    var right_data = List[Int32]()
    for i in range(len(base_string)):
        if base_string[i] == "":  # in case the last line is empty
            continue
        line_split = base_string[i].split("   ")
        left_data.append(int(line_split[0]))
        right_data.append(int(line_split[1]))
    sort(left_data)
    sort(right_data)

    var distance: Int32 = 0
    for i in range(len(left_data)):
        dist = left_data[i] - right_data[i]
        if dist < 0:
            dist *= -1
        distance += dist
    return distance


def solve_part2(filename: String) -> Int32:
    file = Path(filename)
    file_content = file.read_text()
    base_string = file_content.split("\n")

    var left_data = List[Int]()
    var right_counts = Dict[Int, Int]()
    for i in range(len(base_string)):
        if base_string[i] == "":  # in case the last line is empty
            continue
        line_split = base_string[i].split("   ")
        left_data.append(int(line_split[0]))

        rd = int(line_split[1])
        right_counts[rd] = right_counts.get(rd, 0) + 1

    var left_sim = 0
    for i in range(len(left_data)):
        left_sim += left_data[i] * right_counts.get(left_data[i], 0)
    return left_sim


def main():
    print("Hello, Day 1!")

    part1 = solve_part1("input.txt")
    print("Total Distance: ", part1)

    part2 = solve_part2("input.txt")
    print("Similarity: ", part2)
