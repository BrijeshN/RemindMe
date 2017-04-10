//
//  VBAnnotation.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/7/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "VBAnnotation.h"

@implementation VBAnnotation

- initWithPosition:(CLLocationCoordinate2D)coords {
    if (self = [super init]) {
        self.coordinate = coords;
    }
    return self;
}

@end
