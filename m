Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D071C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E93160F43
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhHDDCk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 23:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhHDDCk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 23:02:40 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8096CC061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 20:02:27 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id y1so799056iod.10
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 20:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Kk4AMMsWDOH069EgnF9dKZDei3ehlvvEbu21Pd7zcL4=;
        b=Pop6L9PII2FwxFea6DTKyCo0oOMz5KmGNJdYkPJt9b5JnuhejvBe+YG1rNBbaVYH7a
         8up2kRxPhY8r9cjlJV0RUz4k3rjdlvA5kia+yk5hJkfYi/SJiy7M5bu8xkNfaObJ1T3y
         QzRhg2qXzs3T1RXcjyA6LdzrHk1Tkgcuq3iftZT3/Vzp3jO4cNlSJq6mMZoGBVhi5cu/
         Vs7PdW0Yh0u8Km0cv6WCI73DWttUMdyJaKF8dWF7z6ykpCWC8Q+WFE7be2EXZVlH1Ku2
         lgx+hvUzRluruRwDEWWDMfFMlMiYbpJJCiz80mc5WfiLA3tm05ZZJJbqvVx8xq7mEorU
         xVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Kk4AMMsWDOH069EgnF9dKZDei3ehlvvEbu21Pd7zcL4=;
        b=QuGQhR0elGFZ7ALYmHn87rltsYTd3prPU3P33TFIJdK9fJmHsWE+3Xd+YwRWEx+d4j
         50OoruKf5nOK2FTtsgdSvQMpW022GP6hT6CV50gG4QCHsyQLorzmLKPTHxNcGlHKmo0J
         +S3DexYM+o94sThjyCjlZ/aTq4P7S6yNcHZ+tfaVeEsMgUXSYkAN2wddm6KyrvLjYV5q
         ZTiECx+VHVNuUQhNVoUOFlHpnwnJC8UhnVH39sR5XfmhtaaLTPtief41K61JnhEXgBpR
         PN9/es2uabde1x/BDzyUNnRS8XrSu6do5WZw3hAVSQ3nt+H0Oi9HDCVflhGrTfgC2ZiB
         KCkw==
X-Gm-Message-State: AOAM533JA3YwXKvtkkLYJ0ntlLEvzPBWKguT/+ziX2/mYw31yxbHvqSM
        1fLVyFV1EaKz2mc8Mt0BKTTZCTRnNFHOpujfuus=
X-Google-Smtp-Source: ABdhPJwPgGZNBrTPAn8WRcEtYkAx6M0Xcj7HEMn9qczBAA3QvHA1BzXZYssxGEm0xCpFdcnVK/U8UasJBDILkrV+bwA=
X-Received: by 2002:a05:6638:62c:: with SMTP id h12mr6309441jar.0.1628046147048;
 Tue, 03 Aug 2021 20:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <32f06dd4d9fdd412d48d4fe0b09c6ea9da75380e.1627823347.git.siyanteng@loongson.cn>
In-Reply-To: <32f06dd4d9fdd412d48d4fe0b09c6ea9da75380e.1627823347.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 11:01:50 +0800
Message-ID: <CAJy-Am=h5TcH9kJgsChheRruwCBoeKi6dnPFNsHM4+hYUpmbjg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] docs/zh_CN: add virt acrn introduction translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCA5OjMyIFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3ZpcnQvYWNybi9p
bnRyb2R1Y3Rpb24ucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVu
ZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vdmlydC9hY3JuL2luZGV4LnJzdCAgICB8ICA0ICstDQo+ICAuLi4vemhfQ04vdmlydC9h
Y3JuL2ludHJvZHVjdGlvbi5yc3QgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrDQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fj
cm4vaW50cm9kdWN0aW9uLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdmlydC9hY3JuL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3ZpcnQvYWNybi9pbmRleC5yc3QNCj4gaW5kZXggNjA2MWU3OTBlZTgzLi5i
OGY1MDIwMzM0NTUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZpcnQvYWNybi9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdmlydC9hY3JuL2luZGV4LnJzdA0KPiBAQCAtMjAsOCArMjAsMTAgQEAgQUNSTui2
hee6p+euoeeQhuWZqA0KPiAgLi4gdG9jdHJlZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDENCj4NCj4g
KyAgIGludHJvZHVjdGlvbg0KPiArDQo+ICBUT0RPTElTVDoNCj4NCj4gLSAgIGludHJvZHVjdGlv
bg0KPiArDQo+ICAgICBpby1yZXF1ZXN0DQo+ICAgICBjcHVpZA0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9hY3JuL2ludHJvZHVjdGlvbi5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fjcm4vaW50cm9kdWN0aW9u
LnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIzMTAz
NGJjZmE0ZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3ZpcnQvYWNybi9pbnRyb2R1Y3Rpb24ucnN0DQo+IEBAIC0wLDAgKzEsNTIgQEAN
Cj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjog
Li4vLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0
aW9uL3ZpcnQvYWNybi9pbnRyb2R1Y3Rpb24ucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs6
5qCh6K+ROg0KPiArDQo+ICsg5pe25aWO5LquIEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0K
PiArDQo+ICsuLiBfY25fdmlydF9hY3JuX2ludHJvZHVjdGlvbjoNCj4gKw0KPiArQUNSTui2hee6
p+euoeeQhuWZqOS7i+e7jQ0KPiArPT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK0FDUk7otoXn
uqfnrqHnkIblmajmmK/kuIDkuKrnrKzkuIDnsbvotoXnuqfnrqHnkIblmajvvIznm7TmjqXlnKjo
o7jmnLrnoazku7bkuIrov5DooYzjgILlroPmnInkuIDkuKrnibnmnYPnrqHnkIbomZrmi5/mnLrv
vIznp7DkuLrmnI0NCj4gK+WKoeiZmuaLn+acuu+8jOeUqOS6jueuoeeQhueUqOaIt+iZmuaLn+ac
uuWSjOi/m+ihjEkvT+S7v+ecn+OAgg0KPiArDQo+ICtBQ1JO55So5oi356m66Ze05piv5LiA5Liq
6L+Q6KGM5Zyo5pyN5Yqh6Jma5ouf5py65Lit55qE5bqU55So56iL5bqP77yM5a6D5qC55o2u5ZG9
5Luk6KGM6YWN572u5Li655So5oi36Jma5ouf5py65Lu/55yf6K6+5aSH44CCDQo+ICtBQ1JO566h
55CG56iL5bqP5pyN5Yqh5qih5Z2X77yISFNN77yJ5piv5pyN5Yqh6Jma5ouf5py65Lit55qE5LiA
5Liq5YaF5qC45qih5Z2X77yM5Li6QUNSTueUqOaIt+epuumXtOaPkOS+m+euoeeQhueoi+W6j+ac
jQ0KPiAr5Yqh44CCDQo+ICsNCj4gK+S4i+WbvuWxleekuuS6huivpeaetuaehOOAgg0KPiArDQo+
ICs6Og0KPiArDQo+ICsgICAgICAgICAgICAgICAg5pyN5Yqh56uvVk0gICAgICAgICAgICAgICAg
ICAgICAg55So5oi356uvVk0NCj4gKyAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
KyAgfCAgKy0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gKyAgICAgIHwgICAgICAgICstLS0tLS0tLS0t
LS0tLSsgICAgfCAgfCAgfCAgICAgICAgICAgICAgICAgIHwNCj4gKyAgICAgIHwgICAgICAgIHxB
Q1JO55So5oi356m66Ze0ICB8ICAgIHwgIHwgIHwgICAgICAgICAgICAgICAgICB8DQo+ICsgICAg
ICB8ICAgICAgICArLS0tLS0tLS0tLS0tLS0rICAgIHwgIHwgIHwgICAgICAgICAgICAgICAgICB8
DQo+ICsgICAgICB8LS0tLS0tLS0tLS0tLS0tLS1pb2N0bC0tLS0tLXwgIHwgIHwgICAgICAgICAg
ICAgICAgICB8ICAgLi4uDQo+ICsgICAgICB85YaF5qC456m66Ze0ICAgICAgICstLS0tLS0tLS0t
KyB8ICB8ICB8ICAgICAgICAgICAgICAgICAgfA0KPiArICAgICAgfCAgICAgICAgICAgICAgIHwg
ICBIU00gICAgfCB8ICB8ICB8IOmpseWKqCAgICAgICAgICAgICB8DQo+ICsgICAgICB8ICAgICAg
ICAgICAgICAgKy0tLS0tLS0tLS0rIHwgIHwgIHwgICAgICAgICAgICAgICAgICB8DQo+ICsgICAg
ICArLS0tLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLSsgIHwgICstLS0tLS0tLS0tLS0tLS0tLS0r
DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLS0tLS1oeXBlcmNhbGwtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiArICB8ICAgICAgICAgICAgICAgICAgICAgICAgIEFD
Uk7otoXnuqfnrqHnkIblmaggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiArICAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsNCj4gKyAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg56Gs5Lu2ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gKyAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rDQo+ICsNCj4gK0FDUk7nlKjmiLfnqbrpl7TkuLrnlKjmiLfomZrmi5/mnLrliIbphY3lhoXl
rZjvvIzphY3nva7lkozliJ3lp4vljJbnlKjmiLfomZrmi5/mnLrkvb/nlKjnmoTorr7lpIfvvIzl
iqDovb3omZrmi5/lvJXlr7znqIvluo/vvIwNCj4gK+WIneWni+WMluiZmuaLn0NQVeeKtuaAge+8
jOWkhOeQhuadpeiHqueUqOaIt+iZmuaLn+acuueahEkvT+ivt+axguiuv+mXruOAguWug+S9v+eU
qGlvY3Rsc+adpeS4jkhTTemAmuS/oeOAgkhTTemAmui/hw0KPiAr5LiOQUNSTui2hee6p+euoeeQ
huWZqOeahGh5cGVyY2FsbHPov5vooYzkuqTkupLmnaXlrp7njrDnrqHnkIbmnI3liqHjgIJIU03l
kJHnlKjmiLfnqbrpl7TovpPlh7rkuIDkuKpjaGFy6K6+5aSH5o6l5Y+jDQo+ICvvvIgvZGV2L2Fj
cm5faHNt77yJ44CCDQo+ICsNCj4gK0FDUk7otoXnuqfnrqHnkIblmajmmK/lvIDmupDnmoTvvIzk
u7vkvZXkurrpg73lj6/ku6XotKHnjK7jgILmupDnoIHlupPlj6/lnKgNCg0KcmVtb3ZlICflj6/i
gJggPyB3aXRoIHRoaXMNCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3Jn
Pg0KDQpUaGFua3MNCg0KPiAraHR0cHM6Ly9naXRodWIuY29tL3Byb2plY3RhY3JuL2Fjcm4taHlw
ZXJ2aXNvcuOAgg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
