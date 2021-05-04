Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76399C433B4
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 06:57:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 480E3613B3
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 06:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhEDG5z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 02:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhEDG5y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 May 2021 02:57:54 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DE5C061574
        for <linux-doc@vger.kernel.org>; Mon,  3 May 2021 23:56:59 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id u16so7851368oiu.7
        for <linux-doc@vger.kernel.org>; Mon, 03 May 2021 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MvE16Fj2Yqf9rc+j02aAFfaCnKF/lBZjF+aJro5dCsA=;
        b=U0XMC4yN2w2N06OnD+9LWbzG2xhELp3DOG2PD/TW5oLTQL8590rpnA5arjsN1BP+C8
         tVCUyUZyPRQUDVeElsJk4HOBT2jAimmDpi0sw8vHdIQ4RTpQO/0ry89Tt7kQU6kLepdb
         iNeVkwAM3VntfPqsdLmnSxKvS4mesg/zXwmDbHBg6KF3df0/XloJYJyV/DLKh9ty0Grq
         yv+oq4sNZiznRDBPgv8HVQkkcxEipazR5g2PFIYmMByjw+DiJu0f63tLf2o5rIlXTdtg
         9ej93y4/AMkRgDxo/mt4rO7AwWN6MQ7MlHcN+VgZHRJBEcbTuOYvrG6jFdvlWhVjlj8g
         8BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MvE16Fj2Yqf9rc+j02aAFfaCnKF/lBZjF+aJro5dCsA=;
        b=MeNpvaC9TrU6IBuhUdgE9BnpiKG4AN10exO8qz9luEGr+GSnFhwc1ttA1wjR0XWvXe
         Z4z6TuN75UBwYAoLq/K7ttCJ9FAUP3a9mFBG1+d+Nj09zHq/X9Op1V6pcjWXnDEFOKcC
         VZIRs+7dSH/auYsAaA1cJ1J8fUM9lgY6FO/Ue9aRAT+cmCX4iLdiU9IqX4PExfHJdjmG
         Gm2M5tM8aDSjCzUMVUDluh1ghgceNIOOg/0YCbCj/fkNqrlmhAXEUBehehi2UG0iJkE+
         ldcnKrTCApgJqWEOUb/99c/qf3yWNaw8/D8li/NkEhLex7hWLDayfGtSAfobnZ9MyfZM
         obDg==
X-Gm-Message-State: AOAM531aSFXFURPviPSmwKeResgs3LTGdU75BPiRAyufHd9n74NlQMbx
        4KNxudY1kFAQb+uTbDjVxtjRN5NOlip/vNqyTbmAUTO+KzE=
X-Google-Smtp-Source: ABdhPJzelN85txVuOwhl7HgCrDmGogW/xHEIkkMcT2yduR7bhB/u0kv7le1vDX+MqwNNIgDFPUcPfqPyi5c7NYE0AIU=
X-Received: by 2002:a05:6808:64d:: with SMTP id z13mr11905628oih.103.1620111418629;
 Mon, 03 May 2021 23:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619665430.git.siyanteng@loongson.cn> <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
 <20210429151318.GB23087@bobwxc.top>
In-Reply-To: <20210429151318.GB23087@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 4 May 2021 14:56:47 +0800
Message-ID: <CAEensMx5AQh_e4pA9vSny_LDV-D=DHvjAKnoVvHS9Lb5-BRU7Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: add parisc debugging.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDI55pel5ZGo5ZubIOS4i+WN
iDExOjEz5YaZ6YGT77yaDQo+DQo+IE9uIFRodSwgQXByIDI5LCAyMDIxIGF0IDExOjMzOjM0QU0g
KzA4MDAsIFlhbnRlbmcgU2kgd3JvdGU6DQo+ID4gVGhpcyB0cmFuc2xhdGVzIERvY3VtZW50YXRp
b24vcGFyaXNjL2RlYnVnZ2luZy5yc3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vdHJhbnNsYXRpb25zL3poX0NOL3BhcmlzYy9kZWJ1Z2dpbmcucnN0ICAgfCA0MSArKysrKysr
KysrKysrKysrKysrDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2luZGV4LnJz
dCAgICAgICB8ICA2ICsrLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3BhcmlzYy9kZWJ1Z2dpbmcucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2RlYnVnZ2luZy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wYXJpc2MvZGVidWdnaW5nLnJzdA0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45OWFmMzAz
ZmQzZDgNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vcGFyaXNjL2RlYnVnZ2luZy5yc3QNCj4gPiBAQCAtMCwwICsxLDQxIEBADQo+
ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9y
aWdpbmFsOiBEb2N1bWVudGF0aW9uL3BhcmlzYy9kZWJ1Z2dpbmcucnN0DQo+ID4gKzpUcmFuc2xh
dG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+ICsuLiBf
Y25fcGFyaXNjX2RlYnVnZ2luZzoNCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT09DQo+ID4g
K+iwg+ivlVBBLVJJU0MNCj4gPiArPT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+WlveWQ
p++8jOi/memHjOacieS4gOS6m+WFs+S6juiwg+ivlWxpbnV4L3BhcmlzY+eahOS9jue6p++8iOWB
j+ehrOS7tu+8iemDqOWIhueahOaPkOekuuOAgg0KPg0KPiBtYXliZQ0KPiDovoPlupXlsYLpg6jl
iIbnmoTkv6Hmga/jgIINCj4gZGVwZW5kIG9uIHlvdXIgY2hvaWNlDQpPSyEgdXNlIOi+g+W6leWx
gumDqOWIhueahOS/oeaBr+OAgg0KPg0KPiA+ICsNCj4gPiArDQo+ID4gKzEuIOe7neWvueWcsOWd
gA0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+W+iOWkmuaxh+e8luS7
o+eggeebruWJjeaYr+S7peWunuaooeW8j+i/kOihjOeahO+8jOi/meaEj+WRs+edgOe7neWvueWc
sOWdgOiiq+S9v+eUqO+8jOiAjOS4jeaYr+WDj+WGheaguOWFtuS7lg0KPg0KPiDlvojlpJrmsYfn
vJbku6PnoIHnm67liY3ov5DooYzlnKjlrp7mqKHlvI/kuIvvvIzov5nmhI/lkbPnnYDkvJrkvb/n
lKjnu53lr7nlnLDlnYDvvIzogIzkuI3mmK/lg4/lhoXmoLjlhbbku5YNCm9rIQ0KPg0KPiA+ICvp
g6jliIbpgqPmoLfkvb/nlKjomZrmi5/lnLDlnYDjgILopoHlsIbnu53lr7nlnLDlnYDovazmjaLk
uLromZrmi5/lnLDlnYDvvIzkvaDlj6/ku6XlnKhTeXN0ZW0ubWFw5Lit5p+lDQo+ID4gK+aJvu+8
jOa3u+WKoF9fUEFHRV9PRkZTRVTvvIjnm67liY3mmK8weDEwMDAwMDAw77yJ44CCDQo+ID4gKw0K
PiA+ICsNCj4gPiArMi4gSFBNQ3MNCj4gPiArPT09PT09PT0NCj4gPiArDQo+DQo+IGhpZ2ggcHJp
b3JpdHkgbWFjaGluZSBjaGVjaw0KT0shDQo+DQo+ID4gK+W9k+WunuaooeW8j+eahOS7o+eggeiv
leWbvuiuv+mXruS4jeWtmOWcqOeahOWGheWtmOaXtu+8jOS9oOS8muW+l+WIsOS4gOS4qkhQTUPv
vIzogIzkuI3mmK/kuIDkuKrlhoXmoLhvcHBz44CCDQo+DQo+IOS8muWHuueOsEhQTUPogIzkuI3m
mK/lhoXmoLhvb3Bz44CCDQpIb3cgYWJvdXQg5Lya5omT5Y2wSFBNQ+iAjOS4jeaYr+WGheaguG9v
cHPvvJ8NCj4NCj4gPiAr5Li65LqG6LCD6K+VSFBNQ++8jOWwneivleaJvuWIsOezu+e7n+WTjeW6
lOiAhS/or7fmsYLogIXlnLDlnYDjgILns7vnu5/or7fmsYLogIXlnLDlnYDlupTor6XkuI7lpITn
kIblmajnmoQNCj4NCj4g6KaB6LCD6K+VSFBNQ++8jOivt+WwneivleKApuKApg0KbWF5YmUg6Iul
6KaB6LCD6K+VSFBNQ++8jOivt+WwneivleKApuKApu+8nw0KPg0KPiDvvIjmn5DvvInlpITnkIbl
magNCnVzZSDor6XlpITnkIblmagg77yfDQo+DQo+IHMv5ZON5bqU6ICFL+WTjeW6lOeoi+W6jy9n
DQo+IHMv6K+35rGC6ICFL+ivt+axgueoi+W6jy9nDQo+IHJlcGxhY2UgYWxsDQpPSyENCj4NCj4g
PiArSFBB77yISS9P6IyD5Zu05YaF55qE6auY5Zyw5Z2A77yJ55u45Yy56YWN77yb57O757uf5ZON
5bqU6ICF5Zyw5Z2A5piv5a6e5qih5byP5Luj56CB6K+V5Zu+6K6/6Zeu55qE5Zyw5Z2A44CCDQo+
ID4gKw0KPiA+ICvns7vnu5/lk43lupTogIXlnLDlnYDnmoTlhbjlnovlgLzmmK/lpKfkuo5fX1BB
R0VfT0ZGU0VUIO+8iDB4MTAwMDAwMDDvvInnmoTlnLDlnYDvvIzov5nmhI/lkbPnnYANCj4gPiAr
5Zyo5a6e6ZmF5qih5byP5Luj56CB6K+V5Zu+6K6/6Zeu5a6D5LmL5YmN77yM5LiA5Liq6Jma5ouf
5Zyw5Z2A5rKh5pyJ6KKr57+76K+R5oiQ5LiA5Liq54mp55CG5Zyw5Z2A44CCDQo+DQo+IOWcqOWu
nuaooeW8j+ivleWbvuiuv+mXruWug+S5i+WJje+8jOiZmuaLn+WcsOWdgOayoeacieiiq+e/u+iv
keaIkOeJqeeQhuWcsOWdgOOAgg0KT0shDQo+DQo+ID4gKw0KPiA+ICsNCj4gPiArMy4g5pyJ6Laj
55qEUeS9jQ0KPiA+ICs9PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+afkOS6m+mdnuW4uOWFs+mU
rueahOS7o+eggeW/hemhu+a4hemZpFBTV+S4reeahFHkvY3jgILlvZNR5L2N6KKr5riF6Zmk5pe2
77yMQ1BV5LiN5Lya5pu05paw5Lit5pat5aSE55CGDQo+ID4gK+eoi+W6j+aJgOivu+WPlueahOWv
hOWtmOWZqO+8jOS7peaJvuWHuuacuuWZqOiiq+S4reaWreeahOS9jee9ruKAlOKAlOaJgOS7peWm
guaenOS9oOWcqOa4hemZpFHkvY3nmoTmjIfku6Tlkozlho0NCj4gPiAr5qyh6K6+572uUeS9jeea
hFJGSeS5i+mXtOmBh+WIsOS4reaWre+8jOS9oOS4jeefpemBk+Wug+WIsOW6leWPkeeUn+WcqOWT
qumHjOOAguWmguaenOS9oOW5uOi/kOeahOivne+8jElBT1ENCj4gPiAr5Lya5oyH5ZCR5riF6Zmk
UeS9jeeahOaMh+S7pO+8jOWmguaenOS9oOS4jeW5uOi/kOeahOivne+8jOWug+S8muaMh+WQkeS7
u+S9leWcsOaWueOAgumAmuW4uFHkvY3nmoTpl67popjkvJoNCj4gPiAr6KGo546w5Zyo5peg5rOV
6Kej6YeK55qE57O757uf5oyC6LW35oiW6L+Q6KGM5Yiw54mp55CG5YaF5a2Y55qE5pyr56uv44CC
DQo+DQo+IEhvdyBhYm91dCDooajnjrDkuLrml6Dms5Xop6Pph4rnmoTns7vnu5/mjILotbfmiJbn
iannkIblhoXlrZjotornlYzjgIINCkFuZCBob3cgYWJvdXQg5Ye6546w5Zyo5peg5rOV6Kej6YeK
55qE57O757uf5oyC6LW35oiW54mp55CG5YaF5a2Y6LaK55WM44CC77yfDQrlh7rnjrAgLS0tLT4g
6Zeu6aKYIDotKQ0KPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9wYXJpc2MvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vcGFyaXNjL2luZGV4LnJzdA0KPiA+IGluZGV4IGVmMjMyZDQ2YjFiYS4uYjkxM2Q2NjRlNzM1
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Bhcmlz
Yy9pbmRleC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9w
YXJpc2MvaW5kZXgucnN0DQo+ID4gQEAgLTEwLDkgKzEwLDEzIEBADQo+ID4gIFBBLVJJU0PkvZPn
s7vmnrbmnoQNCj4gPiAgPT09PT09PT09PT09PT09PT09PT0NCj4gPg0KPiA+IC1Ub2RvbGlzdDoN
Cj4gPiArLi4gdG9jdHJlZTo6DQo+ID4gKyAgIDptYXhkZXB0aDogMg0KPiA+DQo+ID4gICAgIGRl
YnVnZ2luZw0KPiA+ICsNCj4gPiArVG9kb2xpc3Q6DQo+ID4gKw0KPiA+ICAgICByZWdpc3RlcnMN
Cj4gPiAgICAgZmVhdHVyZXMNCj4gPg0KPiA+IC0tDQo+ID4gMi4yNy4wDQo+DQo+IFRoYW5rcw0K
Pg0KPiBXdSBYLkMuDQo+DQpUaGFua3MgeW91IHJldmlldyENCg0KVGhhbmtzLA0KDQpZYW50ZW5n
DQo=
