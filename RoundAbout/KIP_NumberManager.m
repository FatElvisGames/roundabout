//
//  KIP_NumberManager.m
//  Olympus_Project_Template
//
//  Created by Steve Suranie on 8/7/13.
//  Copyright (c) 2013 knowInk. All rights reserved.
//

#import "KIP_NumberManager.h"

@implementation KIP_NumberManager

+(KIP_NumberManager *)sharedNumberManager {
    
    static KIP_NumberManager* sharedNumberManager;
    
    @synchronized(self) {
        
        if (!sharedNumberManager)
            
            sharedNumberManager = [[KIP_NumberManager alloc] init];
        
        return sharedNumberManager;
        
    }
    
}

- (id)init {
    if (self = [super init]) {
        
        //init stuff
        dictValidationResults = [[NSMutableDictionary alloc] init];
        
       
    }
    
    return self;
}

- (NSString*) convertToCurrency : (NSDecimalNumber*) decNumberToConvert {
    
    //convert to string
    NSString* currencyString = [NSNumberFormatter localizedStringFromNumber:decNumberToConvert numberStyle:NSNumberFormatterCurrencyStyle];
    
    return currencyString;
    
}

- (NSDecimalNumber*) convertToNSDecimal : (id) valueToConvert {
    
    /*most of the time you would be using this to convert textfield string to currency. So you would take the textfield.text, validate it, convert to NSDecNum and then use the currency convertor to change to a currency*/
    
    //set some ivars
    BOOL hasError = NO;
    
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error formatting the passed value:\n"];
    
    NSDecimalNumber* decMyNum;
    valueToConvert = [KIP_StringManager safeConvertToString:valueToConvert];
    
    //make sure the value passed is a string
    if ([valueToConvert isKindOfClass:[NSString class]]) {
        
        //make sure the value passed is numeric only
        NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
        setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
        NSRange r = [valueToConvert rangeOfCharacterFromSet:setAlphabetAndSymbols];
        
        if (r.location != NSNotFound) {
            hasError = YES;
        }
        
        if (!hasError) {
            //convert to NSDecimalNumber
            decMyNum = [NSDecimalNumber decimalNumberWithString:valueToConvert];
            if ([decMyNum isEqualToNumber:[NSDecimalNumber notANumber]]) {
                return [NSDecimalNumber decimalNumberWithString:@"0"];
            }
        }
        else {
            [strErrMsg appendString:@"The value passed is not a number. It has letters or symbols included in it"];
        }
        
    }
    else {
        hasError = YES;
        [strErrMsg appendString:@"The value passed is not in a string format"];
    }
    
    
    //check the hasError value
    if (hasError) {
        DDLogVerbose(@"%@\n%@", strErrMsg, valueToConvert);
    }
    else {
        return decMyNum;
    }
    
    return [NSDecimalNumber decimalNumberWithString:@"0"];
}

- (NSDecimalNumber*) convertToNSDecimalFromNSString : (NSString*) strToConvert {
    
    /*most of the time you would be using this to convert textfield string to currency. So you would take the textfield.text, validate it, convert to NSDecNum and then use the currency convertor to change to a currency*/
    
    //set some ivars
    BOOL hasError = NO;
    
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error formatting the passed value:\n"];
    
    NSDecimalNumber* decMyNum;
    
    //make sure the value passed is a string
    if ([strToConvert isKindOfClass:[NSString class]]) {
        
        //make sure the value passed is numeric only
        NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
        setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
        NSRange r = [strToConvert rangeOfCharacterFromSet:setAlphabetAndSymbols];
        
        if (r.location != NSNotFound) {
            hasError = YES;
        }
        
        
        if (!hasError) {
            //convert to NSDecimalNumber
            decMyNum = [[NSDecimalNumber alloc] initWithString:strToConvert];
        } else {
            [strErrMsg appendString:@"The value passed is not a number. It has letters or symbols included in it"];
        }
        
    } else {
        
        hasError = YES;
        [strErrMsg appendString:@"The value passed is not in a string format"];
    }
    
    
    //check the hasError value
    if (hasError) {
        //DDLogVerbose(@"%@\n%@", strErrMsg, strToConvert);
    } else {
        return decMyNum;
    }
    
    return nil;
}


- (NSString*) convertToPercentage : (NSString*) strToConvert  {
    
    float myNumberToConvert;
    BOOL hasError = NO;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error formatting the passed value:\n"];
    
    if (strToConvert) {
        
        //check to make sure the string value passed is numeric
        //make sure the value passed is numeric only
        NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
        setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
        NSRange r = [strToConvert rangeOfCharacterFromSet:setAlphabetAndSymbols];
        
        if (r.location != NSNotFound) {
            hasError = YES;
            [strErrMsg appendString:@"The value passed was not a number, it contained letters and/or symbols."];
        } else {
            myNumberToConvert = [strToConvert floatValue];
        }
        
        
        //check to see if there was an error
        if (!hasError) {
            
            if (myNumberToConvert > 0) { 
                myNumberToConvert = myNumberToConvert/100;
            }
            
            NSString* strPercentage = [NSString stringWithFormat:@"%.02f%%", myNumberToConvert];
            return strPercentage;
            
        } else {
            
            NSLog(@"%@", strErrMsg);
            
        }

    }

    return nil;
    
}

- (NSString*) stripDollarSymbol : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange dollarSignCheck = [strToClean rangeOfString:@"$"];
    
    //only strip it if it has the $
    if (dollarSignCheck.location != NSNotFound) {
        
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(1, strToClean.length-1)];
        
        return cleanedString;
    }
    
    return strToClean;
    
}

- (NSString*) stripDecimalPoints : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange decimalCheck = [strToClean rangeOfString:@"."];
    
    //only strip it if it has the decimal
    if (decimalCheck.location != NSNotFound) {
        
        NSRange endRange = [strToClean rangeOfString:@"."];
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(0, endRange.location)];
        return cleanedString;
    }
    
    return nil;
    
}

- (NSString*) stripPercentageSymbols : (NSString*) strToClean {
    
    //check to see if the number is already formatted correctly
    NSRange percentSignCheck = [strToClean rangeOfString:@"%"];
    
    //only strip it if it has the $
    if (percentSignCheck.location != NSNotFound) {
        
        
        NSString* cleanedString = [strToClean substringWithRange:NSMakeRange(0, strToClean.length-1)];
        
        return cleanedString;
    }
    
    return strToClean;
    
}



- (NSString*) stripAlphaCharacters : (NSString*) strToClean {
    
    //strip away $ and % signs
    NSString * thisCleanedString = [strToClean stringByReplacingOccurrencesOfString:@"[^0-9]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [strToClean length])];
    
    return thisCleanedString;
    

}

- (NSMutableDictionary*) validateForCurrency : (NSString*) strToCheck {
    
    //clear out the dictionary so we only pass the values from this method
    [dictValidationResults removeAllObjects];
    
    //ivars
    isValid = YES;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error with the inputted value:\n"];

        
    //check to make sure there's no non-numeric characters other than a decimal point on the string
    NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@"$.0123456789"];
    setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
    NSRange r = [strToCheck rangeOfCharacterFromSet:setAlphabetAndSymbols];
    
    if (r.location != NSNotFound) {
        isValid = NO;
        [strErrMsg appendString:@"This input requires a currency (in dollars), you can include the $ symbol and a decimal point but you cannot include any other symbols or letters. If working in cents you can enter the amount as 0.10 or .10."];
        [dictValidationResults setObject:strErrMsg forKey:@"Error Message"];
    
    } else {
        
        if (strToCheck.length > 0) { 
        
            //clean the string if needed so we know we are starting with a fresh string
            strToCheck = [self stripDollarSymbol:strToCheck];
            
            NSDecimalNumber* decToDisplay = [self convertToNSDecimal:strToCheck];
            NSString* strToDisplay = [self convertToCurrency:decToDisplay];
            
            [dictValidationResults setObject:strToDisplay forKey:@"Display String"];
            
        } else {
            
            [dictValidationResults setObject:@"" forKey:@"Display String"];
        
        }
        
    }
    
    [dictValidationResults setObject:[NSString stringWithFormat:@"%i", isValid] forKey:@"Validation"];
    
    return dictValidationResults;
}


- (NSMutableDictionary*) validateForPercentage : (NSString*) strToCheck : (float) percentageLimit {
        
    //clear out the dictionary so we only pass the values from this method
    [dictValidationResults removeAllObjects];
    
    //ivars
    isValid = YES;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error with the inputted value:\n"];
    
    //check to make sure there's no non-numeric characters other than a decimal point on the string
    NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@"%.0123456789"];
    setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
    NSRange r = [strToCheck rangeOfCharacterFromSet:setAlphabetAndSymbols];
    
    if (r.location != NSNotFound) {
        
        isValid = NO;
        [strErrMsg appendString:@"This input requires a percentage, you can include the % symbol and a decimal point but you cannot include any other symbols or letters. The percentage cannot exeed 10% (.10)."];
        
        [dictValidationResults setObject:strErrMsg forKey:@"Error Message"];
        
    } else {
        
        if (strToCheck.length > 0) { 
        
            //the entry is valid, now we need to check and make sure it does not exceed 10%
            
            //strip the percentage symbol
            strToCheck = [self stripPercentageSymbols:strToCheck];
            
            //convert to float
            float numToCheck = [strToCheck floatValue];
            
            //convert to a percentage
            if (numToCheck > .99) {
                numToCheck = numToCheck/100;
            }
            
            //convert percentage limit to percentage
            percentageLimit = percentageLimit/100;
            
            
                
            if (numToCheck > percentageLimit) {
                isValid = NO;
                [strErrMsg appendString:@"This input requires a percentage, you can include the % symbol and a decimal point but you cannot include any other symbols or letters. The percentage cannot exeed 10% (.10)."];
                
                [dictValidationResults setObject:strErrMsg forKey:@"Error Message"];
                
            } else {
                
                //convert string value to proper display value
                NSString* strToDisplay = [NSString stringWithFormat:@"%.02f%%", numToCheck];
                [dictValidationResults setObject:strToDisplay forKey:@"Display String"];
            }
            
        } else {
            
            [dictValidationResults setObject:@"" forKey:@"Display String"];
            
        }
        
        [dictValidationResults setObject:[NSString stringWithFormat:@"%i", isValid] forKey:@"Validation"];
        
    }

    
    
    return dictValidationResults;
    
}

- (NSMutableDictionary*) validateForFloat : (NSString*) strToCheck {
    
    //clear out the dictionary so we only pass the values from this method
    [dictValidationResults removeAllObjects];
    
    //ivars
    isValid = YES;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error with the inputted value:\n"];
    
    //check to make sure there's no non-numeric characters other than a decimal point on the string
    NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
    setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
    NSRange r = [strToCheck rangeOfCharacterFromSet:setAlphabetAndSymbols];
    
    if (r.location != NSNotFound) {
        
        isValid = NO;
        [strErrMsg appendString:@"This input requires a numeric entry (decimals are ok) only, you cannot include any other symbols or letters."];
        
        [dictValidationResults setObject:strErrMsg forKey:@"Error Message"];
        
    } else {
        
        [dictValidationResults setObject:strToCheck forKey:@"Display String"];
        
    }
    
    [dictValidationResults setObject:[NSString stringWithFormat:@"%i", isValid] forKey:@"Validation"];
    
    return dictValidationResults;
    
}

- (NSMutableDictionary*) validateForInteger : (NSString*) strToCheck {
    
    //clear out the dictionary so we only pass the values from this method
    [dictValidationResults removeAllObjects];
    
    //ivars
    isValid = YES;
    NSMutableString* strErrMsg = [[NSMutableString alloc] initWithString:@"There was an error with the inputted value:\n"];
    
    //check to make sure there's no non-numeric characters other than a decimal point on the string
    NSCharacterSet* setAlphabetAndSymbols = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    setAlphabetAndSymbols = [setAlphabetAndSymbols invertedSet];
    NSRange r = [strToCheck rangeOfCharacterFromSet:setAlphabetAndSymbols];
    
    if (r.location != NSNotFound) {
        
        isValid = NO;
        [strErrMsg appendString:@"This input requires a whole number entry only, you cannot include any other symbols or letters."];
        
        [dictValidationResults setObject:strErrMsg forKey:@"Error Message"];
        
    } else {
        
        [dictValidationResults setObject:strToCheck forKey:@"Display String"];
        
    }
    
    [dictValidationResults setObject:[NSString stringWithFormat:@"%i", isValid] forKey:@"Validation"];
    
    return dictValidationResults;

}


- (NSInteger)randomValueBetween : (NSInteger)min and : (NSInteger)max {
    return (NSInteger)(min + arc4random_uniform(max - min + 1));
}

- (float)randomFloatValueBetween:(float)min :(float)max {
        return (((float)arc4random()/0x100000000)*(max-min)+min);
}

@end
