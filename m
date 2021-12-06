Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE22C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 09:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239855AbhLFJGq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 04:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhLFJGq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 04:06:46 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A3BC061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 01:03:17 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id t19so20294713oij.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 01:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nIf6ZyX/BD+UThQzIdWhjY6HHtkrQ+M+GzgnfiWWRJU=;
        b=AdXd3F8MCFOEMGFzmG8nHXsD45chlguuZr7btmojKlQXmohcaXW5ZfTEmRFPlkFmNW
         18LMxr26+J6LpgeSuQmZvvlO8Ejt5tPe4SlDBx9lHZZ1HOcus1J6fc9CSWfDw2XU8XFa
         5SYyjF8Je8ZCf8XUzb4GnypN02ekkY9Jl+17XjvQyx+zRDs/oVHP+NxnGAnkydSxsXbt
         CbKqbhJoH9I/5156DUDjAArB7dOX1UI5UqeOier47VP0b0uAsGNuSq54RHV582BjLDyj
         M6y6EEeD+Oy924bDKv0jiQbhwdXS0tym7ajhXLoAKGImBNzGgQRm/kbys7HCzkEj74gx
         nIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nIf6ZyX/BD+UThQzIdWhjY6HHtkrQ+M+GzgnfiWWRJU=;
        b=1h8UlszY01HEBQ9hIiTpzFthzu3wohMBQu159uyky1Tw6Ndcq3OjRpPIJpbYD5g0CD
         ZLNbQ4ervenZLIqR7IhjZvXTaRcEWhEX+st26MyOjXhSQtf+niY2/ojke930bZc8L214
         8EPhpxULBxE1FqQ9/5NGx2AdzlzlCCm5a6H5XaHbTS2EdGeirda0aBQdO3LVnCpI4nnV
         PUzILVB038aN3QwT3jBh23+tv8HOyqbG34vejgRXI1WfrUr59QtU/QL79C8DkTDshrl2
         szAB7lU8+ghbHSqLSTasD0XkrLw2Pr7YOqrG0v1xzsemZx6WfRQ2Obc0vQda8yTz7j0p
         QNUQ==
X-Gm-Message-State: AOAM530beoZU8kBAyU4eefi0fHTzo/qOjfvPZPqAfi6EKppxB12RSEL9
        P57C+IjkN8W4vAXFH6TReDIf9P8R8srdvFQuZ+U=
X-Google-Smtp-Source: ABdhPJyFgT4Y31iw9AWjfIjSfAllX6eM2TjZ29d9BhHcKj4VzfD4AZRc0lzMsoyBzgsa2W3Jv1WjY3NM5cNF7a9rVfI=
X-Received: by 2002:a05:6808:1709:: with SMTP id bc9mr22685541oib.130.1638781396959;
 Mon, 06 Dec 2021 01:03:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638517064.git.siyanteng@loongson.cn> <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
 <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com> <35a537d9-0457-746d-7a52-897e45bd2932@huawei.com>
In-Reply-To: <35a537d9-0457-746d-7a52-897e45bd2932@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 6 Dec 2021 17:03:05 +0800
Message-ID: <CAEensMx7qmK9zvK0kgoawhMdwPWNkBrEFXNr3oHmNJEznF+YbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>,
        Yeechou Tang <tangyeechou@gmail.com>, zhengbin13@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyINuaXpeWR
qOS4gCAxNjoyNOWGmemBk++8mg0KPg0KPiBPbiAyMDIxLzEyLzYgMTY6MDEsIHlhbnRlbmcgc2kg
d3JvdGU6DQo+ID4gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPiDkuo4yMDIx5bm0
MTLmnIgz5pel5ZGo5LqUIDE2OjA05YaZ6YGT77yaDQo+ID4+DQo+ID4+IEZyb206IFlhbnRlbmcg
U2kgPHNpeWFudGVuZzAxQGdtYWlsLmNvbT4NCj4gPj4NCj4gPj4gVHJhbnNsYXRlIC4uLi9zY2hl
ZHVsZXIvc2NoZWQtYXJjaC5yc3QgaW50byBDaGluZXNlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4+IC0tLQ0KPiA+PiAg
Li4uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0ICAgIHwgIDIgKy0NCj4g
Pj4gIC4uLi96aF9DTi9zY2hlZHVsZXIvc2NoZWQtYXJjaC5yc3QgICAgICAgICAgICB8IDc2ICsr
KysrKysrKysrKysrKysrKysNCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0KPiA+Pg0KPiA+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2lu
ZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRl
eC5yc3QNCj4gPj4gaW5kZXggNWVjNzFlNjA0M2FlLi43OTdkZjNhOWM2NmYgMTAwNjQ0DQo+ID4+
IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5y
c3QNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVy
L2luZGV4LnJzdA0KPiA+PiBAQCAtMjAsMTEgKzIwLDExIEBAIExpbnV46LCD5bqm5ZmoDQo+ID4+
ICAgICAgOm1heGRlcHRoOiAxDQo+ID4+DQo+ID4+ICAgICAgY29tcGxldGlvbg0KPiA+PiArICAg
IHNjaGVkLWFyY2gNCj4gPj4NCj4gPj4NCj4gPj4gIFRPRE9MaXN0Og0KPiA+Pg0KPiA+PiAtICAg
IHNjaGVkLWFyY2gNCj4gPj4gICAgICBzY2hlZC1id2MNCj4gPj4gICAgICBzY2hlZC1kZWFkbGlu
ZQ0KPiA+PiAgICAgIHNjaGVkLWRlc2lnbi1DRlMNCj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0KPiA+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjc1NGExNWM2
YjYwZg0KPiA+PiAtLS0gL2Rldi9udWxsDQo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0KPiA+PiBAQCAtMCwwICsxLDc2
IEBADQo+ID4+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPj4gKw0K
PiA+PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0K
PiA+PiArDQo+ID4+ICs657+76K+ROg0KPiA+PiArDQo+ID4+ICsg5Y+45bu26IW+IFlhbnRlbmcg
U2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPj4gKw0KPiA+PiArOuagoeivkToNCj4gPj4g
Kw0KPiA+PiArDQo+ID4+ICsNCj4gPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
Cj4gPj4gK+aetuaehOeJueWumuS7o+eggeeahENQVeiwg+W6puWZqOWunueOsOaPkOekug0KPiA+
PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+PiArDQo+ID4+ICsgICAgICAg
TmljayBQaWdnaW4sIDIwMDUNCj4gPj4gKw0KPiA+PiAr5LiK5LiL5paH5YiH5o2iDQo+ID4+ICs9
PT09PT09PT09DQo+ID4+ICsxLiDov5DooYzpmJ/liJfplIENCj4gPj4gK+m7mOiupOaDheWGteS4
i++8jHN3aXRjaF90byBhcmNo5Ye95pWw5Zyo6LCD55So5pe26ZSB5a6a5LqG6L+Q6KGM6Zif5YiX
44CC6L+Z6YCa5bi45LiN5piv5LiA5Liq6Zeu6aKY77yM6Zmk6Z2eDQo+ID4+ICtzd2l0Y2hfdG/l
j6/og73pnIDopoHojrflj5bov5DooYzpmJ/liJfplIHjgILov5npgJrluLjmmK/nlLHkuo7kuIrk
uIvmlofliIfmjaLkuK3nmoTllKTphpLmk43kvZzpgKDmiJDnmoTjgILop4ENCj4gPj4gK2FyY2gv
aWE2NC9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaOeahOS+i+WtkOOAgg0KPiA+PiArDQo+ID4+ICvk
uLrkuobopoHmsYLosIPluqblmajlnKjov5DooYzpmJ/liJfop6PplIHnmoTmg4XlhrXkuIvosIPn
lKhzd2l0Y2hfdG/vvIzkvaDlv4XpobvlnKjlpLTmlofku7YNCj4gPj4gK+S4rWAjZGVmaW5lIF9f
QVJDSF9XQU5UX1VOTE9DS0VEX0NUWFNXYCjpgJrluLjmmK/lrprkuYlzd2l0Y2hfdG/nmoTpgqPk
uKrmlofku7bvvInjgIINCj4gPj4gKw0KPiA+PiAr5ZyoQ09ORklHX1NNUOeahOaDheWGteS4i++8
jOino+mUgeeahOS4iuS4i+aWh+WIh+aNouWvueaguOW/g+iwg+W6puWZqOeahOWunueOsOWPquW4
puadpeS6humdnuW4uOWwj+eahOaAp+iDveaNnw0KPiA+PiAr5aSx44CCDQo+ID4+ICsNCj4gPj4g
K0NQVeepuui9rA0KPg0KPiDov5nph4zliKvnv7vor5Hmr5TovoPlpb3vvIxDUFUgaWRsZeaYr+S4
gOS4queJueaAp+OAguepuui9rOiCr+WumuS4jeWvueOAgg0KSWYgeW91IGNhbiBleHBsYWluIHdo
YXQgY3B1IGlkbGUgaXMsIEknbGwgdXNlIGlkbGUuIDopDQo+DQo+ID4+ICs9PT09PT09DQo+ID4+
ICvkvaDnmoRjcHVfaWRsZeeoi+W6j+mcgOimgemBteWuiOS7peS4i+inhOWIme+8mg0KPiA+PiAr
DQo+ID4+ICsxLiDnjrDlnKjmiqLljaDlupTor6XlnKjnqbrpl7LnmoTkvovnqIvkuIrnpoHnlKjj
gILlupTor6Xlj6rlnKjosIPnlKhzY2hlZHVsZSgp5pe25ZCv55So77yM54S25ZCO5YaN56aBPj4g
Kw0KPiA+PiArMi4gbmVlZF9yZXNjaGVkL1RJRl9ORUVEX1JFU0NIRUQg5Y+q5Lya6KKr6K6+572u
77yM5bm25LiU5Zyo6L+Q6KGM5Lu75Yqh6LCD55SoIHNjaGVkdWxlKCkNCj4gPj4gKyAgIOS5i+WJ
jeawuOi/nOS4jeS8muiiq+a4hemZpOOAguepuumXsue6v+eoi+WPqumcgOimgeafpeivom5lZWRf
cmVzY2hlZO+8jOW5tuS4lOawuOi/nOS4jeS8muiuvue9ruaIlua4hemZpOWug+OAgg0KPg0KPiDn
qbrpl7IgLT4gaWRsZQ0KPg0KPiA+PiArDQo+ID4+ICszLiDlvZNjcHVfaWRsZeWPkeeOsO+8iG5l
ZWRfcmVzY2hlZCgpID09ICd0cnVlJ++8ie+8jOWug+W6lOivpeiwg+eUqHNjaGVkdWxlKCnjgILl
kKbliJkNCj4gPj4gKyAgIOWug+S4jeW6lOivpeiwg+eUqHNjaGVkdWxlKCnjgIINCj4gPj4gKw0K
PiA+PiArNC4g5Zyo5qOA5p+lbmVlZF9yZXNjaGVk5pe277yM5ZSv5LiA6ZyA6KaB56aB55So5Lit
5pat55qE5oOF5Ya15piv77yM5oiR5Lus6KaB6K6p5aSE55CG5Zmo5LyR55yg5Yiw5LiL5LiA5Liq
5LitDQo+ID4+ICsgICDmlq3vvIjov5nlubbkuI3lr7luZWVkX3Jlc2NoZWTmj5Dkvpvku7vkvZXk
v53miqTvvIzlroPlj6/ku6XpmLLmraLkuKLlpLHkuIDkuKrkuK3mlq3vvIk6DQo+ID4+ICsNCj4g
Pj4gKyAgICAgICA0YS4g6L+Z56eN552h55yg57G75Z6L55qE5bi46KeB6Zeu6aKY5Ly85LmO5piv
OjoNCj4gPj4gKw0KPiA+PiArICAgICAgICAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsNCj4g
Pj4gKyAgICAgICAgICAgICAgIGlmICghbmVlZF9yZXNjaGVkKCkpIHsNCj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOw0KPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICAqKiogcmVzY2hlZCBpbnRlcnJ1cHQgYXJyaXZlcyBoZXJlICoqKg0KPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICBfX2FzbV9fKCJzbGVlcCB1bnRpbCBuZXh0IGludGVycnVwdCIp
Ow0KPiA+PiArICAgICAgICAgICAgICAgfQ0KPiA+PiArDQo+ID4+ICs1LiDlvZNuZWVkX3Jlc2No
ZWTlj5jkuLrpq5jnlLXlubPml7bvvIxUSUZfUE9MTElOR19OUkZMQUflj6/ku6XnlLHkuI3pnIDo
poHkuK3mlq3mnaXllKTphpLlroPku6wNCj4NCj4g6auY55S15bmz77ya5oiR6KeJ5b6X5Y+v5Lul
5Yqg5Liq4oCc77yI6K+R5rOo77ya5Li655yf77yJ4oCdDQpBZ3JlZSENCj4NCj4gPj4gKyAgIOea
hOepuumXsueoi+W6j+iuvue9ruOAguaNouWPpeivneivtO+8jOWug+S7rOW/hemhu+Wumuacn+i9
ruivom5lZWRfcmVzY2hlZO+8jOWwveeuoeWBmuS4gOS6m+WQjuWPsOW3peS9nOaIlg0KPg0KPiDl
j6/ku6XnlLHkuI3pnIDopoHkuK3mlq3mnaXllKTphpLlroPku6znmoTnqbrpl7LnqIvluo/orr7n
va4gLT4g5Y+v5Lul55Sx5LiN6ZyA6KaB5Lit5pat5ZSk6YaS55qEaWRsZeS+i+eoi+iuvue9rg0K
Pg0KPiA+PiArICAg6L+b5YWl5L2OQ1BV5LyY5YWI57qn5Y+v6IO95piv5ZCI55CG55qE44CCDQo+
ID4+ICsNCj4gPj4gKyAgICAgIC0gNWEuIOWmguaenFRJRl9QT0xMSU5HX05SRkxBR+iiq+iuvue9
ru+8jOiAjOaIkeS7rOehruWunuWGs+Wumui/m+WFpeS4gOS4quS4reaWreedoeecoO+8jOmCow0K
PiA+PiArICAgICAgICAgICAg5LmI6ZyA6KaB5riF6Zmk5a6D77yM54S25ZCO5Y+R5Ye65LiA5Liq
5YaF5a2Y5bGP6Zqc77yI5o6l552A5rWL6K+VbmVlZF9yZXNjaGVk77yM56aB55So5Lit5pat77yM
5aaCM+S4reino+mHiu+8ieOAgg0KPg0KPiDmjqXnnYDmtYvor5VuZWVkX3Jlc2NoZWTvvIznpoHn
lKjkuK3mlq0gLT4g5o6l552A5Zyo56aB55So5Lit5pat55qE5p2h5Lu25LiL5rWL6K+VbmVlZF9y
ZXNjaGVkDQpPSywgdGhhbmtzIQ0KPg0KPiA+PiArDQo+ID4+ICthcmNoL3g4Ni9rZXJuZWwvcHJv
Y2Vzcy5j5pyJ6L2u6K+i5ZKM552h55yg56m66Zey5Ye95pWw55qE5L6L5a2Q44CCDQo+DQo+IOep
uumXsiDlj6/ku6XkuI3nv7vor5ENCk9LLCB0aGFua3MhDQo+DQo+ID4+ICsNCj4gPj4gKw0KPiA+
PiAr5Y+v6IO95Ye6546w55qEYXJjaC/pl67popgNCj4gPj4gKz09PT09PT09PT09PT09PT09PT0N
Cj4gPj4gKw0KPiA+PiAr5oiR5Y+R546w55qE5Y+v6IO955qEYXJjaOmXrumimO+8iOW5tuivleWb
vuino+WGs+aIluayoeacieino+WGs++8ieOAgjoNCj4gPj4gKw0KPiA+PiAraWE2NCAtIHNhZmVf
aGFsdOeahOiwg+eUqOS4juS4reaWreebuOavlO+8jOaYr+WQpuW+iOiNkuiwrO+8nyAo5a6D552h
55yg5LqG5ZCXKSAo5Y+C6ICDICM0YSkNCj4NCj4gc2FmZV9oYWx055qE6LCD55So5LiO5Lit5pat
55u45q+U77yM5piv5ZCm5b6I6I2S6LCsIC0+IHNhZmVfaGFsdOeahOiwg+eUqOaYr+WQpuS4juS4
reaWreWPkeeUn+S6huernuS6iQ0KT0ssIHRoYW5rcyENCj4NCj4gPj4gKw0KPiA+PiArc2g2NCAt
IOedoeecoOS4juS4reaWreebuOavlO+8jOaYr+WQpuW+iOiNkuiwrO+8nyAo5Y+C6ICDICM0YSkN
Cj4NCj4g552h55yg5LiO5Lit5pat55u45q+U77yM5piv5ZCm5b6I6I2S6LCsIC0+IOedoeecoOWS
jOS4reaWreWPkeeUn+ernuS6ieS6huWQlw0KT0ssIHRoYW5rcyENCj4NCj4gPj4gKw0KPiA+PiAr
c3BhcmMgLSDlnKjov5nkuIDngrnkuIrvvIxJUlHmmK/lvIDnnYDnmoTvvIjvvJ/vvInvvIzmiops
b2NhbF9pcnFfc2F2ZeaUueS4ul9kaXNhYmxl44CCDQo+ID4+ICsgICAgICAtIOW+heWKnuS6i+mh
uTog6ZyA6KaB56ys5LqM5LiqQ1BV5p2l56aB55So5oqi5Y2gICjlj4LogIMgIzEpDQo+ID4+IC0t
DQo+ID4+IDIuMjcuMA0KPiA+Pg0KPiA+DQo+ID4gQ0MgICAgWWl6aG91IHRhbmd5aXpob3VAaHVh
d2VpLmNvbQ0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFlhbnRlbmcNCj4gPg0KPg0KPiDmgLvnmoTm
naXnnIvvvIzov5nnr4fmlofnq6DlpKrogIHkuobvvIzmiJHop4nlvpflj6/ku6XpgoDor7fljp/k
vZzogIXmm7TmlrDkuIDkuIsuLi4NCkluIGZhY3QsIEkgYXBwcmVjaWF0ZSB5b3UgZG9pbmcgaXQg
ZXZlbiBtb3JlLiA6LSkNCg0KQlRXOg0KDQpUaGUgbWFpbGluZyBsaXN0IGhhcyBtYW55IGZyaWVu
ZHMgd2hvIGFyZSBub3QgZ29vZCBhdCBDaGluZXNlLCBzbw0KbGV0J3MgY29tbXVuaWNhdGUgaW4g
RW5nbGlzaC4NCg0KVGhhbmtzLA0KWWFudGVuZw0K
