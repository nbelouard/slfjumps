#'Attribute groups to jumps
#'
#'Identify independent locations of jump dispersal
#'
#'@export
#'
#'@param Jumps_oneparam A dataset to be processed
#'@param gap_size Distance between the invasion front and the positive point
#'necessary for it to be considered a jump, in kilometers (default: 15)
#'
#'@return The same table as \code{dataset} with an additional column named 
#'\code{group} and containing the group number for each jump
#' 
#'@examples
#' new_dataset <- group_jumps(dataset)

group_jumps <- function(Jumps_oneparam, gap_size = 15) {
  
  Jumps_oneparam %<>% add_column(Group = NA,
                                 ID = seq(1:length(Jumps_oneparam$DistToIntro)))
  bio_year = unique(Jumps_oneparam$bio_year)
  
  Jumps_yearn <- Jumps_oneparam 
  
  # Calculate all pairwise distances between points
  jumps <- st_as_sf(x = Jumps_yearn, coords = c("longitude_rounded", "latitude_rounded"), crs = 4326, remove = F)
  jumps_proj <- st_transform(jumps, crs = 4326)
  pairwise_dist <- st_distance(x = jumps_proj)
  units(pairwise_dist) <- NULL
  pairwise_dist <- as.data.frame(pairwise_dist)
  
  # Create a table with, for each point, a list of all the neighbor points (which we are going to populate with a loop) 
  close_points <- tibble(Point = seq(1:length(Jumps_yearn$DistToIntro)), Neighbors = list(NULL))
  
  for (i in 1:dim(pairwise_dist)[1]) { #take each point of the table
    neighbors_i = c()     # Create an empty vector to contain the list of neighbors for this point
    
    for (j in 1:dim(pairwise_dist)[2]) { # go through all the distances
      if (pairwise_dist[i,j] < gap_size * 1000 & pairwise_dist[i,j] != 0) { # if a point is closer than a gap size to the other point, but not the same point
        neighbors_i <- c(neighbors_i, j) # Add it to the vector
      }
    }
    
    if (length(neighbors_i) > 0){ #if this point has neighbors,
      close_points$Neighbors[[i]] <- neighbors_i # Add the vector to a table with the sample at which it is attributed
    } 
  }
  
  # Merge the lists of neighbor points with common points to obtain groups
  # This is done by iterating the list of neighbors of each point created above
  point_list <- close_points$Point #put the names of all points in a vector
  group_name = 1
  
  while (length(point_list) > 1){ #while there are points in the list of points
    
    i = point_list[1] # take the first point of the list
    group_i = c(i, close_points$Neighbors[[i]]) # initiate the vector with the neighbors of the point i
    
    for (j in (i+1):length(close_points$Point)) { #consider the next point in the table
      if (is.null(close_points$Neighbors[[j]]) == F & #if the new point considered j has neighbors
          close_points$Point[[j]] %in% close_points$Neighbors[[i]]) { # and if this new point j is in the list of neighbors of i  
        for (k in close_points$Neighbors[[j]]){ #look at the list of neighbors of j
          if (!(k %in% group_i) & k != i){ # if the point in the list of neighbors of j is not in the list of neighbors of i
            group_i <- c(group_i, k) # add the point to the list of neighbors of i
            }
          }
        }
      }
    
    for (c in group_i){ #for each point in this final list
      Jumps_oneparam <- Jumps_oneparam %>% mutate(Group = replace(Group, ID == c, group_name)) # find their ID in the table and attribute them the group name
    }
    
    point_list <- point_list[!point_list %in% group_i] # now remove all these neighbor points from the list of points to find another group
    group_name = group_name + 1 # the next group will be called n+1
  }
  
  if (length(point_list) == 1) { # if there is a last point
    if (is.na(Jumps_oneparam$Group[[point_list]])){ # and this last point is not in any group so far
      Jumps_oneparam <- Jumps_oneparam %>% mutate(Group = replace(Group, ID == point_list, group_name)) #attribute the last group name to the last point
    }
  }
  
  return(Jumps_oneparam)
}