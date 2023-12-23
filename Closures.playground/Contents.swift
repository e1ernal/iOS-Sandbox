// Замыкания (Closures)

// 1. Глобальные замыкания
// 2. Вложенные замыкания
// 3. Замыкающие выражения

// MARK: - Example 1
let greeting = {
    print("Hello World!")
}
greeting()

// MARK: - Example 2
let message = { (user: String?, message: String) in
    if let user {
        print("\(user), \(message)")
    }
    else {
        print(message)
    }
}
message("Michael", "Hello")
message(nil, "Hello?")

// MARK: - Example 3
let sum = { (x: Int, y: Int) -> Int in
    let sum = x + y
    return sum
}
print(sum(1, 2))

// MARK: - Example 4
func operation(_ a: Int, _ b: Int, action: (Int, Int) -> Int) {
    let result = action(a, b)
    print(result)
}

operation(1, 2) { a, b in
    a * b
}

operation(1, 2, action: sum)

// MARK: - Example 5
// Task: Создать функцию, которая принимает в себя длину и ширину прямоугольника и замыкание (Double, Double) -> Double
// и возвращает дробное число. Создать 2 замыкания для вычисления периметра и площади.
let perimeter = { (x: Double, y: Double) -> Double in 2 * (x + y) }
let area = { (x: Double, y: Double) -> Double in x * y }

func calculateRectangle(width x: Double, length y: Double, action: (Double, Double) -> Double ) -> Double {
    return action(x, y)
}

print(calculateRectangle(width: 1, length: 2, action: perimeter))
print(calculateRectangle(width: 1, length: 2, action: area))
