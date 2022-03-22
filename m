Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F12C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiCVHrh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiCVHr3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:47:29 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C19738BF8
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:45:27 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id q11so19294486iod.6
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zQuT1g/1VLcIPgsyZmSTDIEDUiUizrooDw6U1o00FaI=;
        b=gtUrGnhK7nmDEpV049O3gFQq8hXE0ACKS3QXncKGFGQ7N5RjX4J5kV5/BzFVGmxpCG
         b5JzmwrhZDfBSyUCLHGS0vvCmnZ8hRIqZxsiotw0MTlkFF3ODgdXb4cBI8gc9Cxtt8F2
         WmZMHi0LHCoKSPjue4kHzTuJr158nz8axtGy1/zQqSwz8f7OjyvnarpB3xNJbYe5o3X6
         VvMMzWnRPVw7TzJwXz4Q77u6ixFnCjTlBAIAjh9GQbyZr6AhVXkHv7MIvVv0Wb6hzgR9
         SSTPz2nWENRgV7+23q71/y7raL8PK65+6bW+77EoR1MDseeVI+TKJzJVY1J2TdvH6oNG
         Q5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zQuT1g/1VLcIPgsyZmSTDIEDUiUizrooDw6U1o00FaI=;
        b=si9AottfsRxrbIHjIMAx0tJnGO9J8Yp0LzKuLgCcp04nOQRhNZXd20tTonKoDT92A4
         /d0fmqXIii0dycuwASMeec5AwcKcSgqwbGm5jsXJKyjO6/QX203aeaWN03ZnNwLYD8qn
         T9CNwGtUKCs9o//oK1D3+feFNtzDV2sFrn8eZM/ce+DIi6DEdNz0QC8+Gj93RFuLYXk5
         PEOA+jR4ktH7oyXEPFeVF9qaveE1e47JNLV6dStOt4EzCH66Mwt3UYPlpEEM4wasnRNf
         QgJLmTeFsnIHxBbatpSABievRiIUvXO4LxqKslfX2jZXYGjiBUdGk0QhD6IAK2kjYpUj
         SWyA==
X-Gm-Message-State: AOAM531O1wVEGxwb34EeYLTwjBqSnPWa8yqwlnjRXdEEjX0OJEpMbLXX
        oQLSyHHIHSJpMjwcOZVjmRZLBRZHnlXMJKpmmNc=
X-Google-Smtp-Source: ABdhPJwYF3sGYmyWAF47TlpXB/jBpwzZVZjCj5xuh9YA2jOrWGxCqSKJ7/1SbkPiUfyYHC/y+GFJyVlxkM4lE2+wx30=
X-Received: by 2002:a02:3501:0:b0:314:48d3:2d6b with SMTP id
 k1-20020a023501000000b0031448d32d6bmr11990239jaa.169.1647935126700; Tue, 22
 Mar 2022 00:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <65bfa72047bf00c645b7dae316bfde43310aae4d.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <65bfa72047bf00c645b7dae316bfde43310aae4d.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:44:50 +0800
Message-ID: <CAJy-AmnXcgCYUZ8AVMS1xVRj=mT5XhPsnNF97O7rz1-BZygXtg@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] docs/zh_CN: add vm split_page_table_lock translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vc3BsaXRfcGFnZV90YWJsZV9sb2NrLnJzdCBp
bnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0K
DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0
IHwgIDIgKy0NCj4gIC4uLi96aF9DTi92bS9zcGxpdF9wYWdlX3RhYmxlX2xvY2sucnN0ICAgICAg
ICB8IDk2ICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3NwbGl0X3BhZ2VfdGFibGVfbG9jay5yc3QNCj4NCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBpbmRl
eCAzZTRmNGNhYzUwOWMuLjhjN2QwYjFlNWMzZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBAQCAtMzYsNiArMzYsNyBAQCBUT0RP
OuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWk
hO+8iQ0KPiAgICAgcGFnZV9vd25lcg0KPiAgICAgcGFnZV90YWJsZV9jaGVjaw0KPiAgICAgcmVt
YXBfZmlsZV9wYWdlcw0KPiArICAgc3BsaXRfcGFnZV90YWJsZV9sb2NrDQo+DQo+ICBUT0RPTElT
VDoNCj4gICogYXJjaF9wZ3RhYmxlX2hlbHBlcnMNCj4gQEAgLTQ1LDcgKzQ2LDYgQEAgVE9ET0xJ
U1Q6DQo+ICAqIG51bWENCj4gICogcGFnZV9taWdyYXRpb24NCj4gICogc2x1Yg0KPiAtKiBzcGxp
dF9wYWdlX3RhYmxlX2xvY2sNCj4gICogdHJhbnNodWdlDQo+ICAqIHVuZXZpY3RhYmxlLWxydQ0K
PiAgKiB2bWFsbG9jZWQta2VybmVsLXN0YWNrcw0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdm0vc3BsaXRfcGFnZV90YWJsZV9sb2NrLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3NwbGl0X3BhZ2VfdGFibGVfbG9jay5yc3QN
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi41MDY5NGQ5N2M0
MjYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi92bS9zcGxpdF9wYWdlX3RhYmxlX2xvY2sucnN0DQo+IEBAIC0wLDAgKzEsOTYgQEANCj4g
KzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92bS9zcGxpdF9wYWdlX3RhYmxlX2xvY2sucnN0DQo+
ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5n
QGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KPiAr5YiG6aG16KGo6ZSB77yIc3BsaXQgcGFnZSB0YWJs
ZSBsb2Nr77yJDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiAr
5pyA5Yid77yMbW0tPnBhZ2VfdGFibGVfbG9jayBzcGlubG9ja+S/neaKpOS6hm1tX3N0cnVjdOea
hOaJgOaciemhteihqOOAguS9huaYr+i/meenjeaWuQ0KPiAr5rOV5a+86Ie05LqG5aSa57q/56iL
5bqU55So56iL5bqP55qE57y66aG15byC5bi45Y+v5omp5bGV5oCn5beu77yM5Zug5Li65a+56ZSB
55qE5LqJ5aS65b6I5r+A54OI44CC5Li65LqG5o+Q6auY5Y+v5ompDQo+ICvlsZXmgKfvvIzmiJHk
u6zlvJXlhaXkuobliIbpobXooajplIHjgIINCj4gKw0KPiAr5pyJ5LqG5YiG6aG16KGo6ZSB77yM
5oiR5Lus5bCx5pyJ5LqG5Y2V54us55qE5q+P5byg6KGo6ZSB5p2l6aG65bqP5YyW5a+56KGo55qE
6K6/6Zeu44CC55uu5YmN77yM5oiR5Lus5a+5UFRF5ZKMDQo+ICtQTUTooajkvb/nlKjliIbpobXp
lIHjgILlr7npq5jlsYLooajnmoTorr/pl67nlLFtbS0+cGFnZV90YWJsZV9sb2Nr5L+d5oqk44CC
DQo+ICsNCj4gK+acieS4gOS6m+i+heWKqeW3peWFt+adpemUgeWumi/op6PplIHkuIDkuKrooajl
kozlhbbku5borr/pl67lmajlh73mlbA6DQo+ICsNCj4gKyAtIHB0ZV9vZmZzZXRfbWFwX2xvY2so
KQ0KPiArICAgICAgIOaYoOWwhHB0ZeW5tuiOt+WPllBUReihqOmUge+8jOi/lOWbnuaJgOWPlumU
geeahOaMh+mSiO+8mw0KPiArIC0gcHRlX3VubWFwX3VubG9jaygpDQo+ICsgICAgICAg6Kej6ZSB
5ZKM6Kej5pig5bCEUFRF6KGo77ybDQo+ICsgLSBwdGVfYWxsb2NfbWFwX2xvY2soKQ0KPiArICAg
ICAgIOWmguaenOmcgOimgeeahOivne+8jOWIhumFjVBUReihqOW5tuiOt+WPlumUge+8jOWmguae
nOWIhumFjeWksei0pe+8jOi/lOWbnuW3suiOt+WPlueahOmUgeeahOaMh+mSiA0KPiArICAgICAg
IOaIlk5VTEzvvJsNCj4gKyAtIHB0ZV9sb2NrcHRyKCkNCj4gKyAgICAgICDov5Tlm57mjIflkJFQ
VEXooajplIHnmoTmjIfpkojvvJsNCj4gKyAtIHBtZF9sb2NrKCkNCj4gKyAgICAgICDlj5blvpdQ
TUTooajplIHvvIzov5Tlm57miYDlj5bplIHnmoTmjIfpkojjgIINCj4gKyAtIHBtZF9sb2NrcHRy
KCkNCj4gKyAgICAgICDov5Tlm57mjIflkJFQTUTooajplIHnmoTmjIfpkojvvJsNCj4gKw0KPiAr
5aaC5p6cQ09ORklHX1NQTElUX1BUTE9DS19DUFVT77yI6YCa5bi45Li6NO+8ieWwj+S6juaIluet
ieS6jk5SX0NQVVPvvIzliJnlnKjnvJbor5ENCj4gK+aXtuWQr+eUqFBUReihqOeahOWIhumhteih
qOmUgeOAguWmguaenOWIhumhtemUgeiiq+emgeeUqO+8jOaJgOacieeahOihqOmDveeUsW1tLT5w
YWdlX3RhYmxlX2xvY2sNCj4gK+adpeS/neaKpOOAgg0KPiArDQo+ICvlpoLmnpxQTUTooajlkK/n
lKjkuobliIbpobXplIHvvIzlubbkuJTmnrbmnoTmlK/mjIHlroPvvIzpgqPkuYhQTUTooajnmoTl
iIbpobXplIHlsLHkvJrooqvlkK/nlKjvvIjop4ENCj4gK+S4i+aWh++8ieOAgg0KPiArDQo+ICtI
dWdldGxiIOWSjOWIhumhteihqOmUgQ0KPiArPT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK0h1
Z2V0bGLlj6/ku6XmlK/mjIHlpJrnp43pobXpnaLlpKflsI/jgILmiJHku6zlj6rlr7lQTUTnuqfl
iKvkvb/nlKjliIbpobXplIHvvIzkvYbkuI3lr7lQVUTkvb/nlKjjgIINCj4gKw0KPiArSHVnZXRs
YueJueWumueahOi+heWKqeWHveaVsDoNCj4gKw0KPiArIC0gaHVnZV9wdGVfbG9jaygpDQo+ICsg
ICAgICAg5a+5UE1EX1NJWkXpobXpnaLph4flj5ZwbWTliIblibLplIHvvIzlkKbliJltbS0+cGFn
ZV90YWJsZV9sb2Nr77ybDQo+ICsgLSBodWdlX3B0ZV9sb2NrcHRyKCkNCj4gKyAgICAgICDov5Tl
m57mjIflkJHooajplIHnmoTmjIfpkojjgIINCj4gKw0KPiAr5p625p6E5a+55YiG6aG16KGo6ZSB
55qE5pSv5oyBDQo+ICs9PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICvmsqHmnInlv4XopoHn
ibnliKvlkK/nlKhQVEXliIbpobXooajplIHvvJrmiYDmnInpnIDopoHnmoTkuJzopb/pg73nlLFw
Z3RhYmxlX3B0ZV9wYWdlX2N0b3IoKQ0KPiAr5ZKMcGd0YWJsZV9wdGVfcGFnZV9kdG9yKCnlrozm
iJDvvIzlroPku6zlv4XpobvlnKhQVEXooajliIbphY0v6YeK5pS+5pe26KKr6LCD55So44CCDQo+
ICsNCj4gK+ehruS/neaetuaehOS4jeS9v+eUqHNsYWLliIbphY3lmajmnaXliIbphY3pobXooajv
vJpzbGFi5L2/55SocGFnZS0+c2xhYl9jYWNoZeadpeWIhumFjeWFtumhtQ0KPiAr6Z2i44CC6L+Z
5Liq5Yy65Z+f5LiOcGFnZS0+cHRs5YWx5Lqr5a2Y5YKo44CCDQo+ICsNCj4gK1BNROWIhumhtemU
geWPquacieWcqOS9oOacieS4pOS4quS7peS4iueahOmhteihqOe6p+WIq+aXtuaJjeacieaEj+S5
ieOAgg0KPiArDQo+ICvlkK/nlKhQTUTliIbpobXplIHpnIDopoHlnKhQTUTooajliIbphY3ml7bo
sIPnlKhwZ3RhYmxlX3BtZF9wYWdlX2N0b3IoKe+8jOWcqOmHiuaUvuaXtuiwgw0KPiAr55SocGd0
YWJsZV9wbWRfcGFnZV9kdG9yKCnjgIINCj4gKw0KPiAr5YiG6YWN6YCa5bi45Y+R55Sf5ZyocG1k
X2FsbG9jX29uZSgp5Lit77yM6YeK5pS+5Y+R55Sf5ZyocG1kX2ZyZWUoKeWSjHBtZF9mcmVlX3Rs
YigpDQo+ICvkuK3vvIzkvYbopoHnoa7kv53opobnm5bmiYDmnInnmoRQTUTooajliIbphY0v6YeK
5pS+6Lev5b6E77ya5Y2zWDg2X1BBReWcqHBnZF9hbGxvYygp5Lit6aKE5YWIDQo+ICvliIbphY3k
uIDkuptQTUTjgIINCj4gKw0KPiAr5LiA5YiH5bCx57uq5ZCO77yM5L2g5Y+v5Lul6K6+572uQ09O
RklHX0FSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0vjgIINCj4gKw0KPiAr5rOo5oSP77yacGd0
YWJsZV9wdGVfcGFnZV9jdG9yKCnlkoxwZ3RhYmxlX3BtZF9wYWdlX2N0b3IoKeWPr+iDveWksei0
pS0t5b+FDQo+ICvpobvmraPnoa7lpITnkIbjgIINCj4gKw0KPiArcGFnZS0+cHRsDQo+ICs9PT09
PT09PT0NCj4gKw0KPiArcGFnZS0+cHRs55So5LqO6K6/6Zeu5YiG5Ymy6aG16KGo6ZSB77yM5YW2
5LitJ3BhZ2Un5piv5YyF5ZCr6K+l6KGo55qE6aG16Z2ic3RydWN0IHBhZ2XjgILlroMNCj4gK+S4
jnBhZ2UtPnByaXZhdGXvvIjku6Xlj4p1bmlvbuS4reeahOWFtuS7luWHoOS4quWtl+aute+8ieWF
seS6q+WtmOWCqOOAgg0KPiArDQo+ICvkuLrkuobpgb/lhY3lop7liqBzdHJ1Y3QgcGFnZeeahOWk
p+Wwj+W5tuiOt+W+l+acgOS9s+aAp+iDve+8jOaIkeS7rOS9v+eUqOS6huS4gOS4quaKgOW3pzoN
Cj4gKw0KPiArIC0g5aaC5p6cc3BpbmxvY2tfdOmAguWQiOS6jmxvbmfvvIzmiJHku6zkvb/nlKhw
YWdlLT5wdHLkvZzkuLpzcGlubG9ja++8jOi/meagt+aIkeS7rA0KPiArICAg5bCx5Y+v5Lul6YG/
5YWN6Ze05o6l6K6/6Zeu5bm26IqC55yB5LiA5Liq57yT5a2Y6KGM44CCDQo+ICsgLSDlpoLmnpxz
cGlubG9ja19055qE5aSn5bCP5aSn5LqObG9uZ+eahOWkp+Wwj++8jOaIkeS7rOS9v+eUqHBhZ2Ut
PnB0bOS9nOS4unNwaW5sb2NrX3QNCj4gKyAgIOeahOaMh+mSiOW5tuWKqOaAgeWIhumFjeWug+OA
gui/meWFgeiuuOWcqOWQr+eUqERFQlVHX1NQSU5MT0NL5oiWREVCVUdfTE9DS19BTExPQ+eahA0K
PiArICAg5oOF5Ya15LiL5L2/55So5YiG6aG16ZSB77yM5L2G55Sx5LqO6Ze05o6l6K6/6Zeu6ICM
5aSa6Iqx5LqG5LiA5Liq57yT5a2Y6KGM44CCDQo+ICsNCj4gK1BUReihqOeahHNwaW5sb2NrX3Tl
iIbphY3lnKhwZ3RhYmxlX3B0ZV9wYWdlX2N0b3IoKeS4re+8jFBNROihqOeahHNwaW5sb2NrX3QN
Cj4gK+WIhumFjeWcqHBndGFibGVfcG1kX3BhZ2VfY3Rvcigp5Lit44CCDQo+ICsNCj4gK+ivt+S4
jeimgeebtOaOpeiuv+mXrnBhZ2UtPnB0bCAtIC3kvb/nlKjpgILlvZPnmoTovoXliqnlh73mlbDj
gIINCj4gLS0NCj4gMi4yNy4wDQo+DQo=
