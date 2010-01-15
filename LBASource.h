//
//  LBASource.h
//  Alberti
//
//  Created by Matt Bauman on 1/14/10.
//  Copyright 2010 Matt Bauman. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum LBA_DELIMITER {
	LBA_DELIMIT_BY_PACKET,
	LBA_DELIMIT_BY_SIZE,
	LBA_DELIMIT_BY_TIME,
	LBA_DELIMIT_BY_MESSAGE,
};

@interface LBASource : NSObject {
	enum LBA_DELIMITER delimit;
	int delimit_size;
	double delimit_time;
	int internal_size_offset;
	int internal_size_type;
	
	bool use_host_endianness;
}

@end
