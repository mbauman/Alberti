//
//  LBAParserControlPrototype.m
//  Alberti
//
//  Created by Matt Bauman on 2/3/10.
//  Copyright 2010 Matt Bauman. All rights reserved.
//

#import "LBAParserControlPrototype.h"


@implementation LBAParserControlPrototype

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

/* Only override the dragging commands */
#pragma mark -
#pragma mark Dragging

- (void)mouseDown:(NSEvent *)theEvent {
	NSPasteboard *pboard = [NSPasteboard pasteboardWithName:NSDragPboard];
	[pboard declareTypes:[NSArray arrayWithObject:NSTIFFPboardType]  owner:self];
	[pboard setData:[[self image] TIFFRepresentation] forType:NSTIFFPboardType];
	[self dragImage:[self image] 
				 at:NSMakePoint(0.0, self.bounds.size.height) 
			 offset:NSMakeSize(0.0, 0.0) 
			  event:theEvent 
		 pasteboard:pboard 
			 source:self 
		  slideBack:YES];
}

- (void)mouseDragged:(NSEvent *)theEvent {
}

- (void) mouseUp:(NSEvent *)theEvent {
}

@end
