#import "exam_template.typ": *
#import "../typst-sympy-calculator.typ": *
#let title = "Экзамен-1. 2023/2024 учебный год. Вариант 1"
#let author = "Морфей"
#let course = "Линейная алгебра и геометрия"
#let group = "Группа БЭАД242"
#show: footer_header.with(title, author, course, group)
#show: title_page.with(title, author, course, group)
#show: template

#problem[
Существует ли матрица $A in M_(3 times 3) (RR)$, обладающая следующими свойствами: \
(1) система $A x = (2, - 1, 0)^T$ несовместна, \
(2) пространство решений $A^T y = 0$ порождается вектором $(0, 1, 3)^T$?\
Если существует, предъявите её.
]
#solution[
Воспользуемся свойством (2) и найдём матрицу $A^T$. Это равносильно поиску ОСЛУ, пространство решений которой совпадает с $linspan((0, 1, 3)^T)$. Для этого сначала найдём ФСР системы $(0, 1, 3)^T x = 0$:
$
mat(0, 1, 3) => vec(x_1, x_2, x_3) = vec(1, 0, 0) x_1 + vec(0, -3, 1) x_3
$
Значит, её ФСР это вектора 
$
vec(1, 0, 0), vec(0, -3, 1)
$
Записав их в строки, получим матрицу
$
mat(1, 0, 0;
    0, -3, 1)
$
Это почти искомая матрица $A^T$, только в ней две строки, а не три. Чтобы дополнить её до нужного размера, припишем нулевую строку. От этого ни одно из условий не нарушится. Значит,
$
A^T = mat(1, 0, 0;
          0, -3, 1;
          0, 0, 0) => 
A = mat(1, 0, 0;
        0, -3, 0;
        0, 1, 0)
$
Проверим, что $A x = (2, -1, 0)^T$ несовместна:
$
mat(1, 0, 0, 2;
    0, -3, 0, -1;
    0, 1, 0, 0; augment: #(-1))
$
Из последней строчки $x_2 = 0$. Из второй строчки $x_2 = 1/3$. Противоречие. Значит, эта система несовместна.
]
#answer[
Да, например,
$
A = mat(1, 0, 0;
        0, -3, 0;
        0, 1, 0)
$
]
#pagebreak()

#problem[
Найдите все комплексные решения $(2 - sqrt(3) i) z^4  = -2 - 6sqrt(3)i$ и выберите среди них те, у которых действительная часть минимальна.
]
#solution[
$
(2 - sqrt(3)i)z^4 = -2-6sqrt(3)i <=> z^4 = (-2-6sqrt(3)i)/(2-sqrt(3)i) = ((-2-6sqrt(3)i)(2+sqrt(3)i))/((2-sqrt(3)i)(2+sqrt(3)i)) = \ =
(-4 - 2sqrt(3)i - 12sqrt(3)i + 18)/7 = (14 - 14sqrt(3)i)/7 = 2 - 2sqrt(3)i = 4 (1/2 - sqrt(3)/2 i) = 4 (cos (-pi/3) + i sin(-pi/3))
$
Значит,
$
z = sqrt(2) (cos (-pi/12 + (pi k)/2) + i sin (-pi/12 + (pi k)/2)), k = 0, 1, 2, 3.
$
Найдём среди них тот, у которого действительная часть минимальна. Изобразим эти корни на окружности, пользуясь фактом, что они расположены в вершинах квадрата:
#align(center)[
#image("23-24_2.png")
]
Видим, что минимальная действительная часть у корня с аргументом $display(-pi/12 + pi = (11 pi) /12)$.
]
#answer[
$
{sqrt(2) (cos (-pi/12 + (pi k)/2) + i sin (-pi/12 + (pi k)/2)) | k = 0, 1, 2, 3.},
$
$
cos (11 pi)/12 + i sin (11 pi)/12
$
]
#pagebreak()

#problem[
Выясните, принадлежит ли функция $cos^2 x$ линейной оболочке функий $sin x, 2 cos x, sin 2 x$ в пространстве всех действительнозначных функций на $RR$.
]
#solution[
Пусть $cos^2 x in linspan(sin x, 2 cos x, sin 2 x)$. Это значит, что
$
exists a, b, c: forall x #h(0.2cm) cos^2 x = a sin x + b (2 cos x) + c sin 2x
$
Подставим $x = 0$:
$
1 = 0 + 2 b + 0 => b = -1/2
$
Подставим $x = pi$:
$
1 = 0 - 2b + 0 => b = 1/2 != -1/2
$
Противоречие. Значит, $cos^2 x in.not linspan(sin x, 2 cos x, sin 2 x)$.
]
#answer[
Нет, не принадлежит.
]
#pagebreak()

#problem[
Известно, что векторы $v_1, v_2, v_3, v_4$ некоторого векторного пространства над $RR$ линейно независимы. Определите все значения параметра $a$, при которых векторы 
$
a v_1 - 2v_2 + v_3 - v_4, v_1 + v_3 + v_4, 2v_1 - v_2 + v_3
$
также линейно независимы.
]
#solution[
По условию имеем 
$
b v_1 + c v_2 + d v_3 + e v_4 = 0 <=> b = c = d = e = 0
$
Запишем линейную комбинацию векторов :
$
b (a v_1 - 2v_2 + v_3 - v_4) + c (v_1 + v_3 + v_4) + d (2 v_1 - v_2 +v_3) = \ =  v_1 (a b + c + 2d) + v_2 (-2b - d) + v_3 (b + c + d) + v_4 (-b + c) = 0 <=> \ <=> a b + c + 2d = -2b - d = b + c + d = -b + c = 0
$
Пусть векторы $a v_1 - 2v_2 + v_3 - v_4, v_1 + v_3 + v_4, 2v_1 - v_2 + v_3$ линейно независимы. Тогда 
$
a b + c + 2d = -2b - d = b + c + d = -b + c = 0 <=> b = c = d = 0
$
Или
$
cases(a b + c + 2d = 0,
      2b + d = 0,
      b + c + d = 0,
      -b + c = 0) <=> b = c = d = 0
$
Справа налево следствие верно для любого $a$. Найдём, при каких $a$ выполнено следствие слева направо. \
Из четвёртого уравнения $b = c$. Тогда из второго и из третьего $d = -2b$. Подставим в первое:
$
a b + b - 4b = 0 <=> a b - 3b = 0 <=> b (a - 3) = 0
$
Если $a != 3$, то у системы слева будет бесконечно много решений для всевозможных $b in RR$. Значит, следствие слева направо верно только при $a = 3$. Это и есть ответ. 
]
#answer[
${3}$
]
#pagebreak()

#problem[
Пусть $V$ --- векторное пространство всех многочленов степени не выше $4$ с действительными коэффициентами, и пусть $U subset.eq V$ --- подмножество, состоящее из всех многочленов $f(x)$, удовлетворяющих условиям $2f(1) = f'(-1)$, $f''(-1/2) = 0$. Докажите, что $U$ --- подпространство $V$; найдите его базис и размерность.
]
#solution[
1. Если $f(x) equiv 0$, то $2f(1) = 0 = f'(-1)$, $f''(-1/2) = 0$. Значит, $0 in U$. 
2. Пусть $f(x), g(x) in U$, $h(x) = f(x) + g(x)$. Тогда 
$
h'(-1) = f'(-1) + g'(-1) = 2f(-1) + 2g(-1) = 2h(-1)
$ 
$
h''(-1/2) = f''(-1/2) + g''(-1/2) = 0 + 0 = 0
$
Значит, $h(x) in U$.
3. Пусть $f(x) in U, k in RR, h(x) = k f(x)$. Тогда 
$
h'(-1) = k f'(-1) = k (2f(1)) = 2 (k f(1)) = 2h(1) 
$
$
h''(-1/2) = k f''(-1/2) = k dot 0 = 0
$
Значит, $h(x) in U$. \ \
Таким образом, $U$ --- подпространство. Найдём его базис. \
Пусть $f(x) = a x^4 + b x^3 + c x^2 + d x + e$. Тогда 
$
2f(1) = 2 a + 2b + 2c + 2d + 2e
$
$
f'(x) = 4a x^3 + 3b x^2 + 2c x + d => f'(-1) = -4a + 3b - 2c + d  
$
$
f''(x) = 12 a x^2 + 6b x + 2c => f''(-1/2) = 3a - 3b + 2c 
$
Имеем систему
$
cases(2a + 2b + 2c + 2d + 2e = -4a + 3b - 2c + d,
      3a - 3a + 2c = 0) <=>
cases(6a - b + 4c + d + 2e = 0,
      3a - 3b + 2c = 0) - "ОСЛУ"
$
Найдём её  ФСР:
$
mat(6, -1, 4, 1, 2;
    3, -3, 2, 0, 0) => "УСВ: " 
mat(1, 0, 2/3, 1/5, 2/5; 0, 1, 0, 1/5, 2/5)
$
То есть,
$
vec(a, b, c, d, e) = vec(-2/3, 0, 1, 0, 0) c + vec(-1/5, -1/5, 0, 1, 0) d + vec(-2/5, -2/5, 0, 0, 1)e
$
Так как соответствие между многочленом и его коэффициентами является биекцией, то $dim U = 3$ и базисом $U$ являются многочлены
$
-2/3 x^4 + x^2, -1/5 x^4 - 1/5 x^3 + x, -2/5 x^4 - 2/5 x_3 + 1
$
]
#answer[
$
-2/3 x^4 + x^2, -1/5 x^4 - 1/5 x^3 + x, -2/5 x^4 - 2/5 x_3 + 1
$
$dim U = 3$.
]
#pagebreak()

#problem[
В пространстве $RR^5$ заданы векторы
$
v_1 = (1, 0, 0, 1, 1), v_2 = (0, 1, 0, 2, 2), v_3 = (2, -1, 0, 0, 0), v_4 = (1, 0, 1, -1, 0), v_5 = (0, 1, -2, 2, 0)
$
Выясните, можно ли среди этих векторов выбрать подмножество, являющееся фундаментальной системой решений для однородной системы линейных уравнений
$
cases(x_3 + x_4 - x_5 = 0,
      x_1 + 2x_2 - x_4 = 0)
$
]
#solution[
Найдём ФСР для ОСЛУ:
$
mat(0, 0, 1, 1, -1;
    1, 2, 0, -1, 0)
$
$
vec(x_1, x_2, x_3, x_4, x_5) = underparen(vec(-2, 1, 0, 0, 0), a)x_2 + underparen(vec(1, 0, -1, 1, 0), b)x_4 + underparen(vec(0, 0, 1, 0, 1), c)x_5
$
Значит, ${a, b, c}$ --- искомая ФСР. \
Пусть $V$ --- какой-то набор векторов из $v_1, v_2, v_3, v_4, v_5$, тоже образующий ФСР. Тогда $forall v_i in V#h(0.2cm) v_i in linspan(a, b, c)$. Проверим, какие векторы из $v_1, v_2, dots, v_5$ лежат в $linspan(a, b, c)$, то есть для каких $v_i #h(0.2cm) exists x_1, x_2, x_3: x_1 a + x_2 b + x_3 c = v_i$:
$
mat(-2, 1, 0, 1, 0, 2, 1, 0;
    1, 0, 0, 0, 1, -1, 0, 1;
    0, -1, 1, 0, 0, 0, 1, -2;
    0, 1, 0, 1, 2, 0, -1, 2;
    0, 0, 1, 1, 2, 0, 0, 0; augment: #3) => "УСВ: "
mat(1, 0, 0, 0, 1, -1, 0, 1; 0, 1, 0, 1, 2, 0, 0, 2; 0, 0, 1, 1, 2, 0, 0, 0; 0, 0, 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 0, 0, 0; augment: #3)
$
Видим, что противоречие возникает только в четвёртой строчке, и только для вектора $v_4$. Значит, все векторы, кроме $v_4$, лежат в линейной оболочке ФСР, то есть являются решениями исходной ОСЛУ. \
Осталось вбырать среди этих векторов линейно независимую подсистему:
$
mat(1, 0, 2, 0;
    0, 1, -1, 1;
    0, 0, 0, -2;
    1, 2, 0, 2;
    1, 2, 0, 0) => "УСВ: " 
mat(1, 0, 2, 0; 0, 1, -1, 0; 0, 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0)
$
Главные переменные --- первая, вторая и четвёртая, значит $v_1, v_2, v_5$ является линейно независимой подсистемой $v_1, v_2, v_3, v_5$. Значит, это и есть искомое множество, образующее ФСР.
] \
#answer[
Да, например, $v_1, v_2, v_5$.
]
#pagebreak()

#problem[
Найдите все значения параметра $a$, при которых матрица $A = display(mat(a, 1, 0, 2; 2, -1, -1, 1; -3, 3, 2, 0))$ представима в виде суммы двух матриц ранга $1$, и для каждого найденного значения укажите такое представление.
]
#solution[
Пусть $A = X + Y$, где $rk X = rk Y = A$. Тогда $rk A <= rk X + rk Y = 2 => rk A <= 2$. Найдём $rk A$, приведя её к УСВ:
$
mat(a, 1, 0, 2;
    2, -1, -1, 1;
    -3, 3, 2, 0) stretch(->)^((3) + 2 times(2))
mat(a, 1, 0, 2;
    2, -1, -1, 1;
    1, 1, 0, 2) stretch(->)^((1) <-> (2))
mat(1, 1, 0, 2;
    2, -1, -1, 1;
    a, 1, 0, 2) stretch(->)^((2) - 2 times(1), (3) - a times(1)) \ --> 
mat(1, 1, 0, 2;
    0, -3, -1, -3;
    0, -a + 1, 0, -2a + 2) stretch(->)^((-1/3) times (2))
mat(1, 1, 0, 2;
    0, 1, 1/3, 1;
    0, -a + 1, 0, -2a + 2) stretch(->)^((1) - (2), (3) + (a-1) times (2)) \ -->
mat(1, 0, -1/3, 1;
    0, 1, 1/3, 1;
    0, 0, 1/3(a-1), -a + 1)
$
Так как ранг матрицы равен числу ненулевых строк в её ступенчатом виде, то $rk A <= 2 <=> a = 1$. Если $a = 1$, то $rk A = 2$. Подставим $a = 1$:
$
mat(1, 0, -1/3, 1;
    0, 1, 1/3, 1;
    0, 0, 0, 0)
$
Получаем, что для системы из столбцов матрицы $A$ первый и второй столбец --- базис линейной оболочки этой линейной системы, причём 
$
A^((3)) = -1/3 A^((1)) + 1/3 A^((2))
$
$
A^((4)) = A^((1)) + A^((2)) 
$
Получаем, что для $a = 1$
$
A = (A^((1)), A^((2)), -1/3 A^((1)) + 1/3 A^((2)), A^((1)) + A^((2))) = \
= (A^((1)), 0, -1/3 A^((1)), A^((1))) + (0, A^((2)), 1/3 A^((2)), A^((2)))
$
Это и есть искомые матрицы $X$ и $Y$, т.к. их ранг равен $1$.
$
X = mat(1, 0, -1/3, 1; 2, 0, -2/3, 2; -3, 0, 1, -3)
$
$
Y = 
mat(0, 1, 1/3, 1;
    0, -1, -1/3, -1;
    0, 3, 1, 3)
$
]
#solution[
$a = 1$.
$
A = mat(1, 0, -1/3, 1; 2, 0, -2/3, 2; -3, 0, 1, -3) + mat(0, 1, 1/3, 1;
    0, -1, -1/3, -1;
    0, 3, 1, 3)
$
]
#pagebreak()

#problem[
Найдите все матрицы $A in M_(3 times 3) (RR)$, для которых присоединённая матрица $hat(A)$ равна $display(
mat(0, 2, -2;
    2, -2, 2;
    0, 4, -5)
)$
]
#solution[
Вспомним, что $display(A^(-1) = hat(A)/det(A))$. Тогда $hat(A) = det(A) A^(-1)$. Посчитаем $det(hat(A))$. Так как $A in M_3 (RR)$, то когда мы умножаем $det A$ на $A^(-1)$, то мы $det A^(-1)$ увеличиваем в $(det A)^3$ раз (т.к. умножаем каждую строчку на $det A$). \
Раз $det(A^(-1)) = display(1/det(A))$,  то $det hat(A) = (det(A))^2$. Посчитаем определитель $hat(A)$:
$
mat(0, 2, -2;
    2, -2, 2;
    0, 4, -5; delim:"|") = 2 dot (-1)^(1+2) dot mat(2, -2; 4, -5; delim: "|") = -2 (-10 + 8) = 4.
$
Значит, $det A = plus.minus 2$. Имеем $A^(-1) = display(plus.minus 1/2 hat(A) <=> A = plus.minus 2 (hat(A))^(-1))$. Найдём обратную к $hat(A)$:
$
mat(0, 2, -2, 1, 0, 0;
    2, -2, 2, 0, 1, 0;
    0, 4, -5, 0, 0, 1; augment: #(-3)) => "УСВ: "
mat(1, 0, 0, 1/2, 1/2, 0; 0, 1, 0, 5/2, 0, -1; 0, 0, 1, 2, 0, -1; augment: #(-3))
$
Значит,
$
A = plus.minus 2 mat(1/2, 1/2, 0; 5/2, 0, -1; 2, 0, -1) = plus.minus mat(1, 1, 0; 5, 0, -2; 4, 0, -2)
$
]
#answer[
$
plus.minus mat(1, 1, 0; 5, 0, -2; 4, 0, -2)
$
]