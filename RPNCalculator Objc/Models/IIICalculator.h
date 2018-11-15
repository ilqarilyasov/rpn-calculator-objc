//
//  IIICalculator.h
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIICalculator : NSObject

@property (nonatomic) double topValue;

typedef NS_ENUM(NSInteger, Operator)
{
    OperatorAdd,
    OperatorSubtract,
    OperatorMultiply,
    OperatorDivide
};

- (void)pushNumber:(double)value;
- (void)applyOperator:(Operator)operatorX;
- (void)clear;


@end

NS_ASSUME_NONNULL_END
