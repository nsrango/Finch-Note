//
//  NoteWindowController.h
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NoteWindowController : NSWindowController <NSTableViewDelegate>


@property (nonatomic) NSManagedObjectContext * managedObjectContext;

- (IBAction)addNote:(id)sender;

- (NSArray *)dateSortDescriptor;

@end
