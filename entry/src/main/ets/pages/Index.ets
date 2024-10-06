import { Index } from '../view/Fist';
import { Login } from '../view/Login';
import { Newview } from '../view/Newview';

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
        Login()
      }
      .tabBar('登录')

      TabContent() {
        Newview()
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
