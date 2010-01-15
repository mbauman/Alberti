//
//  AlbertiAppDelegate.h
//  Alberti
//
//  Created by Matt Bauman on 1/14/10.
//  Copyright 2010 Northwestern University. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AlbertiAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
