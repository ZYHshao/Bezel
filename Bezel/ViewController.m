//
//  ViewController.m
//  Bezel
//
//  Created by jaki on 2017/8/15.
//  Copyright © 2017年 jaki. All rights reserved.
//

#import "ViewController.h"
#import "DisplayViewController.h"


@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *px1;
@property (weak, nonatomic) IBOutlet UITextField *py1;

@property (weak, nonatomic) IBOutlet UITextField *px2;
@property (weak, nonatomic) IBOutlet UITextField *py2;

@property (weak, nonatomic) IBOutlet UITextField *px3;
@property (weak, nonatomic) IBOutlet UITextField *py3;

@property (weak, nonatomic) IBOutlet UITextField *px4;
@property (weak, nonatomic) IBOutlet UITextField *py4;

@property (weak, nonatomic) IBOutlet UITextField *px5;
@property (weak, nonatomic) IBOutlet UITextField *py5;

@property (weak, nonatomic) IBOutlet UISwitch *steps2;
@property (weak, nonatomic) IBOutlet UISwitch *steps3;
@property (weak, nonatomic) IBOutlet UISwitch *step4;

@property (weak, nonatomic) IBOutlet UISlider *seed;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UISlider *reed;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.steps2.on = NO;
    self.steps3.on = NO;
    self.step4.on = NO;
    self.reed.minimumValue = 0.5;
    self.reed.maximumValue = 2;
    self.reed.value = 1;
    
    UIBezierPath
}
- (IBAction)step2Click:(UISwitch *)sender {
    if (!sender.isOn) {
        self.steps3.on = NO;
        self.step4.on = NO;
    }
}
- (IBAction)step3Click:(UISwitch *)sender {
    if (sender.isOn) {
        if (!self.steps2.isOn) {
            self.steps3.on = NO;
        }
    }else{
        self.step4.on = NO;
    }
}
- (IBAction)step4Click:(UISwitch *)sender {
    if (sender.isOn) {
        if (!self.steps3.isOn) {
            self.step4.on = NO;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField==self.px4||textField==self.px5||textField==self.py4||textField==self.py5||textField==self.px3||textField==self.py3) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);
        }];

    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (string.length==1) {
        if ( [string characterAtIndex:0]>='0'&&[string characterAtIndex:0]<='9') {
            return YES;
        }else{
            return NO;
        }
    }
    if (string.length==0) {
        return YES;
    }
    return NO;
}
- (IBAction)goShow:(id)sender {
    CGPoint p1 = CGPointMake([self.px1.text intValue], [self.py1.text intValue]);
    CGPoint p2 = CGPointMake([self.px2.text intValue], [self.py2.text intValue]);
    CGPoint p3 = CGPointMake([self.px3.text intValue], [self.py3.text intValue]);
    CGPoint p4 = CGPointMake([self.px4.text intValue], [self.py4.text intValue]);
    CGPoint p5 = CGPointMake([self.px5.text intValue], [self.py5.text intValue]);
 
    DisplayViewController * controller = [[DisplayViewController alloc]init];
    controller.p1 = p1;
    controller.p2 = p2;
    controller.p3 = p3;
    controller.p4 = p4;
    controller.p5 = p5;
    if (self.step4.isOn) {
        controller.steps = 4;
    }else if(self.steps3.isOn){
        controller.steps = 3;
    }else if(self.steps2.isOn){
        controller.steps = 2;
    }else{
        controller.steps = 1;
    }
    controller.reed = self.reed.value;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
