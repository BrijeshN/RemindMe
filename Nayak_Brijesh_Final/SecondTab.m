//
//  SecondTab.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "SecondTab.h"
#import "VBAnnotation.h"

@interface SecondTab ()

// Region
#define RE_LATITUDE 40
#define RE_LONGITUDE -76

// Temple University
#define TEMPLE_LATITUDE 39.98174
#define TEMPLE_LONGITUDE -75.152948

// Center City
#define CC_LATITUDE 39.9509036
#define CC_LONGITUDE -75.1574567

// King of Prussia
#define KOP_LATITUDE 40.1012856
#define KOP_LONGITUDE -75.3835525

// Philly Airport
#define PHL_LATITUDE 39.8743959
#define PHL_LONGITUDE -75.2424229

// Drexel University
#define DU_LATITUDE 39.9566127
#define DU_LONGITUDE -75.1899441

// UPenn
#define UPenn_LATITUDE 39.9522188
#define UPenn_LONGITUDE -75.1932137


#define SPAN_VALUE 5.00f

@end

@implementation SecondTab



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    
    MKCoordinateRegion region;
    region.center.latitude = RE_LATITUDE;
    region.center.longitude = RE_LONGITUDE;
    region.span.latitudeDelta = SPAN_VALUE;
    region.span.longitudeDelta = SPAN_VALUE;
    [self.mapView setRegion:region animated:NO];
    
    // create annotations
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    CLLocationCoordinate2D location;
    
    VBAnnotation *ann;
    
    location.latitude = TEMPLE_LATITUDE;
    location.longitude = TEMPLE_LONGITUDE;
    ann = [[VBAnnotation alloc] init];
    [ann setCoordinate:location];
    ann.title = @"Temple University";
    [annotations addObject:ann];
    
    location.latitude = KOP_LATITUDE;
    location.longitude = KOP_LONGITUDE;
    ann = [[VBAnnotation alloc] init];
    [ann setCoordinate:location];
    ann.title = @"King of Prussia";
    [annotations addObject:ann];
    
    location.latitude = PHL_LATITUDE;
    location.longitude = PHL_LONGITUDE;
    ann = [[VBAnnotation alloc] init];
    [ann setCoordinate:location];
    ann.title = @"Philadelphia International Airport";
    [annotations addObject:ann];
    
    location.latitude = DU_LATITUDE;
    location.longitude = DU_LONGITUDE;
    ann = [[VBAnnotation alloc] init];
    [ann setCoordinate:location];
    ann.title = @"Drexel University";
    [annotations addObject:ann];
    
    location.latitude = UPenn_LATITUDE;
    location.longitude = UPenn_LONGITUDE;
    ann = [[VBAnnotation alloc] init];
    [ann setCoordinate:location];
    ann.title = @"University of Pennsylvania";
    [annotations addObject:ann];
    
    // add to map
    [self.mapView addAnnotations:annotations];
    
}

// This what we use to customize annotations
// If the pin is not visible, then dequeue it

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier = @"pin";
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Temple.png"]];
    view.leftCalloutAccessoryView = imageView;
    
    view.enabled = YES;
    view.canShowCallout = YES;
    return view;
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}

@end
