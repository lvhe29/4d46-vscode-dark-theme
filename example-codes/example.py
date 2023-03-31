


# 这是一段 python 代码
def calculate_price(price, quantity):
    """计算商品价格"""
    total_price = price * quantity

    if quantity > 10:
        # 数量大于10个，打8折
        total_price *= 0.8

    for i in range(quantity):
        print(f"第{i+1}件商品的价格为{price}")

    switcher = {
        "apple": 5,
        "banana": 3,
        "orange": 4
    }
    fruit = "apple"
    price = switcher.get(fruit, 0)
    print(f"这个水果的价格是${price}")

    my_list = [1, 2, 3, 4, 5]
    my_tuple = (6, 7, 8, 9, 10)

    squared_list = [num**2 for num in my_list if num % 2 == 0]
    a, b, c, d, e = my_tuple

    return total_price


