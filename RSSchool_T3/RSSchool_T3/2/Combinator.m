#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    NSUInteger countItems = [array count];
    
    if (countItems == 2) {
        
        //find combination
        NSInteger allColorsCount = [array[1] integerValue];
        NSInteger requiredCombinations = [array[0] integerValue];
        
        if ((allColorsCount < 1) || (requiredCombinations < 1)) {
            return nil;
        }
        
        //for all variants
        NSInteger optimalColorCount = 0;
        
        for (NSInteger i = 1; i < allColorsCount; i++) {
            NSInteger result = [Combinator combinationNumberFrom:allColorsCount Choose:i];
            NSLog(@"combinations colors: %ld choose %ld = %ld", (long)allColorsCount, i, result);
            if ((result == requiredCombinations) && ((optimalColorCount > i) || (optimalColorCount == 0))) {
                optimalColorCount = i;
            }
        }
        NSLog(@"requiredCombinations: %ld optimal: %ld", requiredCombinations, optimalColorCount);
        return (optimalColorCount < 1) ? nil : @(optimalColorCount);
    } else {
        return nil;
    }
}

+ (NSInteger)combinationNumberFrom:(NSInteger)n Choose:(NSInteger)x {
    if (x == 1) {
        return n;
    }
    if (x == n) {
        return 1;
    }
    return [Combinator combinationNumberFrom:(n - 1) Choose:x] + [Combinator combinationNumberFrom:(n - 1) Choose:(x - 1)];
}
@end
