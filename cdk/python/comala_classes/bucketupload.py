from aws_cdk import (
    aws_s3 as s3,
    core as cdk
)
import aws_cdk.aws_s3_deployment as s3deploy

class ComalaBucketUpload():

    def __init__(self, file_name, bucket, object_name=None):
        self.file_name = file_name
        self.bucket = bucket
        self.object_name = object_name

    def uploadfile(self):
        print(self.file_name)
        s3deploy.BucketDeployment(self, "DeployWebsite",
                sources=[s3deploy.Source.asset(self.file_name)],
                destination_bucket=self.bucket,
                destination_key_prefix="web")
