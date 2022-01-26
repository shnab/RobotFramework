import csv


def read_csv_file(filename):
    # data is here list
    data = []
    # eger burada rb problem cikarirsa tamamen silebilriz.
    with open(filename, 'rb') as csvfile:
        reader = csv.reader(csvfile)
        # for loop icine koyduk
        for row in reader:
            data.append(row)
    return data