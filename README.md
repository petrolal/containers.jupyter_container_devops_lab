# Jupyter Notebook - DevOps laboratory

Docker container for DevOps study. This container has Jupyter Notebook installed, which allows you to create and share documents that contains live code, AWS CLI, Terraform, CDK, Cloudformation and another Cloud infrastructure tools.

This container is based on the official Jupyter Notebook image, which is a popular open-source project that provides a web-based interactive computing environment for data science and scientific computing.

This container is designed to be used as a laboratory for learning and experimenting with DevOps tools and practices. It provides a convenient and isolated environment for testing and developing your skills in a safe and controlled manner.

## How to use

Run the following command to start the container:

```shell
UID=$(id -u) GID=$(id -g) docker-compose up -d
```

This command will start the container in detached mode. You can access the Jupyter Notebook by opening your web browser and navigating to `http://localhost:8888`. The default password is `asktobianca'.

## Features

- Jupyter Notebook: A web-based interactive computing environment that allows you to create and share documents that contain live code, equations, visualizations and narrative text.
- AWS CLI: A command-line tool that allows you to interact with AWS services and manage your AWS resources.
- Terraform: An open-source infrastructure as code software tool that allows you to define and provision infrastructure using a high-level configuration language.
- CDK: A software development framework for defining cloud infrastructure in code and provisioning it through AWS CloudFormation.
- CloudFormation: A service that allows you to define and provision AWS infrastructure using a declarative template.

## Contributing

If you want to contribute to this project, please feel free to submit a pull request. We welcome contributions from the community and will review your changes as soon as possible.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
