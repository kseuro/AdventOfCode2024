from pathlib import Path

alias MIN_DIFF = 1
alias MAX_DIFF = 3


def load_data(filename: String) -> List[String]:
    file = Path(filename)
    file_content = file.read_text()
    base_string = file_content.split("\n")
    return base_string


def make_levels_arr(report: String) -> List[Int]:
    var levels = report.split(" ")
    var levels_arr = List[Int]()
    for i in range(len(levels)):
        levels_arr.append(int(levels[i]))
    return levels_arr


def check_safety(levels: List[Int]) -> Bool:
    var increasing: Bool = False
    var decreasing: Bool = False
    for j in range(len(levels)):
        if j + 1 == len(levels):  # Don't go off end
            break

        curr = levels[j]
        next = levels[j + 1]
        diff = abs(curr - next)

        if diff < MIN_DIFF or diff > MAX_DIFF:
            increasing = False
            decreasing = False
            break

        if curr > next:
            decreasing = True
        elif curr < next:
            increasing = True
        elif curr == next:  # Must go up or down
            increasing = False
            decreasing = False
            break

        if increasing and decreasing:  # No oscillation allowed
            increasing = False
            decreasing = False
            break

    return increasing or decreasing


def solve_part1(filename: String) -> Int:
    base_string = load_data(filename)

    var n_safe: Int = 0
    for i in range(len(base_string)):
        report = base_string[i]
        if report == "":
            continue

        levels_arr = make_levels_arr(report)

        if check_safety(levels_arr):
            n_safe += 1

    return n_safe


def solve_part2(filename: String) -> Int:
    base_string = load_data(filename)

    var n_safe: Int = 0
    for i in range(len(base_string)):
        report = base_string[i]
        if report == "":
            continue
        levels_arr = make_levels_arr(report)

        if check_safety(levels_arr):
            n_safe += 1
        else:  # Implement problem dampener
            for i in range(len(levels_arr)):
                if i == 0:  # zeroeth element cannot contribute to problem?
                    temp_arr = levels_arr[i + 1 :]
                elif i + 1 < len(levels_arr):  # remove the ith element
                    temp_arr = levels_arr[:i] + levels_arr[i + 1 :]
                else:  # remove the last element
                    temp_arr = levels_arr[:-1]
                if check_safety(temp_arr):
                    n_safe += 1
                    break

    return n_safe


def main():
    print("Hello, Day 2!")

    var n_safe = solve_part1("input.txt")
    print("Number of safe reports: ", n_safe)

    n_safe = solve_part2("input.txt")
    print("Number of safe reports: ", n_safe)
