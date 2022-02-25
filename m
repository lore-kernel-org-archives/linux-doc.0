Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0635C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 25 Feb 2022 06:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237631AbiBYGTD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Feb 2022 01:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236480AbiBYGTD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Feb 2022 01:19:03 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A42194171
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 22:18:31 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id v5so3547916ilm.9
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 22:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9AwcQLaF7Ke1xee7FSMr5kHmturapSK+x6OEyin6o+o=;
        b=m3D7xBQrlWai+hhNkVoY3YEtXu6XhcsTPGwDR9tOrpE0A2bqzvAcxb9Ynrkf7vEpIl
         0YzMpCgli2RTiWV5fT5LyfOA0NznMGFxfv7ilCmDHU1jbEATiWN5gNvISKsMvaLKhbGz
         ezTrJHAIbIt3WZvQrZ3l+XazStBMEBnQFswbKyhQUwMkTewxxZ370E5AuQO8FH73Wqsb
         jvDNUqcKAGCOABzIzN5+jDm66k1/fdlUcjBJct+vewuilOcLPKmb9RK5+OdIpO3desPl
         dGYnv4sph07cXZHkYmRMXvTdhW6pzyVQotjjZ0gJhJ50nIN7qYfqHR4qnmjtxYeDJidN
         ff9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9AwcQLaF7Ke1xee7FSMr5kHmturapSK+x6OEyin6o+o=;
        b=Zxzc3A76YhO+vetWcGa9slDCyLBtkSzPuDtJ6/bsdsIw7mKXDSfMmteSkmAvSLrPYh
         u/AeksevR/lUrxJqJmyck15w8+UvgndOTAXJ673D4ybocWCinQy0qrB2kqNirm0wVy+k
         TuDmmKDcPSGLisnh8HDvs1tH+t79gBUnT5pGZRaPR7DlfbvxsdTg7Tnooepz1eHCUUg7
         hJDbiDQSVzm8jtFyjm0Ybl730+/Scoii5SkYI0uSjOdUHloyeT/Hm+mLGYNoWBwB+SiD
         Aw5rghHXfHoW5bYK8YxipvS+n2RuwFEG4SjXAq9ENCYNfGUhWuHZcHhSrS4NHAzoqBb9
         BAjg==
X-Gm-Message-State: AOAM531doMDuxrmhyjoUQGaEjShGWYgRBGM6gruiPgl/oblB52PPAf+0
        lWSv2+8vDhrjnCfRpUWAz9EEpAnMknUPdYh2Cyg=
X-Google-Smtp-Source: ABdhPJxu29yd6iyqlED0muyajb4eV2s9GkBpC7SMjYbLgIXX0zJ+4lIn1YRvIME5O2kubwTe3ZYVCJWGw109ODOlIrk=
X-Received: by 2002:a05:6e02:20e8:b0:2c1:e164:76e6 with SMTP id
 q8-20020a056e0220e800b002c1e16476e6mr5228941ilv.135.1645769911227; Thu, 24
 Feb 2022 22:18:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645704571.git.siyanteng@loongson.cn> <884f4a6c76b61ab11488358d0c31f727d4d1eb26.1645704571.git.siyanteng@loongson.cn>
In-Reply-To: <884f4a6c76b61ab11488358d0c31f727d4d1eb26.1645704571.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 25 Feb 2022 14:17:55 +0800
Message-ID: <CAJy-AmkxyyC3rX=Lmmg6WdniYKjZXKnMDBA_HsR0=9sxnQvR_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN: add peci subsystem translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBGZWIgMjQsIDIwMjIgYXQgODoxOCBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgLi4uL3BlY2kvcGVjaS5yc3QgaW50byBD
aGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0KPiAt
LS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcGVjaS9pbmRleC5yc3QgICAgICAgICB8ICA0
ICstDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3BlY2kvcGVjaS5yc3QgICAgICAgICAgfCA1
NCArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vcGVjaS9wZWNpLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGVjaS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9wZWNpL2luZGV4LnJzdA0KPiBpbmRleCBjNTM2ZGJlMWUxYTgu
LjRmNjY5NGM4MjhmYSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vcGVjaS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vcGVjaS9pbmRleC5yc3QNCj4gQEAgLTE1LDggKzE1LDggQEAgTGludXggUEVDSSDlrZDn
s7vnu58NCj4NCj4gIC4uIHRvY3RyZWU6Og0KPg0KPiAtVE9ET0xpc3QNCj4gLSogICBwZWNpDQo+
ICsNCj4gKyAgIHBlY2kNCj4NCj4gIC4uIG9ubHk6OiAgc3VicHJvamVjdCBhbmQgaHRtbA0KPg0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGVjaS9wZWNp
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3BlY2kvcGVjaS5yc3QNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hM2I0Zjk5Yjk5NGMN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9wZWNpL3BlY2kucnN0DQo+IEBAIC0wLDAgKzEsNTQgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpo
X0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vcGVjaS9wZWNpLnJzdA0K
PiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVu
Z0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArPT09PQ0KPiAr5qaC6L+w
DQo+ICs9PT09DQo+ICsNCj4gK+W5s+WPsOeOr+Wig+aOp+WItuaOpeWPo++8iFBFQ0nvvInmmK/o
i7HnibnlsJTlpITnkIblmajlkoznrqHnkIbmjqfliLblmajvvIjlpoLlupXmnb/nrqHnkIbmjqfl
iLblmajvvIxCTUPvvIkNCj4gK+S5i+mXtOeahOS4gOS4qumAmuS/oeaOpeWPo+OAglBFQ0nmj5Dk
vpvnmoTmnI3liqHlhYHorrjnrqHnkIbmjqfliLblmajpgJrov4forr/pl67lkITnp43lr4TlrZjl
majmnaXphY3nva7jgIHnm5ENCj4gK+aOp+WSjOiwg+ivleW5s+WPsOOAguWug+WumuS5ieS6huS4
gOS4quS4k+mXqOeahOWRveS7pOWNj+iuru+8jOeuoeeQhuaOp+WItuWZqOS9nOS4ulBFQ0nnmoTl
j5HotbfogIXvvIzlpITnkIblmagNCj4gK+S9nOS4ulBFQ0nnmoTlk43lupTogIXjgIJQRUNJ5Y+v
5Lul55So5LqO5Z+65LqO5Y2V5aSE55CG5Zmo5ZKM5aSa5aSE55CG5Zmo55qE57O757uf5Lit44CC
DQo+ICsNCj4gK+azqOaEj++8muiLseeJueWwlFBFQ0nop4TojIPmsqHmnInkvZzkuLrkuJPpl6jn
moTmlofku7blj5HluIPvvIzogIzmmK/kvZzkuLroi7HnibnlsJRDUFXnmoTlpJbpg6jorr7orqHo
p4TojIMNCj4gK++8iEVEU++8ieeahOS4gOmDqOWIhuOAguWklumDqOiuvuiuoeinhOiMg+mAmuW4
uOaYr+S4jeWFrOW8gOeahOOAgg0KPiArDQo+ICtQRUNJIOe6vw0KPiArLS0tLS0tLS0tDQo+ICsN
Cj4gK1BFQ0nnur/mjqXlj6Pkvb/nlKjljZXnur/ov5vooYzoh6rplIHlkozmlbDmja7kvKDovpPj
gILlroPkuI3pnIDopoHku7vkvZXpop3lpJbnmoTmjqfliLbnur8tLeeJqeeQhuWxguaYr+S4gOS4
qg0KPiAr6Ieq6ZSB55qE5Y2V57q/5oC757q/5L+h5Y+377yM5q+P5LiA5Liq5q+U54m56YO95LuO
5o6l6L+R6Zu25LyP55qE56m66Zey54q25oCB5byA5aeL6amx5Yqo44CB5LiK5Y2H6L6557yY44CC
6amx5Yqo6auYDQo+ICvnlLXlubPkv6Hlj7fnmoTmjIHnu63ml7bpl7Tlj6/ku6Xnoa7lrprkvY3l
gLzmmK/pgLvovpEg4oCcMOKAnSDov5jmmK/pgLvovpEg4oCcMeKAneOAglBFQ0nnur/ov5jljIXm
i6zkuI7mr4/kuKrkv6ENCj4gK+aBr+W7uueri+eahOWPr+WPmOaVsOaNrumAn+eOh+OAgg0KPiAr
DQo+ICvlr7nkuo5QRUNJ57q/77yM5q+P5Liq5aSE55CG5Zmo5YyF5bCG5Zyo5LiA5Liq5a6a5LmJ
55qE6IyD5Zu05YaF5Yip55So5ZSv5LiA55qE44CB5Zu65a6a55qE5Zyw5Z2A77yM6K+l5Zyw5Z2A
5bqUDQo+ICvor6XkuI7lpITnkIblmajmj5LluqdJROacieWbuuWumueahOWFs+ezuy0t5aaC5p6c
5YW25Lit5LiA5Liq5aSE55CG5Zmo6KKr56e76Zmk77yM5a6D5LiN5Lya5b2x5ZON5YW25L2Z5aSE
55CG5ZmoDQo+ICvnmoTlnLDlnYDjgIINCj4gKw0KPiArUEVDSeWtkOezu+e7n+S7o+eggeWGheW1
jOaWh+ahow0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK+ivpUFQSeWcqOS7
peS4i+WGheaguOS7o+eggeS4rToNCj4gKw0KPiAraW5jbHVkZS9saW51eC9wZWNpLmgNCj4gKw0K
PiArZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gKw0KPiArZHJpdmVycy9wZWNpL2NvcmUuYw0K
PiArDQo+ICtkcml2ZXJzL3BlY2kvcmVxdWVzdC5jDQo+ICsNCj4gK1BFQ0kgQ1BVIOmpseWKqCBB
UEkNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr6K+lQVBJ5Zyo5Lul5LiL5YaF5qC4
5Luj56CB5LitOg0KPiArDQo+ICtkcml2ZXJzL3BlY2kvY3B1LmMNCj4gLS0NCj4gMi4yNy4wDQo+
DQo=
