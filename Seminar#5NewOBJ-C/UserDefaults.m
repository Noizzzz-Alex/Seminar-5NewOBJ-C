//
//  UserDefaults.m
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 23.01.2024.
//

#import "Robot.h"
#import "UserDefaults.h"

@implementation UserDefaults

+ (NSData *)createDataFromArray:(NSArray *)array {
    float x = [array[1] floatValue];
    float y = [array[2] floatValue];
    Robot *robot = [[Robot alloc]initWithNameAndCoords:array[0] coords:CGPointMake(x, y)];
    NSData *tempData = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:nil];

    return tempData;
}

+ (void)resetDefaults:(NSUserDefaults *)userDefaults {
    NSDictionary *dict = [userDefaults dictionaryRepresentation];

    for (NSString *key in dict) {
        [userDefaults removeObjectForKey:key];
    }

    [userDefaults synchronize];
}

+ (NSData *)createDataFromUD:(NSUserDefaults *)userDefaults key:(NSString *)key {
    return [userDefaults objectForKey:key];
}

+ (Robot *)SaveAndReadUD:(NSArray *)array userDefaults:(NSUserDefaults *)userDefaults {
    
    [userDefaults setObject:[self createDataFromArray:array] forKey:array[0]];
    return [NSKeyedUnarchiver unarchiveObjectWithData:[self createDataFromUD:userDefaults key:array[0]]];
    
}


@end
