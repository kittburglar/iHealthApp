//
//  InfoViewController.h
//  iHealthApp
//
//  Created by kittiphong xayasane on 2015-05-15.
//
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *firstnameText;
@property (retain, nonatomic) IBOutlet UITextField *addressText;
@property (retain, nonatomic) IBOutlet UITextField *cityText;
@property (retain, nonatomic) IBOutlet UITextField *secondaryNumText;
@property (retain, nonatomic) IBOutlet UITextField *lastnameText;
@property (retain, nonatomic) IBOutlet UITextField *zipCodeText;
@property (retain, nonatomic) IBOutlet UITextField *phoneText;
@property (retain, nonatomic) IBOutlet UITextField *emailText;
- (IBAction)doneAction:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *laterButton;
@property (retain, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)laterAction:(id)sender;



@end
