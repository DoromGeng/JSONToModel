
import { LBGItem } from './LBGResult'

@Component
struct WBYPListItemCell {
  index?: number
  @ObjectLink item: LBGItem
  build() {
    Column({space: 5}) {
      Text(this.item.title)
        .fontSize(30)
        .fontColor(Color.Black)

      Text('点击更改标题')
        .fontSize(30)
        .fontColor(Color.Black)
        .backgroundColor(Color.Yellow)
        .onClick(() => {
          this.item.title = '更改标题'
        })
    }
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.Red)
    .width('100%')
    .borderRadius(8)
  }
}

export default WBYPListItemCell