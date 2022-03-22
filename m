Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6359C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiCVIA0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 04:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiCVIAZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 04:00:25 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96C12AE0B
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:58:58 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id 125so6011058iov.10
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RpztKbccu8CAWRu2LCUw9V1Q+FAre3r3JZNKJg50HTY=;
        b=UCgjr7lMwa2Ulsdxh1lnMgs/l0zYhFYqDCCTywMRkozs+OLY4TrzF60xzU5F6keQhQ
         0fuTuqPFcAwXSahakstcv2LEPMFCGcXWabIm758AyFfwrKWIf1kuipCFt/gO3flz02gt
         0xakJkPqqlWcukKiNTbh+Yc9DtZ83OZfJ7tlYemJK9XJU4CHY7DDn0MuuCQtyCHnfUHS
         TC5LM3qO2qnFBDSEa6TOeiQBhzgZ5NTBNYo5k1BWqG+sU2A4yesjVJTqFugHoIZUk7gV
         GhqocDpBiqDce5KQq7QACjdILUBIIK0/p59F4Oc3NUmGVpFk/u36YX3S6JKr0gphdKo2
         FNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RpztKbccu8CAWRu2LCUw9V1Q+FAre3r3JZNKJg50HTY=;
        b=fcZ09ncETAye9lRohb4A8zcj1RbTJ5c0WKG55+BBGpvRhy1kJU0yEsMlh1kAje8xRL
         4Fs20B1l1/85t8jwK/H6bSTHTv9KaaZ1U2fMZFLcHxjdYKXIDfZIwU6hiPKAJVfwVA48
         G5GBbMfPBWgW/OlcpyKDji18bOeOIkcVMavHCnloxwJBKIUK7GHqzsQ8L1evkTwBuKEF
         QxidtfaEIeY11FnUq9t68liFel6KwFLOBROO8vquGWZjpaccuwf52Yrhp4PzKlztOV4L
         Zqio5yMzBeYmNw2yRxoEGOAaY4Rwt9XcuEG/7SRW7QBvRCo8E9kXv/n/tyV+fKB4qz3H
         L7+w==
X-Gm-Message-State: AOAM531WKTCvZj15By48e76pstmh6+sK93suBvOdjJ1Zz/TW5ZZ0P2gS
        TAOzLh93oaRxNFfaiETaIBttk8H5LWY6Qcf8V9KNraOYwrQ7IICL
X-Google-Smtp-Source: ABdhPJx+tNlpxFiO9FXumlc+x7KcvX5C7FoMRfGj/mebR48UcP4AW5Ffm/QQvpRpg4UgiUZ8vfIEM6BtxR9tko+6PaU=
X-Received: by 2002:a02:3501:0:b0:314:48d3:2d6b with SMTP id
 k1-20020a023501000000b0031448d32d6bmr12004901jaa.169.1647935938327; Tue, 22
 Mar 2022 00:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <c0c9599c28a3e2a428cb8191f01dde6ce8b40d81.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <c0c9599c28a3e2a428cb8191f01dde6ce8b40d81.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:58:22 +0800
Message-ID: <CAJy-AmnewTZCw1m6c_7V9W8+uQjJb1OM1v6SakVrFFHMzphZ4A@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] docs/zh_CN: add vm page_frags translation
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
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vcGFnZV9mcmFncy5yc3QgaW50byBDaGluZXNl
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgMiArLQ0KPiAg
Li4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX2ZyYWdzLnJzdCAgICAgIHwgMzggKysrKysr
KysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vcGFnZV9mcmFncy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBpbmRleCAxYzZlYzg0N2EyZjMuLmY0NzgwMzJj
ZDQ3NyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0v
aW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2lu
ZGV4LnJzdA0KPiBAQCAtMzIsNiArMzIsNyBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/
u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPiAgICAgbWVtb3J5LW1vZGVs
DQo+ICAgICBtbXVfbm90aWZpZXINCj4gICAgIG92ZXJjb21taXQtYWNjb3VudGluZw0KPiArICAg
cGFnZV9mcmFncw0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+
IEBAIC00MCw3ICs0MSw2IEBAIFRPRE9MSVNUOg0KPiAgKiBodWdldGxiZnNfcmVzZXJ2DQo+ICAq
IG51bWENCj4gICogcGFnZV9taWdyYXRpb24NCj4gLSogcGFnZV9mcmFncw0KPiAgKiBwYWdlX293
bmVyDQo+ICAqIHBhZ2VfdGFibGVfY2hlY2sNCj4gICogcmVtYXBfZmlsZV9wYWdlcw0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcGFnZV9mcmFncy5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX2ZyYWdzLnJzdA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFkMjdmZWQzMzYz
NA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZtL3BhZ2VfZnJhZ3MucnN0DQo+IEBAIC0wLDAgKzEsMzggQEANCj4gKzpPcmlnaW5hbDog
RG9jdW1lbnRhdGlvbi92bS9wYWdlX2ZyYWcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs6
5qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09DQo+ICvpobXpnaLniYfmrrUNCj4gKz09PT09
PT09DQo+ICsNCj4gK+S4gOS4qumhtemdoueJh+auteaYr+S4gOS4quS7u+aEj+mVv+W6pueahOS7
u+aEj+WBj+enu+eahOWGheWtmOWMuuWfn++8jOWug+S9jeS6juS4gOS4qjDmiJbmm7Tpq5jpmLbn
moTlpI3lkIjpobXpnaLkuK3jgIINCj4gK+ivpemhteS4reeahOWkmuS4queijueJh+WcqOivpemh
teeahOW8leeUqOiuoeaVsOWZqOS4reiiq+WNleeLrOiuoeeul+OAgg0KPiArDQo+ICtwYWdlX2Zy
YWflh73mlbDvvIxwYWdlX2ZyYWdfYWxsb2PlkoxwYWdlX2ZyYWdfZnJlZe+8jOS4uumhtemdoueJ
h+auteaPkOS+m+S6huS4gOS4queugOWNlQ0KPiAr55qE5YiG6YWN5qGG5p6244CC6L+Z6KKr572R
57uc5aCG5qCI5ZKM572R57uc6K6+5aSH6amx5Yqo5L2/55So77yM5Lul5o+Q5L6b5LiA5Liq5YaF
5a2Y55qE5pSv5oyB5Yy65Z+f77yM5L2c5Li6DQo+ICtza19idWZmLT5oZWFk5L2/55So77yM5oiW
6ICF55So5LqOc2tiX3NoYXJlZF9pbmZv55qEIOKAnGZyYWdz4oCdIOmDqOWIhuOAgg0KPiArDQo+
ICvkuLrkuobkvb/nlKjpobXpnaLniYfmrrVBUEnvvIzpnIDopoHkuIDkuKrmlK/mjIHpobXpnaLn
iYfmrrXnmoTnvJPlhrLljLrjgILov5nkuLrnoo7niYfliIbphY3mj5DkvpvkuobkuIDkuKrkuK3l
v4PngrnvvIwNCj4gK+W5tuWFgeiuuOWkmuS4quiwg+eUqOS9v+eUqOS4gOS4que8k+WtmOeahOmh
temdouOAgui/meagt+WBmueahOWlveWkhOaYr+WPr+S7pemBv+WFjeWvuWdldF9wYWdl55qE5aSa
5qyh6LCD55So77yMDQo+ICvov5nlnKjliIbphY3ml7blvIDplIDlj6/og73kvJrlvojlpKfjgILn
hLbogIzvvIznlLHkuo7ov5nnp43nvJPlrZjnmoTmgKfotKjvvIzopoHmsYLku7vkvZXlr7nnvJPl
rZjnmoTosIPnlKjpg73opoHlj5fliLDmr48NCj4gK+S4qkNQVeeahOmZkOWItu+8jOaIluiAheav
j+S4qkNQVeeahOmZkOWItu+8jOW5tuWcqOaJp+ihjOeijueJh+WIhumFjeaXtuW8uuWItuemgeat
ouS4reaWreOAgg0KPiArDQo+ICvnvZHnu5zloIbmoIjlnKjmr4/kuKpDUFXkvb/nlKjkuKTkuKrn
i6znq4vnmoTnvJPlrZjmnaXlpITnkIbnoo7niYfliIbphY3jgIJuZXRkZXZfYWxsb2NfY2FjaGXo
oqvkvb/nlKgNCj4gK25ldGRldl9hbGxvY19mcmFn5ZKMX19uZXRkZXZfYWxsb2Nfc2ti6LCD55So
55qE6LCD55So6ICF5L2/55So44CCbmFwaV9hbGxvY19jYWNoZQ0KPiAr6KKr6LCD55SoX19uYXBp
X2FsbG9jX2ZyYWflkoxfX25hcGlfYWxsb2Nfc2ti55qE6LCD55So6ICF5L2/55So44CC6L+Z5Lik
5Liq6LCD55So55qE5Li76KaB5Yy65Yir5pivDQo+ICvlroPku6zlj6/og73ooqvosIPnlKjnmoTn
jq/looPjgILigJxuZXRkZXbigJ0g5YmN57yA55qE5Ye95pWw5Y+v5Lul5Zyo5Lu75L2V5LiK5LiL
5paH5Lit5L2/55So77yM5Zug5Li66L+Z5Lqb5Ye95pWwDQo+ICvlsIbnpoHnlKjkuK3mlq3vvIzo
gIwg4oCdbmFwaeKAnCDliY3nvIDnmoTlh73mlbDlj6rlj6/ku6XlnKhzb2Z0aXJx5LiK5LiL5paH
5Lit5L2/55So44CCDQo+ICsNCj4gK+iuuOWkmue9kee7nOiuvuWkh+mpseWKqOeoi+W6j+S9v+eU
qOexu+S8vOeahOaWueazleadpeWIhumFjemhtemdoueJh+aute+8jOS9humhtemdoueJh+auteaY
r+WcqOeOr+aIluaPj+i/sOespue6p+WIq+S4ig0KPiAr57yT5a2Y55qE44CC5Li65LqG5a6e546w
6L+Z5Lqb5oOF5Ya177yM5pyJ5b+F6KaB5o+Q5L6b5LiA56eN5ouG6Kej6aG16Z2i57yT5a2Y55qE
6YCa55So5pa55rOV44CC5Ye65LqO6L+Z5Liq5Y6f5Zug77yMDQo+ICtfX3BhZ2VfZnJhZ19jYWNo
ZV9kcmFpbuiiq+WunueOsOS6huOAguWug+WFgeiuuOmAmui/h+S4gOasoeiwg+eUqOS7juS4gOS4
qumhtemdoumHiuaUvuWkmuS4quW8leeUqOOAgg0KPiAr6L+Z5qC35YGa55qE5aW95aSE5piv77yM
5a6D5YWB6K645riF55CG6KKr5re75Yqg5Yiw5LiA5Liq6aG16Z2i55qE5aSa5Liq5byV55So77yM
5Lul6YG/5YWN5q+P5qyh5YiG6YWN6YO96LCD55SoDQo+ICtnZXRfcGFnZeOAgg0KPiArDQo+ICtB
bGV4YW5kZXIgRHV5Y2vvvIwyMDE25bm0MTHmnIgyOeaXpeOAgg0KPiAtLQ0KPiAyLjI3LjANCj4N
Cg==
