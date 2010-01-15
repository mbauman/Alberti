//
//  LBAData.h
//  Alberti
//
//  Created by Matt Bauman on 1/14/10.
//  Copyright 2010 Matt Bauman. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface LBAData : NSObject {
	NSData   *data;
	NSDate   *time;
	NSString *source;
	NSString *description;
}

@end
