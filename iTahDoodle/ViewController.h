//
//  ViewController.h
//  iTahDoodle
//
//  Created by Edwin Cardenas on 22/01/25.
//

#import <UIKit/UIKit.h>

NSString *DocPath(void);

@interface ViewController : UIViewController <UITableViewDataSource>

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;

@end

