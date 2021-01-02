package com.myorg;

import software.amazon.awscdk.core.App;

import java.util.Arrays;

public class Hello2CdkApp {
    public static void main(final String[] args) {
        App app = new App();

        new Hello2CdkStack(app, "Hello2CdkStack");

        app.synth();
    }
}
