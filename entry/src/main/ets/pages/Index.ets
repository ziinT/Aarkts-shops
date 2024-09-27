import { HttpRequest } from '../utlis/http';
import { lunbosRoot, lunbos, fenleis, project, products, texts } from '../pop/pops'
import { promptAction, router, TextModifier } from '@kit.ArkUI';

@Styles
function Iamges() {
  .width('100%')
  .height(220)
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State lubboRoot: lunbosRoot | undefined = undefined
  @State lunboList: lunbos[] = [] //轮播数据
  @State fenleiList: fenleis[] = [] //分类数据
  @State proRoot: products | undefined = undefined
  @State textList: texts[] = [] //商品数据
  @State homes: string = "http://192.168.14.63:1337"
  @State Lists: number[] = [1, 2, 3, 4, 5]
  @State pages: number = 1

  Imagesc() {
    HttpRequest.get('http://192.168.14.63:1337/api/v1/banners')
      .then(r => {
        // console.log(JSON.stringify(r))
        this.lubboRoot = r.result as lunbosRoot
        this.lunboList = this.lubboRoot.data
        // console.log(JSON.stringify(this.lubboRoot.data))
        // console.log(JSON.stringify(this.lunboList))
        // console.log(this.lubboRoot.data[1].coverImage)
      })
  }

  FenLeis() {
    HttpRequest.get('http://192.168.14.63:1337/api/v1/product_categories')
      .then(r => {
        // console.log(JSON.stringify(r))
        this.fenleiList = r.result['data']
      })
  }

  productsList(page: number = this.pages, per: number = 20) {
    return HttpRequest.get(`http://192.168.14.63:1337/api/v1/products?page=${page}&per=${per}`)
      .then(r => {
        return r.result['data'] as texts[]
      });
  }

  aboutToAppear() {
    this.Imagesc()
    this.FenLeis()
    this.productsList().then(r => {
      this.textList.push(...r)
      this.pages++
      // r.forEach(item=>{
      //   this.textList.push({
      //     item.
      //   })
      // })
    })
  }

  build() {
    Column() {

      Scroll() {
        Column() {
          Search({
            placeholder: '搜索商品',
          })// .searchButton('SEARCH')
            .cancelButton({
              style: CancelButtonStyle.CONSTANT,
              icon: {
                src: $r('app.media.maike1')
              }
            })
          Swiper() {
            ForEach(this.lunboList, (item: lunbos) => {
              Image(this.homes + item.coverImage)
                .Iamges()
            }, (item: lunbos) => item.id + '')
          }
          .loop(true)
          .autoPlay(true)
          .interval(1000)
          .displayArrow(true, false)

          Grid() {
            ForEach(this.fenleiList, (item: fenleis) => {
              GridItem() {
                Column() {
                  Text(item.name)
                    .margin({
                      top: 10
                    })
                  Image(item.coverImage)
                }
              }
            }, (item: fenleis) => item.id)

          }
          .height(120)
          .width('90%')
          .columnsTemplate('1fr 1fr 1fr  1fr')

          // .backgroundColor(Color.Red)

          List() {
            ForEach(this.textList, (item: project) => {
              ListItem() {
                Column() {
                  Image(item.coverImage)
                    .onClick(() => {
                      router.pushUrl({
                        url: 'pages/textList',
                        params: item
                      }, router.RouterMode.Standard)
                    })
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
                }

                .width('100%')
              }
            }, (item: project) => item.id + '')
          }
          //下拉刷新
          .onReachEnd(() => {
            if (this.textList.length > 0) {
              this.productsList(this.pages)
                .then(r => {
                  if (r.length == 0) {
                    promptAction.showToast({
                      message: '到底了'
                    })
                  }
                  this.textList.push(...r)
                  this.pages++
                })

            }
          })
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
          .height('100%')
          .lanes(2)
          .edgeEffect(EdgeEffect.Fade) //边缘效果
          .scrollBar(BarState.Off)
        }
        .width('100%')
        .padding(10)
      }
      .height('100%')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      .backgroundColor(Color.White)
    }.height('100%')

  }
}