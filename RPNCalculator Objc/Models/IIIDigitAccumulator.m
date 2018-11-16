//
//  IIIDigitAccumulator.m
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIIDigitAccumulator.h"

@interface IIIDigitAccumulator()

@property (nonatomic) NSMutableArray *internalDigits;

@end

@implementation IIIDigitAccumulator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalDigits = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addDigitWithNumericValue:(NSNumber *)digit
{
    [self.internalDigits addObject:digit];
}

- (void)addDecimalPoint
{
    [self.internalDigits addObject:@"."];
}

- (void)clear
{
    self.internalDigits = [NSMutableArray new];
}

- (NSString *)digitValue
{
    NSString *decimalPoint = @".";
    if ([self.internalDigits containsObject:decimalPoint]) {
        NSString *decimalValue = [self.internalDigits componentsJoinedByString:@""];
        return decimalValue;
    } else {
        NSNumber *number = self.internalDigits.lastObject;
        return [number stringValue];
    }
}

@end
