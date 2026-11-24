import pandas as pd

data = pd.read_csv("../data/expenses.csv")

print("Expense Data")
print(data)

print("\n")

total_expense = data["Amount"].sum()

print("Total Expense :", total_expense)

print("\n")

category_expense = data.groupby("Category")["Amount"].sum()

print(category_expense)


budget = 5000

if total_expense > budget:
    print("\nBudget Breach Detected")
else:
    print("\nWithin Budget")