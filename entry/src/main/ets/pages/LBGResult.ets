import LBGJSONToModel from './LBGJSONToModel'

@Observed
export class LBGItem extends LBGJSONToModel {
  title?: string
  itemtype?: string
}

@Observed
export class LBGResult extends LBGJSONToModel {
  list?:Array<LBGItem>
  other?: LBGItem

  protected jsonToModelGetModelInstanceInParseCustomObject(): Record<string, Object> {
	return {
	  'other': new LBGItem()
	}
  }

  protected jsonToModelGetModelInstanceInParseArray(json: Record<string, Object>): object | undefined {
	if (json['itemType'] === 'g_store') {
	  return new LBGItem()
	}
	return undefined
  }

  protected jsonToModelWillParse(json: Record<string, Object>): void {
	console.info('开始解析')
  }
  protected jsonToModelParseFinish(): void {
	console.info('解析完成')
  }
}