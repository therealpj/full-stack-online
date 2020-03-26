# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
    SELECT count(id) from stops
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
  SELECT id from stops where name = 'Craiglockhart'
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
    SELECT stops.id, stops.name from stops join routes on stops.id = routes.stop_id WHERE num = '4' and company='LRT'
  SQL
end

def connecting_routes
  # Consider the following query:



  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
  SELECT
    company,
    num,
    COUNT(*)
  FROM
    routes
  WHERE
    stop_id = 149 OR stop_id = 53
  GROUP BY
    company, num
    HAVING count(*) = 2
  SQL
end

def cl_to_lr
  # Consider the query:
  #

  #
  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)
  SELECT
    a.company,
    a.num,
    a.stop_id,
    b.stop_id
  FROM
    routes a
  JOIN
    routes b ON (a.company = b.company AND a.num = b.num)
  WHERE
    a.stop_id = 53 and b.stop_id = 149
  SQL
end

def cl_to_lr_by_name
  # Consider the query:

  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
    SELECT
      a.company,
      a.num,
      stopa.name,
      stopb.name
    FROM
      routes a
    JOIN
      routes b ON (a.company = b.company AND a.num = b.num)
    JOIN
      stops stopa ON (a.stop_id = stopa.id)
    JOIN
      stops stopb ON (b.stop_id = stopb.id)
    WHERE
      stopa.name = 'Craiglockhart'
    and
      stopb.name = 'London Road'
  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
  SELECT DISTINCT R1.company, R1.num
    FROM routes R1, routes R2
    WHERE R1.num=R2.num AND R1.company=R2.company
      AND R1.stop_id=115 AND R2.stop_id=137
  ;
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
  SELECT R1.company, R1.num
  FROM routes R1, routes R2, stops S1, stops S2
  WHERE R1.num=R2.num AND R1.company=R2.company
    AND R1.stop_id=S1.id AND R2.stop_id=S2.id
    AND S1.name='Craiglockhart'
    AND S2.name='Tollcross';

  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
  SELECT DISTINCT S2.name, R2.company, R2.num
FROM stops S1, stops S2, routes R1, routes R2
WHERE S1.name='Craiglockhart'
  AND S1.id=R1.stop_id
  AND R1.company=R2.company AND R1.num=R2.num
  AND R2.stop_id=S2.id

  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
  SELECT DISTINCT a.num, a.company, stopb.name ,  c.num,  c.company
  FROM routes a JOIN routes b
  ON (a.company = b.company AND a.num = b.num)
  JOIN ( routes c JOIN routes d ON (c.company = d.company AND c.num= d.num))
  JOIN stops stopa ON (a.stop_id = stopa.id)
  JOIN stops stopb ON (b.stop_id = stopb.id)
  JOIN stops stopc ON (c.stop_id = stopc.id)
  JOIN stops stopd ON (d.stop_id = stopd.id)
  WHERE stopa.name = 'Craiglockhart' AND stopd.name = 'Sighthill'
              AND  stopb.name = stopc.name
  ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num

  SQL
end
