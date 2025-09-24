{{-- VOUCHER ĐỘC QUYỀN --}}
<div class="container mt-6">
    <ul class="nav nav-pills mt-3 mb-3 justify-content-center" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                type="button" role="tab" aria-controls="pills-home" aria-selected="true">
                Mô tả sản phẩm
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-ecoms-tab" data-bs-toggle="pill" data-bs-target="#pills-ecoms"
                type="button" role="tab" aria-controls="pills-ecoms" aria-selected="false">
                Chính sách giao hàng
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-arpu-tab" data-bs-toggle="pill" data-bs-target="#pills-arpu"
                type="button" role="tab" aria-controls="pills-arpu" aria-selected="false">
                Chính sách đổi trả
            </button>
        </li>
    </ul>


    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
            <h5><strong>1. HƯỚNG DẪN BẢO QUẢN SẢN PHẨM {{ $product->brand->brand_name ?? 'N/A' }}</strong></h5>
            <ul>
                <li>Giặt bằng nước lạnh hoặc nước ấm nhẹ để tránh co rút hoặc phai màu.</li>
                <li>Dùng bột giặt dịu nhẹ để không làm ảnh hưởng đến chất liệu mỏng nhẹ.</li>
                <li>Phơi nơi râm mát: Tránh ánh nắng gắt trực tiếp, đặc biệt với quần áo có chất liệu sợi tổng hợp
                    (polyester, spandex).</li>
                <li>Ủi ở nhiệt độ thấp.</li>
            </ul>

            <h5 class="mt-3"><strong>2. THÔNG TIN THƯƠNG HIỆU {{ $product->brand->brand_name ?? 'N/A' }}</strong></h5>
            <p>Ngày nay {{ $product->brand->brand_name ?? 'N/A' }} không chỉ là nhãn hiệu thể thao chuyên nghiệp mà còn là một sản phẩm thời trang. {{ $product->brand->brand_name ?? 'N/A' }}
                đã phân chia các dòng sản phẩm của mình thành 3 phân nhóm:</p>
            <ul>
                <li><strong>Thành tích thể thao:</strong> tập trung vào tính năng của sản phẩm đáp ứng cho các VĐV
                    chuyên nghiệp.</li>
                <li><strong>Di sản thể thao:</strong> những sản phẩm truyền thống đã mang lại danh tiếng.</li>
                <li><strong>Thời trang thể thao:</strong> tập trung vào những khách hàng trẻ thích những sản phẩm trang
                    phục thể thao hợp thời trang và sang trọng.</li>
            </ul>
            <p>Có thể nói {{ $product->brand->brand_name ?? 'N/A' }} thành công nhờ:</p>
            <ul>
                <li>Luôn luôn sáng tạo nhằm vào sự nâng cao thành tích cho các VĐV chuyên nghiệp.</li>
                <li>Luôn trung thành với KH mục tiêu là các VĐV chuyên nghiệp.</li>
                <li>Luôn giữ gìn lịch sử đẹp đẽ và phát triển nó thành 1 phong cách thời trang.</li>
                <li>Luôn kiên định với Dassler ngày nào: “phong độ” cho dù có lúc sóng gió nhưng họ không bao giờ bắt
                    sản phẩm mình phải trả giá.</li>
                <li>Những ngôi sao thể hiện đúng phong cách mà {{ $product->brand->brand_name ?? 'N/A' }} truyền đạt.</li>
            </ul>
        </div>

        <div class="tab-pane fade" id="pills-ecoms" role="tabpanel" aria-labelledby="pills-ecoms-tab">
            <h5>1. CƯỚC PHÍ VẬN CHUYỂN</h5>
            <ul class="mb-3">
                <li>Tất cả các đơn hàng áp dụng biểu phí giao hàng theo từng khu vực được quy định bởi bên thứ 3
                    (Bên thứ 3 là đơn vị vận chuyển được TpSport liên kết hợp tác cung cấp dịch vụ).</li>
                <li>Đối với khách hàng đã xác nhận đặt hàng nhưng khi nhân viên giao hàng giao tới tay người nhận
                    nhưng lại từ chối nhận hàng vui lòng thanh toán phí chuyển hoàn cho nhân viên giao hàng.<strong>Phí
                        cố định 40.000 vnđ</strong>.</li>
            </ul>

            <h5>2. THỜI GIAN VẬN CHUYỂN</h5>
            <ul class="mb-3">
                <li>Tuyến nội thành Hà Nội: giao hàng trong vòng 3-5 ngày kể từ khi hệ thống xác nhận qua tin
                    nhắn(SMS)/điện thoại</li>
                <li>Tuyến ngoại thành Hà Nội: giao hàng trong vòng 3-7 ngày kể từ khi hệ thống xác nhận qua tin
                    nhắn(SMS)/điện thoại</li>
                <li>Tuyến Đà Nẵng, TP.HCM: giao hàng trong vòng 3-7 ngày kể từ khi hệ thống xác nhận qua tin
                    nhắn(SMS)/điện thoại</li>
                <li>Tất cả thành phố khác: giao hàng trong vòng 3-7 ngày kể từ khi hệ thống xác nhận qua tin
                    nhắn(SMS)/điện thoại</li>
                <li>Thời gian giao hàng không tính thứ bảy, chủ nhật hay các ngày lễ tết.</li>
            </ul>

            <h5>3. ĐƠN HÀNG ĐƯỢC GIAO TỐI ĐA MẤY LẦN ?</h5>
            <ul>
                <li>
                    Đơn hàng được giao tối đa 2 lần.
                </li>
                <li>
                    Nếu lần 1 giao không thành công, nhân viên vận chuyển sẽ liên hệ lại bạn lần 2 sau 1-2 ngày làm việc
                    kế tiếp.
                </li>
                <li>
                    Sau 2 lần giao dịch không thành công đơn hàng sẽ hủy.
                </li>
            </ul>

            <h5>4. KIỂM TRA TÌNH TRẠNG ĐƠN HÀNG</h5>
            <ul>
                <li>
                    Để kiểm tra thông tin hoặc tình trạng đơn hàng, vui lòng sử dụng <strong>MÃ ĐƠN HÀNG</strong>
                    đã được gửi trong email xác nhận hoặc tin nhắn xác nhận.
                </li>
                <li>
                    Thông báo tới bộ phận Chăm sóc khách hàng qua Hotline <strong>1900633083</strong>
                    hoặc email: <strong>TpSport.online@gmail.com</strong>.
                </li>
            </ul>

            <h5>5. KHI NHẬN ĐƠN HÀNG CÓ ĐƯỢC XEM SẢN PHẨM TRƯỚC KHI THANH TOÁN ?</h5>
            <ul>
                <li>
                    Bạn hoàn toàn có thể mở gói hàng kiểm tra sản phẩm trước khi thanh toán hoặc trước khi nhân viên vận
                    chuyển rời đi.
                </li>
                <li>
                    Trong trường hợp gặp vấn đề phát sinh, liên hệ ngay Hotline <strong>1900633083</strong> hoặc
                    <strong>0979719554</strong> để được hỗ trợ kịp thời.
                </li>
                <li>
                    Đối với khách hàng đã xác nhận đặt hàng nhưng từ chối nhận hàng, vui lòng thanh toán phí chuyển hoàn
                    cho nhân viên giao hàng. <strong>Phí cố định 40.000 vnđ</strong>.
                </li>
            </ul>

        </div>

        <div class="tab-pane fade" id="pills-arpu" role="tabpanel" aria-labelledby="pills-arpu-tab">

            <h4>I. QUY ĐỊNH ĐỔI HÀNG ONLINE</h4>

            <h5>1. Chính sách áp dụng</h5>
            <ul>
                <li>Áp dụng 01 lần đổi/01 đơn hàng.</li>
                <li>Không áp dụng đổi với sản phẩm phụ kiện và đồ lót, hàng giảm giá từ 50% trở lên.</li>
                <li>Sản phẩm nguyên giá được đổi sang sản phẩm nguyên khác còn hàng tại website
                    có giá trị bằng hoặc lớn hơn (KH bù thêm chênh lệch nếu lớn hơn).</li>
                <li>Sản phẩm giảm giá được hỗ trợ đổi size (nếu còn) theo quy chế từng chương trình.</li>
            </ul>

            <h5>2. Điều kiện đổi sản phẩm</h5>
            <ul>
                <li>Thời gian đủ điều kiện đổi sản phẩm trong vòng 03 ngày kể từ ngày bạn nhận sản phẩm.</li>
                <li>Sản phẩm còn nguyên tem mác và chưa qua sử dụng.</li>
            </ul>

            <h5>3. Thực hiện đổi sản phẩm</h5>
            <ul>
                <li>Bước 1: Gọi đến số hotline <strong>1900.633.083</strong>, cung cấp mã đơn hàng và mã sản phẩm cần
                    đổi.</li>
                <li>Bước 2: Gửi hàng về địa chỉ thửa số 01 Lô 2 C4/NO Khu đô thị Nam Trung Yên, Phường Yên Hòa, thành
                    phố Hà Nội.
                    (Ghi rõ thông tin số điện thoại, địa chỉ người gửi. Hàng hóa cần được bọc và đóng gói trước khi gửi.
                    Lưu ý không quấn băng keo trực tiếp lên hộp giày hoặc túi thương hiệu).
                    Người nhận, Số điện thoại, Đổi hàng Online - ghi rõ size, mã cần đổi.
                </li>
                <li>Bước 3: TpSport nhận được hàng sẽ liên hệ xác nhận và thực hiện đổi sản phẩm.</li>
            </ul>

            <p><strong style="  text-decoration: underline;">Lưu ý:</strong></p>
            <ul>
                <li>Đơn hàng đổi thuộc nội thành Hà Nội (Cầu Giấy, Ba Đình, Đống Đa, Hoàn Kiếm, Hai Bà Trưng, Thanh
                    Xuân),
                    TpSport hỗ trợ hướng dẫn khách ra các shop gần nhất của TpSport đổi hàng.</li>
                <li>Đơn hàng không thuộc địa chỉ trên, khách hàng vui lòng gửi hàng về Kho Online theo hướng dẫn.</li>
                <li>Thời gian nhận hàng: Sáng 08h30–12h, Chiều 13h–17h từ thứ 2 – thứ 6.</li>
            </ul>

            <h4>II. QUY ĐỊNH TRẢ HÀNG ONLINE</h4>

            <h5>1. Chính sách áp dụng</h5>
            <ul>
                <li>TpSport nhận sản phẩm trả lại trong trường hợp lỗi nhà sản xuất.</li>
                <li>Các trường hợp lỗi gồm: ố màu, phai màu, lỗi chất liệu, lỗi đường may, lỗi kiểu dáng…
                    không theo đúng mô tả và tiêu chuẩn sản phẩm (không áp dụng với sản phẩm giảm từ 50% trở lên).</li>
                <li>Hoàn tiền lại sản phẩm gặp lỗi qua tài khoản ngân hàng.</li>
                <li>Tính từ thời điểm bạn gửi form yêu cầu đổi hàng và từ thời điểm TpSport nhận được sản phẩm đổi gửi
                    về
                    (đối với đơn ngoài 6 quận nội thành) TpSport sẽ xử lý đơn hàng đổi tối đa 10 ngày
                    (không tính ngày nghỉ lễ, Tết).</li>
            </ul>

            <h5>2. Điều kiện trả sản phẩm</h5>
            <ul>
                <li>Trả sản phẩm trong vòng 03 ngày kể từ ngày bạn nhận sản phẩm.</li>
                <li>Sản phẩm còn nguyên tem, mác và chưa qua sử dụng.</li>
            </ul>

            <h5>3. Thực hiện trả sản phẩm</h5>
            <ul>
                <li>Bước 1: Gửi thông tin mã đơn hàng và tình trạng gặp lỗi vào địa chỉ mail
                    <strong>TpSport.online@gmail.com</strong> hoặc gọi hotline CSKH: <strong>1900633083</strong>.
                </li>
                <li>Bước 2: Gửi sản phẩm lỗi về địa chỉ:
                    Thửa số 01 Lô 2 C4/NO Khu đô thị Nam Trung Yên, Phường Yên Hòa, thành phố Hà Nội.</li>
            </ul>

        </div>

    </div>
</div>