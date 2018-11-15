//
//  IIIStack.m
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIIStack.h"

@interface IIIStack()

@property (nonatomic) NSMutableArray *internalValues;

@end

@implementation IIIStack

- (instancetype)initWithValue:(NSArray *)value
{
    self = [super init];
    if (self) {
        _internalValues = [value mutableCopy];
    }
    return self;
}

- (void)pushValue:(double)value
{
    [self.internalValues addObject:@(value)];
}

- (double)pop
{
    NSNumber *removedLastObject = [self.internalValues.lastObject copy];
    [self.internalValues removeLastObject];
    return [removedLastObject doubleValue];
}

- (double)peek
{
    NSNumber * lastNumber = self.internalValues.lastObject;
    return [lastNumber doubleValue];
}

- (NSArray *)values
{
    return self.internalValues;
}

@end
