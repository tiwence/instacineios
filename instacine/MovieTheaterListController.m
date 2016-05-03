//
//  FirstViewController.m
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import "MovieTheaterListController.h"

@interface MovieTheaterListController ()

@end

@implementation MovieTheaterListController

@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startStandardUpdatesLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startStandardUpdatesLocation {
    if (nil == locationManager) {
        locationManager = [[CLLocationManager alloc] init];
    }
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager startUpdatingLocation];
}

#pragma mark - CoreLocation manager delegates methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [locations lastObject];
    
    [[MovieApiClient sharedClient] getMovieTheatersShowTimesWithLocation:[NSString stringWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude, nil] success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *htmlString = [[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding];
        HTMLDocument *document = [HTMLDocument documentWithString:htmlString];
        NSArray *elements = [document nodesMatchingSelector:@"div"];
        
        for (HTMLElement *el in elements) {
            if ([[el attributes][@"class"]  isEqualToString:@"theater"]) {
                NSString *theaterName = [[el firstNodeMatchingSelector:@"a"] textContent];
                NSLog(@"Cinéma %@ trouvé !", theaterName);
            }
        }
        
        htmlString = nil;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Failure %@", error);
    }];
    
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - TableView delegates methods

/*-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}*/

@end
