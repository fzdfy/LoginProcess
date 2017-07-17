//
//  LoginViewController.m
//  UnifiedApp
//
//  Created by 凤云鹏 on 2017/7/13.
//  Copyright © 2017年 FYP. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "UserManager.h"
#import "ViewController.h"
#import "AppDelegate.h"


@interface LoginViewController ()<UITextFieldDelegate>
{
    BOOL _isRember;//记住密码
}

//用户名输入框
@property (nonatomic, strong) UITextField *adminTf;
//密码输入框
@property (nonatomic, strong) UITextField *passwordTf;
//记住密码按钮
@property (nonatomic, strong) UIButton *remember;
//忘记密码按钮
@property (nonatomic, strong) UIButton *forgetPassword;
//登录按钮
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.scrollView.showsVerticalScrollIndicator = NO;
    UIImageView *backgroundImg = [[UIImageView alloc]init];
    backgroundImg.backgroundColor = RGB(40, 160, 240);
    [self.scrollView addSubview:backgroundImg];
    [backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.scrollView);
        make.top.equalTo(self.scrollView);
        make.right.mas_equalTo(self.scrollView.mas_right);
        make.left.equalTo(self.scrollView);
        make.bottom.mas_equalTo(self.scrollView.mas_bottom);
    }];
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_icon"]];
    [self.scrollView addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(70.f);
        make.height.mas_equalTo(logo.mas_width);
        make.centerX.equalTo(self.scrollView);
        make.centerY.equalTo(self.scrollView).offset(-45.f).multipliedBy(0.5);
    }];
    
    UIView *shadow = [[UIView alloc] init];
    /**创建椭圆形的贝塞尔曲线*/
    UIBezierPath *_ovalPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 140, 20)];
    /**创建带形状的图层*/
    CAShapeLayer *_shapeLayer=[CAShapeLayer layer];
    _shapeLayer.frame=CGRectMake(0, 0, 140, 20);
    
    /**注意:图层之间与贝塞尔曲线之间通过path进行关联*/
    _shapeLayer.path=_ovalPath.CGPath;
    
    _shapeLayer.fillColor=UIColorFromRGB(0x0072ab).CGColor;
    [shadow.layer addSublayer:_shapeLayer];

    [self.scrollView addSubview:shadow];
    
    [shadow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(logo.mas_bottom).offset(22);
        make.size.mas_equalTo(CGSizeMake(140.f, 20.f));
    }];
    
    UILabel *logoName = [[UILabel alloc] init];
    logoName.text = @"个人登陆";
    logoName.textColor = [UIColor whiteColor];
    logoName .font = [UIFont systemFontOfSize:22.f];
    [self.scrollView addSubview:logoName];
    
    [logoName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(logo.mas_bottom).offset(10);
    }];
    
    [self.scrollView addSubview:self.adminTf];
    
    [self.adminTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(20.f);
        make.right.equalTo(self.scrollView).offset(-20.f);
        make.height.mas_equalTo(36.f);
        make.centerY.equalTo(self.scrollView).offset(-36.f);
    }];
    [self.scrollView addSubview:self.passwordTf];
    
    [self.passwordTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView).offset(20.f);
        make.right.equalTo(self.scrollView).offset(-20.f);
        make.height.mas_equalTo(36.f);
        make.centerY.equalTo(self.scrollView).offset(20.f);
    }];
    
    //记住密码
    [self.scrollView addSubview:self.remember];
    [self.remember mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 20.f));
        make.top.equalTo(self.passwordTf.mas_bottom).offset(18.f);
        make.left.equalTo(self.passwordTf);
    }];
    
    //忘记密码
    [self.scrollView addSubview:self.forgetPassword];
    [self.forgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 20.f));
        make.top.equalTo(self.passwordTf.mas_bottom).offset(18.f);
        make.right.equalTo(self.passwordTf);
    }];
    
    [self.scrollView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.adminTf);
        make.top.equalTo(self.remember.mas_bottom).offset(18.f);
        make.height.mas_equalTo(45.f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)isRemember:(UIButton *)sender {
    _isRember = !_isRember;
    [UserManager sharedUserManager].isRember = _isRember;
    if (_isRember) {
        [_remember setImage:[UIImage imageNamed:@"msg-1"] forState:UIControlStateNormal];
    } else {
        [_remember setImage:[UIImage imageNamed:@"msg-2"] forState:UIControlStateNormal];
    }
}

//登录
- (void)login {
    if ([NSString isNULLString:self.adminTf.text]) {
        [MBProgressHUD showMessage:@"请输入用户名"];
        return;
    } else if ([NSString isNULLString:self.passwordTf.text]) {
        [MBProgressHUD showMessage:@"请输入密码"];
        return;
    }
    if ([self.adminTf isFirstResponder]) {
        [self.adminTf resignFirstResponder];
        [self performSelector:@selector(request:) withObject:nil afterDelay:0.7];
    } else if ([self.passwordTf isFirstResponder]) {
        [self.passwordTf resignFirstResponder];
        [self performSelector:@selector(request:) withObject:nil afterDelay:0.7];
    } else {
        [self request:nil];
    }
}

- (void)request:(id)sender {
    NSString *admin = self.adminTf.text;
    NSString *password = self.passwordTf.text;
    
    [MBProgressHUD showMessage:@"登陆成功!"];
    //登陆成功会返回一个ticket,以后的所有请求都需要带上ticket作为入参
    NSDictionary *info = @{@"userNo":admin,@"name":@"凤云鹏",@"ticket":@"HF7R-MKEI-ON87-93U6"};
    [UserManager sharedUserManager].lastLoginUser = admin;
    User *user = [User initWithDictionary:info];
    [UserManager sharedUserManager].user = user;
    [[UserManager sharedUserManager] archive];//保存用户基本信息
    if(_isRember){
        [[UserManager sharedUserManager] savePassword:password account:admin];//保存用户账号密码
    }else{
        [[UserManager sharedUserManager] deleteAccount:admin];
    }
    
    ViewController * rootView = [[ViewController alloc] init];
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = rootView;
}

- (void)forgetPasswordClick
{
    ForgetPasswordViewController *forgetPassword = [[ForgetPasswordViewController alloc] init];
    forgetPassword.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:forgetPassword animated:YES completion:nil];
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
        _adminTf.clearButtonMode = UITextFieldViewModeAlways;
        _adminTf.backgroundColor = [UIColor whiteColor];
        _adminTf.placeholder = @"工号";
        _adminTf.text = [[UserManager sharedUserManager] lastLoginUser];
        
    }
    return _adminTf;
}

- (UITextField *)passwordTf {
    if (!_passwordTf) {
        _passwordTf = [[UITextField alloc] init];
        _passwordTf.font = [UIFont systemFontOfSize:16.f];
        _passwordTf.textColor = RGB(40, 160, 240);
//        _passwordTf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _passwordTf.delegate = self;
        _passwordTf.borderStyle = UITextBorderStyleRoundedRect;
        _passwordTf.clearButtonMode = UITextFieldViewModeNever;
        _passwordTf.backgroundColor = [UIColor whiteColor];
        _passwordTf.placeholder = @"密码";
        BOOL isRember = [UserManager sharedUserManager].isRember;
        if (isRember) {
            _passwordTf.text = [[UserManager sharedUserManager] getPasswordForAccount:self.adminTf.text];
        }
    }
    return _passwordTf;
}
//记住密码
- (UIButton *)remember {
    if (!_remember) {
        _remember = [UIButton buttonWithType:UIButtonTypeCustom];
        [_remember setImage:[UIImage imageNamed:@"msg-2"] forState:UIControlStateNormal];
        [_remember setTitle:@"记住密码" forState:UIControlStateNormal];
        [_remember setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        BOOL isRember = [UserManager sharedUserManager].isRember;
        if (isRember) {
            [_remember setImage:[UIImage imageNamed:@"msg-1"] forState:UIControlStateNormal];
            _isRember = YES;

        }else{
            [_remember setImage:[UIImage imageNamed:@"msg-2"] forState:UIControlStateNormal];
            _isRember = NO;
        }
        [_remember setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
        [self.remember addTarget:self action:@selector(isRemember:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _remember;
}

- (UIButton *)forgetPassword {
    if (!_forgetPassword) {
        _forgetPassword = [UIButton buttonWithType:UIButtonTypeSystem];
        [_forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPassword setTitleColor:UIColorFromRGB(0x0072ab) forState:UIControlStateNormal];
        _forgetPassword.titleLabel.font = [UIFont systemFontOfSize:17.f];
        _forgetPassword.backgroundColor = [UIColor clearColor];
        [_forgetPassword addTarget:self action:@selector(forgetPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPassword;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginBtn.layer.cornerRadius = 8.f;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17.f];
        _loginBtn.backgroundColor = UIColorFromRGB(0x0072ab);
        [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.bounces = YES;
        _scrollView.alwaysBounceVertical = YES;
    }
    return _scrollView;
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
