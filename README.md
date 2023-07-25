# Extension Docker Template

This repo serves as a template for running your own extensions using Docker Compose. To run Kwil with your own extension:

1. [Create your extension](<https://docs.kwil.com/docs/extensions/introduction>) and build it as a [Docker image](<https://docs.docker.com/get-started/02_our_app/>)
2. In the [docker-compose.yaml](./docker-compose.yaml) file, replace `<your_image_here>` with the name of your built docker image.
3. Run Kwil and your image by running:

    ```bash
    make download-and-run
    ``````

An example of this template in action can be found [here](<https://github.com/kwilteam/extension-example-math.git>).
