//
//  ViewController.m
//  Bariera
//
//  Created by Iura Gutu on 15/07/16.
//  Copyright © 2016 deCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstStart = true;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if( firstStart )
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://0747977538"]];
    
    firstStart = false;
    
    exit(0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
