//
//  CreatorUIObjects.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreatorUIObjects : NSObject

+ (UILabel *)createCustomLabelWithText:(NSString *)textLabel;
+ (UILabel *)createCustomLabelFlag;
+ (UIButton *)createCustomButtonWithText:(NSString *)textButton;
+ (UITextField *)createCustomTextFieldWithText:(NSString *)textField;
@end

NS_ASSUME_NONNULL_END
