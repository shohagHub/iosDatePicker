//
//  PickerObjcViewController.m
//  DateTimePicker
//
//  Created by Saleh Enam Shohag on 1/12/18.
//  Copyright © 2018 Nazia Afroz. All rights reserved.
//

#import "PickerObjcViewController.h"

@interface PickerObjcViewController (){
    UIDatePicker *datePicker;
    UIDatePicker *timePicker;
    UIToolbar *toolBar;
}

@end

@implementation PickerObjcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)dealloc{
//    free((__bridge void *)(datePicker));
//    NSLog(@"dealloc called");
}

- (IBAction)openPicker:(UIButton *)sender {
    //default picker
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 6)];
    datePicker.backgroundColor = [UIColor clearColor];
    [self.view addSubview:datePicker];
}
- (IBAction)cancelDefaultPicker:(id)sender {
    [datePicker removeFromSuperview];
    if (timePicker){
        [timePicker removeFromSuperview];
    }
}
/*Year mode and time not possible together*/
- (IBAction)openPickerWithYear:(UIButton *)sender {
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 6)];
    datePicker.backgroundColor = [UIColor clearColor];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:datePicker];
}

- (IBAction)openPickerWithDateAndTime:(UIButton *)sender {
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 6)];
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    datePicker.backgroundColor = [UIColor clearColor];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.maximumDate = [NSDate date];
    [self.view addSubview:datePicker];
    
    timePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + [UIScreen mainScreen].bounds.size.height / 6, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 6)];
    timePicker.backgroundColor = [UIColor clearColor];
    timePicker.datePickerMode = UIDatePickerModeTime;
    timePicker.maximumDate = [NSDate date];
    [self.view addSubview:timePicker];
    
    
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 - 44, [UIScreen mainScreen].bounds.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed:)];
    doneButton.tintColor = [UIColor cyanColor];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelPicker)];
    cancelButton.tintColor = [UIColor cyanColor];
    
    [toolBar setItems:[NSArray arrayWithObjects:doneButton, space, cancelButton, nil]];
    
    [self.view addSubview:toolBar];
}

-(void)dateChanged:(UIDatePicker *)picker{
    [timePicker setDate:picker.date];
}

-(void)doneButtonPressed:(UIButton *)senderr{
    NSLog(@"Done button pressed");
}

-(void)cancelPicker{
    [datePicker removeFromSuperview];
    if (timePicker){
        [timePicker removeFromSuperview];
    }
    [toolBar removeFromSuperview];
}



@end
