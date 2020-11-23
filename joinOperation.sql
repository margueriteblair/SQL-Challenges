1. 
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

2.
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012;

3.SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER';

4.SELECT game.team1, game.team2, goal.player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE 'Mario%';

5.SELECT goal.player, goal.teamid, eteam.coach, goal.gtime FROM goal JOIN eteam ON goal.teamid=eteam.id WHERE gtime<=10;

6.SELECT game.mdate, eteam.teamname FROM game JOIN eteam ON game.team1=eteam.id WHERE eteam.coach LIKE 'Fernando Santos'

