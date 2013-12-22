//
//  KIP_NumberManager.h
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/7/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIP_StringManager.h"

@interface KIP_NumberManager : NSObject {
    
    BOOL isValid;
    NSMutableDictionary* dictValidationResults;

}

+(KIP_NumberManager* )sharedNumberManager;

- (NSDecimalNumber*) convertToNSDecimal : (id) valueToConvert;

- (NSDecimalNumber*) convertToNSDecimalFromNSString : (NSString*) strToConvert;

- (NSString*) convertToCurrency : (NSDecimalNumber*) numberToConvert;

- (NSString*) convertToPercentage : (NSString*) strToConvert;

- (NSString*) stripDollarSymbol : (NSString*) strToClean;

- (NSString*) stripDecimalPoints : (NSString*) strToClean;

- (NSString*) stripPercentageSymbols : (NSString*) strToClean;

- (NSString*) stripAlphaCharacters : (NSString*) strToClean;

- (NSMutableDictionary*) validateForCurrency : (NSString*) strToCheck;

- (NSMutableDictionary*) validateForPercentage : (NSString*) strToCheck : (float) percentageLimit;

- (NSMutableDictionary*) validateForFloat : (NSString*) strToCheck;

- (NSMutableDictionary*) validateForInteger : (NSString*) strToCheck;

- (NSInteger)randomValueBetween:(NSInteger)min and:(NSInteger)max;

- (float)randomFloatValueBetween : (float) min : (float) max;


@end
