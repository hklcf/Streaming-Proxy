# Streaming-Proxy
[![GitHub issues](https://img.shields.io/github/issues/hklcf/Streaming-Proxy.svg)](https://github.com/hklcf/Streaming-Proxy/issues)
[![GitHub forks](https://img.shields.io/github/forks/hklcf/Streaming-Proxy.svg)](https://github.com/hklcf/Streaming-Proxy/network)
[![GitHub stars](https://img.shields.io/github/stars/hklcf/Streaming-Proxy.svg)](https://github.com/hklcf/Streaming-Proxy/stargazers)
[![GitHub license](https://img.shields.io/github/license/hklcf/Streaming-Proxy.svg)](https://github.com/hklcf/Streaming-Proxy/blob/master/LICENSE)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/hklcf/Streaming-Proxy.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fhklcf%2FStreaming-Proxy)

Proxy any video streaming🎬

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
- Linux 64bit (Tested on CentOS 7 64bit, get your own server [Here](https://m.do.co/c/f5dea4b5cce3))
- Nginx

## Deployment
***You must install Nginx to your system first.*** https://nginx.org/en/linux_packages.html#stable

Download the latest version of Streaming-Proxy.
```bash
yum -y install epel-release screen git
git clone https://github.com/hklcf/Streaming-Proxy.git --branch v1.0.0
cd Streaming-Proxy
chmod 755 stream.sh
```

### Server tuning
In order to allow the proxy servers to fully utilize their resources, several adjustments should be made.

*tune global limits*

add to `/etc/sysctl.conf`
```
fs.inotify.max_user_instances=1048576
fs.inotify.max_user_watches=1048576
fs.nr_open=1048576
net.core.netdev_max_backlog=1048576
net.core.rmem_max=16777216
net.core.somaxconn=65535
net.core.wmem_max=16777216
net.ipv4.ip_local_port_range=1024 65535
net.ipv4.tcp_fin_timeout=5
net.ipv4.tcp_max_orphans=1048576
net.ipv4.tcp_max_syn_backlog=20480
net.ipv4.tcp_max_tw_buckets=400000
net.ipv4.tcp_no_metrics_save=1
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_syn_retries=2
net.ipv4.tcp_tw_reuse=1
net.ipv4.tcp_wmem=4096 65535 16777216
net.netfilter.nf_conntrack_max=1048576
net.nf_conntrack_max=1048576
```

*tune user limits*

add to `/etc/security/limits.conf`
```
*               soft    nofile          1048576
*               hard    nofile          1048576
*               soft    nproc           1048576
*               hard    nproc           1048576
*               soft    memlock         unlimited
*               hard    memlock         unlimited
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
