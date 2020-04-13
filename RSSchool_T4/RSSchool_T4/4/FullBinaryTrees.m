#import "FullBinaryTrees.h"

@implementation Node
- (instancetype) initWithValue:(NSString *)value {
    if (self = [super init]) {
        self.value = value;
    }
    return self;
}
+ (instancetype)nodeWithValue:(NSString *)value {
    return [[self alloc] initWithValue:value];
}
@end

@implementation FullBinaryTrees

- (NSString *)stringForNodeCount:(NSInteger)count {
    if ((count < 0) || (count % 2 == 0)) return @"[]";
    if (count == 1) return @"[[0]]";
    NSArray<Node *> *nodes = [self generateNodes:count];
    
    for (Node *n in nodes) {
        NSArray *arrrr = @[];
        //printTree(n, 0, arrrr);
        arrrr = [self levelOrder:n];
        NSLog(@"%@", arrrr);
    }
    return 0;
}

-(NSMutableArray *)levelOrder:(Node *)treeNode
{
   NSMutableArray *levelOrderArray = [NSMutableArray array];
   if (treeNode == nil) return levelOrderArray;
  
   NSMutableArray *queue = [NSMutableArray array];
   [queue addObject: treeNode];
   while (queue.count != 0) {
     NSMutableArray *eachLevelArray = [NSMutableArray array];
     int size = (int)queue.count;
     for (int i = 0; i<size; i++) {
        Node *node = [queue firstObject];
        [queue removeObjectAtIndex: 0];
        [eachLevelArray addObject: node];
        if (node.left)  {
          [queue addObject: node.left];
        }
        if (node.right) {
          [queue addObject: node.right];
        }
     }
     [levelOrderArray addObject: eachLevelArray];
   }
  return levelOrderArray;
}

void printTree(Node *node, int level, NSArray *arr) {
    if (node == nil) {
        arr = [arr arrayByAddingObject:@"null"];
        NSLog(@"null");
    } else {
        NSLog(@"0");
        arr = [arr arrayByAddingObject:@"0"];
        printTree(node.left, 0, arr);
        printTree(node.right, 0, arr);
    }
}

- (NSArray<Node *> *)generateNodes:(NSInteger)count {
    NSArray *nodes = @[];
    if (count == 1) {
        nodes = [nodes arrayByAddingObject:[Node nodeWithValue:@"0"]];
        return nodes;
    }
    for (int i = 1; i <= count - 2; i += 2) {
        NSArray *left = [self generateNodes:i];
        NSArray *right = [self generateNodes:count - i - 1];
        for (Node *leftNode in left) {
            for (Node *rightNode in right) {
                Node *node = [Node nodeWithValue:@"0"];
                node.left = leftNode;
                node.right = rightNode;
                nodes = [nodes arrayByAddingObject:node];
            }
        }
    }
    return nodes;
}


@end
