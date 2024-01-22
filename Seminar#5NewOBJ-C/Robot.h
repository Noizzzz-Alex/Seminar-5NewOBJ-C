//
//  Robot.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 22.01.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) CGPoint coords;

- (instancetype)initWithNameAndCoords:(NSString*)name coords:(CGPoint)coords;


@end

NS_ASSUME_NONNULL_END
