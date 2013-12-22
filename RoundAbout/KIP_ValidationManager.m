//
//  KIP_ValidationManager.m
//  SPI_PAC
//
//  Created by Steve Suranie on 10/3/13.
//  Copyright (c) 2013 Steve Suranie. All rights reserved.
//

#import "KIP_ValidationManager.h"

@implementation KIP_ValidationManager

- (id)init {
    if (self = [super init]) {
        
        numberManager = [[KIP_NumberManager alloc] init];
        
    }
    return self;
}

- (BOOL) validateTextField : (FEG_TextField*) txtFieldToCheck {
    
    BOOL isValid = YES;
    
    //get the text field type
    int intTextType = txtFieldToCheck.intType;
    
    if (intTextType == 5) {
        
        NSDictionary* dictValidationResults = [numberManager validateForInteger:txtFieldToCheck.text];
        isValid = [[dictValidationResults objectForKey:@"Validation"] intValue];
    }
    
    return isValid;
}

@end
