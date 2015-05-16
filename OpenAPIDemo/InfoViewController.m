//
//  InfoViewController.m
//  iHealthApp
//
//  Created by kittiphong xayasane on 2015-05-15.
//
//

#import "InfoViewController.h"
#import "AdEngines.h"
#import "AllDefine.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

#define appID @"6d8d73435c334451a87691ec54404514"
#define appKey @"ece6d4d984dd4c7b835e7c04b367f769"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBar.hidden = NO;
    //self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:85.0f/255.0f green:98.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
    
    //millennial blue
    //self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:2.0f/255.0f green:93.0f/255.0f blue:140.0f/255.0f alpha:1.0f];
    
    //Lickable Lips
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:164.0f/255.0f green:8.0f/255.0f blue:2.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard {
    [self.firstnameText resignFirstResponder];
    [self.addressText resignFirstResponder];
    [self.cityText resignFirstResponder];
    [self.secondaryNumText resignFirstResponder];
    [self.lastnameText resignFirstResponder];
    [self.zipCodeText resignFirstResponder];
    [self.phoneText resignFirstResponder];
    [self.emailText resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_firstnameText release];
    [_addressText release];
    [_cityText release];
    [_secondaryNumText release];
    [_lastnameText release];
    [_zipCodeText release];
    [_phoneText release];
    [_emailText release];
    [super dealloc];
}

- (IBAction)doneAction:(id)sender {
    NSLog(@"doneAction pressed");
    AdEngines *engine=[[AdEngines alloc]initWithAppKey:appID appSecret:appKey];
    
    //NSLog(@"%@   UserID:%@\nBGResult:%@ mg/dl\nDinnerSituation:%@\nDrugSituation:%@",strDate,engine.userID,bgResult,dinnerSituation,drugSituation);
    
    NSString *firstname = [NSString stringWithFormat:@"%@", _firstnameText.text];
    NSString *lastname = [NSString stringWithFormat:@"%@", _lastnameText.text];
    NSString *address = [NSString stringWithFormat:@"%@", _addressText.text];
    NSString *zipcode = [NSString stringWithFormat:@"%@", _zipCodeText.text];
    NSString *city = [NSString stringWithFormat:@"%@", _cityText.text];
    NSString *phonenum = [NSString stringWithFormat:@"%@", _phoneText.text];
    NSString *secphonenum = [NSString stringWithFormat:@"%@", _secondaryNumText.text];
    NSString *email = [NSString stringWithFormat:@"%@", _emailText.text];
    NSString *userid = [NSString stringWithFormat:@"%@", engine.userID];
    
    
    //Check if user wants to send data
    //if ([[NSUserDefaults standardUserDefaults] boolForKey:@"dataRecording"]) {
        //post data up to PHP
        NSString *noteDataString = [NSString stringWithFormat:@"firstname=%@&lastname=%@&address=%@&zipcode=%@&city=%@&phonenum=%@&secphonenum=%@&email=%@&userid=%@", firstname, lastname, address, zipcode, city, phonenum, secphonenum, email, userid];
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:@"http://kittburglar.com/save2.php"];
        //NSURL * url = [NSURL URLWithString:@"http://assyrianhealthalliance.org/ihealth/save.php"];
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
    //}
}
@end
