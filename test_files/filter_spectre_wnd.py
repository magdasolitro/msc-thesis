import numpy as np
import matplotlib.pyplot as plt
import csv

if __name__ == "__main__":
    path_ofb = 'output_nosymbolic_FastSpec_wider/window50_overlap49/AES_OFB_confidence_vals.csv'
    conf_ofb = []
    vulnerable_wnd = []

    with open(path_ofb, 'r') as fp:
        csv_file = csv.reader(fp)

        i = 0
        for line in csv_file:
            conf_ofb.append(line[1])

        # discard column names
        conf_ofb = conf_ofb[1:]

        # convert string to float
        for i in range(len(conf_ofb)):
            conf_ofb[i] = float(conf_ofb[i])

            # keep track of windows that are likely to be vulnerable to Spectre
            if conf_ofb[i] > 0.8:
                vulnerable_wnd.append(i)

        print("Vulnerable windows' indexes:")
        print(vulnerable_wnd)

    path_wnd = 'output_nosymbolic_FastSpec_wider/window50_overlap49_tsv/testing_AES_OFB_nosymbolic.tsv'
    path_selected_wnd = 'output_nosymbolic_FastSpec_wider/window50_overlap49_tsv/vulnerable_windows.txt'

    with open(path_wnd, 'r') as fp1, open(path_selected_wnd, 'w') as fp2:
        content = fp1.readlines()
        for i in range(len(vulnerable_wnd)):
            line = content[vulnerable_wnd[i]-1]
            fp2.write(line)
