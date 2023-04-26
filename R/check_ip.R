#' Check IP
#'
#' check what your IP is
#'
#' @importFrom curl curl_fetch_memory
#' @importFrom httr GET http_status content
#' @importFrom jsonlite prettify
#'
#' @return IP information
#' @export
#'
#' @details
#' Use \code{\link[curl]{curl_fetch_memory}} to get information about the web page
#' https://api-ipv4.ip.sb/ip & https://api.ip.sb/geoip
#'
#' @examples
#' check_ip()
check_ip <- function() {

  message("check what your ip is: ")

  # Define the URLs
  ip_url <- "api.ip.sb/ip"
  geoip_url <- "api.ip.sb/geoip"

  # Fetch the IP address
  ip_response <- GET(ip_url)
  # Fetch GeoIP information
  geoip_response <- GET(geoip_url)

  message("IPv4: ")
  tryCatch({
    # Check if the request was successful
    if (http_status(ip_response)$category == "Success") {
      ip <- content(ip_response, "text",encoding = "UTF-8")
    } else {
      stop("Error fetching IP information")
    }
    # fetch info
    ipv4 <- curl_fetch_memory(ip_url)
    message(rawToChar(ipv4$content))
  }, error = function(e) {
    message("Unable to retrieve IPv4 address.")
  })

  message("Details: ")
  tryCatch({
    # Check if the request was successful
    if (http_status(geoip_response)$category == "Success") {
      geoip <- content(geoip_response, "parsed",encoding = "UTF-8")
    } else {
      stop("Error fetching GeoIP information")
    }
    # fetch info
    det <- curl_fetch_memory(geoip_url)
    message(jsonlite::prettify(rawToChar(det$content)))
  }, error = function(e) {
    message("Unable to retrieve IP details.")
  })

}
