//
//  ForgetPasswordViewController.m
//  UnifiedApp
//
//  Created by 凤云鹏 on 2017/7/13.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()<UITextFieldDelegate>

//用户名输入框
@property (nonatomic, strong) UITextField *adminTf;
//密码输入框
@property (nonatomic, strong) UITextField *passwordTf;
//验证码按钮
@property (nonatomic, strong) UIButton *identifyCodeBtn;
//提交按钮
@property (nonatomic, strong) UIButton *commitBtn;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationbar];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.adminTf];
    [self.adminTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20.f);
        make.right.equalTo(self.view).offset(-20.f);
        make.height.mas_equalTo(40.f);
        make.top.equalTo(self.view).offset(64+40.f);
    }];
    [self.view addSubview:self.passwordTf];
    
    [self.passwordTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20.f);
        make.height.mas_equalTo(40.f);
        make.top.equalTo(self.adminTf.mas_bottom).offset(20.f);
    }];
    
    [self.view addSubview:self.identifyCodeBtn];
    [self.identifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordTf.mas_right).offset(10.f);
        make.right.equalTo(self.view).offset(-20.f);
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.top.equalTo(self.adminTf.mas_bottom).offset(30.f);
    }];
    
    [self.view addSubview:self.commitBtn];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20.f);
        make.right.equalTo(self.view).offset(-20.f);
        make.height.mas_equalTo(40.f);
        make.top.equalTo(self.passwordTf.mas_bottom).offset(30.f);
    }];
    
    
}

- (void)setNavigationbar
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 64)];
    
    
    UIImage *image = [UIImage imageNamed:@"nav"];
    //根据屏幕宽度判断拉伸长度和倍数
    UIImage *barBackgroundImage =UIUtilsScaleImage(image, CGSizeMake(SCREENWIDTH, 64));
    [navigationBar setBackgroundImage:barBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:UIUtilsSystemFont(20.0f)}];
    //创建UINavigationItem
    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"忘记密码"];
    [navigationBar pushNavigationItem: navigationBarTitle animated:YES];
    [self.view addSubview: navigationBar];
    //创建UIBarButton 可根据需要选择适合自己的样式
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navback"] style:UIBarButtonItemStyleDone target:self action:@selector(navigationBackButton:)];
    //设置barbutton
    navigationBarTitle.leftBarButtonItem = item;
    [navigationBar setItems:[NSArray arrayWithObject: navigationBarTitle]];
    
}

- (void)getIdentifyCode
{
    NSLog(@"获取验证码");
}

- (void)commit
{
    [MBProgressHUD showMessage:@"修改成功!"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigationBackButton:(UIBarButtonItem *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -------------- 懒加载 --------------

- (UITextField *)adminTf {
    if (!_adminTf) {
        _adminTf = [[UITextField alloc] init];
        _adminTf.font = [UIFont systemFontOfSize:16.f];
        _adminTf.textColor = RGB(40, 160, 240);
        //        _adminTf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _adminTf.delegate = self;
        _adminTf.borderStyle = UITextBorderStyleRoundedRect;
//        _adminTf.layer.borderWidth = 1.f;
        _adminTf.clearButtonMode = UITextFieldViewModeAlways;
        _adminTf.backgroundColor = [UIColor whiteColor];
        _adminTf.placeholder = @"工号";
    }
    return _adminTf;
}

- (UITextField *)passwordTf {
    if (!_passwordTf) {
        _passwordTf = [[UITextField alloc] init];
        _passwordTf.font = [UIFont systemFontOfSize:16.f];
        _passwordTf.textColor = RGB(40, 160, 240);
        _passwordTf.delegate = self;
        _passwordTf.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTf.clearButtonMode = UITextFieldViewModeNever;
        _passwordTf.backgroundColor = [UIColor whiteColor];
        _passwordTf.placeholder = @"密码";
    }
    return _passwordTf;
}

- (UIButton *)identifyCodeBtn {
    if (!_identifyCodeBtn) {
        _identifyCodeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_identifyCodeBtn setTitle:@"验证码" forState:UIControlStateNormal];
        [_identifyCodeBtn setTitleColor:UIColorFromRGB(0x0072ab) forState:UIControlStateNormal];
        _identifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:17.f];
        _identifyCodeBtn.backgroundColor = [UIColor clearColor];
        [_identifyCodeBtn addTarget:self action:@selector(getIdentifyCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _identifyCodeBtn;
}

- (UIButton *)commitBtn {
    if (!_commitBtn) {
        _commitBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _commitBtn.layer.cornerRadius = 8.f;
        [_commitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _commitBtn.titleLabel.font = [UIFont systemFontOfSize:17.f];
        _commitBtn.backgroundColor = UIColorFromRGB(0x0072ab);
        [_commitBtn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
