from dagster_airbyte import AirbyteWorkspace, build_airbyte_assets_definitions

import dagster as dg

# Connect to your OSS Airbyte instance
airbyte_workspace = AirbyteWorkspace(
    rest_api_base_url="http://localhost:8000/api/public/v1",
    configuration_api_base_url="http://localhost:8000/api/v1",
    workspace_id=dg.EnvVar("AIRBYTE_WORKSPACE_ID"),
    # If using basic auth, include username and password:
    client_id=dg.EnvVar("AIRBYTE_CLIENT_ID"),
    client_secret=dg.EnvVar("AIRBYTE_CLIENT_SECRET"),
)

# Load all assets from your Airbyte workspace
airbyte_assets = build_airbyte_assets_definitions(workspace=airbyte_workspace)

defs = dg.Definitions(
    assets=airbyte_assets,
    resources={"airbyte": airbyte_workspace},
)