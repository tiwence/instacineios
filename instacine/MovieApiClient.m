//
//  MovieApi.m
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import "MovieApiClient.h"

@implementation MovieApiClient

NSString * const kMovieDBAPIKey = @"1a9b19642b2c7882115d38072489d252";
NSString * const kMovieAndTheatersBaseURLString = @"http://www.google.fr" /*@"http://www.google.fr/movies?near="*/;
NSString * const kTheatersBaseURLString = @"http://www.google.fr"; /*@"http://www.google.fr/movies?tid=";*/
NSString * const kMovieDBSearchBaseURLString = @"http://api.themoviedb.org/3/search/movie?query=";
NSString * const kMovieDBMovieRootURLString = @"https://image.tmdb.org/t/p/w396";

+ (MovieApiClient *) sharedClient {
    static MovieApiClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kMovieAndTheatersBaseURLString]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/plain", nil];
    
    return self;
}

-(void) getMovieTheatersShowTimesWithLocation:(NSString *)location
                  success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
                  failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                                location, @"near", nil];
    
    [self GET:@"/movies" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
