import { LBGItem, LBGResult } from './LBGResult';
import WBYPListItemCell from './WBYPListItemCell';

@Entry
@Component
struct Index {
  @State result: LBGResult = new LBGResult()

  aboutToAppear(): void {
    let json = '{"list":[{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"},{"title":"标题标题标题标题标题标题标题标题标题标题","itemType":"g_store"}]}'
    this.result.jsonTOModel(JSON.parse(json))
  }
  build() {
    List({space:10}) {
      ForEach(this.result.list, (item: LBGItem, index: number) => {
        WBYPListItemCell({item, index})
      })
    }
  }
}
