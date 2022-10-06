#'Creates a folder if it does not exist yet
#'
#'@export
#'
#'@param folder_name Name of the folder to be tested and created
#'
#'@return Message indicating whether a folder was created or already existed 
#' 
#'@examples
#' testNmkdir("figures")


testNmkdir <- function(folder_name) {
  
  if (file.exists(file.path(here(), folder_name)) == FALSE){
  dir.create(file.path(here(), folder_name))
  print(paste("Folder \"", folder_name, "\" was created"), quote = FALSE)
  } else { print(paste("Folder \"", folder_name, "\" already exists"), quote = FALSE)}
}