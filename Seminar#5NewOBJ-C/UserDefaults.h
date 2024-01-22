//
//  UserDefaults.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 23.01.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaults : NSObject

+ (void)resetDefaults:(NSUserDefaults*)userDefaults;
+ (NSData *)createDataFromArray:(NSArray *)array;
+ (NSData *)createDataFromUD:(NSUserDefaults*)userDefaults key:(NSString*)key;
+ (Robot *)SaveAndReadUD:(NSArray *)array userDefaults:(NSUserDefaults*)userDefaults ;
@end

NS_ASSUME_NONNULL_END
