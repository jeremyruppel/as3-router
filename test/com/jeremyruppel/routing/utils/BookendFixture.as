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
	import com.jeremyruppel.routing.utils.bookend;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public class BookendFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="bookended strings as source for regex cannot match partially")]
		public function test_bookended_strings_as_source_for_regex_cannot_match_partially( ) : void
		{
			var pattern : RegExp = new RegExp( bookend( '/home' ) );
			
			assertThat( pattern.test( '/home/page' ), isFalse( ) );
			assertThat( pattern.test( '/page/home' ), isFalse( ) );
		}
		
		[Test(description="bookended strings only match patterns exactly")]
		public function test_bookended_strings_only_match_patterns_exactly( ) : void
		{
			var pattern : RegExp = new RegExp( bookend( '/home' ) );
			
			assertThat( pattern.test( '/home' ), isTrue( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function BookendFixture( )
		{
		}
	
	}

}
