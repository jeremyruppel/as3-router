//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.events
{
	import com.jeremyruppel.routing.core.IRoute;
	import flash.events.Event;

	/**
	 * Event subclass.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  27.09.2010
	 */
	public class RouteEvent extends Event
	{
		//--------------------------------------
		//  CLASS CONSTANTS
		//--------------------------------------
		
		/**
		 * signals that no matching routes were found on a route request
		 */
		public static const NOT_FOUND : String = 'RouteEvent.notFound';
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 *	@constructor
		 */
		public function RouteEvent( type : String, route : IRoute, bubbles : Boolean = true, cancelable : Boolean = false )
		{
			super( type, bubbles, cancelable );
			
			_route = route;
		}
	
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * provides access to this event's associated route
		 * 
		 * @return IRoute
		 */
		public function get route( ) : IRoute
		{
			return _route;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function clone( ) : Event
		{
			return new RouteEvent( type, route, bubbles, cancelable );
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _route : IRoute;
	
	}

}
