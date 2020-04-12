#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    if ([number hasPrefix:@"-"]) return nil;
    NSDictionary *keypad = @{
        @"0":@[@"8"],
        @"1":@[@"2", @"4"],
        @"2":@[@"1", @"3", @"5"],
        @"3":@[@"2", @"6"],
        @"4":@[@"1", @"5", @"7"],
        @"5":@[@"4", @"2", @"8", @"6"],
        @"6":@[@"3", @"5", @"9"],
        @"7":@[@"4", @"8"],
        @"8":@[@"7", @"5", @"0", @"9"],
        @"9":@[@"6", @"8"]
    };
    NSArray *result = @[];
    for (int i = 0; i < [number length]; i++) {
        NSArray *digit = [keypad valueForKey: [number substringWithRange:NSMakeRange(i, 1)]];
        for (NSString *k in digit) {
            result = [result arrayByAddingObject:[number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:k]];
        }
    }
    return result;
}
@end
