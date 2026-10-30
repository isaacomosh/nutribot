import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import 'package:nutribot/chat_bubble.dart';
import 'package:nutribot/providers/chat_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty || context.read<ChatProvider>().isLoading) return;

    _messageController.clear();
    context.read<ChatProvider>().sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final chat = context.watch<ChatProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.menu),
                      const SizedBox(width: 10),
                      const Icon(Iconsax.setting_2),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Nutribot',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: chat.messages.isEmpty
                  ? Center(
                      child: Text(
                        'Ask a nutrition question',
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      itemCount: chat.messages.length + (chat.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (chat.isLoading && index == 0) {
                          return const ChatBubble(text: 'Thinking...');
                        }
                        final messageIndex =
                            chat.messages.length - 1 -
                            (index - (chat.isLoading ? 1 : 0));
                        final message = chat.messages[messageIndex];
                        return ChatBubble(
                          text: message.text,
                          isUser: message.isUser,
                        );
                      },
                    ),
            ),
            if (chat.errorMessage != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  chat.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                      decoration: InputDecoration(
                        hintText: 'Ask about food or nutrition',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: chat.isLoading ? null : _sendMessage,
                    tooltip: 'Send message',
                    icon: const Icon(Iconsax.send_1),
                  ),
                ],
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
