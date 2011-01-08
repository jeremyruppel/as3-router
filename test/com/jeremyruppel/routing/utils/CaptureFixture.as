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
	import com.jeremyruppel.routing.utils.capture;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasPropertyWithValue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public class CaptureFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="capture leaves strings without the proper delimeters alone")]
		public function test_capture_leaves_strings_without_the_proper_delimeters_alone( ) : void
		{
			assertThat( capture( '/home/test' ), equalTo( '/home/test' ) );
		}
		
		[Test(description="passing captured strings into regexp captures as expected")]
		public function test_passing_captured_strings_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/home/*' ) );
			
			var result : Object = pattern.exec( '/home/story' );
			
			assertThat( result[ 1 ], equalTo( 'story' ) );
		}
		
		[Test(description="passing more than one captured string into regexp captures as expected")]
		public function test_passing_more_than_one_captured_string_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/home/*/*' ) );
			
			var result : Object = pattern.exec( '/home/sub/one' );
			
			assertThat( result[ 1 ], equalTo( 'sub' ) );
			
			assertThat( result[ 2 ], equalTo( 'one' ) );
		}
		
		[Test(description="passing separated captured strings into regexp captures as expected")]
		public function test_passing_separated_captured_strings_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/*/home/*' ) );
			
			var result : Object = pattern.exec( '/one/home/two' );
			
			assertThat( result[ 1 ], equalTo( 'one' ) );
			assertThat( result[ 2 ], equalTo( 'two' ) );
		}
		
		[Test(description='passing captured string followed by literal captures as expected')]
		public function test_passing_captured_string_followed_by_literal_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/*/home' ) );
			
			var result : Object = pattern.exec( '/username/home' );
			
			assertThat( result[ 1 ], equalTo( 'username' ) );
		}
		
		[Test(description="passing named captures into regexp captures as expected")]
		public function test_passing_named_captures_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/home/:page' ) );
			
			var result : Object = pattern.exec( '/home/downloads' );
			
			assertThat( result, hasPropertyWithValue( 'page', 'downloads' ) );
		}
		
		[Test(description="passing more than one named capture into regexp captures as expected")]
		public function test_passing_more_than_one_named_capture_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/downloads/:filename/:format' ) );
			
			var result : Object = pattern.exec( '/downloads/photo/jpg' );
			
			assertThat( result, hasPropertyWithValue( 'filename', 'photo' ) );
			assertThat( result, hasPropertyWithValue( 'format', 'jpg' ) );
		}
		
		[Test(description="passing separated named captures into regexp captures as expected")]
		public function test_passing_separated_named_captures_into_regexp_captures_as_expected( ) : void
		{
			var pattern : RegExp = new RegExp( capture( '/:page/start/:where' ) );
			
			var result : Object = pattern.exec( '/home/start/about' );
			
			assertThat( result, hasPropertyWithValue( 'page', 'home' ) );
			assertThat( result, hasPropertyWithValue( 'where', 'about' ) );
		}
		
		[Test(description="capture with name index overwrites exec result object index property")]
		public function test_capture_with_name_index_overwrites_exec_result_object_index_property( ) : void
		{
			var normal : Object = new RegExp( '/pattern' ).exec( '/test/pattern' );
			
			assertThat( normal, hasPropertyWithValue( 'index', 5 ) );
			
			var pattern : RegExp = new RegExp( capture( '/test/:index' ) );
			
			var result : Object = pattern.exec( '/test/one' );
			
			assertThat( result, hasPropertyWithValue( 'index', 'one' ) );
		}
		
		[Test(description="capture with name input overwrites exec result object input property")]
		public function test_capture_with_name_input_overwrites_exec_result_object_input_property( ) : void
		{
			var normal : Object = new RegExp( '/pattern' ).exec( '/test/pattern' );
			
			assertThat( normal, hasPropertyWithValue( 'input', '/test/pattern' ) );
			
			var pattern : RegExp = new RegExp( capture( '/test/:input' ) );
			
			var result : Object = pattern.exec( '/test/one' );
			
			assertThat( result, hasPropertyWithValue( 'input', 'one' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CaptureFixture( )
		{
		}
			
	}

}