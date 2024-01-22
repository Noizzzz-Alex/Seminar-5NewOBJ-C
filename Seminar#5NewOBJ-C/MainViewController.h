//
//  ViewController.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"
//#import "ColorTile.h"

@interface MainViewController : UIViewController

@property (nonatomic, strong) Loader *loader;
//@property (nonatomic, strong) ColorTile *loader;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

-(void)buttonTapped;

-(void)performLoadingForGetRequest;
-(void)performLoadingForPostRequest;



@end

