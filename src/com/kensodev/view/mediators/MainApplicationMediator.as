package com.kensodev.view.mediators
{
	import com.kensodev.events.SearchButtonEvent;
	import com.kensodev.view.SearchComponentView;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class MainApplicationMediator extends Mediator
	{
		[Inject]
		public var view:SearchComponentView;
		
		override public function onRegister():void
		{
			view.cmdSearch.addEventListener( MouseEvent.CLICK, onClick );
		}
		
		private function onClick(e:MouseEvent):void
		{
			dispatch( new SearchButtonEvent(SearchButtonEvent.SEARCH_BUTTON_CLICKED, view.searchText.text) );
		}
	}
}