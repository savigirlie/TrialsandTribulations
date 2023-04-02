Savis_Books <- read.csv("savis_books.csv")
#Reads in data into R

print(Savis_Books)
#Prints bad copy of your data

Savis_Books
#Also prints bad copy of your data

Savis_Books$Title
#Prints only values from the Title Column also in a bad way

Savis_Books[Savis_Books$Author1=="Zac Brewer"&Savis_Books$Release_Date>2009,]
#Prints specific search

Vlad_Todd <- Savis_Books[Savis_Books$Author1=="Zac Brewer"&Savis_Books$Release_Date>2009,]
#creates new data frame

Vlad_Todd <- rbind(Vlad_Todd,Savis_Books[Savis_Books$Author1=="Zac Brewer"&Savis_Books$Release_Date<2009,])
#Used to add in more data to already existing data frame

write.csv(Vlad_Todd,"Chronicles of Vladimir Todd.csv")
#Turns out data frame into csv file to download