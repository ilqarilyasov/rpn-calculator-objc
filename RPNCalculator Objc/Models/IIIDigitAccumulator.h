//
//  IIIDigitAccumulator.h
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIDigitAccumulator : NSObject

@property (nonatomic, readonly) double digitValue;

- (void)addDigitWithNumericValue:(NSNumber *)digit;
- (void)addDecimalPoint;
- (void)clear;

@end

NS_ASSUME_NONNULL_END
