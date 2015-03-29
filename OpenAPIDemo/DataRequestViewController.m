//
//  BPorWeightViewController.m
//  OpenAPIDemo
//
//  Created by my on 12-6-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataRequestViewController.h"
#import "DataInfoTableViewController.h"
#import "AllDefine.h"
#import "AdRequest.h"

@interface DataRequestViewController ()

@end

@implementation DataRequestViewController
@synthesize engine;
@synthesize theappID,theappKey;
@synthesize weightArray;
@synthesize bpArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.boButton.enabled=YES;
     self.weightButton.enabled=YES;
     self.acBtton.enabled=YES;
     self.sleepButton.enabled=YES;
     self.bgButton.enabled=YES;
     self.oxButton.enabled=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   // didReceiveRequestData
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didReceiveRequestData:) name:@"didReceiveRequestData" object:nil];
    
    self.navigationItem.title=@"Data Request";
    
  
    // Do any additional setup after loading the view from its nib.
}
-(void)didReceiveRequestData:(NSNotification *)notify{
    NSDictionary *dic=[notify userInfo];
    NSLog(@"didReceiveRequestData-dic==%@",dic);
    NSString *type=[dic objectForKey:@"dataType"];
    NSData *data=[dic objectForKey:@"result"];
     NSDictionary *dict=(NSDictionary *)data;
    if ([data isKindOfClass:[NSDictionary class]]) {
        if ([dict objectForKey:@"ErrorDescription"]!=nil) {
            NSLog(@"您还为授权");
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Request Error"
                                                         message:[dict objectForKey:@"ErrorDescription"]
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
            [alert show];
            [alert release];
            [self performSelector:@selector(logout:)];
        }else{
            NSString *nextPage=[dict objectForKey:@"NextPageUrl"];
            DataInfoTableViewController *vc=[[DataInfoTableViewController alloc]init];
            NSMutableArray *sourceArray=nil;
            if ([type isEqualToString:WeightResult]) {
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"WeightDataList"]];
           
            }else if ([type isEqualToString:BPResult]){
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"BPDataList"]];
                
            }else if ([type isEqualToString:BGResult]){
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"BGDataList"]];
               
            }else if ([type isEqualToString:SleepResult]){
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"SRDataList"]];
               
            }else if ([type isEqualToString:ActivityResult]){
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"ARDataList"]];
            }else if ([type isEqualToString:OXResult]){
                sourceArray=[NSMutableArray arrayWithArray:[dict objectForKey:@"BODataList"]];
            }
           // NSLog(@"[sourceArray count]---%i",[sourceArray count]);
            vc.sourceDataArray=sourceArray;
            vc.sourceTye=type;
            vc.nextPageUrl=nextPage;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
- (void)viewDidUnload
{
    [self setWeightButton:nil];
    [self setOxButton:nil];
    [self setAcBtton:nil];
    [self setBoButton:nil];
    [self setBgButton:nil];
    [self setSleepButton:nil];
       [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)getWeightInfo:(id)sender
{
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:WeightResult sv:myweightsv];

}

-(IBAction)getBPIfo:(id)sender
{
    printf("getBPinfo\n");
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:BPResult sv:mybpsv];
    
    //post data up to PHP
    NSString *noteDataString = [NSString stringWithFormat:@"name=%s&address=%s&latitude=%s&longitude=%s", "TEST123", "TEST456", "37.99", "123.213123"];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://kittburglar.com/save.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[noteDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *dataRaw, NSURLResponse *header, NSError *error) {
        NSDictionary *json = [NSJSONSerialization
                              JSONObjectWithData:dataRaw
                              options:kNilOptions error:&error];
        NSString *status = json[@"status"];
        if([status isEqual:@"1"]){
            //Success
            printf("Successfully send data to php file!\n");
            
        } else {
            printf("Failed to send data to php file!\n");
            //Error
            
        }
    }];
    
    [dataTask resume];
}
- (IBAction)getSleep:(id)sender {
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:SleepResult sv:mySleepSV];
}
- (IBAction)getBG:(id)sender {
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:BGResult sv:myBGSV];
}

- (IBAction)GetOX:(id)sender {
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:OXResult sv:myOXSV];
}

- (IBAction)getActivityInfo:(id)sender {
    UIButton *button=(UIButton *)sender;
    button.enabled=NO;
    [self gotoAskData:ActivityResult sv:myActivitySV];
}

-(void)gotoAskData:(NSString *)type sv:(NSString *)sv{
    NSString *accesstoken=engine.accessToken;
    NSString *userID=engine.userID;
    NSDictionary *params=[[NSDictionary alloc]initWithObjectsAndKeys:theappID,@"client_id",mysc,@"sc",sv,@"sv",accesstoken,@"access_token",@"1",@"page_index",myredirect_uri,@"redirect_uri",theappKey,@"client_secret", nil];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:params,@"params",userID,@"userID",type,@"type", nil];
    AdRequest *adauthView=[[[AdRequest alloc]init]autorelease];
    [adauthView connect:dic];
    printf(dic);

}
-(IBAction)refreshToken:(id)sender
{
    [engine setRedirectURI:myredirect_uri];
    [engine refreshTokenWithCode:self.engine.refreshToken];
    
}

-(IBAction)logout:(id)sender
{
    [engine logout];
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
    [_weightButton release];
    [_oxButton release];
    [_acBtton release];
    [_boButton release];
    [_bgButton release];
    [_sleepButton release];
       [super dealloc];
}
@end
