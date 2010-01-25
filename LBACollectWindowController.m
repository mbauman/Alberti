//
//  LBACollectWindowController.m
//  Alberti
//
//  Created by Matt Bauman on 1/18/10.
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

#import "LBACollectWindowController.h"
#import "LBAFileSource.h"

@implementation LBACollectWindowController

@synthesize dataSource, collectedData;

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[dataView bind:@"rawData" toObject:collectedDataController withKeyPath:@"selection" options:nil];
}

- (void)windowDidLoad {
	self.collectedData = [NSMutableArray array];
}

- (NSString *) windowNibName {
	return @"LBACollectWindow";
}

- (IBAction) dataSourceChanged:(id)sender {
	
}

#pragma mark -
#pragma mark Source Settings
- (IBAction) openDataSourceSettings:(id)sender {
	[NSBundle loadNibNamed: @"LBAFileSourceSettings" owner: self];
	[NSApp beginSheet: settingsPanel
	   modalForWindow: self.window
		modalDelegate: self
	   didEndSelector: @selector(didEndSheet:returnCode:contextInfo:)
		  contextInfo: nil];
}
- (IBAction) closeSettingsPanel:(id)sender {
	[NSApp endSheet:settingsPanel];
}
- (void) didEndSheet:(NSWindow *)sheet returnCode:(NSInteger)rc contextInfo:(void *)ctx {
    [sheet orderOut:self];
}

#pragma mark -
#pragma mark Collection
- (IBAction) startCollecting:(id)sender {
	self.dataSource = [[[LBAFileSource alloc] init] autorelease];
	[self.dataSource collect:[self mutableArrayValueForKey:@"collectedData"]];
}


- (void) dealloc {	
	[collectedData release];
	[super dealloc];
}

@end
