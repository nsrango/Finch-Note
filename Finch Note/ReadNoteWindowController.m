//
//  ReadNoteWindowController.m
//  Finch Note
//
//  Created by narango on 2/10/13.
//  Copyright (c) 2013 narango. All rights reserved.
//

#import "ReadNoteWindowController.h"
#import "AppDelegate.h"
#import "Entry.h"
#import "EntryCellView.h"

@implementation ReadNoteWindowController

@synthesize managedObjectContext = _managedObjectContext;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
        _managedObjectContext = [appDelegate managedObjectContext];
        _selectedRow = 0;
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)addNote:(id)sender {
    NSLog(@"added note");
    
    Entry *entry = (Entry *)[NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:_managedObjectContext];
    
    [entry setDate:[NSDate date]];
    [entry setText:@"Write a note!"];
    [entry setAutomatic: [NSNumber numberWithBool:YES]];
}

- (NSArray *)dateSortDescriptor {
    return [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [_tableView selectedRow];
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSetWithIndex:row];
    
    [indexSet addIndex:_selectedRow];
    [[_tableView viewAtColumn:0 row:_selectedRow makeIfNecessary:NO] deselected];
    
    if (row == -1) {
        return;
    }
    
    [[_tableView viewAtColumn:0 row:row makeIfNecessary:NO] selected];
    
    _selectedRow = row;
    
    [_tableView noteHeightOfRowsWithIndexesChanged:indexSet];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    CGFloat height;
    //NSLog(@"selected row is: %ld", _selectedRow);
    if (row == _selectedRow) {
        height = 100.0;
    }
    else {
        height = 50;
    }
    return height;
}


@end