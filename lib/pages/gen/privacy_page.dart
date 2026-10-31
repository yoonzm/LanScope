import 'package:flutter/material.dart';

import '../../kit/kit.dart';
import 'svgs.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HPage(
      bg: Color(0xFFF4F4F5),
      height: 887,
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
                        '隐私政策',
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
                Text('更新日期：2026 年 10 月 1 日', style: hts(12, Color(0xFF71717A))),
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
                  pad: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: hcol(
                    [
                      hcol(
                        [
                          Text(
                            '我们收集的信息',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '账号信息（手机号、姓名）、门店信息、经营数据（会员、订单、库存），以及设备信息和日志，用于登录安全与问题排查。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '如何使用',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '用于提供和改进服务、发送订单与到期等服务通知、风险控制。未经您同意，不会用于其他目的。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '存储与保护',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '数据存储在中国境内服务器，传输与存储均加密，并按最小权限控制访问。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '第三方共享',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '仅在微信通知、短信发送、支付结算、发票开具等必要场景向合作方提供所需最少信息。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '您的权利',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '您可以查询、更正、导出个人与经营数据，也可以注销账号。试用或订阅到期后数据保留 30 天。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                      hcol(
                        [
                          Text(
                            '联系我们',
                            style: hts(
                              15,
                              Color(0xFF18181B),
                              w: FontWeight.w600,
                              lh: 22,
                            ),
                          ),
                          Text(
                            '如有疑问，可通过"关于汽美管家"中的客服方式联系我们。',
                            style: hts(14, Color(0xFF3F3F46), lh: 22),
                          ),
                        ],
                        main: MainAxisAlignment.start,
                        cross: CrossAxisAlignment.stretch,
                        gap: 6,
                      ),
                    ],
                    main: MainAxisAlignment.start,
                    cross: CrossAxisAlignment.stretch,
                    gap: 18,
                  ),
                ),
                Text(
                  '以上为示意文本，上线前请替换为经法务审核的正式文本',
                  style: hts(12, Color(0xFFA1A1AA), lh: 18),
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
      overlays: [],
    );
  }
}
