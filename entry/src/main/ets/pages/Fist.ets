import { Index } from './Index';

@Entry
@Component
struct Fist {
  @State message: string = 'Hello World';

  build() {
    Tabs() {
      TabContent() {
        Index()
      }
      .tabBar('首页')

      TabContent() {

      }
      .tabBar('登录')

      TabContent() {

      }
      .tabBar('注册')

      TabContent() {

      }
      .tabBar('购物车')

      TabContent() {

      }
      .tabBar('我的')
    }
    .barPosition(BarPosition.End)
    .scrollable(false)
  }
}