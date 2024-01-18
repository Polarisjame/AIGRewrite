import argparse
import os
from datetime import datetime

prepro_dir = '../proc_data/'

def logging(s):
    print(datetime.now(), s)

def get_opt():
    parser = argparse.ArgumentParser()

    # save path of proposed aig
    parser.add_argument('--aig_save', type=str, default=prepro_dir)

    # Run_Mode
    parser.add_argument('--mode', type=str) # novel/abc
    parser.add_argument('--src', type=str) # case/mtm/epfl
    parser.add_argument('--mtm', type=int) # 0/1
    parser.add_argument('--double', type=int) # 0/1
    parser.add_argument('--cmd', type=str) # rewrite/refactor/balance/rfresyn/resyn2
    parser.add_argument('--act', help="syn: do logic optimization/cec: do CEC check/verilog: do verilog2AIG", type=str) # syn/cec/verilog
    parser.add_argument('--trw', type=int) # 0/1
    parser.add_argument('--trf', type=int) # 0/1

    return parser.parse_args()