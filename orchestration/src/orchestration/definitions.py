from pathlib import Path

from dagster import Definitions, load_from_defs_folder
from src.orchestration.defs.assets.airbyte import airbyte_assets
from dagster_airbyte import AirbyteResource


defs=Definitions(
    assets=[*airbyte_assets],
    resources={
        "airbyte": AirbyteResource(
            host="localhost",
            port="8000",
        )
    }
)