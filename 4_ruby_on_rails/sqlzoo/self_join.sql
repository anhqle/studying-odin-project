-- 5.
-- Execute the self join shown and observe that b.stop gives all the places you can
-- get to from Craiglockhart, without changing routes. Change the query so that it
-- shows the services from Craiglockhart to London Road

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=(SELECT id FROM stops WHERE name='London Road')

-- 6.
-- The query shown is similar to the previous one, however by joining two copies 
-- of the stops table we can refer to stops by name rather than by number. 
-- Change the query so that the services between 'Craiglockhart' and 'London Road' 
-- are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name="Tollcross"

-- 7.
-- Give a list of all the services which connect stops 115 and 137 
-- ('Haymarket' and 'Leith')

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137

-- 8.
-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

SELECT a.company, a.num
FROM route a JOIN route b
ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop = stopsa.id)
JOIN stops stopsb ON (b.stop = stopsb.id)
WHERE stopsa.name='Craiglockhart' AND stopsb.name='Tollcross'

-- 9.
-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by 
-- taking one bus, including 'Craiglockhart' itself. Include the company and bus 
-- no. of the relevant services.

SELECT stopsb.name, b.company, b.num
FROM route a JOIN route b
ON (a.company=b.company AND a.num=b.num)
JOIN stops stopsa ON (a.stop = stopsa.id)
JOIN stops stopsb ON (b.stop = stopsb.id)
WHERE stopsa.name='Craiglockhart'


-- 10.
-- Find the routes involving two buses that can go from Craiglockhart to Sighthill.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.

SELECT bus1.num, bus1.company, stops.name, bus2.num, bus2.company
FROM
(SELECT a1.num as num, a1.company as company, b1.stop as transfer
FROM 
route a1 JOIN route b1 ON (a1.company = b1.company AND a1.num = b1.num) JOIN stops s1 ON (s1.id = a1.stop)
WHERE s1.name='Craiglockhart') AS bus1
JOIN
(SELECT a2.num as num, a2.company as company, a2.stop as transfer
FROM 
route a2 JOIN route b2 ON (a2.company = b2.company AND a2.num = b2.num) JOIN stops s2 ON (s2.id = b2.stop)
WHERE s2.name='Sighthill') AS bus2
ON (bus1.transfer = bus2.transfer)
JOIN stops ON (bus1.transfer=stops.id)
ORDER BY bus1.num, bus1.company, stops.name, bus2.num, bus2.company
