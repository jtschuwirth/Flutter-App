import 'package:app/src/data/models/prompt.model.dart';

abstract class WnrsEvent {
  const WnrsEvent();
}

class WnrsNewPrompt extends WnrsEvent {
  final Prompt prompt;

  const WnrsNewPrompt(this.prompt);
}

class WnrsNewLvl extends WnrsEvent {
  final int lvl;

  const WnrsNewLvl(this.lvl);
}
