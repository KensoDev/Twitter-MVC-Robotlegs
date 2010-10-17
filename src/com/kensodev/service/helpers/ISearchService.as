package com.kensodev.service.helpers
{
	public interface ISearchService
	{
		function populateResults(query:String="robotlegs"):void;
		
		function set parser(value:ISearchResultsParser):void;
		
	}
}