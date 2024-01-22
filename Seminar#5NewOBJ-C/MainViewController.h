//
//  ViewController.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"
//#import "ColorTile.h"

@interface MainViewController : UIViewController <UITextFieldDelegate>


@property (nonatomic, strong) UILabel *labelFlag;
@property (nonatomic, strong) UIButton *buttonSaveToUserDefaults;
@property (nonatomic, strong) UIButton *buttonSaveToFile;
@property (nonatomic, strong) UITextField *textField;

-(void)buttonSaveToFileTapped;
-(void)buttonSaveToUserDefaultsTapped;

-(void)saveDataToUserDefaults;
-(void)saveDataToFile:(NSString*)fileName;

@end

