//
//  LBASource.m
//  Alberti
//
//  Created by Matt Bauman on 1/14/10.
//  The MIT license: Copyright (c) 2010 Matt Bauman.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to 
//  deal in the Software without restriction, including without limitation the 
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "LBASource.h"


@implementation LBASource

@synthesize delimiter, delimitSize, delimitTimeout;
@synthesize internalDelimitDataOffset, internalDelimitDataBytes, endian;

/* Provide enumeration checking on the enum setters */
- (void) setDelimiter:(enum LBA_DELIMITER)value {
	NSAssert(value == LBA_DELIMIT_BY_PACKET_OR_FILE ||
		     value == LBA_DELIMIT_BY_SIZE           ||
			 value == LBA_DELIMIT_BY_TIMEOUT        ||
		     value == LBA_DELIMIT_BY_INTERNAL_DATA  ||
             value == LBA_DELIMIT_BY_CHARACTER, @"Invalid delimiter enum");
	delimiter = value;
}
- (void) setEndian:(enum LBA_ENDIAN)value {
	NSAssert(value == LBA_ENDIAN_SAME_AS_HOST ||
			 value == LBA_ENDIAN_NETWORK      ||
			 value == LBA_ENDIAN_LITTLE       ||
			 value == LBA_ENDIAN_BIG, @"Invalid endian enum");
	endian = value;
}

- (void) collect:(id)delegate {
	/* Subclasses must override this method */
	NSAssert(0,@"This method must be implemented by the subclass");
}

@end
