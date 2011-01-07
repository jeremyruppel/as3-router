//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.routes
{
	import com.jeremyruppel.routing.base.Route;

	/**
	 * A route based on a series of query-string parameters.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  27.09.2010
	 */
	public class HashRoute extends Route
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function HashRoute( value : String, result : Object )
		{
			super( value );
			
			_result = result;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		/**
		 * @private
		 */
		private var _result : Object;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * @inheritDoc
		 */
		override public function get captures( ) : Array
		{
			return _captures || ( _captures = enumerate( ) );
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
			return _result[ key ];
		}
		
		//--------------------------------------
		//  PRIVATE & PROTECTED METHODS
		//--------------------------------------
		
		/**
		 * @private
		 * @return Array 
		 */
		private function enumerate( ) : Array
		{
			var array : Array = new Array( );
			
			for( var key : String in _result )
			{
				array.push( _result[ key ] );
			}
			
			return array;
		}
	
	}

}
