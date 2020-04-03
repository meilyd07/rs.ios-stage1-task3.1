#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) UIView *viewResultColor;
@property (strong, nonatomic) UITextField *textFieldRed;
@property (strong, nonatomic) UITextField *textFieldGreen;
@property (strong, nonatomic) UITextField *textFieldBlue;
@property (strong, nonatomic) UILabel *labelResultColor;
@property (strong, nonatomic) UILabel *labelRed;
@property (strong, nonatomic) UILabel *labelGreen;
@property (strong, nonatomic) UILabel *labelBlue;
@property (strong, nonatomic) UIButton *buttonProcess;
@end

static int const kLabelWidth = 130;
static int const kResultLabelWidth = 160;
static int const kLeftBorderWidth = 15;
static int const kRightBorderWidth = 30;
static int const kTopDistance = 40;
static int const kLineDistance = 30;
static int const kRowDistance = 40;
static int const kLargeRowDistance = 50;

@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
    [self setupSubviews];
    [self setupConstraints];
}

- (void)setupView {
    self.view.accessibilityIdentifier = @"mainView";
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)setupSubviews {
    
    self.labelResultColor = [UILabel new];
    [self setupLabel:self.labelResultColor Named:@"labelResultColor" Labeled:@"Color"];
    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectZero];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.viewResultColor.backgroundColor = UIColor.darkGrayColor;
    [self.view addSubview:self.viewResultColor];
    
    self.labelRed = [UILabel new];
    [self setupLabel:self.labelRed Named:@"labelRed" Labeled:@"RED"];
    self.textFieldRed = [[UITextField alloc] init];
    [self setupTextField: self.textFieldRed Named:@"textFieldRed"];
    
    self.labelGreen = [UILabel new];
    [self setupLabel:self.labelGreen Named:@"labelGreen" Labeled:@"GREEN"];
    self.textFieldGreen = [[UITextField alloc] init];
    [self setupTextField:self.textFieldGreen Named:@"textFieldGreen"];
    
    self.labelBlue = [UILabel new];
    [self setupLabel:self.labelBlue Named:@"labelBlue" Labeled:@"BLUE"];
    self.textFieldBlue = [[UITextField alloc] init];
    [self setupTextField:self.textFieldBlue Named:@"textFieldBlue"];
    
    self.buttonProcess = [UIButton new];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.buttonProcess.backgroundColor = [UIColor clearColor];
    [self.buttonProcess setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess sizeToFit];
    [self.buttonProcess addTarget:self action:@selector(buttonProcessDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonProcess];
    
}

- (void)setupLabel:(UILabel *)label Named:(NSString *)identifier Labeled:(NSString *)text {
    label.accessibilityIdentifier = identifier;
    [label setText:text];
    [self.view addSubview:label];
}

- (void)setupTextField:(UITextField *)textField Named:(NSString *)identifier{
    textField.accessibilityIdentifier = identifier;
    textField.delegate = self;
    textField.placeholder = @"0..255";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
}

- (void)buttonProcessDidTap:(UIButton *)button {
    NSLog(@"Process...");
}

- (void)setupConstraints {
    [self.viewResultColor.heightAnchor constraintEqualToConstant:38].active = YES;

    [self setConstraintsFor:self.labelResultColor Sized:kResultLabelWidth And:self.viewResultColor From:self.view.safeAreaLayoutGuide.topAnchor With:kTopDistance];
    [self setConstraintsFor:self.labelRed Sized:kLabelWidth And:self.textFieldRed From:self.viewResultColor.bottomAnchor With:kLineDistance];
    [self setConstraintsFor:self.labelGreen Sized:kLabelWidth And:self.textFieldGreen From:self.textFieldRed.bottomAnchor With:kLineDistance];
    [self setConstraintsFor:self.labelBlue Sized:kLabelWidth And:self.textFieldBlue From:self.textFieldGreen.bottomAnchor With:kLineDistance];
    [self setButtonConstraints];
}

- (void)setConstraintsFor:(UILabel *)label Sized:(CGFloat)width And:(UIView *)view From:(NSLayoutAnchor *)anchor With:(CGFloat)distance{
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view.topAnchor constraintEqualToAnchor:anchor constant:distance].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:view.trailingAnchor constant:kRightBorderWidth].active = YES;
    [label.centerYAnchor constraintEqualToAnchor:view.centerYAnchor constant:0].active = YES;
    [label.heightAnchor constraintEqualToAnchor:view.heightAnchor multiplier:1].active = YES;
    [label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:kLeftBorderWidth].active = YES;
    [label.widthAnchor constraintEqualToConstant:width].active = YES;
    [label.trailingAnchor constraintEqualToAnchor:view.leadingAnchor constant:kRowDistance].active = YES;
}

- (void)setButtonConstraints {
    self.buttonProcess.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonProcess.topAnchor constraintEqualToAnchor:self.textFieldBlue.bottomAnchor constant:kLargeRowDistance].active = YES;
    [self.buttonProcess.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0].active = YES;
}

@end

