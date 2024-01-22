//
//  ViewController.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "CreatorUIObjects.h"
#import "MainViewController.h"
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
    self.labelFlag = [CreatorUIObjects createCustomLabelFlag];
    self.buttonSaveToUserDefaults = [CreatorUIObjects createCustomButtonWithText:@"Save Data"];
    self.buttonSaveToFile = [CreatorUIObjects createCustomButtonWithText:@"Save Data To File"];
    self.textField = [CreatorUIObjects createCustomTextFieldWithText:@"Example Text"];
    [self.buttonSaveToUserDefaults addTarget:self action:@selector(buttonSaveToFileTapped) forControlEvents:UIControlEventTouchUpInside];
    [self setupConstraintsAndSubViews];
//    [self gestureActive];
    self.textField.delegate = self;
    
    
    
    
    
    //MARK: task#1 save data in userDefaults
//    NSLog(@"%s",__PRETTY_FUNCTION__);
//    [self.userDefaults setInteger:42 forKey:@"forty-two"];
//    [self.userDefaults setDouble:2.7484342342848 forKey:@"double-number"];
//    [self.userDefaults setFloat:3.14152322 forKey:@"float-number"];
//    [self.userDefaults setObject:@"Simple" forKey:@"example-string"];
    
    
    //MARK: task#1 coding and decoding userDefaults
//    CGPoint point = CGPointMake(10, 10);
//    UIColor *pointColor = [UIColor systemRedColor];
//    ColorTile *colorTile = [[ColorTile alloc]initWithColorAndPoint:pointColor  point:point ];
//    NSData *tileData = [NSKeyedArchiver archivedDataWithRootObject:colorTile requiringSecureCoding:NO error:nil];
//    [self.userDefaults setObject:tileData forKey:@"tile"];
//
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    
    
    
    
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





//MARK: Actions Tapped

-(void)buttonSaveToFileTapped{
//    [self saveDataToFile:@""];
   
}
- (void)buttonSaveToUserDefaultsTapped {
}


//MARK: Action TextField
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];   //скрыть клаву при редактировании
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField becomeFirstResponder];   //показать клаву при редактировании
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.backgroundColor = [UIColor lightGrayColor];
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


//MARK: Action to Save
- (void)saveDataToUserDefaults {
}

-(void)saveDataToFile:(NSString*)fileName{
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
}

//метод удаления данных из юзер дефортс
-(void)resetDefaults{
    NSDictionary *dict = [self.userDefaults dictionaryRepresentation];
    for (NSString *key in dict) {
        [self.userDefaults removeObjectForKey:key];
    }
    [self.userDefaults synchronize];
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
         [self.textField.topAnchor constraintEqualToAnchor:self.labelFlag.bottomAnchor constant:50],
         [self.textField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                                  constant:10],
         [self.textField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                   constant:-10],
         [self.textField.heightAnchor constraintEqualToConstant:200],


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





@end
