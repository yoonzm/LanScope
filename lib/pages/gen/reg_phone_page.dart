import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class RegPhonePage extends StatelessWidget {
  const RegPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 844,
      fixedHeight: false,
      flow: hcol(
        [
          hbox(
            pad: EdgeInsets.fromLTRB(20, topInset(context), 20, 120),
            child: hcol(
              [
                hrow(
                  [
                    hTap(
                      context,
                      hbox(
                        w: 44,
                        h: 44,
                        bg: Color(0xFFFFFFFF),
                        radius: BorderRadius.circular(22),
                        shadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.04),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 0,
                          ),
                        ],
                        child: hrow(
                          [hsvg(Svgs.s10, w: 20, h: 20)],
                          main: MainAxisAlignment.center,
                          cross: CrossAxisAlignment.center,
                          gap: 0,
                        ),
                      ),
                      back: true,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '免费开通',
                        style: hts(
                          17,
                          Color(0xFF18181B),
                          w: FontWeight.w600,
                          lh: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    hbox(w: 44),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.center,
                  gap: 8,
                ),
                hrow(
                  [
                    Expanded(
                      flex: 1,
                      child: hbox(
                        h: 4,
                        bg: Color(0xFF0485F7),
                        radius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: hbox(
                        h: 4,
                        bg: Color(0xFFD4D4D8),
                        radius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: hbox(
                        h: 4,
                        bg: Color(0xFFD4D4D8),
                        radius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 6,
                  intrinsic: true,
                ),
                hcol(
                  [
                    Text(
                      '开通你的门店系统',
                      style: hts(
                        24,
                        Color(0xFF18181B),
                        w: FontWeight.w600,
                        lh: 32,
                        ls: -0.48,
                      ),
                    ),
                    Text(
                      '手机号注册，3 分钟完成开通',
                      style: hts(14, Color(0xFF71717A), lh: 20),
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 6,
                ),
                hcol(
                  [
                    hrow(
                      [
                        hbox(
                          w: 20,
                          h: 20,
                          bg: Color.fromRGBO(23, 201, 100, 0.133),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s123, w: 12, h: 12)],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                        Flexible(
                          flex: 123,
                          child: Text(
                            '14 天免费试用专业版',
                            style: hts(13, Color(0xFF3F3F46), lh: 18),
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 6,
                    ),
                    hrow(
                      [
                        hbox(
                          w: 20,
                          h: 20,
                          bg: Color.fromRGBO(23, 201, 100, 0.133),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s123, w: 12, h: 12)],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                        Flexible(
                          flex: 104,
                          child: Text(
                            '无需绑定支付方式',
                            style: hts(13, Color(0xFF3F3F46), lh: 18),
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 6,
                    ),
                    hrow(
                      [
                        hbox(
                          w: 20,
                          h: 20,
                          bg: Color.fromRGBO(23, 201, 100, 0.133),
                          radius: BorderRadius.circular(10),
                          child: hrow(
                            [hsvg(Svgs.s123, w: 12, h: 12)],
                            main: MainAxisAlignment.center,
                            cross: CrossAxisAlignment.center,
                            gap: 0,
                          ),
                        ),
                        Flexible(
                          flex: 117,
                          child: Text(
                            '试用到期前不会扣费',
                            style: hts(13, Color(0xFF3F3F46), lh: 18),
                          ),
                        ),
                      ],
                      main: MainAxisAlignment.start,
                      cross: CrossAxisAlignment.center,
                      gap: 6,
                    ),
                  ],
                  main: MainAxisAlignment.start,
                  cross: CrossAxisAlignment.stretch,
                  gap: 8,
                ),
                hbox(
                  bg: Color(0xFFFFFFFF),
                  radius: BorderRadius.circular(24),
                  shadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.04),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      offset: Offset(0, 0),
                      blurRadius: 1,
                      spreadRadius: 0,
                    ),
                  ],
                  pad: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: hcol(
                    [
                      hcol(
                        [
                          Text.rich(
                            TextSpan(
                              style: hts(
                                13,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: '手机号 ',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: hts(
                                    13,
                                    Color(0xFFA43433),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          hbox(
                            minH: 48,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                            pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            child: hrow(
                              [
                                Text(
                                  '+86',
                                  style: hts(
                                    15,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                  ),
                                ),
                                hbox(w: 1, h: 18, bg: Color(0xFFD4D4D8)),
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    hint: '请输入手机号',
                                    keyboard: TextInputType.phone,
                                  ),
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 10,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text.rich(
                            TextSpan(
                              style: hts(
                                13,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: '验证码 ',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: hts(
                                    13,
                                    Color(0xFFA43433),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          hbox(
                            minH: 48,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                            pad: EdgeInsets.fromLTRB(14, 0, 6, 0),
                            child: hrow(
                              [
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    hint: '6 位数字',
                                  ),
                                ),
                                hTap(
                                  context,
                                  hbox(
                                    h: 36,
                                    bg: Color(0xFFFFFFFF),
                                    radius: BorderRadius.circular(18),
                                    shadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.06),
                                        offset: Offset(0, 1),
                                        blurRadius: 2,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 1,
                                      child: Text(
                                        '获取验证码',
                                        style: hts(
                                          13,
                                          Color(0xFF1E63AE),
                                          w: FontWeight.w500,
                                          lh: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  label: '获取验证码',
                                ),
                              ],
                              main: MainAxisAlignment.start,
                              cross: CrossAxisAlignment.center,
                              gap: 10,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text.rich(
                            TextSpan(
                              style: hts(
                                13,
                                Color(0xFF18181B),
                                w: FontWeight.w500,
                                lh: 18,
                              ),
                              children: [
                                TextSpan(
                                  text: '设置登录密码 ',
                                  style: hts(
                                    13,
                                    Color(0xFF18181B),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: hts(
                                    13,
                                    Color(0xFFA43433),
                                    w: FontWeight.w500,
                                    lh: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          hbox(
                            minH: 48,
                            bg: Color(0xFFF4F4F5),
                            radius: BorderRadius.circular(14),
                            pad: EdgeInsets.fromLTRB(14, 0, 14, 0),
                            child: HHolder(
                              inits: [1],
                              builder: (context, ctrls) {
                                final p1 = ctrls[0];
                                return hrow(
                                  [
                                    Expanded(
                                      child: ListenableBuilder(
                                        listenable: p1,
                                        builder: (context, _) => HInput(
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                          hint: '8-20 位，含字母和数字',
                                          obscure: p1.on,
                                        ),
                                      ),
                                    ),
                                    hPwdLabel(p1, hts(13, Color(0xFF71717A))),
                                  ],
                                  main: MainAxisAlignment.start,
                                  cross: CrossAxisAlignment.center,
                                  gap: 10,
                                );
                              },
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hrow(
                        [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: HCheck(
                              initial: true,
                              size: 16,
                              color: Color(0xFF0485F7),
                            ),
                          ),
                          Flexible(
                            flex: 84,
                            child: Text(
                              '我已阅读并同意',
                              style: hts(12, Color(0xFF52525B), lh: 18),
                            ),
                          ),
                          Flexible(
                            flex: 96,
                            child: hTap(
                              context,
                              Text(
                                '《用户服务协议》',
                                style: hts(12, Color(0xFF1E63AE), lh: 18),
                              ),
                              label: '《用户服务协议》',
                            ),
                          ),
                          Flexible(
                            flex: 12,
                            child: Text(
                              '和',
                              style: hts(12, Color(0xFF52525B), lh: 18),
                            ),
                          ),
                          Flexible(
                            flex: 72,
                            child: hTap(
                              context,
                              Text(
                                '《隐私政策》',
                                style: hts(12, Color(0xFF1E63AE), lh: 18),
                              ),
                              label: '《隐私政策》',
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.start,
                        gap: 8,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 16,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: hts(13, Color(0xFF71717A)),
                    children: [
                      TextSpan(
                        text: '已有账号？',
                        style: hts(13, Color(0xFF71717A)),
                      ),
                      TextSpan(
                        text: '去登录',
                        style: hts(13, Color(0xFF1E63AE), w: FontWeight.w500),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.stretch,
              gap: 16,
            ),
          ),
        ],
        main: MainAxisAlignment.start,
        cross: CrossAxisAlignment.stretch,
        gap: 0,
      ),
      overlays: [
        HBottomDock(
          child: hbox(
            bg: Color.fromRGBO(255, 255, 255, 0.94),
            shadow: [
              BoxShadow(
                color: Color(0xFFE4E4E7),
                offset: Offset(0, -1),
                blurRadius: 0,
                spreadRadius: 0,
              ),
            ],
            pad: EdgeInsets.fromLTRB(20, 12, 20, bottomInset(context)),
            child: hrow(
              [
                Expanded(
                  flex: 1,
                  child: hTap(
                    context,
                    hbox(
                      h: 50,
                      bg: Color(0xFF0485F7),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '下一步',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'RegShop',
                  ),
                ),
              ],
              main: MainAxisAlignment.start,
              cross: CrossAxisAlignment.center,
              gap: 10,
            ),
          ),
        ),
      ],
    );
  }
}
