package com.kensodev.command
{
	import com.kensodev.events.SearchButtonEvent;
	import com.kensodev.service.helpers.ISearchService;
	
	import org.robotlegs.mvcs.Command;
	
	public class TwitterSearchCommand extends Command
	{
		[Inject]
		public var event:SearchButtonEvent;
		
		[Inject]
		public var service:ISearchService;
		
		override public function execute():void
		{
			service.populateResults( event.query );		
		}
	}
}