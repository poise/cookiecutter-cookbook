#!python
import os

from binaryornot.check import is_binary


def main():
    root_path = os.getcwd()
    for dirpath, dirnames, filenames in os.walk(root_path):
        for filename in filenames:
            path = os.path.join(dirpath, filename)
            if not is_binary(path):
                fd = open(path, 'a+b')
                fd.seek(-1, os.SEEK_END)
                if not fd.read(1) == '\n':
                    fd.seek(0, os.SEEK_END)
                    fd.write('\n')


if __name__ == '__main__':
    main()
