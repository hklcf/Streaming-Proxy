# Streaming-Proxy
Proxy any video streaming🎬

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
- Linux 64bit (Tested on CentOS 7 64bit, get your own server [Here](https://m.do.co/c/f5dea4b5cce3))
- Nginx

## Deployment
Download the latest version of Streaming-Proxy.
```bash
yum -y install epel-release screen unzip
curl -o streaming-proxy.zip https://github.com/hklcf/Streaming-Proxy/archive/v1.0.0.zip
unzip streaming-proxy.zip
cd streaming-proxy
chmod 755 stream.sh
```

## Usage
```bash
./stream.sh <SOURCE> <STREAM_NAME>
```

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning
We use [SemVer](https://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/hklcf/Streaming-Proxy/tags).

## Authors
* **HKLCF** - *Initial work* - [HKLCF](https://github.com/hklcf)

See also the list of [contributors](https://github.com/hklcf/Streaming-Proxy/contributors) who participated in this project.

## License
This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details
