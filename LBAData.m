//
//  LBAData.m
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

#import <CHDataStructures/CHDataStructures.h>
#import "LBAData.h"

@implementation LBAData

@synthesize data, parsers, time, source, size, description;

+ (LBAData *) dataWithURL:(NSURL *)url {
	return [[[LBAData alloc] initWithURL:url] autorelease];
}

- (id) initWithURL:(NSURL *)url {
	if ((self = [super init])) {
		self.data = [NSData dataWithContentsOfURL:url];
		self.parsers = [[CHAnderssonTree alloc] init];
		self.time = [NSDate date];
		self.source = [url description];
		self.size = [self.data length];
		self.description = @"";
	}
	return self;
}

@end
