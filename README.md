# Extension Docker Template

This repo serves as a template for running your own extensions using Docker Compose. To run Kwil with your own extension:

1. [Create your extension](<https://docs.kwil.com/docs/extensions/introduction>) and build it as a [Docker image](<https://docs.docker.com/get-started/02_our_app/>)
2. In the [docker-compose.yaml](./docker-compose.yaml) file, replace `<image>` with the name of your built docker image.  It assumes the gRPC server is running on port 50051
3. Run Kwil and your image by running:

```bash
make download-and-run
```

Once the command has finished executing, your database will be accessible on http://localhost:8080.

Note that some browsers may require security adjustments to connect to the local database from the Kuneiform IDE.

You can stop the database using:

```bash
make stop
```

An example of this template in action can be found [here](<https://github.com/kwilteam/extension-example-math.git>).

## Makefile

This repo contains a makefile that with common commands that may be run in this repo.  To see all commands, run:

```bash
make help
```
