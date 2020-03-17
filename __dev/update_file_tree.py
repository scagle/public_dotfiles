import argparse
import re 


def get_name(file_path):
    tokens = file_path.split("/")
    if len(tokens) <= 2:
        raise Exception("Error: This should never happen. What have you DONE!?")
    name = tokens[len(tokens)-2]
    print(file_path, name)

    title_match = re.search("^[A-Z]", name)

    lower_name = name.lower()
    plus_match = re.search("_plus_?", lower_name)
    sub_match = re.search("_sub_?", lower_name)
    init_match = re.search("_init_?", lower_name)
    env_match = re.search("^_[A-Za-z0-9]+", lower_name)
    no_stow_match = re.search("^__[A-Za-z0-9]+", lower_name)

    if title_match is not None:
        name = name + " (Root)"
    if plus_match is not None:
        name = name.replace(plus_match[0], "") + " (Contains Subpackage(s))"
    if sub_match is not None:
        name = name.replace(sub_match[0], "") + " (Subpackage)"
    if init_match is not None:
        name = name.replace(init_match[0], "") + " (Needs Initialization)"
    if env_match is not None:
        name = name[1:] + " (Environment Specific)"
    if no_stow_match is not None:
        name = name[2:] + " (No-Stow)"

    return name

def update_file_name(file_path):
    name = get_name(file_path)
    lines = []
    with open(file_path, "r") as file_obj:
        lines = file_obj.readlines() 
        if lines:
            lines[0] = f'# {name}\n'
        else:
            lines.append(f'# {name}\n')
            lines.append('\n')

    with open(file_path, "w") as file_obj:
        file_obj.writelines(lines)

def update_file_tree(file_path, tree_text):
    lines = []
    with open(file_path, "r") as file_obj:
        text = file_obj.read()
        head_pattern = re.compile("\`\`\`tree")
        tail_pattern = re.compile("\`\`\`\n")
        head_match = head_pattern.search(text)
        found = False
        if head_match:
            tail_match = tail_pattern.search(text, head_match.end())
            if tail_match:
                found = True
                old_section = text[head_match.start():tail_match.end()]
                new_section = f'{head_match[0]}\n{tree_text}\n{tail_match[0]}'
                lines = text.replace(old_section, new_section).splitlines(True)

        if not found:
            # Assume theres just a header
            lines = text.split("\n")
            lines.append("\n")
            lines.append("```tree\n")
            lines.append(tree_text + "\n")
            lines.append("```\n")

    with open(file_path, "w") as file_obj:
        file_obj.writelines(lines)

def _parse_args(in_args):
    parser = argparse.ArgumentParser(description='Update the file tree for README.md files.')
    parser.add_argument("file_path",
                        type=str,
                        help="The path to the README.md file with a ```tree\\n``` pattern.")
    parser.add_argument("tree_text",
                        type=str,
                        help="The tree text to replace the tree entry with.")

    return parser.parse_args() 


def main(in_args):
    args = _parse_args(in_args)
    update_file_name(args.file_path)
    update_file_tree(args.file_path, args.tree_text)
    print(f"Updated '{args.file_path}'")


if __name__ == "__main__":
    main([])
