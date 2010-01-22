//
//  LBASource.h
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

#import <Cocoa/Cocoa.h>
#import "LBAEndian.h"

enum LBA_DELIMITER {
	LBA_DELIMIT_BY_PACKET_OR_FILE,
	LBA_DELIMIT_BY_SIZE,
	LBA_DELIMIT_BY_TIMEOUT,
	LBA_DELIMIT_BY_INTERNAL_DATA,
	LBA_DELIMIT_BY_CHARACTER,
};

@interface LBASource : NSObject {
	enum LBA_ENDIAN endian;

	enum LBA_DELIMITER delimiter;
	int delimitSize;
	NSTimeInterval delimitTimeout;
	int internalDelimitDataOffset;
	int internalDelimitDataBytes;
}

@property enum LBA_ENDIAN endian;
@property enum LBA_DELIMITER delimiter;
@property int delimitSize;
@property NSTimeInterval delimitTimeout;
@property int internalDelimitDataOffset;
@property int internalDelimitDataBytes;


@end
