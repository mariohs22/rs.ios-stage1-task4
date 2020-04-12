#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray *arnum = [NSMutableArray new];
    for (id element in array) {
        if ([element isKindOfClass:[NSValue class]])
            [arnum addObject: element];
    }
    NSArray *sortedArray = [arnum sortedArrayUsingFunction:intSort context:NULL];

    if ([sortedArray count] == 0) return 0;
    
    int result = 1;
    if (numberOfItems >= [sortedArray count]) {
        for (id element in sortedArray) { result *= [element intValue]; }
    } else {
        for (int i = 0; i < numberOfItems; i++) {
            result *= [sortedArray[i] intValue];
        }
        if ((result < 0) && (sortedArray[numberOfItems] > 0)) {
            Boolean skip = true;
            result = 1;
            for (long i = numberOfItems; i>=0; i--) {
                if (skip && ([sortedArray[i] intValue] < 0)) {
                    skip = false;
                    continue;
                }
                result *= [sortedArray[i] intValue];
            }
        }
    }
    return result;
}

NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = abs([num1 intValue]);
    int v2 = abs([num2 intValue]);
    if (v1 > v2)
        return NSOrderedAscending;
    else if (v1 < v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

@end
