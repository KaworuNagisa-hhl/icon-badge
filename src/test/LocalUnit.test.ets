import { describe, it, expect } from '@ohos/hypium'
import { getSwiftUIGlassMaterial, swiftUIColorWithOpacity } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIIconBadge', () => {
    it('uses_tinted_glass_badge_contract', 0, () => {
      expect(getSwiftUIGlassMaterial().fillStrong.toString()).assertContain('#')
      expect(swiftUIColorWithOpacity('#0B7063', 0.18)).assertEqual('#2E0B7063')
    })
  })
}
