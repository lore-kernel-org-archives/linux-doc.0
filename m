Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E92C433E0
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 01:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F18A723A9B
	for <linux-doc@archiver.kernel.org>; Sat,  9 Jan 2021 01:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbhAIBu4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 20:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbhAIBuv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jan 2021 20:50:51 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DB9C061573
        for <linux-doc@vger.kernel.org>; Fri,  8 Jan 2021 17:50:10 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id g20so17087037ejb.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Jan 2021 17:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rt9ukeOn5vfbsAqkNRu/vkJzUmPnZknVyDe0BuYsE/Q=;
        b=QvCQeSfS6iTZ2YOChELG5QVy6h1ySjOiB0eSGLU6kKbvJeYcj2rgCzbtXSe0qI27qW
         SvlAGgjaKI8hwcyJcj9ZYu+EtSCRKqSEWIGyOBIpwSSkhswaMTwQ0uKuMDu7uS9wXdar
         qpoVQq2SWHm7qL757umvl7N2VW8y5r+T5lMQJzADdYO7TlXjc5+aTZ/4L8jZtwmZxq9p
         kL/S8bTPgueQEM5T57fn5EHw85lmDlqgyoonMug57UOjgq37Uh+Dr/W1CxxR3bh+xTuf
         33rl3/KkpfvJuk7v4n0tUG1RmOhRx/GGRWL4L7a+FTxkV0blLficatLv9sIWJVtDZm83
         HXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rt9ukeOn5vfbsAqkNRu/vkJzUmPnZknVyDe0BuYsE/Q=;
        b=OZmLJIFI1ucq0ZkVAvVWQJyhoVv7u9CScFEoBTex1YBsnpi622nrwWqbeHnEIQIGq8
         b0VSbb6NeLJ/jMtPgrj/+c7tiaA0shUDZmgX++PtYb9gjZ/bD+QFL7zaDgX2VAtl2sPC
         9xWmyKXINpGviwVGTvT51vjydOA7GO+MTkAV1LkSRiypscMM0c9ZmrMHm1N8wpAxS0Ak
         IXvbrDaKMqzRQmU3QApTsIXxmOl3tckeF0yPHtRUS6VRNKdAJQ4FsNDV0vyK+gJMFK8p
         AbgLTh9+9ElZbXC1gPyTGDN9yDtFYEb+LoorXNAwmuq8n4GBd+38RgymhqLu6/cPvoWV
         u6nA==
X-Gm-Message-State: AOAM533vfIidqGxxIRcEB9JLM+0kw4xaskniS02pP+uDj999SBIl6qyh
        v6BlscATpDpTru1d7MieNgbEqIOn61M7m4QM4b8=
X-Google-Smtp-Source: ABdhPJwKgcAZkWduyVOo6vPjfhi6X2g6qs8XAEozLKIkgGVxfW0uVruej3HqE8SMK7xB7I66PtvqdqfVZM7MR0BkfQI=
X-Received: by 2002:a17:906:3404:: with SMTP id c4mr4503138ejb.86.1610157009529;
 Fri, 08 Jan 2021 17:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20210108100221.1370763-1-siyanteng@loongson.cn>
 <20210108100221.1370763-4-siyanteng@loongson.cn> <6b6dd58a-0f59-c8c3-2a7a-8ee7c866a970@flygoat.com>
In-Reply-To: <6b6dd58a-0f59-c8c3-2a7a-8ee7c866a970@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 9 Jan 2021 09:49:57 +0800
Message-ID: <CAEensMxVwEzPZaGS9vUunieMJQYj3jGBA9oPn62WCW2hoTS5Ww@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SSB0aGluayB0aGVzZSBjaGFuZ2VzIGFyZSB2ZXJ5IGdvb2QsIHlvdSB3aWxsIHNlZSBpdCBpbiBQ
QVRDSCB2NSwgdGhhbmsgeW91IQ0KDQpKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5j
b20+IOS6jjIwMjHlubQx5pyIOOaXpeWRqOS6lCDkuIvljYg3OjI15YaZ6YGT77yaDQo+DQo+IOWc
qCAyMDIxLzEvOCDkuIvljYg2OjAyLCBZYW50ZW5nIFNpIOWGmemBkzoNCj4gPiBUaGlzIHBhdGNo
IHRyYW5zbGF0ZXMgRG9jdW1lbnRhdGlvbi9taXBzL2luZ2VuaWMtdGN1LnJzdCBpbnRvIENoaW5l
c2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+DQo+ID4gLS0tDQo+ID4gICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL21pcHMvaW5nZW5p
Yy10Y3UucnN0ICAgfCA2OSArKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNjkgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL21pcHMvaW5nZW5pYy10Y3UucnN0DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWlwcy9pbmdlbmljLXRj
dS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9taXBzL2luZ2VuaWMtdGN1
LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45
YThjNTUwNGI2MWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vbWlwcy9pbmdlbmljLXRjdS5yc3QNCj4gPiBAQCAtMCwwICsxLDY5
IEBADQo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKw0KPiA+
ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4gKzpPcmln
aW5hbDogOnJlZjpgRG9jdW1lbnRhdGlvbi9taXBzL2luZ2VuaWMtdGN1LnJzdCA8aW5nZW5pYy10
Y3U+YA0KPiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+ICsNCj4gPiArLi4gX2NuX2luZ2VuaWMtdGN1Og0KPiA+ICsNCj4gPiArPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiAr5ZCb5q2jIEpaNDd4
eCDns7vnu5/nuqfoiq/niYflrprml7blmagv6K6h5pWw5Zmo56Gs5Lu25Y2V5YWDDQo+ID4gKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+DQo+ICsgWWFu
amllIGFzIEluZ2VuaWMgZXhwZXJ0Lg0KPg0KPiBIaSBZYW50ZW5nLA0KPg0KPiBJIHRoaW5rIFNv
QyBzaG91bGRuJ3QgYmUgdHJhbnNsYXRlZCBhcyBpdCBpcyBhIGNvbW1vbiBzZW5zZS4NCj4NCj4g
PiArDQo+ID4gK+WQm+atoyBKWjQ3eHgg57O757uf57qn6Iqv54mH5Lit55qE5a6a5pe25ZmoL+iu
oeaVsOWZqOWNleWFgyhUQ1Up5piv5LiA5Liq5aSa5Yqf6IO956Gs5Lu25Z2X44CC5a6DDQo+ID4g
K+acieWkmui+vjjkuKrpgJrpgZPvvIzlj6/ku6XnlKjkvZzorqHmlbDlmajvvIzorqHml7blmajv
vIzmiJZQV03jgIINCj4gPiArDQo+ID4gKy0gSlo0NzI1QiwgSlo0NzUwLCBKWjQ3NTUg5Y+q5pyJ
77yW5LiqVENV6YCa6YGT44CC5YW25a6D57O757uf57qn6Iqv54mH6YO95pyJ77yY5Liq6YCa6YGT
44CCDQo+DQo+IERpdHRvLg0KPg0KPiA+ICsNCj4gPiArLSBKWjQ3MjVC5byV5YWl5LqG5LiA5Liq
54us56uL55qE6YCa6YGT77yM56ew5Li65pON5L2c57O757uf6K6h5pe25ZmoKE9TVCnjgILov5nm
mK/kuIDkuKozMuS9jeWPrw0KPiA+ICsgIOe8lueoi+WumuaXtuWZqOOAguWcqEpaNDc2MELlj4rk
u6XkuIrlnovlj7fkuIrvvIzlroPmmK82NOS9jeeahOOAgg0KPiA+ICsNCj4gPiArLSDmr4/kuKpU
Q1XpgJrpgZPmnInoh6rlt7HnmoTml7bpkp/vvIzlj6/ku6XpgJrov4cgVENTUiDlr4TlrZjlmajp
h43mlrDorr7nva7liLDkuInkuKrkuI3lkIznmoTml7YNCj4gPiArICDpkp/vvIhwY2xr44CBZXh0
44CBcnRj77yJ44CB6Zeo5o6n5ZKM5pe26ZKf5oGi5aSN44CCDQo+DQo+IE1heWJlDQo+IOavj+S4
qlRDVemAmumBk+mDveacieiHquW3seeahOaXtumSn+a6kO+8jOWPr+S7pemAmui/hyBUQ1NSIOWv
hOWtmOWZqOiuvue9rumAmumBk+eahOeItue6pw0KPiDml7bpkp/mupAgKHBjbGssIGV4dCwgcnRj
KSwg5byA5YWz5Lul5Y+K5YiG6aKR44CCDQo+DQo+DQo+DQo+ID4gKw0KPiA+ICsgICAgLSDnnIvp
l6jni5flkoxPU1Tnoazku7bmqKHlnZflnKjlroPku6znmoTlr4TlrZjlmajnqbrpl7TkuK3kuZ/m
nInnm7jlkIzlvaLlvI/nmoRUQ1NS5a+E5a2Y5Zmo44CCDQo+ID4gKyAgICAtIOeUqOS6juWgteWh
ni/ov57pgJrnmoQgVENVIOWvhOWtmOWZqOS5n+WPr+S7peWgteWhni/ov57pgJrnnIvpl6jni5fl
kowgT1NUIOaXtumSn+OAgg0KPg0KPiDpmLvloZ4tPuWFs+mXrQ0KPiDogZTpgJotPuW8gOWQrw0K
PiA/DQo+DQo+ID4gKw0KPiA+ICstIOavj+S4qlRDVemAmumBk+WcqOS4pOenjeaooeW8j+eahOWF
tuS4reS4gOenjeaooeW8j+S4i+i/kOihjO+8mg0KPiA+ICsNCj4gPiArICAgIC0g5qih5byPIFRD
VTHvvJrpgJrpgZPml6Dms5XlnKjnnaHnnKDmqKHlvI/kuIvov5DooYzvvIzkvYbmm7TmmJPkuo7m
k43kvZzjgIINCj4gPiArICAgIC0g5qih5byPIFRDVTLvvJrpgJrpgZPlj6/ku6XlnKjnnaHnnKDm
qKHlvI/kuIvov5DooYzvvIzkvYbmk43kvZzmr5QgVENVMSDpgJrpgZPlpI3mnYLkuIDkupvjgIIN
Cj4gPiArDQo+ID4gKy0g5q+P5LiqIFRDVSDpgJrpgZPnmoTmqKHlvI/lj5blhrPkuo7kvb/nlKjn
moTns7vnu5/nuqfoiq/niYfvvJoNCj4gPiArDQo+ID4gKyAgICAtIOWcqOacgOiAgeeahOezu+e7
n+e6p+iKr+eJh++8iOmrmOS6jkpaNDc0MO+8ie+8jOWFq+S4qumAmumBk+mDvei/kOihjOWcqFRD
VTHmqKHlvI/jgIINCj4gPiArICAgIC0g5ZyoIEpaNDcyNULvvIzpgJrpgZM16L+Q6KGM5ZyoVENV
MizlhbblroPpgJrpgZPliJnov5DooYzlnKhUQ1Ux44CCDQo+ID4gKyAgICAtIOWcqOacgOaWsOea
hOezu+e7n+e6p+iKr+eJh++8iEpaNDc1MOWPiuS5i+WQju+8ie+8jOmAmumBkzEtMui/kOihjOWc
qFRDVTLvvIzlhbblroPpgJrpgZMNCj4gPiArICAgICAg5YiZ6L+Q6KGM5ZyoVENVMeOAgg0KPiA+
ICsNCj4gPiArLSDmr4/kuKrpgJrpgZPlj6/ku6XnlJ/miJDkuK3mlq3jgILmnInkupvpgJrpgZPl
hbHkuqvkuIDmnaHkuK3mlq3nur/ot6/vvIzogIzmnInkupvmsqHmnInvvIzlhbblnKjns7vnu58N
Cj4gPiArICDnuqfoiq/niYfniYjmnKzkuYvpl7TnmoTlj5jmm7TvvJoNCj4NCj4gIueJiOacrCIg
c2VlbXMgYm9ndXMgdG8gbWUuIEFsdGhvdWdoIG9yaWdpbmFsIHRleHQgaXMgInZlcnNpb24iIGJ1
dCBwcm9iYWJseQ0KPiAi5Z6L5Y+3Ig0KPiBpcyBtdWNoIG1vcmUgZml0Pw0KPg0KPiBJJ2QgcHJl
ZmVyIGNhbGwgaXQgIuS4reaWree6vyIgaW5zdGVhZCBvZiDigJzkuK3mlq3nur/ot6/igJ0gYXMg
aXQgaXMgbm90IGEgcGh5c2ljYWwNCj4gY2lyY3VpdC4NCj4NCj4gPiArDQo+ID4gKyAgICAtIOWc
qOW+iOiAgeeahOezu+e7n+e6p+iKr+eJh++8iEpaNDc0MOWPiuabtOS9ju+8ie+8jOmAmumBkzDl
kozpgJrpgZMx5pyJ5a6D5Lus6Ieq5bex55qE5Lit5patDQo+ID4gKyAgICAgIOe6v+i3r++8m+mA
mumBkzItN+WFseS6q+acgOWQjuS4gOadoeS4reaWree6v+i3r+OAgg0KPiA+ICsgICAgLSDlnKgg
Slo0NzI1Qu+8jOmAmumBkzDmnInlroPoh6rlt7HnmoTkuK3mlq3nur/ot6/vvJvpgJrpgZMxLTXl
hbHkuqvkuIDmnaHkuK3mlq3nur/ot6/vvJtPU1QNCj4gPiArICAgICAg5L2/55So5pyA5ZCO5LiA
5p2h5Lit5pat57q/6Lev44CCDQo+ID4gKyAgICAtIOWcqOavlOi+g+aWsOeahOezu+e7n+e6p+iK
r+eJh++8iEpaNDc1MOWPiuS7peWQju+8ie+8jOmAmumBkzXmnInlroPoh6rlt7HnmoTkuK3mlq3n
ur/ot6/vvJvpgJoNCj4gPiArICAgICAg6YGTMC005ZKM77yI5aaC5p6c5pivOOmAmumBk++8iTYt
N+WFqOmDqOWFseS6q+S4gOadoeS4reaWree6v+i3r++8m09TVOS9v+eUqOacgOWQjuS4gOadoeS4
rQ0KPiA+ICsgICAgICDmlq3nur/ot6/jgIINCj4gPiArDQo+ID4gK+WunueOsA0KPiA+ICs9PT09
DQo+ID4gKw0KPiA+ICtUQ1Xnoazku7bnmoTlip/og73liIbluIPlnKjlpJrkuKrpqbHliqjnqIvl
uo/vvJoNCj4gPiArDQo+ID4gKz09PT09PT09PT09ICA9PT09PQ0KPiA+ICvml7bpkp8gICAgICAg
ICBkcml2ZXJzL2Nsay9pbmdlbmljL3RjdS5jDQo+ID4gK+S4reaWrSAgICAgICAgIGRyaXZlcnMv
aXJxY2hpcC9pcnEtaW5nZW5pYy10Y3UuYw0KPiA+ICvlrprml7blmaggICAgICAgZHJpdmVycy9j
bG9ja3NvdXJjZS9pbmdlbmljLXRpbWVyLmMNCj4gPiArT1NUICAgICAgICAgIGRyaXZlcnMvY2xv
Y2tzb3VyY2UvaW5nZW5pYy1vc3QuYw0KPiDmmbbmjK/vvJ8NCj4NCj4gVGhhbmtzLg0KPg0KPiAt
IEppYXh1bg0KPiA+ICtQV00gICAgICAgICAgZHJpdmVycy9wd20vcHdtLWp6NDc0MC5jDQo+ID4g
K+eci+mXqOeLlyAgICAgICBkcml2ZXJzL3dhdGNoZG9nL2p6NDc0MF93ZHQuYw0KPiA+ICs9PT09
PT09PT09PSAgPT09PT0NCj4gPiArDQo+ID4gK+WboOS4uuWPr+S7peS7juebuOWQjOeahOWvhOWt
mOWZqOaOp+WItuWxnuS6juS4jeWQjOmpseWKqOeoi+W6j+WSjOahhuaetueahFRDVeeahOWQhOen
jeWKn+iDve+8jOaJgOS7pQ0KPiA+ICvmiYDmnInov5nkupvpqbHliqjnqIvluo/pg73pgJrov4fn
m7jlkIznmoTmjqfliLbmgLvnur/pgJrnlKjmjqXlj6Porr/pl67lroPku6znmoTlr4TlrZjlmajj
gIINCj4gPiArDQo+ID4gK+acieWFs1RDVempseWKqOeoi+W6j+eahOiuvuWkh+agkee7keWumuea
hOabtOWkmuS/oeaBr++8jOivt+WPgumYhToNCj4gPiArRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL2luZ2VuaWMsdGN1LnlhbWwuDQo+DQo=
