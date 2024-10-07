import sys
import subprocess
import numpy as np
import random

seeds = []
for i in range(0,52):
	n = random.randint(3000, 4000)
	seeds.append(n)

#seeds = [12345, 23451, 34512, 45123, 51234, 67890, 6789, 90678, 89067, 78906]

#seeds = [12345, 23451]

#np.save('/mnt/raid/data/cmetzner/Layer23/EI-Balance/Default/seeds.npy',seeds)

for s in seeds:
	cmd = ['mpiexec', '-n', '128', 'python', './circuit_ketamine.py', str(s)]
	print(cmd)
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
	for line in p.stdout:
		print(line)
	p.wait()
	print(p.returncode)
	
