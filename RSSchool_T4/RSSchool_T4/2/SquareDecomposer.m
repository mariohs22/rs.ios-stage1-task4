#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    if ([number longLongValue] <= 0) return nil;
    NSArray *result = [self
        decomposer:[number longLongValue]
        left:[number longLongValue] * [number longLongValue]
    ];
    result = [result subarrayWithRange:NSMakeRange(0, [result count] - 1)];
    return result;
}

- (NSArray *)decomposer:(long)n left:(long)left {
    if (!left) { return @[@(n)]; }
    for (NSInteger i = n - 1; i > 0; i--) {
        if ((left - i*i) < 0) {
            continue;
        };
        NSArray *result = [self decomposer:i left:left - i*i];
        if (result) {
            return [result arrayByAddingObject:@(n)];
        }
    }
    return nil;
}

@end
