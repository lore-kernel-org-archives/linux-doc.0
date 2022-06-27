Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A06C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jun 2022 04:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiF0E2A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 00:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiF0E2A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 00:28:00 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C5838B5
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 21:27:59 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a2so14503079lfg.5
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 21:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pivUvcBBcCmDTGLpUiQdYXchwqSHkHsexFGPGX19ru0=;
        b=jl9DydycvVidmZQJErRZe74MX3eUSbabnbgTQXYsLgK88mnPXcDQeC7i4QjavLcAHi
         q9NFbQHYUA5J1ms+CNS/f0P9puiyHfY06XWSkszHQ+/nRkAe7spGOPZ0c27//ahKO3kF
         nvjaeh1m+mZ9NA0ZH06Y8H/mAIHpU3KWS9qZLxOcpOuD1auG+xKHjXsfQCuWRA6ZHDBQ
         8+2ryKt/XkKaQWTclQLjuzZ/YlQTqq3oNNGe6nK5Q53D3xMYp7Ke1UjNMyCpQ0F9s4ms
         ncmLOmXo8FHBU0wwSAjPnb0GpHh0VEyseyd/ZfuYPl1bDRfLYhLZjA1IeYVTbtGNq1KT
         Jgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pivUvcBBcCmDTGLpUiQdYXchwqSHkHsexFGPGX19ru0=;
        b=2KgBr0vCMTerN9omMaJ6tLIg+/sAP+GitI6UXyG7NZDEH5LGY9AXsJ3pJDeHoDa8u7
         Z1WCCr230Gv0QnMfSDN1S9Kpnv9NPZ6v+n7nNfLTEiK0Vx0QDL5G17m6h9a7U2+HsJi+
         1SoRJecCchMXocxxxFznYXeGfjzUbbs7CovJBHARwv0Ps0kyiMidPdOaPVbGydJq2arA
         k357oV3HDaK8paV0UZahqSetazeYkf7q92CcZkNQAjefvRyLRUXoCn+9J1hhQIjEjU2s
         ZX3q/8FFqrSKUBgVB6jbbE0o7zxovcMaZswaDOyflO+lA/0VHtPMiBv7Le+z17/AsKxh
         qX+g==
X-Gm-Message-State: AJIora/Gl/39UEUtZDeJcbTkp5c7wNSsBLLspDV8i3JV2zR3S8Ad33zf
        Et8aJsd25P4jSJgCUASI7C2yx5Qh8dPZ5ioDo68=
X-Google-Smtp-Source: AGRyM1sx3mdZWTULHxuLwO/p2iUHTYF43FvTtDfXBWvEbdbHBGNU4u4J6en2xncFaJUHYXcE6sL17AW0gX5bodQKggI=
X-Received: by 2002:ac2:5cc6:0:b0:47f:7a4b:9db8 with SMTP id
 f6-20020ac25cc6000000b0047f7a4b9db8mr7551395lfq.592.1656304077058; Sun, 26
 Jun 2022 21:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220626122210.56704-1-yizhou.tang@shopee.com>
 <20220626122210.56704-3-yizhou.tang@shopee.com> <f3ba720a-cc26-09f5-5f24-d0746eed1b64@loongson.cn>
In-Reply-To: <f3ba720a-cc26-09f5-5f24-d0746eed1b64@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 27 Jun 2022 12:27:20 +0800
Message-ID: <CAJy-Amn1D0Q97xfCQwr9Og9e4PSSkCwNAdXejVNVWX_TrqwCaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: Add mutex-design Chinese translation
To:     YanTeng Si <siyanteng@loongson.cn>
Cc:     yizhou.tang@shopee.com, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        robin.lubin@shopee.com, huangh@sea.com, "Wu X.C." <bobwxc@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMTE6MTAgQU0gWWFuVGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPiB3cm90ZToNCj4NCj4NCj4g5ZyoIDIwMjIvNi8yNiAyMDoyMiwgeWl6aG91LnRh
bmdAc2hvcGVlLmNvbSDlhpnpgZM6DQo+ID4gRnJvbTogVGFuZyBZaXpob3UgPHlpemhvdS50YW5n
QHNob3BlZS5jb20+DQo+ID4NCj4gPiBUcmFuc2xhdGUgbG9ja2luZy9tdXRleC1kZXNpZ24ucnN0
IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbmcgWWl6aG91IDx5aXpo
b3UudGFuZ0BzaG9wZWUuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3RyYW5zbGF0aW9ucy96aF9D
Ti9sb2NraW5nL2luZGV4LnJzdCAgICAgIHwgICAyICstDQo+ID4gICAuLi4vemhfQ04vbG9ja2lu
Zy9tdXRleC1kZXNpZ24ucnN0ICAgICAgICAgICAgfCAxNDQgKysrKysrKysrKysrKysrKysrDQo+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
bG9ja2luZy9tdXRleC1kZXNpZ24ucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbG9ja2luZy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9sb2NraW5nL2luZGV4LnJzdA0KPiA+IGluZGV4IDc2YThiZTli
Zjc4Yi4uZjBiMTA3MDc2NjhkIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2xvY2tpbmcvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vbG9ja2luZy9pbmRleC5yc3QNCj4gPiBAQCAtMTQsNiArMTQsNyBA
QA0KPiA+ICAgLi4gdG9jdHJlZTo6DQo+ID4gICAgICAgOm1heGRlcHRoOiAxDQo+ID4NCj4gPiAr
ICAgIG11dGV4LWRlc2lnbg0KPiA+ICAgICAgIHNwaW5sb2Nrcw0KPiA+DQo+ID4gICBUT0RPTGlz
dDoNCj4gPiBAQCAtMjIsNyArMjMsNiBAQCBUT0RPTGlzdDoNCj4gPiAgICAgICAqIGxvY2tkZXAt
ZGVzaWduDQo+ID4gICAgICAgKiBsb2Nrc3RhdA0KPiA+ICAgICAgICogbG9ja3RvcnR1cmUNCj4g
PiAtICAgICogbXV0ZXgtZGVzaWduDQo+ID4gICAgICAgKiBydC1tdXRleC1kZXNpZ24NCj4gPiAg
ICAgICAqIHJ0LW11dGV4DQo+ID4gICAgICAgKiBzZXFsb2NrDQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2xvY2tpbmcvbXV0ZXgtZGVzaWduLnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2xvY2tpbmcvbXV0ZXgtZGVzaWduLnJz
dA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZDMx
MDE3YmY4Y2UNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vbG9ja2luZy9tdXRleC1kZXNpZ24ucnN0DQo+ID4gQEAgLTAsMCArMSwx
NDQgQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLi4g
aW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6
IERvY3VtZW50YXRpb24vbG9ja2luZy9tdXRleC1kZXNpZ24ucnN0DQo+ID4gKw0KPiA+ICs657+7
6K+ROg0KPiA+ICsNCj4gPiArICDllJDoibroiJ8gVGFuZyBZaXpob3UgPHRhbmd5ZWVjaG91QGdt
YWlsLmNvbT4NCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT0NCj4gPiAr6YCa55So5LqS5pal
6ZSB5a2Q57O757ufDQo+ID4gKz09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gKzrliJ3nqL86
DQo+ID4gKw0KPiA+ICsgIEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPg0KPiA+ICsNCj4g
PiArOuabtOaWsDoNCj4gPiArDQo+ID4gKyAgRGF2aWRsb2hyIEJ1ZXNvIDxkYXZpZGxvaHJAaHAu
Y29tPg0KPiA+ICsNCj4gPiAr5LuA5LmI5piv5LqS5pal6ZSB77yfDQo+ID4gKy0tLS0tLS0tLS0t
LS0tDQo+ID4gKw0KPiA+ICvlnKhMaW51eOWGheaguOS4re+8jOS6kuaWpemUge+8iG11dGV477yJ
5oyH55qE5piv5LiA5Liq54m55q6K55qE5Yqg6ZSB5Y6f6K+t77yM5a6D5Zyo5YWx5Lqr5YaF5a2Y
57O757uf5LiKDQo+ID4gK+W8uuWItuS/neivgeW6j+WIl+WMlu+8jOiAjOS4jeS7heS7heaYr+aM
h+WcqOWtpuacr+eVjOaIluexu+S8vOeahOeQhuiuuuaVmeenkeS5puS4reWHuueOsOeahOmAmueU
qOacr+ivreKAnOebuOS6kg0KPiA+ICvmjpLmlqXigJ3jgILkupLmlqXplIHmmK/kuIDnp43nnaHn
nKDplIHvvIzlroPnmoTooYzkuLrnsbvkvLzkuo7kuozov5vliLbkv6Hlj7fph4/vvIhzZW1hcGhv
cmVz77yJ77yM5ZyoDQo+ID4gKzIwMDblubTooqvlvJXlhaXml7ZbMV3vvIzkvZzkuLrlkI7ogIXn
moTmm7/ku6Plk4HjgILov5nnp43mlrDnmoTmlbDmja7nu5PmnoTmj5DkvpvkuoborrjlpJrkvJjn
grnvvIzljIXmi6zmm7QNCj4gPiAr566A5Y2V55qE5o6l5Y+j77yM5Lul5Y+K5Zyo5b2T5pe25pu0
5bCR55qE5Luj56CB6YeP77yI6KeB5Yqj5Yq/77yJ44CCDQo+ID4gKw0KPiA+ICtbMV0gaHR0cHM6
Ly9sd24ubmV0L0FydGljbGVzLzE2NDgwMi8NCj4gPiArDQo+ID4gK+WunueOsA0KPiA+ICstLS0t
DQo+ID4gKw0KPiA+ICvkupLmlqXplIHnlLHigJxzdHJ1Y3QgbXV0ZXjigJ3ooajnpLrvvIzlnKhp
bmNsdWRlL2xpbnV4L211dGV4LmjkuK3lrprkuYnvvIzlubblnKgNCj4gPiAra2VybmVsL2xvY2tp
bmcvbXV0ZXguY+S4reWunueOsOOAgui/meS6m+mUgeS9v+eUqOS4gOS4quWOn+WtkOWPmOmHj++8
iC0+b3duZXLvvInmnaXot5/ouKoNCj4gPiAr5a6D5Lus55Sf5ZG95ZGo5pyf5YaF55qE6ZSB54q2
5oCB44CC5a2X5q61b3duZXLlrp7pmYXkuIrljIXlkKvnmoTmmK/mjIflkJHlvZPliY3plIHmiYDm
nInogIXnmoQNCj4gPiArYHN0cnVjdCB0YXNrX3N0cnVjdCAqYCDmjIfpkojvvIzlm6DmraTlpoLm
npzml6DkurrmjIHmnInplIHvvIzliJnlroPnmoTlgLzkuLrnqbrvvIhOVUxM77yJ44CCDQo+ID4g
K+eUseS6jnRhc2tfc3RydWN055qE5oyH6ZKI6Iez5bCR5oyJTDFfQ0FDSEVfQllURVPlr7npvZDv
vIzkvY7kvY3vvIgz77yJ6KKr55So5p2l5a2Y5YKo6aKd5aSWDQo+ID4gK+eahOeKtuaAge+8iOS+
i+Wmgu+8jOetieW+heiAheWIl+ihqOmdnuepuu+8ieOAguWcqOWFtuacgOWfuuacrOeahOW9ouW8
j+S4re+8jOWug+i/mOWMheaLrOS4gOS4quetieW+hemYn+WIl+WSjA0KPiA+ICvkuIDkuKrnoa7k
v53lr7nlhbbluo/liJfljJborr/pl67nmoToh6rml4vplIHjgILmraTlpJbvvIxDT05GSUdfTVVU
RVhfU1BJTl9PTl9PV05FUj1555qEDQo+ID4gK+ezu+e7n+S9v+eUqOS4gOS4quiHquaXi01DU+mU
ge+8iC0+b3Nx77yM6K+R5rOo77yaTUNT5piv5Lik5Liq5Lq65ZCN55qE5ZCI5bm257yp5YaZ77yJ
77yM5Zyo5LiL5paH55qEDQo+ID4gK++8iGlp77yJ5Lit5o+P6L+w44CCDQo+ID4gKw0KPiA+ICvl
h4blpIfojrflvpfkuIDmioroh6rml4vplIHml7bvvIzmnInkuInnp43lj6/og73nu4/ov4fnmoTo
t6/lvoTvvIzlj5blhrPkuo7plIHnmoTnirbmgIHvvJoNCj4gPiArDQo+ID4gKyhpKSDlv6vpgJ/o
t6/lvoTvvJror5Xlm77pgJrov4fosIPnlKhjbXB4Y2hnKCnkv67mlLnplIHnmoTmiYDmnInogIXk
uLrlvZPliY3ku7vliqHvvIzku6XmraTljp/lrZDljJblnLANCj4gPiArICAgIOiOt+WPlumUgeOA
gui/meWPquWcqOaXoOernuS6ieeahOaDheWGteS4i+acieaViO+8iGNtcHhjaGcoKeajgOafpeWA
vOaYr+WQpuS4ujDvvIzmiYDku6Uz5Liq54q25oCBDQo+ID4gKyAgICDmr5Tnibnlv4XpobvkuLow
77yJ44CC5aaC5p6c6ZSB5aSE5Zyo56ue5LqJ54q25oCB77yM5Luj56CB6L+b5YWl5LiL5LiA5Liq
5Y+v6IO955qE6Lev5b6E44CCDQo+ID4gKw0KPiA+ICsoaWkpIOS4remAn+i3r+W+hO+8muS5n+Ww
seaYr+S5kOinguiHquaXi++8jOW9k+mUgeeahOaJgOacieiAheato+WcqOi/kOihjOW5tuS4lOay
oeacieWFtuWug+S8mOWFiOe6p+abtOmrmOeahA0KPiA+ICsgICAgIOS7u+WKoe+8iG5lZWRfcmVz
Y2hlZO+8jOmcgOimgemHjeaWsOiwg+W6pu+8ieWHhuWkh+i/kOihjOaXtu+8jOW9k+WJjeS7u+WK
oeivleWbvuiHquaXi+adpeiOt+W+lw0KPiA+ICsgICAgIOmUgeOAguWOn+eQhuaYr++8jOWmguae
nOmUgeeahOaJgOacieiAheato+WcqOi/kOihjO+8jOWug+W+iOWPr+iDveS4jeS5heWwseS8mumH
iuaUvumUgeOAguS6kuaWpemUgeiHquaXi+S9kw0KPiA+ICsgICAgIOS9v+eUqE1DU+mUgeaOkumY
n++8jOi/meagt+WPquacieS4gOS4quiHquaXi+S9k+WPr+S7peernuS6ieS6kuaWpemUgeOAgg0K
PiA+ICsNCj4gPiArICAgICBNQ1PplIHvvIjnlLFNZWxsb3ItQ3J1bW1leeWSjFNjb3R05o+Q5Ye6
77yJ5piv5LiA5Liq566A5Y2V55qE6Ieq5peL6ZSB77yM5a6D5YW35pyJ5LiA5LqbDQo+ID4gKyAg
ICAg55CG5oOz55qE54m55oCn77yM5q+U5aaC5YWs5bmz77yM5Lul5Y+K5q+P5LiqQ1BV5Zyo6K+V
5Zu+6I635b6X6ZSB5pe25Zyo5LiA5Liq5pys5Zyw5Y+Y6YeP5LiK6Ieq5peL44CCDQo+ID4gKyAg
ICAg5a6D6YG/5YWN5LqG5bi46KeB55qE4oCc5qOA5rWLLeiuvue9ruKAneiHquaXi+mUgeWunueO
sOWvvOiHtOeahOaYgui0teeahOe8k+WtmOe6v+i3s+i3g++8iGNhY2hlbGluZQ0KPg0KPiBob3cg
YWJvdXQgOg0KPg0KPiDlr7zoh7TnmoTnvJPlrZjooYzot7Pot4PvvIhjYWNoZWxpbmUgYm91bmNp
bmfvvInov5nnp43mmILotLXnmoTlvIDplIDvvJ8NCg0KQm90aCBsb29rIGZpbmUuIGFuZCBtYXkg
d2UgZG9uJ3QgaGF2ZSBhIGJldHRlciB3YXkgdG8gcmVmbGVjdCB0aGUgZmFjdA0KY2FjaGUgYm91
bmNpbmcgYmV0d2VlbiBjcHVzPw0KQW55d2F5LA0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFs
ZXhzQGtlcm5lbC5vcmc+DQo=
