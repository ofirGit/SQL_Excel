# SQL_Excel

Analys 'Sakila' sample database 

**Tools**
- MySQL
- Excel

**Analysis**

Sakila is a company for rent movies with two stores and global customers

**KPIs:**
- Price rent per day
- Growth number of customers
- Growth number of rent

***What is the most popular day of rental?***

![](https://github.com/ofirGit/SQL_Excel/blob/main/Chart1.png)

Most of the people rent movie on Tuesday. About 30% rentals on Tuesday and Sunday.
It is likely that anyone who rents a movie will not rent it the next day either. Should check what the average sequel to renting a movie is

***What is the average days of rent movie?***

![](https://github.com/ofirGit/SQL_Excel/blob/main/Chart2.png)

The avg is 5.5 days for rent. I checked correlation between number of days and price.

![](https://github.com/ofirGit/SQL_Excel/blob/main/Chart2.1.png)

I found that r=0.5 there is a middle positive connection between two params. 
25% of the price is explained by the number of rental days but 75% is explained by other factors.

I recommend the company to limit the number of rental days to 5 days so that they can increase the number of rental on other days. In order to increase the income they should charge a higher price for rentals exceeding 5 days. In additiion to encouraging customers to make rentals on the weak days for example by specials.


***What is the popular movie?***

The most popular movie is 103 by 34 numbers of rental. His category is Travel.

Does travel is the most popular category? No. I found that the most popular category is Sports with 1179 times for rental.

![](https://github.com/ofirGit/SQL_Excel/blob/main/Chart6.png)

I checked if there is a connection between those two questions. I checked who are the actors play in the most popular movies? perhaps
the customers choose their movie by the actors.
The most popular actors are: 

![](https://github.com/ofirGit/SQL_Excel/blob/main/Chart3.png)

They are indeed playing in 2 or 3 popular movies. I recommend the company to add more movies starring those actors.


***Most popular caategory by country***

The most popular category is Sports. In Mexico and Netherlands, sports movies are watched the most.
I recommend the company to adjust its movies by country or area in order to increase its customers in each country. 
i.e. more action movies in India, more sports movies in Mexico and more.


