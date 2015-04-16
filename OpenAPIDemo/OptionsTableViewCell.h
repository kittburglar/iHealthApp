//
//  OptionsTableViewCell.h
//  OpenAPIDemo
//
//  Created by kittiphong xayasane on 2015-04-15.
//
//

#import <UIKit/UIKit.h>

@interface OptionsTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *OptionsLabel;
@property (retain, nonatomic) IBOutlet UISwitch *OptionsSwitch;
- (IBAction)OptionsSwitchChanged:(id)sender;

@end
