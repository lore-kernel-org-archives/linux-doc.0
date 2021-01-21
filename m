Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8966FC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39DCB2395A
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbhAUJ3E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728729AbhAUJ2m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 04:28:42 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5DEC061575
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:28:02 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id q129so2741212iod.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ekSUPW6P6kWZrasmcKGgTFii8K+9bVDupH3acA4yqM=;
        b=O7oXkZYGgFKNZNZqbaQ4cBB5Gglr/1R44hjJpSRcetvcd1MpsWBdsao5Uku2n6cyO+
         cGvFMOiMrutCfIFeKfGtYDvAitDgbrcXUnCELYYjsfFZZYAPPep2QjiQFhe/jNjbWnOj
         fOEnRcyK37EXwITxt13CwsbcmDQRLko9QTN0kHRl0cggFG3mowqplZTyQtz2mcK/MpS5
         36xXGNkrznTvNtnMhxtSm49cc3e06XZh4WhroK8goyyX8FJoGcUhzbW7J3m7PnVPa+4t
         /p/GTFOVotYrhamBsDqr94m0pE29GoNoRxdNnmfHGIkHvoUNPpfOC5kILK75JSzG5IgQ
         HaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ekSUPW6P6kWZrasmcKGgTFii8K+9bVDupH3acA4yqM=;
        b=gAXhei0RKwuQwEOY1SX7HMVKmZz6/JZjjP1UeiqOSAxIwkXvEGM0qJpS1kmAH42+k9
         QlTVeDhAUM4vmq9tsEmFZTCbd82aDU0On+kBSwU/CNuNpdqOR28tHivnIKnf4UwZzN1C
         y+hh9ZoCeM+BYZIL8LD1uosp2vKaTiG0RxfiztivJelF7XsouanmCe1G7XkhWYthhD2L
         swBWSStGys4mT1OO+g1B5vSEqxBBkMjS/3Ojeb5gWyWsuqZg+5Eb/f3x9eRf/4giqo/N
         3egjfe62cGvLOGcf7XwCVOyo6u1elPJrQK/52JxNeYrozhr+KBUTKfL2VJN/EPVQAgNI
         IN8w==
X-Gm-Message-State: AOAM532lxLB67po2bl/QkygpPHvtN9JDQf95A35PBPZCLFsaGP4ro3zb
        QCBkO9Z3aFsJ+/E0lW6xGrNGo42f30luMK8ViDE=
X-Google-Smtp-Source: ABdhPJwOa3zBteBOo5ejI2jErSHARReNl6FiecSR9mMm4onZgIWFuuDek3rsO72/JHQdkXSu5GSL/aqcfZKiWJ6AJZY=
X-Received: by 2002:a92:7a0e:: with SMTP id v14mr4126286ilc.35.1611221282016;
 Thu, 21 Jan 2021 01:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20210121033302.558935-1-siyanteng@loongson.cn> <20210121033302.558935-2-siyanteng@loongson.cn>
In-Reply-To: <20210121033302.558935-2-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Thu, 21 Jan 2021 17:27:51 +0800
Message-ID: <CAAhV-H7uYw5WNNU7r29NUMLaYUZR7uCyaoKLWKpZjy1n=eSq7A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] docs/zh_CN: add iio ep93xx_adc.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+DQoNCk9uIFRo
dSwgSmFuIDIxLCAyMDIxIGF0IDExOjMyIEFNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nv
bi5jbj4gd3JvdGU6DQo+DQo+IFRoaXMgcGF0Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGF0aW9uL2lp
by9lcDkzeHhfYWRjLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRl
bmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4LnNoaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3po
X0NOL2lpby9lcDkzeHhfYWRjLnJzdCAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lpby9lcDkzeHhfYWRjLnJzdA0KPg0KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaWlvL2VwOTN4eF9h
ZGMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaWlvL2VwOTN4eF9hZGMu
cnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzI3YTQ4
ZDA5MDkwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vaWlvL2VwOTN4eF9hZGMucnN0DQo+IEBAIC0wLDAgKzEsNDYgQEANCj4gKy4uIGlu
Y2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IDpkb2M6
YC4uLy4uLy4uL2lpby9lcDkzeHhfYWRjYA0KPiArOlRyYW5zbGF0b3I6IFlhbnRlbmcgU2kgPHNp
eWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArLi4gX2NuX2lpb19lcDkzeHhfYWRjOg0KPiAr
DQo+ICsNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gK+aAneedv+mA
u+i+kSBFUDkzeHgg5qih5ouf5pWw5a2X6L2s5o2i5Zmo6amx5YqoDQo+ICs9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gKzEuIOamgui/sA0KPiArPT09PT09PQ0KPiAr
DQo+ICvor6XpqbHliqjlkIzml7bpgILnlKjkuo7lhbfmnIk16YCa6YGT5qih5ouf5pWw5a2X6L2s
5o2i5Zmo55qE5L2O56uvIChFUDkzMDEsIEVwOTMwMikg6K6+5aSH5ZKMMTDpgJrpgZMNCj4gK+in
puaRuOWxjy/mqKHmi5/mlbDlrZfovazmjaLlmajnmoTpq5jnq6/orr7lpIcoRVA5MzA3LCBFUDkz
MTIsIEVQOTMxNSnjgIINCj4gKw0KPiArMi4g6YCa6YGT57yW5Y+3DQo+ICs9PT09PT09PT09PQ0K
PiArDQo+ICtFUDkzMDHlkoxFUDkzMDLmlbDmja7ooajlrprkuYnkuobpgJrpgZMwLi4055qE57yW
5Y+35pa55qGI44CC6Jm954S2RVA5MzA3LCBFUDkzMTLlkoxFUDkzMTXlpJoNCj4gK+S6hjPkuKrp
gJrpgZPvvIjkuIDlhbE45Liq77yJ77yM5L2G5piv57yW5Y+35bm25rKh5pyJ5a6a5LmJ44CC5omA
5Lul6K+05pyA5ZCO5LiJ5Liq6YCa6YGT5piv6ZqP5py657yW5Y+355qE44CCDQo+ICsNCj4gK+Wm
guaenGVwOTN4eF9hZGPmmK9JSU/orr7lpIcw77yM5oKo5bCG5Zyo5Lul5LiL5L2N572u5om+5Yiw
5p2h55uuDQo+ICsvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMC86DQo+ICsNCj4gKyAg
Ky0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsNCj4gKyAgfCBzeXNmcyDlhaXlj6Mg
ICAgICB8IGJhbGwvcGluIOWQjeensCB8DQo+ICsgICs9PT09PT09PT09PT09PT09PSs9PT09PT09
PT09PT09PT0rDQo+ICsgIHwgaW5fdm9sdGFnZTBfcmF3IHwgWU0gICAgICAgICAgICB8DQo+ICsg
ICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+ICsgIHwgaW5fdm9sdGFnZTFf
cmF3IHwgU1hQICAgICAgICAgICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0rDQo+ICsgIHwgaW5fdm9sdGFnZTJfcmF3IHwgU1hNICAgICAgICAgICB8DQo+ICsgICst
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+ICsgIHwgaW5fdm9sdGFnZTNfcmF3
IHwgU1lQICAgICAgICAgICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0rDQo+ICsgIHwgaW5fdm9sdGFnZTRfcmF3IHwgU1lNICAgICAgICAgICB8DQo+ICsgICstLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+ICsgIHwgaW5fdm9sdGFnZTVfcmF3IHwg
WFAgICAgICAgICAgICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0r
DQo+ICsgIHwgaW5fdm9sdGFnZTZfcmF3IHwgWE0gICAgICAgICAgICB8DQo+ICsgICstLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+ICsgIHwgaW5fdm9sdGFnZTdfcmF3IHwgWVAg
ICAgICAgICAgICB8DQo+ICsgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+
IC0tDQo+IDIuMjcuMA0KPg0K
