//
//  LBAParserToolbar.m
//  Alberti
//
//  Created by Matt Bauman on 1/24/10.
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

#import "LBAParserToolbar.h"
#import "LBAParser.h"
#import "LBAParserControl.h"

static NSSize defaultSize = {80,20};

@implementation LBAParserToolbar

- (BOOL) isFlipped {
	return YES;
}

- (void) populateParsers {
	while ([[self subviews] count]) [[[self subviews] lastObject] removeFromSuperview];
	NSArray *parserTypes = [LBAParser registeredParsers];
	for (Class p in parserTypes) {
		/* TODO: Dynamically place these frames */
		NSRect frame = {.origin = {10,10}, .size = defaultSize};
		[self addSubview:[[[LBAParserControl alloc] initWithFrame:frame modelClass:p] autorelease]];
		
	}
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self populateParsers];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

@end
