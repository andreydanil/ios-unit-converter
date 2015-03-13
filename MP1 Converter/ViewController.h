//
//  ViewController.h
//  MP1 Converter
//
//  Created by Andrey Danilkovich on 2/28/14.
//  Copyright (c) 2014 Andrey Danilkovich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *topField;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UITextField *bottomField;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *units;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UIButton *arrowControllerTapped;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapBackground;



- (IBAction)categoryChanged:(id)sender;
- (IBAction)convertButtonTapped:(id)sender;
- (IBAction)arrowController:(id)sender;

@end
