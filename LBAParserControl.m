//
//  LBAParserControl.m
//  Alberti
//
//  Created by Matt Bauman on 1/29/10.
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

#import "LBAParserControl.h"
#import "LBAParser.h"

@implementation LBAParserControl

@synthesize modelClass, representedObject, color;

- (id)initWithFrame:(NSRect)frame modelClass:(Class)type {
	self = [super initWithFrame:frame];
	if (self) {
		self.modelClass = type;
		self.color = [type color];
	}
	return self;
}

- (id)initWithFrame:(NSRect)frame {
	return [self initWithFrame:frame modelClass:nil];
}

- (void) dealloc {
	[color release];
	[super dealloc];
}

#pragma mark -
#pragma mark Drawing

- (void)drawRect:(NSRect)dirtyRect {
	[color set];
	NSRectFill(dirtyRect);
}

- (NSImage *) image {
	NSSize imgSize = self.bounds.size;
	
	NSBitmapImageRep *bir = [self bitmapImageRepForCachingDisplayInRect:[self bounds]];
	[bir setSize:imgSize];
	[self cacheDisplayInRect:[self bounds] toBitmapImageRep:bir];
	
	NSImage* image = [[[NSImage alloc]initWithSize:imgSize] autorelease];
	[image addRepresentation:bir];
	return image;	
}

#pragma mark -
#pragma mark General NSView methods

- (BOOL) isFlipped {
	return YES;
}


- (BOOL) isOpaque {
	return YES;
}

#pragma mark -
#pragma mark Dragging

- (BOOL) acceptsFirstMouse:(NSEvent *)theEvent {
	return YES;
}

- (void)mouseDown:(NSEvent *)theEvent {
	lastDragLocation = [theEvent locationInWindow];
}

- (void)mouseDragged:(NSEvent *)theEvent {
	NSPoint newDragLocation = [theEvent locationInWindow];
	NSPoint thisOrigin = [self frame].origin;
	thisOrigin.x += (newDragLocation.x - lastDragLocation.x);
	thisOrigin.y -= (newDragLocation.y - lastDragLocation.y);
	[self setFrameOrigin:thisOrigin];
	lastDragLocation = newDragLocation;
}


@end
