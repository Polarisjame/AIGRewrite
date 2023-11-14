import argparse
import os

prepro_dir = '../proc_data/'

def get_opt():
    parser = argparse.ArgumentParser()

    # save path of proposed aig
    parser.add_argument('--aig_save', type=str, default=prepro_dir)

    # Run_Mode
    parser.add_argument('--mode', type=str)
    parser.add_argument('--src', type=str)
    parser.add_argument('--mtm', type=int)
    parser.add_argument('--double', type=int)
    parser.add_argument('--cmd', type=str)

    return parser.parse_args()