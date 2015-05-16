//
//  BPorWeightViewController.h
//  OpenAPIDemo
//
//  Created by my on 12-6-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdEngines.h"

//extern NSString *nickName;

@interface DataRequestViewController : UIViewController{
    AdEngines *engine;
    NSString *theappID;
    NSString *theappKey;
    
    NSMutableArray *weightArray;
    NSMutableArray *bpArray;
    NSMutableData *_responseData;
    NSURLConnection *connection;
    NSMutableData *infoData;
    
}
+ (NSString*)nickName;

- (IBAction)getSleep:(id)sender;
- (IBAction)getBG:(id)sender;
- (IBAction)GetOX:(id)sender;
- (IBAction)getActivityInfo:(id)sender;
-(void)connect:(NSDictionary *)dic;

@property (retain, nonatomic)NSString * dataType;
@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *infoData;

@property (retain, nonatomic) IBOutlet UIButton *bgButton;
@property (retain, nonatomic) IBOutlet UIButton *sleepButton;

@property (retain, nonatomic) IBOutlet UIButton *oxButton;
@property (retain, nonatomic) IBOutlet UIButton *acBtton;
@property (retain, nonatomic) IBOutlet UIButton *boButton;

@property (retain, nonatomic) IBOutlet UIButton *weightButton;
@property (retain, nonatomic) AdEngines *engine;
@property (retain, nonatomic) NSString *theappID;
@property (retain, nonatomic) NSString *theappKey;

@property (retain, nonatomic) NSMutableArray *weightArray;
@property (retain, nonatomic) NSMutableArray *bpArray;
@property (retain, nonatomic) IBOutlet UIButton *logoutButton;
- (IBAction)testButton:(id)sender;

-(IBAction)getWeightInfo:(id)sender;
-(IBAction)getBPIfo:(id)sender;
-(IBAction)refreshToken:(id)sender;
-(IBAction)logout:(id)sender;

@end
