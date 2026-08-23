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

    if (text.isEmpty || loading) {
      return;
    }

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

    // اتصال واقعی Gemini را در مرحله بعد
    // از طریق روش امن اضافه می‌کنیم.

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    if (!mounted) return;

    setState(() {
      messages.add(
        const _Message(
          text:
              'پیامت دریافت شد! 🤖\nاتصال واقعی AI در مرحله بعد فعال می‌شود.',
          isUser: false,
        ),
      );

      loading = false;
    });
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
        title: const Text('AI Tutor 🤖'),
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? const Center(
                    child: Text(
                      'Ask me anything about English!',
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
                          padding: const EdgeInsets.all(14),
                          constraints:
                              const BoxConstraints(
                            maxWidth: 320,
                          ),
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
                          InputDecoration(
                        hintText:
                            'Ask about English...',
                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),
                      onSubmitted: (_) {
                        sendMessage();
                      },
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
                            color: Color(0xFF00E5FF),
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
