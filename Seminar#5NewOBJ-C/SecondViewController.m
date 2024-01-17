//
//  SecondViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    self.log = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelFlag = [CreatorUIObjects createCustomLabelFlag];
    self.button = [CreatorUIObjects createCustomButtonWithText:@"SEND POST REQUEST"];
    self.textField = [CreatorUIObjects createCustomTextFieldWithText:@"  'example request' variable : value"];
    self.textField.delegate = (id<UITextFieldDelegate>)self;
    [self.button addTarget:self action:@selector(sendButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self setupConstraintsAndSubViews];
}

//MARK: Constraints
- (void)setupConstraintsAndSubViews {
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    [self.view addSubview:self.labelFlag];

    [NSLayoutConstraint activateConstraints:@[
         [self.labelFlag.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                                  constant:20],
         [self.labelFlag.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                      constant:10],
         [self.labelFlag.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                       constant:-10],
         [self.labelFlag.heightAnchor constraintEqualToConstant:30],



         //MARK: Constraints textField
         [self.textField.topAnchor constraintEqualToAnchor:self.labelFlag.bottomAnchor
                                                  constant:30],
         [self.textField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                      constant:10],
         [self.textField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                       constant:-10],
         [self.textField.heightAnchor constraintEqualToConstant:100],


         //MARK: Constraints button
         [self.button.topAnchor constraintEqualToAnchor:self.textField.bottomAnchor
                                               constant:50],
         [self.button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                   constant:50],
         [self.button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                    constant:-50],
         [self.button.heightAnchor constraintEqualToConstant:30]

    ]];
}

- (void)sendPostRequest:(NSString *)text {
    if (text && text.length > 0) {
        // Разделение строки с пробелом в качестве разделителя
        NSArray *pairs = [text componentsSeparatedByString:@" "];
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        for (NSString *pair in pairs) {
            NSArray *components = [pair componentsSeparatedByString:@":"];

            if (components.count == 2) {
                NSString *key = components[0];
                NSString *value = components[1];
                [dictionary setValue:value forKey:key];
            }
        }
        [self.loader performPostRequestFromURL:@"https://postman-echo.com/post"
                                     arguments:dictionary
                                         block:^(NSDictionary *dict, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                               if (error) {
                                   NSLog(@"Error: %@", error);
                                   return;
                               }

                               NSLog(@"%@", dict);
                           });
        }];
        //если запрос успешен
        self.labelFlag.backgroundColor = [UIColor greenColor];
        [self.labelFlag setText:@"Sending Request Complete"];
    } else {
        //если запрос неудачен
        self.labelFlag.backgroundColor = [UIColor redColor];
        [self.labelFlag setText:@"Error to sending"];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.backgroundColor = [UIColor lightGrayColor];
    self.log = textField.text;
    NSLog(@"%@", self.log);
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.backgroundColor = [UIColor yellowColor];
    textField.placeholder = @"Enter request";
    return YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES]; // Скрыть клавиатуру при прокрутке
}

- (void)sendButtonTapped {
    NSLog(@"%@", self.log);
    [self sendPostRequest:self.log];
}

@end
