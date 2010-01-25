//
//  LBADataView.m
//  Alberti
//
//  Created by Matt Bauman on 1/24/10.
//  Copyright 2010 Matt Bauman. All rights reserved.
//

#import "LBADataView.h"


@implementation LBADataView

@synthesize data;

+ (void) initialize {
	[self exposeBinding:@"data"];
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
}

@end
