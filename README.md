# icon-badge

`icon-badge` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 毛玻璃图标徽标组件，适合列表图标、状态标识、功能入口和指标前缀。默认使用半透明纯色玻璃底、细边框和柔和阴影，可自定义颜色、宽高、圆角、边框和文字大小。

## 实际运行效果

下面展示图标徽标在默认尺寸和自定义尺寸下的玻璃状态：

![icon badge preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/icon-badge@main/docs/icon-badge-preview.gif)

## 安装

```bash
ohpm install icon-badge
```

本地源码依赖：

```json5
{
  "dependencies": {
    "icon-badge": "file:../icon-badge",
    "theme": "file:../theme"
  }
}
```

## 正常使用样式

```ts
import { SwiftUIIconBadge } from 'icon-badge'
import { SwiftUITone } from 'theme'

@Component
struct RecordsBadge {
  build() {
    SwiftUIIconBadge({
      icon: 'R',
      color: '#141414',
      tone: SwiftUITone.GlassBlack
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIIconBadge({
  icon: '64',
  color: '#141414',
  componentWidth: 48,
  componentHeight: 48,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1,
  cornerRadius: 8,
  textFontSize: 13
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from theme

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth(92%)
  .withHeight(auto)
  .withRadius(8)
  .withFillColor(#E6111111)
  .withTintColor(#22FFFFFF)
  .withBorder(#33FFFFFF, 1)
  .withShadow(#33000000, 16)
  .withPadding(12)

SwiftUIIconBadge({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `icon` | `ResourceStr` | `''` | 徽标文字或图标字符 |
| `color` | `ResourceColor` | 黑色主色 | 图标和强调色 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `32` | 徽标宽度 |
| `componentHeight` | `Length` | `32` | 徽标高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1` | 边框宽度 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `textFontSize` | `number` | `16` | 图标文字字号 |
