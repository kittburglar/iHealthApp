//
//  ViewController.h
//  OpenAPIDemo
//
//  Created by my on 12-5-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdEngines.h"

@interface ViewController : UIViewController<didLoginProtocol,UIAlertViewDelegate>{
    AdEngines *engine;
}
    
@property (retain, nonatomic) IBOutlet UILabel *testLab;
@property (retain, nonatomic) AdEngines *engine;
-(IBAction)login:(id)sender;
- (IBAction)register:(id)sender;
- (void)presentDetailDataViewController:(BOOL)animated;
@property (retain, nonatomic) IBOutlet UIButton *loginButton;
@property (retain, nonatomic) IBOutlet UIButton *facebookButton;
- (IBAction)facebookButton:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *googleButton;
- (IBAction)googleButton:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *twitterButton;
- (IBAction)twitterButton:(id)sender;

@end
