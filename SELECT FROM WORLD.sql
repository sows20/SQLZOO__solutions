SQLZOO_SOLUTIONS

SECTION 2
/// SELECT from WORLD ///



1.

SELECT name, continent, population FROM world


#Large Countries

SELECT name FROM world
  WHERE population > 200000000


#Per capita GDP

SELECT name, gdp/population FROM world
  WHERE population > 200000000


#South America In millions

SELECT name, population/1000000 FROM world
  WHERE continent='South America'


#France, Germany, Italy

SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')


#United

SELECT name FROM world
  WHERE name LIKE '%United%'


#Two ways to be big

SELECT name, population, area FROM world
  WHERE area>=3000000 OR population>=250000000


#One or the other (but not both)

SELECT name, population, area FROM world
  WHERE area>=3000000 XOR population>=250000000

{OR}

SELECT name, population, area FROM world
  WHERE (area>=3000000 AND population<=250000000) OR (population>=250000000 AND area<=3000000)


#Rounding

SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world 
  WHERE continent='South America'


#Trillion dollar economies

SELECT name, Round(GDP/population, -3) FROM world
  WHERE gdp>=1000000000000


#Name and capital have the same length

SELECT name, capital FROM world
  WHERE LENGTH(name)=LENGTH(capital)


#Matching name and capital

SELECT name, capital FROM world
  WHERE LEFT(name, 1)=LEFT(capital, 1) AND name<>capital


#All the vowels

SELECT name FROM world
  WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'