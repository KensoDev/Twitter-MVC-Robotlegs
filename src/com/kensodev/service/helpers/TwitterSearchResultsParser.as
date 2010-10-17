package com.kensodev.service.helpers
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.kensodev.model.Tweet;
	
	import mx.effects.Tween;

	public class TwitterSearchResultsParser implements ISearchResultsParser
	{
		public function TwitterSearchResultsParser()
		{
		}
		
		public function parseSearchResults(results:Object):Array
		{
			var decoder:JSONDecoder = new JSONDecoder(String(results), false);
			
			var resultObjects:Array = decoder.getValue().results;
			
			var tweets:Array = [];
			
			for each (var result:Object in resultObjects)
			{
				var tweet:Tweet = new Tweet();
				tweet.user = result.from_user;
				tweet.message = result.text;
				
				tweets.push(tweet);
			}
			
			return tweets;
			
			
		}
	}
}