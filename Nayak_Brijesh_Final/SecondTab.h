//
//  SecondTab.h
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface SecondTab : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
