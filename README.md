# NBA database
# Abstract
The domain is NBA, including statistics of teams and players from last assignment, tweets from Twitter scrapted by Twitter API and Tweepy.
This database will allow us to search statistics of players and teams from 2017-2018 regular season, reaching players personal performances, salaries, also teams' major twitter accounts and their tweets.

* * *

# Introduction


#### Part 1 Conceptual Stage

- **A domain**<br/>
  >This project is about NBA.

- **Conceptual models (entities) for a tweet/post, a Social Media user, a person, and a company.** <br/>
  >For tweet/post, the entities contain tweets, post date, likes, hashtags.<br/> 
  >For social media user, the entities contain information like their id, screen name, the team they belong to.<br/>
  >Persons are player, have attributes including personal information, salary, performance in this entity.<br/>
  >Companies are NBA teams, have attributes including team statitcs.<br/>


- **Conceptual models (entities) that represent consumers, producers and companies in your chosen domain.** <br/>
  >Consumers are the NBA fans.<br/>
  >Producers are the major Twitter accounts of NBA teams.<br/>
  >Companies are NBA teams.<br/>

- **Conceptual models (entities) for at least two things specific to the domain.**<br/>
  >Including Team Statistic, Player Statistic, Major Twitter Accounts, Tweets etc.

- **Relationships that connect the entities.**<br/>

    >Showed in the ERD.

- **Appropriate attributes and keys.**

    >Showed in the ERD.

- **ER diagrams that illustrate the entire conceptual model.**<br/>
    >Showed in the ERD.

- **7 questions**<br/>

    1. *What are the ranges, data types and format of all of the attributes in your entities?*<br/>
        >Showed in the ERD.<br/>
        Text, like names, tweets.<br/>
        Double, like FG%.<br/>
        Int, like points.<br/>
        Date.
        

    2. *When should you use an entity versus attribute? (Example: address of a person could be
        modeled as either)*<br/>
        >When a attribute would cause the redundance in a entity, we should seprate it into several entities.
        For example, if I mix the Tweets with the Team statistics, each team has only one row of statistics, but has multiple tweets, it would cause redundance in this entity.

    3. *When should you use an entity or relationship, and placement of attributes? (Example: a
        manager could be modeled as either)*<br/>
        >When data do not have uniform attributes, or have different numbers, hashtags for example, each tweet may has or has no hashtags, and number of hashtags may change, we should use entity. Otherwise, it is better to use attibutes.

    4. *How did you choose your keys? Which are unique?*<br/>
        >Primary keys should be unique. For example, in Tweets table, IDs are unique.

    5. *Did you model hierarchies using the “ISA” design element? Why or why not?*<br/>
        >Yes, for twitter account, i create a table called nba_twitter_account to store all accounts, and another table called nba_twitter to store all tweets. Using the "ISA" design can build a one to many relationship so that enhancing the performance of the database, and also making the database more easy to search.

    6. *Were there design alternatives? What are their trade-offs: entity vs. attribute, entity vs.
        relationship, binary vs. ternary relationships?*<br/>

        >Attributes in one entity can be retrieved easily, but it may led to have many null value, eg. phone number.
         So using extra entity to store data that changed a lot can be more reasonable, like hashtags table.
        >
        >When search the tweets relate to each team, using binary relationship is hard to deal with, because teams have multiple accounts, and accounts have multiple tweets. Using ternary relationship can deal with this situation, first link the team to its accounts, then link the account to its tweets.<br/>

    7. *Where are you going to find real-world data to populate your model?*<br/>
        > Downloaded directly from Kaggle.com, web scraped from RealGM.com, and FantasyData API.<br/>
          Tweets data is scraped by tweepy from Twitter.


* * *


#### Part 2 Physical Stage

- **Updated ER diagrams that illustrate the entire conceptual model in a form that directly maps to SQL.** <br/>
  >Showed in the final ERD.

- **SQL and diagram for the physical model that represents the entire conceptual/physical model.**<br/>
  >Showed in Physical_Database Folder.

- **SQL that express the queries you are asked to write. Including:**<br/>
   > This is showed in question.sql file.
    


- **SQL expressions that express the 5 (10 if two people) use cases of queries that you write.**<br/>
  > Showed in usercase.sql file

 
* * *

# References
#### [tweepy](https://tweepy.readthedocs.io/)
#### [Twitter Developer](https://developer.twitter.com/en/docs)
#### [Twitter Developer Doc](https://developer.twitter.com/en/docs)<br/>
#### [MySQL](https://dev.mysql.com/doc/refman/8.0/en/load-data.html)
#### Python tutorial(https://www.w3schools.com/python/python_operators.asp)<br/>
#### 2017-2018 NBA Regular Season Statsa[RealGM](https://basketball.realgm.com/nba/stats/2018/Averages/All/points/All/desc/1/Regular_Season).
#### Web API from FantasyData

[All-Star](https://developer.fantasydata.com/docs/services/584f728a35491a16a4720f49/operations/5a70c9a135491a0ab00a814f) 
[Teams Stats](https://developer.fantasydata.com/docs/services/584f728a35491a16a4720f49/operations/584f728a35491a0d440a48f7) 
[Players Details](https://developer.fantasydata.com/docs/services/584f728a35491a16a4720f49/operations/584f728a35491a0d440a48e6)
#### Ryan Mitchell.April 2018.Web Scraping with Python, 2nd Edition.ISBN: 9781491985571

#### Professor Nicholas Brown
https://github.com/nikbearbrown/INFO_6210/blob/master/Week_2/NBB_Data_cleaning_IMDB.ipynb https://github.com/nikbearbrown/INFO_6210/blob/master/Week_2/NBB_Data_Munging_Wrangling.ipynb

#### Python Online Tutorials and Forums

https://www.tutorialspoint.com/python 
https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.rename.html 
https://erikrood.com/Python_References/change_order_dataframe_columns_final.html 
https://stackoverflow.com/questions/13682044/remove-unwanted-parts-from-strings-in-a-column 
https://www.geeksforgeeks.org/python-pandas-dataframe-fillna-to-replace-null-values-in-dataframe 
https://chrisalbon.com/python/data_wrangling/pandas_list_unique_values_in_column 
https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.rename.html 
https://stackoverflow.com/questions/33165734/update-index-after-sorting-data-frame
#### [Pandas documentation](https://pandas.pydata.org/pandas-docs/stable/index.html)

* * *

