# gen_deffile.py
# Drew Levin
# September 2 2015
#
# Automates the evaluation of many CyCells models on a machine.
# Requires in the same directory:
#   1) The CyCells executable
#   2) gen_deffile.py
#   3) hypercube text files
#   4) immune.init
#
# Takes 5 command line arguments in this order:
# 1: strain letter (a, s, p)
# 2: replicate # (1, 2, 3)
# 3: number of cores to use (model evals to run at once)
# 4: start row of hypercube file (1 indexed)
# 5: end row of hypercube file (1 indexed)

# Python Dependencies
import csv
import subprocess as sp
import threading
import sys
import os
import socket
import time
import logging as log

# My Dependencies
import gen_deffile as gen

# Generate filename for status log file
log_filename = 'status_' + socket.gethostname() + '.txt'

# Configure the logger
log.basicConfig(
  level = log.INFO,
  filename = log_filename,
  format = '[%(asctime)s] (%(threadName)-10s) %(message)s',
  datefmt = '%m/%d/%Y %I:%M:%S %p'
)
log.getLogger().addHandler(log.StreamHandler())

# Global thread container and lock
threads = []
lock = threading.Lock()

# Global command line argments
strain    = ''
rep       = ''
cores     = 0
row_start = 0
row_end   = 0

# Global value for the next available row
current_row = 0

# Global list of parameters values
parameters = []

# Long form names for file naming purposes
strain_long = {'a': 'avian', 's': 'seasonal', 'p': 'pandemic'}

# Thread-safe function to assign a thread a specific row of the hypercube
def getNextRow():
  global current_row
  with(lock):
    next_row = current_row
    current_row += 1
    return next_row

# Thread functionality, runs CyCells instances until satisfied
def run(i):
  global strain, rep, cores, row_start, row_end, parameters
  while True:
    # Obtain current set of parameters
    row = getNextRow()
    if row > row_end:
      break
    log.info('Starting Row ' + str(row))

    params = dict(zip(parameters[0], map(float, parameters[row])))

    # Generate the CyCells definition file
    filename = '_'.join([strain_long[strain], rep, str(row).zfill(3)])
    gen.gen_file(params, 'def/'+filename+'.def', False, strain == 'a')

    # Run CyCells, check to make sure the program exits normally
    try:
      with open('output/'+filename+'.out', 'w+') as f:
        sp.check_call(
  	  ['nice', '-n', '5', './CyCells',
           '-seed', rep,
           '-def', 'def/'+filename+'.def',
           '-init', 'immune.init',
           '-dur', '864000',
           '-step', '6',
	   '-disp', '1000',
           '-hist', 'hist/'+filename+'.hist'
          ], stdout=f, stderr=f)
    except sp.CalledProcessError:
      log.error(filename +' failed to complete')
    except OSError:
      log.error('CyCells not found')
    else:
      log.info(filename + ' completed successfully')

  log.info('Exiting')



# Script wrapper
def main():
  global strain, rep, cores, row_start, row_end, current_row, parameters
  # Get the command line arguments:
  # 1: strain letter ('a', 's', 'p')
  # 2: replicate # (1, 2, 3)
  # 3: number of cores
  # 4: start row
  # 5: end row
  if len(sys.argv) < 6:
    print('Too few arguments')
    print('  python run_cycells.py <strain> <replicate> <cores> <start> <end>')
    sys.exit(1)

  strain    = sys.argv[1]
  rep       = sys.argv[2]
  cores     = int(sys.argv[3])
  row_start = int(sys.argv[4])
  row_end   = int(sys.argv[5])

  current_row = row_start

  # Check to make sure the right files exist
  if not os.path.isfile('CyCells'):
    print('Error: Missing CyCells executable')
    sys.exit(2)
  if not os.path.isfile('gen_deffile.py'):
    print('Error: Missing gen_deffile.py')
    sys.exit(2)
  if not os.path.isfile('immune.init'):
    print('Error: Missing immune.init')
    sys.exit(2)
  if not os.path.isfile(strain_long[strain] + '_hcube.txt'):
    print('Error: Missing hypercube file <strain>_hcube<rep>.txt')
    sys.exit(2)

  # Check for the existance of the 'def', 'output', and 'hist' subdirectories
  if not os.path.isdir('def'):
    log.info('  Creating def directory')
    os.makedirs('def')
  if not os.path.isdir('output'):
    log.info('  Creating output directory')
    os.makedirs('output')
  if not os.path.isdir('hist'):
    log.info('  Creating hist directory')
    os.makedirs('hist')

  # Import the hypercube into a 2D list
  parameters = []
  with open(strain_long[strain] + '_hcube.txt') as f:
    reader = csv.reader(f, delimiter=',')
    for row in reader:
      parameters.append(row)

  # Check to see if row_start and row_end are in range
  if row_start < 1 or row_start > len(parameters):
    print('Error: starting row is out of range')
    sys.exit(3)
  if row_end < row_start or row_end > len(parameters):
    print('Error: ending row is out of range')
    sys.exit(3)

  # Clear the status.txt file (w+ to erase old output)
  with open(log_filename, 'w+') as f:
    f.write('')

  log.info('Initialized')

  # Fire off the threads, each one will handle the synchronous execution of
  # model runs as long as more runs need to be performed.
  for i in range(cores):
    t = threading.Thread(target=run, args=(i,), name='Worker ' + str(i+1))
    threads.append(t)
    t.start()

  # Wait for all child threads to finish
  for i in range(cores):
    threads[i].join()

  log.info('Complete')

main()
