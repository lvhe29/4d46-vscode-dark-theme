


// 这是一段 Rust 代码
use std::io;

struct Person {
    name: String,
    age: u8,
}

impl Person {
    fn is_adult(&self) -> bool {
        self.age >= 18
    }
}

fn main() {
    // 读取用户输入
    println!("请输入名字和年龄：");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("读取失败");

    let inputs: Vec<&str> = input.trim().split(' ').collect();
    let name = inputs[0].to_string();
    let age = inputs[1].trim().parse::<u8>().expect("年龄必须为数字");

    let person = Person { name, age };

    if person.is_adult() {
        println!("{}已经成年了", person.name);
    } else {
        println!("{}还未成年", person.name);
    }

    match person.age {
        0..=6 => println!("{}婴儿", person.name),
        7..=17 => println!("{}少年", person.name),
        _ => println!("{}成年", person.name),
    }
}





