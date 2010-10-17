package com.kensodev.service
{
	import com.kensodev.events.SearchResultsEvent;
	import com.kensodev.service.helpers.ISearchResultsParser;
	import com.kensodev.service.helpers.ISearchService;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import org.robotlegs.mvcs.Actor;
	
	public class TwitterSearchService extends Actor implements ISearchService
	{
		private var _parser:ISearchResultsParser;
		
		[Inject]
		public function set parser(value:ISearchResultsParser):void
		{
			_parser = value;
		}
		
		private var loader:URLLoader;
		
		public function TwitterSearchService()
		{
			loader = new URLLoader();
		}
		
		private const TWITTER_SEARCH_JSON_URL:String = "http://search.twitter.com/search.json";
		public function populateResults(query:String = "robotlegs"):void
		{
			var urlRequest:URLRequest = new URLRequest(TWITTER_SEARCH_JSON_URL);
			var params:URLVariables = new URLVariables();
			
			params.q = query;
			params.rpp = 100;
			urlRequest.data = params;
			
			addLoaderListeners();
			
			loader.load(urlRequest);
		}
		
		private function handleError(event:SecurityErrorEvent):void
		{
			removeLoaderListeners();
		}
		
		private function handleLoadComplete(event:Event):void
		{
			var data:Object = loader.data;
			var results:Array = _parser.parseSearchResults(data);
			dispatch(new SearchResultsEvent(SearchResultsEvent.RECEIVED, results))
			removeLoaderListeners();
		}
		
		private function addLoaderListeners():void
		{
			loader.addEventListener(IOErrorEvent.IO_ERROR, handleError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.addEventListener(Event.COMPLETE, handleLoadComplete);
		}
		
		private function removeLoaderListeners():void
		{
			loader.removeEventListener(IOErrorEvent.IO_ERROR, handleError);
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleError);
			loader.removeEventListener(Event.COMPLETE, handleLoadComplete);
		}
	}
}