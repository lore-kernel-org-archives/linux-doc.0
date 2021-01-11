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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ECDC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 11:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C451F224B0
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 11:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbhAKLLw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 06:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbhAKLLv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 06:11:51 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A46C061794
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 03:11:11 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id w18so17391546iot.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 03:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yF0MoMnDzb4bP5MsasHLpwk+ioKqCu8dEn3dg78r9qw=;
        b=m29tIoEZF7RBN/qAKR/2aHaxU/BiSLHlDfxT1Gt1h2br+TBMHKG8TIaPHmlP7UPhXI
         3M+Jwq/DVj+s2Ubkrkf8HWJZADvjeI96eQX02z5hwqYXG534AM9CPwpq72rZKuHh/7Cf
         CZwhi3zQrTZisLm+ASd1WVzbJZVCvBczL/kp4A3mq9ULqADZgA/NbNPf7A4cQnZbWKZ7
         O/RWxUK8JPWpAOsQdLFmfd2HOxrBoq9eAvXJeq6JjrvqBlxbZqJpjPZOQ8lXYcRBLPkd
         pAE7pPVdaYEc/It2clxwHOhDHD21vuhkmeL0uDvcfhwWnEjZvZnRcClAIU3/bCdff2ft
         vEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yF0MoMnDzb4bP5MsasHLpwk+ioKqCu8dEn3dg78r9qw=;
        b=tyR5yhIhCN54szlK7nup3Z+2SObsXhdW/4xV/v6TPRfbgioOmzDUoUJyPME49Da6On
         fVrmsKBHkRD6A2FMMCC5qbrFRvAhvlw178pKTy/N9fB6mtr18heHZPXyvrKjACe12IH/
         x4dM3tEBQBx9xOAu3wJf+jlfzuNx9OJ55L5iX1g78a69V9zr5DQPirzlYwZVpmgbkDK8
         Du0yNSfWVlhF56qQ1oNW76xor9VxnpSGIE/BXktMkLtzvtpSAyaw9120eqys2EQm4+EA
         H2HkOIvPIYKkUSy9iDOP3bFA14Wo74BfFZK2yfB6O9ay7Q3U2TtCi/C9N9uUAoP4jEJd
         UxZA==
X-Gm-Message-State: AOAM532bJ4fY0ybKq44bhsTD6apR2L9MN3jxM1g1YLP9JBnfFKBEZix8
        Wusn2ZLeittRHhhuO7tgoz/MkHyCWLGpxHJzTrp0AzdwxZI=
X-Google-Smtp-Source: ABdhPJz7QXMAVtChJhVgGGUA8Ncl9/mCfbkBKGF3HsOxnXwdOsp4/mZ+e2uHQ+kmRccmILj+ho8U/1Z3MnE4h7YMZDI=
X-Received: by 2002:a02:6c50:: with SMTP id w77mr13689559jab.68.1610363470811;
 Mon, 11 Jan 2021 03:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20210109030005.1655195-1-siyanteng@loongson.cn>
 <20210109030005.1655195-4-siyanteng@loongson.cn> <7d6f0cbc-938e-5af3-60c0-617f5b88fab9@linux.alibaba.com>
In-Reply-To: <7d6f0cbc-938e-5af3-60c0-617f5b88fab9@linux.alibaba.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 11 Jan 2021 19:10:57 +0800
Message-ID: <CAEensMxR3a_9zg6t6CqpAD4gmbvv6RAne=zRCnDzaNsLKye1Cg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGhhdCdzIGdyZWF0LFRoYW5rIHlvdSENCg0KQWxleCBTaGkgPGFsZXguc2hpQGxpbnV4LmFsaWJh
YmEuY29tPiDkuo4yMDIx5bm0MeaciDEx5pel5ZGo5LiAIOS4iuWNiDExOjA15YaZ6YGT77yaDQo+
DQo+DQo+DQo+IOWcqCAyMDIxLzEvOSDkuIrljYgxMTowMCwgWWFudGVuZyBTaSDlhpnpgZM6DQo+
ID4gVGhpcyBwYXRjaCB0cmFuc2xhdGVzIERvY3VtZW50YXRpb24vbWlwcy9pbmdlbmljLXRjdS5y
c3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5
YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NO
L21pcHMvaW5nZW5pYy10Y3UucnN0ICAgfCA2OSArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9taXBzL2luZ2VuaWMtdGN1LnJzdA0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21pcHMv
aW5nZW5pYy10Y3UucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWlwcy9p
bmdlbmljLXRjdS5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMDZiZDI2MjdhMjNkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21pcHMvaW5nZW5pYy10Y3UucnN0DQo+ID4gQEAg
LTAsMCArMSw2OSBAQA0KPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiA+ICsNCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0K
PiA+ICs6T3JpZ2luYWw6IDpyZWY6YERvY3VtZW50YXRpb24vbWlwcy9pbmdlbmljLXRjdS5yc3Qg
PGluZ2VuaWMtdGN1PmANCj4gPiArOlRyYW5zbGF0b3I6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4NCj4gPiArDQo+ID4gKy4uIF9jbl9pbmdlbmljLXRjdToNCj4gPiArDQo+ID4g
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gK+WQ
m+atoyBKWjQ3eHggU29j5a6a5pe25ZmoL+iuoeaVsOWZqOehrOS7tuWNleWFgw0KPiA+ICs9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr
5ZCb5q2jIEpaNDd4eCBTb2PkuK3nmoTlrprml7blmagv6K6h5pWw5Zmo5Y2V5YWDKFRDVSnmmK/k
uIDkuKrlpJrlip/og73noazku7blnZfjgILlroPmnInlpJrovr4NCj4gPiArOOS4qumAmumBk++8
jOWPr+S7peeUqOS9nOiuoeaVsOWZqO+8jOiuoeaXtuWZqO+8jOaIllBXTeOAgg0KPg0KPiBwdWxz
ZS13aWR0aCBtb2R1bGF0aW9uPyAg6ISJ5Yay5a695bqm6LCD5Yi25Zmo77yfDQo+DQo+ID4gKw0K
PiA+ICstIEpaNDcyNUIsIEpaNDc1MCwgSlo0NzU1IOWPquacie+8luS4qlRDVemAmumBk+OAguWF
tuWug1NvY+mDveacie+8mOS4qumAmumBk+OAgg0KPiA+ICsNCj4gPiArLSBKWjQ3MjVC5byV5YWl
5LqG5LiA5Liq54us56uL55qE6YCa6YGT77yM56ew5Li65pON5L2c57O757uf6K6h5pe25ZmoKE9T
VCnjgILov5nmmK/kuIDkuKozMuS9jeWPrw0KPiA+ICsgIOe8lueoi+WumuaXtuWZqOOAguWcqEpa
NDc2MELlj4rku6XkuIrlnovlj7fkuIrvvIzlroPmmK82NOS9jeeahOOAgg0KPiA+ICsNCj4gPiAr
LSDmr4/kuKpUQ1XpgJrpgZPpg73mnInoh6rlt7HnmoTml7bpkp/mupDvvIzlj6/ku6XpgJrov4cg
VENTUiDlr4TlrZjlmajorr7nva7pgJrpgZPnmoTniLbnuqfml7bpkp8NCj4gPiArICDmupDvvIhw
Y2xr44CBZXh044CBcnRj77yJ44CB5byA5YWz5Lul5Y+K5YiG6aKR44CCDQo+ID4gKw0KPiA+ICsg
ICAgLSDnnIvpl6jni5flkoxPU1Tnoazku7bmqKHlnZflnKjlroPku6znmoTlr4TlrZjlmajnqbrp
l7TkuK3kuZ/mnInnm7jlkIzlvaLlvI/nmoRUQ1NS5a+E5a2Y5Zmo44CCDQo+ID4gKyAgICAtIOeU
qOS6juWFs+mXrS/lvIDlkK/nmoQgVENVIOWvhOWtmOWZqOS5n+WPr+S7peWFs+mXrS/lvIDlkK/n
nIvpl6jni5flkowgT1NUIOaXtumSn+OAgg0KPiA+ICsNCj4gPiArLSDmr4/kuKpUQ1XpgJrpgZPl
nKjkuKTnp43mqKHlvI/nmoTlhbbkuK3kuIDnp43mqKHlvI/kuIvov5DooYzvvJoNCj4gPiArDQo+
ID4gKyAgICAtIOaooeW8jyBUQ1Ux77ya6YCa6YGT5peg5rOV5Zyo552h55yg5qih5byP5LiL6L+Q
6KGM77yM5L2G5pu05piT5LqO5pON5L2c44CCDQo+ID4gKyAgICAtIOaooeW8jyBUQ1Uy77ya6YCa
6YGT5Y+v5Lul5Zyo552h55yg5qih5byP5LiL6L+Q6KGM77yM5L2G5pON5L2c5q+UIFRDVTEg6YCa
6YGT5aSN5p2C5LiA5Lqb44CCDQo+ID4gKw0KPiA+ICstIOavj+S4qiBUQ1Ug6YCa6YGT55qE5qih
5byP5Y+W5Yaz5LqO5L2/55So55qEU29j77yaDQo+ID4gKw0KPiA+ICsgICAgLSDlnKjmnIDogIHn
moRTb2PvvIjpq5jkuo5KWjQ3NDDvvInvvIzlhavkuKrpgJrpgZPpg73ov5DooYzlnKhUQ1Ux5qih
5byP44CCDQo+ID4gKyAgICAtIOWcqCBKWjQ3MjVC77yM6YCa6YGTNei/kOihjOWcqFRDVTIs5YW2
5a6D6YCa6YGT5YiZ6L+Q6KGM5ZyoVENVMeOAgg0KPiA+ICsgICAgLSDlnKjmnIDmlrDnmoRTb2Pv
vIhKWjQ3NTDlj4rkuYvlkI7vvInvvIzpgJrpgZMxLTLov5DooYzlnKhUQ1Uy77yM5YW25a6D6YCa
6YGT5YiZ6L+Q6KGMDQo+ID4gKyAgICAgIOWcqFRDVTHjgIINCj4gPiArDQo+ID4gKy0g5q+P5Liq
6YCa6YGT6YO95Y+v5Lul55Sf5oiQ5Lit5pat44CC5pyJ5Lqb6YCa6YGT5YWx5Lqr5LiA5p2h5Lit
5pat57q/77yM6ICM5pyJ5Lqb5rKh5pyJ77yM5YW25ZyoU29j5Z6LDQo+DQo+IHMvU29jL1NvQy8N
Cj4NCj4gPiArICDlj7fkuYvpl7TnmoTlj5jmm7TvvJoNCj4gPiArDQo+ID4gKyAgICAtIOWcqOW+
iOiAgeeahFNvY++8iEpaNDc0MOWPiuabtOS9ju+8ie+8jOmAmumBkzDlkozpgJrpgZMx5pyJ5a6D
5Lus6Ieq5bex55qE5Lit5pat57q/77yb6YCaDQo+ID4gKyAgICAgIOmBkzItN+WFseS6q+acgOWQ
juS4gOadoeS4reaWree6v+OAgg0KPiA+ICsgICAgLSDlnKggSlo0NzI1Qu+8jOmAmumBkzDmnInl
roPoh6rlt7HnmoTkuK3mlq3nur/vvJvpgJrpgZMxLTXlhbHkuqvkuIDmnaHkuK3mlq3nur/vvJtP
U1QNCj4gPiArICAgICAg5L2/55So5pyA5ZCO5LiA5p2h5Lit5pat57q/44CCDQo+ID4gKyAgICAt
IOWcqOavlOi+g+aWsOeahFNvY++8iEpaNDc1MOWPiuS7peWQju+8ie+8jOmAmumBkzXmnInlroPo
h6rlt7HnmoTkuK3mlq3nur/vvJvpgJoNCj4gPiArICAgICAg6YGTMC005ZKM77yI5aaC5p6c5piv
OOmAmumBk++8iTYtN+WFqOmDqOWFseS6q+S4gOadoeS4reaWree6v++8m09TVOS9v+eUqOacgOWQ
juS4gOadoeS4rQ0KPiA+ICsgICAgICDmlq3nur/jgIINCj4gPiArDQo+ID4gK+WunueOsA0KPiA+
ICs9PT09DQo+ID4gKw0KPiA+ICtUQ1Xnoazku7bnmoTlip/og73liIbluIPlnKjlpJrkuKrpqbHl
iqjnqIvluo/vvJoNCj4gPiArDQo+ID4gKz09PT09PT09PT09ICA9PT09PQ0KPiA+ICvml7bpkp8g
ICAgICAgICBkcml2ZXJzL2Nsay9pbmdlbmljL3RjdS5jDQo+ID4gK+S4reaWrSAgICAgICAgIGRy
aXZlcnMvaXJxY2hpcC9pcnEtaW5nZW5pYy10Y3UuYw0KPiA+ICvlrprml7blmaggICAgICAgZHJp
dmVycy9jbG9ja3NvdXJjZS9pbmdlbmljLXRpbWVyLmMNCj4gPiArT1NUICAgICAgICAgIGRyaXZl
cnMvY2xvY2tzb3VyY2UvaW5nZW5pYy1vc3QuYw0KPiA+ICtQV00gICAgICAgICAgZHJpdmVycy9w
d20vcHdtLWp6NDc0MC5jDQo+ID4gK+eci+mXqOeLlyAgICAgICBkcml2ZXJzL3dhdGNoZG9nL2p6
NDc0MF93ZHQuYw0KPiA+ICs9PT09PT09PT09PSAgPT09PT0NCj4gPiArDQo+ID4gK+WboOS4uuWP
r+S7peS7juebuOWQjOeahOWvhOWtmOWZqOaOp+WItuWxnuS6juS4jeWQjOmpseWKqOeoi+W6j+WS
jOahhuaetueahFRDVeeahOWQhOenjeWKn+iDve+8jOaJgOS7pQ0KPiA+ICvmiYDmnInov5nkupvp
qbHliqjnqIvluo/pg73pgJrov4fnm7jlkIznmoTmjqfliLbmgLvnur/pgJrnlKjmjqXlj6Porr/p
l67lroPku6znmoTlr4TlrZjlmajjgIINCj4gPiArDQo+ID4gK+acieWFs1RDVempseWKqOeoi+W6
j+eahOiuvuWkh+agkee7keWumueahOabtOWkmuS/oeaBr++8jOivt+WPgumYhToNCj4gPiArRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2luZ2VuaWMsdGN1LnlhbWwuDQo+
ID4NCg==
