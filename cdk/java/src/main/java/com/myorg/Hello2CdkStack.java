package com.myorg;

import software.amazon.awscdk.core.Construct;
import software.amazon.awscdk.core.Stack;
import software.amazon.awscdk.core.StackProps;
import software.amazon.awscdk.services.s3.Bucket;
import software.amazon.awscdk.services.s3.BucketEncryption;

public class Hello2CdkStack extends Stack {
    public Hello2CdkStack(final Construct scope, final String id) {
        this(scope, id, null);
    }

    public Hello2CdkStack(final Construct scope, final String id, final StackProps props) {
        super(scope, id, props);

        // The code that defines your stack goes here

        // Bucket.Builder.create(this, "MyFirstBucket")
        //     .versioned(true).build();
        Bucket.Builder.create(this, "MyFirstBucket")
                .versioned(true)
                .publicReadAccess(true)
                .build();
    }
}
