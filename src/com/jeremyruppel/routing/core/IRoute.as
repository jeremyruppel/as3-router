//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.core
{

	/**
	 * Interface describing the contract for a Route object.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  08.09.2010
	 */
	public interface IRoute
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/**
		 * returns a value for a named capture in a route
		 * 
		 * @return String
		 */
		function params( key : String ) : String;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * the string value that triggered this route
		 */
		function get value( ) : String;
		
		/**
		 * a collection of all captures captured in the route
		 */
		function get captures( ) : Array;
		
	}

}