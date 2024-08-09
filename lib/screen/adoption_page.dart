import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdoptionPage extends StatefulWidget {
  @override
  _AdoptionPageState createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  List<AdoptionPostData> posts = [
    // Sample data
    AdoptionPostData(
      petName: 'Paaru',
      petImageURL: 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAL8AzAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAEBQIDBgcBAAj/xAA+EAACAQMDAgUDAAgDBgcAAAABAgMABBEFEiExQQYTIlFxMmGBFCNCUpGhscFi0eEkM3KC8PEHFRZDRJKy/8QAGgEAAwEBAQEAAAAAAAAAAAAAAQIDBAAFBv/EACMRAAICAgICAwEBAQAAAAAAAAABAhEDIQQxEkETMlEiYRT/2gAMAwEAAhEDEQA/AMp5WTV0UNExR5olY8VNyKqBQsXFWJHzV4jq5I6VsdIrSLirViomGEuQqjJJrQad4fLASXXC9cUvZSEW9IQ21nLMwEQJpxDoZVd0zBR3ApjeX0GnxFLZQCO/esvf65NKxAY9O9NSNuPiOXY6e206D6nyar/S9Oj4EYPzWRlvJGJLNzQzXJ7nNE1rhwXo2/8A5lpx4Ma1FrvTD1jA+4rCtcD3warNy2fqojPiY/w3RXTJvpbBqqTTFZf9mkDVjI7tlb6qZWmsPEwG7ihRGfDg1oZS28kZ2sCD96q2kHmmVpq0N0Ns4Vh0561dNp8cql7Zg3+Gg0YcnGlAVx1eBxUGjMbYYEEe9eF+KSiNpE+lRaobuakORXUC7KzVMvSimXihpl4ooWQE9DuOKIYVWV4qiIsAlHqqAFFSrQ5GDTiDaNcCpjrVW+rI/Uc1E0hEYoy0tZLmRUiTc2aptLeSeRUiGWY4rd6TpaafAHkGHrkrY8I+Tor03S4bKMSTDc/t7VDUb7CnBwB0FW392ADisrq15lCtPVHqcfAkLNWvWmlKhuM0onl2ZGc1bNJsy1Jp5ssTQbPSikkWyT81Q09DSTYoWSelElkSDWuKh+kUuaaomfFMjNLkIaieprcYpN+kVNZzniikD50x9BeFGGDitBpWstGwBORmsRFMc80fbzkEEUaD5Ka2dPSSDUIwH4bHBoC6tZIM5TK9jWb03UnhfPatdp+oxXMQSXnPalaMmbipq0LdtegYppc6eQymH1A/s/eqLrT5oELuuPtSnnSi49gVVyjivd1QkPFckLegOXrVDdDV0p5qhqdEmylxVJXmr2FV0wgWq5NHWdq08qpHyzHAFUWkTTSBFXcT2roGgaUunW/nTrmZh0pErNUIub0X6PpkOnQbpFzKep9q91G+VQ25gAOOarvNRKNgrgAZZj0FZHWNSVw/6wcnO73pukergwJbG83n3at5CM6+6jI/NJtU0rUIPVPbS7f3tppt4J1ELDdSLuLcJT9ri8JL/pDjPapykoglyJ451FaOP6lIRuBzx70mklrsOrWNnqUe3ULRJD2kjwrj+HWsfqfgltrTaZKLmMcmPH6wD47/AIoqmV/7VLT0YORy3QZqryZWPpXitQmkAHBGCDzRUWmRJ9QyapSA15dmRj06eU9MUdB4bnl5yR8VsLW0j3BY48t9hWj03QL65B2WxA92FdonJY4fY57b+DXk5eRhTKDwFG3Jkf8ABro8Hha/4BeNQO+avXQbqPPrRiPYV1iLNg/Tn8XgKD9qSTP/ABUbF4EtV4Mkn/2rVTWmoQ5KQb8e1CefdgFjbSen7V1lozg9poVJ4Jtk+iZwfuaOsPCM6uDHPiMH1Fug+a0Gl6XeXIWSdTDEBksw7VbqF4hAtrYEQKe3VvmknKkRyZ2/5i7IxNFYR+VYoHf9qeQcn4HaluozyyApcOZEIxz+yauknVBjv3pTqdwGiK569qh5uyHhf+iOUFWKt1FDuaZySW92zRxtslUkGls8bRsVYc/1q/Zjy45Y2Dyc0Oavaqmooiysjiq261NjUDTCm68JaP8A/MnGFHIpvq2pLF5kjvsjUbQR1zVt/MljaC2ibDBdqj71gta1AyfUfTGSD/jNdR7vF46irPNX1QSSOI3fy8evPc1nJrgyuSzlkHvVFxdAkgDAoF5e1cbLo3ngTUQZZ7UjA+tfx1/lW6kYhcmuS+E7r9G1WFsZ3NtPweDXR5ZXRDFJyy8VDKjFlhc7JXM3Wlsly8TeYjbSvQ1Vd3eFP2pO99ucjdj7VOEvRKWLVmqtJ9P1XCalbgSHhZ4/Sx+femsXgzSpsNHJIVHPB/rSnw3a+dg+/v0ra2UPlIRWpdGGWWUHSYNpfh+w09t8Me5yc5bnHxTiIDkDGBUIerD2b/WvYO/zmiQlOUuyS/Wy/bNQkG4v8gf3rxzsedz7YFRun8qGT3PH5OAK4B4vqVCemP7VKJI9m7A2g8k1QW2R+nrjFD3FwYogoGdvYdSa4KBPEmtJErWkbAN0YD+lZNtQPc/6Vb4jg8uGScuN+c9OTXPLzVblJCQkiKR9TDk1HItm/j7jo20+oKFJJwaXPcec3XOTispb3ktzIAST8mntmp+qToo4+an47NaqIkk1Fo9RndDg+a39a0Npex3kQWU5NYWSTF1ID++f60xsLoxMD2zWpIp4qcaZo7iDy246dqGNHwSpcwgd6Fmj2MRQPI5GB43a6BiKhirSKjiiZjda8HkllkkcbQCQT27VzvWSVk2KcgcZHeuh3ts13I7F9gXPOetIbnRZ7x3SxtmdNud78A/FN6PqbSgc9kDbj1/NfRwySsABmui2nghCQ1+5AZOFXsaMj8O6daImI9zIOW/epSCtmR0fT3jlSRvTgjmui3URms47mIMW2jgd6T+VDGFVVyOlajRlju9OMS8FO47Uk1aJZ/4SkYjUUlkJaJDu7pj+lA2+jX2oONlswweSxAI/FbK70GO6uGK7omVshlOBn3pvaW626L6f1gGC4GN3zUo40ZsnKpUj7w/YSWVsiTS+bx9W3B+DT+Jg20joaVJL6qMt5OQa0Lo86Tt2xhA+Z3X93B/j/wBq8gP6qX7E/wDX8qqJ8i5SQ9HQr+a8lfy45fkt/wBfzoAPI3M0wx9IJLfg8f0oe/m3XcUCfvbj8D/WpK628SRt9bAFqAsnaUz3JXLMxCn7DiiAJu7nysoPilEt4wc7OSBj4+9V3lw0kzgdSeT7UC7bvSik+/zXBRcVFwx3KJT1LHoKTat4Xsb4+bHGZbjGFLykRr+f8qYbjH3DH27D8d6qmvpo8bS38MYoMrFtdMz3/pyHQ0M008cgzwVQoCfYZJJqNtMs8w2rwOcdvk1ZqyzXxJdyWzjk9q+sLUWsDsxJIUngYpTTjbfZz2+OLuXkH1dulW2z4xVOoEG6kIzyxPNeQNyKoehF7NNpdz5bge9PXAlTJ71krR8HNaeyk82ACuGyQU1TBpogjcUOTRVy219p6UI/WuPE5GJ4paOsw2OW824JJ/d7CvZriOJSEAAHtSm81vdnawA+1J59TZs+qhZ7kcMpbkOrq/BzilFzd7snOKWy3jHI3UK85PBOa6jTGAY1xk9c1qvBL+ZcSJ1yvSsOGHc4rW+BZEXUgGfAx1LcUKM3MVYmbOa38vc/uaXyoc8U5kPmdOlUG0DNk1x4ApjjJb70dFG4BLd6MS1CDPahNT1aw0uHfeTxQof2pHCj+dEXsNYpNZkN9OMH7Uqa6JjZZPrUFCarttVguIy1tOrxvyCrbgTQjs0kjMO+c0GFRLLm5bzHb2XIqdjcpbadGndV9Xz3pZeMVU5pbJdMI2UHAPv0oWVWOw6yQ3lzO2f1e8gj3NMBYx7fr/JNc2v/ABobGCR9Os5rm2hk8uW5ztiVz0Xdg5NS0z/xDZyGurSRUdgN8UiuOeOeBTIVw3o6BLZKPpKEfZqCntPj8GmGk3H6ZGH/AEaQ++4DP9a8upgWZSCMcYIoWBRdiNrTGTQGprss5hu2+g805ncAHFZzxDMFs3Jbbx1PSh7NONNM5vd/79qjCfVUZ2DSsR71KHrTG6HY1tW5FaPSD6XrOWMZdsdq0Vo4jjCCiaLIaxJ5QEh6A1XC6zoJF6GqdcYNaMO+aVQsxTkdKJny41PTNTqEV3byNGWG9eozSWXUHRtsmVYe4rqMtpCRICpRPqcquWZjx1PxWa8R+GLW5iPlKsbhfQOThvY11Ho/LrRjzf7hkSYNVtfzL0bNKL6zubGYpMrIR0PuPtXkF0z8NnP3rjO+RupDNtWk6McGtL4JvXk1aI7uARWSsNOm1C5EUSEg9SK6R4P8MixKyvncD3oNmTkcjVHUrflRznFFZVRufgDuelLYZhGuTzt6D3qcG+4l8yYkgfSh6CkPJaDGzKuVGAT1PeuAeL7z9IGrTXtiL3VWuJLeGWVm8uzRGKkIn7xxXeLu6KR4wMkdu9c98ReHYNTupLqFxBLIczZTfHIfcjI56d+wplQ+P8OSeErjU9Ine6tnkVEbLwk4WRccjHv2B7Gv0HpyR3dpDcQ4eOZA6kexGRWL0/wJHMwFzdG4UHPlQx+Un/MckkfFdF0DTRpdnFZs4fy84wu0AEkgAewzgfFEE0khJq9qY0yBisN4wlls9IkERxJMCikcdv8Ar+NdO13y0GT7Vkbqwi1eQZGRE3fp7/2rjoSdbOKLpslxZx2rtJDJF6mglyvJx6tvbOOvetF4b8PyahLFY2iNJGrDzpsZEa5yefc9APvnpmuy2Og2L26JeQQyIOiyoGA+M0wc2VjFtgjUY6Kq4Ao2jlJegaMjT7AKq4Zu9IrqUuxJOTRt5etKST0xSqaReam3ZbFD2Dzv6cVh/F93uXy8N8jgVptWukihJDAMBnk4rmWrTtPcu7OG56hgf6VyRpQLnJ65oq3QuwHahYlLkDtTCLC4Api0EMbchAAKZW5yKUwHmmlqaJqj0Q1ggWh9896FtGlhi2KI5AD9VE6pzEFMmwMcE47UDEyRxqFcAexFciUuztLRvNuAkcRJ0Gec/NeyQK6Kh3su3qHzk+9Xgq6KOOParl2kD7V1gcmjMalo0N5biC6QN3Zn6L/w1i9P8CyTX7hXyisR8rXW5Iww6ZFSsLZIpdoQdc5NdJsz8rI2rE2ieGILJE2x9K0sNkIxwmKYRooHb8VeFHakPNc77Fcq7F6YqP6SEHNNnRSMtz9qAu9LhuFGzMbe4P8AauoFgE98rDFANOpYAIWJPQVRrVjd6ehmK+bCvUoOR8jtS2xv4HmVpFBB6BiTn4Aoh9G40y3EaCRsKx6KO1LPGWp3umWy3NnaSSooJlKkDao/vRK3qCBTEYVyMAbCcH4oHVdVUWzRMNxK4PGOfiuOxNKVvZh/E3iO88jdulmdsfq0AU4OMD55ozwdcXyWwFyj5LMRuYHAJ4BJ64FJZJoBrMgkGUUBlz0VvbP8P40+trshAobC/ZsGh0bs7TioxVGpaYyR+mJwcdcjFJ7pplcgsAPvVUVwgOcgn+dfSXW4E7mH2JoN2Z4Y6YO7tg8g/FAXtx5aeo470Rczrg525+BWV8R3rxQenOG49MgT/wDYKn4pUi90jOeJta8yUwxHNZtX3sSeuaLugjzDzI03tnCyoLeQ/dWHoPyaCkUQztHiSNl6pIuCv+fzxVSUctyoMjOBRER5oONiepzRMPWuN8GM7btTW2pXajOKbW4wc1xoBdXYLCnqUEuPq70ICpLb03EHHHardVYPIiHaeeEYfVS4XM8eVRsKDxvGDRJN7OxHU/IfZOCB+92pnbXscgBUgg+1Irny7pS8Ryp70pdbu0bfaSFe5XsaVov8aa12dDjlDDirlbYQV61i9M8RjcI7xPJkzgNj0/6VpobpZFByDnuDnNdZny4GuzRW11vAq/fSBJCpDRnBouK8V/S3pb+tA8zLga6Goevt2TQkc27jOaIU8UTNVE2UMPV9Pes5q/hW2mL3FiTbytydgGG/yP8AStCa+6jFE45uZbzT2aJi29e+OAPYUFcX0kx/Wsdp+r3rpGpaZb3keJV9fZvasHqunm3mdT07H3FcPHRSlhavGGj5BqtrSKHkDFAsJYiWhcg/ah55LiT65GPHSgzTCV+w+W8jQ7R1qg3xPSl2098/mvsUpULmuiynNJ712KnGcEc+x+Rzn+FFsOKEuVyprjtGVu4F83Fuvl7j6kjQOpPv5R4P/Kc/ah5Yw8CKYw6DPliNyyg+0bHlT3MbdeftTLVIFkQ7uw96TfpxErJcHJbGZNoYnHQOP2hx16jt2qiMmSFO0UWsu9QPbimVuORSZpNt47Y+pieuf504szuwaBt42Ty7HNovSmi+lKAsxkD5pg6/qgO54rjfVoQ6udzJicEswbb3A6cVbNpGpXshki0yeYLhSyAkDHbgfFaPwv4XNxdyXuo+cArEW68BiezA/PTOcmugs19GdqQSKBj6MDPHU89aZIk4maisZ7ObzY3yufUp6GnEUCTx5AznvRE8Bc/ahGuDanKn0jqPelZpvyVo+m0NJVwVHPByM0Kun6hpp3WTb4l6wuePx7U8sdSt7nAjdSw6oeoo/dG456mloT5Zx09iPT/EFvLJ5F0Gt7j9yXHPweh/FOsxzrtPJ+3Boa8020vE2zxLIp4wwzSv/wAsu9PP+wXGYh/7M3K49geo/pRFccc+tDoXctiwMq+ZDnBYDJT596d21ys0aujblPQ561kINX9fk3iPDN0Cv0PwehphZyfo0he3IVW5ZCeD8exo0Y8/F1aRqVfNSDYOaEtLlGQEZ5HQ9qFudRSG4SKThZjtU/4vb8jP8KHR5vi7oIu73YxVRztJyelZrXLkNFtPqGensat1q8fy2ePAkT1Lk4yfb81mFvG14xCyBClv1xIIC49vfmhY6hSPJE565od4JH/3aO59lBNbzR9DtEVHeHzZAOWk/wAulPGjiQbR7dPaiJ5NHHZ7W8iXfJZ3Cpg9Yz/ehWk2na6lTjOCMcV1m5WP1H+tZ3UdOhnVt+3B9ulCiscjMRkY4qiYZU0yvtHkgbdbHj2PSlMjsrMkow2a4vGSYo1JP1Z+KyV0MSmtregMpx7Vmp9NnnffFDK6ltgKoSCx6Djv9qZAmr6E4Gc010p8gCmWl+DtZ1GXZDpsyLnG+dTGoP5/tXQ9E/8ADGytYYpdRupZJ9v6xIiAm77HGeP5/wAqIcMXGVsy2nRZVcd+K2mmeD3vFja/fy4j6vLA9RH39q0tjommaaqi3s0DL0ZvU38TRr3Cgek/GPehZv8Akk9RK7SxtrCIRW8QUL0yM4HyajLeBHwGWhru82qQePc0invW38bR75IH9KFj48Ll9h4cMOKX6jZmRMiirR8nFFvHuWjY31Zgb+wmgLTQSMkqnI2nBr6w8W31swW5iM8Y/aXhvz71rrmwMgYdRjpSLUNGQINqEP8Ayp9Mt5RmOtL8Q2d8D5Ug3jqjHBH4pxHOsig5zmuS3+nXsUp8uIsRyChxj71dputa9p8w3r50CnBWQ4P4PXPzmlcWiM8S9HVJ4IbiMpIiurdVYZpTPZXOngtZ5liHJgY8gf4T/Y1HR9cg1BPQxVx9SOMEGniFZVHTkdqFiKUoPZnrfWi+8xSN5icSRSDBX5HX80s13WbiaGSNoSpbG11OdpHRv5U+1XQ4bp0mXKXCcJKhww+33H2PFZi986ylNvqsDInRbmMZjf5HVT9ulHTGWLDld1st02fUNfnFspUDpLKK6JpGhWelwIoALD3rK+C0t7S7by3RkuMeXjkZ6da215dJbKEjOZnYKCx+onpStHk8mMoT8S5jkEIuAO4PFKrm5ZSRuH4NX6nera22xTl87Rj9o+/8aUXVwlvbLHu3Mfrb3bvQM8YlVzdNzzml0lyTwWx9qourkFNy9xz9qCtFubyUi3RSnTexwKBohjbCpH469ex6UHNoUmoj9XF9t/tWlsdKjj2vcOZSByuMD/Wme9FH7OR29qYqsOzI6b4Gs0RTqTPO/dQ+1Pjsa01vZQWsKwwRpHGo9KouAPxUmuhu/Zz9hU0Yg87TkZ45Iri8YeJ56Y+35qEk4/ZOfc+1Q89n8zaQ4XqVoeaaWOVI0MbMwJAHGK6mWjAmZGcehCfbHaqik53BUKgDJyBwKBinubi5MSxsFQZdnPGKJvp5/wBJMECs+QAXAwF+feiolfFp0CXsUUds73M5AXGMc/8AakF/d2drP5as9xwCXjbj4p8NNSGVlk1J5FdsugQcjvk1C10XToI2VoTOGYsrle3sKdRQ6kyVhIc8+1NoSWAKj80vs02AYj3Z+9GK20lZBghSSM9uaWhJNsM3qAFByTQNxbbmYt1zUWvFZw6f7zBbPsMVWLpE9Urb2B+nHGaKiwRhL0CXFnGYzkA/NKrmxUDcq4GMZHSm9xqCMT5pyBkAY4U8dP41bLCDBJtK7SfRknIP/emLxbj2Y6SOW2uI5oH2uDww6fBrW6DrAvI8PlJU4Ze34+1B3sUMjZhXEaZTHue/96Sssts/n2rYcSbT96Dhe0UlBZI7OkxyLIgJ71C4toplKsu4EdOtZ/RtV/SEJK4YHDD709iuNyip2YJY5RdoVroFpbSNLbB4XPP6tyBu98UNdNew6pDdzXHmxW6MRzjnGDx781omwy/ehZrZ3+D7U3YHU9SMZrHia7kmQxR4VWBLPk5wagdWvb+BVtkVXdxEcNyCen4rQX2nWrSFpEV9ybemCM0ESNPjkNhbxwNtHrIySBkdcmm8ArixfQNDplxcJ/t0zQhZNjR92QDkg/yH5rRabFDbxDYSI0XAyOT9qQzak9jZoGxI05EhJH0juKWyeJlebam4vtyB2GBQcUi64/jo3Et4mxmVxGnXnkmlx1RUTLcljwNvOPmsRN4hkLFQCccdelUPrEzDONqjv1pU1+lY8eEe2bdtVSFQx+rcec447CmdlIrW8ZQrvlGSxPaudadbX+qyF4SGjDLuLt2z7V0Hyn2ERquI8ITntinSTFywglotiSOFC0so3M5yIxyfmq7uODzQWnOSCGHUj/KqUk/SLgQxqEKc+9CPcyB3tosGV2xvxijVCqDTuw3zER0jto2MhGAc5wKnJcW8NwsbzF8jLLjPNDXsrWcMEbSYK8sQOtJ9Q8QRyTnyIBnGNxHWgFY5S2hqtwt40pfbbQJ9JHVqXyeIpA22JFKKNoPvSt/0i8YCWTYp7LTbT9HtmgJC59XJNGx/4Xas/9k=',
      petStory: 'Paaru is a friendly and playful parrot looking for a loving home.',
      foodHabit: 'Paaru loves rice and gram.',
      pottyTrained: true,
      contactEmail: 'example@example.com',
      contactPhone: '+1234567890',
    ),
    // Add more sample data if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              _createAdoptionPost(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdoptionPostDetailPage(post: post),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Hero(
                              tag: post.imageURL,
                              child: ClipOval(
                                child: Image.network(
                                  post.imageURL,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network(
                                      AdoptionPostData.defaultImageURL,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Text(
                                post.petName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createAdoptionPost(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController storyController = TextEditingController();
        String imageUrl = '';
        File? _image;

        final picker = ImagePicker();


        return AlertDialog(
          title: Text('Create Adoption Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter pet name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: storyController,
                decoration: InputDecoration(
                  hintText: 'Enter pet story',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.0),

              ElevatedButton(

                onPressed: () async {
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    if (pickedFile != null) {
                      _image = File(pickedFile.path);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),

                child: Text('Upload Image'),
              ),

            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {

                final newPost = AdoptionPostData(
                  petName: nameController.text,
                  petImageURL: 'assets/img_6.png',
                  petStory: storyController.text,
                  foodHabit: 'Unknown',
                  pottyTrained: false,
                  contactEmail: 'unknown@example.com',
                  contactPhone: '0000000000',
                );


                setState(() {

                  posts.add(newPost);
                });
                Navigator.of(context).pop();

              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class AdoptionPostDetailPage extends StatelessWidget {
  final AdoptionPostData post;

  const AdoptionPostDetailPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(post.petName),
          backgroundColor: Colors.amberAccent
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: post.imageURL,
              child: ClipOval(
                child: Image.network(
                  post.imageURL,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      AdoptionPostData.defaultImageURL,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pet Name: ${post.petName}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Story: ${post.petStory}'),
            SizedBox(height: 8.0),
            Text('Food Habit: ${post.foodHabit}'),
            SizedBox(height: 8.0),
            Text('Potty Trained: ${post.pottyTrained ? 'Yes' : 'No'}'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Add functionality to contact via email
                  },
                  child: Text('Contact via Email'),
                ),
                TextButton(
                  onPressed: () {
                    // Add functionality to contact via phone
                  },
                  child: Text('Contact via Phone'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AdoptionPostData {
  final String petName;
  final String petImageURL;
  final String petStory;
  final String foodHabit;
  final bool pottyTrained;
  final String contactEmail;
  final String contactPhone;

  static const String defaultImageURL = 'assests/img_6.png'; // Default image URL

  AdoptionPostData({
    required this.petName,
    required this.petImageURL,
    required this.petStory,
    required this.foodHabit,
    required this.pottyTrained,
    required this.contactEmail,
    required this.contactPhone,
  });

  String get imageURL => petImageURL.isNotEmpty ? petImageURL : defaultImageURL;
}
