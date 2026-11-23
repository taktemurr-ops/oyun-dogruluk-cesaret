import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dogruluk_cesaret/oyun_dogruluk_cesaret.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dogrulukGorevConfig.title.length, 33);
    expect(dogrulukGorevConfig.tagline.length, 33);
    for (final s in dogrulukGorevConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dogrulukGorevConfig.gameId, dogrulukGorevId);
    expect(dogrulukGorevRules.gameId, dogrulukGorevId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dogrulukGorevRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dogrulukGorevId, optionalMechanics: dogrulukGorevRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dogrulukGorevRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
