//
//  SecondViewController.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController<UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) Loader *loader;

@property(nonatomic) UILabel *labelFlag;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, nullable) UITextField *textField;
@property (nonatomic) NSString *log;

- (void)sendPostRequest:(NSString *)text;
- (void)sendButtonTapped;
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;


@end

NS_ASSUME_NONNULL_END
