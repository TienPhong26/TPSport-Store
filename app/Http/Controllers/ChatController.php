<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ChatController
{
    //
    public function index(Request $request)
    {
        return view('management.phongpt.index');
    }

    public function submit(Request $request)
    {
        $apiKey = env('GEMINI_API_KEY');

        $response = Http::withOptions(['verify' => false])
            ->post("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={$apiKey}", [
                'contents' => [
                    [
                        'parts' => [
                            ['text' => $request->input('keychat')]
                        ]
                    ]
                ]
            ]);
        $data = $response->json();

        $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? 'Không có phản hồi';

        return response()->json([
            'answer' => $text,
        ]);

    }
}
