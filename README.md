# deciphernow/elasticsearch

This repository contains the resources for building the deciphernow/elasticsearch image. This image is geared towards both local development and deployment in containerized infrastructure such as Kubernetes.  Further, it follows RedHat best practices making it suitable for deployment within OpenShift without any elevated priviledges.

## Usage

This image is configured to run in a single instance deployment out of the box.  You may further tailor the runtime with the following environment variables:

| Variable     | Example        | Default   | Description                                                   |
|--------------|----------------|-----------|---------------------------------------------------------------|
| CLUSTER_NAME | production     | local     | The name of the ElasticSearch cluster.                        |
| NODE_NAME    | es01           | localhost | The hostname or address of the server.                        |
| NODE_NAMES   | es01,es02,es03 | localhost | The hostnames or add addresses of all servers in the cluster. |

## Development

This repository is pretty simple and everything you want to know can be seen in the [Makefile](./Makefile).

### Prerequisites

In order to develop and test with this repository you will need the following installed:

    - docker
    - git
    - make

### Building

To build the image run the following command:

```sh
make build
```

To publish the image run the following command:

```sh
make publish
```

### Versioning

The version of this image tracks directly with the version of Elasticsearch built.  In order to update the version of Elasticsearch modify the [VERSION](./VERSION) file with the version needed. 

## Contributing

In general, we follow the "fork-and-pull" Git workflow.

1. Clone the project to your own machine.)
1. Commit changes to your own branch.
1. Push your work back up to your fork.
1. Submit a pull request so that we can review your changes.

NOTE: Be sure to fetch and rebase on the upstream master before making a pull request.

