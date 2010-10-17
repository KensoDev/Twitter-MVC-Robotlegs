package com.kensodev.events
{
	import flash.events.Event;
	
	public class SearchButtonEvent extends Event
	{
		public static const SEARCH_BUTTON_CLICKED:String = "SEARCH_BUTTON_CLICKED";
		
		public var query:String;
		
		public function SearchButtonEvent(type:String, query:String = "", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.query = query;
		}
	}
}