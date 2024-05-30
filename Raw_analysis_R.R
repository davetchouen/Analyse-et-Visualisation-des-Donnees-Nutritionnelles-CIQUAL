


## importation des données et creation d'un sous data frame 
library(readxl)
t<- read_excel("Table Ciqual 2020_FR_2020 07 07.xls", guess_max = 3000)
T<- as.data.frame(t, guess_max=3000)

## exploration du sous data frame 
U<- T[ , c(5, 6, 8, 13, 14, 15, 17, 18, 19, 27)]
colnames(U)<- c("Groupes", "SousGroupe", "Aliment", "Energie",
                "Eau", "Proteines", "Glucides",
                "Lipides", "Sucres","Fibres")
##fonction qui fait les transformations 

recod<- function(d){
  d<- gsub("[-]", NA, d)
  d <- gsub(" ", NA, d)
  d <- gsub(",", ".", d)
  d<- gsub("^<.*", "0", d)
  d<- gsub("[a-z].*", "0", d)
  d<-as.numeric(d)
}
##  transformation des variables qui en ont besoin 
U$Energie <- recod(U$Energie)
U$Eau<- recod(U$Eau)
U$Proteines <- recod(U$Proteines)
U$Glucides<- recod(U$Glucides)
U$Lipides<- recod(U$Lipides)
U$Sucres<- recod(U$Sucres)
U$Fibres<- recod(U$Sucres)


View(U)

### 
# Créer une liste des groupes de desserts

dessert <- c( "fruits", "produits laitiers frais et assimilés",
              "chocolats et produits à base de chocolat",
              "confitures et assimilés", 
              "gâteaux et pâtisseries", "glaces", "sorbets",
              "desserts glacés")
# Extraire les aliments correspondant aux groupes de desserts
V <- U[U$Groupes %in% dessert, ]

V$Groupes <- factor(V$Groupes,levels = c("fruits", 
                                         "produits laitiers frais et assimilés",
                                         "chocolats et produits à base de chocolat",
                                         "confitures et assimilés",
                                         "gâteaux et pâtisseries", 
                                         "glaces", "sorbets",
                                         "desserts glacés"), 
                    labels = c("fruits", "laitages", "chocolats", 
                               "confitures", "pâtisseries", 
                               "glaces", "sorbets", 
                               "desserts glacés"))

## combien y a t-il de dessert dans le jeu de données
summary(V$Groupes)
## combien avec une energie > 500 kcal
subset(V, Energie > 500, select = c(Energie, Groupes))
##combien y a til de dessert pour les quels l'energie n'est pas connue (on a 272 qui ont l'energie inconnue )
summary(V$Energie)
## ou 
energie_inconnue <- subset(V, is.na(Energie), select = c(Energie, Groupes))
summary(energie_inconnue)



##  Quel est le contenu moyen en sucres des desserts de chaque groupe ?
## utilisation de la fonction Tapply
tapply(V$Sucres,V$Groupes, mean)

tapply(V$Sucres,V$Groupes, hist)

## 
? hist
hist(V$Sucres, xlab= "Sucre (g/100g)", ylab= "Densité", main="Histogramme du contenu en sucres")


### 
pos<- as.numeric(factor(V$Groupes))



Groupeslev <- factor(V$Groupes, levels = c("fruits", "laitages","glaces", "sorbets",
                                           "desserts glacés","pâtisseries", "chocolats", 
                                           "confitures"))

boxplot(V$Sucres~Groupeslev, ylab = "Sucres", xlab = "", las = 2)

## 
par(mfrow=c(1, 2))
plot(V$Sucres, V$Energie,xlab = "Sucres", ylab = "Energie", type= "n")
points(V$Sucres[V$Groupes == "fruits"], V$Energie[V$Groupes == "fruits"], col= "black", pch=20)
points(V$Sucres[V$Groupes == "laitages"], V$Energie[V$Groupes == "laitages"], col= "deeppink", pch=20)
points(V$Sucres[V$Groupes == "glaces"], V$Energie[V$Groupes == "glaces"], col= "forestgreen", pch=20)
points(V$Sucres[V$Groupes == "sorbets"], V$Energie[V$Groupes == "sorbets"], col= "blue2", pch=20)
points(V$Sucres[V$Groupes == "desserts glacés"], V$Energie[V$Groupes == "desserts glacés"], col= "aquamarine1", pch=20)
points(V$Sucres[V$Groupes == "pâtisseries"], V$Energie[V$Groupes == "pâtisseries"], col= "maroon3", pch=20)
points(V$Sucres[V$Groupes == "chocolats"], V$Energie[V$Groupes == "chocolats"], col= "black", pch=18)
points(V$Sucres[V$Groupes == "confitures"], V$Energie[V$Groupes == "confitures"], col= "maroon", pch=18)
legend("bottomright", legend = c("fruits", "laitages","glaces", "sorbets",
                                 "desserts glacés","pâtisseries", "chocolats", "confitures"),pch= c(20, 20, 20, 20, 20, 20, 18, 18), 
       col = c("black", "deeppink", "forestgreen", "blue2","aquamarine1", "maroon3", "black","maroon"), cex = 0.6)



plot(V$Lipides, V$Energie,xlab = "Graisse", ylab = "Energie", type= "n")
points(V$Lipides[V$Groupes == "fruits"], V$Energie[V$Groupes == "fruits"], col= "black", pch=20)
points(V$Lipides[V$Groupes == "laitages"], V$Energie[V$Groupes == "laitages"], col= "deeppink", pch=20)
points(V$Lipides[V$Groupes == "glaces"], V$Energie[V$Groupes == "glaces"], col= "forestgreen", pch=20)
points(V$Lipides[V$Groupes == "sorbets"], V$Energie[V$Groupes == "sorbets"], col= "blue2", pch=20)
points(V$Lipides[V$Groupes == "desserts glacés"], V$Energie[V$Groupes == "desserts glacés"], col= "aquamarine1", pch=20)
points(V$Lipides[V$Groupes == "pâtisseries"], V$Energie[V$Groupes == "pâtisseries"], col= "maroon3", pch=20)
points(V$Lipides[V$Groupes == "chocolats"], V$Energie[V$Groupes == "chocolats"], col= "black", pch=18)
points(V$Lipides[V$Groupes == "confitures"], V$Energie[V$Groupes == "confitures"], col= "maroon", pch=18)
legend("bottomright", legend = c("fruits", "laitages","glaces", "sorbets",
                                 "desserts glacés","pâtisseries", "chocolats", "confitures"),pch= c(20, 20, 20, 20, 20, 20, 18, 18), 
       col = c("black", "deeppink", "forestgreen", "blue2","aquamarine1", "maroon3", "black","maroon"), cex = 0.6)