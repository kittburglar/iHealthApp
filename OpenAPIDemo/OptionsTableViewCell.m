//
//  OptionsTableViewCell.m
//  OpenAPIDemo
//
//  Created by kittiphong xayasane on 2015-04-15.
//
//

#import "OptionsTableViewCell.h"

@implementation OptionsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_OptionsLabel release];
    [_OptionsSwitch release];
    [super dealloc];
}
@end
