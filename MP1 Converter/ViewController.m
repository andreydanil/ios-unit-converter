//
//  ViewController.m
//  MP1 Converter
//
//  Created by Andrey Danilkovich on 2/28/14.
//  Copyright (c) 2014 Andrey Danilkovich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// update values on enter
- (void)updateValues;
- (void)updateLabels;
- (void)changeArrowDown;
- (void)changeArrowUp;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Simple Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topField.delegate = (id)self;
    
    
    self.units.selectedSegmentIndex = 0;
    
    
    [self.convertButton addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventTouchUpInside];
    [self.units addTarget:self action:@selector(updateLabels) forControlEvents:UIControlEventValueChanged];
    [self.arrowControllerTapped addTarget:self action:@selector(updateLabels) forControlEvents:UIControlEventValueChanged];
    
    _tapBackground = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBackground)];
    [self.view addGestureRecognizer:_tapBackground];
    
    [self.topField addTarget:self action:@selector(changeArrowDown) forControlEvents:UIControlEventTouchDown];
    [self.bottomField addTarget:self action:@selector(changeArrowUp) forControlEvents:UIControlEventTouchDown];
}

- (void) changeArrowDown{
    [_arrowControllerTapped setTitle:@"⬇︎" forState:UIControlStateNormal];
}

- (void) changeArrowUp{
    [_arrowControllerTapped setTitle:@"⬆︎" forState:UIControlStateNormal];
}

- (void) tapBackground {
    //Hide keyBoard
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarnin
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(convertButtonTapped:)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    //    [self updateValues];
    
    
    return YES;
}

- (void)convertButtonTapped:(id)sender {
    [self.view endEditing:YES];
    if ([self.topField.text length] == 0) {
        self.topField.text = [NSString stringWithFormat:@"%0.2f", 0.0];
    }
    [self updateValues];
}

- (IBAction)arrowController:(id)sender {
    if([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬇︎"]){
        [_arrowControllerTapped setTitle:@"⬆︎" forState:UIControlStateNormal];
    }
    else
        [_arrowControllerTapped setTitle:@"⬇︎" forState:UIControlStateNormal];
    
    
}

- (IBAction)tabBackground:(id)sender {
}

- (void)updateLabels {
    switch (self.units.selectedSegmentIndex) {
        case 0:
            // F to C
            self.topLabel.text = @"°F";
            self.bottomLabel.text = @"°C";
            break;
        case 1:
            // Miles to Kilometers
            self.topLabel.text = @"Miles";
            self.bottomLabel.text = @"Kilometeres";
            break;
        case 2:
            // Gallons to Liters
            self.topLabel.text = @"Gallons";
            self.bottomLabel.text = @"Liters";
            break;
        default:
            break;
    }
    [self updateValues];
}

- (void)updateValues {
    
    float top = [self.topField.text doubleValue];
    float bottom = [self.bottomField.text doubleValue];
    
    switch (self.units.selectedSegmentIndex) {
        case 0:
            // C to F
            if([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬇︎"])
            {
                top = [self.topField.text floatValue];
                bottom = (top - 32.0) / 1.8;
                self.bottomField.text = [NSString stringWithFormat:@"%0.2f", bottom];
            }
            
            else if ([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬆︎"])
            {
                bottom = [self.bottomField.text floatValue];
                top = bottom * 1.8 + 32.0;
                self.topField.text = [NSString stringWithFormat:@"%0.2f", top];
            }
            break;
            
        case 1:
            
            if([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬇︎"])
            {
                top = [self.topField.text floatValue];
                bottom = (top * 1.60934);
                self.bottomField.text = [NSString stringWithFormat:@"%0.2f", bottom];
            }
            
            else if ([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬆︎"])
            {
                bottom = [self.bottomField.text floatValue];
                top = bottom / 1.60934;
                self.topField.text = [NSString stringWithFormat:@"%0.2f", top];
            }
            break;
        
        case 2:
            
            if([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬇︎"])
            {
                top = [self.topField.text floatValue];
                bottom = (top * 3.78541);
                self.bottomField.text = [NSString stringWithFormat:@"%0.2f", bottom];
            }
            
            else if ([_arrowControllerTapped.titleLabel.text isEqualToString:@"⬆︎"])
            {
                bottom = [self.bottomField.text floatValue];
                top = bottom / 3.78541;
                self.topField.text = [NSString stringWithFormat:@"%0.2f", top];
            }
            break;
            
        default:
            break;
    }
}

- (IBAction)categoryChanged:(id)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end

/******************************************************
/ Original declaration from class session
 
- (IBAction)convertButtonTapped:(id)sender {
    double value = [self.bottomField.text doubleValue];
    value *= 2.0;
    self.topField.text = [NSString stringWithFormat:@"%.2f", value];
    
    NSLog(@"%@ got tapped!", sender);    // log message to console
    //NSLog(@"Bottom field contains %@", self.bottomField.text)
}
*******************************************************/