#import "exam_template.typ": *
#import "../typst-sympy-calculator.typ": *
#let title = "Экзамен-1. 2022/2023 учебный год. Вариант 1"
#let author = "Морфей"
#let course = "Линейная алгебра и геометрия"
#let group = "Группа БЭАД242"
#show: footer_header.with(title, author, course, group)
#show: title_page.with(title, author, course, group)
#show: template

#problem[
Существует ли матрица $A in M_(3 times 3) (RR)$, обладающая одновременно следующими свойствами: \
(1) система $A x = (2, -3, 0)^T$ несовместна; \
(2) пространство решений системы $A^T y = 0$ имеет размерность $1$? \
Если существует, то предъявите её.
]
#solution[
Вспомним, что размерность ФСР $A x = 0$ равна $n - rk A$, где $n$ --- число строк в матрице $A$. В данном случае $n = 3$. \
Так как $rk A = rk A^T$, то $1 = 3 - rk A <=> rk A = 2$. \
Раз $rk A = 2$, то при приведении её к УСВ одна из строк будет нулевой. Осталось сделать так, чтобы эта строка приводила к противоречию в системе $A x = (2, -3, 0)^T$, тогда система будет несовместна. \
*Пример.* Рассмотрим $display(A = mat(1, 2, 3; 4, 5, 6; 7, 8, 9))$. Её ранг равен двум, так как вторая строка является полусуммой первой и третьей. Тогда рассмотрим систему $A x = (2, -3, 0)$:
$
mat(1, 2, 3, 2;
    4, 5, 6, -3;
    7, 8, 9, 0; augment: #(-1))
$ 
Легко видеть, что если из второй строки мы вычтем полусумму первой и третьей, то получим слева нулевую строку, а справа число $-4$. Значит, в этом случае система несовместна. \
Проверим (для собственного душевного спокойствия), что ФСР $A^T y = 0$ состоит из одного вектора:
$
mat(1, 4, 7;
    2, 5, 8;
    3, 6, 9) => "УСВ: "
mat(1, 0, -1; 0, 1, 2; 0, 0, 0)
$
$
vec(x_1, x_2, x_3) = vec(1, -2, 1) x_3
$
$display(vec(1, -2, 1))$ --- и есть ФСР системы $A^T y = 0$, значит, пространство её решений действительно имеет размерность, равную единице. 
]
#answer[
Да, например, $display(A = mat(1, 2, 3; 4, 5, 6; 7, 8, 9))$
]
#pagebreak()

#problem[
Найдите все комплексные решения уравнения $(sqrt(3) - 4i) z^3 = 2 + 10 sqrt(3) i$, у которых один из аргументов принадлежит интервалу $display(((7pi)/3, 3 pi))$.
]
#solution[
$
z^3 = (2 + 10sqrt(3) i)/(sqrt(3) - 4i) = ((2 + 10sqrt(3)i)(sqrt(3)+4i))/((sqrt(3)-4i)(sqrt(3)+4i)) = (2sqrt(3) + 8i + 30i - 40sqrt(3))/(3 + 16) = (-38sqrt(3) + 38i)/19 = -2sqrt(3) + 2i = \ = 4 (-sqrt(3)/2 + 1/2 i) = 4(cos (5pi)/6 + i sin (5pi)/6)
$
$
z = root(3, 4) (cos ((5pi)/18 + (2 pi k)/3) + i sin ((5pi)/18 + (2 pi k)/3)), k in ZZ.
$
Найдём те корни, у которых один из аргументов принадлежит нужному интервалу. Для этого решим неравенство:
$
(7pi)/3 < (5pi)/18 + (2pi k)/3 < 3 pi | times (18)/pi
$
$
42 < 5 + 12 k  < 54 
$
$
37 < 12k < 49
$
Подходит только $k = 4$. Тогда аргумент искомого корня равен $display((5pi)/18 + (8 pi)/3 = (53 pi)/18 = (17 pi)/18 + 2pi)$, а сам корень это
$
root(3, 4) (cos (17pi)/18 + i sin (17pi)/18)
$
]
#answer[
$
{root(3, 4) (cos (17pi)/18 + i sin (17pi)/18)}
$
]
#pagebreak()

#problem[
Выясните, являются ли функции $2 sin x, cos x, tg x, sin 2 x$ линейно независимыми в пространстве всех действительнозначных функций на множестве $(-pi/2, pi/2)$.
]
#solution[
Запишем линейную комбинацию, равную нулю:
$
forall x in (-pi/2, pi/2) #h(0.2cm) 2 a sin x + b cos x + c tg x + d sin 2 x = 0 
$
Подставим $x = 0$:
$
0 + b + 0 + 0 = 0 <=> b = 0
$
Подставим $x = pi/6$:
$
a + 0 + c/sqrt(3) + d sqrt(3)/2 = 0 <=> a + c/sqrt(3) + d sqrt(3)/2 = 0
$
Подставим $x = pi/4$:
$
a sqrt(2) + 0 + c + d = 0 <=> a + c/sqrt(2) + d/sqrt(2) = 0
$
Подставим $x = pi /3$:
$
a sqrt(3) + 0 + c sqrt(3) + d sqrt(3)/2 = 0 <=> a + c + d/2 = 0
$
Получили некоторую систему линейных уравнений для $a, c$ и $d$. Найдём определитель матрицы, задающей эту систему:
$
det mat(1, 1/sqrt(3), sqrt(3)/2;
    1, 1/sqrt(2), 1/sqrt(2);
    1, 1, 1/2) stretch(=)^((1) - (3), (2) - (3))
det mat(0, 1/sqrt(3) - 1, sqrt(3)/2 - 1/2;
    0, 1/sqrt(2) - 1, 1/sqrt(2) - 1/2;
    1, 1, 1/2) stretch(=)^("разложение по первому столбцу") \ =
1 dot (-1)^(1 + 3)  det mat(1/sqrt(3) - 1, sqrt(3)/2 - 1/2; 1/sqrt(2) - 1, 1/sqrt(2) - 1/2) = (1/sqrt(3) - 1)(1/sqrt(2) - 1/2) - (1/sqrt(2) - 1)(sqrt(3)/2 - 1/2) = \ =
1/sqrt(6) - 1/(2sqrt(3)) - 1/sqrt(2) + 1/2 - sqrt(3)/(2sqrt(2)) + 1/(2sqrt(2)) + sqrt(3)/2 - 1/2 = \ = sqrt(6)/6 - sqrt(3)/6 - sqrt(2)/2 - sqrt(6)/4 + sqrt(2)/4 + sqrt(3)/2 != 0
$
Раз определитель матрицы не равен нулю, то у системы решение единственно, и оно, очевидно, есть нулевое решение. Значит, исходная система функций линейно независима.
]
#answer[
Да, являются.
]
#pagebreak()

#problem[
Докажите, что множество всех матриц $X in M_(2 times 2) (RR)$, удовлетворяющих условию $X A = A X$, где $A = display(mat(-5, 4; -9, 7))$, является подпространством в пространстве $M_(2 times 2) (RR)$; найдите базис и размерность этого подпространства.
]
#solution[
Пусть искомое множество матриц $U subset.eq M_(2times 2) (RR)$. Пусть $display(
X = mat(a, b;
        c, d))$. Тогда 
$
X A = 
mat(a, b;
    c, d)
mat(-5, 4;
    -9, 7) = 
mat(-5a - 9b, 4a + 7b;
    -5c - 9d, 4c + 7d)
$
$
A X = 
mat(-5, 4;
    -9, 7)
mat(a, b;
    c, d) =
mat(-5a + 4c, -5b + 4d;
    -9a + 7c, -9b + 7d)
$
$
A X = X A <=> 
cases(-5a - 9b = -5a + 4c,
      4a + 7b = -5b + 4d,
      -5c - 9d = -9a + 7c,
      4c + 7d = -9b + 7d) <=> 
cases(9b + 4c = 0,
      4a + 12 b - 4d = 0,
      9a - 12c - 9d= 0,
      9b + 4c = 0) <=>
cases(9b + 4c = 0,
      a + 3b - d = 0,
      3a - 4c - 3d = 0,
      9b + 4c = 0) <=> 
cases(9b + 4c = 0,
      a + 3b - d = 0,
      3a - 4c - 3d = 0)
$
Зададим эту систему матрицей и решим её:
$
mat(0, 9, 4, 0;
    1, 3, 0, -1;
    3, 0, -4, -3) stretch(->)^((3) - 3 times(2))
mat(0, 9, 4, 0;
    1, 3, 0, -1;
    0, -9, -4, 0) stretch(->)^((3) + (1), (1) <-> (2))
mat(1, 3, 0, -1;
    0, 9, 4, 0;
    0, 0, 0, 0) stretch(->)^(1/9 times (2), (1) - 3 times(2))
mat(1, 0, -4/3, -1;
    0, 1, 4/9, 0;
    0, 0, 0, 0)
$
Итого получаем, что
$
cases(a = 4/3c  + d,
      b = -4/9 c), c, d in RR.
$
Значит, *все* такие матрицы $X$ имеют следующий вид:
$
X = mat(4/3 c + d, -4/9 c;
        c, d), c ,d in RR.
$
1. Если $c = d = 0$, то $X = theta$ (нулевая матрица). Значит, $theta in U$. \
2. Пусть $X, Y in U$. Тогда 
$
X + Y = 
mat(4/3 c_1 + d_1, -4/9 c_1;
    c_1, d_1) +
mat(4/3 c_2 + d_2, -4/9 c_2;
    c_2, d_2) = 
mat(4/3(c_1 + c_2) + (d_1 + d_2), -4/9 (c_1 + c_2);
    c_1 + c_2, d_1 + d_2) = \ =
mat(4/3 c + d, -4/9 c;
    c, d), "где " c = c_1 + c_2, d = d_1 + d_2
$
Значит, $X + Y in U$.
3. Пусть $X in U, k in RR$. Тогда 
$
k X = 
k 
mat(4/3 c + d, -4/9 c;
        c, d) = 
mat(4/3 k c + k d, -4/9 k c;
        k c, k d) = 
mat(4/3 c' + d', -4/9 c';
        c', d'), "где" c' = k c, d' = k d
$
Значит, $k X in U$. \
Таким образом, $U$ --- подпространство $M_(2 times 2) (RR)$. Очевидно, что базисом этого подпространства будут, например, матрицы 
$
C = mat(4/3, -4/9;
    1, 0) " и " 
D = mat(1, 0;
    0, 1)
$
так как любая матрица $X in U$ выражается как $c dot C + d dot D$, причём единственным образом. Значит, эта система матриц --- базис, и $dim U = 2$.
]
#answer[
$
C = mat(4/3, -4/9;
    1, 0) " и " 
D = mat(1, 0;
    0, 1) - "базис"
$
$
dim U = 2
$
]
#pagebreak()

#problem[
В пространстве $RR^5$ даны векторы 
$
v_1 = (1, 2, 3, 1, 3), v_2 = (3, 7, 5, 1, 4), v_3 = (-1, -3, 1, 1, 2), v_4 = (2, 5, 2, 4, 8)
$
Существует ли базис пространства $RR^5$, в который входят не менее трёх из этих векторов? Если существует, то предъявите его.
]
#solution[
Заметим, что эта задача равносильна поиску линейно независимой подсистемы из не менее трёх векторов из $v_1, v_2, v_3, v_4$. Действительно, если мы найдём такую подсистему, то легко сможем дополнить её до базиса. Найдём её, приведя к УСВ матрицу $(v_1, v_2, v_3, v_4)$:
$
mat(1, 3, -1, 2;
    2, 7, -3, 5;
    3, 5, 1, 2;
    1, 1, 1, 4;
    3, 4, 2, 8) => "УСВ: "
mat(1, 0, 2, 0; 0, 1, -1, 0; 0, 0, 0, 1; 0, 0, 0, 0; 0, 0, 0, 0)
$
Видим, что первая, вторая и четвёртая переменные --- главные, значит, подсистема $v_1, v_2, v_4$ является линейно независимой. Осталось дополнить эту подсистему до базиса. Для этого надо записать эти векторы в *строки* (см. алгоритм дополнения до базиса и его доказательство у Ларсика):
$
mat(1, 2, 3, 1, 3;
    3, 7, 5, 1, 4;
    2, 5, 2, 4, 8) => "УСВ: "
mat(1, 0, 11, 0, 17/4; 0, 1, -4, 0, -3/2; 0, 0, 0, 1, 7/4)
$
Видим, что главными переменными являются первая, вторая и четвёртая. Значит, дополнением до базиса будут векторы $e_3$ и $e_5$. 
]
#answer[
$
v_1 = vec(1, 2, 3, 1, 3), v_2 = vec(3, 7, 5, 1, 4), v_4 = vec(2, 5, 2, 4, 8), e_3 = vec(0, 0, 1, 0, 0), e_5 = vec(0, 0, 0, 0, 1)
$
]
#pagebreak()

#problem[
Существует ли однородная система линейных уравнений, для которой векторы $v_1 = (0, 1, 1, 1, 0), v_2 = (1, 2, 0, 0, -2), v_3 = (1, 2, -2, 0, 0)$ образуют фундаментальную систему решений? Если существует, то укажите её.
]
#solution[
Воспользуемся алгоритм, который доказывал Рома на лекции:
$
mat(0, 1, 1, 1, 0;
    1, 2, 0, 0, -2;
    1, 2, -2, 0, 0) => "УСВ:" mat(1, 0, 0, -2, -4; 0, 1, 0, 1, 1; 0, 0, 1, 0, -1)
$
$
vec(x_1, x_2, x_3, x_4, x_5) = vec(2, -1, 0, 1, 0)x_4 + vec(4, -1, 1, 0, 1)x_5
$
Искомая ОСЛУ задаётся матрицей
$
mat(2, -1, 0, 1, 0;
    4, -1, 1, 0, 1) ~
cases(2a - b + d = 0,
      4a - b + c + e = 0)
$
Это и есть ответ. 
]
#answer[
$
cases(2a - b + d = 0,
      4a - b + c + e = 0)
$
*Важно! Ответ --- не матрица, а именно система уравнений!*
]
#pagebreak()

#problem[
Дана матрица $A = display(
mat(1, 0, 1, 2;
    0, 1, 1, -1;
    -1, 1, 0, -3;
    1, 1, 2, 1)
)$
Найдите все возможные значения величины $rk(A + B)$, где $B in M_(4 times 4) (RR)$ и $rk B = 1$. Ответ обоснуйте.
]
#solution[
Вспомним, что 
$
rk(A + B) <= rk A + rk B \
rk A >= rk(A+ B) - rk B. \ "Пусть" A' = A + B, B' = -B, " тогда"
$ 
$
rk (A' + B') >= rk A' - rk B'
$
Итого имеем 
$
rk A - rk B <= rk (A + B) <= rk A + rk B
$
$
rk A - 1 <= rk (A + B) <= rk A + 1
$
Найдём $rk A$:
$
mat(1, 0, 1, 2;
    0, 1, 1, -1;
    -1, 1, 0, -3;
    1, 1, 2, 1) => "УСВ: "
mat(1, 0, 1, 2; 0, 1, 1, -1; 0, 0, 0, 0; 0, 0, 0, 0)
$
Так как ненулевых строчек две, то $rk A = 2$. То есть, $1 <= rk (A + B) <= 3$. То есть $rk (A + B) = 1, 2 "или" 3$. \ \
*1.* $rk (A + B) = 2$: Рассмотрим матрицу $B = display(
mat(1, 0, 0, 0;
0, 0, 0, -1;
-1, 0, 0, -3;
1, 0, 0, 0)
)$. Тогда $A + B$ отличается от матрицы $A$ умножением первого столбца на $2$, что, очевидно, не изменяет ранг матрицы $A$ (так как это элементарное преобразование столбца). \ \
*2.* $rk (A + B) = 3$: Рассмотрим матрицу $B = display(
mat(0, 0, 0, 1;
    0, 0, 0, 0;
    0, 0, 0, 0;
    0, 0, 0, 0)
)$. Тогда 
$
A + B = 
mat(1, 0, 1, 2;
    0, 1, 1, -1;
    -1, 1, 0, -3;
    1, 1, 2, 1) + 
mat(0, 0, 0, 1;
    0, 0, 0, 0;
    0, 0, 0, 0;
    0, 0, 0, 0) = mat(1, 0, 1, 3; 0, 1, 1, -1; -1, 1, 0, -3; 1, 1, 2, 1) => "УСВ: " 
mat(1, 0, 1, 0; 0, 1, 1, 0; 0, 0, 0, 1; 0, 0, 0, 0)
$
У полученной матрицы только одна нулевая строка, значит, её ранг равен $3$ (по сути, тем, что мы прибавили $1$ к первой строке четвёртого столбца, мы "сломали" линейную зависимость четвёртого столбца от первого и второго). \
*3.* $rk (A + B) = 1$: Из УСВ матрицы $A$ мы видим, что $A^((3)) = A^((1)) + A^((2))$, $A^((4)) = 2A^((1)) - A^((2))$. Попробуем "собрать" нужную матрицу $B$, чтобы все столбцы $A + B$ зависили от первого. Сначала сделаем так, чтобы второй столбец $A + B$ был равен первому столбцу $A^((1))$, то есть $B^((2)) = A^((1)) - A^((2))$. Тогда все остальные столбцы $B$ имеют вид $k dot (A^((1)) - A^((2)))$. \
Чтобы сделать третий столбец линейно зависимым от первого, нужно "убрать" из его представления $A^((2))$. Для этого добавим к нему $A^((1)) - A^((2))$, то есть $B^((3)) = A^((1)) - A^((2))$. Тогда $(A+B)^((3)) = 2A^((1))$. \
Чтобы сделать четвёртый столбец линейно зависимым от первого, добавим к нему $A^((2)) - A^((1))$, то есть $B^((4)) = A^((2)) - A^((1))$. Тогда $(A+B)^((4)) = A^((1))$. \
Итого, искомая матрица $B$ равна 
$
mat(0, 1, 1, -1;
    0, -1, -1, 1;
    0, -2, -2, 2;
    0, 0, 0, 0)
$
*Проверка.* 
$
A + B =
mat(1, 0, 1, 2;
    0, 1, 1, -1;
    -1, 1, 0, -3;
    1, 1, 2, 1) + 
mat(0, 1, 1, -1;
    0, -1, -1, 1;
    0, -2, -2, 2;
    0, 0, 0, 0) = mat(1, 1, 2, 1; 0, 0, 0, 0; -1, -1, -2, -1; 1, 1, 2, 1)
$
Видно, что $rk(A + B) = 1$, как мы и хотели.
]
#answer[
${1, 2, 3}$
]
#pagebreak()

#problem[
Найдите наименьшее положительное значение, которое может принимать определитель целочисленной матрицы $4 times 4$, содержащей строку $(96, 84, 75, 40)$.
]
#solution[
*Оценка* очевидна. Раз матрица целочисленная, то и её определитель --- целое число. Наименьшее положительное целое число --- единица. Значит, $det A >= 1$. \
*Пример.* Концептуально, мы хотим проделать какие-то элементарные преобразования столбцов второго типа (вычитая из столбцов другие столбцы) с исходной матрицей и получить матрицу, у которой определитель равен $1$. Проделаем элементарные преобразования столбцов со строчкой $(96, 84, 75, 40)$:
$
(96, 84, 75, 40) \ 
arrow.b_((1), (2), (3) - 2 times (4)) \
(16, 4, -5, 40) \
arrow.b_((1) - 4 times (2), (4) - 10 times (2), (3) + (2)) \
(0, 4, -1, 0) \
arrow.b_((2) + 4 times (3)) \
(0, 0, -1, 0)
$ 
Сконструируем матрицу, полученную в результате таких преобразований, у которой определитель равен $1$:
$
mat(0, 0, -1, 0;
    -1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 0, 1)
$
Проделаем все преобразования со *столбцами*, что были выше, в обратном порядке:
$
mat(0, 0, -1, 0;
    -1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 0, 1) stretch(->)^((2) - 4 times (3))
mat(0, 4, -1, 0;
    -1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 0, 1) stretch(->)^((1) + 4 times (2), (4) + 10 times (2), (3) - (2)) 
mat(16, 4, -5, 40;
    -1, 0, 0, 0;
    4, 1, -1, 10;
    0, 0, 0, 1) stretch(->)^((1), (2), (3) + 2 times (4)) \ --> 
mat(96, 84, 75, 40;
    -1, 0, 0, 0;
    24, 21, 19, 10;
    2, 2, 2, 1)
$
Это целочисленная матрица, содержащая строчку $(96, 84, 75, 40)$, и её определитель равен $1$ (это несложно проверить).
] \ \
#answer[
$1$.
]