Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42A0ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  2 Sep 2022 06:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiIBG51 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Sep 2022 02:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiIBG51 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 02:57:27 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E369FBBA7E
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 23:57:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id by6so1293559ljb.11
        for <linux-doc@vger.kernel.org>; Thu, 01 Sep 2022 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=SoBO4qtB+ovJNtffG98G/Vv5KyldNZJcdF/z7Oa5gFA=;
        b=LBCz9rOqlagATtRT0TSGN4WcePXtO5RHUAG2Gs8vJEMGIRgyh2c8TDhExzFk10oMUi
         zJ2b8HyFO30dqa3i2p5EtLehT95oVCueCUBgD/oblJOgAk1rJPZQmoVqy79lT/oOw5lX
         EQC76BEMeef2/rsUzEOr6tMj4ri3zKQcusgZI1zneMwCA4t1kmSvGRN0jDxvnXQsCtu4
         nqw7XyawsvopPrGkPFYIMBxZsEkeVDjiAWG1XA20r1axTW+aQeLwnoWxooHow9GyaiQk
         NmBM1+EnAmegQ73BWOUpKHz2K+VhhpeVWhB0f/IuCL+buLLeOZx9cQ1vdsiewNpYVIG6
         DO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SoBO4qtB+ovJNtffG98G/Vv5KyldNZJcdF/z7Oa5gFA=;
        b=RvBMzu1rotQYXVUYLFJ4o0Dbm+Cs6vsu7m7D1NIaQISq1uvAwfbMCdSa1uARW3XC8w
         TW8u9g3kfFBwPV8oscgiRfYsi7Oh82mcDg3+JXReOIT/JpFEmiFZqUrOoQrE303GqlvA
         Vc/mwtzGqBAtIajS1RrAph557vKxcLnPeHaOF7dq7XUBZ0NMc9k5pYU+ZFSiLex73rKU
         NxMXgjTsmxrY9T2si14wcTW9kzPya0NEhfsZPmmNwCcizdx3MlJYPF5/msuYqAeTotVq
         FI4F/34Wu0ofGLO78c6S9x2hc6LSKSnCX3r36+X4uxbQrWnhd3sFYt48ol/APkSIkSfO
         +vSA==
X-Gm-Message-State: ACgBeo3dqO/m8wXzAQnRGukjlHVa7r0fpclHAIXkK7iQJfTifT72Le3/
        aV7/YYASIpcwbu9QJ5Ujf3ycDoso+w5pl2iCsf0PzP8S8DPw9w==
X-Google-Smtp-Source: AA6agR7RkDNNnS3+YL7FAgT+KCFUsodiQ+YmHJ6F9QYjXNH+XvtnjFOSStjVMlkz4s2OzSJYPj3hja8CV3y118QPW0w=
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr10704761lji.525.1662101844049; Thu, 01
 Sep 2022 23:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662022757.git.siyanteng@loongson.cn> <967ae2411a8ed7a5b130dd81cb8abe31a1356c74.1662022757.git.siyanteng@loongson.cn>
In-Reply-To: <967ae2411a8ed7a5b130dd81cb8abe31a1356c74.1662022757.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 2 Sep 2022 14:56:47 +0800
Message-ID: <CAJy-AmmHfrb9mgVrbrbf9vmVdYrW1HLv362xk3M_3v8yXGPtfg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] docs/zh_CN: add dt changesets translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBTZXAgMSwgMjAyMiBhdCA3OjE2IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vZGV2aWNldHJlZS9jaGFuZ2VzZXRz
LnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFu
dGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gLS0tDQo+ICAuLi4vemhfQ04vZGV2aWNldHJlZS9jaGFuZ2Vz
ZXRzLnJzdCAgICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrDQo+ICAuLi4vdHJhbnNs
YXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0ICAgfCAgMyArLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9jaGFuZ2Vz
ZXRzLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vZGV2aWNldHJlZS9jaGFuZ2VzZXRzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2RldmljZXRyZWUvY2hhbmdlc2V0cy5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44OGIyMDc1ZjFlYTANCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2NoYW5nZXNl
dHMucnN0DQo+IEBAIC0wLDAgKzEsMzcgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0K
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL0RldmljZXRyZWUvY2hhbmdlc2V0cy5yc3QNCj4g
Kw0KPiArOue/u+ivkToNCj4gKw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdA
bG9vbmdzb24uY24+DQo+ICsNCj4gKzrmoKHor5E6DQo+ICsNCj4gKw0KPiArPT09PT09PT09PT09
DQo+ICvorr7lpIfmoJHlj5jmm7Tpm4YNCj4gKz09PT09PT09PT09PQ0KPiArDQo+ICvorr7lpIfm
oJHlj5jmm7Tpm4bmmK/kuIDnp43mlrnms5XvvIzlroPlhYHorrjkurrku6zku6Xov5nmoLfkuIDn
p43mlrnlvI/lnKjlrp7ml7bmoJHkuK3lupTnlKjlj5jljJbvvIzljbPopoHkuYjlupTnlKjlhajp
g6jnmoQNCj4gK+WPmOWMlu+8jOimgeS5iOS4jeW6lOeUqOOAguWmguaenOWcqOW6lOeUqOWPmOab
tOmbhueahOi/h+eoi+S4reWPkeeUn+mUmeivr++8jOmCo+S5iOagkeWwhuiiq+Wbnua7muWIsOS5
i+WJjeeahOeKtuaAgeOAguS4gOS4qg0KPiAr5Y+Y5pu06ZuG5Lmf5Y+v5Lul5Zyo5bqU55So5ZCO
6KKr5Yig6Zmk44CCDQoNCuKAmOW6lOeUqOKAmSB0cmFuc2xhdGlvbiBpcyBjb3JyZWN0LCBidXQg
bWF5bm90IGZpdCBpbnRvIENoaW5lc2UgaGFiaXRzLCBtYXliZQ0K5L2/55SoL+WunueOsCBpcyBi
ZXR0ZXI/DQoNCj4gKw0KPiAr5b2T5LiA5Liq5Y+Y5pu06ZuG6KKr5bqU55So5pe277yM5omA5pyJ
55qE5pS55Y+Y5Zyo5Y+R5Ye6T0ZfUkVDT05GSUfpgJrnn6XlmajkuYvliY3ooqvkuIDmrKHmgKfl
upTnlKjliLDmoJHkuIrjgILov5nmmK8NCj4gK+S4uuS6huiuqeaOpeaUtuiAheWcqOaUtuWIsOmA
muefpeaXtueci+WIsOS4gOS4quWujOaVtOeahOOAgeS4gOiHtOeahOagkeeahOeKtuaAgeOAgg0K
PiArDQo+ICvkuIDkuKrlj5jljJbpm4bnmoTpobrluo/lpoLkuIvjgIINCj4gKw0KPiArMS4gb2Zf
Y2hhbmdlc2V0X2luaXQoKSAtIOWIneWni+WMluS4gOS4quWPmOabtOmbhuOAgg0KPiArDQo+ICsy
LiDkuIDkuptEVOagkeWPmOWMlueahOiwg+eUqO+8jG9mX2NoYW5nZXNldF9hdHRhY2hfbm9kZSgp
LCBvZl9jaGFuZ2VzZXRfZGV0YWNoX25vZGUoKSwNCj4gKyAgIG9mX2NoYW5nZXNldF9hZGRfcHJv
cGVydHkoKSwgb2ZfY2hhbmdlc2V0X3JlbW92ZV9wcm9wZXJ0eSwNCj4gKyAgIG9mX2NoYW5nZXNl
dF91cGRhdGVfcHJvcGVydHkoKeadpeWHhuWkh+S4gOe7hOWPmOabtOOAguatpOaXtuS4jeS8muWv
uea0u+WKqOagkeWBmuS7u+S9leWPmOabtOOAguaJgOaciQ0KPiArICAg55qE5Y+Y5pu05pON5L2c
6YO96K6w5b2V5Zyob2ZfY2hhbmdlc2V055qEIGBlbnRyaWVzYCDliJfooajkuK3jgIINCj4gKw0K
PiArMy4gb2ZfY2hhbmdlc2V0X2FwcGx5KCkgLSDlsIblj5jmm7TlupTnlKjliLDmoJHkuIrjgILo
poHkuYjmlbTkuKrlj5jmm7Tpm4booqvlupTnlKjvvIzopoHkuYjlpoLmnpzmnInplJnor6/vvIwN
Cj4gKyAgIOagkeS8muiiq+aBouWkjeWIsOS5i+WJjeeahOeKtuaAgeOAguaguOW/g+mAmui/h+mU
geehruS/neato+ehrueahOmhuuW6j+OAguWmguaenOmcgOimgeeahOivne+8jOWPr+S7peS9v+eU
qOS4gOS4quino+mUgeeahA0KPiArICAgX19vZl9jaGFuZ2VzZXRfYXBwbHnniYjmnKzjgIINCj4g
Kw0KPiAr5aaC5p6c5LiA5Liq5oiQ5Yqf5bqU55So55qE5Y+Y5pu06ZuG6ZyA6KaB6KKr5Yig6Zmk
77yM5Y+v5Lul55Sob2ZfY2hhbmdlc2V0X3JldmVydCgp5p2l5a6M5oiQ44CCDQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0
DQo+IGluZGV4IDNmYzM1NWZlMDAzNy4uZTlhZmYyY2NjNTc5IDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2luZGV4LnJzdA0KPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2luZGV4LnJzdA0K
PiBAQCAtMzQsOSArMzQsMTAgQEAgRGV2aWNldHJlZSBPdmVybGF5cw0KPiAgLi4gdG9jdHJlZTo6
DQo+ICAgICA6bWF4ZGVwdGg6IDENCj4NCj4gKyAgIGNoYW5nZXNldHMNCj4gKw0KPiAgVG9kb2xp
c3Q6DQo+DQo+IC0qICAgY2hhbmdlc2V0cw0KPiAgKiAgIGR5bmFtaWMtcmVzb2x1dGlvbi1ub3Rl
cw0KPiAgKiAgIG92ZXJsYXktbm90ZXMNCj4NCj4gLS0NCj4gMi4zMS4xDQo+DQo=
