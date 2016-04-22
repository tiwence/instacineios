//
//  MovieApi.h
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import "AFHTTPSessionManager.h"

extern NSString * const kMovieDBAPIKey;
extern NSString * const kMovieAndTheatersBaseURLString;
extern NSString * const kTheatersBaseURLString;
extern NSString * const kMovieDBSearchBaseURLString;
extern NSString * const kMovieDBMovieRootURLString;

@interface MovieApiClient : AFHTTPSessionManager

@end
