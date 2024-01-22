//
//  ViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "DataSaverToFile.h"
#import "MainViewController.h"
#import "Robot.h"
#import "UserDefaults.h"


@interface MainViewController ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation MainViewController

//MARK: Life cycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    [self setupUIObjectsAndAction];
    [self setupConstraintsAndSubViews];
    self.textField.delegate = self;
}

- (NSArray *)SeparatedString:(NSString *)text {
    if (text && text.length > 0) {
        // Разделение строки с запятой в качестве разделителя
        NSArray *pairs = [text componentsSeparatedByString:@","];

        //проверка условия, что данные введены корректно
        if (!([pairs[0] isEqual:@""]) && ([pairs[1] floatValue]) && ([pairs[2] floatValue])) {
            return pairs;
        }
    }

    return nil;
}

- (void)labelError {
    self.labelFlag.text = @"The data are incorrect!";
    self.labelFlag.backgroundColor = [UIColor systemRedColor];
}

//MARK: Actions Tapped

- (void)buttonSaveToFileTapped {
    NSURL *path = [DataSaverToFile saveDataToFile:[self SeparatedString:self.textField.text.copy]];

    if (path == nil) {
        [self labelError];
    } else {
        self.labelFlag.text = [DataSaverToFile readDataFromFile:path];
        self.labelFlag.backgroundColor = [UIColor greenColor];
    }
}

- (void)buttonSaveToUserDefaultsTapped {
    NSArray *array = [self SeparatedString:self.textField.text.copy];

    if (array == nil) {
        [self labelError];
    } else {
        Robot *robot = [UserDefaults SaveAndReadUD:array userDefaults:self.userDefaults];
        self.labelFlag.text = [NSString stringWithFormat:@"%@,%f,%f", robot.name, robot.coords.x, robot.coords.y];
        self.labelFlag.backgroundColor = [UIColor greenColor];
    }
}

//MARK: Action TextField

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.backgroundColor = [UIColor lightGrayColor];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
    textField.backgroundColor = [UIColor yellowColor];
    textField.placeholder = @"Enter name robot and coords";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.backgroundColor = [UIColor lightGrayColor];
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES]; // Скрыть клавиатуру при прокрутке
}

//MARK: Constraints
- (void)setupConstraintsAndSubViews {
    [self.view addSubview:self.labelFlag];
    [self.view addSubview:self.buttonSaveToUserDefaults];
    [self.view addSubview:self.buttonSaveToFile];
    [self.view addSubview:self.textField];

    [NSLayoutConstraint activateConstraints:@[
         //MARK: Constraints labelFlag
         [self.labelFlag.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                                  constant:30],
         [self.labelFlag.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                      constant:10],
         [self.labelFlag.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                       constant:-10],
         [self.labelFlag.heightAnchor constraintEqualToConstant:30],


         //MARK: Constraints textField
         [self.textField.topAnchor constraintEqualToAnchor:self.labelFlag.bottomAnchor
                                                  constant:50],
         [self.textField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                      constant:10],
         [self.textField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                       constant:-10],
         [self.textField.heightAnchor constraintEqualToConstant:50],


         //MARK: Constraints buttonSaveToUserDefaults
         [self.buttonSaveToUserDefaults.topAnchor constraintEqualToAnchor:self.textField.bottomAnchor
                                                                 constant:50],
         [self.buttonSaveToUserDefaults.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                                     constant:50],
         [self.buttonSaveToUserDefaults.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                                      constant:-50],
         [self.buttonSaveToUserDefaults.heightAnchor constraintEqualToConstant:30],

         //MARK: Constraints buttonSaveToFile
         [self.buttonSaveToFile.topAnchor constraintEqualToAnchor:self.buttonSaveToUserDefaults.bottomAnchor
                                                         constant:50],
         [self.buttonSaveToFile.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                             constant:50],
         [self.buttonSaveToFile.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                              constant:-50],
         [self.buttonSaveToFile.heightAnchor constraintEqualToConstant:30]

    ]];
}

- (void)setupUIObjectsAndAction {
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelFlag = [CreatorUIObjects createCustomLabelFlag];
    self.buttonSaveToUserDefaults = [CreatorUIObjects createCustomButtonWithText:@"Save Data"];
    self.buttonSaveToFile = [CreatorUIObjects createCustomButtonWithText:@"Save Data To File"];
    self.textField = [CreatorUIObjects createCustomTextFieldWithText:@"Example Text"];
    [self.buttonSaveToUserDefaults addTarget:self
                                      action:@selector(buttonSaveToUserDefaultsTapped)
                            forControlEvents:UIControlEventTouchUpInside];
    [self.buttonSaveToFile addTarget:self
                              action:@selector(buttonSaveToFileTapped)
                    forControlEvents:UIControlEventTouchUpInside];
}

@end
