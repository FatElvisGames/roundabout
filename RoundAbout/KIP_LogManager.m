//
//  KIP_LogManager.m
//  SPI_PAC
//
//  Created by Steve Suranie on 10/29/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import "KIP_LogManager.h"

@implementation KIP_LogManager

+(KIP_LogManager *)sharedLogManager {
    
    static KIP_LogManager* sharedLogManager;
    
    @synchronized(self) {
        
        if (!sharedLogManager)
            
            sharedLogManager = [[KIP_LogManager alloc] init];
        
        return sharedLogManager;
        
    }
    
}

- (NSString*)formatLogMessage:(DDLogMessage* )logMessage {
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter* dfStamp = [[NSDateFormatter alloc] init];
    [dfStamp setDateFormat:@"EEEE, dd MMMM yyyy | HH:mm:ss"];
    NSString* strDate = [dfStamp stringFromDate:currentDate];
    
    return [NSString stringWithFormat:@"%@ | %@ | %s | %i | %@\n\n**************************\n\n", strDate, [logMessage fileName], logMessage->function, logMessage->lineNumber, logMessage->logMsg];
    
}



@end



