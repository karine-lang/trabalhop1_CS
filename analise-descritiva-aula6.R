 library(dplyr)
#abrindo dataset sobre modelos de carros
cars <- read.csv("https://raw.githubusercontent.com/silviostanzani/PosBigData/master/Auto2.csv")
summary(cars)
names(cars)

#código para cortar a coluna name, pois é irrelevante na nossa análise
mydata <- cars
cars2 <- select(mydata,-starts_with("name"))
summary(cars2)

#avaliando preseça de outliers ( pontos fora da curva)
# Quando o gráfico boxplot apresenta bolinhas antes e após as barras laterais, isso indica
# a presença de outliers
# A barra de cima representa o limite mínimo
# e a barra de baixo o limite maximo
boxplot(cars2$mpg)

#funcao cor retorna a correlacao entre as colunas
cormat <- round(cor(cars2),2)
head(cormat)

#codigo para criar o mapa de calor da correlação
col<- colorRampPalette(c("white", "black"))(200)
heatmap(cormat, col=col, symm=TRUE)

#Comparando algumas colunas por nível MPG
mpg0 <- filter(cars2, mpg <= 23)
mpg1 <- filter(cars2, mpg >= 23)

#grupo de carro com pouco rendimento
hist(mpg0$year)
hist(mpg0$weight)

#grupo de carro com muito rendimento
hist(mpg1$year)
hist(mpg1$weight)

#conclusão
# Essa análise mostra que para o grupo com pouco rendimento 
#os carros são mais pesados e mais antigos
# No grupo com mais rendimento, os carros são mais levels e
# mais novos

# carregando base titanic
titanic <- read.csv("https://raw.githubusercontent.com/silviostanzani/PosBigData/master/titanic_tratado.csv")
head(titanic)

summary(titanic)
#colunas trazem informacoes sobre passageiros (incluindo se sobreviveu ou nao)
names(titanic)

#avaliando correlaçáo das colunas
cormat <- round(cor(titanic),2)
head(cormat)

#mapa de calor das colunas
col<- colorRampPalette(c("white", "black"))(5)
heatmap(cormat, col=col, symm=TRUE)

#histogramas de idade e quantidade de sobreviventes
hist(titanic$Age)
hist(titanic$Survived)

# descobrindo qual coluna consegue caracterizar melhor
# se o passageiros sobreviveu ou nao

#grupo de nao sobreviventes (Survived =0)
titanic0 <- filter(titanic, Survived == 0)
#grupo de sobreviventes (Survived =1)
titanic1 <- filter(titanic, Survived == 1)
head(titanic2)

hist(titanic0$Age)
hist(titanic1$Age)

hist(titanic0$Sex)
hist(titanic1$Sex)

#com base nos histogramas de idade e sexo de cada grupo, sobrevivente
# ou nao sobrevivente, qual dessas colunas (sexo ou idade) melhor caracteriza
# os grupos (sobrevivente e nao sobrevivente) e por que?

