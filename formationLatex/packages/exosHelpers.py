def find_source(f):
  with open(f,"r") as fi:
    id = []
    for ln in fi:
        if ln.startswith("%@ src:"):
            id.append(ln[2:])
  if len(id) != 0:
    return id[0].split(": ",2)[1]
  else:
    return ''

print(find_source("/home/sylcha/yoctomath/work/mathlycee/ressources/terminale_techno/activites/suites/TleActSuites01.tex"))