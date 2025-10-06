import subprocess
from pathlib import Path
import sys

index = open("index.html", "w")

index.write("""
<!DOCTYPE html>
<html><head>""")

remote = len(sys.argv) >= 2 and sys.argv[1] == "remote"
if remote:
    index.write("<base href=\"/Cours/\" />")

index.write("<link href=\"style.css\" rel=\"stylesheet\" />")

index.write("</head><body><div class=\"page\">")

index.write("<h1>Notes de cours</h1>")

index.write("<div class=\"list\">")

def compile_dir(path: Path):
    dirs = []
    typsts = []
    for child in path.iterdir():
        if child.is_dir():
            dirs.append(child)
        elif child.is_file(): 
            if child.name.endswith(".typst"):
                typsts.append((".typst", child))
            elif child.name.endswith(".typ"):
                typsts.append((".typ", child))

    typsts.sort(key=lambda x: x[1].name)
    dirs.sort(key=lambda x: x.name)

    def compile_child(child, display_name):
        fixed_name = child.as_posix().replace('/', '_').replace('"', '_')
        index.write(f"<li><a href=\"rendered/{fixed_name}.pdf\">{display_name}</a></li>\n")

        old_md5 = bytes()
        try:
            md5_file = open(f"rendered/{fixed_name}.md5", 'rb')
            old_md5 = md5_file.read()
            md5_file.close()
        except FileNotFoundError:
            old_md5 = bytes()

        new_md5 = subprocess.check_output(["md5sum", child.as_posix()])
        if old_md5 != new_md5:
            md5_file = open(f"rendered/{fixed_name}.md5", "wb")
            md5_file.write(new_md5)
            md5_file.close()

            print("Recompiling", child)
            subprocess.Popen(["typst", "compile", child.as_posix(), f"rendered/{fixed_name}.pdf"])

    if len(typsts) == 1 and len(dirs) == 0:
        _, child = typsts[0]
        compile_child(child, path.name)
    elif len(typsts) > 0 or len(dirs) > 0:
        index.write(f"<li>\n{path.name}\n")
        index.write("<ul>\n")
        for suffix, child in typsts:
            compile_child(child, child.name.removesuffix(suffix))

        for dir in dirs:
            compile_dir(dir)
        index.write("</ul>\n</li>")
    return ()

root_dir = Path(".")

root_dir.joinpath("rendered").mkdir(511, False, True)

index.write("<ol>")

for dir in ["Physique", "Fr"]:
    compile_dir(root_dir.joinpath(dir))

index.write("<ol>")

index.write("</div>")
index.write("<div class=\"footnote\">Arthaud Awen / HX𝑖² / 2024-2025</div>")

index.write("""</div></body></html>""")

index.close()
