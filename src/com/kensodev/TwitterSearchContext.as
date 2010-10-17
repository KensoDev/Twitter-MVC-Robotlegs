package com.kensodev
{
	import com.kensodev.command.TwitterSearchCommand;
	import com.kensodev.events.SearchButtonEvent;
	import com.kensodev.service.TwitterSearchService;
	import com.kensodev.service.helpers.ISearchResultsParser;
	import com.kensodev.service.helpers.ISearchService;
	import com.kensodev.service.helpers.TwitterSearchResultsParser;
	import com.kensodev.view.SearchResultsView;
	import com.kensodev.view.mediators.MainApplicationMediator;
	import com.kensodev.view.mediators.SearchResultsViewMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class TwitterSearchContext extends Context
	{
		
		override public function startup():void
		{
			mediatorMap.mapView( SearchResultsView, SearchResultsViewMediator );
			mediatorMap.mapView( twitter_search_mvc, MainApplicationMediator );
			
			commandMap.mapEvent( SearchButtonEvent.SEARCH_BUTTON_CLICKED, TwitterSearchCommand );
		
			injector.mapSingletonOf( ISearchService, TwitterSearchService );
			injector.mapSingletonOf( ISearchResultsParser, TwitterSearchResultsParser );
		}
		
	}
}