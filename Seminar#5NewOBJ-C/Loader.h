//
//  Loader.h
//  CommandLine
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (void)performGetRequestFromURL:(NSString *)urlString
                       arguments:(NSDictionary *)arguments
                           block:(void (^)(NSDictionary *, NSError *))block;

- (void)performPostRequestFromURL:(NSString *)urlString
                        arguments:(NSDictionary *)arguments
                            block:(void (^)(NSDictionary *, NSError *))block;

- (NSDictionary *)parseJSONData:(NSData *)data
                          error:(NSError **)error;

- (NSData *)dataFromJSON:(NSDictionary *)dict
                   error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
