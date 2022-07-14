import 'package:chatapp/res/res_exports.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  final bool isWriting;
  final VoidCallback sendTextMessage;
  const ChatInputField({
    Key? key,
    required this.isWriting,
    required this.sendTextMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.defaultPadding,
        vertical: Constants.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.defaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: Constants.defaultPadding / 4),
                    const Expanded(
                      child: TextField(
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Type message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: Constants.defaultPadding / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: Constants.defaultPadding),
            isWriting
                ? InkWell(
                    onTap: sendTextMessage,
                    child: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  )
                : InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.mic,
                      color: AppColors.primaryColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
