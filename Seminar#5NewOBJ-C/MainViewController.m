//
//  ViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "MainViewController.h"
#import "SecondViewController.h"
#import "ColorTile.h"


@interface MainViewController ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation MainViewController







//MARK: Life cycle methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    self.view.backgroundColor = [UIColor whiteColor];
    self.loader = [Loader new];
    self.label = [CreatorUIObjects createCustomLabelWithText:@"THE REQUEST WILL BE DISPLAYED HERE"];
    self.button = [CreatorUIObjects createCustomButtonWithText:@"GO TO POST REQUEST"];
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self setupConstraintsAndSubViews];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *urlPath = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderURL = [urlPath URLByAppendingPathComponent:@"newFolder"];
    NSURL *pathOfData = [folderURL URLByAppendingPathComponent:@"data.txt"];
    NSData *data = [@"String in file" dataUsingEncoding:kCFStringEncodingUTF8];
    
    if ([fileManager createDirectoryAtURL:folderURL withIntermediateDirectories:YES attributes:nil error:nil]) {
        [fileManager createFileAtPath:pathOfData.path contents:data attributes:nil];
    }
    if ([fileManager fileExistsAtPath:pathOfData.path ]){
        NSData *tempData = [fileManager contentsAtPath:pathOfData.path];
        NSString *tempString = [[NSString alloc]initWithData:tempData encoding:kCFStringEncodingUTF8];
        NSLog(@"%@", tempString);
        
        if([fileManager removeItemAtPath:pathOfData.path error:nil]){
            NSLog(@"file is removed");
        };
    }
    
    
    
    
    //MARK: task#1 coding and decoding userDefaults
//    NSLog(@"%s",__PRETTY_FUNCTION__);
//    [self.userDefaults setInteger:42 forKey:@"forty-two"];
//    [self.userDefaults setDouble:2.7484342342848 forKey:@"double-number"];
//    [self.userDefaults setFloat:3.14152322 forKey:@"float-number"];
//    [self.userDefaults setObject:@"Simple" forKey:@"example-string"];
    
//    CGPoint point = CGPointMake(10, 10);
//    UIColor *pointColor = [UIColor systemRedColor];
//    ColorTile *colorTile = [[ColorTile alloc]initWithColorAndPoint:pointColor  point:point ];
//    NSData *tileData = [NSKeyedArchiver archivedDataWithRootObject:colorTile requiringSecureCoding:NO error:nil];
//    [self.userDefaults setObject:tileData forKey:@"tile"];
//     
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self performLoadingForGetRequest];
    [self performLoadingForPostRequest];
    
    
    
    
    //MARK: task#1 coding and decoding userDefaults
//    NSData *tile = [self.userDefaults objectForKey:@"tile"];
//    ColorTile *newTile = [NSKeyedUnarchiver unarchiveObjectWithData:tile];
//    NSLog(@"%@", newTile.tileColor);
    
    
    
    
    
    //MARK: task#1 save data in userDefaults
//    NSString *myString = [self.userDefaults stringForKey:@"example-string"];
//    NSInteger myInt = [self.userDefaults integerForKey:@"forty-two"];
//    double myDouble = [self.userDefaults doubleForKey: @"double-number"];
//    float myFloat =  [self.userDefaults floatForKey:@"float-number"];
//    NSLog(@"%@, %ld, %f, %f", myString, (long)myInt, myDouble, myFloat);
//    [self resetDefaults];
    
    
}



//метод удаления данных из юзер дефортс
-(void)resetDefaults{
    NSDictionary *dict = [self.userDefaults dictionaryRepresentation];
    for (NSString *key in dict) {
        [self.userDefaults removeObjectForKey:key];
    }
    [self.userDefaults synchronize];
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
                       });
    }];
}

@end
