#drop table NBA_Twitter;
#create table NBA_Twitter as
#select n.*, h.N1, h.N2, h.N3
#from nba_tweets n left join hashtags h on n.id = h.id;

-- a. What user posted this (e.g. tweet, facebook post, IG post, etc.)?
select distinct account from nba_twitter;

select account from nba_twitter
where Tweets like "%he might as%";

-- b. When did the user post this (e.g. tweet, facebook post, IG post, etc.)??
select date from nba_twitter
where Tweets like "%plenty of ball left%";

select date from nba_twitter
where Tweets like "%you think Kevin%";

-- c. What posts has this user posted in the past 24 hours?
select Tweets from nba_twitter
where (account = "@ATLHawks" and date >= (select DATE_SUB((select max(date) 
												from nba_twitter
												where account = '@ATLHawks')
                                                ,interval 1 day)));

-- d. How many post has this user posted in the past 24 hours?
select count(Tweets) from nba_twitter
where (account = "@ATLHawks" and date >= (select DATE_SUB((select max(date) 
												from nba_twitter
												where account = '@ATLHawks')
                                                ,interval 1 day)));
-- e. What keywords/ hashtags are popular?
select likes,N1,N2,N3
from nba_twitter
where N1 is not NULL
order by likes DESC
limit 20;

-- f. What posts are popular?
select team, account, Tweets, likes 
from nba_twitter
order by likes DESC
limit 20;

 
