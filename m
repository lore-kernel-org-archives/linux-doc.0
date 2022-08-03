Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220F8C00140
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 03:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbiHCDEN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 23:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiHCDEM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 23:04:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA06028E13
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 20:04:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x39so14977087lfu.7
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rxaIiDKTsYxJolFdJBFCIc5P3chP28Z/fO5eSfFdyUo=;
        b=HmTtmxZ5JusZGrVj6YGcxbewdeMt9KE1vcOmcMO3tvgtpQHp1OROQGxnWjXD0PgVYt
         SN8WbAYSds/a2pbK3h4gjsK1LYX1anGflQBACWZsWMGhWM8Un5cWZwWz3mygvhpUWJY9
         hs/n7YUivl+V5A48OmYx+hvDCMIweCbwJKxcc0iUXxD9GoVslAT5q4Os2HXGedcdRJ2c
         8mtTlKAKu6aU73SI8vXdwvzjHWcue4UI9m0e/L+wYoSGpZsfZ6PTOHtgw5E5YUas2WJp
         4IvJHvICN9iBisAL6ES87r/CJkuzByEwMIt5WQcxlNN23V59z0gjNOdb/wCT+xPPmt6s
         uefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rxaIiDKTsYxJolFdJBFCIc5P3chP28Z/fO5eSfFdyUo=;
        b=oOWaQwXZ9aqaLUAGHuRZVIymBckai2OPql9PjbprNdmmfMJyb7/+66UWvu0snZTvnx
         alfy+rlbQp1TaXhNQEjiResGzW3/Ii8ebPtDIp48vuiX2aiqw9nqP3DH1+ZXSsiLVRa9
         vY02BfMgzIfp44VoZDsrgGqGdyLQY5z73nkZhrQdVLhnVJKObj4zFMLJ3rviL2ojTmZk
         s5Zy4YobecXy9eUEn9/n+cO+Q4A8r0oSVZQdaBTc3lIyrYGCdpFr0qAV+nxYdQH7DvH+
         W7w/kxyjxA+l5fjfhTnFWNxAFr4XNaY1VrSn9kEg4xGqGmzQNZIaZ+hRvFc+4bvqSugD
         rUKQ==
X-Gm-Message-State: ACgBeo06kl6Inf00/M6pWXBl6PDo86J5MRATntO12HAnwWyTeoHrY6BW
        0UuYhY8AuE0yMobbBWxtu5TT4f+0xYwaJbC9IKFDGaUUOVh2HMSI
X-Google-Smtp-Source: AA6agR4WUIKe7LhzvHmD6q0/iWI2IZosk66WbaIbC6479B/czihRIZXXG6q4EUhuMPKQ5z7Fyl/X+zLxNAXvjvjDIjo=
X-Received: by 2002:a05:6512:2023:b0:48a:f7e5:8ca2 with SMTP id
 s3-20020a056512202300b0048af7e58ca2mr4891340lfs.592.1659495848972; Tue, 02
 Aug 2022 20:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658196777.git.zhoubinbin@loongson.cn> <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
In-Reply-To: <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 3 Aug 2022 11:03:32 +0800
Message-ID: <CAJy-AmnE4-+YLSQmmV40x6C9XCVAPmmAFuNKePM7AuQ40V4b0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] docs/zh_CN: core-api: Add idr Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Wu X.C." <bobwxc@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBKdWwgMTksIDIwMjIgYXQgOTowNCBQTSBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBs
b29uZ3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBjb3JlLWFwaS9pZHIucnN0IGludG8g
Q2hpbmVzZS4NCj4NCj4gTGFzdCBFbmdsaXNoIHZlcnNpb24gdXNlZDoNCj4NCj4gY29tbWl0IGVj
ODIxM2Y4OTAwNSAoIkNvcmUtYXBpOiBEb2N1bWVudGF0aW9uOiBSZXBsYWNlIGRlcHJlY2F0ZWQN
Cj4gOmM6ZnVuYzogVXNhZ2UiKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQmluYmluIFpob3UgPHpo
b3ViaW5iaW5AbG9vbmdzb24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2Vy
bmVsLm9yZz4NCg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaWRy
LnJzdCAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysNCj4gIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vY29yZS1hcGkvaW5kZXgucnN0ICAgICB8ICAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDc4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pZHIucnN0DQo+DQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pZHIu
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaWRyLnJzdA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFkZjc5ZmY4ZTE5
YQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NvcmUtYXBpL2lkci5yc3QNCj4gQEAgLTAsMCArMSw3NyBAQA0KPiArLi4gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ICsNCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFp
bWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vY29yZS1hcGkv
aWRyLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5ZGo5b2s5b2sIEJpbmJpbiBaaG91
IDx6aG91YmluYmluQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsg5Y+4
5bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKyDlkLTmg7PmiJAg
V3UgWGlhbmdjaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiArDQo+ICs9PT09PT0NCj4gK0lE5YiG
6YWNDQo+ICs9PT09PT0NCj4gKw0KPiArOuS9nOiAhTogTWF0dGhldyBXaWxjb3gNCj4gKw0KPiAr
5qaC6L+wDQo+ICs9PT09DQo+ICsNCj4gK+imgeino+WGs+eahOS4gOS4quW4uOingemXrumimOaY
r+WIhumFjeagh+ivhuespu+8iElEc++8ie+8m+Wug+mAmuW4uOaYr+agh+ivhuS6i+eJqeeahOaV
sOWtl+OAguavlOWmguWMheaLrOaWh+S7tuaPj+i/sA0KPiAr56ym44CB6L+b56iLSUTjgIHnvZHn
u5zljY/orq7kuK3nmoTmlbDmja7ljIXmoIfor4bnrKbjgIFTQ1NJ5qCH6K6w5ZKM6K6+5aSH5a6e
5L6L57yW5Y+344CCSURS5ZKMSURB5Li66L+Z5Liq6Zeu6aKYDQo+ICvmj5DkvpvkuobkuIDkuKrl
kIjnkIbnmoTop6PlhrPmlrnmoYjvvIzku6Xpgb/lhY3mr4/kuKrkurrpg73oh6rliJvjgIJJRFLm
j5DkvpvlsIZJROaYoOWwhOWIsOaMh+mSiOeahOiDveWKm++8jOiAjElEQQ0KPiAr5LuF5o+Q5L6b
SUTliIbphY3vvIzlm6DmraTlhoXlrZjmlYjnjofmm7Tpq5jjgIINCj4gKw0KPiArSURS55qE55So
5rOVDQo+ICs9PT09PT09PT0NCj4gKw0KPiAr6aaW5YWI5Yid5aeL5YyW5LiA5LiqSURS77yM5a+5
5LqO6Z2Z5oCB5YiG6YWN55qESURS5L2/55SoREVGSU5FX0lEUigp77yM5oiW6ICF5a+55LqO5Yqo
5oCB5YiG6YWN55qESURS5L2/55SoDQo+ICtpZHJfaW5pdCgp44CCDQo+ICsNCj4gK+aCqOWPr+S7
peiwg+eUqGlkcl9hbGxvYygp5p2l5YiG6YWN5LiA5Liq5pyq5L2/55So55qESUTjgILpgJrov4fo
sIPnlKhpZHJfZmluZCgp5p+l6K+i5LiO6K+lSUTnm7jlhbPnmoTmjIfpkojvvIwNCj4gK+W5tumA
mui/h+iwg+eUqGlkcl9yZW1vdmUoKemHiuaUvuivpUlE44CCDQo+ICsNCj4gK+WmguaenOmcgOim
geabtOaUueS4juS4gOS4qklE55u45YWz6IGU55qE5oyH6ZKI77yM5Y+v5Lul6LCD55SoaWRyX3Jl
cGxhY2UoKeOAgui/meagt+WBmueahOS4gOS4quW4uOingeWOn+WboOaYr+mAmg0KPiAr6L+H5bCG
IGBgTlVMTGBgIOaMh+mSiOS8oOmAkue7meWIhumFjeWHveaVsOadpeS/neeVmUlE77yb55So5L+d
55WZ55qESUTliJ3lp4vljJblr7nosaHvvIzmnIDlkI7lsIbliJ3lp4vljJbnmoTlr7kNCj4gK+ix
oeaPkuWFpUlEUuOAgg0KPiArDQo+ICvkuIDkupvnlKjmiLfpnIDopoHliIbphY3lpKfkuo4gYGBJ
TlRfTUFYYGAg55qESUTjgILliLDnm67liY3kuLrmraLvvIzmiYDmnInov5nkupvnlKjmiLfpg73m
u6HotrMgYGBVSU5UX01BWGBgDQo+ICvnmoTpmZDliLbvvIzku5bku6zkvb/nlKhpZHJfYWxsb2Nf
dTMyKCnjgILlpoLmnpzmgqjpnIDopoHotoXlh7p1MzLnmoRJRO+8jOaIkeS7rOWwhuS4juaCqOWQ
iOS9nOS7pea7oei2s+aCqOeahA0KPiAr6ZyA5rGC44CCDQo+ICsNCj4gK+WmguaenOmcgOimgeaM
iemhuuW6j+WIhumFjUlE77yM5Y+v5Lul5L2/55SoaWRyX2FsbG9jX2N5Y2xpYygp44CC5aSE55CG
6L6D5aSn5pWw6YeP55qESUTml7bvvIxJRFLnmoTmlYjnjofkvJoNCj4gK+mZjeS9ju+8jOaJgOS7
peS9v+eUqOi/meS4quWHveaVsOS8muacieS4gOeCueS7o+S7t+OAgg0KPiArDQo+ICvopoHlr7lJ
RFLkvb/nlKjnmoTmiYDmnInmjIfpkojov5vooYzmk43kvZzvvIzmgqjlj6/ku6Xkvb/nlKjln7rk
uo7lm57osIPnmoRpZHJfZm9yX2VhY2goKeaIlui/reS7o+WZqOagt+W8j+eahA0KPiAraWRyX2Zv
cl9lYWNoX2VudHJ5KCnjgILmgqjlj6/og73pnIDopoHkvb/nlKhpZHJfZm9yX2VhY2hfZW50cnlf
Y29udGludWUoKeadpee7p+e7rei/reS7o+OAguWmguaenA0KPiAr6L+t5Luj5Zmo5LiN56ym5ZCI
5oKo55qE6ZyA5rGC77yM5oKo5Lmf5Y+v5Lul5L2/55SoaWRyX2dldF9uZXh0KCnjgIINCj4gKw0K
PiAr5b2T5L2/55So5a6MSURS5ZCO77yM5oKo5Y+v5Lul6LCD55SoaWRyX2Rlc3Ryb3koKeadpemH
iuaUvklEUuWNoOeUqOeahOWGheWtmOOAgui/meW5tuS4jeS8mumHiuaUvklEUuaMh+WQkeeahA0K
PiAr5a+56LGh77yb5aaC5p6c5oKo5oOz6L+Z5qC35YGa77yM6K+35L2/55So5YW25Lit5LiA5Liq
6L+t5Luj5Zmo5p2l5omn6KGM5q2k5pON5L2c44CCDQo+ICsNCj4gK+aCqOWPr+S7peS9v+eUqGlk
cl9pc19lbXB0eSgp5p2l5p+l55yL5b2T5YmN5piv5ZCm5YiG6YWN5LqG5Lu75L2VSUTjgIINCj4g
Kw0KPiAr5aaC5p6c5Zyo5LuOSURS5YiG6YWN5LiA5Liq5pawSUTml7bpnIDopoHluKbplIHvvIzm
gqjlj6/og73pnIDopoHkvKDpgJLkuIDnu4TpmZDliLbmgKfnmoRHRlDmoIflv5fvvIzkvYbov5nl
j6/og73lr7wNCj4gK+iHtElEUuaXoOazleWIhumFjeWGheWtmOOAguS4uuS6huino+WGs+ivpemX
rumimO+8jOaCqOWPr+S7peWcqOiOt+WPlumUgeS5i+WJjeiwg+eUqGlkcl9wcmVsb2FkKCnvvIzn
hLblkI7lnKjliIYNCj4gK+mFjeS5i+WQjuiwg+eUqGlkcl9wcmVsb2FkX2VuZCgp44CCDQo+ICsN
Cj4gK0lEUuWQjOatpeeahOebuOWFs+WGheWuueivt+ingWluY2x1ZGUvbGludXgvaWRyLmjmlofk
u7bkuK3nmoTigJxET0M6IGlkciBzeW5j4oCd44CCDQo+ICsNCj4gK0lEQeeahOeUqOazlQ0KPiAr
PT09PT09PT09DQo+ICsNCj4gK0lEQeeahOeUqOazleeahOebuOWFs+WGheWuueivt+ingWxpYi9p
ZHIuY+aWh+S7tuS4reeahOKAnERPQzogSURBIGRlc2NyaXB0aW9u4oCd44CCDQo+ICsNCj4gK+WH
veaVsOWSjOaVsOaNrue7k+aehA0KPiArPT09PT09PT09PT09PT0NCj4gKw0KPiAr6K+lQVBJ5Zyo
5Lul5LiL5YaF5qC45Luj56CB5LitOg0KPiArDQo+ICtpbmNsdWRlL2xpbnV4L2lkci5oDQo+ICsN
Cj4gK2xpYi9pZHIuYw0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vY29yZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vY29yZS1hcGkvaW5kZXgucnN0DQo+IGluZGV4IDdjYTQ0NjI5ODYwYy4uOTRlZWVmMjBjMDQy
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFw
aS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvaW5kZXgucnN0DQo+IEBAIC00NCwxMiArNDQsMTIgQEANCj4gICAgIGFzc29jX2FycmF5
DQo+ICAgICB4YXJyYXkNCj4gICAgIHJidHJlZQ0KPiArICAgaWRyDQo+DQo+ICBUb2RvbGlzdDoN
Cj4NCj4NCj4NCj4gLSAgIGlkcg0KPiAgICAgY2lyY3VsYXItYnVmZmVycw0KPiAgICAgZ2VuZXJp
Yy1yYWRpeC10cmVlDQo+ICAgICBwYWNraW5nDQo+IC0tDQo+IDIuMjAuMQ0KPg0K
