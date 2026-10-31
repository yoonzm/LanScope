#!/usr/bin/env python3
"""把设计稿（*.dc.html，内联样式的 flex/grid 布局）转换为 Flutter 页面代码。

用法：
  python3 tools/design_to_flutter.py <设计稿 project 目录> <输出目录 lib/pages/gen> [页面名 ...]

输出：
  <名称>_page.dart   每个页面一个 StatelessWidget（类名 <名称>Page）
  svgs.dart          去重后的 SVG 字符串常量
  gen_routes.dart    页面名 -> 构建函数
"""
import html
import re
import sys
import os
import collections
from html.parser import HTMLParser

# 已手写实现、不需要生成的页面
HANDWRITTEN = {
    'Main', 'Members', 'MemberDetail', 'Inventory', 'Stats', 'Login',
    'Settings', 'Order', 'Appointments', 'AppointmentAdd', 'Services',
}
SKIP = {'AppIcon'}

# ───────────────────────── 解析 ─────────────────────────


class Node:
    def __init__(self, tag, attrs):
        self.tag = tag
        self.attrs = dict(attrs)
        self.style = parse_style(self.attrs.get('style', ''))
        self.children = []
        self.parent = None
        self.raw = None  # svg 原始标记

    def copy_with_style(self, style):
        n = Node(self.tag, self.attrs.items())
        n.style = style
        n.children = self.children
        n.parent = self.parent
        n.raw = self.raw
        return n


class Parser(HTMLParser):
    VOID = {'input', 'br', 'img', 'link', 'meta', 'hr'}

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.root = Node('root', [])
        self.stack = [self.root]
        self.svgs = []

    def handle_starttag(self, tag, attrs):
        if tag == 'svgph':
            n = Node('svg', [])
            n.raw = self.svgs[int(dict(attrs)['i'])]
            head = re.match(r'<svg\b([^>]*)>', n.raw, flags=re.S).group(1)
            n.attrs = dict(re.findall(r'([\w:-]+)="([^"]*)"', head))
            n.style = parse_style(n.attrs.get('style', ''))
            n.parent = self.stack[-1]
            self.stack[-1].children.append(n)
            self.stack.append(n)
            return
        n = Node(tag, attrs)
        n.parent = self.stack[-1]
        self.stack[-1].children.append(n)
        if tag not in self.VOID:
            self.stack.append(n)

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        if tag == 'svgph':
            self.stack.pop()
        elif tag not in self.VOID:
            self.stack.pop()

    def handle_endtag(self, tag):
        if tag == 'svgph':
            tag = 'svg'
        for i in range(len(self.stack) - 1, 0, -1):
            if self.stack[i].tag == tag:
                del self.stack[i:]
                return

    def handle_data(self, data):
        if self.stack[-1].tag == 'svg':
            return
        self.stack[-1].children.append(data)


def extract_page(src):
    helm = re.search(r'<helmet>(.*?)</helmet>', src, flags=re.S)
    body = src.split('<x-dc>', 1)[1].split('</x-dc>', 1)[0]
    body = re.sub(r'<helmet>.*?</helmet>', '', body, flags=re.S)
    svgs = []

    def grab(m):
        svgs.append(m.group(0))
        return '<svgph i="%d"></svgph>' % (len(svgs) - 1)

    body = re.sub(r'<svg\b.*?</svg>', grab, body, flags=re.S)
    p = Parser()
    p.svgs = svgs
    p.feed(body)
    roots = [c for c in p.root.children if isinstance(c, Node)]
    return roots[0]


# ───────────────────────── 样式 ─────────────────────────


def parse_style(s):
    d = {}
    for part in s.split(';'):
        if ':' not in part:
            continue
        k, v = part.split(':', 1)
        d[k.strip()] = v.strip()
    # 展开简写
    if 'font' in d:
        m = re.match(r'(?:(\d+|normal|bold)\s+)?([\d.]+)px(?:/([\d.]+(?:px)?))?', d['font'])
        if m:
            if m.group(1):
                d['font-weight'] = {'normal': '400', 'bold': '700'}.get(m.group(1), m.group(1))
            d['font-size'] = m.group(2) + 'px'
            if m.group(3):
                d['line-height'] = m.group(3)
        del d['font']
    if 'inset' in d:
        v = d.pop('inset').split()
        v = (v * 4)[:4] if len(v) == 1 else v
        d.setdefault('top', v[0]); d.setdefault('right', v[1 % len(v)])
        d.setdefault('bottom', v[2 % len(v)]); d.setdefault('left', v[3 % len(v)])
    for name in ('padding', 'margin'):
        if name in d:
            t, r, b, l = box4(d.pop(name))
            for side, val in zip(('top', 'right', 'bottom', 'left'), (t, r, b, l)):
                d.setdefault('%s-%s' % (name, side), val)
    if 'flex' in d:
        f = d.pop('flex')
        if f == 'none':
            d['flex-grow'] = '0'; d['flex-shrink'] = '0'
        elif f == 'auto':
            d['flex-grow'] = '1'
        else:
            parts = f.split()
            d['flex-grow'] = parts[0]
            if len(parts) > 1:
                d['flex-shrink'] = parts[1]
    return d


def box4(v):
    p = v.split()
    if len(p) == 1:
        p = p * 4
    elif len(p) == 2:
        p = [p[0], p[1], p[0], p[1]]
    elif len(p) == 3:
        p = [p[0], p[1], p[2], p[1]]
    return p[:4]


def px(v, default=None):
    if v is None:
        return default
    v = v.strip()
    if v in ('0', 'auto', ''):
        return 0.0 if v == '0' else default
    m = re.fullmatch(r'(-?[\d.]+)(px)?', v)
    return float(m.group(1)) if m else default


def num(f):
    return ('%g' % f)


def parse_color(v, cur=None):
    """返回 (r,g,b,a) 或 None。"""
    if v is None:
        return None
    v = v.strip()
    if v in ('transparent', 'none'):
        return None
    if v in ('currentColor', 'inherit'):
        return cur
    m = re.fullmatch(r'#([0-9a-fA-F]{3,8})', v)
    if m:
        h = m.group(1)
        if len(h) == 3:
            h = ''.join(c * 2 for c in h)
        r, g, b = int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16)
        a = int(h[6:8], 16) / 255 if len(h) == 8 else 1.0
        return (r, g, b, a)
    m = re.fullmatch(r'rgba?\(([^)]*)\)', v)
    if m:
        p = [x.strip() for x in m.group(1).replace('/', ',').split(',')]
        a = float(p[3]) if len(p) > 3 else 1.0
        return (int(float(p[0])), int(float(p[1])), int(float(p[2])), a)
    return None


def dcolor(c):
    if c is None:
        return 'Colors.transparent'
    r, g, b, a = c
    if a >= 0.999:
        return 'Color(0xFF%02X%02X%02X)' % (r, g, b)
    return 'Color.fromRGBO(%d, %d, %d, %s)' % (r, g, b, num(round(a, 3)))


def scolor(c):
    r, g, b, a = c
    return '#%02X%02X%02X' % (r, g, b)


def split_top(s, sep=','):
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
        if ch == sep and depth == 0:
            out.append(cur); cur = ''
        else:
            cur += ch
    if cur.strip():
        out.append(cur)
    return [x.strip() for x in out]


def parse_gradient(v, cur):
    m = re.fullmatch(r'linear-gradient\((.*)\)', v, flags=re.S)
    if not m:
        return None
    parts = split_top(m.group(1))
    angle = 180.0
    if re.fullmatch(r'-?[\d.]+deg', parts[0]):
        angle = float(parts[0][:-3]); parts = parts[1:]
    elif parts[0].startswith('to '):
        angle = {'to bottom': 180, 'to top': 0, 'to right': 90, 'to left': 270,
                 'to bottom right': 135, 'to top right': 45}.get(parts[0], 180)
        parts = parts[1:]
    import math
    rad = math.radians(angle)
    dx, dy = math.sin(rad), -math.cos(rad)
    begin = 'Alignment(%s, %s)' % (num(round(-dx, 3)), num(round(-dy, 3)))
    end = 'Alignment(%s, %s)' % (num(round(dx, 3)), num(round(dy, 3)))
    colors, stops = [], []
    for i, p in enumerate(parts):
        m2 = re.match(r'(.*?)(?:\s+([\d.]+)%)?$', p)
        c = parse_color(m2.group(1).strip(), cur)
        colors.append(dcolor(c))
        stops.append(float(m2.group(2)) / 100 if m2.group(2) else i / max(1, len(parts) - 1))
    return 'LinearGradient(begin: %s, end: %s, colors: [%s], stops: [%s])' % (
        begin, end, ', '.join(colors), ', '.join(num(round(s, 3)) for s in stops))


def dstr(s):
    return "'" + s.replace('\\', '\\\\').replace('$', '\\$').replace("'", "\\'").replace('\n', '\\n') + "'"


# ───────────────────────── 生成器 ─────────────────────────

TEXT_PROPS = {
    'color', 'font-size', 'font-weight', 'line-height', 'letter-spacing', 'text-decoration',
    'font-variant-numeric', 'white-space', 'cursor', 'font-family', 'text-align', 'font-style',
    'box-sizing', 'all', 'vertical-align', 'margin-top', 'margin-bottom', 'margin-left', 'margin-right',
    'padding-top', 'padding-bottom', 'padding-left', 'padding-right', 'border', 'outline',
}
INLINE_TAGS = {'span', 'b', 'strong', 'em', 'i', 'a', 'u', 'small', 'br', 'label'}


class Gen:
    def __init__(self, svg_registry):
        self.svgs = svg_registry
        self.sel_counter = 0
        self.warnings = []
        self.switch_off = None

    # ── 工具 ──
    def svg_const(self, markup):
        if markup not in self.svgs:
            self.svgs[markup] = 's%d' % len(self.svgs)
        return 'Svgs.%s' % self.svgs[markup]

    def disp(self, n):
        d = n.style.get('display')
        if d:
            return d
        if n.tag in ('span', 'a', 'b', 'strong', 'em', 'label', 'button', 'legend'):
            return 'inline'
        return 'block'

    def kids(self, n):
        out = []
        for c in n.children:
            if isinstance(c, str):
                if c.strip():
                    out.append(c)
            else:
                out.append(c)
        return out

    def is_abs(self, n):
        return isinstance(n, Node) and n.style.get('position') == 'absolute'

    def is_inline_plain(self, n):
        if not isinstance(n, Node):
            return False
        if n.tag == 'br':
            return True
        if n.tag not in INLINE_TAGS or self.is_abs(n):
            return False
        if n.attrs.get('role') in ('switch', 'radio', 'tab'):
            return False
        if n.style.get('display') in ('flex', 'inline-flex', 'grid', 'block'):
            return False
        for k in n.style:
            if k not in TEXT_PROPS:
                return False
        return self.text_only(n)

    def text_only(self, n):
        if n.style.get('display') in ('flex', 'inline-flex', 'grid'):
            return all(isinstance(c, str) for c in n.children) and any(c.strip() for c in n.children if isinstance(c, str))
        has = False
        for c in n.children:
            if isinstance(c, str):
                if c.strip():
                    has = True
            elif isinstance(c, Node):
                if c.tag == 'br':
                    has = True
                    continue
                if not self.is_inline_plain(c):
                    return False
                has = True
        return has

    # ── 文本样式继承 ──
    def inherit(self, inh, st):
        o = dict(inh)
        if 'color' in st:
            c = parse_color(st['color'], inh.get('color'))
            if c:
                o['color'] = c
        if 'font-size' in st:
            o['size'] = px(st['font-size'], o['size'])
        if 'font-weight' in st:
            w = st['font-weight']
            o['w'] = {'normal': 400, 'bold': 700}.get(w, None) or int(float(w))
        if 'line-height' in st:
            lh = st['line-height']
            if lh == 'normal':
                o['lh'] = None
            elif lh.endswith('px'):
                o['lh'] = float(lh[:-2])
            else:
                o['lh'] = float(lh) * o['size']
        elif 'font-size' in st and o.get('lh') is not None and 'line-height' not in st:
            pass
        if 'letter-spacing' in st:
            ls = st['letter-spacing']
            if ls.endswith('em'):
                o['ls'] = float(ls[:-2]) * o['size']
            else:
                o['ls'] = px(ls, 0)
        if 'font-variant-numeric' in st:
            o['tab'] = 'tabular' in st['font-variant-numeric']
        if 'text-decoration' in st:
            o['deco'] = st['text-decoration']
        if 'text-align' in st:
            o['ta'] = st['text-align']
        if 'white-space' in st:
            o['nowrap'] = st['white-space'] == 'nowrap'
        return o

    def ts(self, inh):
        args = [num(inh['size']), dcolor(inh['color'])]
        if inh['w'] != 400:
            args.append('w: FontWeight.w%d' % inh['w'])
        if inh.get('lh'):
            args.append('lh: %s' % num(round(inh['lh'], 2)))
        if inh.get('ls'):
            args.append('ls: %s' % num(round(inh['ls'], 3)))
        if inh.get('tab'):
            args.append('tab: true')
        d = inh.get('deco')
        if d and 'line-through' in d:
            args.append('deco: TextDecoration.lineThrough')
        elif d and 'underline' in d:
            args.append('deco: TextDecoration.underline')
        return 'hts(%s)' % ', '.join(args)

    # ── 文本 ──
    def collect(self, n, inh, out):
        for c in n.children:
            if isinstance(c, str):
                out.append((re.sub(r'\s+', ' ', c), inh))
            elif c.tag == 'br':
                out.append(('\n', inh))
            else:
                self.collect(c, self.inherit(inh, c.style), out)

    def emit_text(self, n, inh):
        segs = []
        self.collect(n, inh, segs)
        # 去掉首尾空白
        while segs and segs[0][0].strip() == '' and segs[0][0] != '\n':
            segs.pop(0)
        while segs and segs[-1][0].strip() == '' and segs[-1][0] != '\n':
            segs.pop()
        if segs:
            segs[0] = (segs[0][0].lstrip(' '), segs[0][1])
            segs[-1] = (segs[-1][0].rstrip(' '), segs[-1][1])
        extra = []
        ta = {'center': 'TextAlign.center', 'right': 'TextAlign.right', 'end': 'TextAlign.right'}.get(inh.get('ta'))
        if ta:
            extra.append('textAlign: %s' % ta)
        if inh.get('nowrap'):
            extra.append('softWrap: false')
            extra.append('maxLines: 1')
        same = all(s[1] == segs[0][1] for s in segs)
        if same:
            text = ''.join(s[0] for s in segs)
            return 'Text(%s, style: %s%s)' % (dstr(text), self.ts(segs[0][1]), ''.join(', ' + e for e in extra))
        spans = []
        for t, i in segs:
            spans.append('TextSpan(text: %s, style: %s)' % (dstr(t), self.ts(i)))
        return 'Text.rich(TextSpan(style: %s, children: [%s])%s)' % (
            self.ts(inh), ', '.join(spans), ''.join(', ' + e for e in extra))

    # ── 装饰 ──
    def box_args(self, n, inh, parent, has_children_stack=False):
        """返回 hbox 参数列表（字符串）与 flags。"""
        st = n.style
        a = []
        w = st.get('width'); h = st.get('height')
        wpx = px(w) if w and not w.endswith('%') else None
        hpx = px(h) if h and not h.endswith('%') else None
        if wpx is not None:
            a.append('w: %s' % num(wpx))
        if hpx is not None:
            a.append('h: %s' % num(hpx))
        if 'min-width' in st and px(st['min-width']) is not None:
            a.append('minW: %s' % num(px(st['min-width'])))
        if 'min-height' in st and px(st['min-height']) is not None:
            a.append('minH: %s' % num(px(st['min-height'])))
        if 'max-width' in st and px(st['max-width']) is not None:
            a.append('maxW: %s' % num(px(st['max-width'])))
        # 背景
        cur = inh.get('color')
        bgv = st.get('background') or st.get('background-color')
        if bgv:
            g = parse_gradient(bgv, cur)
            if g:
                a.append('grad: %s' % g)
            else:
                c = parse_color(bgv, cur)
                if c:
                    a.append('bg: %s' % dcolor(c))
        # 圆角
        rv = st.get('border-radius')
        if rv:
            if rv.endswith('%'):
                r = min(wpx or 999, hpx or 999) / 2 if (wpx or hpx) else 999
                a.append('radius: BorderRadius.circular(%s)' % num(r))
            else:
                vals = rv.split()
                if len(vals) == 1:
                    if px(vals[0]):
                        a.append('radius: BorderRadius.circular(%s)' % num(min(px(vals[0]), 999)))
                else:
                    t = box4(rv)
                    pv = [px(x, 0) for x in t]
                    a.append('radius: BorderRadius.only(topLeft: Radius.circular(%s), topRight: Radius.circular(%s), bottomRight: Radius.circular(%s), bottomLeft: Radius.circular(%s))' % tuple(num(x) for x in pv))
        # 阴影 / 内描边
        shadows, ring = [], None
        if 'box-shadow' in st and st['box-shadow'] != 'none':
            for sh in split_top(st['box-shadow']):
                inset = sh.startswith('inset')
                sh2 = sh.replace('inset', '').strip()
                cm = re.search(r'(rgba?\([^)]*\)|#[0-9a-fA-F]{3,8})', sh2)
                color = parse_color(cm.group(1), cur) if cm else None
                nums = [float(x) for x in re.findall(r'(?<![\w#.])-?[\d.]+(?=px|\s|$)', sh2.replace(cm.group(1), '') if cm else sh2)]
                nums += [0.0] * (4 - len(nums))
                x, y, blur, spread = nums[:4]
                if inset:
                    if blur == 0 and x == 0 and y == 0:
                        ring = (color, spread)
                    continue
                shadows.append('BoxShadow(color: %s, offset: Offset(%s, %s), blurRadius: %s, spreadRadius: %s)' % (
                    dcolor(color), num(x), num(y), num(blur), num(spread)))
        if shadows:
            a.append('shadow: [%s]' % ', '.join(shadows))
        # 边框
        border_sides = {}
        dashed = None
        for side in ('top', 'right', 'bottom', 'left'):
            v = st.get('border-' + side)
            if v:
                m = re.match(r'([\d.]+)px\s+(solid|dashed|dotted)\s+(.*)', v)
                if m:
                    border_sides[side] = (float(m.group(1)), parse_color(m.group(3), cur))
        bv = st.get('border')
        if bv and bv != '0' and bv != 'none':
            m = re.match(r'([\d.]+)px\s+(solid|dashed|dotted)\s+(.*)', bv)
            if m:
                if m.group(2) == 'solid':
                    for side in ('top', 'right', 'bottom', 'left'):
                        border_sides.setdefault(side, (float(m.group(1)), parse_color(m.group(3), cur)))
                else:
                    dashed = (float(m.group(1)), parse_color(m.group(3), cur))
        # border-top 虚线
        for side in ('top',):
            v = st.get('border-' + side)
            if v and 'dashed' in v and not dashed:
                m = re.match(r'([\d.]+)px\s+\w+\s+(.*)', v)
                dashed = (float(m.group(1)), parse_color(m.group(2), cur))
                border_sides.pop(side, None)
        if border_sides:
            a.append('border: Border(%s)' % ', '.join(
                '%s: BorderSide(color: %s, width: %s)' % (s, dcolor(c), num(wd)) for s, (wd, c) in border_sides.items()))
        elif ring and ring[0] is not None:
            a.append('border: Border.all(color: %s, width: %s)' % (dcolor(ring[0]), num(ring[1])))
        if dashed:
            a.append('dashed: true')
            a.append('dashColor: %s' % dcolor(dashed[1]))
            a.append('dashWidth: %s' % num(dashed[0]))
        # 内边距
        pads = [px(st.get('padding-' + s), 0.0) for s in ('top', 'right', 'bottom', 'left')]
        pad_top_code = num(pads[0])
        pad_bottom_code = num(pads[2])
        if st.get('padding-top') == '56px':
            pad_top_code = 'topInset(context)'
        if (parent == 'root_abs' and st.get('padding-bottom') == '30px') or st.get('padding-bottom') == '30px' and 'position' in st and st.get('position') == 'absolute':
            pad_bottom_code = 'bottomInset(context)'
        if any(pads) or pad_top_code != num(pads[0]) or pad_bottom_code != num(pads[2]):
            a.append('pad: EdgeInsets.fromLTRB(%s, %s, %s, %s)' % (num(pads[3]), pad_top_code, num(pads[1]), pad_bottom_code))
        # 外边距（负值另外处理）
        marg = [px(st.get('margin-' + s), 0.0) if st.get('margin-' + s) != 'auto' else 0.0 for s in ('top', 'right', 'bottom', 'left')]
        neg = {}
        for i, s in enumerate(('top', 'right', 'bottom', 'left')):
            if marg[i] < 0:
                neg[s] = marg[i]
                marg[i] = 0.0
        if any(marg):
            a.append('margin: EdgeInsets.fromLTRB(%s, %s, %s, %s)' % (num(marg[3]), num(marg[0]), num(marg[1]), num(marg[2])))
        if st.get('overflow') == 'hidden':
            a.append('clip: true')
        if 'opacity' in st:
            a.append('opacity: %s' % st['opacity'])
        return a, neg

    def align_code(self, n, direction):
        st = n.style
        if st.get('display') not in ('flex', 'inline-flex'):
            return None
        jc = st.get('justify-content', 'flex-start')
        ai = st.get('align-items')
        f = {'center': 0, 'flex-start': -1, 'start': -1, 'flex-end': 1, 'end': 1}
        if jc not in f and jc != 'flex-start':
            return None
        jv = f.get(jc, -1)
        av = f.get(ai, None) if ai else None
        if av is None:
            av = -1 if ai is None else None
        if av is None:
            return None
        if jv == -1 and av == -1:
            return None
        x, y = (jv, av) if direction == 'row' else (av, jv)
        return 'Alignment(%s, %s)' % (num(x), num(y))

    # ── 最大内容宽度估算（用于模拟 CSS flex-shrink 的按比例收缩）──
    def has_text(self, n):
        if isinstance(n, str):
            return bool(n.strip())
        if n.tag in ('svg', 'input', 'textarea') or self.is_abs(n):
            return False
        return any(self.has_text(c) for c in n.children)

    def est(self, n, inh):
        if isinstance(n, str):
            t = re.sub(r'\s+', ' ', n.strip())
            w = 0.0
            for ch in t:
                o = ord(ch)
                if o > 0x2E80:
                    w += inh['size']
                elif ch == ' ':
                    w += inh['size'] * 0.3
                elif ch.isdigit() or ch.isalpha():
                    w += inh['size'] * 0.58
                else:
                    w += inh['size'] * 0.5
            return w
        if n.tag == 'svg':
            return px(n.attrs.get('width', ''), 0) or 0
        if n.tag in ('input', 'textarea'):
            return 100.0
        st = n.style
        wv = st.get('width')
        if wv and not wv.endswith('%') and px(wv) is not None:
            return px(wv)
        inh2 = self.inherit(inh, st)
        kids = [c for c in n.children if not (isinstance(c, Node) and self.is_abs(c))]
        pad = (px(st.get('padding-left'), 0) or 0) + (px(st.get('padding-right'), 0) or 0)
        if self.text_only(n):
            segs = []
            self.collect(n, inh2, segs)
            return sum(self.est(t, i) for t, i in segs) + pad
        disp = self.disp(n)
        parts = [self.est(c, inh2) for c in kids if not isinstance(c, str) or c.strip()]
        if not parts:
            return pad
        if disp in ('flex', 'inline-flex') and st.get('flex-direction') != 'column':
            return sum(parts) + (px(st.get('gap'), 0) or 0) * (len(parts) - 1) + pad
        return max(parts) + pad

    # ── 主入口：元素 ──
    def emit(self, n, inh, parent):
        """parent: 'row' | 'col' | 'block' | 'grid' | 'abs' | 'root'"""
        if isinstance(n, str):
            return 'Text(%s, style: %s)' % (dstr(re.sub(r'\s+', ' ', n).strip()), self.ts(inh))
        if n.tag == 'svg':
            return self.emit_svg(n, inh, parent)
        if n.tag == 'input':
            return self.emit_input(n, inh, parent)
        if n.tag == 'textarea':
            return self.emit_textarea(n, inh)
        if n.attrs.get('role') == 'switch':
            on = n.attrs.get('aria-checked') == 'true'
            return 'HSwitch(initial: %s)' % ('true' if on else 'false')
        inh2 = self.inherit(inh, n.style)
        st = n.style
        disp = self.disp(n)
        kids = self.kids(n)
        content = None
        direction = 'row'
        is_text = self.text_only(n)
        if is_text:
            content = self.emit_text(n, inh2)
        elif not kids:
            content = None
        elif disp == 'grid':
            content = self.emit_grid(n, inh2)
        else:
            direction = 'col' if (disp in ('block', 'inline') or st.get('flex-direction') == 'column') else 'row'
            content = self.emit_flex(n, inh2, direction, disp, parent)
        # 盒子
        args, neg = self.box_args(n, inh2, parent)
        al = self.align_code(n, direction) if is_text else None
        if is_text and n.tag == 'button' and not st.get('display') and (st.get('height') or st.get('min-height') or st.get('width')):
            al = 'Alignment.center'
        if al:
            if any(a.startswith('w:') for a in args) or st.get('width') == '100%':
                args.append('align: %s' % al)
            else:
                content = 'Align(alignment: %s, widthFactor: 1, child: %s)' % (al, content)
        wv = st.get('width')
        frac = None
        if wv and wv.endswith('%') and wv != '100%':
            frac = float(wv[:-1]) / 100
        if content is None:
            if args:
                code = 'hbox(%s)' % ', '.join(args)
            else:
                code = 'SizedBox.shrink()'
        elif args:
            code = 'hbox(%s, child: %s)' % (', '.join(args), content)
        else:
            code = content
        if st.get('aspect-ratio'):
            code = 'AspectRatio(aspectRatio: %s, child: %s)' % (st['aspect-ratio'], code)
        if frac is not None and parent != 'row':
            code = 'hfrac(%s, %s)' % (num(frac), code)
        if neg:
            code = 'NegMargin(top: %s, left: %s, child: %s)' % (num(neg.get('top', 0)), num(neg.get('left', 0)), code)
        # 点击
        if n.tag == 'a' or n.tag == 'button':
            code = self.tap(n, code)
        return code

    def tap(self, n, code):
        href = n.attrs.get('href', '')
        label = n.attrs.get('aria-label', '')
        m = re.match(r'([A-Za-z]+)\.dc\.html', href)
        back = any(k in label for k in ('返回', '关闭')) or self.has_back_icon(n)
        if back:
            return 'hTap(context, %s, back: true)' % code
        if m:
            return 'hTap(context, %s, to: %s)' % (code, dstr(m.group(1)))
        return 'hTap(context, %s)' % code

    def has_back_icon(self, n):
        for c in n.children:
            if isinstance(c, Node) and c.tag == 'svg':
                if 'M15 6l-6 6 6 6' in c.raw or 'M6 6l12 12M18 6L6 18' in c.raw:
                    return True
        return False

    # ── svg ──
    def emit_svg(self, n, inh, parent):
        raw = n.raw
        cur = inh.get('color') or (0, 0, 0, 1)
        raw = re.sub(r'currentColor', scolor(cur), raw)
        # 去掉外层 style
        raw = re.sub(r'^(<svg\b[^>]*?)\sstyle="[^"]*"', r'\1', raw, count=1, flags=re.S)
        if 'xmlns=' not in raw[:200]:
            raw = raw.replace('<svg', '<svg xmlns="http://www.w3.org/2000/svg"', 1)
        w = n.attrs.get('width'); h = n.attrs.get('height')
        w = px(w) if w else None
        h = px(h) if h else None
        args = []
        if w:
            args.append('w: %s' % num(w))
        if h:
            args.append('h: %s' % num(h))
        code = 'hsvg(%s%s)' % (self.svg_const(raw), ''.join(', ' + a for a in args))
        st = n.style
        marg = [px(st.get('margin-' + s), 0.0) for s in ('top', 'right', 'bottom', 'left')]
        if any(marg):
            code = 'Padding(padding: EdgeInsets.fromLTRB(%s, %s, %s, %s), child: %s)' % (
                num(marg[3]), num(marg[0]), num(marg[1]), num(marg[2]), code)
        return code

    # ── 表单 ──
    def emit_input(self, n, inh, parent):
        t = n.attrs.get('type', 'text')
        inh2 = self.inherit(inh, n.style)
        if t == 'checkbox':
            size = px(n.style.get('width'), 16)
            ac = parse_color(n.style.get('accent-color', ''), None)
            col = ', color: %s' % dcolor(ac) if ac else ''
            code = 'HCheck(initial: %s, size: %s%s)' % ('true' if 'checked' in n.attrs else 'false', num(size), col)
            mg = [px(n.style.get('margin-' + sd), 0.0) or 0.0 for sd in ('top', 'right', 'bottom', 'left')]
            if any(mg):
                code = 'Padding(padding: EdgeInsets.fromLTRB(%s, %s, %s, %s), child: %s)' % (num(mg[3]), num(mg[0]), num(mg[1]), num(mg[2]), code)
            return code
        kb = {'tel': 'TextInputType.phone', 'number': 'TextInputType.number', 'email': 'TextInputType.emailAddress'}.get(t)
        mode = n.attrs.get('inputmode')
        if mode == 'numeric':
            kb = 'TextInputType.number'
        if mode == 'decimal':
            kb = 'TextInputType.numberWithOptions(decimal: true)'
        args = ['style: %s' % self.ts(inh2)]
        if n.attrs.get('placeholder'):
            args.append('hint: %s' % dstr(n.attrs['placeholder']))
        if n.attrs.get('value'):
            args.append('value: %s' % dstr(n.attrs['value']))
        if kb:
            args.append('keyboard: %s' % kb)
        if t == 'password':
            args.append('obscure: true')
        ta = {'center': 'TextAlign.center', 'right': 'TextAlign.right'}.get(inh2.get('ta'))
        if ta:
            args.append('align: %s' % ta)
        code = 'HInput(%s)' % ', '.join(args)
        box, _ = self.box_args(n, inh2, parent)
        if box:
            if any(a.startswith('h:') for a in box):
                box.append('align: Alignment.centerLeft')
            code = 'hbox(%s, child: %s)' % (', '.join(box), code)
        return code

    def emit_textarea(self, n, inh):
        inh2 = self.inherit(inh, n.style)
        args = ['style: %s' % self.ts(inh2), 'maxLines: 4']
        if n.attrs.get('placeholder'):
            args.append('hint: %s' % dstr(n.attrs['placeholder']))
        txt = ''.join(c for c in n.children if isinstance(c, str)).strip()
        if txt:
            args.append('value: %s' % dstr(txt))
        code = 'HInput(%s)' % ', '.join(args)
        a, _ = self.box_args(n, inh2, 'block')
        a = [x for x in a if not x.startswith('w:')]
        return 'hbox(%s, child: %s)' % (', '.join(a), code) if a else code

    # ── flex ──
    def selectable(self, c):
        return (isinstance(c, Node) and c.tag == 'button' and 'disabled' not in c.attrs and (
            c.attrs.get('role') in ('radio', 'tab') or 'aria-pressed' in c.attrs))

    def sel_state(self, c):
        for k in ('aria-checked', 'aria-selected', 'aria-pressed'):
            if k in c.attrs:
                return c.attrs[k] == 'true'
        return False

    def find_groups(self, kids):
        """按父级把可选按钮分组：返回 {id(child): (group_idx, index_in_group)} 与 groups 信息。"""
        cands = [c for c in kids if self.selectable(c)]
        if len(cands) < 2:
            return [], {}
        # 按 role 区分单选/多选
        groups = []
        by = collections.OrderedDict()
        for c in cands:
            key = 'multi' if 'aria-pressed' in c.attrs else 'single'
            by.setdefault(key, []).append(c)
        mapping = {}
        for key, cs in by.items():
            ons = [c for c in cs if self.sel_state(c)]
            offs = [c for c in cs if not self.sel_state(c)]
            if not offs or (not ons and key == 'single'):
                continue
            if not ons:
                continue
            on_ref, off_ref = ons[0].style, offs[0].style
            delta_keys = [k for k in set(on_ref) | set(off_ref) if on_ref.get(k) != off_ref.get(k)]
            gi = len(groups)
            groups.append({'multi': key == 'multi', 'on': on_ref, 'off': off_ref, 'delta': delta_keys,
                           'initial': [i for i, c in enumerate(cs) if self.sel_state(c)]})
            for i, c in enumerate(cs):
                mapping[id(c)] = (gi, i)
        return groups, mapping

    def variant(self, c, g, want_on):
        ref = g['on'] if want_on else g['off']
        st = dict(c.style)
        for k in g['delta']:
            if k in ref:
                st[k] = ref[k]
            else:
                st.pop(k, None)
        return c.copy_with_style(st)

    def emit_flex(self, n, inh, direction, disp, parent):
        st = n.style
        kids = self.kids(n)
        groups, mapping = self.find_groups(kids)
        gname = None
        if groups:
            self.sel_counter += 1
            gname = 'g%d' % self.sel_counter
        # 是否定义了主轴尺寸
        if direction == 'row':
            definite = parent in ('col', 'block', 'grid', 'root', 'abs', 'root_abs', 'root_fixed') or st.get('width') is not None or st.get('flex-grow', '0') not in ('0',)
            if disp == 'inline-flex' and parent in ('block',):
                definite = False
        else:
            definite = st.get('height') is not None and not st.get('height', '').endswith('%') or parent == 'root_fixed'
        ai = st.get('align-items')
        jc = st.get('justify-content', 'flex-start')
        main_map = {'flex-start': 'MainAxisAlignment.start', 'start': 'MainAxisAlignment.start',
                    'center': 'MainAxisAlignment.center', 'flex-end': 'MainAxisAlignment.end',
                    'end': 'MainAxisAlignment.end', 'space-between': 'MainAxisAlignment.spaceBetween',
                    'space-around': 'MainAxisAlignment.spaceAround', 'space-evenly': 'MainAxisAlignment.spaceEvenly'}
        cross_map = {'flex-start': 'CrossAxisAlignment.start', 'start': 'CrossAxisAlignment.start',
                     'center': 'CrossAxisAlignment.center', 'flex-end': 'CrossAxisAlignment.end',
                     'end': 'CrossAxisAlignment.end', 'stretch': 'CrossAxisAlignment.stretch',
                     'baseline': 'CrossAxisAlignment.baseline'}
        gap = px(st.get('gap'), 0.0)
        rowgap = px(st.get('row-gap'), gap)
        wrap = st.get('flex-wrap') == 'wrap'
        flow, absn = [], []
        # 子项
        grows = [self.grow(c) for c in kids if isinstance(c, Node) and not self.is_abs(c)]
        scale = 10 if any(abs(g - round(g)) > 1e-6 for g in grows) else 1
        any_grow = any(g > 0 for g in grows)
        self.cur_inh = inh
        any_bg = False
        for c in kids:
            if isinstance(c, Node) and not self.is_abs(c) and (c.style.get('background') not in (None, 'transparent') or 'box-shadow' in c.style):
                any_bg = True
        for c in kids:
            if isinstance(c, str):
                tcode = 'Text(%s, style: %s)' % (dstr(re.sub(r'\s+', ' ', c).strip()), self.ts(inh))
                if direction == 'row' and not wrap and not any_grow:
                    tcode = 'Flexible(flex: %d, child: %s)' % (max(1, round(self.est(c, inh))), tcode)
                flow.append(tcode)
                continue
            if self.is_abs(c):
                absn.append(self.emit_abs(c, inh))
                continue
            if id(c) in mapping:
                gi, idx = mapping[id(c)]
                g = groups[gi]
                on = self.emit(self.variant(c, g, True), inh, direction)
                off = self.emit(self.variant(c, g, False), inh, direction)
                code = 'HSel(ctrl: %s[%d], index: %d, on: %s, off: %s)' % (gname, gi, idx, on, off)
            else:
                code = self.emit(c, inh, direction if disp in ('flex', 'inline-flex') else 'block')
            if not wrap:
                code = self.wrap_child(c, code, direction, definite, disp, scale, flow, any_grow, inh)
            flow.append(code)
        # 布局
        if disp == 'block' and direction == 'col' and not st.get('flex-direction'):
            cross = 'CrossAxisAlignment.stretch'
        elif direction == 'col':
            cross = cross_map.get(ai, 'CrossAxisAlignment.stretch') if ai else 'CrossAxisAlignment.stretch'
        else:
            if ai:
                cross = cross_map.get(ai, 'CrossAxisAlignment.start')
            else:
                cross = 'CrossAxisAlignment.stretch' if any_bg else 'CrossAxisAlignment.start'
        main = main_map.get(jc, 'MainAxisAlignment.start')
        if wrap:
            wc = {'center': 'WrapCrossAlignment.center', 'flex-end': 'WrapCrossAlignment.end'}.get(ai, 'WrapCrossAlignment.start')
            layout = 'hwrap([%s], gap: %s, rowGap: %s, cross: %s)' % (', '.join(flow), num(gap), num(rowgap), wc)
        elif direction == 'row':
            intr = 'CrossAxisAlignment.stretch' in cross
            layout = 'hrow([%s], main: %s, cross: %s, gap: %s%s%s)' % (
                ', '.join(flow), main, cross, num(gap), ', intrinsic: true' if intr else '',
                '' if True else '')
        else:
            layout = 'hcol([%s], main: %s, cross: %s, gap: %s%s)' % (
                ', '.join(flow), main, cross, num(gap), ', min: false' if definite else '')
            width_definite = (parent in ('col', 'block', 'grid', 'root', 'root_fixed', 'abs', 'root_abs')
                              or st.get('width') is not None or self.grow(n) > 0)
            if cross == 'CrossAxisAlignment.stretch' and not width_definite:
                layout = 'IntrinsicWidth(child: %s)' % layout
        if direction == 'row' and not wrap and st.get('overflow') == 'hidden' and self.est(n, inh) > 340:
            layout = 'SingleChildScrollView(scrollDirection: Axis.horizontal, child: %s)' % layout
        if absn:
            clip = st.get('overflow') == 'hidden'
            layout = 'hstack(%s, [%s]%s)' % (layout, ', '.join(absn), ', clip: true' if clip and False else '')
        if groups:
            gl = ', '.join('({%s}, %s)' % (', '.join(map(str, g['initial'])), 'true' if g['multi'] else 'false') for g in groups)
            layout = 'HSelHolder(groups: [%s], builder: (context, %s) => %s)' % (gl, gname, layout)
        return layout

    def grow(self, c):
        if not isinstance(c, Node):
            return 0
        g = c.style.get('flex-grow')
        try:
            return float(g) if g else 0
        except ValueError:
            return 0

    def wrap_child(self, c, code, direction, definite, disp, scale, flow, any_grow=False, inh=None):
        st = c.style
        g = self.grow(c)
        w = st.get('width')
        if direction == 'row':
            if c.style.get('margin-left') == 'auto' and definite:
                flow.append('Spacer()')
            if (c.tag == 'input' and c.attrs.get('type', 'text') != 'checkbox') or (c.tag == 'textarea'):
                return 'Expanded(child: %s)' % code
            if g > 0 and definite:
                return 'Expanded(flex: %d, child: %s)' % (max(1, round(g * scale)), code)
            if w == '100%' and definite:
                return 'Expanded(child: %s)' % code
            if w and w.endswith('%') and definite:
                return 'Expanded(flex: %d, child: %s)' % (max(1, round(float(w[:-1]) * 10)), code)
            if (not any_grow and w is None and st.get('flex-shrink') != '0' and c.tag not in ('svg', 'input')
                    and self.has_text(c)):
                e = self.est(c, self.inherit(inh, st))
                if e > 0:
                    return 'Flexible(flex: %d, child: %s)' % (max(1, round(e)), code)
            return code
        # 列
        if g > 0 and definite and direction == 'col':
            return 'Expanded(flex: %d, child: %s)' % (max(1, round(g * scale)), code)
        asf = st.get('align-self')
        if asf in ('center', 'flex-start', 'flex-end'):
            al = {'center': 'Alignment.topCenter', 'flex-start': 'Alignment.topLeft', 'flex-end': 'Alignment.topRight'}[asf]
            return 'Align(alignment: %s, child: %s)' % (al, code)
        has_w = (w is not None and not w.endswith('%')) or (w and w.endswith('%') and w != '100%')
        inline_child = self.disp(c) in ('inline-flex', 'inline') and disp == 'block'
        if has_w or inline_child or (c.tag == 'svg'):
            if st.get('margin') == '0 auto' or (st.get('margin-left') == 'auto' and st.get('margin-right') == 'auto'):
                return 'Align(alignment: Alignment.topCenter, child: %s)' % code
            return 'Align(alignment: Alignment.topLeft, child: %s)' % code
        return code

    # ── grid ──
    def emit_grid(self, n, inh):
        st = n.style
        cols_def = st.get('grid-template-columns', '')
        m = re.match(r'repeat\((\d+),', cols_def)
        ncols = int(m.group(1)) if m else len(cols_def.split())
        gap = px(st.get('gap'), 0.0)
        rgap = px(st.get('row-gap'), gap)
        cgap = px(st.get('column-gap'), gap)
        rows_def = st.get('grid-template-rows', '').split()
        kids = [c for c in self.kids(n) if isinstance(c, Node) and not self.is_abs(c)]
        # 带 row-span 的特例：左列跨两行
        if any('span' in (c.style.get('grid-row', '')) for c in kids):
            return self.emit_grid_rowspan(n, inh, kids, ncols, cgap, rgap, rows_def)
        cells = []
        for c in kids:
            gc = c.style.get('grid-column', '')
            span = 1
            ms = re.search(r'span\s+(\d+)', gc)
            if ms:
                span = int(ms.group(1))
            cells.append((c, span))
        rows, cur, used = [], [], 0
        for c, span in cells:
            if used + span > ncols:
                rows.append(cur); cur, used = [], 0
            cur.append((c, span)); used += span
        if cur:
            rows.append(cur)
        row_codes = []
        for ri, row in enumerate(rows):
            items = []
            for c, span in row:
                items.append('Expanded(flex: %d, child: %s)' % (span, self.emit(c, inh, 'grid')))
            used = sum(s for _, s in row)
            if used < ncols:
                items.append('Spacer(flex: %d)' % (ncols - used))
            code = 'hrow([%s], cross: CrossAxisAlignment.stretch, gap: %s, intrinsic: true, min: false)' % (', '.join(items), num(cgap))
            if ri < len(rows_def) and px(rows_def[ri]):
                code = 'SizedBox(height: %s, child: %s)' % (num(px(rows_def[ri])), code)
            row_codes.append(code)
        return 'hcol([%s], gap: %s)' % (', '.join(row_codes), num(rgap))

    def emit_grid_rowspan(self, n, inh, kids, ncols, cgap, rgap, rows_def):
        # 约定：kids[0] 跨两行（第 1 列），kids[1], kids[2] 位于第 2 列的第 1/2 行，kids[3] 跨整行
        h = [px(x, 0) for x in rows_def]
        big = kids[0]
        rest = kids[1:3]
        tail = kids[3:]
        right = []
        for i, c in enumerate(rest):
            right.append('SizedBox(height: %s, child: %s)' % (num(h[i]), self.emit(c, inh, 'grid')))
        top_h = h[0] + rgap + h[1]
        top = 'SizedBox(height: %s, child: hrow([Expanded(child: %s), Expanded(child: hcol([%s], gap: %s))], cross: CrossAxisAlignment.stretch, gap: %s, min: false))' % (
            num(top_h), self.emit(big, inh, 'grid'), ', '.join(right), num(rgap), num(cgap))
        out = [top]
        for i, c in enumerate(tail):
            hh = h[2 + i] if 2 + i < len(h) else None
            code = self.emit(c, inh, 'grid')
            out.append('SizedBox(height: %s, child: %s)' % (num(hh), code) if hh else code)
        return 'hcol([%s], gap: %s)' % (', '.join(out), num(rgap))

    # ── 绝对定位 ──
    def emit_abs(self, c, inh, root=False):
        st = c.style
        body = self.emit(c, inh, 'root_abs' if root else 'abs')
        pos = []
        for k in ('left', 'top', 'right', 'bottom'):
            v = px(st.get(k))
            if v is not None or st.get(k) == '0':
                pos.append('%s: %s' % (k, num(v if v is not None else 0)))
        w = st.get('width'); h = st.get('height')
        if w and px(w) is not None and not w.endswith('%'):
            pos.append('width: %s' % num(px(w)))
        if h and px(h) is not None and not h.endswith('%'):
            pos.append('height: %s' % num(px(h)))
        if not pos:
            pos = ['left: 0', 'top: 0']
        return 'Positioned(%s, child: %s)' % (', '.join(pos), body)

    # ── 根 ──
    def emit_page(self, root, name):
        st = root.style
        inh = {'color': parse_color(st.get('color', '#18181B')), 'size': 16.0, 'w': 400, 'lh': None}
        inh = self.inherit(inh, st)
        bg = parse_color(st.get('background', '#F4F4F5'))
        height = px(st.get('height'), 844.0)
        kids = self.kids(root)
        disp = st.get('display')
        flow_nodes = [k for k in kids if not self.is_abs(k)]
        abs_nodes = [k for k in kids if self.is_abs(k)]
        grows = any(self.grow(k) > 0 for k in flow_nodes if isinstance(k, Node))
        # 用 root 的子集构造一个临时节点来复用 emit_flex
        tmp = Node('div', [])
        tmp.style = {k: v for k, v in st.items() if k in ('display', 'flex-direction', 'gap', 'align-items', 'justify-content')}
        if 'display' not in tmp.style:
            tmp.style['display'] = 'block'
        tmp.children = flow_nodes
        parent = 'root_fixed' if grows else 'root'
        direction = 'col' if tmp.style.get('flex-direction') == 'column' or tmp.style['display'] == 'block' else 'row'
        flow = self.emit_flex(tmp, inh, direction, tmp.style['display'], parent)
        overlays = []
        for a in abs_nodes:
            ast = a.style
            if ast.get('bottom') == '0' and ast.get('top') is None and ast.get('inset') is None and ast.get('left') == '0' and ast.get('right') == '0':
                body = self.emit(a, inh, 'root_abs')
                overlays.append('HBottomDock(child: %s)' % body)
            elif ast.get('top') == '0' and ast.get('bottom') == '0' and ast.get('left') == '0' and ast.get('right') == '0':
                body = self.emit(a, inh, 'root_abs')
                overlays.append('Positioned.fill(child: %s)' % body)
            else:
                overlays.append(self.emit_abs(a, inh, root=True))
        cls = '%sPage' % name
        return """import 'package:flutter/material.dart';
import '../../kit/kit.dart';
%s
class %s extends StatelessWidget {
  const %s({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: %s,
      height: %s,
      fixedHeight: %s,
      flow: %s,
      overlays: [%s],
    );
  }
}
""" % ("import 'svgs.dart';\n" if 'Svgs.' in (flow + ''.join(overlays)) else '', cls, cls, dcolor(bg), num(height), 'true' if grows else 'false', flow, ', '.join(overlays))


def snake(name):
    return re.sub(r'(?<!^)(?=[A-Z])', '_', name).lower()


def main():
    src_dir, out_dir = sys.argv[1], sys.argv[2]
    only = set(sys.argv[3:])
    names = sorted(f[:-len('.dc.html')] for f in os.listdir(src_dir) if f.endswith('.dc.html'))
    svgs = collections.OrderedDict()
    gen = Gen(svgs)
    done = []
    for name in names:
        if name in HANDWRITTEN or name in SKIP:
            continue
        if only and name not in only:
            continue
        src = open(os.path.join(src_dir, name + '.dc.html'), encoding='utf-8').read()
        gen.sel_counter = 0
        try:
            root = extract_page(src)
            code = gen.emit_page(root, name)
        except Exception as e:  # noqa
            print('FAILED', name, repr(e))
            raise
        open(os.path.join(out_dir, snake(name) + '_page.dart'), 'w', encoding='utf-8').write(code)
        done.append(name)
    # svgs
    lines = ['// 由 tools/design_to_flutter.py 生成，请勿手工修改。', 'class Svgs {', '  Svgs._();']
    for markup, ident in svgs.items():
        lines.append("  static const %s = %s;" % (ident, dstr(re.sub(r'\s+', ' ', markup))))
    lines.append('}')
    open(os.path.join(out_dir, 'svgs.dart'), 'w', encoding='utf-8').write('\n'.join(lines) + '\n')
    # routes
    imports = ["import 'package:flutter/widgets.dart';"]
    entries = []
    for name in done:
        imports.append("import '%s_page.dart';" % snake(name))
        entries.append("  '%s': (_) => const %sPage()," % (name, name))
    open(os.path.join(out_dir, 'gen_routes.dart'), 'w', encoding='utf-8').write(
        '// 由 tools/design_to_flutter.py 生成，请勿手工修改。\n' + '\n'.join(imports) +
        '\n\nfinal Map<String, WidgetBuilder> genRoutes = {\n' + '\n'.join(entries) + '\n};\n')
    print('generated', len(done), 'pages,', len(svgs), 'svgs')


if __name__ == '__main__':
    main()
