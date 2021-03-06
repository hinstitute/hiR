# #' Retrieve gender given a vector of first names
# #'
# #' only about 60% accurate with current names dataset.
# #'
# #' @param names A character vector of names
# #' @param full Logical; should the function try to extract the first name?
# #'            WARNING: names like "sarah ann" will turn into "sarah"
# #' @export
# #'
# #' @return
# #' About 60-70 percent of first names from twitter accurately classified by gender
# #'
# #' @examples
# #' names <- c("cindy", "sally", "bob", "joe")
# #' match_gender(names)

# match_gender <- function(names,
#                          full=FALSE
#                          ) {
#     # read in names database
#     names_db <- read.csv("http://dl.dropbox.com/u/6535582/HI_Files/hiR/gender_match/names.csv", stringsAsFactors=F) # CHANGE THIS HACKY MESS

#     # clean up input names
#     names <- tolower(str_trim(as.character(names)))

#     # if requested, extract first names
#     if(full){
#         print(paste("extracting first names..."))
#         extractFirstName <- function(name){
#             first_name <- unlist(str_split(name, " "))[1]
#             return(first_name)
#         }
#         names <- laply(names, extractFirstName, .progress="text")
#     }

#     # match first names
#     match <- function(name) {
#          test <- names_db[which(names_db$name==name),]
#          if(nrow(test) > 0) {
#             gender <- test$gender[1]
#          } else {
#             gender = NA
#          }
#     return(as.character(gender))
#     }

#     print(paste("matching names..."))
#     output <- laply(names, match, .progress="text")
#     return(output)
# }