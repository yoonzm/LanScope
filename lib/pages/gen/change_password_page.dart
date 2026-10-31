import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
                          [hsvg(Svgs.s0, w: 20, h: 20)],
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
                        '修改登录密码',
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
                                  text: '当前密码 ',
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
                                          hint: '请输入当前密码',
                                          obscure: p1.on,
                                        ),
                                      ),
                                    ),
                                    hTap(
                                      context,
                                      hPwdLabel(p1, hts(13, Color(0xFF71717A))),
                                      onTap: () => p1.flip(),
                                    ),
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
                                  text: '新密码 ',
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
                                final p2 = ctrls[0];
                                return hrow(
                                  [
                                    Expanded(
                                      child: ListenableBuilder(
                                        listenable: p2,
                                        builder: (context, _) => HInput(
                                          style: hts(
                                            15,
                                            Color(0xFF18181B),
                                            lh: 22,
                                          ),
                                          hint: '8-20 位，含字母和数字',
                                          value: 'Aa123456xy',
                                          obscure: p2.on,
                                        ),
                                      ),
                                    ),
                                    hTap(
                                      context,
                                      hPwdLabel(p2, hts(13, Color(0xFF71717A))),
                                      onTap: () => p2.flip(),
                                    ),
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
                      hcol(
                        [
                          hrow(
                            [
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 4,
                                  bg: Color(0xFF17C964),
                                  radius: BorderRadius.circular(2),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 4,
                                  bg: Color(0xFF17C964),
                                  radius: BorderRadius.circular(2),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 4,
                                  bg: Color(0xFF17C964),
                                  radius: BorderRadius.circular(2),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: hbox(
                                  h: 4,
                                  bg: Color(0xFFE4E4E7),
                                  radius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                            main: MainAxisAlignment.start,
                            cross: CrossAxisAlignment.stretch,
                            gap: 6,
                            intrinsic: true,
                          ),
                          Text(
                            '强度：强',
                            style: hts(
                              12,
                              Color(0xFF2B7745),
                              w: FontWeight.w500,
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 8,
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
                                  text: '确认新密码 ',
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
                                Expanded(
                                  child: HInput(
                                    style: hts(15, Color(0xFF18181B), lh: 22),
                                    hint: '再次输入新密码',
                                    value: 'Aa123456xy',
                                    obscure: true,
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
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 16,
                  ),
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
                      hrow(
                        [
                          hsvg(Svgs.s39, w: 14, h: 14),
                          Flexible(
                            flex: 76,
                            child: Text(
                              '长度 8–20 位',
                              style: hts(13, Color(0xFF3F3F46)),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 8,
                      ),
                      hrow(
                        [
                          hsvg(Svgs.s39, w: 14, h: 14),
                          Flexible(
                            flex: 117,
                            child: Text(
                              '同时包含字母和数字',
                              style: hts(13, Color(0xFF3F3F46)),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 8,
                      ),
                      hrow(
                        [
                          hsvg(Svgs.s39, w: 14, h: 14),
                          Flexible(
                            flex: 117,
                            child: Text(
                              '不能与当前密码相同',
                              style: hts(13, Color(0xFF3F3F46)),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 8,
                      ),
                      hrow(
                        [
                          hsvg(Svgs.s39, w: 14, h: 14),
                          Flexible(
                            flex: 117,
                            child: Text(
                              '不含手机号连续数字',
                              style: hts(13, Color(0xFF3F3F46)),
                            ),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.center,
                        gap: 8,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 8,
                  ),
                ),
                hTap(
                  context,
                  Text(
                    '忘记当前密码？用验证码重置',
                    style: hts(13, Color(0xFF1E63AE)),
                    textAlign: TextAlign.center,
                  ),
                  to: 'ChangePhone',
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
                      bg: Color(0xFF18181B),
                      radius: BorderRadius.circular(25),
                      child: Align(
                        alignment: Alignment(0, 0),
                        widthFactor: 1,
                        child: Text(
                          '确认修改',
                          style: hts(
                            15,
                            Color(0xFFFFFFFF),
                            w: FontWeight.w600,
                            lh: 22,
                          ),
                        ),
                      ),
                    ),
                    to: 'Security',
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
