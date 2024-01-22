//
//  Robot.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 22.01.2024.
//

#import "Robot.h"

@implementation Robot

- (instancetype)initWithNameAndCoords:(NSString *)name coords:(CGPoint)coords {
    self = [super init];

    if (self) {
        self.name = name;
        self.coords = coords;
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];

    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        float x = [coder decodeFloatForKey:@"coordX"];
        float y = [coder decodeFloatForKey:@"coordY"];
        self.coords = CGPointMake(x, y);
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeFloat:_coords.x forKey:@"coordX"];
    [coder encodeFloat:_coords.y forKey:@"coordY"];
}

@end
