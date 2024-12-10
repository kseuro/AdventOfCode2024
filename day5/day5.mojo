from pathlib import Path
from collections import Dict, Set


def validate(pages: List[String], rules: Dict[String, List[String]]) -> Int:
    var valid: Bool = True
    for j in range(1, len(pages)):
        rule_set = Set[String]()
        key = pages[j]
        for i in range(len(rules[key])):
            rule = rules[key][i]
            rule_set.add(rule)

        validation_set = Set[String]()
        for i in range(j):
            validation_set.add(pages[i])

        if len(validation_set.intersection(rule_set)) > 0:
            valid = False
    return valid


def main():
    data = Path("input.txt").read_text().split("\n")

    var rules = Dict[String, List[String]]()
    rules["13"] = List[String]()  # No 13 in the test set :-(
    var pages = List[List[String]]()

    for i in range(len(data)):
        elem = data[i]
        if "|" in elem:
            rule = elem.split("|")
            if rule[0] not in rules:
                rules[rule[0]] = List[String]()
            rules[rule[0]].append(rule[1])
        elif "," in elem:
            pages.append(elem.split(","))

    var total: Int = 0
    for p in range(len(pages)):
        if validate(pages[p], rules):
            total += int(pages[p][len(pages[p]) // 2])
        else:
            pass
            # TODO: Solve part 2

    print(total)
