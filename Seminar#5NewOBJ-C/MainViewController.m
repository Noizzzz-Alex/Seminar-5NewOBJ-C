//
//  ViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "MainViewController.h"
#import "SecondViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController







//MARK: Life cycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.loader = [Loader new];
    self.label = [CreatorUIObjects createCustomLabelWithText:@"THE REQUEST WILL BE DISPLAYED HERE"];
    self.button = [CreatorUIObjects createCustomButtonWithText:@"GO TO POST REQUEST"];
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self setupConstraintsAndSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performLoadingForGetRequest];
    [self performLoadingForPostRequest];
}

//MARK: Actions

-(void)buttonTapped{
    UIViewController *next = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}




//MARK: Constraints
- (void)setupConstraintsAndSubViews {
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];

    [NSLayoutConstraint activateConstraints:@[
         //MARK: Constraints label
         [self.label.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                              constant:30],
         [self.label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                  constant:10],
         [self.label.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                   constant:-10],
         [self.label.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-100],


         //MARK: Constraints button
         [self.button.topAnchor constraintEqualToAnchor:self.label.bottomAnchor
                                               constant:50],
         [self.button.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                   constant:50],
         [self.button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                    constant:-50],
         [self.button.heightAnchor constraintEqualToConstant:30]

    ]];
}





//MARK: Network requests
- (void)performLoadingForGetRequest {
    [self.loader performGetRequestFromURL:@"https://postman-echo.com/get"
                                arguments:@{ @"var1": @"first", @"var2": @"second" }
                                    block:^(NSDictionary *dict, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (error) {
                               NSLog(@"Error: %@", error);
                               return;
                           }
//                           NSLog(@"%@", dict);
                           self.label.text = [dict description];
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

//                           NSLog(@"%@", dict);
                       });
    }];
}

@end
