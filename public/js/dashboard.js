document.addEventListener("DOMContentLoaded", function () {
    //JS xử lý search sản phẩm Dashboard
    const searchInput = document.getElementById('adminSearchInput');
    const suggestionsBox = document.getElementById('adminSearchSuggestions');
    let searchTimeout;

    searchInput.addEventListener('input', function () {
        clearTimeout(searchTimeout);
        const query = this.value.trim();

        if (query.length < 2) {
            suggestionsBox.innerHTML = '';
            suggestionsBox.style.display = 'none';
            return;
        }

        searchTimeout = setTimeout(() => {
            fetch(`/admin/search/suggestions?query=${encodeURIComponent(query)}`)
                .then(response => response.json())
                .then(suggestions => {
                    suggestionsBox.innerHTML = '';

                    if (suggestions.length > 0) {
                        suggestions.forEach(item => {
                            const div = document.createElement('div');
                            div.className = 'search-suggestion-item';
                            div.innerHTML = `
                                <span class="product-name">${item.name}</span>
                                <span class="product-category">${item.category}</span>
                            `;
                            div.addEventListener('click', () => {
                                searchInput.value = item.name;
                                suggestionsBox.style.display = 'none';
                                document.getElementById(
                                    'adminSearchForm').submit();
                            });
                            suggestionsBox.appendChild(div);
                        });
                        suggestionsBox.style.display = 'block';
                    } else {
                        suggestionsBox.innerHTML =
                            '<div class="no-results">Không tìm thấy kết quả</div>';
                        suggestionsBox.style.display = 'block';
                    }
                })
                .catch(error => {
                    console.error('Search error:', error);
                });
        }, 300);
    });

    document.addEventListener('click', function (e) {
        if (!searchInput.contains(e.target) && !suggestionsBox.contains(e.target)) {
            suggestionsBox.style.display = 'none';
        }
    });

    var calendarMiniEl = document.getElementById("calendar-mini");
    var calendarMini = new FullCalendar.Calendar(calendarMiniEl, {
        initialView: "dayGridMonth",
        headerToolbar: {
            end: "today prev,next",
        },
    });
    calendarMini.render();
});

// Khởi tạo tooltip
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
});

// Xử lý thay đổi bộ lọc thời gian
const orderTimeFilter = document.getElementById('orderTimeFilter');
if (orderTimeFilter) {
    orderTimeFilter.addEventListener('change', function () {
        // Thêm lệnh gọi AJAX ở đây để làm mới đơn hàng dựa trên khoảng thời gian đã chọn
        fetch(`/admin/dashboard/latest-orders?period=${this.value}`)
            .then(response => response.json())
            .then(data => updateOrdersTable(data));
    });
}
// =========== chart two start

const last7DaysEl = document.getElementById('last7DaysData');
const dailyRevenueEl = document.getElementById('dailyRevenueData');

if (last7DaysEl && dailyRevenueEl) {
    const ctx2 = document.getElementById("Chart2").getContext("2d");
    const chart2 = new Chart(ctx2, {
        type: "bar",
        data: {
            labels: JSON.parse(last7DaysEl.textContent),
            datasets: [{
                label: "Doanh thu",
                backgroundColor: "#365CF5",
                borderRadius: 30,
                barThickness: 6,
                maxBarThickness: 8,
                data: JSON.parse(document.getElementById('dailyRevenueData').textContent),
            }],
        },
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return 'Doanh thu: ' + new Intl.NumberFormat('vi-VN', {
                                style: 'currency',
                                currency: 'VND',
                                minimumFractionDigits: 0,
                                maximumFractionDigits: 0
                            }).format(context.raw);
                        }
                    },
                    backgroundColor: "#F3F6F8",
                    titleAlign: "center",
                    bodyAlign: "center",
                    titleFont: {
                        size: 12,
                        weight: "bold",
                        color: "#8F92A1",
                    },
                    bodyFont: {
                        size: 16,
                        weight: "bold",
                        color: "#171717",
                    },
                    displayColors: false,
                    padding: {
                        x: 30,
                        y: 10,
                    },
                },
                legend: {
                    display: false,
                }
            },
            layout: {
                padding: {
                    top: 15,
                    right: 15,
                    bottom: 15,
                    left: 15,
                },
            },
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    grid: {
                        display: false,
                        drawTicks: false,
                        drawBorder: false,
                    },
                    ticks: {
                        padding: 35,
                        callback: function (value) {
                            return new Intl.NumberFormat('vi-VN', {
                                style: 'currency',
                                currency: 'VND',
                                minimumFractionDigits: 0,
                                maximumFractionDigits: 0
                            }).format(value);
                        }
                    },
                    min: 0,
                },
                x: {
                    grid: {
                        display: false,
                        drawBorder: false,
                        color: "rgba(143, 146, 161, .1)",
                        drawTicks: false,
                        zeroLineColor: "rgba(143, 146, 161, .1)",
                    },
                    ticks: {
                        padding: 20,
                    }
                }
            }
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const chartContainer = document.getElementById('chartContainer');
    const canvas = document.getElementById('brandChart');
    const errorDiv = document.getElementById('chartError');

    fetch('/admin/dashboard/brand-stats', {
        headers: {
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        }
    })
        .then(async response => {
            const data = await response.json();
            if (!response.ok) {
                throw new Error(data.message || `HTTP error! status: ${response.status}`);
            }
            return data;
        })
        .then(result => {
            if (!result.success) {
                throw new Error(result.message || 'Không có dữ liệu');
            }

            const data = result.data;
            if (!data || data.length === 0) {
                throw new Error('Không có dữ liệu thương hiệu');
            }

            // Create chart with data
            new Chart(canvas, {
                type: 'doughnut',
                data: {
                    labels: data.map(item => item.brand_name),
                    datasets: [{
                        data: data.map(item => item.percentage),
                        backgroundColor: [
                            '#8901dc',
                            '#01dc8c',
                            '#ebf15b',
                            '#ADC2FD',
                            '#0139dc'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'right',
                            labels: {
                                font: {
                                    size: 12
                                }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    const item = data[context.dataIndex];
                                    return `${item.brand_name}: ${item.percentage}% (${item.total_sales} đơn)`;
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error:', error);
            errorDiv.style.display = 'block';
            errorDiv.innerHTML = `
            <div class="alert alert-danger">
                <p>Không thể tải dữ liệu biểu đồ</p>
                <small>${error.message}</small>
            </div>
        `;
        });
});

const ctx4 = document.getElementById("Chart4").getContext("2d");
const chart4 = new Chart(ctx4, {
    type: "bar",
    data: {
        labels: JSON.parse(document.getElementById('orderChartLabels').textContent),
        datasets: [{
            label: "Đơn hoàn thành",
            backgroundColor: "#365CF5",
            borderColor: "transparent",
            borderRadius: 20,
            borderWidth: 5,
            barThickness: 20,
            maxBarThickness: 20,
            data: JSON.parse(document.getElementById('completedCountsData').textContent),
        },
        {
            label: "Đơn hủy",
            backgroundColor: "#d50100",
            borderColor: "transparent",
            borderRadius: 20,
            borderWidth: 5,
            barThickness: 20,
            maxBarThickness: 20,
            data: JSON.parse(document.getElementById('canceledCountsData').textContent),
        },
        ],
    },
    options: {
        plugins: {
            tooltip: {
                backgroundColor: "#F3F6F8",
                titleColor: "#8F92A1",
                titleFontSize: 12,
                bodyColor: "#171717",
                bodyFont: {
                    weight: "bold",
                    size: 16,
                },
                multiKeyBackground: "transparent",
                displayColors: true,
                padding: {
                    x: 30,
                    y: 10,
                },
                bodyAlign: "center",
                titleAlign: "center",
                enabled: true,
            },
            legend: {
                display: true,
            },
        },
        layout: {
            padding: {
                top: 0,
            },
        },
        responsive: true,
        // maintainAspectRatio: false,
        title: {
            display: false,
        },
        scales: {
            y: {
                grid: {
                    display: false,
                    drawTicks: false,
                    drawBorder: false,
                },
                ticks: {
                    padding: 35,
                    min: 0,
                },
            },
            x: {
                grid: {
                    display: false,
                    drawBorder: false,
                    color: "rgba(143, 146, 161, .1)",
                    zeroLineColor: "rgba(143, 146, 161, .1)",
                },
                ticks: {
                    padding: 20,
                },
            },
        },
    },
});