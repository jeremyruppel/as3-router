//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.utils
{

	/**
	 * capture is an encapsulated method to prepare route strings
	 * for appropriate regexp capture groups.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public function capture( string : String ) : String
	{
		return string.replace( /\*+/g, "(.*)" ).replace( /:(\w+)/g, "(?P<$1>[\\w-]+)" );
	}

}