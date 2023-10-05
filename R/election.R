#' Sweden Election Data 
#'
#' @field election_data A dataframe that contains the extracted election data
#' 
#' @section Methods: 
#' clean(): Cleans the dataframe such that it is structured in the right form. 
#'
#' @return Returns an object of class "election" 
#' 
#' @export election 
#' @exportClass election

election<- setRefClass(Class="election", 
                       fields = list(election_data = "data.frame"),
                       methods = list(
                         initialize = function(){
                           url<-"https://www.val.se/download/18.14c1f613181ed0043d570c5/1667207094207/slutligt-valresultat-riksdagen-jamforande-statistik-2018-2022.xlsx"
                           url <- url
                           download.file(url, "election_data.xlsx")
                           election_data <<- readxl::read_excel("election_data.xlsx")  
                         },
                         clean = function(){
                           election_data<<- election_data[1:7]
                           colnames(election_data)<<-c("Parti","Röster_2022","Andel_2022","Diff_4","Diff_andel","Röster_2018","Andel_2018")
                         }
                       ))
