//
//  ViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController








- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performLoadingForGetRequest];
    [self performLoadingForPostRequest];
    self.label = [CreatorUIObjects createCustomLabelWithText:self.log];
    self.button = [CreatorUIObjects createCustomButtonWithText:@"POST REQUEST"];
    [self setupConstraintsAndSubViews];
}

- (void)setupConstraintsAndSubViews {
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];

    [NSLayoutConstraint activateConstraints:@[
        //MARK: Constraints label
         [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor
                                              constant:100],
         [self.label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                  constant:50],
         [self.label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:50],
         
         
         //MARK: Constraints button
         [self.button.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:50],
         [self.button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                  constant:50],
         [self.button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:50],
         [self.button.heightAnchor constraintEqualToConstant:30]

    ]];
}

- (void)performLoadingForGetRequest {
    [self.loader performGetRequestFromURL:@"https://postman-echo.com/get"
                                arguments:@{ @"var1": @"first", @"var2": @"second" }
                                    block:^(NSDictionary *dict, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (error) {
                               NSLog(@"Error: %@", error);
                               return;
                           }

//            NSLog(@"%@", dict);
                           self.log = [dict description];
//            NSLog(@"%@",self.log);
                       });
    }];
}

- (void)performLoadingForPostRequest {
    [self.loader performPostRequestFromURL:@"https://postman-echo.com/post"
                                 arguments:@{ @"var1": @"first", @"var2": @"second" }
                                     block:^(NSDictionary *dict, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (error) {
                               NSLog(@"Error: %@", error);
                               return;
                           }

                           NSLog(@"%@", dict);
                       });
    }];
}

@end
