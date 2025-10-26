import matplotlib.pyplot as plt

def DDA(x1, y1, x2, y2):
    # حساب الفرق بين النقطتين
    dx = x2 - x1
    dy = y2 - y1

    # نحدد عدد الخطوات
    steps = int(max(abs(dx), abs(dy)))

    # حساب مقدار الزيادة في كل خطوة
    Xinc = dx / steps
    Yinc = dy / steps

    x = x1
    y = y1
    x_points = []
    y_points = []

    # توليد النقاط
    for i in range(steps + 1):
        x_points.append(round(x))
        y_points.append(round(y))
        x += Xinc
        y += Yinc

    # رسم الخط
    plt.plot(x_points, y_points, color='blue', marker='o')
    plt.title("DDA Line Drawing Algorithm")
    plt.xlabel("X-axis")
    plt.ylabel("Y-axis")
    plt.grid(True)
    plt.show()


# تجربة الخوارزمية
x1, y1 = 2, 3
x2, y2 = 12, 8
DDA(x1, y1, x2, y2)



