SQLZOO_SOLUTIONS

SECTION 3
/// SELECT from Nobel ///


#Winners from 1950

SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950
 
 
#1962 Literature

SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'literature'
 
 
#Albert Einstein

SELECT yr, subject FROM nobel
 WHERE winner='Albert Einstein'


#Recent Peace Prizes

SELECT winner FROM nobel
 WHERE subject='peace' AND yr>=2000
 
 
#Literature in the 1980's

SELECT yr, subject, winner FROM nobel
 WHERE subject='literature' AND (yr BETWEEN 1980 AND 1989)


#Only Presidents

SELECT * FROM nobel 
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')


#John

SELECT winner FROM nobel
 WHERE winner LIKE 'John%'


#Chemistry and Physics from different years

SELECT yr, subject, winner FROM nobel
 WHERE (subject='physics' AND yr=1980) OR (subject='chemistry' AND yr=1984)


#Exclude Chemists and Medics

SELECT yr, subject, winner FROM nobel
 WHERE yr=1980 AND subject NOT IN ('chemistry', 'medicine')


#Early Medicine, Late Literature

SELECT yr, subject, winner FROM nobel
 WHERE (yr<1910 AND subject='medicine') OR (subject='Literature' AND yr>=2004)


#Umlaut

SELECT * FROM nobel
 WHERE winner='PETER GRÜNBERG'


#Apostrophe

SELECT * FROM nobel
 WHERE winner="EUGENE O'NEILL"


#Knights of the realm

SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%' 
 ORDER BY yr DESC, winner


#Chemistry and Physics last

SELECT winner, subject FROM nobel
 WHERE yr=1984 
 ORDER BY subject IN ('physics','chemistry'), subject, winner