
import 'package:flutter/material.dart';


class AiTutorPage extends StatefulWidget {
  const AiTutorPage({super.key});

  @override
  State<AiTutorPage> createState() => _AiTutorPageState();
}

class _AiTutorPageState extends State<AiTutorPage> {
  final TextEditingController controller =
      TextEditingController();

  final List<_Message> messages = [];

  bool loading = false;

  Future<void> sendMessage() async {
    final text = controller.text.trim();

    if (text.isEmpty || loading) return;

    setState(() {
      messages.add(
        _Message(
          text: text,
          isUser: true,
        ),
      );

      controller.clear();
      loading = true;
    });

    try {
      // API connection will be added safely
      // in the next step.
      
      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      setState(() {
        messages.add(
          const _Message(
            text:
                'AI Tutor آماده است. در مرحله بعد اتصال Gemini را اضافه می‌کنیم.',
            isUser: false,
          ),
        );
      });
    } catch (e) {
      setState(() {
        messages.add(
          _Message(
            text: 'خطا: $e',
            isUser: false,
          ),
        );
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tutor'),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(
                    child: Text(
                      'Ask me anything about English 🤖',
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return Align(
                        alignment: message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          padding:
                              const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: message.isUser
                                ? const Color(0xFF0066FF)
                                : const Color(0xFF10182E),
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: Text(
                            message.text,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration:
                          const InputDecoration(
                        hintText:
                            'Ask something...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) =>
                          sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed:
                        loading ? null : sendMessage,
                    icon: loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(
                            Icons.send_rounded,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isUser;

  const _Message({
    required this.text,
    required this.isUser,
  });
}
