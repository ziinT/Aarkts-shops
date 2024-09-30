import { HttpRequest } from '../utlis/http';
import { project, products, texts } from '../pop/pops'
import { JSON } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';


@Entry
@Component
struct Fenlei {
  @State message: string = '';
  @State FenleiZ: texts[] = []
  @State pages: number = 1

  feilieList() {
    this.FenleiZ = router.getParams() as texts[]

  }

  // feileiList(page: number = this.pages, per: number = 20, category: string = '') {
  //   return HttpRequest.get(`http://192.168.14.63:1337/api/v1/products?page=${page}&per=${per}&name=${encodeURI(category)}`)
  //     .then(r => {
  //       console.log(JSON.stringify(r))
  //       return r.result['data'] as texts[]
  //     });
  // }

  aboutToAppear(): void {
    this.feilieList()
  }

  build() {
    Column() {
      List() {
        ForEach(this.FenleiZ, (item: texts) => {
          ListItem() {
            Column() {
              Image(item.coverImage)
                .width('80%')
                .onClick(r => {
                  router.pushUrl({
                    url: 'pages/textList',
                    params: item
                  }, router.RouterMode.Standard)
                })
              Text(item.name)
                .letterSpacing(3)//间距
                .fontColor('#595959')
                .maxLines(1)
                .ellipsisMode(EllipsisMode.END)
                .textOverflow({
                  overflow: TextOverflow.Ellipsis
                })
                .copyOption(CopyOptions.InApp)
                .margin({
                  top: 10
                })
              Text('￥' + item.price.toString() + '元')
                .textAlign(TextAlign.Start)
                .width('100%')
                .fontColor('#ff6d6d')
                .fontStyle(FontStyle.Italic)
                .fontWeight(FontWeight.Bolder)
                .margin({
                  top: 20,
                  left: 36,
                  bottom: 10
                })
                .textAlign(TextAlign.Center)
                .width('100%')

            }
            .width('100%')
            .justifyContent(FlexAlign.Center)
          }
        }, (item: texts) => item.id + '')
      }
    }
  }
}