//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.rules
{
	import com.jeremyruppel.routing.core.IRoute;
	import com.jeremyruppel.routing.core.IRule;
	import com.jeremyruppel.routing.routes.HashRoute;
	import com.jeremyruppel.routing.utils.parse;

	/**
	 * A routing rule based on a series of query-string parameters.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public class HashRule implements IRule
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function HashRule( hash : Object, eventType : String )
		{
			_hash = hash;
			_eventType = eventType;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _hash : Object;
		
		/**
		 * @private
		 */
		private var _eventType : String;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 */
		public function get eventType( ) : String
		{
			return _eventType;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 * @param route String
		 * @return Boolean 
		 */
		public function matches( route : String ) : Boolean
		{
			var query : Object = parse( route );
			
			for( var key : String in _hash )
			{
				if( !query[ key ] )
				{
					return false;
				}
				
				if( _hash[ key ] is String && _hash[ key ] != query[ key ] )
				{
					return false;
				}
				
				if( _hash[ key ] is RegExp && _hash[ key ].test( query[ key ] ) == false )
				{
					return false;
				}
			}
			
			return true;
		}
		
		/**
		 * @inheritDoc
		 * @param route String
		 * @return IRoute
		 */
		public function execute( route : String ) : IRoute
		{
			return new HashRoute( route, parse( route ) );
		}
	
	}

}
