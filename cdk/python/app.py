#!/usr/bin/env python3

from aws_cdk import core

from comala_classes.bucket import ComalaBucket
from comala_classes.bucketupload import ComalaBucketUpload
from comala_classes.zipcode import ComalaZipcode


app = core.App()
s3 = ComalaBucket(app, "myfirstbucket")
bucketName = s3.createBucket('marcos', True)
print(bucketName)
print(bucketName.to_string())
print(bucketName.bucket_name)
print(bucketName.bucket_arn)

uploadfolder = ComalaBucketUpload('/Users/marcos/proyects/comalatech-cdk/comala-lambda/test.zip', bucketName.bucket_name, 'test.zip')
uploadfolder.uploadfile()

app.synth()
