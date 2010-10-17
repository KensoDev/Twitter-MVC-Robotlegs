package com.kensodev.view.mediators
{
	import com.kensodev.events.SearchResultsEvent;
	import com.kensodev.service.helpers.ISearchService;
	import com.kensodev.view.SearchResultsView;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SearchResultsViewMediator extends Mediator
	{
		[Inject]
		public var view:SearchResultsView;
		
		[Inject]
		public var service:ISearchService;
		
		override public function onRegister():void
		{
			addContextListener( SearchResultsEvent.RECEIVED, onRececived);
		}
		
		private function onRececived(event:SearchResultsEvent):void
		{
			view.dataProvider = new ArrayCollection(event.results);
		}
	}
}