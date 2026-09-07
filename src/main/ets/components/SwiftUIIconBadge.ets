import { getSwiftUIGlassMaterial, getSwiftUIPalette, SWIFT_UI_RADIUS_CONTROL, swiftUIColorWithOpacity, SwiftUITone } from 'theme'

@Component
export struct SwiftUIIconBadge {
  @Prop icon: ResourceStr = ''
  @Prop color: ResourceColor = getSwiftUIPalette().primary
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = 32
  @Prop componentHeight: Length = 32
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop textFontSize: number = 16

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.tone).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.color, 0.30) : this.customBorderColor
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Row()
        .width('100%')
        .height('100%')
        .backgroundColor(this.fillColor)
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [
            [this.fillColor, 0.0],
            [swiftUIColorWithOpacity(this.color, 0.18), 0.66],
            [this.resolvedTintColor(), 1.0]
          ]
        })
        .backgroundBlurStyle(BlurStyle.Thin)
        .borderRadius(this.cornerRadius)

      Text(this.icon)
        .fontSize(this.textFontSize)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.color)
        .textAlign(TextAlign.Center)
    }
    .width(this.componentWidth)
    .height(this.componentHeight)
    .borderRadius(this.cornerRadius)
    .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
    .shadow({ radius: 8, color: swiftUIColorWithOpacity(this.color, 0.10), offsetX: 0, offsetY: 3 })
  }
}
