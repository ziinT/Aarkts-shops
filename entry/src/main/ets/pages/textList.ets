import { router } from '@kit.ArkUI';
import { HPRichText } from '@ohasasugar/hp-richtext';
import type { RichTextOption } from '@ohasasugar/hp-richtext';
import { project, texts } from '../pop/pops'
import { HttpRequest } from '../utlis/http';


@Entry
@Component
struct textList {
  // @State tid: texts | undefined = undefined
  @State params: project = router.getParams() as project
  @State tid: number = this.params.id
  @State FeilsList: texts | undefined = undefined
  @State richTextOption: RichTextOption = {
    content: ''
  }

  Feils(id: number) {
    HttpRequest.get(`http://192.168.14.63:1337/api/v1/products/${id}`).then((r) => {
      console.log(JSON.stringify(r))
      this.FeilsList = r.result['data']
      this.richTextOption = {
        content: this.FeilsList?.content as string
      }
    })
  }

  aboutToAppear() {
    this.Feils(this.tid)
  }

  build() {
    Column() {
      // Button('返回')
      //   .onClick(() => {
      //     router.back();
      //   })
      // Text(this.FeilsList?.content)

      HPRichText({
        richTextOption: $richTextOption,
        needScroll: true,
        onLinkPress: (e) => {
          return e;
        }
      })
    }
    .width('100%')
  }
}