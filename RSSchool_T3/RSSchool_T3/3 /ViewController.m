#import "ViewController.h"

@interface ViewController ()
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
static int const kBorderWidth = 20;
static int const kTopDistance = 40;
static int const kLineDistance = 20;
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
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    [self.labelResultColor setText:@"Color"];
    [self.view addSubview:self.labelResultColor];

    self.viewResultColor = [[UIView alloc] initWithFrame:CGRectZero];
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    self.viewResultColor.backgroundColor = UIColor.darkGrayColor;
    [self.view addSubview:self.viewResultColor];
    
    self.labelRed = [UILabel new];
    self.labelRed.accessibilityIdentifier = @"labelRed";
    [self.labelRed setText:@"RED"];
    [self.view addSubview:self.labelRed];
    
    self.textFieldRed = [[UITextField alloc] init];
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.placeholder = @"0..255";
    [self.view addSubview:self.textFieldRed];
    
    self.labelGreen = [UILabel new];
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    [self.labelGreen setText:@"GREEN"];
    [self.view addSubview:self.labelGreen];
    
    self.textFieldGreen = [[UITextField alloc] init];
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.placeholder = @"0..255";
    [self.view addSubview:self.textFieldGreen];
    
    self.labelBlue = [UILabel new];
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    [self.labelBlue setText:@"BLUE"];
    [self.view addSubview:self.labelBlue];
    
    self.textFieldBlue = [[UITextField alloc] init];
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.placeholder = @"0..255";
    [self.view addSubview:self.textFieldBlue];
    
    self.buttonProcess = [UIButton new];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    self.buttonProcess.backgroundColor = [UIColor clearColor];
    [self.buttonProcess setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];

    [self.buttonProcess sizeToFit];
    [self.view addSubview:self.buttonProcess];
    
}

- (void)setupConstraints {
    [self.viewResultColor.heightAnchor constraintEqualToConstant:38].active = YES;

    [self setConstraintsFor:self.labelResultColor Sized:kResultLabelWidth And:self.viewResultColor From:self.view.safeAreaLayoutGuide.topAnchor With:kTopDistance];
    [self setConstraintsFor:self.labelRed Sized:kLabelWidth And:self.textFieldRed From:self.viewResultColor.bottomAnchor With:kLineDistance];
    [self setConstraintsFor:self.labelGreen Sized:kLabelWidth And:self.textFieldGreen From:self.textFieldRed.bottomAnchor With:kLineDistance];
    [self setConstraintsFor:self.labelBlue Sized:kLabelWidth And:self.textFieldBlue From:self.textFieldGreen.bottomAnchor With:kLineDistance];
    [self setButtonCpnstraints];
}

- (void)setConstraintsFor:(UILabel *)label Sized:(CGFloat)width And:(UIView *)view From:(NSLayoutAnchor *)anchor With:(CGFloat)distance{
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [view.topAnchor constraintEqualToAnchor:anchor constant:distance].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:view.trailingAnchor constant:kBorderWidth].active = YES;
    [label.centerYAnchor constraintEqualToAnchor:view.centerYAnchor constant:0].active = YES;
    [label.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:kBorderWidth].active = YES;
    [label.widthAnchor constraintEqualToConstant:width].active = YES;
    [label.trailingAnchor constraintEqualToAnchor:view.leadingAnchor constant:kRowDistance].active = YES;
}

- (void)setButtonCpnstraints {
    self.buttonProcess.translatesAutoresizingMaskIntoConstraints = NO;
    [self.buttonProcess.topAnchor constraintEqualToAnchor:self.textFieldBlue.bottomAnchor constant:kLargeRowDistance].active = YES;
    [self.buttonProcess.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0].active = YES;
}

@end
