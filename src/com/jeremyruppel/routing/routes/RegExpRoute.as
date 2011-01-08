//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.routes
{
	import com.jeremyruppel.routing.base.Route;

	/**
	 * A route based on a regular expression pattern.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  27.09.2010
	 */
	public class RegExpRoute extends Route
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function RegExpRoute( result : Array, params : Object = null )
		{
			super( result[ 0 ] );
			
			_result = result;
			_params = params || { };
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _result : Array;
		
		/**
		 * @private
		 */
		private var _params : Object;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function get captures( ) : Array
		{
			return _result.slice( 1 );
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 * @param key String
		 * @return String 
		 */
		override public function params( key : String ) : String
		{
			return _result[ key ] || _params[ key ];
		}
	
	}

}
