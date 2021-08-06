Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F368C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42C3661184
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242089AbhHFCNJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236885AbhHFCNJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:13:09 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F241FC061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:12:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x8so14959914lfe.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q6cVBQGwLwfrxms1OeI4TKKN8a2WefXLWI/0+y/fX/Q=;
        b=YOeto2nw4wMul1kOr471UlNn84IXkXZV2jQuCDjVTS/Ub4Uq/ytObcdtm3/CyHDVlP
         1qs1t7fe0WWIW1sp2RA5ORyMLY9jcxKwZqMEZjpkgjjhG5QXwjU40X7RYWdIJJ3vtHhm
         7A3+mkXEFgZaWu7Q9t4RVDalKSl4yDHECWHHLrU6FKpJESlN5okjhW73n2VygTJJpN7P
         GJPMH75UPhYrIQ+tcetKn273YwhEkvFGpCTtLtyJ0cUbJ/5e4aj/iwUPTgt/U3HAmOEy
         Htp69+kr2Qja7NFtqqcanle8cRgRy34xiN/8v8WOiDtlTJDu0ejxy92nAWo5WZf9XMbx
         vAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q6cVBQGwLwfrxms1OeI4TKKN8a2WefXLWI/0+y/fX/Q=;
        b=gd9maVCMXYW6BCYOK2IE4Q3z06vUsXo5AgVtm4MWIZm04euR0v+uFOoBDdSVVTKx5L
         wdKhke6K3Bq1O9XpmpZJFktL6IdxMqOLuKsvKL03FpC6lfgFBOmG4uUXxThFpIEbOauQ
         FqbfxNpLJ8aFlyQfeO1F5BQczlbI106PfSsak5vL23YMmirYxetdfHWkV98Jn2r4ayM0
         lbRny7pEQrWFznOeBBTTboJFjqilgJbKvCTdYwjAjOGyqMEsDG/1Mup+f76Ays/3ZZOR
         JUEZ3wF/pjBCJ3bVCFa+Cvjl7TgrO/h1qzxwk83C9YPD95Ut23m/7MG6oyc3cn6LS3+o
         KLmA==
X-Gm-Message-State: AOAM530uYPMUdhNm3lwpIipQr+7sPxBynws8TP9nCycJe7KwdLmjdfoZ
        OSxBqHTy3i+Cdsf32vC9t7pRrrERVDLnK1CJFyY=
X-Google-Smtp-Source: ABdhPJxAbJDFXs68AdT6Mx5er2aytWH6MYzoZat84QWh95Iuf/2GoBlm3G/4csa6CKWPY3b8/1MaFD9SlCNvOkEC4Mc=
X-Received: by 2002:a05:6512:239e:: with SMTP id c30mr3864453lfv.417.1628215971369;
 Thu, 05 Aug 2021 19:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <c7b4cc2c6aba739f777cef80dd527ae523c3d9e5.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <c7b4cc2c6aba739f777cef80dd527ae523c3d9e5.1627820210.git.siyanteng@loongson.cn>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Fri, 6 Aug 2021 02:12:40 +0000
Message-ID: <CADQR0QiA9EFrKZz8CMtOAqzOcGg_MRTykuH475b+1Ou9NX2xyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] docs/zh_CN: add infiniband core_locking translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, chenweiguang82@126.com,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCAxMjoyNSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9pbmZpbmliYW5k
L2NvcmVfbG9ja2luZy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50
ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQpSZXZpZXdlZC1ieTogUHV5dSBXYW5nIDxy
ZWFscHV5dXdhbmdAZ21haWwuY29tPg0KPiAtLS0NCj4gIC4uLi96aF9DTi9pbmZpbmliYW5kL2Nv
cmVfbG9ja2luZy5yc3QgICAgICAgICB8IDExNSArKysrKysrKysrKysrKysrKysNCj4gIC4uLi90
cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC9pbmRleC5yc3QgICB8ICAgMyArLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQv
Y29yZV9sb2NraW5nLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vaW5maW5pYmFuZC9jb3JlX2xvY2tpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC9jb3JlX2xvY2tpbmcucnN0DQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDJmMDgwMzhkNDRiDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5p
YmFuZC9jb3JlX2xvY2tpbmcucnN0DQo+IEBAIC0wLDAgKzEsMTE1IEBADQo+ICsNCj4gKy4uIGlu
Y2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3Vt
ZW50YXRpb24vaW5maW5pYmFuZC9jb3JlX2xvY2tpbmcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+
ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAr
DQo+ICs65qCh6K+ROg0KPiArDQo+ICsg546L5pmu5a6HIFB1eXUgV2FuZyA8cmVhbHB1eXV3YW5n
QGdtYWlsLmNvbT4NCj4gKyDml7blpY7kuq4gQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+
ICsNCj4gKy4uIF9jbl9pbmZpbmliYW5kX2NvcmVfbG9ja2luZzoNCj4gKw0KPiArPT09PT09PT09
PT09PT09PT09DQo+ICtpbmZpbmliYW5k5Lit6Ze05bGC6ZSBDQo+ICs9PT09PT09PT09PT09PT09
PT0NCj4gKw0KPiArICDmnKzmjIfljZfor5Xlm77mmI7noa5pbmZpbmliYW5k5Lit6Ze05bGC55qE
6ZSB5YGH6K6+44CC5a6D5o+P6L+w5LqG5a+55L2N5LqO5Lit6Ze05bGC5Lul5LiL55qE5L2ODQo+
ICsgIOe6p+mpseWKqOeoi+W6j+WSjOS9v+eUqOS4remXtOWxgueahOS4iuWxguWNj+iurueahOim
geaxguOAgg0KPiArDQo+ICvnnaHnnKDlkozkuK3mlq3njq/looMNCj4gKz09PT09PT09PT09PT09
DQo+ICsNCj4gKyAg6Zmk5LqG5Lul5LiL5byC5bi45oOF5Ya177yMaWJfZGV2aWNl57uT5p6E5L2T
5Lit5omA5pyJ5pa55rOV55qE5L2O57qn6amx5Yqo5a6e546w6YO95Y+v5Lul552h55yg44CCDQo+
ICsgIOi/meS6m+W8guW4uOaDheWGteaYr+WIl+ihqOS4reeahOS7u+aEj+eahOaWueazlToNCj4g
Kw0KPiArICAgIC0gY3JlYXRlX2FoDQo+ICsgICAgLSBtb2RpZnlfYWgNCj4gKyAgICAtIHF1ZXJ5
X2FoDQo+ICsgICAgLSBkZXN0cm95X2FoDQo+ICsgICAgLSBwb3N0X3NlbmQNCj4gKyAgICAtIHBv
c3RfcmVjdg0KPiArICAgIC0gcG9sbF9jcQ0KPiArICAgIC0gcmVxX25vdGlmeV9jcQ0KPiArDQo+
ICsgICAg5LuW5Lus5Y+v6IO95LiN5Y+v5Lul552h55yg77yM6ICM5LiU5b+F6aG75Y+v5Lul5LuO
5Lu75L2V5LiK5LiL5paH5Lit6LCD55So44CCDQo+ICsNCj4gKyAgICDlkJHkuIrlsYLljY/orq7k
vb/nlKjogIXovpPlh7rnmoTnm7jlupTlh73mlbA6DQo+ICsNCj4gKyAgICAtIHJkbWFfY3JlYXRl
X2FoDQo+ICsgICAgLSByZG1hX21vZGlmeV9haA0KPiArICAgIC0gcmRtYV9xdWVyeV9haA0KPiAr
ICAgIC0gcmRtYV9kZXN0cm95X2FoDQo+ICsgICAgLSBpYl9wb3N0X3NlbmQNCj4gKyAgICAtIGli
X3Bvc3RfcmVjdg0KPiArICAgIC0gaWJfcmVxX25vdGlmeV9jcQ0KPiArDQo+ICsgICAg5Zug5q2k
77yM5Zyo5Lu75L2V5oOF5Ya15LiL6YO95Y+v5Lul5a6J5YWo6LCD55So77yI5a6D5Lus77yJ44CC
DQo+ICsNCj4gKyAg5q2k5aSW77yM6K+l5Ye95pWwDQo+ICsNCj4gKyAgICAtIGliX2Rpc3BhdGNo
X2V2ZW50DQo+ICsNCj4gKyAg6KKr5bqV5bGC6amx5Yqo55So5p2l6YCa6L+H5Lit6Ze05bGC6LCD
5bqm5byC5q2l5LqL5Lu255qE4oCcQeKAne+8jOS5n+WPr+S7peS7juS7u+S9leS4iuS4i+aWh+S4
reWuieWFqOiwgw0KPiArICDnlKjjgIINCj4gKw0KPiAr5Y+v6YeN5YWl5oCnDQo+ICstLS0tLS0t
LQ0KPiArDQo+ICsgIOeUseS9jue6p+mpseWKqOeoi+W6j+WvvOWHuueahGliX2RldmljZee7k+ae
hOS9k+S4reeahOaJgOacieaWueazleW/hemhu+aYr+WujOWFqOWPr+mHjeWFpeeahOOAgg0KPiAr
ICDljbPkvb/kvb/nlKjlkIzkuIDlr7nosaHnmoTlpJrkuKrlh73mlbDosIPnlKjooqvlkIzml7bo
v5DooYzvvIzkvY7nuqfpqbHliqjnqIvluo/kuZ/pnIDopoHmiafooYzmiYDmnIkNCj4gKyAg5b+F
6KaB55qE5ZCM5q2l5Lul5L+d5oyB5LiA6Ie05oCn44CCDQo+ICsNCj4gKyAgSULkuK3pl7TlsYLk
uI3miafooYzku7vkvZXlh73mlbDosIPnlKjnmoTluo/liJfljJbjgIINCj4gKw0KPiArICDlm6Dk
uLrkvY7nuqfpqbHliqjnqIvluo/mmK/lj6/ph43lhaXnmoTvvIzmiYDku6XkuI3opoHmsYLkuIrl
sYLljY/orq7kvb/nlKjogIXku7vkvZXpobrluo/miafooYzjgILnhLYNCj4gKyAg6ICM77yM5Li6
5LqG5b6X5Yiw5ZCI55CG55qE57uT5p6c77yM5Y+v6IO96ZyA6KaB5LiA5Lqb6aG65bqP44CC5L6L
5aaC77yM5LiA5Liq5L2/55So6ICF5Y+v5Lul5Zyo5aSa5LiqDQo+ICsgIENQVeS4iuWQjOaXtuWu
ieWFqOWcsOiwg+eUqGliX3BvbGxfY3EoKeOAgueEtuiAjO+8jOS4jeWQjOeahGliX3BvbGxfY3Eo
Keiwg+eUqOS5i+mXtA0KPiArICDnmoTlt6XkvZzlrozmiJDkv6Hmga/nmoTpobrluo/msqHmnIno
oqvlrprkuYnjgIINCj4gKw0KPiAr5Zue6LCDDQo+ICstLS0tDQo+ICsNCj4gKyAg5L2O57qn6amx
5Yqo56iL5bqP5LiN5b6X55u05o6l5LuO5LiOaWJfZGV2aWNl5pa55rOV6LCD55So55u45ZCM55qE
6LCD55So6ZO+5Lit5omn6KGM5Zue6LCD44CC5L6LDQo+ICsgIOWmgu+8jOS9jue6p+mpseWKqOeo
i+W6j+S4jeWFgeiuuOS7jnBvc3Rfc2VuZOaWueazleebtOaOpeiwg+eUqOS9v+eUqOiAheeahOWu
jOaIkOS6i+S7tuWkhOeQhueoiw0KPiArICDluo/jgILnm7jlj43vvIzkvY7nuqfpqbHliqjnqIvl
uo/lupTor6Xmjqjov5/ov5nkuKrlm57osIPvvIzkvovlpoLvvIzosIPluqbkuIDkuKp0YXNrbGV0
5p2l5omn6KGMDQo+ICsgIOi/meS4quWbnuiwg+OAgg0KPiArDQo+ICsgIOS9juWxgumpseWKqOi0
n+i0o+ehruS/neWQjOS4gENR55qE5aSa5Liq5a6M5oiQ5LqL5Lu25aSE55CG56iL5bqP5LiN6KKr
5ZCM5pe26LCD55So44CC6amx5Yqo56iL5bqP5b+FDQo+ICsgIOmhu+S/neivgeS4gOS4que7meWu
mueahENR55qE5LqL5Lu25aSE55CG56iL5bqP5Zyo5ZCM5LiA5pe26Ze05Y+q5pyJ5LiA5Liq5Zyo
6L+Q6KGM44CC5o2i5Y+l6K+d6K+077yMDQo+ICsgIOS7peS4i+aDheWGteaYr+S4jeWFgeiuuOea
hDo6DQo+ICsNCj4gKyAgICAgICAgICBDUFUxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ1BVMg0KPiArDQo+ICsgICAgbG93LWxldmVsIGRyaXZlciAtPg0KPiArICAgICAgY29u
c3VtZXIgQ1EgZXZlbnQgY2FsbGJhY2s6DQo+ICsgICAgICAgIC8qIC4uLiAqLw0KPiArICAgICAg
ICBpYl9yZXFfbm90aWZ5X2NxKGNxLCAuLi4pOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbG93LWxldmVsIGRyaXZlciAtPg0KPiArICAgICAgICAvKiAuLi4g
Ki8gICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdW1lciBDUSBldmVudCBjYWxsYmFjazoN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAuLi4g
Ki8NCj4gKyAgICAgICAgcmV0dXJuIGZyb20gQ1EgZXZlbnQgaGFuZGxlcg0KPiArDQo+ICsgIOWu
jOaIkOS6i+S7tuWSjOW8guatpeS6i+S7tuWbnuiwg+eahOi/kOihjOeOr+Wig+ayoeacieiiq+Wu
muS5ieOAgiDmoLnmja7kvY7nuqfliKvnmoTpqbHliqjnqIvluo/vvIzlroPlj6/og73mmK8NCj4g
KyAg6L+b56iL5LiK5LiL5paH44CBc29mdGlyceS4iuS4i+aWh+aIluS4reaWreS4iuS4i+aWh+OA
guS4iuWxguWNj+iuruS9v+eUqOiAheWPr+iDveS4jeS8muWcqOWbnuiwg+S4reedoeecoOOAgg0K
PiArDQo+ICvng63mj5Lmi5QNCj4gKy0tLS0tLQ0KPiArDQo+ICsgIOW9k+S4gOS4quS9jue6p+mp
seWKqOeoi+W6j+iwg+eUqGliX3JlZ2lzdGVyX2RldmljZSgp5pe277yM5a6D5a6j5biD5LiA5Liq
6K6+5aSH5bey57uPDQo+ICsgIOWHhuWkh+WlveS+m+S9v+eUqOiAheS9v+eUqO+8jOaJgOacieea
hOWIneWni+WMluW/hemhu+WcqOi/meS4quiwg+eUqOS5i+WJjeWujOaIkOOAguiuvuWkh+W/hemh
u+S/nQ0KPiArICDmjIHlj6/nlKjvvIznm7TliLDpqbHliqjlr7lpYl91bnJlZ2lzdGVyX2Rldmlj
ZSgp55qE6LCD55So6L+U5Zue44CCDQo+ICsNCj4gKyAg5L2O57qn6amx5Yqo56iL5bqP5b+F6aG7
5LuO6L+b56iL5LiK5LiL5paH6LCD55SoaWJfcmVnaXN0ZXJfZGV2aWNlKCnlkowNCj4gKyAgaWJf
dW5yZWdpc3Rlcl9kZXZpY2UoKeOAguWmguaenOS9v+eUqOiAheWcqOi/meS6m+iwg+eUqOS4reWb
nuiwg+WIsOmpseWKqOeoi+W6j++8jOWugw0KPiArICDkuI3og73mjIHmnInku7vkvZXlj6/og73l
r7zoh7TmrbvplIHnmoRzZW1hcGhvcmVz44CCDQo+ICsNCj4gKyAg5LiA5pem5YW257uT5p6E5L2T
aWJfY2xpZW5055qEYWRk5pa55rOV6KKr6LCD55So77yM5LiK5bGC5Y2P6K6u5L2/55So6ICF5bCx
5Y+v5Lul5byA5aeL5L2/55SoDQo+ICsgIOS4gOS4qklC6K6+5aSH44CC5L2/55So6ICF5b+F6aG7
5Zyo5LuO56e76Zmk5pa55rOV6L+U5Zue5LmL5YmN5a6M5oiQ5omA5pyJ55qE5riF55CG5bel5L2c
5bm26YeK5pS+DQo+ICsgIOS4juiuvuWkh+ebuOWFs+eahOaJgOaciei1hOa6kOOAgg0KPiArDQo+
ICsgIOS9v+eUqOiAheiiq+WFgeiuuOWcqOWFtua3u+WKoOWSjOWIoOmZpOaWueazleS4reedoeec
oOOAgg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5m
aW5pYmFuZC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZp
bmliYW5kL2luZGV4LnJzdA0KPiBpbmRleCBlYmIxZTIwYjdkZjQuLmNjMDBmMzFjNzdkMCAxMDA2
NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC9p
bmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5p
YmFuZC9pbmRleC5yc3QNCj4gQEAgLTIyLDkgKzIyLDEwIEBAIGluZmluaWJhbmQNCj4gIC4uIHRv
Y3RyZWU6Og0KPiAgICAgOm1heGRlcHRoOiAxDQo+DQo+ICsgICBjb3JlX2xvY2tpbmcNCj4gKw0K
PiAgVE9ET0xJU1Q6DQo+DQo+IC0gICBjb3JlX2xvY2tpbmcNCj4gICAgIGlwb2liDQo+ICAgICBv
cGFfdm5pYw0KPiAgICAgc3lzZnMNCj4gLS0NCj4gMi4yNy4wDQo+DQo=
