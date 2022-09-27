import scipy.stats
import matplotlib.pyplot as plt
import csv

if __name__ == "__main__":
    path_cbc = 'output_nosymbolic_FastSpec_wider/window50_overlap49/AES_CBC_confidence_vals.csv'
    path_ctr = 'output_nosymbolic_FastSpec_wider/window50_overlap49/AES_CTR_confidence_vals.csv'
    path_ofb = 'output_nosymbolic_FastSpec_wider/window50_overlap49/AES_OFB_confidence_vals.csv'

    conf_cbc = []
    conf_ctr = []
    conf_ofb = []

    with open(path_cbc, 'r') as fp:
        csv_file = csv.reader(fp)

        i = 0
        for line in csv_file:
            conf_cbc.append(line[1])

        #conf_cbc = conf_cbc[1:11914]

        # TO SHIFT THE PLOT, UNCOMMENT THE NEXT LINE
        conf_cbc = conf_cbc[50:11963]

        for i in range(len(conf_cbc)):
            conf_cbc[i] = float(conf_cbc[i])

    with open(path_ctr, 'r') as fp:
        csv_file = csv.reader(fp)

        i = 0
        for line in csv_file:
            conf_ctr.append(line[1])

        conf_ctr = conf_ctr[1:11914]

        for i in range(len(conf_ctr)):
            conf_ctr[i] = float(conf_ctr[i])

    with open(path_ofb, 'r') as fp:
        csv_file = csv.reader(fp)

        i = 0
        for line in csv_file:
            conf_ofb.append(line[1])

        conf_ofb = conf_ofb[1:]

        for i in range(len(conf_ofb)):
            conf_ofb[i] = float(conf_ofb[i])


    # PEARSON'S CORRELATION
    pearson_cbc_ctr = scipy.stats.pearsonr(conf_cbc, conf_ctr)[0]
    print(pearson_cbc_ctr)

    pearson_cbc_ofb = scipy.stats.pearsonr(conf_cbc, conf_ofb)[0]
    print(pearson_cbc_ofb)

    pearson_ctr_ofb = scipy.stats.pearsonr(conf_ctr, conf_ofb)[0]
    print(pearson_ctr_ofb)

    # COMPARE AES-CBC AND AES-CTR CONFIDENCE VALUES
    plt.plot(conf_cbc, linewidth=0.5, label='AES-CBC')
    plt.plot(conf_ctr, color='red', linewidth=0.5, label='AES-CTR')
    legend = plt.legend(loc='upper center')
    plt.show()

    # COMPARE AES-CTR AND AES-OFB CONFIDENCE VALUES
    # plt.plot(conf_ctr, linewidth=0.5, label='AES-CTR')
    # plt.plot(conf_ofb, color='red', linewidth=0.5, label='AES-OFB')
    # legend = plt.legend(loc='upper center')
    # plt.show()

    # COMPARE AES-CBC AND AES-OFB CONFIDENCE VALUES
    # plt.plot(conf_cbc, linewidth=0.5, label='AES-CBC')
    # plt.plot(conf_ofb, color='red', linewidth=0.5, label='AES-OFB')
    # legend = plt.legend(loc='upper center')
    # plt.show()
