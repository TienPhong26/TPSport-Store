@if (isset($latestFeedbacks) && $latestFeedbacks->count())
    <div class="container mb-4 mt-6 feedback-section">
        <h2 class="text-center mb-4" style="font-weight:600; color:#1a237e;">
            Khách hàng nói gì về chúng tôi?
        </h2>

        <div class="feedback-row">
            @foreach ($latestFeedbacks as $feedback)
                <div class="feedback-col">
                    <div class="card h-100 shadow-sm w-100">
                        <div class="card-body">

                            {{-- Tên khách hàng + rating --}}
                            <div class="d-flex align-items-center mb-2">
                                <span class="fw-bold me-2">
                                    {{ $feedback->customer ?? 'Khách hàng' }}
                                </span>
                                <span>
                                    @for ($i = 1; $i <= 5; $i++)
                                        <i class="fas fa-star{{ $i <= ($feedback->rating ?? 0) ? ' text-warning' : ' text-secondary' }}"></i>
                                    @endfor
                                </span>
                            </div>

                            {{-- Đơn hàng --}}
                            @if(!empty($feedback->order_id))
                                <div class="mb-2" style="margin: 10px 0 20px 0">
                                    <small class="text-muted" style="color: black">
                                        Đơn hàng #{{ $feedback->order_id }}
                                    </small>
                                </div>
                            @endif

                            {{-- Nội dung feedback --}}
                            <div>
                                <p class="mb-0">"{{ $feedback->feedback }}"</p>
                            </div>

                            {{-- Nếu có câu trả lời (answer) thì hiển thị luôn --}}
                            @if(!empty($feedback->answer))
                                <div class="mt-2">
                                    <small class="text-success">
                                        <strong class="text-success">Phản hồi từ shop:</strong> {{ $feedback->answer }}
                                    </small>
                                </div>
                            @endif

                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endif
