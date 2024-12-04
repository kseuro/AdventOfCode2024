from pathlib import Path


def solve_part1(filename: String) -> Int:
    file = Path(filename)
    file_content = file.read_text()
    base_string = file_content.split("\n")

    var min_diff = 1
    var max_diff = 3
    var n_safe: Int = 0
    for i in range(len(base_string)):
        report = base_string[i]
        if report == "":
            continue

        var levels = report.split(" ")
        # Ensure that the levels are either all increasing or decreasing
        # Any two adjacent levels must differ by at least one and at most three
        var increasing: Bool = False
        var decreasing: Bool = False
        for j in range(len(levels)):
            if j + 1 == len(levels):  # Don't go off end
                break

            curr = int(levels[j])
            next = int(levels[j + 1])
            diff = abs(curr - next)

            if diff < min_diff or diff > max_diff:
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

        if increasing or decreasing:
            n_safe += 1

    return n_safe


def main():
    print("Hello, Day 2!")

    n_safe = solve_part1("input.txt")
    print("Number of safe reports: ", n_safe)
