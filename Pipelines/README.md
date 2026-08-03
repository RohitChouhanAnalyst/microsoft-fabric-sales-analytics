# Fabric Pipeline

This pipeline automates the complete data flow from the source dataset to the final warehouse.

## Workflow

1. Copy raw sales CSV from GitHub
2. Load data into the Lakehouse
3. Run notebook to create Bronze Delta table
4. Transform Bronze to Silver
5. Load Silver data into the Fabric Warehouse

Files included:

- PL_sales.json → Pipeline export
- manifest.json → Pipeline metadata
- pipeline.png → Pipeline screenshot
