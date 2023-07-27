# Extension Docker Template

This repo serves as a template for running your own extensions using Docker Compose. To run Kwil with your own extension:

1. [Create your extension](<https://docs.kwil.com/docs/extensions/introduction>) and build it as a [Docker image](<https://docs.docker.com/get-started/02_our_app/>)
2. In the [docker-compose.yaml](./docker-compose.yaml) file, replace `<your_image_here>` with the name of your built docker image.
3. Run Kwil and your image by running:

```bash
make download-and-run
```

If you want to self-generate an SSL certificate to access the database over HTTPS, instead run:

```bash
make download-and-run-ssl
```

You will then need to access the database on https://localhost:443

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
