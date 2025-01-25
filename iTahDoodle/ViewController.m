//
//  ViewController.m
//  iTahDoodle
//
//  Created by Edwin Cardenas on 22/01/25.
//

#import "ViewController.h"

NSString *DocPath(void)
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *plist = [NSArray arrayWithContentsOfFile:DocPath()];
    
    if (plist) {
        self.tasks = [plist mutableCopy];
    } else {
        self.tasks = [NSMutableArray array];
    }
    
    [self setupViews];
}

- (void)setupViews
{
    self.taskField = [UITextField new];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    [self.insertButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    
    self.taskTable = [UITableView new];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.taskTable.dataSource = self;
    
    [self.taskField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.insertButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.taskTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.insertButton];
    [self.view addSubview:self.taskTable];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.taskField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.taskField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [self.taskField.heightAnchor constraintEqualToConstant:40],
        
        [self.insertButton.topAnchor constraintEqualToAnchor:self.taskField.topAnchor],
        [self.insertButton.leadingAnchor constraintEqualToAnchor:self.taskField.trailingAnchor constant:20],
        [self.insertButton.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [self.insertButton.heightAnchor constraintEqualToAnchor:self.taskField.heightAnchor],
        [self.insertButton.widthAnchor constraintEqualToConstant:60],
        
        [self.taskTable.topAnchor constraintEqualToAnchor:self.taskField.bottomAnchor constant:20],
        [self.taskTable.leadingAnchor constraintEqualToAnchor:self.taskField.leadingAnchor],
        [self.taskTable.trailingAnchor constraintEqualToAnchor:self.insertButton.trailingAnchor],
        [self.taskTable.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-20]
    ]];
}

#pragma mark - Actions

- (void)addTask:(id)sender
{
    NSString *task = [self.taskField text];
    
    if ([task length] == 0) {
        return;
    }
    
    [self.tasks addObject:task];
    [self.taskTable reloadData];
    
    [self.taskField setText:@""];
    [self.taskField resignFirstResponder];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item;
    
    return cell;
}

@end
