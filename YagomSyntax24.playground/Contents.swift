import Cocoa

// assert와 guard
// assertion, early exit

// assert와 guard

// 애플리케이션이 동작 도중에 생성하는 다양한 결과값을
// 동적으로 확인하고 안전하게 처리할 수 있도록
// 확인하고 빠르게 처리할 수 있다.




// Assertion
// assert(_:_:file:line:) 함수를 사용한다.
// assert 함수는 디버깅 모드에서만 동작한다.
// 배포하는 애플리케이션에서는 제외된다.
// 주로 디버깅 중 조건의 검증을 위하여 사용한다.

var someInt: Int = 0

assert(someInt == 0, "someInt != 0")
// someInt가 0이 맞으면 그대로 지나가고, 아니면 "someInt != 0"가 출력되면서 동작 중지. 잘못되었다고 알려줌.

someInt = 1
// assert(someInt == 0) // 동작 중지, 검증 실패
// assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
// assertion failed: someInt != 0: file guard_assert.swift, line 26


func functionWithAssert(age: Int?) {
    
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다.")
    print("당신의 나이는 \(age!)세 입니다.")
}

functionWithAssert(age: 26)
// 당신의 나이는 26세 입니다.
// functionWithAssert(age: -1) // 동작 중지, 검증 실패
// functionWithAssert(age: nil) // 동작 중지, 검증 실패




// Early Exit
// guard를 사용하여 잘못된 값의 전달 시
// 특정 실행구문을 빠르게 종료한다.
// 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작한다.
// guard의 else 블럭 내부에는
// 특정 코드블럭을 종료하는 지시어(return, break 등)가
// 꼭 있어야 한다.
// 타입 캐스팅, 옵셔널과도 자주 사용된다.
// 그 외 단순 조건 판단 후 빠르게 종료할 때도 용이하다.

func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
              print("나이값 입력이 잘못되었습니다.")
              return
          }
    
    guard unwrappedAge < 100 else {
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다.")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}

//1
//2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    // name이라는 값이 String타입인지 캐스팅 해보고 맞으면 진행 아니면 빠르게 종료
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    // age이라는 값이 Int타입인지 캐스팅, age값을 검증해서 맞으면 진행 아니면 빠르게 종료

    print("\(name): \(age)")
}

someFunction(info: ["name": "yuri", "age": "22"]) // age가 String타입이라 종료
someFunction(info: ["name": "yujin"]) // age값이 없어서 종료
someFunction(info: ["name": "jun", "age": 26]) // jun: 26

