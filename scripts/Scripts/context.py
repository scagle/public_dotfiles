import os
import glob 
import argparse
from dataclasses import dataclass

@dataclass
def File:
    preview: tuple = "`head -n 100 {}`"

@dataclass
def Directory:
    preview: str = "`tree -L 2 {}`"

@dataclass
def GitDirectory:
    preview: str = "{branch}"
    
def FZFPath():
    def __init__(self, path, preview=None):
        self.path = path
        self.type = self.get_type(path)
        if preview is not None:
            self.type.preview = preview

    @staticmethod
    def get_path(path):
        if os.path.isfile(path):
            return File()
        if os.path.isdir(path):
            if 
            return Directory()


def _parse_args():
    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionFormatter,
                                     description="\"CD Common\", a utility to help get you navigate projects")
    parser.add_argument("paths",
                        help="Path to file to grab context of. (Can be expanded)",
                        nargs="+")

    parser.add_argument("-p",
                        "--preview"
                        help="String specifying preview format of file")

def expand_paths(paths):
    expanded_paths = 
    for path in paths:    
        expanded_paths.update(glob.glob(path)) 
    return expanded_paths

def main():
    args = _parse_args()
    fzf_paths = [FZFPath(path, args.preview) for path in expand_paths(args.paths)]

if __name__ == "__main__":
    main()
