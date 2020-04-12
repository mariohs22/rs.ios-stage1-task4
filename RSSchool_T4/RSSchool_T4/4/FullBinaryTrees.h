#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, assign) NSNumber *value;
@property (nonatomic, assign) Node *left;
@property (nonatomic, assign) Node *right;
- (instancetype)initWithValue:(NSNumber *)value;
@end

@interface FullBinaryTrees : NSObject
- (NSString *)stringForNodeCount:(NSInteger)count;
@end
