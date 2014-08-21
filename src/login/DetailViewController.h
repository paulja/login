//
//  DetailViewController.h
//  login
//
//  Created by Paul Jackson on 21/08/2014.
//  Copyright (c) 2014 Paul Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
