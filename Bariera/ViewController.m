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

NSDictionary* appDefaults;
NSString* tel; //@"tel://0747977538"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstStart = true;
    [self registerSettngs];
    [self getNumberFromDefaults];
}


-(void) registerSettngs{
    appDefaults = [[NSDictionary alloc] init];
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    
}

-(void) getNumberFromDefaults{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tel = [defaults objectForKey:@"phone_preference"];
    tel = [[tel componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];
    
}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if( firstStart ){
        if( tel != nil && [tel length] > 0 ){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",tel]]];
            exit(0);
        }
        
        else{
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops" message:@"The set phone number is not valid. Please check the settings app for details." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
              exit(0);
            }];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
    }
    
    
    firstStart = false;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
