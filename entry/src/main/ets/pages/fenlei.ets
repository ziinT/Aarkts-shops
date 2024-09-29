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
            }
            .width('100%')
          }
        }, (item: texts) => item.id + '')
      }
    }
  }
}