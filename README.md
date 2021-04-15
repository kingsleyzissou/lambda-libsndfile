# `libsndfile` Lambda Layer

[libsndfile](http://www.mega-nerd.com/libsndfile/) is a C library for reading and writing files containing sampled sound. It is used in [SoundFile](https://pysoundfile.readthedocs.io/en/latest/#installation), which is used in turn by [Librosa](https://librosa.org/). This project leverages the power of Lambda Layers to give you access to this library inside an AWS Lambda function.

## Instructions

```
./build.sh
```

```
sls deploy
```

## How to use

You can attach the newly created layer to your Lambda manually in the AWS Management console. Alternatively, if you are using the `Serverless` framework, you can add the `ARN` to the relevant Lambda as below:

```
...

functions:
  greetings:
    handler: handler.hello
    layers:
      - <the generated ARN>

...
```
