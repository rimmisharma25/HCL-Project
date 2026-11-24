import pandas as pd

data = pd.read_csv("../data/expenses.csv")

data.drop_duplicates(inplace=True)

data.dropna(inplace=True)

print(data)
