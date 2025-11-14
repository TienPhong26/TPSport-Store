@extends('management.layouts.admin_layout')

@section('title', 'Chat với Gemini')

@push('styles')
<link rel="stylesheet" href="{{ asset('css/crud.css') }}">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
    .chat-container {
        max-width: 800px;
        margin: 30px auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 20px;
    }

    .messages {
        height: 450px;
        overflow-y: auto;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 15px;
        background-color: #f9f9f9;
    }

    .message {
        margin-bottom: 15px;
        padding: 10px 15px;
        border-radius: 15px;
        max-width: 70%;
        word-wrap: break-word;
    }

    .user-message {
        background-color: #007bff;
        color: white;
        margin-left: auto;
        text-align: right;
    }

    .bot-message {
        background-color: #e9ecef;
        color: #333;
        margin-right: auto;
        text-align: left;
    }

    .input-area {
        display: flex;
        margin-top: 15px;
        gap: 10px;
    }

    .input-area textarea {
        flex-grow: 1;
        border-radius: 10px;
        padding: 10px;
        resize: none;
    }

    .input-area button {
        border-radius: 10px;
    }
</style>
@endpush

@section('content')
<div class="container-fluid">
    <div class="chat-container">
        <h3 class="text-center">💬 Chat với Gemini</h3>

        <div class="messages" id="chat-box">
            {{-- Tin nhắn sẽ được thêm vào đây --}}
        </div>

        <div class="input-area">
            <textarea id="keychat" name="keychat" rows="2" placeholder="Nhập tin nhắn của bạn..."></textarea>
            <button id="send-btn" class="btn btn-primary">Gửi</button>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
    $('#send-btn').click(function(e) {
        e.preventDefault();

        let message = $('#keychat').val().trim();
        if (!message) return;

        // Thêm tin nhắn người dùng vào khung chat
        $('#chat-box').append(`
            <div class="message user-message">${message}</div>
        `);
        $('#keychat').val('');
        $('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);

        // Hiển thị "đang trả lời..."
        let loading = $('<div class="message bot-message" id="loading">Đang trả lời...</div>');
        $('#chat-box').append(loading);
        $('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);

        // Gửi request AJAX
        $.ajax({
            url: "{{ route('chat.submit') }}",
            type: "POST",
            data: {
                _token: "{{ csrf_token() }}",
                keychat: message
            },
            success: function(res) {
                $('#loading').remove();
                let reply = res.answer ?? 'Không có phản hồi';
                $('#chat-box').append(`
                    <div class="message bot-message">${reply}</div>
                `);
                $('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);
            },
            error: function() {
                $('#loading').remove();
                $('#chat-box').append(`
                    <div class="message bot-message text-danger">Lỗi: không gửi được tin nhắn.</div>
                `);
            }
        });
    });

    // Cho phép nhấn Enter để gửi
    $('#keychat').keypress(function(e) {
        if (e.which === 13 && !e.shiftKey) {
            $('#send-btn').click();
            return false;
        }
    });
});
</script>
@endpush
