from pathlib import Path
from collections import Dict, Set


def list_to_set(l: List[String]) -> Set[String]:
    _set = Set[String]()
    for i in range(len(l)):
        _set.add(l[i])
    return _set^


def validate(pages: List[String], rules: Dict[String, List[String]]) -> Int:
    var valid: Bool = True
    for j in range(1, len(pages)):
        key = pages[j]

        var rule_set = list_to_set(rules[key])
        var validation_set = list_to_set(pages[:j])

        if len(validation_set.intersection(rule_set)) > 0:
            valid = False

    return valid


def correct(
    owned pages: List[String], rules: Dict[String, List[String]]
) -> Int:
    var fixed = List[String]()

    while len(pages) != 0:
        for i in range(len(pages)):
            current_list = pages
            item = current_list.pop(i)

            var current_set = list_to_set(current_list)
            var rule_set = list_to_set(rules[item])

            if len(rule_set.intersection(current_set)) == 0:
                fixed.insert(0, item)
                pages = current_list
                break

    return int(fixed[len(fixed) // 2])


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
    var total2: Int = 0
    for p in range(len(pages)):
        if validate(pages[p], rules):
            total += int(pages[p][len(pages[p]) // 2])
        else:
            total2 += correct(pages[p], rules)

    print(total)
    print(total2)
