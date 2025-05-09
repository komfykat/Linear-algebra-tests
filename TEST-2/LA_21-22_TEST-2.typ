#import "../EXAM-1/exam_template.typ": *
#import "../typst-sympy-calculator.typ": *
#let title = "КР-2. 2021/2022 учебный год. Вариант 1"
#let author = "Морфей"
#let course = "Линейная алгебра и геометрия"
#let group = "Группа БЭАД242"
#show: footer_header.with(title, author, course, group)
#show: title_page.with(title, author, course, group)
#show: template
#show link: underline

#problem[
  Линейное отображение $phi: RR[x]_(<=2) -> M_2 (RR)$ задано формулой $phi(a + b x + c x^2) = A E + b S + c S^2$, где $S = display(mat(0, 2; 2, 1))$. Найдите базис $bb(e)$ пространства $RR[x]_(<=2)$ и базис $bb(f)$ пространства $M_2 (RR)$, в которых $phi$ имеет диагональный вид с единицами и нулями на диагонали, и выпишите этот вид.
]
#solution[
  Найдём $S^2$:
  $
    S^2 =
    mat(0, 2;
        2, 1)
    mat(0, 2;
        2, 1) =
    mat(4, 2;
        2, 5)
  $
  Введём на $RR[x]_(<=2)$ базис ${1, x, x^2}$, а на $M_2 (RR)$ базис матричных единиц:
  $
    mat(1, 0;
        0, 0),
    mat(0, 1;
        0, 0),
    mat(0, 0;
        1, 0),
    mat(0, 0;
        0, 1)
  $
  Теперь найдём координаты образов базисов и выпишем матрицу $phi$ в этих базисах:
  $
    phi(1) = E = mat(1, 0; 0, 1) ~ vec(1, 0, 0, 1)
  $
  $
    phi(x) = S = mat(0, 2; 2, 1) = vec(0, 2, 2, 1)
  $
  $
    phi(x^2) = S^2 = mat(4, 2; 2, 5) = vec(4, 2, 2, 5)
  $
  Таким образом, матрица линейного отображения в этих базисах:
  $
    A' =
    mat(1, 0, 4;
        0, 2, 2;
        0, 2, 2;
        1, 1, 5)
  $
  Далее по алгоритму. \
  Найдём базис $ker phi$:
  $
    mat(1, 0, 4;
        0, 2, 2;
        0, 2, 2;
        1, 1, 5) => "УСВ:"
    mat(1, 0, 4; 0, 1, 1; 0, 0, 0; 0, 0, 0)
  $
  Тогда
  $
    vec(-4, -1, 1) - "базис" ker phi
  $
  Дополним до базиса $RR[x]_(<=2)$. Добавим такие два вектора:
  $
    vec(1, 0, 0) " и " vec(0, 1, 0)
  $
  Проверим линейную независимость:
  $
    mat(-4, -1, 1;
        1, 0, 0;
        0, 1, 0) =>
    "УСВ:"
    mat(1, 0, 0; 0, 1, 0; 0, 0, 1)
  $
  Они линейно независимы, значит, это дополнение до базиса $RR[x]_(<=2)$. Тогда это искомый базис $bb(e)$. \
  Положим
  $
    f_1 = phi(e_1) = phi(1) = vec(1, 0, 0, 1)
  $
  $
    f_2 = phi(e_2) = phi(x) = vec(0, 2, 2, 1)
  $
  Теперь надо дополнить его до базиса $M_2 (RR)$:
  $
    mat(1, 0, 0, 1;
        0, 2, 2, 1) - "уже ступенчатый вид"
  $
  Значит, надо добавить третий и четвёртый базисы из стандартного (матричных единиц). \
  Получаем:
  $
    bb(e) = {vec(1, 0, 0), vec(0, 1, 0), vec(-4, -1, 1)} = {1, x, -4 - x + x^2}
  $
  $
    bb(f) = {vec(1, 0, 0, 1), vec(0, 2, 2, 1), vec(0, 0, 1, 0), vec(0, 0, 0, 1)} =
    { mat(1, 0; 0, 1),
      mat(0, 2; 2, 1),
      mat(0, 0; 1, 0),
      mat(0, 0; 0, 1) }
  $
  Ранг матрицы $A$ равен двум, значит, диагональный вид
  $
    A' =
    mat(1, 0, 0;
        0, 1, 0;
        0, 0, 0;
        0, 0, 0)
  $
  _Проверка:_
  $
    D^(-1) A C =
    mat(1, 0, 0, 0;
        0, 2, 0, 0;
        0, 2, 1, 0;
        1, 1, 0, 1)^(-1)
    mat(1, 0, 4;
        0, 2, 2;
        0, 2, 2;
        1, 1, 5)
    mat(1, 0, -4;
        0, 1, -1;
        0, 0, 1) = mat(1, 0, 0; 0, 1, 0; 0, 0, 0; 0, 0, 0) = A'
  $
]
#answer[
  $
    bb(e) = {1, x, -4 - x + x^2}
  $
  $
    bb(f) =
    { mat(1, 0; 0, 1),
      mat(0, 2; 2, 1),
      mat(0, 0; 1, 0),
      mat(0, 0; 0, 1) }
  $
  $
    mat(1, 0, 0;
        0, 1, 0;
        0, 0, 0;
        0, 0, 0)
  $
]
#pagebreak()

#problem[
  Рассмотрим на пространстве $V = RR[x]_(<=2)$ линейные функции $alpha_1, alpha_2, alpha_3$, где
  $
    alpha_1 (f) = f(0), alpha_2 (f) = f'(1), alpha_3 (f) = 3 integral_0^2 f(x) dif x
  $
  Найдите базис пространства $V$, для которого набор $(alpha_1, alpha_2, alpha_3 - 4 alpha_2)$ является двойственным базисом пространства $V^*$.
]
#solution[
  Пусть $f(x) = c + b x + a x^2$. Имеем:
  $
    alpha_1 (f) = c = (1, 0, 0)
  $
  $
    alpha_2(f) = (b + 2 a x)(1) = b + 2 a = (0, 1, 2)
  $
  $
    integral_0^2 f(x) dif x = integral^2_0 (c + b x + a x^2) dif x =
    (c x + 1 / 2 b x^2 + 1 / 3 a x^3) intlim(0, 2) =2 c + 2 b + 8 / 3 a => alpha_3 (f) = 6c + 6 b + 8 a = (6, 6, 8)
  $
  $
    alpha_3 - 4 alpha_2 = (6, 6, 8) - (0, 4, 8) = (6, 2, 0)
  $
  Имеем матрицу
  $
    alpha =
    mat(1, 0, 0;
        0, 1, 2;
        6, 2, 0)
  $
  Найдём обратную:
  $
    mat(1, 0, 0, 1, 0, 0;
        0, 1, 2, 0, 1, 0;
        6, 2, 0, 0, 0, 1; augment: #3) => "УСВ:"
    mat(1, 0, 0, 1, 0, 0; 0, 1, 0, -3, 0, 1/2; 0, 0, 1, 3/2, 1/2, -1/4; augment: #3)
  $
  Искомый базис написан справа в столбцах:
  $
    {1 - 3x + 3 / 2 x^2, 1 / 2 x^2, 1 / 2 x - 1 / 4 x^2}
  $
]
#answer[
  $
    {1 - 3x + 3 / 2 x^2, 1 / 2 x^2, 1 / 2 x - 1 / 4 x^2}
  $
]
#pagebreak()

#problem[
  Пусть $beta$ -- билинейная форма на пространстве $RR^4$, заданная формулой
  $
    beta(x, y) = 2x_3 y_1 + x_4 y_4
  $
  и пусть $V subset.eq RR^4$ --- подпространство решений уравнения $x_1 + x_2 - x_3 - x_4 = 0$. Определим квадратичную форму $Q$ на $V$, полагая $Q(v) = beta(v, v)$. Найдите базис пространства $V$, в котором $Q$ принимает нормальный вид, и выпишите этот вид.
]
#solution[
  Найдём базис $V$:
  $
    mat(1, 1, -1, -1)
  $
  $
    vec(x_1, x_2, x_3, x_4) =
    vec(-1, 1, 0, 0)x_2 +
    vec(1, 0, 1, 0)x_3 +
    vec(1, 0, 0, 1)x_4
  $
  $
    bb(f) = {vec(-1, 1, 0, 0), vec(1, 0, 1, 0), vec(1, 0, 0, 1)} - "базис" V
  $
  Тогда произвольный вектор $v in V$ имеет вид
  $
    (-a + b + c, a, b, c)
  $
  Определим $Q(v)$:
  $
    Q(x) = 2x_1 x_3 + x^2_4 => Q(v) = 2(-a + b + c) b + c^2 = - 2 a b + 2 b^2 + 2 b c + c^2
  $
  Запишем матрицу $Q(v)$:
  $
    Q(v) = (a, b, c) dot A dot vec(a, b, c) =>
    A =
    mat(0, -1, 0;
        -1, 2, 1;
        0, 1, 1)
  $
  Применим к ней симметричного Гаусса:
  $
    mat(0, -1, 0, 1, 0, 0;
        -1, 2, 1, 0, 1, 0;
        0, 1, 1, 0, 0, 1; augment: #3)
    stretch(->)^((1) <-> (3))
    mat(0, 1, 1, 0, 0, 1;
        -1, 2, 1, 0, 1, 0;
        0, -1, 0, 1, 0, 0; augment: #3) -->
    mat(1, 1, 0, 0, 0, 1;
        1, 2, -1, 0, 1, 0;
        0, -1, 0, 1, 0, 0; augment: #3) stretch(->)^((2) - (1)) \ -->
    mat(1, 1, 0, 0, 0, 1;
        0, 1, -1, 0, 1, -1;
        0, -1, 0, 1, 0, 0; augment: #3) -->
    mat(1, 0, 0, 0, 0, 1;
        0, 1, -1, 0, 1, -1;
        0, -1, 0, 1, 0, 0; augment: #3) stretch(->)^((3) + (2))
    mat(1, 0, 0, 0, 0, 1;
        0, 1, 0, 0, 1, -1;
        0, 0, -1, 1, 1, -1; augment: #3)
  $
  Получаем нормальный вид формы
  $
    y_1^2 + y_2^2 - y_3^2,
  $
  где $y_1, y_2, y_3$ --- координаты вектора $v in V$ в базисе
  $
    vec(0, 0, 1), vec(0, 1, -1), vec(1, 1, -1)
  $
  Осталось выразить эти векторы в $RR^4$:
  $
    vec(0, 0, 1) = vec(1, 0, 0, 1)
  $
  $
    vec(0, 1, -1) = vec(1, 0, 1, 0) - vec(1, 0, 0, 1) = vec(0, 0, 1, -1)
  $
  $
    vec(1, 1, -1) = vec(-1, 1, 0, 0) + vec(1, 0, 1, 0) - vec(1, 0, 0, 1) = vec(-1, 1, 1, -1)
  $
  Итоговый базис:
  $
    {vec(1, 0, 0, 1), vec(0, 0, 1, -1), vec(-1, 1, 1, -1)}
  $
]
#answer[
  $
    {vec(1, 0, 0, 1), vec(0, 0, 1, -1), vec(-1, 1, 1, -1)}
  $
  $
    y^2_1 + y^2_2 - y^2_3
  $
]
#pagebreak()

#problem[
  В четырёхмерном евклидовом пространстве даны векторы $v_1, v_2, v_3$ с матрицей Грама
  $display(
    mat(2, 0, 1;
        0, 3, 0;
        1, 0, 3))$.
  Для каждого $i = 1, 2, 3$ обозначим через $w_i$ ортогональную составляющую вектора $v_i$ относительно подпространства, порождамого двумя другими векторами. Найдите объём параллелепипеда, натянутого на векторы $w_1, w_2, w_3$.
]
#solution[
  Пусть $S_1 = linspan(v_2, v_3), S_2 = linspan(v_1, v_3), S_3 = linspan(v_1, v_2)$. \
  Найдём $pr_(S_1) v_1$. Из матрицы Грама $(v_2, v_3) = 0 => {v_2, v_3}$ --- ортогональный базис $S_1$. Тогда
  $
    pr_S_1 v_1 = ((v_1, v_2)) / ((v_2, v_2)) v_2 + ((v_1, v_3)) / ((v_3, v_3)) v_3 = 0 + 1 / 3 v_3 => w_1 = v_1 - 1 / 3 v_3
  $
  Найдём $pr_S_2 v_2$. Из матрицы Грама $(v_2, v_3) = (v_2, v_1) = 0 => v_2 perp v_1, v_2 perp v_3 => v_2 perp S_2 => w_2 = v_2$. \
  Найдём $pr_S_3 v_3$. $(v_1, v_2) = 0 => {v_1, v_2}$ --- ортогональный базис $S_3$. Тогда
  $
    pr_S_3 v_3 = ((v_3, v_1)) / ((v_1, v_1)) v_1 + ((v_3, v_2)) / ((v_2, v_2)) v_2 = 1 / 2 v_1 + 0 = 1 / 2 v_1 => w_3 = v_3 - 1 / 2 v_1
  $
  Итого имеем
  $
    w_1 = v_1 - 1 / 3 v_3, w_2 = v_2, w_3 = v_3 - 1 / 2 v_1
  $
  Матрица перехода
  $
    C =
    mat(1, 0, -1/2;
        0, 1, 0;
        -1/3, 0, 1) => det C = (1 + 0 + 0) - (1 / 6 + 0 + 0) = 5 / 6
  $
  Имеем
  $
    det G =
    mat(2, 0, 1;
        0, 3, 0;
        1, 0, 3) = (18 + 0 + 0) - (3 + 0 + 0) = 15
  $
  $
    "Vol" (w_1, w_2, w_3) = abs(det C) dot sqrt(det G) = 5 / 6 sqrt(15)
  $
]
#answer[
  $
    5 / 6 sqrt(15)
  $
]
#pagebreak()

#problem[
  Пусть $L subset.eq RR^4$ --- линейное многообразие, заданное системой
  $
    cases(x_1 + 2x_2 - x_3 + 2x_4 = 9,
          -x_1 + 3x_2 - 3x_3 + x_4 = 2)
  $
  Найдите расстояние от точки $(3, 6, -4, 5)$ до $L$.
]
#solution[
  Найдём какое-нибудь частное решение СЛУ. Приведём её к УСВ:
  $
    mat(1, 2, -1, 2, 9;
        -1, 3, -3, 1, 2; augment: #4) => "УСВ:"
    mat(1, 0, 3/5, 4/5, 23/5; 0, 1, -4/5, 3/5, 11/5; augment: #4)
  $
  Имеем
  $
    cases(x_1 + 3/5 x_3 + 4/5 x_4 = 23/5,
          x_2 - 4/5 x_3 + 3/5 x_4 = 11/5)
  $
  Подставим, например, $x_4 = 0, x_3 = 1$. Получаем
  $
    cases(x_1 + 3/5 = 23/5,
          x_2 - 4/5 = 11/5) =>
    cases(x_1 = 4,
          x_2 = 3)
  $
  Пусть $v_0 = (4, 3, 1, 0)$. Тогда $L = v_0 + S$, где $S$ --- множество решений соответствующей ОСЛУ. Тогда искомое расстояние равно расстоянию от $v - v_0$ до $S$. Имеем:
  $
    w colon.eq v - v_0 = vec(3, 6, -4, 5) - vec(4, 3, 1, 0) = mat(-1; 3; -5; 5)
  $
  Найдём расстояние от $v - v_0$ до $S$. Найдём базис $S$. Мы уже приводили матрицу к УСВ, так что можем выписать
  $
    vec(x_1, x_2, x_3, x_4) =
    vec(-3/5, 4/5, 1, 0)x_3 +
    vec(-4/5, -3/5, 0, 1)x_4
  $
  Пусть
  $
    v_1 = vec(-3, 4, 5, 0),
    v_2 = vec(-4, -3, 0, 5)
  $
  Тогда $S = linspan(v_1, v_2)$. Найдём расстояние от $w$ до $S$. Заметим, что $(v_1, v_2) = 12 - 12 = 0 => v_1 perp v_2$. Тогда можно найти по формуле:
  $
    pr_S w = ((w, v_1)) / ((v_1, v_1)) v_1 + ((w, v_2)) / ((v_2, v_2)) v_2
  $
  $
    (w, v_1) = vec(-1, 3, -5, 5)^T vec(-3, 4, 5, 0) = 3 + 12 - 25 = -10
  $
  $
    (v_1, v_1) = vec(-3, 4, 5, 0)^T vec(-3, 4, 5, 0) = 9 + 16 + 25 = 50
  $
  $
    (w, v_2) = vec(-1, 3, -5, 5)^T vec(-4, -3, 0, 5) = 4 - 9 + 25 = 20
  $
  $
    (v_2, v_2) = vec(-4, -3, 0, 5)^T vec(-4, -3, 0, 5) = 16 + 9 + 25 = 50
  $
  Подставим:
  $
    pr_S w = -10 / 50 vec(-3, 4, 5, 0) + 20 / 50 vec(-4, -3, 0, 5) = 1 / 5 (vec(-8, -6, 0, 10) - vec(-3, 4, 5, 0)) = 1 / 5 vec(-5, -10, -5, 10) = vec(-1, -2, -1, 2)
  $
  $
    ort_S w = vec(-1, 3, -5, 5) - vec(-1, -2, -1, 2) = vec(0, 5, -4, 3)
  $
  $
    rho = norm(ort_S w) = sqrt(25 + 16 + 9) = sqrt(50) = 5sqrt(2)
  $
]
#answer[
  $5sqrt(2)$
]
#pagebreak()

#problem[
  Прямая $l subset.eq RR^3$ проходит через точку $P = (3, 3, 2)$, перпендикулярна прямой \
  $l_1 = {x + 3y + 2z = 11, y + z = 4}$ и пересекает прямую \
  $l_2 = (3x + z = 1, x - y = -2)$. Найдите расстояние между прямыми $l$ и $l_1$.
]
#solution[
  Пусть у прямой $l$ направляющий вектор $arrow(e) = (a, b, c)$. \
  Найдём направляющий вектор $l_1$:
  $
    mat(1, 3, 2, 11;
        0, 1, 1, 4; augment: #3) =>
    mat(1, 0, -1, -1; 0, 1, 1, 4; augment: #3)
  $
  $
    cases(x = -1 + z,
          y = 4 - z,
          z in RR)
  $
  Направляющий вектор $arrow(f) = (1, -1, 1)$, опорная точка $(-1, 4, 0)$. \
  Прямые перпендикуляры, значит, $0 = (arrow(f), arrow(e)) = a - b + c => a - b + c = 0$. \
  Найдём направляющий вектор $l_2$:
  $
    mat(3, 0, 1, 1;
        1, -1, 0, -2; augment: #3) => "УСВ:"
    mat(1, 0, 1/3, 1/3; 0, 1, 1/3, 7/3; augment: #3)
  $
  $
    cases(x = 1/3 - 1/3 z,
          y = 7/3 - 1/3 z,
          z in RR) <=>
    cases(x = 1/3 - t,
          y = 7/3 - t,
          z = 3t), t in RR
  $
  Направляющий вектор $(-1, -1, 3)$. Можно найти частное решение, подставив $z = 1$, тогда опорной точкой будет $(0, 2, 1)$. \
  Прямые $l$ и $l_2$ пересекаются. Найдём вектор, соединяющий их опорные точки: $(3, 3, 2) - (0, 2, 1) = (3, 1, 1)$. Запишем условие компланарности этого вектора и двух направляющих:
  $
    0 =
    det
    mat(3, 1, 1;
        -1, -1, 3;
        a, b, c) = (-3c + 3 a - b) - (-a + 9 b - c) = 4a -10b - 2c <=> 2a - 5 b - c = 0
  $
  Имеем систему:
  $
    cases(a - b + c = 0,
          2a - 5 b - c = 0)
  $
  $
    mat(1, -1, 1;
        2, -5, -1) =>
    mat(1, 0, 2; 0, 1, 1)
  $
  Пусть $c = 1$. Тогда $a = -2, b = -1$. \
  Значит, $(-2, -1, 1)$ --- направляющий вектор. Итого имеем: \
  $l:$ опорная точка $(3, 3, 2)$, направляющий вектор $arrow(e) = (-2, -1, 1)$, \
  $l_1:$ опорная точка $(-1, 4, 0)$, направляющий вектор $arrow(f) = (1, -1, 1)$. \
  Найдём расстояние между ними. Пусть $arrow(m) = (3, 3, 2) - (-1, 4, 0) = (4, -1, 2)$ --- вектор, соединяющий опорные точки. \
  Найдём объём параллелепипеда, построенного на трёх векторах $m, e, f$:
  $
    V =
    abs(det
    mat(-2, -1, 1;
        1, -1, 1;
        4, 1, -2)) = abs((-4 - 4 + 1)
 - (-4 - 2 + 2)) = abs(-7 + 4) = 3
  $
  Найдём плошадь параллелограмма, построенного на $e, f$:
  $
    [e, f] =
    det
    mat(e_1, e_2, e_3;
        1, -1, 1;
        -2, -1, 1) = e_1 (-1 + 1) - e_2 (1 + 2) + e_3 (-1 - 2) = vec(0, -3, -3)
  $
  $
    S = sqrt(3^2 + 3^2) = 3sqrt(2)
  $
  Тогда расстояние равно
  $
    h = V / S = 1 / sqrt(2)
  $
]
#answer[
  $
    1 / sqrt(2)
  $
]

