library(ggplot2)
swiss$name<-rownames(swiss)
#здесь построен график всех 47 провинций в Швейцарии и их рождаемость в % также цветом показана смертность до 1 года
qplot (data = swiss,x = Fertility, y = name,fill = Infant.Mortality,geom = "col") 
swiss
#соотношение % обучающихся призывников с % получившие высшию оценку 
qplot (data = swiss, color= I("green"),x = Examination, y = Education,size = 2)
