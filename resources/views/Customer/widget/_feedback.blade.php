@if (isset($latestFeedbacks) && $latestFeedbacks->count())
    <div class="container mb-4 feedback-section">
        <h2 class="text-center mb-4" style="font-weight:600; color:#1a237e;">Khách hàng nói gì về chúng tôi?
        </h2>
        <div class="feedback-row">
            @foreach ($latestFeedbacks as $feedback)
                <div class="feedback-col">
                    <div class="card h-100 shadow-sm w-100">
                        <div class="card-body">
                            <!-- Nội dung feedback như cũ -->
                            <div class="d-flex align-items-center mb-2">
                                <span class="fw-bold me-2">{{ $feedback->customer->customer_name ?? 'Khách hàng' }}
                                </span>
                                <span>
                                    @for ($i = 1; $i <= 5; $i++)
                                        <i
                                            class="fas fa-star{{ $i <= $feedback->rating ? ' text-warning' : ' text-secondary' }}"></i>
                                    @endfor
                                </span>
                            </div>
                            <div class="mb-2" style="margin: 10px 0 20px 0">
                                <small class="text-muted" style="color: black">
                                    Đơn hàng #{{ $feedback->order_id }}

                                </small>
                            </div>
                            <div>
                                <p class="mb-0">"{{ $feedback->comment }}"</p>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endif