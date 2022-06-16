Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356FBC43334
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 09:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbiFPJtv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 05:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiFPJtv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 05:49:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9644ECEA
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 02:49:49 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s6so1358416lfo.13
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J06Adz/WS4ftJhUTUP1DpY9Oo6OdYcvGCwxam5H721o=;
        b=n/7z2ke2GA0D1ORnQRKX8kpBG5kndit3wDLCke5vmQcNU3kNwOlUWm+tSDcQ4RgLSs
         y6wNHtGmau1S4rgnhPtFwpkQEvfrRihSlR6iTYUksQeWmuQWhCLOPse/T2AuRFnbbr5o
         SiIjVrE+8GP6lJ1KjSvXqGWaI2dpwlUNwt+QjHYEZ02JULD7uyJ9sXAPwkzb9QxpT6Eq
         SfWO2M2tVElFm6qICBAWaq5A/afVUIfhpJugJq8Jkr5iQBZw0Cp/6XSvO+kXBExavvjA
         8GR+LzYHyVqybYJbo61X6p8OPVSKgC7JLeNz4lsrKmbU1X+0JjEZc61ePg1zVAKSiQJ5
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J06Adz/WS4ftJhUTUP1DpY9Oo6OdYcvGCwxam5H721o=;
        b=RaNng3p7nHJRHOIw2Lp02DN/eatuQcruyGgGVm7wO6AGL4NsCF5EBGkU87qw0dc/ec
         k5vzhbxgDP2rFQNPyQSc3OgiPzAsBzZ60/Sxr7NNM1eZfoL1bEQzBimdaK3pe+x4Acjk
         XPThGys5Uw59tGc+5Xi7yGXeR6XQ1MVc7IBIIhdtL8BjPLNaPOFk8vfA5d94U+iOu7ZT
         V9i8/zbTT1JzdXq14wdoZaa9i3aYjgYUuF23sAva1pmU6wpFZIXhNodM1dHtP8DGrnRs
         RJaipcUvmbgBAeJmuHigIRLqDZKL8PVaZOvsJVt3LlGGY4g2V3KDxV6BvVZWnKKVIlNc
         CxCQ==
X-Gm-Message-State: AJIora8tA4xisJhcRHmZwqyMbSDUFUD0YGE9nipv3a+FqQ0AZejo3ghc
        hDb9r9E01B3DSCIEgsgIVBDJWbOjiAkJudvki7f1hYNftH0=
X-Google-Smtp-Source: AGRyM1voYxCfDujflPi7USAL+yR+1r+VSmgSP+A+KFpaG+DElOqkLe0waE3Ql9DO+irjDJnzp0YGz4PsK5mflPpaP08=
X-Received: by 2002:ac2:5ff0:0:b0:479:54c1:5dee with SMTP id
 s16-20020ac25ff0000000b0047954c15deemr2119509lfg.139.1655372987983; Thu, 16
 Jun 2022 02:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655362610.git.siyanteng@loongson.cn> <e96557b73b036c33a9fa5abdab0c541704235e92.1655362610.git.siyanteng@loongson.cn>
In-Reply-To: <e96557b73b036c33a9fa5abdab0c541704235e92.1655362610.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 16 Jun 2022 17:49:11 +0800
Message-ID: <CAJy-Amk1KcwCx13TMptF3yGmUCX5K5NZGotVK0gB0zjSi+JMgw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] docs/zh_CN: Update the translation of page_owner
 to 5.19-rc1
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMzo0MyBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiB1cGRhdGUgdG8gY29tbWl0IGQxZWQ1MWZjZGJkNiAoImRv
Y3M6IHZtL3BhZ2Vfb3duZXI6IHR3ZWFrDQo+IGxpdGVyYWwgYmxvY2sgaW4gU1RBTkRBUkQgRk9S
TUFUIFNQRUNJRklFUlMiKQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRl
bmdAbG9vbmdzb24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9y
Zz4NCg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcGFnZV9vd25lci5yc3Qg
ICAgICB8IDc5ICsrKysrKysrKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MCBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcGFnZV9vd25lci5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX293bmVyLnJzdA0KPiBpbmRleCA5ZTk1MWZhYmJhOWQu
LjAwMzRkMmFlMWNkNSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdm0vcGFnZV9vd25lci5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vcGFnZV9vd25lci5yc3QNCj4gQEAgLTk2LDIxICs5Niw4MiBAQCBwYWdlIG93
bmVy5Zyo6buY6K6k5oOF5Ya15LiL5piv56aB55So55qE44CC5omA5Lul77yM5aaC5p6c5L2g5oOz
5L2/55So5a6D77yM5L2gDQo+ICAgICDpu5jorqTmg4XlhrXkuIvvvIwgYGBwYWdlX293bmVyX3Nv
cnRgYCDmmK/moLnmja5idWbnmoTml7bpl7TmnaXmjpLluo/nmoTjgILlpoLmnpzkvaDmg7MNCj4g
ICAgIOaMiWJ1ZueahOmhteaVsOaOkuW6j++8jOivt+S9v+eUqC1t5Y+C5pWw44CC6K+m57uG55qE
5Y+C5pWw5pivOg0KPg0KPiAtICAg5Z+65pys5Ye95pWwOg0KPiArICAg5Z+65pys5Ye95pWwOjoN
Cj4NCj4gLSAgICAgICBTb3J0Og0KPiArICAgICAgIOaOkuW6jzoNCj4gICAgICAgICAgICAgICAg
IC1hICAgICAgICAgICAgICDmjInlhoXlrZjliIbphY3ml7bpl7TmjpLluo8NCj4gICAgICAgICAg
ICAgICAgIC1tICAgICAgICAgICAgICDmjInmgLvlhoXlrZjmjpLluo8NCj4gICAgICAgICAgICAg
ICAgIC1wICAgICAgICAgICAgICDmjIlwaWTmjpLluo/jgIINCj4gICAgICAgICAgICAgICAgIC1Q
ICAgICAgICAgICAgICDmjIl0Z2lk5o6S5bqP44CCDQo+ICsgICAgICAgICAgICAgICAtbiAgICAg
ICAgICAgICAg5oyJ5Lu75Yqh5ZG95Luk5ZCN56ew5o6S5bqP44CCDQo+ICAgICAgICAgICAgICAg
ICAtciAgICAgICAgICAgICAg5oyJ5YaF5a2Y6YeK5pS+5pe26Ze05o6S5bqP44CCDQo+ICAgICAg
ICAgICAgICAgICAtcyAgICAgICAgICAgICAg5oyJ5aCG5qCI6Lef6Liq5o6S5bqP44CCDQo+ICAg
ICAgICAgICAgICAgICAtdCAgICAgICAgICAgICAg5oyJ5pe26Ze05o6S5bqP77yI6buY6K6k77yJ
44CCDQo+IC0NCj4gLSAgIOWFtuWug+WHveaVsDoNCj4gLQ0KPiAtICAgICAgIEN1bGw6DQo+IC0g
ICAgICAgICAgICAgICAtYyAgICAgICAgICAgICAg6YCa6L+H5q+U6L6D5aCG5qCI6Lef6Liq6ICM
5LiN5piv5oC75Z2X5p2l6L+b6KGM5YmU6Zmk44CCDQo+IC0NCj4gLSAgICAgICBGaWx0ZXI6DQo+
ICsgICAgICAgLS1zb3J0IDxvcmRlcj4g5oyH5a6a5o6S5bqP6aG65bqP44CC5o6S5bqP55qE6K+t
5rOV5pivWyt8LV1rZXlbLFsrfC1da2V5WywuLi5dXeOAguS7jg0KPiArICAgICAgICoq5qCH5YeG
5qC85byP5oyH5a6a5ZmoKirpgqPkuIDoioLpgInmi6nkuIDkuKrplK7jgIIiKyLmmK/lj6/pgInn
moTvvIzlm6DkuLrpu5jorqTnmoTmlrnlkJHmmK/mlbDlrZfmiJYNCj4gKyAgICAgICDor43ms5Xn
moTlop7liqDjgILlhYHorrjmt7flkIjkvb/nlKjnvKnlhpnlkozlrozmlbTmoLzlvI/nmoTplK7j
gIINCj4gKw0KPiArICAgICAgICDkvovlrZA6DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLi9wYWdlX293bmVyX3NvcnQgPGlucHV0PiA8b3V0cHV0PiAtLXNvcnQ9biwrcGlkLC10
Z2lkDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi9wYWdlX293bmVyX3NvcnQg
PGlucHV0PiA8b3V0cHV0PiAtLXNvcnQ9YXQNCj4gKw0KPiArICAgIOWFtuWug+WHveaVsDo6DQo+
ICsNCj4gKyAgICAgICDliZTpmaQ6DQo+ICsgICAgICAgICAgICAgICAtLWN1bGwgPHJ1bGVzPg0K
PiArICAgICAgICAgICAgICAgICAgICAgICDmjIflrprliZTpmaTop4TliJnjgILliZTpmaTnmoTo
r63ms5XmmK9rZXlbLGtleVssLi4uXV3jgILku44qKuagh+WHhuagvOW8j+aMh+WumuWZqCoqDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg6YOo5YiG6YCJ5oup5LiA5Liq5aSa5a2X
5q+N6ZSu44CCDQo+ICsgICAgICAgICAgICAgICA8cnVsZXM+5piv5LiA5Liq5Lul6YCX5Y+35YiG
6ZqU55qE5YiX6KGo5b2i5byP55qE5Y2V5LiA5Y+C5pWw77yM5a6D5o+Q5L6b5LqG5LiA56eN5oyH
5a6a5Y2V5Liq5YmU6Zmk6KeE5YiZ55qEDQo+ICsgICAgICAgICAgICAgICDmlrnms5XjgIIg6K+G
5Yir55qE5YWz6ZSu5a2X5Zyo5LiL6Z2i55qEKirmoIflh4bmoLzlvI/mjIflrprlmagqKumDqOWI
huacieaPj+i/sOOAgjzop4TliJk+5Y+v5Lul6YCa6L+H6ZSu55qEDQo+ICsgICAgICAgICAgICAg
ICDluo/liJdrMSxrMiwuLi7mnaXmjIflrprvvIzlnKjkuIvpnaLnmoTmoIflh4bmjpLluo/plK7p
g6jliIbmnInmj4/ov7DjgILlhYHorrjmt7flkIjkvb/nlKjnroDlhpnlkozlrozmlbTlvaINCj4g
KyAgICAgICAgICAgICAgIOW8j+eahOmUruOAgg0KPiArDQo+ICsgICAgICAgICAgICAgICBFeGFt
cGxlczoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuL3BhZ2Vfb3duZXJfc29y
dCA8aW5wdXQ+IDxvdXRwdXQ+IC0tY3VsbD1zdGFja3RyYWNlDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLi9wYWdlX293bmVyX3NvcnQgPGlucHV0PiA8b3V0cHV0PiAtLWN1bGw9
c3QscGlkLG5hbWUNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuL3BhZ2Vfb3du
ZXJfc29ydCA8aW5wdXQ+IDxvdXRwdXQ+IC0tY3VsbD1uLGYNCj4gKw0KPiArICAgICAgIOi/h+a7
pDoNCj4gICAgICAgICAgICAgICAgIC1mICAgICAgICAgICAgICDov4fmu6TmjonlhoXlrZjlt7Lo
oqvph4rmlL7nmoTlnZfnmoTkv6Hmga/jgIINCj4gKw0KPiArICAgICAgIOmAieaLqToNCj4gKyAg
ICAgICAgICAgICAgIC0tcGlkIDxwaWRsaXN0PiAgICAgICAgIOaMiXBpZOmAieaLqeOAgui/meWw
humAieaLqei/m+eoi0lE5Y+35Ye6546w5ZyoPHBpZGxpc3Q+5Lit55qE5Z2X44CCDQo+ICsgICAg
ICAgICAgICAgICAtLXRnaWQgPHRnaWRsaXN0PiAgICAgICDmjIl0Z2lk6YCJ5oup44CC6L+Z5bCG
6YCJ5oup5YW257q/56iL57uESUTlj7flh7rnjrDlnKg8dGdpZGxpc3Q+DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIOS4reeahOWdl+OAgg0KPiArICAgICAgICAgICAgICAg
LS1uYW1lIDxjbWRsaXN0PiAgICAgICAg5oyJ5Lu75Yqh5ZG95Luk5ZCN56ew6YCJ5oup44CC6L+Z
5bCG6YCJ5oup5YW25Lu75Yqh5ZG95Luk5ZCN56ew5Ye6546w5ZyoDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxjbWRsaXN0PuS4reeahOWMuuWdl+OAgg0KPiArDQo+ICsg
ICAgICAgICAgICAgICA8cGlkbGlzdD4sIDx0Z2lkbGlzdD4sIDxjbWRsaXN0PuaYr+S7pemAl+WP
t+WIhumalOeahOWIl+ihqOW9ouW8j+eahOWNleS4quWPguaVsO+8jA0KPiArICAgICAgICAgICAg
ICAg5a6D5o+Q5L6b5LqG5LiA56eN5oyH5a6a5Y2V5Liq6YCJ5oup6KeE5YiZ55qE5pa55rOV44CC
DQo+ICsNCj4gKw0KPiArICAgICAgICAgICAgICAg5L6L5a2QOg0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC4vcGFnZV9vd25lcl9zb3J0IDxpbnB1dD4gPG91dHB1dD4gLS1waWQ9
MQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4vcGFnZV9vd25lcl9zb3J0IDxp
bnB1dD4gPG91dHB1dD4gLS10Z2lkPTEsMiwzDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLi9wYWdlX293bmVyX3NvcnQgPGlucHV0PiA8b3V0cHV0PiAtLW5hbWUgbmFtZTEsbmFt
ZTINCj4gKw0KPiAr5qCH5YeG5qC85byP5oyH5a6a5ZmoDQo+ICs9PT09PT09PT09PT09PQ0KPiAr
OjoNCj4gKw0KPiArICAtLXNvcnTnmoTpgInpobk6DQo+ICsNCj4gKyAgICAgICDplK4gICAgICAg
ICAgICAgICDplK7plb8gICAgICAgICAgICAgIOaPj+i/sA0KPiArICAgICAgIHAgICAgICAgICAg
ICAgICBwaWQgICAgICAgICAgICAg6L+b56iLSUQNCj4gKyAgICAgICB0ZyAgICAgICAgICAgICAg
dGdpZCAgICAgICAgICAgIOe6v+eoi+e7hElEDQo+ICsgICAgICAgbiAgICAgICAgICAgICAgIG5h
bWUgICAgICAgICAgICDku7vliqHlkb3ku6TlkI3np7ANCj4gKyAgICAgICBzdCAgICAgICAgICAg
ICAgc3RhY2t0cmFjZSAgICAgIOmhtemdouWIhumFjeeahOWghuagiOi3n+i4qg0KPiArICAgICAg
IFQgICAgICAgICAgICAgICB0eHQgICAgICAgICAgICAg5Z2X55qE5YWo5paHDQo+ICsgICAgICAg
ZnQgICAgICAgICAgICAgIGZyZWVfdHMgICAgICAgICDpobXpnaLlj5HluIPml7bnmoTml7bpl7Tm
iLMNCj4gKyAgICAgICBhdCAgICAgICAgICAgICAgYWxsb2NfdHMgICAgICAgIOmhtemdouiiq+WI
humFjeaXtueahOaXtumXtOaIsw0KPiArICAgICAgIGF0b3IgICAgICAgICAgICBhbGxvY2F0b3Ig
ICAgICAg6aG16Z2i55qE5YaF5a2Y5YiG6YWN5ZmoDQo+ICsNCj4gKyAgLS1jdXJs55qE6YCJ6aG5
Og0KPiArDQo+ICsgICAgICAg6ZSuICAgICAgICAgICAgICAg6ZSu6ZW/ICAgICAgICAgICAgICDm
j4/ov7ANCj4gKyAgICAgICBwICAgICAgICAgICAgICAgcGlkICAgICAgICAgICAgIOi/m+eoi0lE
DQo+ICsgICAgICAgdGcgICAgICAgICAgICAgIHRnaWQgICAgICAgICAgICDnur/nqIvnu4RJRA0K
PiArICAgICAgIG4gICAgICAgICAgICAgICBuYW1lICAgICAgICAgICAg5Lu75Yqh5ZG95Luk5ZCN
56ewDQo+ICsgICAgICAgZiAgICAgICAgICAgICAgIGZyZWUgICAgICAgICAgICDor6XpobXmmK/l
kKblt7Lnu4/lj5HluIMNCj4gKyAgICAgICBzdCAgICAgICAgICAgICAgc3RhY2t0cmFjZSAgICAg
IOmhtemdouWIhumFjeeahOWghuagiOi3n+i4qg0KPiArICAgICAgIGF0b3IgICAgICAgICAgICBh
bGxvY2F0b3IgICAgICAg6aG16Z2i55qE5YaF5a2Y5YiG6YWN5ZmoDQo+IC0tDQo+IDIuMjcuMA0K
Pg0K
