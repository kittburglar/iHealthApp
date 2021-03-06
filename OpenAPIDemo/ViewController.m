//
//  ViewController.m
//  OpenAPIDemo
//
//  Created by my on 12-5-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AdEngines.h"
#import "DataRequestViewController.h"
#import "AllDefine.h"
#import "InfoViewController.h"
#import "AppDelegate.h"



//replace your appkey and appID 输入你的appID和密码
//http://192.168.3.69:8090/api/OAuthv2/userauthorization.ashx?client_id=81b5e1fab2804f92af2843e51d00d7b7&client_secret=678&grant_type=authorization_code&redirect_uri=http://678/oauthtest.aspx&code=mhMAED3sSBEsTTsXBS0LoJszuzBxQ46W-srZZucwntBw1dJS5IYY-vz9ZpHC-qZbNBQf*l7M1vcYH3TTYlTECnfRqC1OEOemtVZn*fS8xUE


//#define appID @"81b5e1fab2804f92af2843e51d00d7b7"
//#define appKey @"678"
//#define mysc @"B557ABBD157B4D4A99E794B35903382D"
//#define mysv @"2eed569296b942b4836e8ad1babb9c43"
//#define myweightsv @"2eed569296b942b4836e8ad1babb9c43"
//#define mybpsv @"2eed569296b942b4836e8ad1babb9c43"
//#define myredirect_uri @"http://678/" 

//#define appID @"356349d2956d43cfa825c1fe9e7f7135"
//#define appKey @"sss"
//#define mysc @"92105AEE747E41B8A89E554B35713945"
//#define myweightsv @"4bccd716c07544d486ce8eed542f74a8"
//#define mybpsv @"37483cf9c763407195ff73137468f600"
//#define myredirect_uri @"http://localhost:4811/oauthtest.aspx"

//
//#define appID @"b500e88fdaec43448862795c9a92f5d5"
//#define appKey @"abfdc2ac100e4e1593c5a2d00e6ebc9e"
//#define mysc @"62ca6f64fddd40ae820cf6c53e331526"
//#define myweightsv @"8396225165be4bd6816df55281bc9953"
//#define mybpsv @"1601786bccc346dfb9645d40a9b5bb72"
//#define myredirect_uri @"http://localhost:2839/WebForm1.aspx"

//#define appID @"bd44ef426a434cf386891e3c2397fa51"
//#define appKey @"d7a62ff0c66e4376aef6e87b69eef3e1"

/*
#define appID @"8a08cbf9ccc9407c8765988bded8c179"
#define appKey @"5522390fee084e80a73064318b3be5a2"
#define myredirect_uri @"http://www.test.com"
*/
#define appID @"6d8d73435c334451a87691ec54404514"
#define appKey @"ece6d4d984dd4c7b835e7c04b367f769"
#define myredirect_uri @"http://www.kittburglar.com"
#define token_url @"https://api.ihealthlabs.com:8443/OpenApiV2/OAuthv2/userauthorization/";

@interface ViewController ()

@end

@implementation ViewController

@synthesize engine;


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.clipsToBounds = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //Navigation Bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:164.0f/255.0f green:8.0f/255.0f blue:2.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTranslucent:NO];
    UIImage *fbImage = [UIImage imageNamed:@"facebook.png"];
    [self.facebookButton setImage:fbImage forState:UIControlStateNormal];
    
    UIImage *twitterImage = [UIImage imageNamed:@"twitter.png"];
    [self.twitterButton setImage:twitterImage forState:UIControlStateNormal];
    UIImage *googleImage = [UIImage imageNamed:@"google+.png"];
    [self.googleButton setImage:googleImage forState:UIControlStateNormal];
	// Do any additional setup after loading the view, typically from a nib.
        engine=[[AdEngines alloc]initWithAppKey:appID appSecret:appKey];
        [engine setDelegate:self];
    
    if ([engine isLoggedIn]&&![engine isAuthorizeExpired]) {
        [self presentDetailDataViewController:NO];
    }
}

- (void)viewDidUnload
{
    [self setTestLab:nil];
    [self setLoginButton:nil];
    [self setFacebookButton:nil];
    [self setGoogleButton:nil];
    [self setTwitterButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
     return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction)login:(id)sender
{
    if (engine==nil) {
        engine=[[AdEngines alloc]initWithAppKey:appID appSecret:appKey];
    }
    [engine setRedirectURI:myredirect_uri];
    [engine setDelegate:self];
    [engine logIn];
    
}

- (IBAction)register:(id)sender {
    AdAuthWebView *authWebView=[[AdAuthWebView alloc]init];
    [authWebView setDelegate:self];
    //[authWebView loadRequestWithURL:[NSURL URLWithString:urlString]];
    [authWebView show:YES];
    [authWebView release];
}

-(void)buttonHighlight:(id)sender{
    [self.loginButton setBackgroundColor:[UIColor darkGrayColor]];
    NSLog(@"Button highlight");
}

-(void)buttonNormal:(id)sender{
    [self.loginButton setBackgroundColor:[UIColor whiteColor]];
    NSLog(@"Button normal");
}

#pragma mark  didLoginDelegate
-(void)applicationDidLogin
{
    /*
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login"
                                             message:@"Succeed"
                                            delegate:self
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles: nil];
    [alert show];
    [alert release];
     */
     [self presentDetailDataViewController:YES];
}

-(void)applicationLoginFailed
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login"
                                                 message:@"Failed"
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles: nil];
    [alert show];
    [alert release];
}
-(void)applicationDidCanceled
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login"
                                                 message:@"Canceled"
                                                delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles: nil];
    [alert show];
    [alert release];
}

//#pragma mark alertView Delegate
//-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex==0) {
//        [self presentDetailDataViewController:YES];
//    }
//
//}

- (void)presentDetailDataViewController:(BOOL)animated
{

    DataRequestViewController *viewcontroller=[[DataRequestViewController alloc]init];
    viewcontroller.engine=engine;
    viewcontroller.theappID=appID;
    viewcontroller.theappKey=appKey;
    UINavigationController *nc=[[UINavigationController alloc]initWithRootViewController:viewcontroller];
    [self.navigationController presentModalViewController:nc animated:animated];
    [viewcontroller release];
    [nc release];
}

- (void)dealloc {
    [_testLab release];
    [_loginButton release];
    [_facebookButton release];
    [_googleButton release];
    [_twitterButton release];
    [super dealloc];
}
- (IBAction)facebookButton:(id)sender {
}
- (IBAction)googleButton:(id)sender {
}
- (IBAction)twitterButton:(id)sender {
}

- (IBAction)testButton:(id)sender {
    InfoViewController * vc = [[InfoViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
