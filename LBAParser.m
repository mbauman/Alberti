//
//  LBAParser.m
//  Alberti
//
//  Created by Matt Bauman on 1/28/10.
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

#import "LBAParser.h"

static NSMutableArray *registeredParsers = nil;

@implementation LBAParser

@synthesize offset, width;

- (void)setWidth:(NSUInteger)requestedWidth {
	width = [[self class] nearestAllowedWidth:requestedWidth];
}

#pragma mark -
#pragma mark Subclass Registry

+ (void) registerParser:(Class)parser {
	if (registeredParsers == nil) {
		registeredParsers = [[NSMutableArray alloc] init];
	}
	[registeredParsers addObject:parser];
}

+ (NSArray *) registeredParsers {
	return [NSArray arrayWithArray:registeredParsers];
}

#pragma mark -
#pragma mark Methods to Override

+ (NSString *) shortName {
	/* Note that this base implementation is not a _short_ name. Override it! */
	return NSStringFromClass(self);
}
+ (NSColor *) colorWithAlpha:(CGFloat)alpha {
	NSAssert(0,@"The 'colorWithAlpha:' method must be overridden by a concrete subclass");
}
+ (NSUInteger) nearestAllowedWidth:(NSUInteger)requestedWidth {
	NSAssert(0,@"The 'allowedWidths' method must be overridden by a concrete subclass");
}
- (NSString *)parse:(LBAData *)data {
	NSAssert(0,@"The 'parse:' method must be overridden by a concrete subclass");
}

@end
