import { getSwiftUIGlassMaterial, getSwiftUIPalette, SWIFT_UI_RADIUS_CONTROL, swiftUIColorWithOpacity, SwiftUIComponentConfig, SwiftUITone } from 'theme'

@Component
export struct SwiftUIIconBadge {
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
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

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedColor(): ResourceColor {
    return this.config.color === undefined ? this.color : this.config.color
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedTextFontSize(): number {
    return this.config.textFontSize === undefined ? this.textFontSize : this.config.textFontSize
  }

  private resolvedTintColor(): ResourceColor {
    if (this.config.tintColor) {
      return this.config.tintColor
    }
    return this.tintColor === '#00000000' ? getSwiftUIGlassMaterial(this.resolvedTone()).tint : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    if (this.config.borderColor) {
      return this.config.borderColor
    }
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.resolvedColor(), 0.30) : this.customBorderColor
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Row()
        .width('100%')
        .height('100%')
        .backgroundColor(this.resolvedFillColor())
        .linearGradient({
          direction: GradientDirection.RightBottom,
          colors: [
            [this.resolvedFillColor(), 0.0],
            [swiftUIColorWithOpacity(this.resolvedColor(), 0.18), 0.66],
            [this.resolvedTintColor(), 1.0]
          ]
        })
        .backgroundBlurStyle(BlurStyle.Thin)
        .borderRadius(this.resolvedCornerRadius())

      Text(this.icon)
        .fontSize(this.resolvedTextFontSize())
        .fontWeight(FontWeight.Bold)
        .fontColor(this.resolvedColor())
        .textAlign(TextAlign.Center)
    }
    .width(this.resolvedWidth())
    .height(this.resolvedHeight())
    .borderRadius(this.resolvedCornerRadius())
    .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
    .shadow({ radius: 8, color: swiftUIColorWithOpacity(this.resolvedColor(), 0.10), offsetX: 0, offsetY: 3 })
  }
}
