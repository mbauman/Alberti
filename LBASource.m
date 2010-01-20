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

@synthesize endian;

#pragma mark delimiter setters
- (void)delimitByPacketOrFile {
	delimiter = LBA_DELIMIT_BY_PACKET_OR_FILE;
}

- (void)delimitBySize:(int)size {
	delimiter = LBA_DELIMIT_BY_SIZE;
	delimitSize = size;
}

- (void)delimitByTimeout:(NSTimeInterval)timeout {
	delimiter = LBA_DELIMIT_BY_TIMEOUT;
	delimitTimeout = timeout;
}

- (void)delimitByInternalDataAtOffset:(int)offset ofSize:(int)bytes {
	delimiter = LBA_DELIMIT_BY_INTERNAL_DATA;
	internalDelimitDataOffset = offset;
	internalDelimitDataBytes = bytes;
}


@end
