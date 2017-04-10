//
//  VBAnnotation.h
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/7/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface VBAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- initWithPosition:(CLLocationCoordinate2D)coords;


@end
