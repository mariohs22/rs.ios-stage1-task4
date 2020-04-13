#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic, assign) NSString *value;
@property (nonatomic, assign) Node *left;
@property (nonatomic, assign) Node *right;
- (instancetype)initWithValue:(NSString *)value;
+ (instancetype)nodeWithValue:(NSString *)value;
@end

@interface FullBinaryTrees : NSObject
//- (NSString *) printTree:(Node *)node level:(int)lvl;
- (NSString *) stringForNodeCount:(NSInteger)count;
@end
