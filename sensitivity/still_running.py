# still_running.py
# Drew Levin
# September 4, 2015
#
# Scans the supplied status.txt file to return a list of parameter sets still
# being evaluated by run_cycells.py

import sys
import re

running = {}

pattern = re.compile('_._')

if len(sys.argv) < 2:
  print('Too few arguments')
  print('  python still_running.py <file>')
  sys.exit(1)

# Read in the status file as a list of strings (one per row)
with open(sys.argv[1]) as f:
  lines = f.read().splitlines()

# Go through the file, line by line
for row in sorted(lines):
  if "Starting Row" in row:
    start = row.find('Row ')+4
    n = int(row[start:])
    running[n] = (n, row[1:24])
  elif "failed to complete" in row or "completed successfully" in row:
    start = pattern.search(row).start()
    n = int(row[start+3:start+6])
    if n in running:
      del running[n]

for (n, t) in running.values():
  print(t + ' ' + str(n))


