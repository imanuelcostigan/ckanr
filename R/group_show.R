#' Show a package.
#'
#' @export
#'
#' @param id (character) Package identifier.
#' @param include_datasets (logical) Include a list of the group's datasets. Default: TRUE
#' @template args
#' @details By default the help and success slots are dropped, and only the result
#' slot is returned. You can request raw json with \code{as='json'} then parse yourself
#' to get the help slot.
#' @examples \donttest{
#' group_show('communications')
#' group_show('communications', as='json')
#' group_show('communications', as='table')
#' }
group_show <- function(id, include_datasets = TRUE, url = get_ckanr_url(), as='list', ...)
{
  body <- cc(list(id = id, include_datasets = as_log(include_datasets)))
  res <- ckan_POST(url, 'group_show', body = body, ...)
  switch(as, json = res, list = jsl(res), table = jsd(res))
}
