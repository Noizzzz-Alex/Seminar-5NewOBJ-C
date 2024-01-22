//
//  ViewController.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>
#import "UserDefaults.h"

@interface MainViewController : UIViewController <UITextFieldDelegate, UIScrollViewDelegate>

//@property (nonatomic) UserDefaults *userDefaults;
@property (nonatomic, strong) UILabel *labelFlag;
@property (nonatomic, strong) UIButton *buttonSaveToUserDefaults;
@property (nonatomic, strong) UIButton *buttonSaveToFile;
@property (nonatomic, strong) UITextField *textField;

-(void)buttonSaveToFileTapped;
-(void)buttonSaveToUserDefaultsTapped;



@end

