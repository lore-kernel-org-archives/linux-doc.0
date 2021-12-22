Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F25C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 02:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238731AbhLVCg7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhLVCg6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 21:36:58 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63268C061574
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 18:36:58 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id e136so2101916ybc.4
        for <linux-doc@vger.kernel.org>; Tue, 21 Dec 2021 18:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7QX1d/RuCzRd++GgHLFbz8ybqj/ZpK1uvb+0JC+x/Bo=;
        b=VBBJnbXusKI+lpfL5zpLg5pKFrxzzqfE9ynzG3yBUkNMTLhQEPDcxyGjeCxdHviHnb
         NZQ4XjOqFj7Tb1NvC66D3CXKKffcFW1hiHMc12mh9OQngpbmnAtsdrwYOSz/wnV9V5Mw
         0InZbxPBElelAztySVbyvncVCfeXY2rl71/fm0GF2Jn6lFuucdGsbAR2vQp2pW52oh3X
         6Fj4ojCnok+MWVIhjx3A1NkxGxpozvnaPUrffedshpXaeMw9AttkZcq5epFtJccuB/Dk
         SOHl5z5SQV47OyruMGhIHm9OPNPe0mj404hJwgFryV6bcCgvfExcoZFYxeZpZ12V+3EB
         L8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7QX1d/RuCzRd++GgHLFbz8ybqj/ZpK1uvb+0JC+x/Bo=;
        b=HQQYAQCnEOfAUQxIux522AMjXN1Z3zEn7sj9ktSEtfag5HqneTT3r7PfMy+pK+DNh6
         2vEodq7LCbDm6YenWL59QhWUgBTrdaspyo3NwLd2yPtWCs+e+sWQhmFHVXEuymrHhcHb
         QQmRkP4jJHl4Zcoc4iNvfLN8ck3FmzP0GqaQOHXqiaUZrKrCogHWFnOFIleN96eNZaAP
         dafzTNDS+2ckLNZsK9FCbQG0DgZAelu1UhWdON3buaL4xlc0UXZXCQ649isGL9EGCK0y
         R79X57Qgluxf654wdEqlAZHhna16p7mLM3fKXPrt42vStGwaPUL4nJc6dDzDXJkJZh1I
         CSoA==
X-Gm-Message-State: AOAM5329iUoxcpxW7qkOYp/EBT9cLEJXD+y2x72DknTZHSC+k7JjxYHt
        vSIZerXIwNlMlBceP+AZ+Pd6Ex5oIZa3R8l/qsM=
X-Google-Smtp-Source: ABdhPJyXYKV4SwFoTyO4l8SFSpdifDCga4oFJLHxrdDijq/gSMKsIeXy8bN7Mhr06dntLoq8trgEUzyWzvcdCPhl3os=
X-Received: by 2002:a25:418f:: with SMTP id o137mr1711722yba.154.1640140617436;
 Tue, 21 Dec 2021 18:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20211221023158.31845-1-tangyizhou@huawei.com> <CAEensMz_EytaeBB1qhwTGuBd8SQnhQhjO05XcC8=LSrp7+BAZA@mail.gmail.com>
 <6169f755-a17e-cdf6-8a08-e5da3c358daf@huawei.com> <CAEensMzeEXeH5Y05J8uRuq=6R+oxtdzFzKi-WJe=f0VvrzsFYQ@mail.gmail.com>
 <318184bb-3df5-d194-e929-0c95a0c2cb2f@huawei.com>
In-Reply-To: <318184bb-3df5-d194-e929-0c95a0c2cb2f@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 22 Dec 2021 10:36:46 +0800
Message-ID: <CAEensMwB70cCvTLtSCKfBz-WjEmCmWMfvo=nn+YkR83nZLE34g@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-domains translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyIMjHml6Xl
kajkuowgMjI6MTPlhpnpgZPvvJoNCj4NCj4gT24gMjAyMS8xMi8yMSAyMDowNCwgeWFudGVuZyBz
aSB3cm90ZToNCj4gPiBUYW5nIFlpemhvdSA8dGFuZ3lpemhvdUBodWF3ZWkuY29tPiDkuo4yMDIx
5bm0MTLmnIgyMeaXpeWRqOS6jCAxNToyNeWGmemBk++8mg0KPiA+Pg0KPiA+PiBPbiAyMDIxLzEy
LzIxIDE0OjU0LCB5YW50ZW5nIHNpIHdyb3RlOg0KPiA+Pj4gVGFuZyBZaXpob3UgPHRhbmd5aXpo
b3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyIMjHml6XlkajkuowgMTA6MDTlhpnpgZPvvJoN
Cj4gPj4+Pg0KPiA+Pj4+IFRyYW5zbGF0ZSBzY2hlZHVsZXIvc2NoZWQtZG9tYWlucy5yc3QgaW50
byBDaGluZXNlLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogVGFuZyBZaXpob3UgPHRh
bmd5aXpob3VAaHVhd2VpLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgLi4uL3RyYW5zbGF0aW9u
cy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0ICAgIHwgIDIgKy0NCj4gPj4+PiAgLi4uL3poX0NO
L3NjaGVkdWxlci9zY2hlZC1kb21haW5zLnJzdCAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysr
KysrKw0KPiA+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kb21haW5zLnJzdA0KPiA+Pj4+DQo+ID4+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRl
eC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgu
cnN0DQo+ID4+Pj4gaW5kZXggNTMyN2M2MWNiMGFiLi5mOGY4ZjM1ZDUzYzcgMTAwNjQ0DQo+ID4+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2luZGV4
LnJzdA0KPiA+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVk
dWxlci9pbmRleC5yc3QNCj4gPj4+PiBAQCAtMjEsNiArMjEsNyBAQCBMaW51eOiwg+W6puWZqA0K
PiA+Pj4+ICAgICAgc2NoZWQtYXJjaA0KPiA+Pj4+ICAgICAgc2NoZWQtYndjDQo+ID4+Pj4gICAg
ICBzY2hlZC1kZXNpZ24tQ0ZTDQo+ID4+Pj4gKyAgICBzY2hlZC1kb21haW5zDQo+ID4+Pj4gICAg
ICBzY2hlZC1jYXBhY2l0eQ0KPiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBAQCAtMjgsNyArMjksNiBA
QCBUT0RPTGlzdDoNCj4gPj4+Pg0KPiA+Pj4+ICAgICAgc2NoZWQtYndjDQo+ID4+Pj4gICAgICBz
Y2hlZC1kZWFkbGluZQ0KPiA+Pj4+IC0gICAgc2NoZWQtZG9tYWlucw0KPiA+Pj4+ICAgICAgc2No
ZWQtZW5lcmd5DQo+ID4+Pj4gICAgICBzY2hlZC1uaWNlLWRlc2lnbg0KPiA+Pj4+ICAgICAgc2No
ZWQtcnQtZ3JvdXANCj4gPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWRvbWFpbnMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWRvbWFpbnMucnN0DQo+ID4+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdhZWMyNGMwMzM1Nw0K
PiA+Pj4+IC0tLSAvZGV2L251bGwNCj4gPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZG9tYWlucy5yc3QNCj4gPj4+PiBAQCAtMCwwICsx
LDY3IEBADQo+ID4+Pj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4+
Pj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+Pj4+ICsNCj4gPj4+
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1kb21haW5zLnJzdA0K
PiA+Pj4+ICsNCj4gPj4+PiArOue/u+ivkToNCj4gPj4+PiArDQo+ID4+Pj4gKyAg5ZSQ6Im66Iif
IFRhbmcgWWl6aG91IDx0YW5neWVlY2hvdUBnbWFpbC5jb20+DQo+ID4+Pj4gKw0KPiA+Pj4+ICs9
PT09PT0NCj4gPj4+PiAr6LCD5bqm5Z+fDQo+ID4+Pj4gKz09PT09PQ0KPiA+Pj4+ICsNCj4gPj4+
PiAr5q+P5LiqQ1BV5pyJ5LiA5Liq4oCc5Z+64oCd6LCD5bqm5Z+f77yIc3RydWN0IHNjaGVkX2Rv
bWFpbu+8ieOAguiwg+W6puWfn+Wxguasoee7k+aehOS7juWfuuiwg+W6puWfn+aehOW7uuiAjOad
pe+8jOWPrw0KPiA+Pj4+ICvpgJrov4ctPnBhcmVudOaMh+mSiOiHquS4i+iAjOS4iumBjeWOhuOA
gi0+cGFyZW505b+F6aG75LulTlVMTOe7k+Wwvu+8jOiwg+W6puWfn+aVsOaNrue7k+aehOW/hemh
u+aYr3Blci1DUFXnmoTvvIwNCj4gPj4NCj4gPj4+IOaVsOaNrue7k+aehCAtPiDnu5PmnoTkvZMN
Cj4gPj4gT0sNCj4gPj4NCj4gPj4+PiAr5Zug5Li65a6D5Lus5peg6ZSB5pu05paw44CCDQo+ID4+
Pj4gKw0KPiA+Pj4+ICvmr4/kuKrosIPluqbln5/nrqHovpbmlbDkuKpDUFXvvIjlrZjlgqjlnKgt
PnNwYW7lrZfmrrXkuK3vvInjgILkuIDkuKrosIPluqbln5/nmoRzcGFu5b+F6aG75piv5a6D55qE
5a2Q6LCD5bqm5Z+fc3BhbueahA0KPiA+Pg0KPiA+Pj4gd2hhdCBzdG9yZWQgaW4gdGhlIC0+IGZp
ZWxkPyBUaGlzIG5lZWRzIHRvIGJlIHRyYW5zbGF0ZWQgY2xlYXJseS4NCj4gPj4g6L+Z6YeM5piv
6Iux5paH5Y6f5paH55qE55u05o6l57+76K+R44CCc3BhbuWtl+auteWwseaYr+iwg+W6puWfn+eu
oei+lueahOmCo+S6m0NQVeOAguaIkeWFqOaWh+aKiuWKqOivjeeahHNwYW7nv7vor5HmiJDigJzn
rqHovpbigJ3kuobjgIINCj4NCj4gPiBjcHXmjqnnoIEv5pWw6YeP5a2Y5YKo5Zyo4oCm4oCm77yf
DQo+DQo+IOS9oOW+l+e7k+WQiOa6kOeggeeahOe7k+aehOS9k+WumuS5ieeci+OAguW5tuS4jeaY
r+aOqeeggeaIluiAheaVsOmHj++8jOaYr+WPr+WPmOmVv+aVsOe7hOihqOekuueahENQVeWIl+ih
qOOAgg0KT0ssVGhhbmtzIQ0KPg0KPiA+Pg0KPiA+Pj4+ICvotoXpm4bvvIjlpoLmnInpnIDmsYLl
h7rnjrDvvIzov5nkuKrpmZDliLblj6/ku6XmlL7lrr3vvInjgIJDUFUgaeeahOWfuuiwg+W6puWf
n+W/hemhu+iHs+Wwkeeuoei+lkNQVSBp44CC5q+P5LiqQ1BV55qEDQo+ID4+Pj4gK+mhtuWxguiw
g+W6puWfn+mAmuW4uOWwhuS8mueuoei+luezu+e7n+S4reeahOWFqOmDqENQVe+8jOWwveeuoeS4
peagvOadpeivtOi/meS4jeaYr+W/hemhu+eahO+8jOWBh+WmguaYr+i/meagt++8jOS8muWvvOiH
tOafkOS6mw0KPiA+Pj4+ICtDUFXlh7rnjrDmsLjov5zkuI3kvJrooqvmjIflrprku7vliqHov5Do
oYznmoTmg4XlhrXvvIznm7TliLDlhYHorrjnmoRDUFXmjqnnoIHooqvmmL7lvI/orr7lrprjgILo
sIPluqbln5/nmoRzcGFu5a2X5q615oSP5ZGzDQo+ID4+Pj4gK+edgOKAnOWcqOi/meS6m0NQVeS4
reWBmui/m+eoi+i0n+i9veWdh+ihoeKAneOAgg0KPiA+Pj4+ICsNCj4gPj4+PiAr5q+P5Liq6LCD
5bqm5Z+f5b+F6aG75YW35pyJ5LiA5Liq5oiW5aSa5LiqQ1BV6LCD5bqm57uE77yIc3RydWN0IHNj
aGVkX2dyb3Vw77yJ77yM5a6D5Lus5Lul5Y2V5ZCR5b6q546v6ZO+6KGo55qE5b2i5byPDQo+ID4+
Pj4gK+e7hOe7h++8jOWtmOWCqOWcqC0+Z3JvdXBz5oyH6ZKI5Lit44CC6L+Z5Lqb57uE55qEQ1BV
5o6p56CB55qE5bm26ZuG5b+F6aG75ZKM6LCD5bqm5Z+fc3BhbuWtl+auteS4gOiHtOOAgi0+Z3Jv
dXBzDQo+ID4+Pj4gK+aMh+mSiOaMh+WQkeeahOi/meS6m+e7hOWMheWQq+eahENQVe+8jOW/hemh
u+iiq+iwg+W6puWfn+euoei+luOAgue7hOWMheWQq+eahOaYr+WPquivu+aVsOaNru+8jOiiq+WI
m+W7uuS5i+WQju+8jOWPr+iDveiiq+WkmuS4qg0KPiA+Pj4+ICtDUFXlhbHkuqvjgILku7vmhI/k
uKTkuKrnu4TnmoRDUFXmjqnnoIHnmoTkuqTpm4bkuI3kuIDlrprkuLrnqbrvvIzlpoLmnpzmmK/o
v5nnp43mg4XlhrXvvIzlr7nlupTosIPluqbln5/nmoRTRF9PVkVSTEFQDQo+ID4+Pj4gK+agh+W/
l+S9jeiiq+iuvue9ru+8jOWug+euoei+lueahOiwg+W6pue7hOWPr+iDveS4jeiDveWcqOWkmuS4
qkNQVeS4reWFseS6q+OAgg0KPiA+Pj4+ICsNCj4gPj4+PiAr6LCD5bqm5Z+f5Lit55qE6LSf6L29
5Z2H6KGh5Y+R55Sf5Zyo6LCD5bqm57uE5Lit44CC5Lmf5bCx5piv6K+077yM5q+P5Liq57uE6KKr
6KeG5Li65LiA5Liq5a6e5L2T44CC57uE55qE6LSf6L296KKr5a6a5LmJ5Li65a6DDQo+ID4+Pj4g
K+euoei+lueahOavj+S4qkNQVeeahOi0n+i9veS5i+WSjOOAguS7heW9k+e7hOeahOi0n+i9veS4
jeWdh+ihoeWQju+8jOS7u+WKoeWcqOe7hOS5i+mXtOWPkeeUn+i/geenu+OAgg0KPiA+Pg0KPiA+
Pj4g5omN5Zyo57uE5LmL6Ze05Y+R55Sf6L+B56e744CCDQo+ID4+IE9LDQo+ID4+DQo+ID4+Pj4g
Kw0KPiA+Pj4+ICvlnKhrZXJuZWwvc2NoZWQvY29yZS5j5Lit77yMdHJpZ2dlcl9sb2FkX2JhbGFu
Y2UoKeWcqOavj+S4qkNQVeS4iumAmui/h3NjaGVkdWxlcl90aWNrKCkNCj4gPj4+PiAr5ZGo5pyf
5omn6KGM44CC5Zyo5b2T5YmN6L+Q6KGM6Zif5YiX5LiL5LiA5Liq5a6a5pyf6LCD5bqm5YaN5bmz
6KGh5LqL5Lu25Yiw6L6+5ZCO77yM5a6D5byV5Y+R5LiA5Liq6L2v5Lit5pat44CC6LSf6L295Z2H
6KGh55yf5q2jDQo+ID4+Pj4gK+eahOW3peS9nOeUsXJ1bl9yZWJhbGFuY2VfZG9tYWlucygpLT5y
ZWJhbGFuY2VfZG9tYWlucygp5a6M5oiQ77yM5Zyo6L2v5Lit5pat5LiK5LiL5paH5Lit5omn6KGM
DQo+ID4+Pj4gK++8iFNDSEVEX1NPRlRJUlHvvInjgIINCj4gPj4+PiArDQo+ID4+Pj4gK+WQjuS4
gOS4quWHveaVsOacieS4pOS4quWFpeWPgu+8muW9k+WJjUNQVeeahOi/kOihjOmYn+WIl+OAgeWu
g+WcqHNjaGVkdWxlcl90aWNrKCnosIPnlKjml7bmmK/lkKbnqbrpl7LjgILlh73mlbDkvJrku44N
Cj4gPj4+PiAr5b2T5YmNQ1BV5omA5Zyo55qE5Z+66LCD5bqm5Z+f5byA5aeL6L+t5Luj5omn6KGM
77yM5bm25rK/552AcGFyZW505oyH6ZKI6ZO+5ZCR5LiK6L+b5YWl5pu06auY5bGC57qn55qE6LCD
5bqm5Z+f44CC5Zyo6L+t5LujDQo+ID4+Pj4gK+i/h+eoi+S4re+8jOWHveaVsOS8muajgOafpeW9
k+WJjeiwg+W6puWfn+aYr+WQpuW3sue7j+iAl+WwveS6huWGjeW5s+ihoeeahOaXtumXtOmXtOma
lO+8jOWmguaenOaYr++8jOWug+WcqOivpeiwg+W6puWfn+i/kOihjA0KPiA+Pj4+ICtsb2FkX2Jh
bGFuY2UoKeOAguaOpeS4i+adpeWug+ajgOafpeeItuiwg+W6puWfn++8iOWmguaenOWtmOWcqO+8
ie+8jOWGjeWQjuadpeeItuiwg+W6puWfn+eahOeItuiwg+W6puWfn++8jOS7peatpOexu+aOqOOA
gg0KPiA+Pj4+ICsNCj4gPj4+PiAr6LW35Yid77yMbG9hZF9iYWxhbmNlKCnmn6Xmib7lvZPliY3o
sIPluqbln5/kuK3mnIDnuYHlv5nnmoTosIPluqbnu4TjgILlpoLmnpzmiJDlip/vvIzlnKjor6Xo
sIPluqbnu4TnrqHovpbnmoTlhajpg6hDUFUNCj4gPj4+PiAr55qE6L+Q6KGM6Zif5YiX5Lit5om+
5Ye65pyA57mB5b+Z55qE44CC5aaC6IO95om+5Yiw77yM5a+55b2T5YmN55qEQ1BV6L+Q6KGM6Zif
5YiX5ZKM5paw5om+5Yiw55qE5pyA57mB5b+Z6L+Q6KGM6Zif5YiX5Z2H5Yqg6ZSB77yMDQo+ID4+
DQo+ID4+PiDmib7lh7rmnIDnuYHlv5nnmoQgKirku4DkuYgqKu+8nw0KPiA+PiDmiJHop4nlvpfo
i7Hmlofljp/mlofkuI3lpJ/nsr7ngrzvvIzov5nph4zov5jmmK/kv53mjIHljp/moLflkKfvvJoN
Cj4gPj4g5Zyo6K+l6LCD5bqm57uE566h6L6W55qE5YWo6YOoQ1BV55qE6L+Q6KGM6Zif5YiX5Lit
5om+5Ye65pyA57mB5b+Z55qE6L+Q6KGM6Zif5YiX44CCDQo+ID4gT0shDQo+ID4+DQo+ID4+Pj4g
K+W5tuaKiuS7u+WKoeS7juacgOe5geW/memYn+WIl+S4rei/geenu+WIsOW9k+WJjUNQVeS4iuOA
guiiq+i/geenu+eahOS7u+WKoeaVsOmHj+etieS6juWcqOWFiOWJjei/reS7o+aJp+ihjOS4reiu
oeeul+WHuueahOivpQ0KPiA+Pj4+ICvosIPluqbln5/nmoTosIPluqbnu4TnmoTkuI3lnYfooaHl
gLzjgIINCj4gPj4+PiArDQo+ID4+Pj4gK+WunueOsOiwg+W6puWfnw0KPiA+Pj4+ICs9PT09PT09
PT09DQo+ID4+Pj4gKw0KPiA+Pj4+ICvln7rosIPluqbln5/kvJrnrqHovpZDUFXlsYLmrKHnu5Pm
noTkuK3nmoTnrKzkuIDlsYLjgILlr7nkuo7otoXnur/nqIvvvIhTTVTvvInogIzoqIDvvIzln7ro
sIPluqbln5/lsIbkvJrnrqHovpblkIzkuIDkuKrniannkIYNCj4gPj4+PiArQ1BV55qE5YWo6YOo
6Jma5oufQ1BV77yM5q+P5Liq6Jma5oufQ1BV5a+55bqU5LiA5Liq6LCD5bqm57uE44CCDQo+ID4+
Pj4gKw0KPiA+Pj4+ICvlnKhTTVDkuK3vvIzln7rosIPluqbln5/nmoTniLbosIPluqbln5/lsIbk
vJrnrqHovpblkIzkuIDkuKrnu5PngrnkuK3nmoTlhajpg6jniannkIZDUFXjgILmjqXkuIvmnaXv
vIzlpoLmnpzmmK9OVU1B57O757uf77yMDQo+ID4+Pj4gK1NNUOiwg+W6puWfn+eahOeItuiwg+W6
puWfn+Wwhueuoei+luaVtOS4quacuuWZqO+8jOS4gOS4que7k+eCueeahENQVeaOqeeggeWvueW6
lOS4gOS4quiwg+W6pue7hOOAguaIluiAhe+8jOS9oOWPr+S7peS9v+eUqA0KPiA+Pj4+ICvlpJrl
sYLmrKFOVU1B77yb5oiW5Li+5L6L5p2l6K+0T3B0ZXJvbuWkhOeQhuWZqO+8jOWPr+iDveS7heS7
heWPquacieS4gOS4quiwg+W6puWfn+adpeimhuebluWug+eahOS4gOS4qk5VTUHlsYLnuqfjgIIN
Cj4gPj4NCj4gPj4+IOaIluiAhe+8jOS9oOWPr+S7peWBmuWkmue6p05VTUHmiJZPcHRlcm9u77yM
5L6L5aaC77yM5Y+v6IO95Y+q5pyJ5LiA5Liq5Z+f6KaG55uW5YW25LiA5LiqTlVNQee6p+WIq+OA
gg0KPiA+PiDov5nph4znmoToi7Hmlofljp/mloforqnmiJHlm7Dmg5HvvIzlj6/ku6Xorqjorrrk
uIDkuIvjgIJPcHRlcm9u5YmN55qEb3LvvIzkvZzogIXmg7Pooajovr7ku4DkuYjvvJ8NCj4gPiDo
oajnpLrlubbliJfvvIzkvaDlj6/ku6Xov5nkuYjlgZrvvIzkvaDkuZ/lj6/ku6Xov5nkuYjlgZrj
gIINCj4gPg0KPiA+IEJhc2VkIG9uIG15IGhvdXJzIG9mIHJlc2VhcmNoLCB0aGUgdHJhbnNsYXRp
b24gb2YgdGhpcyBwYXJhZ3JhcGggaXMgYQ0KPiA+IGJpdCBvZmYgYW5kIHlvdSBtaXNzZWQgYSBz
ZW50ZW5jZS4gW0VhY2ggZ3JvdXAgYmVpbmcgYSBzaW5nbGUgcGh5c2ljYWwNCj4gPiBDUFVdDQo+
DQo+IFJpZ2h0LiBJJ2xsIGFkZCB0aGF0Lg0KPg0KPiA+IEkgaGF2ZSBhIHJvdWdoIGlkZWEgb2Yg
d2hhdCB0aGUgb3JpZ2luYWwgcGFzc2FnZSBpcyB0YWxraW5nIGFib3V0LCBidXQNCj4gPiBJIGNh
bid0IGRlc2NyaWJlIGl0LiBJIG5lZWQgc29tZSB0aW1lLiA6KQ0KPg0KPiBTb3JyeSwgSSdtIG5v
dCBmYW1pbGlhciB3aXRoIHRoaXMgQU1EIHByb2Nlc3Nvci4NCj4NCj4gPg0KPiA+IExldCdzIGRp
c2N1c3MgdGhlc2UgY29uY2VwdHMgZmlyc3TvvJoNCj4gPg0KPiA+IDHvvInln7rosIPluqbln5/v
vIjlroPnmoTniLbosIPluqbln5/mmK/osIHvvJ/vvInvvJoNCj4NCj4g6LCD5bqm5Z+f55qE5bGC
5qyh57uT5p6E5Y+C6KeBc3RydWN0IHNjaGVkX2RvbWFpbl90b3BvbG9neV9sZXZlbOaVsOe7hO+8
jOmAmuW4uOadpeivtOaYr1NNVC1NQy1ESUUNCj4g5LiJ5bGC44CC5L2G5piv5qC55o2u57O757uf
5a6e6ZmF5oOF5Ya177yM5Lmf5piv5Y+v5Lul5LiN5LiA5qC355qE77yM5Y6f5paH5LiL5paH566A
5Y2V5o+Q5Yiw5LqG44CCDQo+DQo+IOWGheaguOaWh+aho+WkqueugOWNleS6hu+8jOWunumZheS4
iuiwg+W6puWfn+OAgeiwg+W6pue7hOeahOe7huiKguibruWkjeadgueahOOAguW/oOS6juWOn+aW
h+eahOe/u+ivke+8jOWfuuacrOaYr+S4qg0KPiDovoXliqnkvZznlKjlkKfjgIINCj4NCj4gPiAy
77yJTlVNQToNCj4NCj4gZnJvbSB3aWtpcGVkaWE6IOmdnuWdh+WMgOWGheWtmOiuv+mXriAvIOmd
nue7n+S4gOWGheWtmOiuv+mXriDjgILmraTlpJbov5jlj6/ku6Xop4HliLAg6Z2e5LiA6Ie05YaF
5a2Y6K6/6Zeu44CCDQo+DQo+ID4gM++8iU9wdGVyb246DQo+DQo+IE5hbWUgb2YgYW4gQU1EIHBy
b2Nlc3NvciwgSSdtIG5vdCBnb2luZyB0byB0cmFuc2xhdGUgaXQuDQpPS++8jFRoYW5rc++8gQ0K
SG93IGFib3V077yaDQrlnKhTTVDkuK3vvIzln7rosIPluqbln5/nmoTniLbosIPluqbln5/lsIbn
rqHovpboioLngrnkuK3nmoTmiYDmnInniannkIZDUFXjgILmr4/kuKrnu4Tpg73mmK/kuIDkuKrn
iannkIZDUFXjgILnhLblkI7lnKhOVU1B5Lit77yMU01Q5Z+f55qE54i26LCD5bqm5Z+f5bCG566h
6L6W5pW05Liq5py65Zmo77yM5q+P5Liq57uE6YO95pyJ5LiA5Liq6IqC54K555qEY3B1bWFza+OA
guimgeS4jeeEtu+8jOS9oOWBmuWkmue6p05VTUHmiJZPcHRlcm9u5Lmf5Y+v5Lul77yM5L6L5aaC
77yM5Y+v6IO95Y+q5pyJ5LiA5Liq5Z+f6KaG55uW5YW25LiA5LiqTlVNQee6p+WIq+OAgg0KDQpG
WUkuIDopDQoNClRoYW5rcywNCllhbnRlbmcNCj4NCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+
IFlhbnRlbmcNCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBUYW5nDQo+ID4+DQo+ID4+Pg0KPiA+
Pj4gVGhhbmsgeW91IGZvciB0aGUgdHJhbnNsYXRpb27vvIENCj4gPj4+IFRoZSBzY2hlZHVsaW5n
IGRvbWFpbiBpcyBxdWl0ZSBpbnRlcmVzdGluZyBhbmQgSSBkZWNpZGVkIHRvIHRha2UgdGhlDQo+
ID4+PiB0aW1lIHRvIHN0dWR5IGl0Lg0KPiA+Pj4NCj4gPj4+IFRoYW5rcywNCj4gPj4+DQo+ID4+
PiBZYW50ZW5nDQo+ID4+Pj4gKw0KPiA+Pj4+ICvlrp7njrDogIXpnIDopoHpmIXor7tpbmNsdWRl
L2xpbnV4L3NjaGVkL3NkX2ZsYWdzLmjnmoTms6jph4rvvJror7tTRF8q5p2l5LqG6Kej5YW35L2T
5oOF5Ya15Lul5Y+K6LCD5bqm5Z+f55qEDQo+ID4+Pj4gK1NE5qCH5b+X5L2N6LCD6IqC5LqG5ZOq
5Lqb5Lic6KW/44CCDQo+ID4+Pj4gKw0KPiA+Pj4+ICvkvZPns7vnu5PmnoTlj6/ku6XmiormjIfl
rprnmoTmi5PmiZHlsYLnuqfnmoTpgJrnlKjosIPluqbln5/mnoTlu7rlmajlkozpu5jorqTnmoRT
ROagh+W/l+S9jeimhuebluaOie+8jOaWueazleaYr+WIm+W7uuS4gOS4qg0KPiA+Pj4+ICtzY2hl
ZF9kb21haW5fdG9wb2xvZ3lfbGV2ZWzmlbDnu4TvvIzlubbku6Xor6XmlbDnu4TkvZzkuLrlhaXl
j4LosIPnlKhzZXRfc2NoZWRfdG9wb2xvZ3koKeOAgg0KPiA+Pj4+ICsNCj4gPj4+PiAr6LCD5bqm
5Z+f6LCD6K+V5Z+656GA6K6+5pa95Y+v5Lul6YCa6L+HQ09ORklHX1NDSEVEX0RFQlVH5byA5ZCv
77yM5bm25Zyo5byA5py65ZCv5Yqo5ZG95Luk6KGM5Lit5aKe5YqgDQo+ID4+Pj4gK+KAnHNjaGVk
X3ZlcmJvc2XigJ3jgILlpoLmnpzkvaDlv5jorrDosIPmlbTlvIDmnLrlkK/liqjlkb3ku6TooYzk
uobvvIzkuZ/lj6/ku6XmiZPlvIANCj4gPj4+PiArL3N5cy9rZXJuZWwvZGVidWcvc2NoZWQvdmVy
Ym9zZeW8gOWFs+OAgui/meWwhuW8gOWQr+iwg+W6puWfn+mUmeivr+ajgOafpeeahOino+aekO+8
jOWug+W6lOivpeiDveaNleiOtw0KPiA+Pj4+ICvnu53lpKflpJrmlbDplJnor6/vvIzlkIzml7bk
u6Xlj6/op4bljJbmoLzlvI/miZPljbDosIPluqbln5/nmoTnu5PmnoTjgIINCj4gPj4+PiAtLQ0K
PiA+Pj4+IDIuMTcuMQ0KPiA+Pj4+DQo=
