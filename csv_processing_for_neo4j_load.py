import pandas as pd
import csv

input_file = 'papers.csv'
output_file = 'papers_cleaned.csv'

df = pd.read_csv(input_file, dtype=str, quoting=csv.QUOTE_ALL)

def clean_quotes(value):
    if isinstance(value, str):
        value = value.replace('"', '').replace("'", "")
        value = value.replace('\\', '')
    return value

df = df.applymap(clean_quotes)

df = df.drop_duplicates()

df.to_csv(output_file, index=False, quoting=csv.QUOTE_ALL, escapechar='\\')