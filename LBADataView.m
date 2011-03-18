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

extern NSString *LBAParserPboardType;

@implementation LBADataView

@synthesize rawData;
@synthesize rawHexTextAttributes, offsetTextAttributes, parsedTextAttributes;

#pragma mark -
#pragma mark Initialization

+ (void) initialize {
	[self exposeBinding:@"rawDataArray"];
}

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		self.rawHexTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
									 [NSColor blackColor], NSForegroundColorAttributeName, 
									 [NSFont userFixedPitchFontOfSize:12.0f], NSFontAttributeName, nil];
		self.offsetTextAttributes = self.rawHexTextAttributes;
		self.parsedTextAttributes = self.rawHexTextAttributes;
		
		byteStringSize = [@"00" sizeWithAttributes:self.rawHexTextAttributes];
		lineHeight = byteStringSize.height + 2.0f;
		bytesPerLine = 16;
		
		[self registerForDraggedTypes:[NSArray arrayWithObjects:LBAParserPboardType, nil]];
    }
    return self;
}

- (void)dealloc {
	[rawData release];
	[rawHexTextAttributes release];
	[offsetTextAttributes release];
	[parsedTextAttributes release];
	[super dealloc];
}

#pragma mark -
#pragma mark Setup

- (NSString *) description {
    return [NSString stringWithFormat: @"<%@ 0x%x>", NSStringFromClass(isa), (void *)self];
}


#pragma mark -
#pragma mark Drag and Drop

- (NSDragOperation) draggingEntered:(id <NSDraggingInfo>)sender {
	NSLog(@"%@ Entered",sender);
	return NSDragOperationGeneric;
}

- (BOOL) prepareForDragOperation:(id <NSDraggingInfo>)sender {
	NSLog(@"Prepared For %@",sender);
	return YES;
}


#pragma mark -
#pragma mark Drawing

- (BOOL) isFlipped {
	return YES;
}

- (NSUInteger) lineNumberAtPoint:(NSPoint)point {
	return ((int)point.y) / lineHeight;
}

- (CGFloat) heightAtLineNumber:(NSUInteger)lineNumber {
	return lineNumber * lineHeight;
}

- (NSRect) rectAtByte:(NSUInteger)offset {
	NSRect rect;
	rect.size = byteStringSize;
	rect.origin.y = lineHeight * (offset / bytesPerLine);
	rect.origin.x = 40 + rect.size.width * (offset % bytesPerLine) + rect.size.width/2 * (int)((offset % bytesPerLine)/2);
	return rect;
}

- (NSRange) bytesInFrame:(NSRect)frame {
	NSRange range;
	
	range.location = [self lineNumberAtPoint:frame.origin]*bytesPerLine;
	range.length = ((int)frame.size.height / lineHeight + 1) * bytesPerLine + 1;
	
	if (range.location + range.length > [self.rawData.data length]) {
		range.length = MAX(0,[self.rawData.data length] - range.location - 1);
	}
	
	return range;
}

/* The rawDataArray is bound to the Array Controller's selection. I have little
 * use for an array -- just convert it directly to the object (and back) */
- (NSArray *) rawDataArray {
	if (!self.rawData) return nil;
	return [NSArray arrayWithObject:self.rawData];
}

- (void) setRawDataArray:(NSArray *)newArray {
	self.rawData = [newArray lastObject];
	int byteCount = [self.rawData.data length];
	
	NSSize size = [self.superview visibleRect].size;
	size.width += 2; /* Bug? */
	size.height = MAX(size.height, lineHeight * (byteCount / bytesPerLine + 1));
	[self setFrameSize:size];
	
	[self setNeedsDisplayInRect:[self visibleRect]];	
}


- (void)drawRect:(NSRect)dirtyRect {
	[[NSColor whiteColor] set];
	NSRectFill(dirtyRect);

	if (rawData) {
		NSRange bytesToDraw = [self bytesInFrame:dirtyRect];
		for (int byte = bytesToDraw.location; byte <= bytesToDraw.location + bytesToDraw.length; byte++) {
			NSString *byteStr = [NSString stringWithFormat:@"%hh02x",((char *)[self.rawData.data bytes])[byte]];
			[byteStr drawInRect:[self rectAtByte:byte] withAttributes:rawHexTextAttributes];
		}
	}
}


@end
