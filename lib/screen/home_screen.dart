import 'package:flutter/material.dart';
import 'addToDo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7e8a5), //바탕색 지정하기
      appBar: AppBar(   //앱바 만들기
        backgroundColor: const Color(0xfff7e8a5), //바탕색
        foregroundColor: Colors.black,   //글씨색
        title: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "✓ ToDoList", //글씨
              style: TextStyle(
                fontSize: 25, //글씨크기
              ),
            ),
            Row(  //아이콘을 맨 오른쪽으로 두기 위해서 row 사용
              mainAxisAlignment: MainAxisAlignment.end, //아이콘 맨 오른쪽정렬 시키기
              children: [
                //Icon(Icons.add,), //처음엔 이렇게 했는데 이러면 클릭이 안됨
                IconButton( //클릭하는 동작을 하고 싶어서 IconButton으로 만들기
                  onPressed: (){  //클릭됐을때
                    Navigator.push( //Navigator로 다른 화면을 불러올 수 있음
                        context,
                        MaterialPageRoute(builder: (context) => const AddToDoScreen() //AddToDoScreen의 route를 전달 -> AddToDoScreen로 화면 전환될거임
                        ),
                        //AddToDoScreen(), //AddToDoScreen이 Stateful이라 그냥 해도 될 줄 알았는데 안되네... 왜지
                    );
                  },
                  icon: const Icon(
                    Icons.add,   //'+'모양 아이콘
                    color: Color(0xff444444),   //색은 검정은 아니고 진한 회색으로 !
                  ),
                ), //아이콘버튼을 쓰면 위에가 짤림...
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25), //바디부분의 사면에 패딩을 주어 너무 딱 붙지 않게 하기
        child: Column( //세로로 쭈욱 항목 적을거니까 Column 쓰기
          crossAxisAlignment: CrossAxisAlignment.start,  //글씨 왼쪽 정렬 해주기위해 .start 사용
          children: [
            const SizedBox( //앱바랑 바디 사이에 조금의 공백 추가
              height: 10,
            ),
            Row(  //글씨랑 아이콘을 나란히 둘거니까 Row 사용
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  //글씨랑 아이콘 사이에 공백 넣기
              children: [
                const Text(
                  "오늘의 할 일",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff333333),  //색은 진한회색
                    //fontWeight: FontWeight.w500,  //굵기 주고 싶으면 넣기
                  ),
                ),
                IconButton( //클릭돼야하니까 IconButton으로 작성
                  onPressed: () { },
                  icon: const Icon(
                    Icons.expand_more,  //아래방향의 화살표 아이콘
                    size: 30,
                    color: Color(0xff444444),
                  ),
                ),
              ],
            ),
            const SizedBox( //다음 항목 적기 전에 그 사이에 공백 추가
              height:40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("일주일 간 해야할 일",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff333333),  //색은 진한회색
                  ),
                ),
                IconButton(
                  onPressed: () { },
                  icon: const Icon(
                    Icons.expand_more,
                    size: 30,
                    color: Color(0xff444444),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("이번 달의 할 일",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff333333),  //색은 진한회색
                  ),
                ),
                IconButton(
                  onPressed: () { },
                  icon: const Icon(
                    Icons.expand_more,
                    size: 30,
                    color: Color(0xff444444),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("지금 할 일",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff333333),  //색은 진한회색
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.expand_more,
                    size: 30,
                    color: Color(0xff444444),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
