#' List tags.
#'
#' @export
#'
#' @param query (character) A tag name query to search for, if given only tags whose names contain
#' this string will be returned
#' @param vocabulary_id (character) The id or name of a vocabulary, if give only tags that belong
#' to this vocabulary will be returned
#' @param all_fields (logical) Return full tag dictionaries instead of just names. Default: FALSE
#' @template args
#' @examples \donttest{
#' tag_list('aviation')
#' tag_list('aviation', as='json')
#' tag_list('aviation', as='table')
#' }
tag_list <- function(query = NULL, vocabulary_id = NULL, all_fields = FALSE,
  url = get_ckanr_url(), as='list', ...)
{
  body <- cc(list(query = query, vocabulary_id = vocabulary_id, all_fields = as_log(all_fields)))
  res <- ckan_POST(url, 'tag_list', body = body, ...)
  switch(as, json = res, list = jsl(res), table = jsd(res))
}
