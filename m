Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359AFC46467
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 07:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjAPHAT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Jan 2023 02:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjAPHAS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 02:00:18 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A285C76A3
        for <linux-doc@vger.kernel.org>; Sun, 15 Jan 2023 23:00:17 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s22so29026760ljp.5
        for <linux-doc@vger.kernel.org>; Sun, 15 Jan 2023 23:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTgJazRT78gyNPrif49GD9MW8iwp2/O7+7Dh5kmQyn4=;
        b=BcP2TADQmQyTzTOR2BgTbG+SVG7kXiVkF9B7Zy9tfU/zVOXPES+EQxlDoDxhWH3DHQ
         RoItJCTJGpMBgxWJoVG0OzFT5xct5hrdkqIHwZvNf4qnB4W8OKyeNLrpmpddE0Chm7Iv
         ZrqGJm51LbcrdWRKKlnLCeiQZ+wrerSFKZB1KGNw5Hjz0GbQxZ4pu/EkUXgO+XYVycgq
         /urYgXT1EVQq/o7p7os1EBOkLwcRE0/1k5R2iriNjDBU4/MrM3twmQocLnaWjm3TPhIq
         fXQx0GqUiT8kLtJFNOXdcEx2LyiYl803zylaHqeQfZYARFLOF2EsW9szzCrF7owuo/Uq
         p1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTgJazRT78gyNPrif49GD9MW8iwp2/O7+7Dh5kmQyn4=;
        b=l6X6Yqn17uRDN+vmGLrmjNuudhh6+1oSeeDUbgA9ZW6oUiWRde05v+dsce3GhHS3ci
         Uzyb6rCL91VFZqbk8Wi5m8L1T3UunqtiL+3RcnRqaVtAlYkcrmz8pLYeXtRo0mnWjahx
         cqFaRnildXgxR1HsmqeXpOm+Ar3QuL8QSztQme+/M7MZTIabBc65U18zZQ7qzgTPEuUy
         3uVcyXNMo+Nf22BCaXsnNd81tqGPGU5CH1u49T7CGDQ+kWNbYms4D+NkATdYMQg3ZI1b
         0p3LKTOfeGKDMbEop7V9XBaqs+BDFXZxpsoOf5+ockoF2/m5vclP4H5vWbAKLRTjVGDV
         M6vw==
X-Gm-Message-State: AFqh2krXfpZsEDgr0eVMN3v4KGV+hFo2IxLd85Yj0tvnBKH/rsg9hMu5
        dD/9H4Z1AGroTJChy5zci35dRwh+744LwyM/QTQ=
X-Google-Smtp-Source: AMrXdXtkGlNqSzEKJkd8JtVE2NOOES/L9Ymf2kAUhk1FoP3t8JYH8no3kU1d5X6flWBcsEiwhUOVr2s+BnM+2PDHZ/4=
X-Received: by 2002:a2e:a5c5:0:b0:280:5b72:c3ce with SMTP id
 n5-20020a2ea5c5000000b002805b72c3cemr3038401ljp.203.1673852415862; Sun, 15
 Jan 2023 23:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20230112130355.696111-1-siyanteng@loongson.cn>
In-Reply-To: <20230112130355.696111-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 16 Jan 2023 14:59:39 +0800
Message-ID: <CAJy-AmnXwPcuRDFeckMHOkPeh_UzpuaSC0eoJV=QkY78V_QJDA@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add a glossary of Chinese translation terms
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        tangyeechou@gmail.com, me@lirui.org, siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKYW4gMTIsIDIwMjMgYXQgOTowMyBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBBcyBtb3JlIGFuZCBtb3JlIGRvY3VtZW50cyBhcmUgdHJh
bnNsYXRlZCBhbmQgc29tZSBFbmdsaXNoDQo+IHdvcmRzIGFyZSB0cmFuc2xhdGVkIGludG8gZGlm
ZmVyZW50IENoaW5lc2UsIGl0IHNlZW1zIHRoYXQNCj4gd2UgbmVlZCBhIGdsb3NzYXJ5IG9mIENo
aW5lc2UgdHJhbnNsYXRpb24gdGVybXMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kg
PHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gLS0tDQo+IHYyOg0KPg0KPiAqIEFkZCBtb3JlIHdv
cmQgZW50cmllcyB1bmRlciBZaXpob3UncyBhZHZpY2UuDQo+ICog5a6e5L2T6LSf6L296Lef6Liq
5py65Yi2IC0+IOWunuS9k+i0n+i9vei3n+i4qi4NCj4NCj4gIERvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2dsb3NzYXJ5LnJzdCB8IDM2ICsrKysrKysrKysrKysrKysrKysNCj4gIERv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJzdCAgICB8ICA5ICsrKysrDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9nbG9zc2FyeS5yc3QNCj4NCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2dsb3NzYXJ5LnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2dsb3NzYXJ5LnJzdA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI2ZDY2NzZhMWY4Mw0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2dsb3Nz
YXJ5LnJzdA0KPiBAQCAtMCwwICsxLDM2IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArDQo+ICvmnK/or63ooagNCj4gKz09PT09PQ0KPiArDQo+ICvov5nkuI3m
mK/kuIDkuKrlrozlloTnmoTmnK/or63ooajvvIzmiJHku6zlj6rmmK/lsIbmnInkuonorq7nmoTl
kozpmYznlJ/nmoTnv7vor5Hor43msYforrDlvZXkuo7mraTvvIwNCj4gK+Wug+eahOevh+W5heW6
lOivpeagueaNruWGheaguOaWh+aho+e/u+ivkeeahOmcgOaxguiAjOWinuWKoOOAguaWsOivjead
oeacgOWlvemaj+e/u+ivkeihpeS4geS4gOi1tw0KPiAr5o+Q5Lqk77yM5LiU5LuF5Zyo5Lul5LiL
5oOF5Ya15LiL5pS25b2V5paw6K+N5p2h77yaDQo+ICsNCj4gKyAgICAgICAgLSDlnKjnv7vor5Ho
v4fnqIvkuK3pgYfliLDpmYznlJ/or43msYfvvIzkuJTlsJrml6Dnv7vor5HlhYjkvovnmoTvvJsN
Cj4gKyAgICAgICAgLSDlnKjlrqHpmIXov4fnqIvkuK3vvIzpkojlr7nmn5Dor43mnaHlh7rnjrDk
uobkuI3lkIznmoTnv7vor5HmhI/op4HvvJsNCj4gKyAgICAgICAgLSDkvb/nlKjpopHnjofkuI3p
q5jnmoTor43mnaHlkozpppblrZfmr43nvKnlhpnnsbvlnovnmoTor43mnaHvvJsNCj4gKyAgICAg
ICAgLSDlt7Lnu4/lrZjlnKjkuJTmnInmrafkuYnnmoTor43mnaHnv7vor5HjgIINCj4gKw0KPiAr
DQo+ICsqIGF0b21pYzog5Y6f5a2Q55qE77yM5LiA6Iis5oyH5LiN5Y+v5Lit5pat55qE5p6B5bCP
55qE5Li055WM5Yy65pON5L2c44CCDQo+ICsqIERWRlM6IOWKqOaAgeeUteWOi+mikeeOh+WNh+mZ
jeOAgu+8iER5bmFtaWMgVm9sdGFnZSBhbmQgRnJlcXVlbmN5IFNjYWxpbmfvvIkNCj4gKyogRUFT
OiDog73ogJfmhJ/nn6XosIPluqbjgILvvIhFbmVyZ3kgQXdhcmUgU2NoZWR1bGluZ++8iQ0KPiAr
KiBmbHVzaDog5Yi35paw77yM5LiA6Iis5oyH5a+5Y2FjaGXnmoTlhrLmtJfmk43kvZzjgIINCj4g
KyogZm9yazog5Yib5bu644CCDQoNCmZvcms6IOWIm+W7uiwg6YCa5bi45oyH54i26L+b56iL5Yib
5bu65a2Q6L+b56iL44CCDQoNCm90aGVycyBhcmUgZmluZS4NClJldmlld2VkLWJ5OiBBbGV4IFNo
aSA8YWxleHNAa2VybmVsLm9yZz4NCg0KPiArKiBmdXRleDog5b+r6YCf55So5oi35LqS5pal6ZSB
44CC77yIZmFzdCB1c2VyIG11dGV477yJDQo+ICsqIGd1ZXN0IGhhbHQgcG9sbGluZzog5a6i5oi3
5py65YGc5py66L2u6K+i5py65Yi244CCDQo+ICsqIEh1Z2VQYWdlOiDlt6jpobXjgIINCj4gKyog
aHlwZXJ2aXNvcjog6Jma5ouf5py66LaF57qn566h55CG5Zmo44CCDQo+ICsqIG1lbW9yeSBiYXJy
aWVyczog5YaF5a2Y5bGP6Zqc44CCDQo+ICsqIE1JUFM6IOavj+enkueZvuS4h+aMh+S7pOOAgu+8
iE1pbGxpb25zIG9mIEluc3RydWN0aW9ucyBQZXIgU2Vjb25k77yJLOazqOaEj+S4jm1pcHPmjIfk
u6Tpm4bljLrliIblvIDjgIINCj4gKyogbXV0ZXg6IOS6kuaWpemUgeOAgg0KPiArKiBOVU1BOiDp
nZ7nu5/kuIDlhoXlrZjorr/pl67jgIINCj4gKyogT3BlbkNBUEk6IOW8gOaUvuebuOW5suWKoOmA
n+WZqOWkhOeQhuWZqOaOpeWPo+OAgu+8iE9wZW4gQ29oZXJlbnQgQWNjZWxlcmF0b3IgUHJvY2Vz
c29yIEludGVyZmFjZe+8iQ0KPiArKiBPUFA6IOaTjeS9nOaAp+iDveWAvOOAgg0KPiArKiBvdmVy
aGVhZDog5byA6ZSA77yM5LiA6Iis5oyH6ZyA6KaB5raI6ICX55qE6K6h566X5py66LWE5rqQ44CC
DQo+ICsqIFBFTFQ6IOWunuS9k+i0n+i9vei3n+i4quOAgu+8iFBlci1FbnRpdHkgTG9hZCBUcmFj
a2luZ++8iQ0KPiArKiBzY2hlZCBkb21haW46IOiwg+W6puWfn+OAgg0KPiArKiBzZW1hcGhvcmVz
OiDkv6Hlj7fph4/jgIINCj4gKyogc3BpbmxvY2s6IOiHquaXi+mUgeOAgg0KPiArKiB3YXRlcm1h
cms6IOawtOS9je+8jOS4gOiIrOaMh+mhteihqOeahOa2iOiAl+awtOW5s+OAgg0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5kZXgucnN0DQo+IGluZGV4IDM2NjBhMzQ1MWM4
Ni4uN2MzMjE2ODQ1YjcxIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vaW5kZXgucnN0DQo+IEBAIC0xMzMsNiArMTMzLDE1IEBAIFRPRE9MaXN0Og0KPg0KPiAgICAg
c3RhZ2luZy9pbmRleA0KPg0KPiAr5pyv6K+t6KGoDQo+ICstLS0tLS0NCj4gKw0KPiArLi4gdG9j
dHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDENCj4gKw0KPiArICAgZ2xvc3NhcnkNCj4gKw0KPiAr
DQo+ICDntKLlvJXlkozooajmoLwNCj4gIC0tLS0tLS0tLS0NCj4NCj4gLS0NCj4gMi4zMS4xDQo+
DQo=
