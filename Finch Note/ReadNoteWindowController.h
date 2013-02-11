//
//  ReadNoteWindowController.h
//  Finch Note
//
//  Created by narango on 2/1/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ReadNoteWindowController : NSWindowController <NSTableViewDelegate>{
    NSInteger _selectedRow;
}


@property (nonatomic) NSManagedObjectContext * managedObjectContext;

@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)addNote:(id)sender;
- (NSArray *)dateSortDescriptor;
@end
