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


def evaluate_instruction(instruction: String) -> Int:
    var valid_instruction: Bool = True
    var l_num: String = ""
    var r_num: String = ""
    var left_side: Bool = True
    var closing_paren: Bool = False

    for i in range(1, len(instruction)):
        if not valid_instruction:
            break

        if instruction[i] == ",":
            left_side = False
            continue

        if left_side:
            if instruction[i].isdigit():
                l_num += instruction[i]
            else:
                valid_instruction = False
        else:
            if instruction[i].isdigit():
                r_num += instruction[i]
            elif instruction[i] == ")":
                closing_paren = True
            else:
                valid_instruction = False

        if closing_paren:
            break

    if valid_instruction:
        result = int(l_num) * int(r_num)
        return result
    return 0


def solve_part1(filename: String) -> Int:
    base_string = load_data(filename)

    var total: Int = 0
    for i in range(len(base_string)):
        mul_instructions = base_string[i].split("mul")

        for mul in mul_instructions:
            instr = mul[]

            if len(instr) >= 4 and instr[0] == "(":
                total += evaluate_instruction(instr)

    return total


def solve_part2(filename: String) -> Int:
    base_string = load_data(filename)

    var total: Int = 0
    for i in range(len(base_string)):
        mul_instructions = base_string[i].split("mul")

        var eval: Bool = True  # Evaluation should run until first don't() is reached
        for mul in mul_instructions:
            instr = mul[]
            if len(instr) >= 4 and instr[0] == "(" and eval:
                total += evaluate_instruction(instr)

            if "don't()" in instr:
                eval = False
            elif "do()" in instr:
                eval = True

    return total


def main():
    print("Hello, Day 3!")

    # total = solve_part1("input.txt")
    # print("Total:", total)

    total = solve_part2("input.txt")
    print("Total:", total)
