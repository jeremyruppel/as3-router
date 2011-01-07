//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
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