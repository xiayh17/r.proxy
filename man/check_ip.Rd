% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_ip.R
\name{check_ip}
\alias{check_ip}
\title{Check IP}
\usage{
check_ip()
}
\value{
IP information
}
\description{
check what your IP is
}
\details{
Use \code{\link[curl]{curl_fetch_memory}} to get information about the web page
https://api-ipv4.ip.sb/ip & https://api.ip.sb/geoip
}
\examples{
\dontrun{
check_ip()
}
}
