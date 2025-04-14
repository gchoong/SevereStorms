from diagrams import Cluster, Diagram
from diagrams.custom import Custom
from diagrams.onprem.iac import Terraform
from diagrams.onprem.container import Docker
from diagrams.onprem.analytics import Dbt
from diagrams.gcp.analytics import BigQuery
from diagrams.gcp.storage import GCS

with Diagram("", show=True, filename="modern_data_stack_complete"):

    # Public BigQuery dataset
    public_bq = BigQuery("BigQuery Public Dataset")

    with Cluster("Docker Compose"):
        docker = Docker("Docker")

        with Cluster("Terraform (IaC)"):
            terraform = Terraform("Terraform")

            with Cluster("Kestra Orchestration"):
                kestra = Custom("Kestra", "Images/Kestra Logo.png")
                dbt = Dbt("dbt")

            with Cluster("GCP"):
                cloud_storage = GCS("Cloud Storage")
                bigquery = BigQuery("BigQuery")

        docker >> terraform

    # External dataset flows into Kestra
    public_bq >> kestra

    # Main data pipeline
    kestra >> cloud_storage
    cloud_storage >> dbt >> bigquery
    bigquery >> Custom("Looker Studio", "Images/looker-icon-svgrepo-com.png")
