
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  DateTime? selectedDate = DateTime.now();  //날짜선택시 사용할 '선택된 날짜' 변수를 현재 날짜로 초기화
  TimeOfDay selectedStartTime = const TimeOfDay(hour: 0, minute: 0);  //시간선택시 사용할 '시작시간'에 대한 변수를 0:0으로 초기화
  TimeOfDay selectedEndTime = const TimeOfDay(hour: 23, minute: 59);  //시간선택시 사용할 '종료시간'에 대한 변수를 23:59로 초기화
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7e8a5),
      appBar: AppBar(
        backgroundColor: const Color(0xfff7e8a5),
        foregroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  //글자들 사이에 공백주기
          children: [
            /*
            Text(
              "취소",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
             */
            //원래는 취소 글자를 두고싶었는데 navogator로 화면 전환을 할때 자동으로 뒤로가기가 생겨서 없애버림
            //navigator 말고 뭐로 해야 뒤로가기 없이 만들어지지??
            Text(
                "오늘의 할 일이 무엇인가요?",
                style: TextStyle(
                  fontSize: 23,
                ),
            ),
            Text(
              "완료",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(  //화면이 오버됐을때 스크롤을 통해 할 수 있도록 해줌
        child: Padding( //패딩 입혀주기
          padding: const EdgeInsets.all(30),  //사면으로 패딩 줌
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //글자들 왼쪽 정렬
            children: [
              const Text(
                "할 일",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const TextField(  //사용자로부터 텍스트 입력을 받을 수 있는 위젯
                decoration: InputDecoration(  //textField의 외관을 정의하는데 사용되는 클래스
                  //labelText:"할 일",  //텍스트필드 위에 표시되는 라벨 텍스트
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  //사이에 공백을 줌
                children: [
                  const Text(
                    "날 짜",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text( //선택된 날짜 표기
                    "${selectedDate?.year.toString()}년${selectedDate?.month.toString().padLeft(2, '0')}월${selectedDate?.day.toString().padLeft(2, '0')}일"
                  ),
                  InkWell(  //container에 클릭을 주고 싶으면 InkWell로 wrap하면 됨
                    onTap: (){  //클릭됐을때
                      showDatePicker(
                          context: context,
                          //initialDate: DateTime.now(),  //초기 날짜 세팅
                          firstDate: DateTime(2000),  //선택가능한 날짜의 범위 중 맨 앞
                          lastDate: DateTime(2050), //선택가능한 날짜의 범위 중 맨 뒤
                      ).then((selectedDate){   //then을 사용해서 selectedDate의 상태를 업데이트
                        setState(() {   //화면 상에서 바로 바뀔 수 있도록 setState()를 사용
                          if(selectedDate!=null) {  //_selectedDate가 비어있지 않을때만(즉, 선택을 했을때만)
                            selectedDate = selectedDate; //상태를 업데이트(왜냐면 선택안하면 값이 null로 되는데 그렇게 표기하면 안이쁘니까!)
                          }
                        });
                      });
                    },
                    child: Container( //컨테이너(박스)모양으로 만들기
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),  //모서리에 곡률 주기
                        color: const Color(0xffffd70f),
                      ),
                      padding: const EdgeInsets.symmetric(  //컨테이너의 크기 조정
                        vertical: 13, //세로
                        horizontal: 13, //가로
                      ),
                      child: const Text(
                        "날짜 선택",
                        style: TextStyle(
                          color: Color(0xff555555),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              const Text("시 간",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(  //양옆으로 간격 뛰우고 싶음
                  //vertical: 10, //위아래는 패딩 조금
                  horizontal: 70, //양옆은 패딩 많이
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("시작시간"),
                    Text("종료시간"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 43,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        showCupertinoModalPopup(
                           context: context,
                          builder: (BuildContext context) { //build함수는 대체로 BuildContext를 매개변수로 사용, buildg함수는 새로운 위젯을 빌드하고 반환하는 함수임
                            return Container( //CupertinoDatePicker를 띄우는 컨테이너
                              height: 300,  //DatePicker의 팝업창 높이 조절
                              color: Colors.white,  //컬러 안 정해주면 투명색됨
                              child: CupertinoDatePicker( // CupertinoDatePicker를 사용하여 시간 선택기 표시
                                mode: CupertinoDatePickerMode.time, //시간만 표기하면 돼서 시간 선택 모드 설정
                                initialDateTime: DateTime(// 초기 시간 설정
                                  selectedDate!.year, //연도
                                  selectedDate!.month,  //월
                                  selectedDate!.day,  //일
                                  selectedStartTime.hour, //시간
                                  selectedStartTime.minute, //분
                                ),
                                onDateTimeChanged: (DateTime newStartTime) { // 시간이 변경될 때 호출되는 콜백 함수
                                  setState(() { //setState()를 통해 계속 업데이트
                                    selectedStartTime = TimeOfDay(
                                      hour: newStartTime.hour,
                                      minute: newStartTime.minute,
                                    );
                                  });
                                },
                              ),
                            );
                       },
                    );
                        },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),  //모서리에 곡률 주기
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(  //컨테이너의 크기 조정
                          vertical: 20, //세로
                          horizontal: 30, //가로
                        ),
                        child: Text(
                          "${selectedStartTime.hour.toString().padLeft(2, '0')}:${selectedStartTime.minute.toString().padLeft(2, '0')}"
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) { //build함수는 대체로 BuildContext를 매개변수로 사용, buildg함수는 새로운 위젯을 빌드하고 반환하는 함수임
                            return Container( //CupertinoDatePicker를 띄우는 컨테이너
                              height: 300,  //DatePicker의 팝업창 높이 조절
                              color: Colors.white,  //컬러 안 정해주면 투명색됨
                              child: CupertinoDatePicker( // CupertinoDatePicker를 사용하여 시간 선택기 표시
                                mode: CupertinoDatePickerMode.time, //시간만 표기하면 돼서 시간 선택 모드 설정
                                initialDateTime: DateTime(// 초기 시간 설정
                                  selectedDate!.year, //연도
                                  selectedDate!.month,  //월
                                  selectedDate!.day,  //일
                                  selectedEndTime.hour, //시간
                                  selectedEndTime.minute, //분
                                ),
                                onDateTimeChanged: (DateTime newEndTime) { // 시간이 변경될 때 호출되는 콜백 함수
                                  setState(() { //setState()를 통해 계속 업데이트
                                    selectedEndTime = TimeOfDay(
                                      hour: newEndTime.hour,
                                      minute: newEndTime.minute,
                                    );
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),  //모서리에 곡률 주기
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(  //컨테이너의 크기 조정
                          vertical: 20, //세로
                          horizontal: 30, //가로
                        ),
                        child: Text(
                            "${selectedEndTime.hour.toString().padLeft(2, '0')}:${selectedEndTime.minute.toString().padLeft(2, '0')}"
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("메 모",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
             TextField( //메모도 텍스트를 입력받는거니까 !
                  maxLines: 20, //박스를 긴 직사각형으로 하고 싶어서 해줌, 그리고 20줄까지만 쓸수있게 해주기도 함
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(  //사각형 테두리 주기 위해 사용
                        borderRadius: BorderRadius.circular(0), //둥글게 말고 직각으로 하려고 0으로 줌
                        borderSide: const BorderSide( //사각형 테두리 만들기 위해 사용
                          color: Color(0xff907ca2), //테두리선 색 지정
                        // width: 1.0,  //굵기 주고 싶으면 줘도 됨
                        ),
                      ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
