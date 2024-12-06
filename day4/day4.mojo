from pathlib import Path

alias width_offset: Int = 3
alias height_offset: Int = 4
alias FWD = "XMAS"
alias BACK = "SAMX"


def check(entry: String) -> Bool:
    return entry == FWD or entry == BACK


def check2(entry: String) -> Bool:
    return entry == String(FWD)[1:] or entry == String(BACK)[:-1]


def main():
    data = Path("input.txt").read_text().split("\n")

    width = len(data[0])
    height = len(data)

    total_part1 = 0
    total_part2 = 0
    entries = List[String]()

    # Search left and right
    for h in range(height):
        for w in range(width - width_offset):
            entries.append(data[h][w : w + 4])

    # Search up and down
    for h in range(height - width_offset):
        for w in range(width):
            entries.append(
                data[h][w] + data[h + 1][w] + data[h + 2][w] + data[h + 3][w]
            )

    # Diagonal search
    for h in range(height - width_offset):
        for w in range(width - width_offset):
            entries.append(
                (
                    data[h + 3][w]
                    + data[h + 2][w + 1]
                    + data[h + 1][w + 2]
                    + data[h][w + 3]
                )
            )  # Diagonal Up
            entries.append(
                (
                    data[h][w]
                    + data[h + 1][w + 1]
                    + data[h + 2][w + 2]
                    + data[h + 3][w + 3]
                )
            )  # Diagonal Down

    for entry in entries:
        total_part1 += check(entry[])

    for h in range(height - width_offset + 1):
        for w in range(width - width_offset + 1):
            if check2(
                data[h][w] + data[h + 1][w + 1] + data[h + 2][w + 2]
            ) and check2(data[h + 2][w] + data[h + 1][w + 1] + data[h][w + 2]):
                total_part2 += 1

    print("Total Part 1:", total_part1)
    print("Total Part 2:", total_part2)
