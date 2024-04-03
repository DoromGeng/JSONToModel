
export default class LBGJSONToModel {
  /*开始解析*/
  protected jsonToModelWillParse(json: Record<string, Object>): void {
  }
  /*属性key和自定义model映射关系
  eg:
  class WBYPListResult extends LBGBaseLogModel {
    getListInfo: WBYPGetListInfo
    protected jsonToModelGetModelInstanceInParseCustomObject(): Record<string, Object> {
      return {
        'getListInfo': new WBYPGetListInfo()
      }
    }
  }*/
  protected jsonToModelGetModelInstanceInParseCustomObject(): Record<string, Object> {
    return {}
  }

  /*解析数组时,根据数据返回解析不同的model
  eg:
  class WBYPGetListInfo {
  infolist?: Array<WBYPListItem>
  override jsonToModelGetModelInstanceInParseArray(json: Record<string, Object>): object | undefined {
    if(json['itemtype'] === 'g_store') {
      return new WBYPListItem()
    } else {
      return undefined
    }
  }*/
  protected jsonToModelGetModelInstanceInParseArray(json: Record<string, Object>): object|undefined {
    return undefined
  }
  /*解析完成*/
  protected jsonToModelParseFinish(): void {
  }

  jsonTOModel(json: object) {
    if (json === undefined) {
      return
    }
    /*获取自定义对象映射关系*/
    let map: Record<string, Object> = this.jsonToModelGetModelInstanceInParseCustomObject()
    this.jsonToModelWillParse(json as Record<string, Object>)
    let temp: object = this as object
    /*遍历json所有的key值*/
    let keys: Array<string> = Object.keys(json)
    for (let i = 0; i < keys.length; i++) {
      let propertyKey: string = keys[i]
      let value: object = json[propertyKey]
      /*判断value值是否是数组*/
      if (value instanceof Array) {
        let valueArray = value as Array<Object>
        let propertyValues: Array<Object> = new Array()
        for (let i = 0; i < valueArray.length; i++) {
          let item = valueArray[i]
          let instance = this.jsonToModelGetModelInstanceInParseArray(item as Record<string, Object>) as LBGJSONToModel
          if (instance) {
            instance.jsonTOModel(item)
            instance.jsonToModelParseFinish()
            propertyValues.push(instance)
          } else {
            propertyValues.push(item)
          }
        }
        temp[propertyKey] = propertyValues
      } else {
        let instance = map[propertyKey] as LBGJSONToModel
        if (instance) {
          instance.jsonTOModel(value)
          instance.jsonToModelParseFinish()
          temp[propertyKey] = instance
        } else {
          temp[propertyKey] = value
        }
      }
    }
    this.jsonToModelParseFinish()
  }
}