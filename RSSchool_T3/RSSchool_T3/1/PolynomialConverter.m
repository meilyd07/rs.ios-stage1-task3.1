#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {

    NSInteger countItems = [numbers count];
    if (countItems > 0 ) {
        NSMutableString *resultString = [NSMutableString new];
        for (int i = 0; i < countItems; i++) {
            
            int currentInt = [((NSNumber *)[numbers objectAtIndex:i]) intValue];
            int absCurrentInt = abs(currentInt);
            NSInteger currentDegree = countItems - i - 1;
            
            if (currentInt != 0) {
                [resultString appendFormat:@"%s%@%@%@",
                 (currentInt > 0) ? ((currentDegree == countItems - 1) ? "" : " + ") : ((currentDegree == countItems - 1) ? "-" : " - "),
                 ((currentDegree == 0) ||
                  ((currentDegree > 0) && (absCurrentInt != 1))
                  ) ? [NSString stringWithFormat:@"%d", absCurrentInt] : @"",
                 (currentDegree > 0) ? @"x" : @"",
                 (currentDegree > 1) ? [NSString stringWithFormat:@"^%ld", (long)currentDegree] : @""
                 ];
            }
        }
        
        return resultString;
    } else {
        return nil;
    }
}
@end
