
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r.proxy

<!-- badges: start -->
![](https://www.r-pkg.org/badges/version-last-release/r.proxy)
![](https://cranlogs.r-pkg.org/badges/grand-total/r.proxy)
![](https://cranlogs.r-pkg.org/badges/last-day/r.proxy)
![](https://cranlogs.r-pkg.org/badges/last-week/r.proxy)
![](https://cranlogs.r-pkg.org/badges/r.proxy)
<!-- badges: end -->

The goal of r.proxy is to Set Proxy in R Console.

This project is inspired by
[zsh-proxy](https://github.com/SukkaW/zsh-proxy).

## Installation

You can install the released version of r.proxy from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("r.proxy")
```

And you can install the development version of r.proxy like so:

``` r
# install.packages("devtools")
devtools::install_github("xiayh17/r.proxy")
```

## Example

This is a basic example which shows you how to use it:

Start proxy by `proxy()`

Configrations interactive will show only in the first time you use.

``` r
r.proxy::proxy()
```

``` r
#> This maybe the first time proxy4you be load. 
#> Please complete below configrations:)
#> Default setting can be accessed by Enter with nothing
#> [socks5 proxy] {Default as 127.0.0.1:7890} (address:port): 192.168.3.15:7890
#> [https proxy] {Default as 127.0.0.1:7890} (address:port): 
#> [http proxy] {Default as 127.0.0.1:7890} (address:port): 
#> Your setting have been save in ~/.Rproxy
#> Proxy info: 
#> http://127.0.0.1:7890http://192.168.3.15:7890socks5://127.0.0.1:7890
#> check what your ip is: 
#> IPv4: 
#> 91.243.81.71
#> 
#> Details: 
#> {
#>     "organization": "MoreneHost",
#>     "longitude": 6.1661,
#>     "timezone": "Europe/Luxembourg",
#>     "isp": "MoreneHost",
#>     "offset": 3600,
#>     "asn": 199524,
#>     "asn_organization": "G-Core Labs S.A.",
#>     "country": "Luxembourg",
#>     "ip": "91.243.81.71",
#>     "latitude": 49.7498,
#>     "continent_code": "EU",
#>     "country_code": "LU"
#> }
```

``` r
r.proxy::proxy()
```

``` r
#> Proxy info: 
#> http://127.0.0.1:7890http://192.168.3.15:7890socks5://127.0.0.1:7890
#> check what your ip is: 
#> IPv4: 
#> 91.243.81.71
#> 
#> Details: 
#> {
#>     "organization": "MoreneHost",
#>     "longitude": 6.1661,
#>     "timezone": "Europe/Luxembourg",
#>     "isp": "MoreneHost",
#>     "offset": 3600,
#>     "asn": 199524,
#>     "asn_organization": "G-Core Labs S.A.",
#>     "country": "Luxembourg",
#>     "ip": "91.243.81.71",
#>     "latitude": 49.7498,
#>     "continent_code": "EU",
#>     "country_code": "LU"
#> }
```

Stop proxy by `noproxy()`

``` r
r.proxy::noproxy()
#> Proxy was cleaned!
#> 
#> check what your ip is:
#> IPv4:
#> 58.253.50.194
#> Details:
#> {
#>     "organization": "China Unicom Guangdong",
#>     "longitude": 110.5702,
#>     "city": "Zhongshan",
#>     "timezone": "Asia/Shanghai",
#>     "isp": "China Unicom Guangdong",
#>     "offset": 28800,
#>     "region": "Guangdong",
#>     "asn": 17816,
#>     "asn_organization": "China Unicom IP network China169 Guangdong province",
#>     "country": "China",
#>     "ip": "58.253.50.194",
#>     "latitude": 21.3232,
#>     "continent_code": "AS",
#>     "country_code": "CN",
#>     "region_code": "GD"
#> }
```

Reset proxy by `init_proxy()`

``` r
r.proxy::init_proxy()
```

``` r
#> This maybe the first time proxy4you be load. 
#> Please complete below configrations:)
#> Default setting can be accessed by Enter with nothing
#> [socks5 proxy] {Default as 127.0.0.1:7890} (address:port): 192.168.3.15:7890
#> [https proxy] {Default as 127.0.0.1:7890} (address:port): 
#> [http proxy] {Default as 127.0.0.1:7890} (address:port): 
#> Your setting have been save in ~/.Rproxy
```

## More

Check your IP

``` r
r.proxy::check_ip()
#> check what your ip is:
#> IPv4:
#> 58.253.50.194
#> Details:
#> {
#>     "organization": "China Unicom Guangdong",
#>     "longitude": 110.5702,
#>     "city": "Zhongshan",
#>     "timezone": "Asia/Shanghai",
#>     "isp": "China Unicom Guangdong",
#>     "offset": 28800,
#>     "region": "Guangdong",
#>     "asn": 17816,
#>     "asn_organization": "China Unicom IP network China169 Guangdong province",
#>     "country": "China",
#>     "ip": "58.253.50.194",
#>     "latitude": 21.3232,
#>     "continent_code": "AS",
#>     "country_code": "CN",
#>     "region_code": "GD"
#> }
```

Test your connect

[speedtest](https://github.com/hrbrmstr/speedtest) will be used in this
step

``` r
# install.packages("speedtest", repos = c("https://cinc.rud.is", "https://cloud.r-project.org/"))
speedtest::spd_test()
#> Warning: replacing previous import 'cli::num_ansi_colors' by
#> 'crayon::num_ansi_colors' when loading 'speedtest'
#> Gathering test configuration information...
#> Gathering server list...
#> Determining best server...
#> Initiating test from China Unicom Guangdong (58.253.50.194) to CTM2 (Taipa)
#> 
#> Analyzing download speed..........
#> Download: 83 Mbit/s
#> 
#> Analyzing upload speed......
#> Upload: 40 Mbit/s
r.proxy::proxy()
#> Proxy info:
#> http://127.0.0.1:7890http://127.0.0.1:7890socks5://127.0.0.1:7890
#> check what your ip is:
#> IPv4:
#> 91.243.81.71
#> Details:
#> {
#>     "organization": "MoreneHost",
#>     "longitude": 6.1661,
#>     "timezone": "Europe/Luxembourg",
#>     "isp": "MoreneHost",
#>     "offset": 3600,
#>     "asn": 199524,
#>     "asn_organization": "G-Core Labs S.A.",
#>     "country": "Luxembourg",
#>     "ip": "91.243.81.71",
#>     "latitude": 49.7498,
#>     "continent_code": "EU",
#>     "country_code": "LU"
#> }
speedtest::spd_test()
#> Gathering test configuration information...
#> Gathering server list...
#> Determining best server...
#> Initiating test from MoreneHost (91.243.81.71) to Maxis (Subang Jaya)
#> 
#> Analyzing download speed..........
#> Download: 157 Mbit/s
#> 
#> Analyzing upload speed......
#> Upload: 107 Mbit/s
r.proxy::noproxy()
#> Proxy was cleaned!
#> 
#> check what your ip is:
#> IPv4:
#> 58.253.50.194
#> Details:
#> {
#>     "organization": "China Unicom Guangdong",
#>     "longitude": 110.5702,
#>     "city": "Zhongshan",
#>     "timezone": "Asia/Shanghai",
#>     "isp": "China Unicom Guangdong",
#>     "offset": 28800,
#>     "region": "Guangdong",
#>     "asn": 17816,
#>     "asn_organization": "China Unicom IP network China169 Guangdong province",
#>     "country": "China",
#>     "ip": "58.253.50.194",
#>     "latitude": 21.3232,
#>     "continent_code": "AS",
#>     "country_code": "CN",
#>     "region_code": "GD"
#> }
```
