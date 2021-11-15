#' Check IP
#'
#' check what your IP is
#'
#' @importFrom curl curl_fetch_memory
#' @importFrom jsonlite prettify
#'
#' @return IP information
#' @export
#'
#' @details
#' Use \code{\link[curl_fetch_memory]{curl}} to get information about the web page
#' https://api-ipv4.ip.sb/ip & https://api.ip.sb/geoip
#'
#' @examples
#' check_ip()
check_ip <- function() {

  message("check what your ip is: ")

  message("IPv4: ")
  ipv4 <- curl_fetch_memory("https://api-ipv4.ip.sb/ip")
  message(rawToChar(ipv4$content))
  # message("IPv6: ")
  message("Details: ")
  det <- curl_fetch_memory("https://api.ip.sb/geoip")
  message(jsonlite::prettify(rawToChar(det$content)))

}
