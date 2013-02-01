//
//  EntryController.m
//  Finch Note
//
//  Created by narango on 1/31/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"
#import "AppDelegate.h"

@implementation EntryController

- (IBAction)addEntry:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    NSManagedObjectContext * managedObjectContext = [appDelegate managedObjectContext];
    
    Entry *entry = (Entry *)[NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:managedObjectContext];
    [entry setDate:[NSDate date]];
    [entry setText:@"Write a note!"];
    [entry setAutomatic: [NSNumber numberWithBool:YES]];
    
}
@end
