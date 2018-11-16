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
    [self.internalDigits removeAllObjects];
}

- (double)digitValue
{
    NSString *decimalPoint = @".";
    if ([self.internalDigits containsObject:decimalPoint]) {
        return [decimalPoint doubleValue];
    } else {
        return [self.internalDigits.lastObject doubleValue];
    }
}

@end
