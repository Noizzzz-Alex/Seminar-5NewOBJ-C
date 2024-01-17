//
//  CreatorUIObjects.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"

@interface CreatorUIObjects ()

@end

@implementation CreatorUIObjects


+ (UILabel *)createCustomLabelWithText:(NSString *)textLabel {
    UILabel *label = [UILabel new];

    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:textLabel];
    label.backgroundColor = [UIColor grayColor];
    label.layer.borderWidth = 2;
    label.layer.borderColor = [UIColor.blackColor CGColor];
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    //    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}

+ (UIButton *)createCustomButtonWithText:(NSString *)textButton {
    UIButton *button = [UIButton new];

    [button setTitle:textButton forState:UIControlStateNormal];
    [button setTitle:@"DOING" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.backgroundColor = [UIColor blackColor];
    return button;
}

+ (UITextField *)createCustomTextFieldWithText:(NSString *)textField {
    UITextField *text = [UITextField new];
    text.placeholder = textField;
    text.translatesAutoresizingMaskIntoConstraints = NO;
    text.backgroundColor = [UIColor lightGrayColor];
    text.layer.borderWidth = 2;
    text.layer.borderColor = [UIColor.blackColor CGColor];
    text.textColor = [UIColor blackColor];
    return text;
}

+ (UILabel *)createCustomLabelFlag {
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.backgroundColor = [UIColor whiteColor];
    return label;
}

@end
