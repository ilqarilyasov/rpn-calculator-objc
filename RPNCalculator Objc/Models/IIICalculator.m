//
//  IIICalculator.m
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIICalculator.h"
#import "IIIStack.h"

@interface IIICalculator()

@property (nonatomic) IIIStack *stack;

@end

@implementation IIICalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _stack = [[IIIStack alloc] init];
    }
    return self;
}

- (void)pushNumber:(double)value
{
    [self.stack pushValue:value];
}

- (void)applyOperator:(Operator)operatorX
{
    double number1 = [self.stack pop];
    double number2 = [self.stack pop];
    double result;

    switch (operatorX) {
        case OperatorAdd:
            result = number1 + number2;
            break;
        case OperatorSubtract:
            result = number1 - number2;
            break;
        case OperatorMultiply:
            result = number1 * number2;
            break;
        case OperatorDivide:
            result = number1 / number2;
            break;
        default:
            break;
    }
}

#pragma mark TODO

- (void)clear
{
    self.stack = [IIIStack new];
}

- (double)topValue
{
    return [self.stack peek];
}

@end
