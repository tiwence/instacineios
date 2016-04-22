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
NSString * const kMovieAndTheatersBaseURLString = @"http://www.google.fr/movies?near=";
NSString * const kTheatersBaseURLString = @"http://www.google.fr/movies?tid=";
NSString * const kMovieDBSearchBaseURLString = @"http://api.themoviedb.org/3/search/movie?query=";
NSString * const kMovieDBMovieRootURLString = @"https://image.tmdb.org/t/p/w396";

@end
