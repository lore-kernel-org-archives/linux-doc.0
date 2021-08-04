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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84309C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624B261037
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhHDC2H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHDC2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:28:07 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422A8C06175F
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:27:55 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id m13so744999iol.7
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KVrBxWBnZKFX544a5UrPyHmgYnkMKr0huOw+Sh9einQ=;
        b=DNTwyudIH8tiyX3phhdy4q1+klNAEzHjMrGBrC7cPG0R/Re292SMSCHbNx5/DQqD28
         VP0N7mQsTRL2KWhElkY0hp0vpVYjJ9RWezV7Hym+nKCYfyUuHKCA06Cp0q5qHPVv3QNy
         2svPMTtLuxp7e7XtrRfZzDjXUHqveKdwmxFZOVY9h8ZKluPLQvYJHEI180bnuYF9WztO
         je53nOQzX4W2L6QT3vscukBAl9x+tbEkZ0xWSYIbGqP/QWSpclt/jx1AllaLBmx4I08K
         xv5trG0ebXdmgoW/Y+EZWMA52xB8z5yLJaMwQoWSb7qXrRtTirWal2qLKaKBFRRXaMrY
         L2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KVrBxWBnZKFX544a5UrPyHmgYnkMKr0huOw+Sh9einQ=;
        b=H6Dq3vpfbDikBXZNpKcnnHVUQxmBfXq2MTNGBKVnuBipJWgAGi1gaWcOSWaxRlE4Y+
         4LBI4QXSkrBPdBruqOjXc2REP1L0BkcDSHPw3GX6SDAOMB3zh7Tu5XGL0uxBzjQVJIpg
         QTTmclSJHcG+eqAn3L9KeUOnhQFhWlhyq0wavzABbexaH2PyeqmBhhyKarSi5mCIWC6L
         AugOib2UA2SrxC91MhfoOPysVWK6k/pZ2Wm/POG3QYY07rvZFErrzKTgr37paZs0D+LA
         im8yjzV+Hy6emehsWPqbCA3Uuu3QajgI+hnFtV9zuDmx7kpAvafd9BxaOQpgMnKz+lap
         Lp1A==
X-Gm-Message-State: AOAM532IsliwPpK464n4Nq5G1cU83I1Hv8NeTsg++AM738C3OISvMit1
        phAMY34utpssUjkZ+ppMpsRr0RMPuatIRSqUqok=
X-Google-Smtp-Source: ABdhPJwm3L2HRPYnvnBhPXX6hJyq2ILisotpwVGF/cZSJawKrk4sdoi0TcyTEB+lr5n7tanUXzLxx/OX7i8oW2BGYY8=
X-Received: by 2002:a02:698f:: with SMTP id e137mr19197366jac.89.1628044074725;
 Tue, 03 Aug 2021 19:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <c7b4cc2c6aba739f777cef80dd527ae523c3d9e5.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <c7b4cc2c6aba739f777cef80dd527ae523c3d9e5.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:27:18 +0800
Message-ID: <CAJy-AmkBytZwNSa79aEkBk62cKM7Mt+hHMfqpwYMJJEcupEmsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] docs/zh_CN: add infiniband core_locking translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCA4OjI1IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL2luZmluaWJhbmQv
Y29yZV9sb2NraW5nLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRl
bmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3poX0NOL2luZmluaWJhbmQvY29yZV9s
b2NraW5nLnJzdCAgICAgICAgIHwgMTE1ICsrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5z
bGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdCAgIHwgICAzICstDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC9jb3Jl
X2xvY2tpbmcucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9pbmZpbmliYW5kL2NvcmVfbG9ja2luZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL2NvcmVfbG9ja2luZy5yc3QNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MmYwODAzOGQ0NGINCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5k
L2NvcmVfbG9ja2luZy5yc3QNCj4gQEAgLTAsMCArMSwxMTUgQEANCj4gKw0KPiArLi4gaW5jbHVk
ZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRh
dGlvbi9pbmZpbmliYW5kL2NvcmVfbG9ja2luZy5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0K
PiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4g
KzrmoKHor5E6DQo+ICsNCj4gKyDnjovmma7lrocgUHV5dSBXYW5nIDxyZWFscHV5dXdhbmdAZ21h
aWwuY29tPg0KPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4gKw0K
PiArLi4gX2NuX2luZmluaWJhbmRfY29yZV9sb2NraW5nOg0KPiArDQo+ICs9PT09PT09PT09PT09
PT09PT0NCj4gK2luZmluaWJhbmTkuK3pl7TlsYLplIENCj4gKz09PT09PT09PT09PT09PT09PQ0K
PiArDQo+ICsgIOacrOaMh+WNl+ivleWbvuaYjuehrmluZmluaWJhbmTkuK3pl7TlsYLnmoTplIHl
gYforr7jgILlroPmj4/ov7Dkuoblr7nkvY3kuo7kuK3pl7TlsYLku6XkuIvnmoTkvY4NCj4gKyAg
57qn6amx5Yqo56iL5bqP5ZKM5L2/55So5Lit6Ze05bGC55qE5LiK5bGC5Y2P6K6u55qE6KaB5rGC
44CCDQo+ICsNCj4gK+edoeecoOWSjOS4reaWreeOr+Wigw0KPiArPT09PT09PT09PT09PT0NCj4g
Kw0KPiArICDpmaTkuobku6XkuIvlvILluLjmg4XlhrXvvIxpYl9kZXZpY2Xnu5PmnoTkvZPkuK3m
iYDmnInmlrnms5XnmoTkvY7nuqfpqbHliqjlrp7njrDpg73lj6/ku6XnnaHnnKDjgIINCj4gKyAg
6L+Z5Lqb5byC5bi45oOF5Ya15piv5YiX6KGo5Lit55qE5Lu75oSP55qE5pa55rOVOg0KPiArDQo+
ICsgICAgLSBjcmVhdGVfYWgNCj4gKyAgICAtIG1vZGlmeV9haA0KPiArICAgIC0gcXVlcnlfYWgN
Cj4gKyAgICAtIGRlc3Ryb3lfYWgNCj4gKyAgICAtIHBvc3Rfc2VuZA0KPiArICAgIC0gcG9zdF9y
ZWN2DQo+ICsgICAgLSBwb2xsX2NxDQo+ICsgICAgLSByZXFfbm90aWZ5X2NxDQo+ICsNCj4gKyAg
ICDku5bku6zlj6/og73kuI3lj6/ku6XnnaHnnKDvvIzogIzkuJTlv4Xpobvlj6/ku6Xku47ku7vk
vZXkuIrkuIvmlofkuK3osIPnlKjjgIINCj4gKw0KPiArICAgIOWQkeS4iuWxguWNj+iuruS9v+eU
qOiAhei+k+WHuueahOebuOW6lOWHveaVsDoNCj4gKw0KPiArICAgIC0gcmRtYV9jcmVhdGVfYWgN
Cj4gKyAgICAtIHJkbWFfbW9kaWZ5X2FoDQo+ICsgICAgLSByZG1hX3F1ZXJ5X2FoDQo+ICsgICAg
LSByZG1hX2Rlc3Ryb3lfYWgNCj4gKyAgICAtIGliX3Bvc3Rfc2VuZA0KPiArICAgIC0gaWJfcG9z
dF9yZWN2DQo+ICsgICAgLSBpYl9yZXFfbm90aWZ5X2NxDQo+ICsNCj4gKyAgICDlm6DmraTvvIzl
nKjku7vkvZXmg4XlhrXkuIvpg73lj6/ku6XlronlhajosIPnlKjvvIjlroPku6zvvInjgIINCj4g
Kw0KPiArICDmraTlpJbvvIzor6Xlh73mlbANCj4gKw0KPiArICAgIC0gaWJfZGlzcGF0Y2hfZXZl
bnQNCj4gKw0KPiArICDooqvlupXlsYLpqbHliqjnlKjmnaXpgJrov4fkuK3pl7TlsYLosIPluqbl
vILmraXkuovku7bnmoTigJxB4oCd77yM5Lmf5Y+v5Lul5LuO5Lu75L2V5LiK5LiL5paH5Lit5a6J
5YWo6LCDDQo+ICsgIOeUqOOAgg0KPiArDQo+ICvlj6/ph43lhaXmgKcNCj4gKy0tLS0tLS0tDQo+
ICsNCj4gKyAg55Sx5L2O57qn6amx5Yqo56iL5bqP5a+85Ye655qEaWJfZGV2aWNl57uT5p6E5L2T
5Lit55qE5omA5pyJ5pa55rOV5b+F6aG75piv5a6M5YWo5Y+v6YeN5YWl55qE44CCDQo+ICsgIOWN
s+S9v+S9v+eUqOWQjOS4gOWvueixoeeahOWkmuS4quWHveaVsOiwg+eUqOiiq+WQjOaXtui/kOih
jO+8jOS9jue6p+mpseWKqOeoi+W6j+S5n+mcgOimgeaJp+ihjOaJgOaciQ0KPiArICDlv4XopoHn
moTlkIzmraXku6Xkv53mjIHkuIDoh7TmgKfjgIINCj4gKw0KPiArICBJQuS4remXtOWxguS4jeaJ
p+ihjOS7u+S9leWHveaVsOiwg+eUqOeahOW6j+WIl+WMluOAgg0KPiArDQo+ICsgIOWboOS4uuS9
jue6p+mpseWKqOeoi+W6j+aYr+WPr+mHjeWFpeeahO+8jOaJgOS7peS4jeimgeaxguS4iuWxguWN
j+iuruS9v+eUqOiAheS7u+S9lemhuuW6j+aJp+ihjOOAgueEtg0KPiArICDogIzvvIzkuLrkuobl
vpfliLDlkIjnkIbnmoTnu5PmnpzvvIzlj6/og73pnIDopoHkuIDkupvpobrluo/jgILkvovlpoLv
vIzkuIDkuKrkvb/nlKjogIXlj6/ku6XlnKjlpJrkuKoNCj4gKyAgQ1BV5LiK5ZCM5pe25a6J5YWo
5Zyw6LCD55SoaWJfcG9sbF9jcSgp44CC54S26ICM77yM5LiN5ZCM55qEaWJfcG9sbF9jcSgp6LCD
55So5LmL6Ze0DQo+ICsgIOeahOW3peS9nOWujOaIkOS/oeaBr+eahOmhuuW6j+ayoeacieiiq+Wu
muS5ieOAgg0KPiArDQo+ICvlm57osIMNCj4gKy0tLS0NCj4gKw0KPiArICDkvY7nuqfpqbHliqjn
qIvluo/kuI3lvpfnm7TmjqXku47kuI5pYl9kZXZpY2Xmlrnms5XosIPnlKjnm7jlkIznmoTosIPn
lKjpk77kuK3miafooYzlm57osIPjgILkvosNCj4gKyAg5aaC77yM5L2O57qn6amx5Yqo56iL5bqP
5LiN5YWB6K645LuOcG9zdF9zZW5k5pa55rOV55u05o6l6LCD55So5L2/55So6ICF55qE5a6M5oiQ
5LqL5Lu25aSE55CG56iLDQo+ICsgIOW6j+OAguebuOWPje+8jOS9jue6p+mpseWKqOeoi+W6j+W6
lOivpeaOqOi/n+i/meS4quWbnuiwg++8jOS+i+Wmgu+8jOiwg+W6puS4gOS4qnRhc2tsZXTmnaXm
iafooYwNCj4gKyAg6L+Z5Liq5Zue6LCD44CCDQo+ICsNCj4gKyAg5L2O5bGC6amx5Yqo6LSf6LSj
56Gu5L+d5ZCM5LiAQ1HnmoTlpJrkuKrlrozmiJDkuovku7blpITnkIbnqIvluo/kuI3ooqvlkIzm
l7bosIPnlKjjgILpqbHliqjnqIvluo/lv4UNCj4gKyAg6aG75L+d6K+B5LiA5Liq57uZ5a6a55qE
Q1HnmoTkuovku7blpITnkIbnqIvluo/lnKjlkIzkuIDml7bpl7Tlj6rmnInkuIDkuKrlnKjov5Do
oYzjgILmjaLlj6Xor53or7TvvIwNCj4gKyAg5Lul5LiL5oOF5Ya15piv5LiN5YWB6K6455qEOjoN
Cj4gKw0KPiArICAgICAgICAgIENQVTEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBDUFUyDQo+ICsNCj4gKyAgICBsb3ctbGV2ZWwgZHJpdmVyIC0+DQo+ICsgICAgICBjb25zdW1l
ciBDUSBldmVudCBjYWxsYmFjazoNCj4gKyAgICAgICAgLyogLi4uICovDQo+ICsgICAgICAgIGli
X3JlcV9ub3RpZnlfY3EoY3EsIC4uLik7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsb3ctbGV2ZWwgZHJpdmVyIC0+DQo+ICsgICAgICAgIC8qIC4uLiAqLyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN1bWVyIENRIGV2ZW50IGNhbGxiYWNrOg0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIC4uLiAqLw0K
PiArICAgICAgICByZXR1cm4gZnJvbSBDUSBldmVudCBoYW5kbGVyDQo+ICsNCj4gKyAg5a6M5oiQ
5LqL5Lu25ZKM5byC5q2l5LqL5Lu25Zue6LCD55qE6L+Q6KGM546v5aKD5rKh5pyJ6KKr5a6a5LmJ
44CCIOagueaNruS9jue6p+WIq+eahOmpseWKqOeoi+W6j++8jOWug+WPr+iDveaYrw0KPiArICDo
v5vnqIvkuIrkuIvmlofjgIFzb2Z0aXJx5LiK5LiL5paH5oiW5Lit5pat5LiK5LiL5paH44CC5LiK
5bGC5Y2P6K6u5L2/55So6ICF5Y+v6IO95LiN5Lya5Zyo5Zue6LCD5Lit552h55yg44CCDQo+ICsN
Cj4gK+eDreaPkuaLlA0KPiArLS0tLS0tDQo+ICsNCj4gKyAg5b2T5LiA5Liq5L2O57qn6amx5Yqo
56iL5bqP6LCD55SoaWJfcmVnaXN0ZXJfZGV2aWNlKCnml7bvvIzlroPlrqPluIPkuIDkuKrorr7l
pIflt7Lnu48NCj4gKyAg5YeG5aSH5aW95L6b5L2/55So6ICF5L2/55So77yM5omA5pyJ55qE5Yid
5aeL5YyW5b+F6aG75Zyo6L+Z5Liq6LCD55So5LmL5YmN5a6M5oiQ44CC6K6+5aSH5b+F6aG75L+d
DQo+ICsgIOaMgeWPr+eUqO+8jOebtOWIsOmpseWKqOWvuWliX3VucmVnaXN0ZXJfZGV2aWNlKCnn
moTosIPnlKjov5Tlm57jgIINCj4gKw0KPiArICDkvY7nuqfpqbHliqjnqIvluo/lv4Xpobvku47o
v5vnqIvkuIrkuIvmlofosIPnlKhpYl9yZWdpc3Rlcl9kZXZpY2UoKeWSjA0KPiArICBpYl91bnJl
Z2lzdGVyX2RldmljZSgp44CC5aaC5p6c5L2/55So6ICF5Zyo6L+Z5Lqb6LCD55So5Lit5Zue6LCD
5Yiw6amx5Yqo56iL5bqP77yM5a6DDQo+ICsgIOS4jeiDveaMgeacieS7u+S9leWPr+iDveWvvOiH
tOatu+mUgeeahHNlbWFwaG9yZXPjgIINCj4gKw0KPiArICDkuIDml6blhbbnu5PmnoTkvZNpYl9j
bGllbnTnmoRhZGTmlrnms5XooqvosIPnlKjvvIzkuIrlsYLljY/orq7kvb/nlKjogIXlsLHlj6/k
u6XlvIDlp4vkvb/nlKgNCj4gKyAg5LiA5LiqSULorr7lpIfjgILkvb/nlKjogIXlv4XpobvlnKjk
u47np7vpmaTmlrnms5Xov5Tlm57kuYvliY3lrozmiJDmiYDmnInnmoTmuIXnkIblt6XkvZzlubbp
h4rmlL4NCj4gKyAg5LiO6K6+5aSH55u45YWz55qE5omA5pyJ6LWE5rqQ44CCDQo+ICsNCj4gKyAg
5L2/55So6ICF6KKr5YWB6K645Zyo5YW25re75Yqg5ZKM5Yig6Zmk5pa55rOV5Lit552h55yg44CC
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmli
YW5kL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJh
bmQvaW5kZXgucnN0DQo+IGluZGV4IGViYjFlMjBiN2RmNC4uY2MwMGYzMWM3N2QwIDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL2luZGV4
LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5k
L2luZGV4LnJzdA0KPiBAQCAtMjIsOSArMjIsMTAgQEAgaW5maW5pYmFuZA0KPiAgLi4gdG9jdHJl
ZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDENCj4NCj4gKyAgIGNvcmVfbG9ja2luZw0KPiArDQo+ICBU
T0RPTElTVDoNCj4NCj4gLSAgIGNvcmVfbG9ja2luZw0KPiAgICAgaXBvaWINCj4gICAgIG9wYV92
bmljDQo+ICAgICBzeXNmcw0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
