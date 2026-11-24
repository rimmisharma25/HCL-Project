import pandas as pd

data = pd.read_csv("../data/expenses.csv")

print("Total Rows:", len(data))
print("Missing Values:")
print(data.isnull().sum())

print("\nDuplicate Rows:")
print(data.duplicated().sum())