//
//  GSResponse.h
//  GrabShipper
//
//  Created by Dinh Hong Duong on 2/26/16.
//  Copyright © 2016 DInh Hong Duong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Backendless.h"

@interface GSResponse : NSObject

-(id)responseHandler:(id)response;
-(void)errorHandler:(Fault *)fault;

@end
