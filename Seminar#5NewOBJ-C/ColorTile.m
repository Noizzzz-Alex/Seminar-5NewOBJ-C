//
//  ColorTitle.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 21.01.2024.
//

#import "ColorTile.h"

@implementation ColorTile


- (instancetype)initWithColorAndPoint: (UIColor *)color point:(CGPoint)point{
    self = [super init];
    if (self) {
        self.tileColor = color;
        self.tileOrigin = point;
    }
    return self;
}

//инициалитор, отвечающий за то как раскодировать
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.tileColor = [coder decodeObjectForKey:@"color"];
        float x =[coder decodeFloatForKey:@"coordX"];
        float y =[coder decodeFloatForKey:@"coordY"];
        self.tileOrigin = CGPointMake(x, y);
        
    }
    return self;
}

//метод, отвечающий за то как закодировать
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.tileColor forKey:@"color"];
    [coder encodeFloat:_tileOrigin.x forKey:@"coordX"];
    [coder encodeFloat:_tileOrigin.y forKey:@"coordY"];
}

@end
