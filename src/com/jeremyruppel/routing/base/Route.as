//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.base
{
	import com.jeremyruppel.routing.core.IRoute;

	/**
	 * Basic route with no captures or parameters.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  28.09.2010
	 */
	public class Route implements IRoute
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function Route( value : String )
		{
			_value = value;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		protected var _captures : Array;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * @inheritDoc
		 */
		public function get value( ) : String
		{
			return _value;
		}

		/**
		 * @inheritDoc
		 */
		public function get captures( ) : Array
		{
			return _captures || ( _captures = new Array( ) );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 * @param key String
		 * @return String 
		 */
		public function params( key : String ) : String
		{
			return null;
		}
	
	}

}