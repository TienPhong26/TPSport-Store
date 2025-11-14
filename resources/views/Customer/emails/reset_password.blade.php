<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu - TP Sport</title>
</head>
<body style="margin: 0; padding: 0; background-color: #f0f2f5; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">

    <!-- Email Container -->
    <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="background-color: #f0f2f5;">
        <tr>
            <td align="center" style="padding: 40px 20px;">
                <!-- Main Email Content -->
                <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="600" style="max-width: 600px; background-color: #ffffff; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">

                    <!-- Header Section -->
                    <tr>
                        <td style="background-color: #444; padding: 40px 30px; text-align: center;">
                            <!-- Logo -->
                            <a href="{{ config('app.url') }}">
                                <img src="https://i.ibb.co/V0psTtX5/iconlogo2.png" alt="Logo" style="width: 80px; height: 80px; display: block; margin: 0 auto 20px; border-radius: 50%;">
                            </a>
                            <!-- Title -->
                            <h1 style="color: #ffffff; font-size: 28px; font-weight: 700; margin: 0; line-height: 1.2;">
                                Đặt lại mật khẩu
                            </h1>
                            <p style="color: rgba(255,255,255,0.85); font-size: 16px; margin: 10px 0 0 0; line-height: 1.4;">
                                Yêu cầu khôi phục tài khoản của bạn
                            </p>
                        </td>
                    </tr>

                    <!-- Content Section -->
                    <tr>
                        <td style="padding: 40px 30px;">
                            <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td>
                                        <h2 style="color: #2d3748; font-size: 24px; font-weight: 600; margin: 0 0 20px 0; line-height: 1.3;">
                                            Xin chào {{ $customer->name ?? 'Khách hàng' }}!
                                        </h2>

                                        <p style="color: #4a5568; font-size: 16px; line-height: 1.6; margin: 0 0 25px 0;">
                                            Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn. Vui lòng nhấp vào nút bên dưới để tạo mật khẩu mới.
                                        </p>

                                        <div style="background-color: #f7fafc; border-left: 4px solid #4299e1; padding: 20px; margin: 25px 0; border-radius: 0 8px 8px 0;">
                                            <p style="color: #2d3748; font-size: 14px; margin: 0; line-height: 1.5;">
                                                <strong>🔒 Lưu ý bảo mật:</strong> Liên kết này chỉ có hiệu lực trong <strong>60 phút</strong> và chỉ sử dụng một lần.
                                            </p>
                                        </div>

                                        <!-- CTA Button -->
                                        <table role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%" style="margin: 35px 0;">
                                            <tr>
                                                <td align="center">
                                                    <a href="{{ $resetUrl }}" style="display: inline-block; background-color: #667eea; color: #ffffff; text-decoration: none; padding: 16px 40px; border-radius: 50px; font-size: 16px; font-weight: 600; text-align: center;">
                                                        Đặt lại mật khẩu ngay
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>

                                        <!-- Alternative Link -->
                                        <div style="background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 30px 0;">
                                            <p style="color: #6b7280; font-size: 14px; margin: 0 0 10px 0;">
                                                Nếu nút trên không hoạt động, sao chép liên kết sau vào trình duyệt:
                                            </p>
                                            <p style="word-break: break-all; color: #4299e1; font-size: 14px; margin: 0; padding: 10px; background-color: #ffffff; border: 1px solid #e2e8f0; border-radius: 4px;">
                                                {{ $resetUrl }}
                                            </p>
                                        </div>

                                        <!-- Footer Info -->
                                        <div style="border-top: 1px solid #e2e8f0; padding-top: 25px; margin-top: 30px; text-align: center;">
                                            <p style="color: #6b7280; font-size: 14px; line-height: 1.6; margin: 0;">
                                                © {{ date('Y') }} {{ config('app.name') }}. Tất cả quyền được bảo lưu.
                                                <br>
                                                Email này được gửi tự động, vui lòng không trả lời.
                                            </p>
                                        </div>

                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</body>
</html>
