"""
ABSTRACT: A short description of what your code does. This is usually necessary in order to make the user understand is it worth their time to read your code.

"""
import tweepy

import pandas as pd
from tweepy import OAuthHandler
from tweepy import Stream
from tweepy.streaming import StreamListener
from tweepy import Cursor
from tweepy import API
import numpy as np
import math


import twitter_credentials


class TwitterClient():
    def __init__(self,twitter_user = None):
        self.auth = TwitterAuthenticator().authenticate_twitter_app()
        self.twitter_client = API(self.auth)

        self.twitter_user = twitter_user
    def get_twitter_client_api(self):
        return self.twitter_client

    def get_user_timeline_tweets(self,num_tweets):
        tweets=[]

        for tweet in Cursor(self.twitter_client.user_timeline,id=self.twitter_user).items(num_tweets):
            tweets.append(tweet)
        return tweets



class TwitterAuthenticator():
    def authenticate_twitter_app(self):
        auth = OAuthHandler(twitter_credentials.CONSUMER_KEY,twitter_credentials.CONSUMER_SECRET)
        auth.set_access_token(twitter_credentials.ACCESS_TOKEN,twitter_credentials.ACCESS_TOKEN_SECRET)
        return auth


class TwitterStreamer():
    def __init__(self):
        self.twitter_autenticator = TwitterAuthenticator()

    def stream_tweets(self,fetched_tweets_filename,accounts_list):
        listener = TwitterListener(fetched_tweets_filename)
        #auth = OAuthHandler(twitter_credentials.CONSUMER_KEY,twitter_credentials.CONSUMER_SECRET)
        #auth.set_access_token(twitter_credentials.ACCESS_TOKEN,twitter_credentials.ACCESS_TOKEN_SECRET)
        auth = self.twitter_autenticator.authenticate_twitter_app()
        stream = Stream(auth,listener)

        stream.filter(follow=accounts_list)

class TwitterListener(StreamListener):
    def __init__(self,fetched_tweets_filename):
        self.fetched_tweets_filename = fetched_tweets_filename
    def on_data(self, raw_data):
        try:
            print(raw_data)
            with open(self.fetched_tweets_filename,'a') as tf:
                tf.write(raw_data)
            return True
        except BaseException as e:
            print("Error on data %s"% str(e))
        return True

    def on_error(self, status_code):
        if status_code==420:
            return False

        print(status_code)

class TweetAnalyzer():
    def tweets_to_data_frame(self,title,name,tweets):
        df = pd.DataFrame(data=[tweet.text for tweet in tweets], columns=['Tweets'])
        df['team']= [title for tweet in tweets]
        df['id'] = np.array([tweet.id for tweet in tweets])
        df['account'] = [name for tweet in tweets]

        df['len'] = np.array([len(tweet.text) for tweet in tweets])
        df['date'] = np.array([tweet.created_at for tweet in tweets])
        df['likes'] = np.array([tweet.favorite_count for tweet in tweets])
        df['retweets'] = np.array([tweet.retweet_count for tweet in tweets])
        df['#hashtag'] = [len(tweet.entities['hashtags']) for tweet in tweets]
        return df

    def tweets_hashtages(self,df,tweets):
        for tweet in tweets:
            n = len(tweet.entities["hashtags"])
            #df = pd.DataFrame(data=None)
            if n==0:
                continue
            else:
                df = pd.DataFrame(data=[tweet.id], columns=['id'])
                for i in range(0,n):
                    df[i+1]= tweet.entities['hashtags'][i]['text']
           # else:
            #    continue
            #if df[1:n] == None:

#                if tweet.entities['hashtags'][i]['text'] == None:
        return df
            #lst=[]

            #for i in range(0,n):
             #   if tweet.entities['hashtags'][i]['text'] != None:
             #       lst.append(tweet.entities['hashtags'][i]['text'])
             #       df['hashtag'] = df['hashtag'].append(lst)
             #   else:
             #       continue
             #   #df['hashtag'] = df['hashtag'].append(lst)
            #if df['hashtag'] == None:
             #   df['hashtag'] = 0







        #df['hashtag'] = [tweet.entities['hashtags']['text'] if 'text' in tweet.entities['hashtags'] else [] for tweet in tweets]
        # Get the numbers of hashtags

        # Iterate through all the hastags

        # try:
        #     for tweet in tweets:
        #         df['hashtag'] = tweet.entities['hashtags']['text']
        # except:
        #     continue








if __name__=='__main__':

    twitter_client = TwitterClient()
    tweet_analyzer = TweetAnalyzer()

    api = twitter_client.get_twitter_client_api()

    lst = []
    df = pd.read_csv('/Users/QiJin/Desktop/DataBase/HW/NBA_twitter_accounts.csv')
    df = df.set_index("Abbr")
    #print(df)
    for index in df.index:
        #if df.loc[index,"Name":"c6"]

        lst.append(list(df.loc[index,"Name":"c6"]))

    print(lst)
    filepath = "NBA_tweets.csv"
    nba = pd.DataFrame(data=None)
    hashtags = pd.DataFrame(data=None)
    for i in range(len(lst)):
        title = lst[i][0]


        for name in lst[i][1:6]:
            if not str(name) == 'nan':


                tweets = api.user_timeline(screen_name=name, count=20)

                nba= nba.append(tweet_analyzer.tweets_to_data_frame(title,name,tweets),ignore_index=True)
                hash_df = pd.DataFrame(data=None)
                hashtags = hashtags.append(tweet_analyzer.tweets_hashtages(hash_df,tweets), ignore_index=True)
 
    nba.to_csv(filepath, index=False)

    hashtags.to_csv('hashtags.csv',index=False)

    #hashtag table




"""
CONCLUSIONS:

Write what you conclude having written this code. What is your final takeaway from this project

CONTRIBUTIONS:

Mention who contributed what in which part of the code. However, each person contributing should be aware of entire working of the code.

CITATIONS:

Cite the code sources, github repositories, blog posts or any other tutorial referred to help you develop the code.

LICENSE:

Mention the type of license you want your code file to have. It is specifically preferred to have an MIT license, however licensing can vary based on your requirements.

"""
