//
//  SecondViewController.m
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startStandardUpdatesLocation];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [locations lastObject];
    
    MKCoordinateRegion newRegion;
    newRegion.span.latitudeDelta = 0.13;
    newRegion.span.longitudeDelta = 0.12;
    newRegion.center.latitude = location.coordinate.latitude - (0.2 * newRegion.span.latitudeDelta);
    newRegion.center.longitude = location.coordinate.longitude;

    
    [self.mapView setRegion:newRegion animated:YES];
    self.mapView.showsUserLocation = YES;
    
    [self.locationManager stopUpdatingLocation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
}

@end
