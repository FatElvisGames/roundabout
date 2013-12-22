//
//  KIP_ValidationManager.h
//  SPI_PAC
//
//  Created by Steve Suranie on 10/3/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KIP_NumberManager.h"

#import "FEG_TextField.h"

@interface KIP_ValidationManager : NSObject {
 
    KIP_NumberManager* numberManager;
}


- (BOOL) validateTextField : (FEG_TextField*) txtFieldToCheck;
@end
