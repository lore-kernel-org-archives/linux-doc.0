Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3E0C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jan 2022 02:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238908AbiANCwt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jan 2022 21:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238906AbiANCws (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jan 2022 21:52:48 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D544C061574
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:52:48 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id f24so4979644ioc.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hyNtQypswVkoo5WNBycXimsRa/fJm+5Jg3nLqUGptK8=;
        b=FZDTRpS4WWwvbBdQgcddqRVHr2ItPvbny5mkMDTWDZkeaWKrV6RCC5nrpb2/PQDQpy
         blU1zKX+kUoAoQd1xBuphiu35UlAW9F+hwPvJfes56wE8p7tpwsf0FnQvsD/sUjBmM7K
         fe0NsthM8CsFnOsZMQWHohGE34uWDAvZbflR7jOa6FkyOGL82aSwN1zuLXFJPBCcArkA
         eojrBiw7Zfj6LyyprfFtmz+y1z8Q9Uye4hKRFdFxEQaglgOPhES+nkAQvCKayyBmbO8g
         PKhwI5nXSzi5I05yJujyMv30yD91gb/sNLmC9Pez/2jkgzlVA9Kph3S3+vm6Clw18+sT
         a3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hyNtQypswVkoo5WNBycXimsRa/fJm+5Jg3nLqUGptK8=;
        b=OQKx64s0BHBS/SIcaljiT6e6KsvTDMBy2kjVEoLGQtpsEhCWgVwRC3kvoKh4jrfvmR
         9wYl9kCYuW3DpdObxNbhXLQxtDx0x50JVrZtzsUoj0B6YsaOJujBXdbeqPia8xuADDwC
         GvFaZ8zhOe6N2F2jgGmGmDupezzSmqubBNQS7ooz83bwAwvloPi0dyoh6qkU2Qhn/LPG
         Xz2sxCvOUoXo1vC5rmOIaBvg1P2pIxIeB/cFgpW3koKDT70BqK/QNTivKqRjl/Fcr2CO
         hR5R028cYNnppXsWAX9HBoESeM4hTEkQq5Py4nRNIrzbpWp9ix7fkoT7SV1FuNDqIRvl
         +G9A==
X-Gm-Message-State: AOAM532T9pLngbeI2yUlk4snWETxD/BFEzVIRG6vrHqJM44jJr4AGBAG
        HOHFfYyHiqkc3Kt6cJpDgoaInEy0yHyiqHxK34o=
X-Google-Smtp-Source: ABdhPJxygYVZ0w4HX9QULhOZAQ1eUL7vemwkyS8gOzjPRY1n9r3fTwlJF2HEv8Ad5E/j80A+MJ80cPKRbDDVtw5mkb4=
X-Received: by 2002:a05:6602:1347:: with SMTP id i7mr3451203iov.135.1642128767937;
 Thu, 13 Jan 2022 18:52:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642043630.git.siyanteng@loongson.cn> <431b45fab64d2d90b790e5890d86061b61742810.1642043630.git.siyanteng@loongson.cn>
In-Reply-To: <431b45fab64d2d90b790e5890d86061b61742810.1642043630.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 14 Jan 2022 10:52:11 +0800
Message-ID: <CAJy-AmkjgUMsuDH5DDP7H34aBu0Z2g7R02F7ibTZjYjf3ZdSnw@mail.gmail.com>
Subject: Re: [PATCH 2/4] docs/zh_CN: add damon faq translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKYW4gMTMsIDIwMjIgYXQgMTE6MjEgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFA
Z21haWwuY29tPiB3cm90ZToNCj4NCj4gVHJhbnNsYXRlIC4uLi92bS9kYW1vbi9mYXEucnN0IGlu
dG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+
IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9kYW1vbi9mYXEucnN0ICAgICAgIHwg
NDggKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9kYW1v
bi9pbmRleC5yc3QgICAgIHwgIDQgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2ZhcS5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2ZhcS5yc3QgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9kYW1vbi9mYXEucnN0DQo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDdiNGFjMTk0MDdkDQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vZGFtb24v
ZmFxLnJzdA0KPiBAQCAtMCwwICsxLDQ4IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdm0vZGFtb24vZmFx
LnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNp
eWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArDQo+ICs9PT09
PT09PQ0KPiAr5bi46KeB6Zeu6aKYDQo+ICs9PT09PT09PQ0KPiArDQo+ICvkuLrku4DkuYjmmK/k
uIDkuKrmlrDnmoTlrZDns7vnu5/vvIzogIzkuI3mmK/mianlsZVwZXJm5oiW5YW25LuW55So5oi3
56m66Ze05bel5YW377yfDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK+mmluWFiO+8jOWboOS4uuWug+mcgOimgeWw
veWPr+iDveeahOi9u+mHj+e6p++8jOS7peS+v+WPr+S7peWcqOe6v+S9v+eUqO+8jOaJgOS7peW6
lOivpemBv+WFjeS7u+S9leS4jeW/heimgeeahOW8gOmUgO+8jOWmguWGheaguC3nlKjmiLcNCj4g
K+epuumXtOeahOS4iuS4i+aWh+WIh+aNouaIkOacrOOAguesrOS6jO+8jERBTU9O55qE55uu5qCH
5piv6KKr5YyF5ous5YaF5qC45Zyo5YaF55qE5YW25LuW56iL5bqP5omA5L2/55So44CC5Zug5q2k
77yM5a+554m55a6a5bel5YW3DQo+ICvvvIjlpoJwZXJm77yJ55qE5L6d6LWW5oCn5piv5LiN5Y+v
5Y+W55qE44CC6L+Z5bCx5pivREFNT07lnKjlhoXmoLjnqbrpl7Tlrp7njrDnmoTkuKTkuKrmnIDl
pKfnmoTljp/lm6DjgIINCj4gKw0KPiArDQo+ICvigJzpl7Lnva7pobXpnaLot5/ouKrigJ0g5oiW
IOKAnHBlcmYgbWVt4oCdIOWPr+S7peabv+S7o0RBTU9O5ZCX77yfDQo+ICs9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK+mXsue9rumhtei3n+i4
quaYr+eJqeeQhuWcsOWdgOepuumXtOiuv+mXruajgOafpeeahOS4gOS4quS9juWxguasoeeahOWO
n+Wni+aWueazleOAguKAnHBlcmYgbWVt4oCd5Lmf5piv57G75Ly855qE77yM5bC9566h5a6D5Y+v
5LulDQo+ICvkvb/nlKjph4fmoLfmnaXlh4/lsJHlvIDplIDjgILlj6bkuIDmlrnpnaLvvIxEQU1P
TuaYr+S4gOS4quabtOmrmOWxguasoeeahOahhuaetu+8jOeUqOS6juebkeaOp+WQhOenjeWcsOWd
gOepuumXtOOAguWug+S4k+azqOS6juWGhQ0KPiAr5a2Y566h55CG5LyY5YyW77yM5bm25o+Q5L6b
5aSN5p2C55qE57K+5bqmL+W8gOmUgOWkhOeQhuacuuWItuOAguWboOatpO+8jOKAnOepuumXsumh
temdoui3n+i4quKAnSDlkowg4oCccGVyZiBtZW3igJ0g5Y+v5Lul5o+Q5L6bDQo+ICtEQU1PTui+
k+WHuueahOS4gOS4quWtkOmbhu+8jOS9huS4jeiDveabv+S7o0RBTU9O44CCDQo+ICsNCj4gKw0K
PiArREFNT07mmK/lkKblj6rmlK/mjIHomZrmi5/lhoXlrZjvvJ8NCj4gKz09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gKw0KPiAr5LiN77yMREFNT07nmoTmoLjlv4PmmK/ni6znq4vkuo7lnLDl
nYDnqbrpl7TnmoTjgILnlKjmiLflj6/ku6XlnKhEQU1PTuaguOW/g+S4iuWunueOsOWSjOmFjee9
rueJueWumuWcsOWdgOepuumXtOeahOS9jue6p+WOn+Wniw0KPiAr6YOo5YiG77yM5YyF5ous55uR
5rWL55uu5qCH5Yy65Z+f55qE5p6E6YCg5ZKM5a6e6ZmF55qE6K6/6Zeu5qOA5p+l44CC6YCa6L+H
6L+Z56eN5pa55byP77yMREFNT07nlKjmiLflj6/ku6XnlKjku7vkvZXorr/pl67mo4Dmn6XmioAN
Cj4gK+acr+adpeebkea1i+S7u+S9leWcsOWdgOepuumXtOOAgg0KPiArDQo+ICvlsL3nrqHlpoLm
raTvvIxEQU1PTum7mOiupOS4uuiZmuaLn+WGheWtmOWSjOeJqeeQhuWGheWtmOaPkOS+m+S6huWf
uuS6jnZtYS9ybWFw6Lef6Liq5ZKMUFRF6K6/6Zeu5L2N5qOA5p+l55qE5Zyw5Z2A56m66Ze0DQo+
ICvnm7jlhbPlip/og73nmoTlrp7njrDvvIzku6Xkvpvlj4LogIPlkozmlrnkvr/kvb/nlKjjgIIN
Cj4gKw0KPiArDQo+ICvmiJHlj6/ku6XnroDljZXlnLDnm5HmtYvpobXpnaLnmoTnspLluqblkJfv
vJ8NCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICvmmK/nmoTvvIzk
vaDlj6/ku6XpgJrov4forr7nva4gYGBtaW5fbnJfcmVnaW9uc2BgIOWxnuaAp+mrmOS6juW3peS9
nOmbhuWkp+Wwj+mZpOS7pemhtemdouWkp+Wwj+eahOWAvOadpeWunueOsOOAgg0KPiAr5Zug5Li6
55uR6KeG55uu5qCH5Yy65Z+f55qE5aSn5bCP6KKr5by65Yi25Li6IGBgPj1wYWdlIHNpemVgYCDv
vIzmiYDku6XljLrln5/liIblibLkuI3kvJrkuqfnlJ/ku7vkvZXlvbHlk43jgIINCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2luZGV4LnJzdA0K
PiBpbmRleCA5YTdiNGVhOTFjYjguLmRmYTgyMjQ0Y2JlOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vZGFtb24vaW5kZXgucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2luZGV4LnJzdA0KPiBAQCAt
MjcsNyArMjcsOSBAQCBEQU1PTuaYr0xpbnV45YaF5qC455qE5LiA5Liq5pWw5o2u6K6/6Zeu55uR
5o6n5qGG5p625a2Q57O757uf44CCREFNT07nmoTmoLjlv4MNCj4gIC4uIHRvY3RyZWU6Og0KPiAg
ICAgOm1heGRlcHRoOiAyDQo+DQo+ICsgICBmYXENCj4gKw0KPiAgVE9ET0xJU1Q6DQo+IC0qICAg
ZmFxDQo+ICsNCj4gICogICBkZXNpZ24NCj4gICogICBhcGkNCj4gLS0NCj4gMi4yNy4wDQo+DQo=
