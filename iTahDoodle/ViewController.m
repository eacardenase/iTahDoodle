//
//  ViewController.m
//  iTahDoodle
//
//  Created by Edwin Cardenas on 22/01/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupViews];
}


- (void)addTask:(id)sender {
}

- (void)setupViews
{
    self.taskField = [UITextField new];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    self.taskTable = [UITableView new];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.taskField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.insertButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.taskTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.insertButton];
    [self.view addSubview:self.taskTable];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.taskField.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [self.taskField.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        
        [self.insertButton.topAnchor constraintEqualToAnchor:self.taskField.topAnchor],
        [self.insertButton.leadingAnchor constraintEqualToAnchor:self.taskField.trailingAnchor constant:20],
        [self.insertButton.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        
        [self.taskTable.topAnchor constraintEqualToAnchor:self.taskField.bottomAnchor constant:100],
        [self.taskTable.leadingAnchor constraintEqualToAnchor:self.taskField.leadingAnchor],
        [self.taskTable.trailingAnchor constraintEqualToAnchor:self.insertButton.trailingAnchor],
    ]];
}

@end
