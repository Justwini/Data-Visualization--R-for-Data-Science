library(tidyverse)
library(palmerpenguins)
library(ggthemes)

#Do penguins with longer flippers weigh more or less than penguins with shorter flippers?
#What does the relationship between flipper length and body mass look like?
#Is it positive? Negative? Linear? Nonlinear? 
#Does the relationship vary by the species of the penguin?
#How about by the island where the penguin lives? 
penguins
glimpse(penguins)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
geom_smooth(method = "lm") +
labs(
  title = "Body mass and flipper length",
  subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
  x = "Flipper length (mm)", y = "Body mass (g)",
  color = "Species", shape = "Species"
) +
  scale_color_colorblind()



####################################################################
############################EXCERCISES##############################

####1 How many rows are in penguins? How many columns?
dim(penguins)
#-344 rows and 8 columns



####2 What does the bill_depth_mm variable in the penguins data frame describe?
    # #Read the help for ?penguins to find out.
?penguins
#-a number denoting bill depth (millimeters)



####3 Make a scatterplot of bill_depth_mm vs. bill_length_mm. That is,
    # make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm
    # on the x-axis. Describe the relationship between these two variables.
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm,color = species, shape = species)
) +
  geom_point(mapping = aes()) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill length and bill depth",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill length (mm)", y = "bill depth (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()
#In each presented species of penguins there is a relationship,
#the longer the bill, the deeper it is, but the adelie group is most scattered. On the scatter plot of these variables
#it can be seen that these are features that can easily delimit species affiliation,
#on the graph three visible groups are formed.
#Adeline have shorter bill then other presented species.
#Christian and gentoo have longer bills but we can we can separate them
#with bill depth. the Gentoo have smaller bill depth ther rest.




####4 What happens if you make a scatterplot of species vs. bill_depth_mm?
#   What might be a better choice of geom?

#scatterplot of species vs. bill_depth_mm
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm,color = species, shape = species)
) +
  geom_point(mapping = aes()) +
  geom_smooth(method = "lm") +
  labs(
    title = "Species and bill depth",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Species", y = "bill depth (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

#We can see that the scatterplot is not best option to this example,
#we can see that Adeline and Chinstrap have bigger depth of bill than Gentoo,
#but we dont se destribution of this feature, the shapes overlap and we don't see
#how many observations there are with a specific value.
#Better choice would be boxplot so we can se destribution of variable in diffrent species.
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_boxplot() +
  
  labs(
    title = "Bill length and bill depth",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Bill length (mm)", y = "bill depth (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()




####5 Why does the following give an error and how would you fix it?
#   
ggplot(data = penguins) + 
geom_point()
#-`geom_point()` requires the following missing aesthetics: x and y. 
#I need to specify wchich variable i want to desplay on the chart.
ggplot(data = penguins) + 
  geom_point(aes(x=bill_depth_mm,y=flipper_length_mm))





####6 What does the na.rm argument do in geom_point()?
    #What is the default value of the argument? 
    #Create a scatterplot where you successfully use this argument set to TRUE.
?geom_point()
#na.rm-If FALSE, the default, missing values are removed with a warning.
#If TRUE, missing values are silently removed.
ggplot(data = penguins) + 
  geom_point(mapping=aes(x=bill_depth_mm,y=flipper_length_mm),na.rm =TRUE)




####7 Add the following caption to the plot you made in the previous exercise:
#   “Data come from the palmerpenguins package.”
# Hint: Take a look at the documentation for labs().
?labs()
ggplot(data = penguins) + 
  geom_point(mapping=aes(x=bill_depth_mm,y=flipper_length_mm),na.rm =TRUE )+
  labs(caption='Data come from the palmerpenguins package.')



####8 Recreate the following visualization. What aesthetic should bill_depth_mm
# be mapped to? And should it be mapped at the global level or at the geom level
?geom_smooth
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping=aes(color = bill_depth_mm)) +
  geom_smooth(method = "gam") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species"
  ) 
#in geom level because in global r want to have groups;
#2: The following aesthetics were dropped during statistical transformation: colour.
#ℹ This can happen when ggplot fails to infer the correct grouping structure in the data.
#ℹ Did you forget to specify a `group` aesthetic or to convert a numerical variable into a factor? 


####9 Run this code in your head and predict what the output will look like.
    #Then, run the code in R and check your predictions.
?geom_smooth
#se - Display confidence interval around smooth? (TRUE by default, see level to control.)
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

####10 Will these two graphs look different? Why/why not?
  
  ggplot(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )
#NO diffrents, because we use the same mapping in global and in smooth, we only need to specify this x and y ones, there is no grouping   