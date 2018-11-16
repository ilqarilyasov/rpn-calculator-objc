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
    [self updateViews];
}

- (IBAction)pointButtonTapped:(id)sender
{
    [self.digitAccumulator addDecimalPoint];
    [self updateViews];
}

- (IBAction)divideButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorDivide];
}

- (IBAction)multiplyButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorMultiply];
}

- (IBAction)subtractButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorSubtract];
}

- (IBAction)addButtonTapped:(id)sender
{
    [self.calculator applyOperator:OperatorAdd];
}

- (IBAction)returnButtonTapped:(id)sender
{
//    NSNumber *number = @(self.calculatorTextField.text);
//    [self.calculator pushNumber: number];
}

- (void)updateViews
{
    double number = self.digitAccumulator.digitValue;
    self.calculatorTextField.text = [NSString stringWithFormat:@"%0.00f", number] ;
}

#pragma mark Delegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self.calculator clear];
    [self.digitAccumulator clear];
    return YES;
}

#pragma mark didSet

- (void)setDigitAccumulator:(IIIDigitAccumulator *)digitAccumulator
{
    _digitAccumulator = digitAccumulator;
    if (self.digitAccumulator.digitValue) {
        double number = self.digitAccumulator.digitValue;
        self.calculatorTextField.text = [NSString stringWithFormat:@"%0.00f", number] ;
    } else {
        self.calculatorTextField.text = @"";
    }
}

- (void)setCalculator:(IIICalculator *)calculator
{
    _calculator = calculator;
    if (self.calculator.topValue) {
        double number = self.calculator.topValue;
        self.calculatorTextField.text = [NSString stringWithFormat:@"%0.00f", number] ;
    } else {
        self.calculatorTextField.text = @"";
    }
}

@end
