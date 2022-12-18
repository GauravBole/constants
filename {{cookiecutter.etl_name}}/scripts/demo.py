import awswrangler as wr
from typing import Optional
import pandas as pd
from awsglue.utils import getResolvedOptions

import sys
class Glue:

    def __init__(self) -> None:
        self.database: Optional[str] = None
        self.gelu_args = None

    def __glue_arg(self) -> None:
        required_args = ["JOB_NAME", "env", "source_path", "database", "destination_path"]
        args = getResolvedOptions(sys.argv, required_args)
        self.gelu_args = args

    def get_glue_arg(self, key_name:str, default_value=None):
        if not self.gelu_args:
            self.__glue_arg()
        print(self.gelu_args, "*"*100)
        return self.gelu_args.get(key_name, default_value)

    def _get_or_create_database(self):
        database_name = self.get_glue_arg("database", "default")
        databases = wr.catalog.databases()
        if database_name not in databases.values:
            wr.catalog.create_database(database_name)
        self.database = database_name
        return database_name

    def s3_to_dataframe(self) -> pd.DataFrame:
        if not self.get_glue_arg("source_path"):
            raise ValueError("Source Path is not defined")
        s3_path = self.get_glue_arg("source_path")
        return wr.s3.read_csv(f"{s3_path}physical_currency_list.csv")

    def s3_to_parquet(self, df:pd.DataFrame):
        destination_path = self.get_glue_arg("destination_path")
        res = wr.s3.to_parquet(
            df=df,
            path=destination_path,
            dataset=True,
            database=self.database,
            table="daily",
            mode="overwrite"
        )


if __name__ == "__main__":
    glue = Glue()
    df = glue.s3_to_dataframe()
    glue._get_or_create_database()
    glue.s3_to_parquet(df=df)







