//
//  Entry.h
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSNumber * automatic;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) id text;
@property (nonatomic, retain) NSNumber * mostRecent;

@end
