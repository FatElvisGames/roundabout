#import <Foundation/Foundation.h>

@interface KIP_ColorManager : NSObject {
    
}

+(KIP_ColorManager* )sharedColorManager;

- (UIColor* ) setColor : (float) red : (float) green : (float) blue;

@end
