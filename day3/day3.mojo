from pathlib import Path


def load_data(filename: String) -> List[String]:
    file = Path(filename)
    file_content = file.read_text()
    base_string = file_content.split("\n")
    return base_string


def print_basestring(base_string: List[String]) -> None:
    print(len(base_string))
    for i in range(len(base_string)):
        print(base_string[i])


def solve_part1(filename: String) -> Int:
    base_string = load_data(filename)

    var total: Int = 0
    for i in range(len(base_string)):
        mul_instructions = base_string[i].split("mul")

        for mul in mul_instructions:
            instr = mul[]

            if len(instr) >= 4 and instr[0] == "(":
                var valid_instruction: Bool = True
                var l_num: String = ""
                var r_num: String = ""
                var left_side: Bool = True
                var closing_paren: Bool = False

                for i in range(1, len(instr)):
                    if not valid_instruction:
                        break

                    if instr[i] == ",":
                        left_side = False
                        continue

                    if left_side:
                        if instr[i].isdigit():
                            l_num += instr[i]
                        else:
                            valid_instruction = False
                    else:
                        if instr[i].isdigit():
                            r_num += instr[i]
                        elif instr[i] == ")":
                            closing_paren = True
                        else:
                            valid_instruction = False

                    if closing_paren:
                        break

                if valid_instruction:
                    total += int(l_num) * int(r_num)
    return total


def main():
    print("Hello, Day 3!")

    total = solve_part1("input.txt")
    print("Total:", total)
