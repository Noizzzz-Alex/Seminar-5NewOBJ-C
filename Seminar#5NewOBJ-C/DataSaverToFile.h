//
//  DataSaverToFile.h
//  Seminar#5NewOBJ-C
//
//  Created by Александр Харлампов on 23.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataSaverToFile : NSObject

+ (NSURL*)saveDataToFile:(NSArray *)array;
+ (NSString*)readDataFromFile:(NSURL*)pathOfData ;

@end

NS_ASSUME_NONNULL_END
