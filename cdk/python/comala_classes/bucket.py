from aws_cdk import (
    aws_s3 as s3,
    core as cdk
)
from aws_cdk.aws_s3 import BlockPublicAccess

class ComalaBucket(cdk.Stack):

    def __init__(self, scope: cdk.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

    def createBucket(self, name, versioned=False):
        bucket = s3.Bucket(self,
                    name,
                    block_public_access=BlockPublicAccess.BLOCK_ALL,
                    versioned=versioned
                )
        return bucket
