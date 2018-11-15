//
//  IIIStack.h
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIIStack : NSObject

@property (nonatomic, readonly) NSArray *values;

- (instancetype)initWithValue:(NSArray *)value;

- (void)pushValue:(double)value;
- (double)pop;
- (double)peek;

@end

NS_ASSUME_NONNULL_END
