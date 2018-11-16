//
//  IIIRPNCalculatorViewController.m
//  RPNCalculator Objc
//
//  Created by Ilgar Ilyasov on 11/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIIRPNCalculatorViewController.h"
#import "IIIDigitAccumulator.h"
#import "IIICalculator.h"

@interface IIIRPNCalculatorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *calculatorTextField;
@property (nonatomic) IIIDigitAccumulator *digitAccumulator;
@property (nonatomic) IIICalculator *calculator;

@end

@implementation IIIRPNCalculatorViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _digitAccumulator = [[IIIDigitAccumulator alloc] init];
        _calculator = [[IIICalculator alloc] init];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _digitAccumulator = [[IIIDigitAccumulator alloc] init];
        _calculator = [[IIICalculator alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)numberButtonTapped:(id)sender
{
    NSNumber *number = @([sender tag]);
    [self.digitAccumulator addDigitWithNumericValue:number];
    [self updateViewsAfterNumbers];
}

- (IBAction)pointButtonTapped:(id)sender
{
    [self.digitAccumulator addDecimalPoint];
    [self updateViewsAfterNumbers];
}

- (IBAction)divideButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorDivide];
    [self updateViewsAfterOperators];
    [self.calculator clear];
}

- (IBAction)multiplyButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorMultiply];
    [self updateViewsAfterOperators];
    [self.calculator clear];
}

- (IBAction)subtractButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorSubtract];
    [self updateViewsAfterOperators];
    [self.calculator clear];
}

- (IBAction)addButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorAdd];
    [self updateViewsAfterOperators];
    [self.calculator clear];
}

- (IBAction)returnButtonTapped:(id)sender
{
    double number = [[self.digitAccumulator digitValue] doubleValue];
    [self.calculator pushNumber: number];
    [self.digitAccumulator clear];
    self.calculatorTextField.text = @"";
}

#pragma mark Update Screen

- (void)updateViewsAfterNumbers
{
    NSString *number = [self.digitAccumulator digitValue];
    self.calculatorTextField.text = [NSString stringWithFormat:@"%@", number] ;
}

- (void)updateViewsAfterOperators
{
    NSNumber *number = [NSNumber numberWithDouble:(self.calculator.topValue)];
    self.calculatorTextField.text = [number stringValue];
}

#pragma mark Delegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self.calculator clear];
    [self.digitAccumulator clear];
    return YES;
}

@end
