//
//  Loader.m
//  CommandLine
//
//  Created by Александр Харлампов on 16.01.2024.
//

#import "Loader.h"

@implementation Loader

- (NSURLSession *)session {
    // если сессия не сформирована то внутри if мы её формируем
    if (!_session) {
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        conf.HTTPAdditionalHeaders = @{
                @"CONTENT-TYPE": @"application/json",
                @"ACCEPT": @"application/json",
                @"USER-AGENT": @"iPhone 15 Pro Max Simulator iOS 17.2"
        };
        _session = [NSURLSession sessionWithConfiguration:conf];
    }

    return _session;
}

- (NSData *)dataFromJSON:(NSDictionary *)dict error:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:error];
}

- (NSDictionary *)parseJSONData:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}

- (void)performGetRequestFromURL:(NSString *)urlString arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:urlString];

    if (arguments) {
        NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];

        for (NSString *key in arguments.allKeys) {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:arguments[key]]];
        }

        urlComponents.queryItems = [queryItems copy];
    }

    NSURL *url = urlComponents.URL;
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:url
                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }

        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data
                                           error:&parsingError];

        if (parsingError) {
            block(nil, parsingError);
            return;
        }

        block(dict, nil);
    }];
    [task resume];
}

- (void)performPostRequestFromURL:(NSString *)urlString arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];

    request.HTTPMethod = @"POST";

    if (arguments) {
        NSData *data = [self dataFromJSON:arguments error:nil];
        request.HTTPBody = data;
    }

    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }

        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data
                                           error:&parsingError];

        if (parsingError) {
            block(nil, parsingError);
            return;
        }

        block(dict, nil);
    }];
    [task resume];
}

@end
