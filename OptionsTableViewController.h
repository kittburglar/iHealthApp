//
//  OptionsTableViewController.h
//  OpenAPIDemo
//
//  Created by kittiphong xayasane on 2015-04-15.
//
//

#import <UIKit/UIKit.h>
#import "OptionsTableViewCell.h"

@interface OptionsTableViewController : UITableViewController{
    IBOutlet OptionsTableViewCell *optionscell;
}

@property (retain, nonatomic) OptionsTableViewCell *optionscell;

@end
