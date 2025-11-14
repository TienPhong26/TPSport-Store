document.addEventListener('DOMContentLoaded', () => {
    const elements = {
        province: document.getElementById('province'),
        district: document.getElementById('district'),
        ward: document.getElementById('ward'),
        shippingMethod: document.getElementById('shipping_method'),
        shippingFeeDisplay: document.getElementById('shipping-fee'),
        shippingMethodName: document.getElementById('shipping-method-name'),
        finalTotalDisplay: document.getElementById('final-total'),
        voucherForm: document.getElementById('voucherForm'),
        voucherSelect: document.getElementById('voucher_select'),
        voucherMessage: document.getElementById('voucher-message'),
        discountRow: document.getElementById('discount-row'),
        discountAmount: document.getElementById('discount-amount'),
        discountDetails: document.getElementById('discount-details'),
        voucherCodeDisplay: document.getElementById('voucher-code-display')
    };

    let state = {
        baseTotal: parseFloat(elements.finalTotalDisplay.dataset.total), // Hoặc {{ $total }} render trong HTML
        currentShippingFee: 0,
        voucherDiscount: 0
    };

    const formatCurrency = (amount) => new Intl.NumberFormat('vi-VN').format(amount) + 'đ';

    const initLocationSelector = () => {
        if (typeof $.fn.vietnamlocalselector === 'function') {
            $(elements.province).vietnamlocalselector({
                district: '#district',
                ward: '#ward'
            });
        } else {
            console.error('vietnamlocalselector plugin is not loaded.');
        }
    };

    const updateTotalDisplay = () => {
        let total = state.baseTotal + state.currentShippingFee - state.voucherDiscount;
        if (total < 0) total = 0;
        elements.finalTotalDisplay.textContent = formatCurrency(total);
    };

    const handleShippingChange = () => {
        const selectedOption = elements.shippingMethod.options[elements.shippingMethod.selectedIndex];
        state.currentShippingFee = parseFloat(selectedOption.dataset.fee) || 0;
        elements.shippingMethodName.textContent = selectedOption.text.split(' (')[0];
        elements.shippingFeeDisplay.textContent = formatCurrency(state.currentShippingFee);
        updateTotalDisplay();
    };

    const handleVoucherChange = () => {
        const selectedOption = elements.voucherSelect.options[elements.voucherSelect.selectedIndex];
        if (!selectedOption.value) return;

        const minPurchase = parseFloat(selectedOption.dataset.min);
        if (minPurchase && state.baseTotal < minPurchase) {
            alert(`Đơn hàng cần tối thiểu ${formatCurrency(minPurchase)} để sử dụng voucher này`);
            elements.voucherSelect.value = '';
        }
    };

    const handleVoucherSubmit = async (e) => {
        e.preventDefault();
        const selectedOption = elements.voucherSelect.options[elements.voucherSelect.selectedIndex];

        if (!selectedOption.value) {
            elements.voucherMessage.innerHTML = '<div class="alert alert-danger">Vui lòng chọn mã giảm giá</div>';
            elements.discountRow.style.display = 'none';
            state.voucherDiscount = 0;
            updateTotalDisplay();
            return;
        }

        const formData = new FormData();
        formData.append('_token', '{{ csrf_token() }}');
        formData.append('voucher_code', selectedOption.value);

        try {
            const response = await fetch('/your-voucher-apply-route-url', {
                method: 'POST',
                headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
                body: formData
            });
            const data = await response.json();

            if (data.success) {
                state.voucherDiscount = state.baseTotal - data.new_total;
                if (state.voucherDiscount < 0) state.voucherDiscount = 0;

                elements.discountRow.style.display = 'flex';
                elements.discountAmount.textContent = `-${formatCurrency(state.voucherDiscount)}`;

                const isPercentage = selectedOption.dataset.percentage && parseFloat(selectedOption.dataset.percentage) > 0;
                elements.discountDetails.textContent = isPercentage
                    ? `Giảm ${selectedOption.dataset.percentage}%`
                    : `Giảm ${formatCurrency(selectedOption.dataset.discount)}`;
                elements.voucherCodeDisplay.textContent = `Mã: ${selectedOption.value}`;
                elements.voucherMessage.innerHTML = `<div class="alert alert-success">${data.message}</div>`;
            } else {
                elements.discountRow.style.display = 'none';
                state.voucherDiscount = 0;
                elements.voucherMessage.innerHTML = `<div class="alert alert-danger">${data.message}</div>`;
            }
            updateTotalDisplay();
        } catch (error) {
            elements.discountRow.style.display = 'none';
            state.voucherDiscount = 0;
            elements.voucherMessage.innerHTML = '<div class="alert alert-danger">Có lỗi xảy ra khi áp dụng mã giảm giá</div>';
            updateTotalDisplay();
        }
    };

    const initEventListeners = () => {
        elements.shippingMethod.addEventListener('change', handleShippingChange);
        elements.voucherSelect.addEventListener('change', handleVoucherChange);
        elements.voucherForm.addEventListener('submit', handleVoucherSubmit);
    };

    const init = () => {
        initLocationSelector();
        initEventListeners();
        elements.shippingMethod.dispatchEvent(new Event('change'));
    };

    init();
});
