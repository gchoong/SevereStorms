# SevereStorms
Project for dezoomcamp 2025

# Problem Statement 

Severe weather events like tornadoes, hailstorms, and thunderstorms can cause significant damage to property, infrastructure, and human life. Analyzing historical storm event data is essential for improving disaster preparedness, understanding long-term climate trends, and supporting emergency response planning.

The NOAA Storm Events Database provides detailed records of severe weather events across the United States dating back to the 1950s. However, the raw data is distributed across multiple CSV files with varying schemas and data quality, making it difficult to work with in its original format.

This project aims to build a scalable, end-to-end data pipeline that ingests, processes, and stores the NOAA storm data in a clean and queryable format. The goal is to transform the raw datasets into a structure suitable for downstream analytics and visualizations that can support decision-making in meteorology, climate research, and public safety.


# Notes
if wanting to close terraform without closing docker 

docker-compose run --entrypoint "sh" terraform

then run terraform destroy. 
