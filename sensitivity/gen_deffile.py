# gen_deffile.py
# Drew Levin
# August 30, 2015
#
# Generates a .def file for model definition in CyCells.  Takes in a list of
# parameters and a file name.  The file creation is a side effect.

# parameters is a dictionary of parameter values with keys as defined in
# hypercube.py

import os

def gen_file(params, filename, is_large, is_avian):

  # Get OS compatible new line string
#  eof = os.linsep
  eof = '\n'

  # Percent of lung represented
  p_in = 0.005625 if is_large else 0.0025
  p_out = 1.0 - p_in


  # Chemokine onset time is 8h for IP10, 16h for RANTES
  chem_onset = 56700 if is_avian else 28800

  # Write the output to the string
  output = ''

  output += '#DefFormat 8' + eof
  output += eof
  output += 'cell_names { healthy infected expressing dead apoptosis t_found t_search t_circ oracle }' + eof
  output += eof
  output += 'molecule_type virus {' + eof
  output += '  diffusion_rate ' + str(params['v_dif']) + eof
  output += '  decay_until ' + str(params['v_decay']/86400.0) + ' 345600' + eof
  output += '  decay_rate ' + str(params['v_decay']*params['igm']/86400.0) + eof
  output += '}' + eof
  output += eof
  output += 'molecule_type chemokine {' + eof
  output += '  diffusion_rate ' + str(params['c_dif'])  + eof
  output += '  decay_rate ' + str(params['c_decay']) + eof
  output += '}' + eof
  output += eof
  output += 'cell_type healthy {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute apop_age fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute infection_age gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + ' gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + eof
  output += '  attribute sense_tcell fixed 0 fixed 0' + eof
  output += eof
  output += '  sense virusC copy_conc virus' + eof
  output += eof
  output += '  action infect virus infected calc_prob_single linear virusC ' + str(1.044e15/(60.0*params['v_inf']))+ ' 0' + eof
  output += '}' + eof
  output += eof
  output += 'cell_type infected {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute apop_age fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute infection_age gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + ' gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + eof
  output += '  attribute sense_tcell fixed 0 fixed 0' + eof
  output += eof
  output += '  process age update fixed 1' + eof
  output += eof
  output += '  action secrete_fixed chemokine ' + str(params['c_sec']) + ' gte age ' + str(chem_onset) + eof
  output += '  action change expressing gte_var age infection_age' + eof
  output += '}' + eof
  output += eof
  output += 'cell_type expressing {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed ' + str(params['t_inc']*3600) + ' fixed ' + str(params['t_inc']*3600) + eof
  output += '  attribute apop_age fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute infection_age gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + ' gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + eof
  output += '  attribute sense_tcell fixed 0 fixed 0' + eof
  output += eof
  output += '  sense sense_tcell cognate t_found 12' + eof
  output += eof
  output += '  process age update fixed 1' + eof
  output += eof
  output += '  action secrete_fixed chemokine ' + str(params['c_sec']) + ' gte age ' + str(chem_onset) + eof
  output += '  action secrete_fixed virus ' + str(params['v_sec']) + ' always' + eof
  output += eof
  output += '  action change apoptosis composite gte sense_tcell 1 fixed_single ' + str(1.0/(params['t_kill']*60.0)) + eof
  output += '  action change dead gte age ' + str(params['t_inc']*3600 + params['t_exp']*60) + eof
  output += '}' + eof
  output += eof
  output += 'cell_type dead {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute apop_age fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute infection_age gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + ' gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + eof
  output += '  attribute sense_tcell fixed 0 fixed 0' + eof
  output += '}' + eof
  output += eof
  output += 'cell_type apoptosis {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed ' + str(params['t_inc']*3600) + ' fixed ' + str(params['t_inc']*3600) + eof
  output += '  attribute apop_age fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute infection_age gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + ' gaussian ' + str(params['t_inc']*3600) + ' ' + str(params['t_inc']*360) + eof
  output += '  attribute sense_tcell fixed 0 fixed 0' + eof
  output += eof
  output += '  process age update fixed 1' + eof
  output += '  process apop_age update fixed 1' + eof
  output += eof
  output += '  action secrete_fixed chemokine ' + str(params['c_sec']) + ' gte age ' + str(chem_onset) + eof
  output += '  action secrete_fixed virus ' + str(params['v_sec']) + ' always' + eof
  output += '  action change dead or gte apop_age ' + str(params['t_apop']*3600.0) + ' gte age ' + str(params['t_inc']*3600 + params['t_exp']*60) + eof
  output += '}' + eof
  output += eof
  output += 'cell_type t_found {' + eof
  output += '  radius 5' + eof
  output += '  speed ' + str(params['speed']/60.0) + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute inflammationC fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute p uniform 0 1 uniform 0 1' + eof
  output += eof
  output += '  sense virusC copy_conc virus' + eof
  output += eof
  output += '  action die fixed_single ' + str(1.0/(params['foi_age']*60.0)) + eof
  output += '  action move_chem chemokine 1.66e-19 always' + eof
  output += '}' + eof
  output += eof
  output += 'cell_type t_search {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute inflammationC fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute p uniform 0 1 uniform 0 1' + eof
  output += eof
  output += '  sense inflammationC copy_conc chemokine' + eof
  output += eof
  output += '  action die fixed_single ' + str(1.0/(86400*params['circ_age'])) + eof
  output += '  action change t_circ lte inflammationC 1.66e-19' + eof
  output += '  action change t_found gte inflammationC 1.66e-19' + eof
  output += '}' + eof
  output += eof
  output += 'cell_type t_circ {' + eof
  output += '  radius 5' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += '  attribute inflammationC fixed 0 fixed 0' + eof
  output += '  attribute virusC fixed 0 fixed 0' + eof
  output += '  attribute p uniform 0 1 uniform 0 1' + eof
  output += eof
  output += '  process age update fixed 1' + eof
  output += eof
  output += '  action die fixed_single ' + str(1.0/(86400.*params['circ_age'])) + eof
  output += '  action recirculate2D t_search init composite gte age ' + str(params['t_circ']) + ' lte p ' + str(p_in) + eof
  output += '  action recirculate2D0 t_circ init composite gte age ' + str(params['t_circ']) + ' gte p ' + str(p_in) + eof
  output += '}'
  output += eof
  output += 'cell_type oracle {' + eof
  output += '  radius 1' + eof
  output += eof
  output += '  attribute age fixed 0 fixed 0' + eof
  output += eof
  output += '  process age update fixed 1' + eof
  output += eof
  output += '  action admit_rand2D t_search init fixed ' + str(p_in*params['sigma']/3600.0) + ' gte age 432000' + eof
  output += '  action admit_mult t_circ init fixed ' + str(p_out*params['sigma']/3600.0) + ' gte age 432000' + eof
  output += '}' + eof

  # Write the output string to the given file
  with open(filename, 'w') as f:
    f.write(output)
