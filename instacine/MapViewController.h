//
//  SecondViewController.h
//  instacine
//
//  Created by Térence Marill on 22/04/2016.
//  Copyright © 2016 Térence Marill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end

