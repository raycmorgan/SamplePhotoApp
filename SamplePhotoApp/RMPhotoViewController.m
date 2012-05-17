//
//  RMPhotoViewController.m
//  SamplePhotoApp
//
//  Created by Ray Morgan on 5/17/12.
//  Copyright (c) 2012 Rumgr Inc. All rights reserved.
//

#import "RMPhotoViewController.h"

@interface RMPhotoViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end


@implementation RMPhotoViewController

@synthesize imageView = _imageView;


#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Reload old data into the imageView
    self.imageView.image = [UIImage imageWithContentsOfFile:[self filePath]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - File Information

- (NSString *)filePath
{
    NSURL *folder = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return [NSString stringWithFormat:@"%@/foo.jpg", [folder path]];
}

#pragma mark - UI Events

- (IBAction)handlePhotoPress:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    [self presentModalViewController:picker animated:YES];
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = originalImage;
    
    // Save the image to disk
    NSData *jpeg = UIImageJPEGRepresentation(originalImage, 1);
    [[NSFileManager defaultManager] createFileAtPath:[self filePath] contents:jpeg attributes:nil];

    [self dismissModalViewControllerAnimated:YES];
}

@end
