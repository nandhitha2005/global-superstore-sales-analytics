import pandas as pd

# Load dataset
df = pd.read_csv(
    r"D:\New folder\global-superstore-sales-analytics\Dataset\global_superstore_cleaned.csv",
    encoding="latin1"
)

# Display first 5 rows
print("First 5 Rows:")
print(df.head())

# Check missing values
print("\nMissing Values:")
print(df.isnull().sum())

# Remove duplicates
df.drop_duplicates(inplace=True)

# Dataset shape
print("\nDataset Shape:")
print(df.shape)

# Save cleaned output
df.to_csv(
    r"D:\New folder\global-superstore-sales-analytics\Dataset\cleaned_output.csv",
    index=False
)

print("\nData cleaning completed successfully")