
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///authors_cleaned.csv" AS row RETURN row',
  'CREATE (a:Author {id: row.author_id, name: row.name})',
  {batchSize: 1000, parallel: true}
)

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///papers_cleaned.csv" AS row RETURN row',
  'CREATE (p:Paper {id: row.paper_id, title: row.title, abstract: row.abstract, doi: row.doi})',
  {batchSize: 1000, parallel: true}
)

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///categories_cleaned.csv" AS row RETURN row',
  'CREATE (c:Category {id: row.category_id, name: row.name})',
  {batchSize: 1000, parallel: true}
)

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///authorship_cleaned.csv" AS row RETURN row',
  'MATCH (a:Author {id: row.author_id})
   MATCH (p:Paper {id: row.paper_id})
   MERGE (a)-[:AUTHORED]->(p)',
  {batchSize: 1000, parallel: true}
);

CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "file:///categorization_cleaned.csv" AS row RETURN row',
  'MATCH (p:Paper {id: row.paper_id})
   MATCH (c:Category {id: row.category_id})
   MERGE (p)-[:BELONGS_TO]->(c)',
  {batchSize: 1000, parallel: true}
);

