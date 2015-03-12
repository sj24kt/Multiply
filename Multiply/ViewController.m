//
//  ViewController.m
//  Multiply
//
//  Created by Sherrie Jones on 3/9/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@property int intNumber;
@property int multNumber;
@property int sumTotalNumber;
@property int sliderNumber;
@property int segmentNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.intNumber = 0;
    self.multNumber = 0;
    self.sumTotalNumber = 0;

    self.sliderNumber = 0;
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 10;
    self.slider.value = 5;

    self.multiplierLabel.text = [NSString stringWithFormat:@"%.0f", self.slider.value];
}

- (IBAction)slider:(UISlider *)sender {
    self.multNumber = (int)roundf(self.slider.value);
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", self.multNumber];
}

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    self.intNumber = [self.numberTextField.text intValue];
    self.multNumber = [self.multiplierLabel.text intValue];
    self.sliderNumber = self.slider.value;

    [self whichSegmentControl];

    if (self.sumTotalNumber < 20) {
        [self fizzBuzz];
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        [self fizzBuzz];
        self.view.backgroundColor = [UIColor greenColor];
    }

    // dismiss the keyboard
    [self.numberTextField resignFirstResponder];
}

# pragma mark - Helper methods

- (void)fizzBuzz {

    if (self.sumTotalNumber % 3 == 0 && self.sumTotalNumber % 5 == 0) {
        self.multiplierLabel.text = [NSString stringWithFormat:@"%d", self.sliderNumber];

        if (self.segmentNumber == 0) {
            self.answerLabel.text = [NSString stringWithFormat:@"fizzbuzz: %i * %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"fizzbuzz: %i / %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        }


    } else if (self.sumTotalNumber % 5 == 0) {
        self.multiplierLabel.text = [NSString stringWithFormat:@"%d", self.sliderNumber];

        if (self.segmentNumber == 0) {
            self.answerLabel.text = [NSString stringWithFormat:@"fizz: %i * %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"fizz: %i / %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        }

    } else if (self.sumTotalNumber % 3 == 0) {
        self.multiplierLabel.text = [NSString stringWithFormat:@"%d", self.sliderNumber];

        if (self.segmentNumber == 0) {
            self.answerLabel.text = [NSString stringWithFormat:@"buzz: %i * %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"buzz: %i / %i = %i", self.intNumber, self.multNumber, self.sumTotalNumber];
        }

    } else {
        self.multiplierLabel.text = [NSString stringWithFormat:@"%d", self.sliderNumber];

        if (self.segmentNumber == 0) {
            self.answerLabel.text = [NSString stringWithFormat:@"%d * %d = %d", self.intNumber, self.multNumber, self.sumTotalNumber];
        } else {
            self.answerLabel.text = [NSString stringWithFormat:@"%d / %d = %d", self.intNumber, self.multNumber, self.sumTotalNumber];
        }
    }
}

- (void)whichSegmentControl {
    // Multiply/Divide by operatorSegmentControl choice
    if ([self.operatorSegmentControl selectedSegmentIndex] == 0) {
        self.sumTotalNumber = self.intNumber * self.multNumber;
        self.segmentNumber = 0;
    } else {
        self.sumTotalNumber = self.intNumber / self.multNumber;
        self.segmentNumber = 1;
    }
}

@end
