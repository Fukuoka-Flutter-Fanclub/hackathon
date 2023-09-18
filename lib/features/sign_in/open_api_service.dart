import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final openApiServiceProvider = Provider((ref) => OpenApiService(ref: ref));

class OpenApiService {
  const OpenApiService({required this.ref});

  final Ref ref;

  Future<String> sendMessage(String message, String id) async {
    final newUserMessage = OpenAIChatCompletionChoiceMessageModel(
      content: message,
      role: OpenAIChatMessageRole.user,
    );

    final messages = <OpenAIChatCompletionChoiceMessageModel>[];
    messages.add(newUserMessage);

    final chatCompletion = await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo',
      messages: messages,
    );

    final ans = chatCompletion.choices.first.message;
    final content = ans.content;

    return content;
  }
}
