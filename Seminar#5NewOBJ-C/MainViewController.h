//
//  ViewController.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) Loader *loader;

@property (nonatomic) NSString *log;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

-(void)performLoadingForGetRequest;
-(void)performLoadingForPostRequest;



@end

