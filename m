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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CED0C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 02:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32CC561A2A
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 02:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhC0COJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 22:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhC0CNz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 22:13:55 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55890C0613AA
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 19:13:55 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id w3so11146362ejc.4
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aCb0vL++9Q0mZTHQFK//FXVSSjEAhkBycTNFku6ZguY=;
        b=Uh93tIJSqXcBbsgelWtmwQh2X7w2olZWcl0wpj0BdbKbzWm0TiOvokJ/JFfiAUk13S
         0np5gopyVyHVY+Fw1nWREnhwpxb1lgyz7MZDrA+W/pV3DFaIhIouG4Fi8ezLVcfiNknx
         WffrmajS7C+GwaJeICdEU5VigsPj+yID5MluIh3cLMZKCdFm2N6kxfccSfxq9MoUXr7k
         85P0MF4KJIqK0ZlOj0v7nHRQFKEUl6NSOmbxWOM6NqTSUHLLAtK6QYjH8S+WLbieT2o0
         +ugZsjFrBj2RWkt4MALQfCxoOoJ+b0oW8G2d5NCz/kSBYBtbSkQw8fO27YxyED202pzJ
         4XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aCb0vL++9Q0mZTHQFK//FXVSSjEAhkBycTNFku6ZguY=;
        b=OpToSmG3Ixu452fODsPt9N6WOBkJjjxaNb2VCYq9M91AfVPTciIeQrkch3G9Pk9yZw
         D6S4Tkqnnc3k7XO64ZeKKMZFmvlO+ThVJF7qgTon7UNI8JyXXx18DMToCbV+rBmaBLAC
         FYYJTnHSHs+ndrfaz2Wvv+8x2qTfz22QI+mSeF7ZxH3FrzHGdw7vzWtP+47h98Z8MvRS
         ZkDqxshiVdq1/fU8SFnjn1m1ZgC2fL5vrbLasz3tG/csY0KpvcoikPjX1Meg1TeuPn4e
         IClTNpyjioL5m8Dw38ibYcbtu4jIemBsMo+3iEGx5pNXSYnC9chx48Seld8Ldvmuqs8Q
         yV7w==
X-Gm-Message-State: AOAM533M0/VN/kYRYSxeFt2RUbt7ZG2q7R7ZaTW+B3QxcSAJrmu7WN3a
        vUU/dJASrhl/ppBuDrez0P2Ju+j+HdDoJPrSGnmpoFTrM7PiYg==
X-Google-Smtp-Source: ABdhPJzkbEN46rYNGST2DAz7OWrA6QtL/TNZecX/5HsEdct103vxkCOAqoZ6mvoJAK4RZ7U0X/N8UdFK3DzaQ76RZIc=
X-Received: by 2002:a17:906:af91:: with SMTP id mj17mr17785766ejb.230.1616811233895;
 Fri, 26 Mar 2021 19:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210324150731.4512-1-siyanteng@loongson.cn> <20210324150731.4512-2-siyanteng@loongson.cn>
 <5623c525-2898-4583-bd0c-df2dd4059bea@www.fastmail.com>
In-Reply-To: <5623c525-2898-4583-bd0c-df2dd4059bea@www.fastmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 27 Mar 2021 10:13:44 +0800
Message-ID: <CAEensMwE37FhbzOdMOvPYxnusz8nBp50HaDEjt7UEbFfFgb1ZQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs/zh_CN: add cpu-freq core.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPiDkuo4yMDIx5bm0M+aciDI25pel
5ZGo5LqUIOS4iuWNiDExOjEz5YaZ6YGT77yaDQo+DQo+DQo+DQo+IE9uIFdlZCwgTWFyIDI0LCAy
MDIxLCBhdCAxMTowNyBQTSwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5z
bGF0ZXMgRG9jdW1lbnRpb24vY3B1LWZyZXEvY29yZS5yc3QgaW50byBDaGluZXNlLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NvcmUucnN0ICAgICAg
fCAxMDUgKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMDUgaW5zZXJ0
aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdA0KPiA+IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTU3MTA4N2MyNTgxDQo+ID4g
LS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2NwdS1mcmVxL2NvcmUucnN0DQo+ID4gQEAgLTAsMCArMSwxMDUgQEANCj4gPiArLi4gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWlt
ZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6IDpkb2M6YC4uLy4uLy4uL2NwdS1m
cmVxL2NvcmVgDQo+ID4gKzpUcmFuc2xhdG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+DQo+ID4gKw0KPiA+ICsuLiBfY25fY29yZS5yc3Q6DQo+ID4gKw0KPiA+ICsNCj4gPiAr
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gK0NQVUZyZXHmoLjlv4Pl
koxDUFVGcmVx6YCa55+l5Zmo55qE5LiA6Iis6K+05piODQo+ID4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPg0KPiDkuIDoiKwgLT4g6YCa55So77yfDQpPSyENCj4NCj4g
PiArDQo+ID4gK+S9nOiAhToNCj4gPiArICAgICAtIERvbWluaWsgQnJvZG93c2tpICA8bGludXhA
YnJvZG8uZGU+DQo+ID4gKyAgICAgLSBEYXZpZCBLaW1kb24gPGR3aGVkb25AZGViaWFuLm9yZz4N
Cj4gPiArICAgICAtIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNv
bT4NCj4gPiArICAgICAtIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+DQo+
ID4gKw0KPiA+ICsuLiDnm67lvZU6DQo+ID4gKw0KPiA+ICsgICAxLiAgQ1BVRnJlceaguOW/g+WS
jOaOpeWPow0KPiA+ICsgICAyLiAgQ1BVRnJlcemAmuefpeWZqA0KPiA+ICsgICAzLiAg5ZCr5pyJ
T3BlcmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJlceihqOeahOeUn+aIkA0K
PiA+ICsNCj4gPiArMS4gQ1BVRnJlceaguOW/g+WSjOaOpeWPow0KPiA+ICs9PT09PT09PT09PT09
PT09PT09PT09DQo+ID4gKw0KPiA+ICtjcHVmcmVx5qC45b+D5Luj56CB5L2N5LqOZHJpdmVycy9j
cHVmcmVxL2NwdWZyZXEuY+S4reOAgui/meS6m2NwdWZyZXHku6PnoIHkuLpDUFVGcmVx5p625p6E
55qE6amxDQo+ID4gK+WKqOeoi+W6j++8iOmCo+S6m+i/m+ihjOWunumZhemikeeOh+i9rOaNouea
hOS7o+egge+8ieS7peWPiiAi6YCa55+l5ZmoICLmj5DkvpvkuobkuIDkuKrmoIflh4bljJbnmoTm
jqXlj6PjgIINCj4NCj4g6YKj5Lqb5pON5L2c56Gs5Lu25YiH5o2i6aKR546H55qE5Luj56CBIHdp
bGwgaGVscCB3aXRoIHVuZGVyc3RhbmRpbmcuDQpPSyENCj4NCj4NCj4gPiAr6L+Z5Lqb5piv6K6+
5aSH6amx5Yqo56iL5bqP5oiW6ZyA6KaB5LqG6Kej562W55Wl5Y+Y5YyW55qE5YW25a6D5YaF5qC4
6YOo5YiG77yI5aaCIEFDUEkg562J54Ot5qih5Z2X77yJ5oiW5omA5pyJ6aKR546H5pu05pS577yI
6ZmkDQo+IEFkZCBzYmplY3QgIumAmuefpeWZqCINCj4g54Ot5qih5Z2XIHNlZW1zIGJvZ3VzLCDn
g63ph4/nrqHnkIbvvJ8NCk9LIQ0KPuKAnA0KPiA+ICvorqHml7bku6PnoIHlpJbvvInvvIznlJro
h7PpnIDopoHlvLrliLbnoa7lrprpgJ/luqbpmZDliLbvvIjlpoIgQVJNIOaetuaehOS4iueahCBM
Q0Qg6amx5Yqo56iL5bqP77yJ44CCDQo+ID4gK+atpOWklu+8jCDlhoXmoLggIuW4uOaVsCIgbG9v
cHNfcGVyX2ppZmZ55Lya5qC55o2u6aKR546H5Y+Y5YyW6ICM5pu05paw44CCDQo+ID4gKw0KPiA+
ICtjcHVmcmVx562W55Wl55qE5byV55So6K6h5pWw55SxIGNwdWZyZXFfY3B1X2dldCDlkowgY3B1
ZnJlcV9jcHVfcHV0IOadpeWujOaIkO+8jOS7peehruS/nSBjcHVmcmVxIOmpsQ0KPiA+ICvliqjn
qIvluo/ooqvmraPnoa7lnLDms6jlhozliLDmoLjlv4PkuK3vvIzlubbkuJTlnKggY3B1ZnJlcV9w
dXRfY3B1IOiiq+iwg+eUqOS5i+WJjeS4jeS8muiiq+WNuOi9veOAgui/meS5n+S/neivgeS6huWQ
hOiHqueahA0KPiA+ICtjcHVmcmVxIOetlueVpeWcqOS9v+eUqOaXtuS4jeS8muiiq+mHiuaUvuOA
gg0KPg0KPiBJdCBtYWtlcyBtZSAiUGFyc2VyIGVycm9yIiB3aGVuIHJlYWRpbmcuLi4uLg0KZW1t
bW0uIEkgZ3Vlc3MgImNwdWZyZXFfcHV0X2NwdSAtPiBjcHVmcmVxX2NwdV9wdXQsIg0KTWF5YmUg
SSBzaG91bGQgcmV2aXNlIHRoZSBvcmlnaW5hbCBkcmFmdCBmaXJzdOOAgg0KDQphcyBmb3IgIlBh
cnNlciBlcnJvciINCitjcHVmcmVx562W55Wl55qE5byV55So6K6h5pWw55SxIGNwdWZyZXFfY3B1
X2dldCDlkowgY3B1ZnJlcV9jcHVfcHV0IOadpeWujOaIkO+8jOS7peehruS/nSBjcHVmcmVxIOmp
sQ0KK+WKqOeoi+W6j+iiq+ato+ehruWcsOazqOWGjOWIsOaguOW/g+S4re+8jOW5tuS4lOmpseWK
qOeoi+W6j+WcqCBjcHVmcmVxX2NwdV9wdXQg6KKr6LCD55So5LmL5YmN5LiN5Lya6KKr5Y246L29
44CC6L+Z5Lmf5L+d6K+B5LqG5q+P5Liq5qC455qEDQorY3B1ZnJlcSDnrZbnlaXlnKjkvb/nlKjm
l7bkuI3kvJrooqvph4rmlL7jgIINCk9LPzopDQoNCj4NCj4gPiArDQo+ID4gKzIuIENQVUZyZXEg
6YCa55+l5ZmoDQo+ID4gKz09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICtDUFVGcmVx
6YCa55+l5Zmo56ym5ZCI5qCH5YeG55qE5YaF5qC46YCa55+l5Zmo5o6l5Y+j44CCDQo+ID4gK+WF
s+S6jumAmuefpeWZqOeahOe7huiKguivt+WPgumYhSBsaW51eC9pbmNsdWRlL2xpbnV4L25vdGlm
aWVyLmjjgIINCj4gPiArDQo+ID4gK+i/memHjOacieS4pOS4quS4jeWQjOeahENQVWZyZXHpgJrn
n6XlmaggLSDnrZbnlaXpgJrnn6XlmajlkozovazmjaLpgJrnn6XlmajjgIINCj4gPiArDQo+ID4g
Kw0KPiA+ICsyLjEgQ1BVRnJlceetlueVpemAmuefpeWZqA0KPiA+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlvZPliJvlu7rmiJbnp7vpmaTnrZbnlaXml7bvvIzo
v5nkupvpg73kvJrooqvpgJrnn6XjgIINCj4gPiArDQo+ID4gK+mYtuauteaYr+WcqOmAmuefpeWZ
qOeahOesrOS6jOS4quWPguaVsOS4reaMh+WumueahOOAguW9k+esrOS4gOasoeWIm+W7uuetlueV
peaXtu+8jOmYtuauteaYr0NQVUZSRVFfQ1JFQVRFX1BPTElDWe+8jOW9kw0KPiA+ICvnrZbnlaXo
oqvnp7vpmaTml7bvvIzpmLbmrrXmmK9DUFVGUkVRX1JFTU9WRV9QT0xJQ1njgIINCj4gPiArDQo+
ID4gK+esrOS4ieS4quWPguaVsCBgYHZvaWQgKnBvaW50ZXJgYCDmjIflkJHkuIDkuKrnu5PmnoTk
vZNjcHVmcmVxX3BvbGljee+8jOWFtuWMheaLrG1pbu+8jG1heCjmlrDnrZbnlaXnmoTkuIvpmZDl
kowNCj4gPiAr5LiK6ZmQ77yI5Y2V5L2N5Li6a0h677yJKei/meWHoOS4quWAvOOAgg0KPiA+ICsN
Cj4gPiArDQo+ID4gKzIuMiBDUFVGcmVx6L2s5o2i6YCa55+l5ZmoDQo+ID4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlvZNDUFVmcmVx6amx5Yqo5YiH5o2i
Q1BV5qC45b+D6aKR546H5pe277yM562W55Wl5Lit55qE5q+P5Liq5Zyo57q/Q1BV6YO95Lya5pS2
5Yiw5Lik5qyh6YCa55+l77yM6L+Z5Lqb5Y+Y5YyW5rKh5pyJ5Lu75L2V5aSW6YOo5bmyDQo+ID4g
K+mihOOAgg0KPiA+ICsNCj4gPiAr56ys5LqM5Liq5Y+C5pWw5oyH5a6a6Zi25q61IC0gQ1BVRlJF
UV9QUkVDSEFOR0Ugb3IgQ1BVRlJFUV9QT1NUQ0hBTkdFLg0KPiA+ICsNCj4gPiAr56ys5LiJ5Liq
5Y+C5pWw5piv5LiA5Liq5YyF5ZCr5aaC5LiL5YC855qE57uT5p6E5L2TY3B1ZnJlcV9mcmVxc++8
mg0KPiA+ICsNCj4gPiArPT09PT0gICAgICAgID09PT09PT09PT09PT09PT09PT09DQo+ID4gK2Nw
dSAg5Y+X5b2x5ZONY3B155qE57yW5Y+3DQo+ID4gK29sZCAg5pen6aKR546HDQo+ID4gK25ldyAg
5paw6aKR546HDQo+ID4gK2ZsYWdzICAgICAgICBjcHVmcmVx6amx5Yqo55qE5qCH5b+XDQo+ID4g
Kz09PT09ICAgICAgICA9PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArMy4g5ZCr5pyJ
T3BlcmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJlceihqOeahOeUn+aIkA0K
PiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4gPiAr5YWz5LqOT1BQ55qE57uG6IqC6K+35Y+C6ZiFIERvY3VtZW50
YXRpb24vcG93ZXIvb3BwLnJzdA0KPiA+ICsNCj4gPiArZGV2X3BtX29wcF9pbml0X2NwdWZyZXFf
dGFibGUgLQ0KPiA+ICsgICAgIOi/meS4quWKn+iDveaPkOS+m+S6huS4gOS4qumaj+aXtuWPr+eU
qOeahOi9rOaNoueoi+W6j++8jOeUqOadpeWwhk9QUOWxguWFs+S6juWPr+eUqOmikeeOh+eahOWG
hemDqOS/oeaBr+e/u+ivkeaIkOS4gOenjeWuueaYk+aPkOS+m+e7mQ0KPiA+ICsgICAgIGNwdWZy
ZXHnmoTmoLzlvI/jgIINCj4gPiArDQo+ID4gKyAgICAgLi4gV2FybmluZzo6DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAg5LiN6KaB5Zyo5Lit5pat5LiK5LiL5paH5Lit5L2/55So5q2k5Ye95pWw
44CCDQo+ID4gKw0KPiA+ICsgICAgIOS+i+Wmgjo6DQo+ID4gKw0KPiA+ICsgICAgICBzb2NfcG1f
aW5pdCgpDQo+ID4gKyAgICAgIHsNCj4gPiArICAgICAgICAgICAgIC8qIERvIHRoaW5ncyAqLw0K
PiA+ICsgICAgICAgICAgICAgciA9IGRldl9wbV9vcHBfaW5pdF9jcHVmcmVxX3RhYmxlKGRldiwg
JmZyZXFfdGFibGUpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFyKQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBwb2xpY3ktPmZyZXFfdGFibGUgPSBmcmVxX3RhYmxlOw0KPiA+ICsgICAgICAg
ICAgICAgLyogRG8gb3RoZXIgdGhpbmdzICovDQo+ID4gKyAgICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAgLi4gbm90ZTo6DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg6K+l5Ye95pWw5Y+q5pyJ5Zyo
Q09ORklHX1BNX09QUOS5i+Wklui/mOWQr+eUqOS6hkNPTkZJR19DUFVfRlJFUeaXtuaJjeWPr+eU
qOOAgg0KPiA+ICsNCj4gPiArZGV2X3BtX29wcF9mcmVlX2NwdWZyZXFfdGFibGUNCj4gPiArICAg
ICDph4rmlL5kZXZfcG1fb3BwX2luaXRfY3B1ZnJlcV90YWJsZeWIhumFjeeahOihqOOAgg0KPiA+
IC0tDQo+ID4gMi4yNS4xDQo+ID4NCj4gPg0KPg0KPiAtLQ0KPiAtIEppYXh1bg0KDQpZYW4gdGVu
Zw0K
