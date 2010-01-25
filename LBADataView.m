//
//  LBADataView.m
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

#import "LBADataView.h"
#import "LBAData.h"

@implementation LBADataView

@synthesize rawData;

/* The rawDataArray is bound to the Array Controller's selection. I have little
 * use for an array -- just convert it directly to the object (and back) */
- (NSArray *) rawDataArray {
	if (!self.rawData) return nil;
	return [NSArray arrayWithObject:self.rawData];
}

- (void) setRawDataArray:(NSArray *)newArray {
	self.rawData = [newArray lastObject];
	[self setNeedsDisplayInRect:[self visibleRect]];	
}

+ (void) initialize {
	[self exposeBinding:@"rawDataArray"];
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
	[[NSColor whiteColor] set];
	NSRectFill([self bounds]);

	if (rawData) {
		NSString *desc = [rawData.data description];
		NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys: [NSColor blackColor], NSForegroundColorAttributeName, [NSFont systemFontOfSize:12], NSFontAttributeName, nil];
		NSSize descSize = [desc sizeWithAttributes:textAttributes];
		NSPoint midPoint = NSMakePoint(NSMidX([self bounds]), NSMidY([self bounds]));
		NSPoint namesTextPoint = NSMakePoint(midPoint.x - descSize.width - 2, midPoint.y - (descSize.height / 2));
		[desc drawAtPoint:namesTextPoint withAttributes:textAttributes];
	}
}

- (BOOL) isFlipped {
	return YES;
}

- (void)dealloc {
	[rawData release];
	[super dealloc];
}

@end
