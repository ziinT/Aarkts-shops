import { http } from '@kit.NetworkKit'

export  class HttpRequest{
  static get (url:string){
    return http.createHttp().request(url,{
      // method:http.RequestMethod.GET,
      expectDataType:http.HttpDataType.OBJECT
    })
  }
  static post(url:string,data:object){

  }
}