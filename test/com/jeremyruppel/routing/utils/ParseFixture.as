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
	import com.jeremyruppel.routing.utils.parse;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.hasPropertyWithValue;
	import org.hamcrest.object.instanceOf;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  13.09.2010
	 */
	public class ParseFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------

		[Test(description="parse returns empty object when parsing empty string")]
		public function test_parse_returns_empty_object_when_parsing_empty_string( ) : void
		{
			var result : Object = parse( '' );
			
			assertThat( result, instanceOf( Object ) );
			
			var keys : Array = new Array( );
			
			for( var key : String in result )
			{
				keys.push( key );
			}
			
			assertThat( keys, arrayWithSize( 0 ) );
		}
		
		[Test(description="parse returns empty object if no query string match is found")]
		public function test_parse_returns_empty_object_if_no_query_string_match_is_found( ) : void
		{
			var result : Object = parse( '/this/is/a/test' );
			
			assertThat( result, instanceOf( Object ) );
			
			var keys : Array = new Array( );
			
			for( var key : String in result )
			{
				keys.push( key );
			}
			
			assertThat( keys, arrayWithSize( 0 ) );
		}
		
		[Test(description="parse does not match first half of query only")]
		public function test_parse_does_not_match_first_half_of_query_only( ) : void
		{
			var result : Object = parse( '/this/is/a/test?variable' );
			
			assertThat( result, instanceOf( Object ) );
			
			var keys : Array = new Array( );
			
			for( var key : String in result )
			{
				keys.push( key );
			}
			
			assertThat( keys, arrayWithSize( 0 ) );
		}
		
		[Test(description="parse does not match first half of query with equals only")]
		public function test_parse_does_not_match_first_half_of_query_with_equals_only( ) : void
		{
			var result : Object = parse( '/this/is/a/test?variable=' );
			
			assertThat( result, instanceOf( Object ) );
			
			var keys : Array = new Array( );
			
			for( var key : String in result )
			{
				keys.push( key );
			}
			
			assertThat( keys, arrayWithSize( 0 ) );
		}
		
		[Test(description="parse does not match variable not preceded by question delimeter")]
		public function test_parse_does_not_match_variable_not_preceded_by_question_delimeter( ) : void
		{
			var result : Object = parse( '/this/is/a/test&variable=oops' );
			
			assertThat( result, instanceOf( Object ) );
			
			var keys : Array = new Array( );
			
			for( var key : String in result )
			{
				keys.push( key );
			}
			
			assertThat( keys, arrayWithSize( 0 ) );
		}
		
		[Test(description="parse matches one variable as expected")]
		public function test_parse_matches_one_variable_as_expected( ) : void
		{
			var result : Object = parse( '/this/is/a/test?variable=hello' );
			
			assertThat( result, hasPropertyWithValue( 'variable', 'hello' ) );
		}
		
		[Test(description="parse matches two variables as expected")]
		public function test_parse_matches_two_variables_as_expected( ) : void
		{
			var result : Object = parse( '/this/is/a/test?one=hello&two=world' );
			
			assertThat( result, hasPropertyWithValue( 'one', 'hello' ) );
			assertThat( result, hasPropertyWithValue( 'two', 'world' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ParseFixture( )
		{
		}
	
	}

}
