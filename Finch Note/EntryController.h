//
//  EntryController.h
//  Finch Note
//
//  Created by narango on 1/31/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntryController : NSObject{
    NSManagedObjectContext * _managedObjectContext;
}

- (IBAction)addEntry:(id)sender;

@end
