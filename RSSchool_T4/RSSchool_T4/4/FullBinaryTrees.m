#import "FullBinaryTrees.h"

@implementation Node
- (instancetype) initWithValue:(NSNumber *)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}
@end

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
    if (count % 2 == 0) return @"[]";
    if (count == 1) return @"[[0]]";

    return 0;
}

@end
