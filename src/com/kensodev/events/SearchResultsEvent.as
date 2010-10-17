package com.kensodev.events
{
	import flash.events.Event;
	
	public class SearchResultsEvent extends Event
	{
		public var results:Array;
		
		public static const RECEIVED:String = "SearchResultsReceived";

		public function SearchResultsEvent(type:String, results:Array = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.results = results;
		}
		
		override public function clone():Event
		{
			return new SearchResultsEvent(type, results, bubbles, cancelable); 
		}
	}
}