//
//  ViewController.m
//  LeakDemo
//
//  Created by fragno on 17/1/3.
//  Copyright © 2017年 rookie-nerd. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface LeakObject : NSObject

@property (nonatomic, strong) NSArray *test1;
@property (nonatomic, strong) NSArray *test2;
@property (nonatomic, strong) NSArray *test3;

@end

@implementation LeakObject

@end


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leakbutton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leakButtonClicked:(id)sender {
    unsigned int outCount = 0;
    objc_property_t *leakObject = class_copyPropertyList([LeakObject class], &outCount);
    leakObject = leakObject;
}

@end
