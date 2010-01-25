//
//  LBADataView.h
//  Alberti
//
//  Created by Matt Bauman on 1/24/10.
//  Copyright 2010 Matt Bauman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LBAData;
@interface LBADataView : NSView {
	LBAData *data;
}

@property (retain) LBAData *data;

@end
