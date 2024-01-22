//
//  ColorTitle.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 21.01.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorTile : NSObject 
@property (nonatomic) UIColor *tileColor;

@property (nonatomic) CGPoint tileOrigin;

//- (instancetype)initWithColorAndPoint: (UIColor *)color point:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
