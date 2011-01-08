//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.base
{
	import com.jeremyruppel.routing.core.IRouter;
	import com.jeremyruppel.routing.core.IRule;
	import com.jeremyruppel.routing.events.RouteEvent;
	import com.jeremyruppel.routing.rules.HashRule;
	import com.jeremyruppel.routing.rules.RegExpRule;
	import com.jeremyruppel.routing.utils.bookend;
	import com.jeremyruppel.routing.utils.capture;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Basic router that will map routes to events and dispatch them.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  08.09.2010
	 */
	public class Router extends EventDispatcher implements IRouter,IEventDispatcher
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function Router( eventDispatcher : IEventDispatcher = null )
		{
			_eventDispatcher = eventDispatcher;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		/**
		 * @private
		 */
		private var _rules : Array;
		
		/**
		 * @private
		 */
		private var _eventDispatcher : IEventDispatcher;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * @private
		 */
		public function get rules( ) : Array
		{
			return _rules || ( _rules = new Array( ) );
		}
		
		/**
		 * @inheritDoc
		 */
		public function get eventDispatcher( ) : IEventDispatcher
		{
			return _eventDispatcher || ( _eventDispatcher = this );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		/**
		 * @inheritDoc
		 * @param route String
		 * @param eventType String
		 */
		public function mapRoute( route : String, eventType : String ) : void
		{
			mapPattern( new RegExp( bookend( capture( route ) ) ), eventType );
		}
		
		/**
		 * @inheritDoc
		 * @param pattern RegExp
		 * @param eventType String
		 */
		public function mapPattern( pattern : RegExp, eventType : String ) : void
		{
			rules.push( new RegExpRule( pattern, eventType ) );
		}

		/**
		 * @inheritDoc
		 * @param hash Object
		 * @param eventType String
		 */
		public function mapQuery( hash : Object, eventType : String ) : void
		{
			rules.push( new HashRule( hash, eventType ) );
		}

		/**
		 * @inheritDoc
		 * @param route String
		 * @return Boolean 
		 */
		public function hasRoute( route : String ) : Boolean
		{
			for each( var rule : IRule in rules )
			{
				if( rule.matches( route ) )
				{
					return true;
				}
			}
			
			return false;
		}

		/**
		 * @inheritDoc
		 * @param route String
		 */
		public function route( route : String ) : void
		{
			for each( var rule : IRule in rules )
			{
				if( rule.matches( route ) )
				{
					eventDispatcher.dispatchEvent( new RouteEvent( rule.eventType, rule.execute( route ) ) );
					
					return;
				}
			}
			
			eventDispatcher.dispatchEvent( new RouteEvent( RouteEvent.NOT_FOUND, new Route( route ) ) );
		}
	
	}

}
