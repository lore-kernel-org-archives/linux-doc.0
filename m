Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41DBC54EE9
	for <linux-doc@archiver.kernel.org>; Fri,  2 Sep 2022 08:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbiIBIOp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Sep 2022 04:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbiIBIO3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 04:14:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F1ABD089
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 01:13:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j14so2203894lfu.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9us/vXXhp1/ogvCQnOjT5WfF1bGAA07paoY2V/LJcKQ=;
        b=HvdB8muFqCCUIw0VBPStgLul+y7UuUYDvWoj1INBhTjiLXNC0kXjTNke6dzMnuIwhz
         h8jAAzld7DYcG6KFL2pm9Y4ZEeHYWUp/VRFw3UOFgzb1q1YoqeFLoffaa8w/hevExE+K
         wAwHaiw5L/GmEgMTGZHmrLL2rhOJ5g+PYwYbgNOAFaSJd3s+PGGqI56Q94HIikzSSYN2
         Qrn1PL9JrmhuZkEMlYUpduY+pXBMuRVz9qLNb/4vmSEHQtNyigZViotvkqWSYWAd+N7R
         nitfYNa59rrApfrMb9joEDKJldv22/l2G5jFzWp/jv6J1mxFzIDFGuOCAY7sPvhlnO00
         uqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9us/vXXhp1/ogvCQnOjT5WfF1bGAA07paoY2V/LJcKQ=;
        b=cRE2CiFXgm4UKQ3TWWtBBEGZ4yYOrVxGYbMUY4TpymemATJZqAPdyW/CEpcLWnc6Jm
         gsBKoUhiUOHlGRPhrARWYPWeCqjADzRO4YtP7n0WQ05dMv3S+sMr+jWGQPLlgHbOz9z+
         VaWNKdeY4eJ7i3nHgFmWbHFxBizqFs17IDcO3BB3tYh8HOQXFUUWt+dPy/836G6yU3O2
         tHlkpM3tNGEc/+BwypCK9NOOf+BTpeL35UEzUl184wWnSwAWQUosU2xlYhXqfnxKeFRm
         Ttvq0lufiyEQ9cjBA9Oqpm856ZsHkvA3g7QBkqOVvLTwDIE5YqviXXa+cHTRUMEqrOeA
         KAYw==
X-Gm-Message-State: ACgBeo24IZcY2scVbVE9y9nYi1+49aCsTrf7q1+CYDL8ivrURmXsN0v4
        3sjRFDL8R5gFrCmaEP8exUnjRU/HaTkml3Q4fBg=
X-Google-Smtp-Source: AA6agR40PvRBGvYN4bAYR+SNOLI6Lg3z643eOh1j1E4VANxoXXqdYKY0Sd9EEg4VQGBU+XBluqDBG+h6HxWARogeuA8=
X-Received: by 2002:a19:2d0d:0:b0:491:63c9:5a5f with SMTP id
 k13-20020a192d0d000000b0049163c95a5fmr11003185lfj.629.1662106427829; Fri, 02
 Sep 2022 01:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662022757.git.siyanteng@loongson.cn> <be219cfda1db15eedd57b77cfdfd52acbd1a8aee.1662022757.git.siyanteng@loongson.cn>
In-Reply-To: <be219cfda1db15eedd57b77cfdfd52acbd1a8aee.1662022757.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 2 Sep 2022 16:13:11 +0800
Message-ID: <CAJy-Ammq4vqqMSPb65c7yG1R4orJ+gzqSZeDNS2GYZ8Xy=9TmA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] docs/zh_CN: add dt dynamic-resolution-notes translation
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
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vZGV2aWNldHJlZS9keW5hbWljLXJl
c29sdXRpb24tbm90ZXMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFu
dGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkg
PGFsZXhzQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvZHluYW1pYy1yZXNv
bHV0aW9uLW5vdGVzLnJzdCAgIHwgMzEgKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5z
bGF0aW9ucy96aF9DTi9kZXZpY2V0cmVlL2luZGV4LnJzdCAgIHwgIDIgKy0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvZHluYW1p
Yy1yZXNvbHV0aW9uLW5vdGVzLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9keW5hbWljLXJlc29sdXRpb24tbm90ZXMucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9keW5hbWljLXJl
c29sdXRpb24tbm90ZXMucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMTE1MTkwMzQxMzA1DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9keW5hbWljLXJlc29sdXRpb24tbm90
ZXMucnN0DQo+IEBAIC0wLDAgKzEsMzEgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0K
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL0RldmljZXRyZWUvZHluYW1pYy1yZXNvbHV0aW9u
LW5vdGVzLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcg
U2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArPT09
PT09PT09PT09PT09PT09PT09PT09DQo+ICtEZXZpY2V0cmVl5Yqo5oCB6Kej5p6Q5Zmo6K+05piO
DQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiAr5pys5paH5o+P6L+w5LqG5YaF
5qC45YaFRGV2aWNlVHJlZeino+aekOWZqOeahOWunueOsO+8jOWug+S9jeS6jmRyaXZlcnMvb2Yv
cmVzb2x2ZXIuY+S4reOAgg0KPiArDQo+ICvop6PmnpDlmajlpoLkvZXlt6XkvZzvvJ8NCj4gKy0t
LS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr6Kej5p6Q5Zmo6KKr6LWL5LqI5LiA5Liq5Lu75oSP55qE
5qCR5L2c5Li66L6T5YWl77yM6K+l5qCR55So6YCC5b2T55qEZHRj6YCJ6aG557yW6K+R77yM5bm2
5pyJ5LiA5LiqL3BsdWdpbi/moIfnrb7jgILov5nlsLHkuqcNCj4gK+eUn+S6humAguW9k+eahF9f
Zml4dXBzX1/lkoxfX2xvY2FsX2ZpeHVwc19f6IqC54K544CCDQo+ICsNCj4gK+ino+aekOWZqOS+
neasoemAmui/h+S7peS4i+atpemqpOW3peS9nDoNCj4gKw0KPiArMS4g5LuO5a6e5pe25qCR5Lit
6I635Y+W5pyA5aSn55qE6K6+5aSH5qCRcGhhbmRsZeWAvCArIDEuDQo+ICsyLiDosIPmlbTmoJHn
moTmiYDmnInmnKzlnLAgcGhhbmRsZXPvvIzku6Xop6PlhrPov5nkuKrph4/jgIINCj4gKzMuIOS9
v+eUqCBfX2xvY2FsX19maXh1cHNfXyDoioLngrnkv6Hmga/ku6Xnm7jlkIznmoTph4/osIPmlbTm
iYDmnInmnKzlnLDlvJXnlKjjgIINCj4gKzQuIOWvueS6jl9fZml4dXBzX1/oioLngrnkuK3nmoTm
r4/kuKrlsZ7mgKfvvIzmib7liLDlroPlnKjlrp7ml7bmoJHkuK3lvJXnlKjnmoToioLngrnjgILo
v5nmmK/nlKjmnaXmoIforrDor6XoioLngrnnmoTmoIfnrb7jgIINCj4gKzUuIOajgOe0omZpeHVw
55qE55uu5qCH55qEcGhhbmRsZeOAgg0KPiArNi4g5a+55LqO5bGe5oCn5Lit55qE5q+P5LiqZml4
dXDvvIzmib7liLDoioLngrk65bGe5oCnOuWBj+enu+eahOS9jee9ru+8jOW5tueUqHBoYW5kbGXl
gLzmm7/mjaLlroPjgIINCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vZGV2aWNldHJlZS9pbmRleC5yc3QNCj4gaW5kZXggZTlhZmYyY2NjNTc5Li5iZTViOTc0
YzZlNjggMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rl
dmljZXRyZWUvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2RldmljZXRyZWUvaW5kZXgucnN0DQo+IEBAIC0zNSwxMCArMzUsMTAgQEAgRGV2aWNldHJl
ZSBPdmVybGF5cw0KPiAgICAgOm1heGRlcHRoOiAxDQo+DQo+ICAgICBjaGFuZ2VzZXRzDQo+ICsg
ICBkeW5hbWljLXJlc29sdXRpb24tbm90ZXMNCj4NCj4gIFRvZG9saXN0Og0KPg0KPiAtKiAgIGR5
bmFtaWMtcmVzb2x1dGlvbi1ub3Rlcw0KPiAgKiAgIG92ZXJsYXktbm90ZXMNCj4NCj4gIERldmlj
ZXRyZWUgQmluZGluZ3MNCj4gLS0NCj4gMi4zMS4xDQo+DQo=
