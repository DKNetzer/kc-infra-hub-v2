# Knowledge Catalog - Infrastructure Hub (`kc-infra-hub-v2`)

This repository is responsible for managing the foundational Google Cloud Dataplex (Knowledge Catalog) blueprints via Terraform. It acts as the "House" where future metadata entries will live.

## 📌 Overview
In our decoupled GitOps Data Governance architecture, this repository manages stateful infrastructure templates that rarely change. It provisions:
* **Entry Groups:** The logical containers for metadata entries (e.g., `metadata-engine-group`).
* **Entry Types:** Definitions of the data assets being cataloged (e.g., `table`).
* **Aspect Types:** The structural metadata templates with strict JSON schemas (e.g., `business-rule-v1`).

**⚠️ CRITICAL:** The resources in this repository MUST be deployed and exist in Google Cloud *before* the Metadata Engine attempts to attach data to them.

## 🚀 Deployment Instructions

This repository is typically deployed manually by a Cloud Architect or via a dedicated foundational CI/CD pipeline.

1.  **Initialize Terraform:**
    ```bash
    terraform init
    ```
2.  **Review the Plan:**
    ```bash
    terraform plan
    ```
3.  **Apply the Infrastructure:**
    ```bash
    terraform apply
    ```

## 📂 Repository Structure
* `main.tf`: Contains the Dataplex Entry Group, Entry Type, and Aspect Type resources.
* `variables.tf`: Defines project IDs and target deployment locations.
