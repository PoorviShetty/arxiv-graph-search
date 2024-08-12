# Building search for ArXiv data stored in Graph DB

Playing around with Neo4J - my first foray into graph databases!

The dataset is from [Kaggle](https://www.kaggle.com/datasets/Cornell-University/arxiv).

### Basic Overview

1. Load data from Kaggle. You'll need to split the data out into various nodes (and CSVs) to load to Neo4J and map out the relationships. Since it's a huge file and my PC can't handle a lot, I processed the files in batches.
2. Load CSVs (from the `import` folder) to Neo4J with the queries after cleaning the CSV files. Be amazed with the graph visualisations.
3. Basic keyword search using TF-IDF
