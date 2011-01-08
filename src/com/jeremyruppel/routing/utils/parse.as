//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.utils
{

	/**
	 * parses a query string into an object
	 * 
	 * @see com.jeremyruppel.routing.utils#query
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  13.09.2010
	 */
	public function parse( hash : String ) : Object
	{
		var result : Object = new Object( );
		
		if( false == /\?\w+\=\w/.test( hash ) )
		{
			return result;
		}
		
		var query : String = hash.split( '?' ).pop( );
		
		for each( var pair : String in query.split( '&' ) )
		{
			var value : Array = pair.split( '=' );
			
			result[ value[ 0 ] ] = value[ 1 ];
		}
		
		return result;
	}

}

