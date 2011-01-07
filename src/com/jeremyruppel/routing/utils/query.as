//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.utils
{

	/**
	 * assembles an object into a query string
	 * 
	 * @see com.jeremyruppel.routing.utils#parse
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  28.09.2010
	 */
	public function query( hash : Object ) : String
	{
		var out : String = '';
		var del : String = '?';
		
		for( var key : String in hash )
		{
			out += del + key + '=' + hash[ key ];
			
			del = '&';
		}
		
		return out;
	}

}