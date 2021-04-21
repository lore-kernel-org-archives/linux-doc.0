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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D048C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 09:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC9D6143D
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 09:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbhDUJy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 05:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235490AbhDUJyz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Apr 2021 05:54:55 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4E2C06174A
        for <linux-doc@vger.kernel.org>; Wed, 21 Apr 2021 02:54:22 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 31so13776666pgn.13
        for <linux-doc@vger.kernel.org>; Wed, 21 Apr 2021 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KpYmkgiErYVzTic7sL/QJ60Xil0yccGDRs7XZqzIspY=;
        b=HxPrEfYulUfrYNTSHYskBhEh0Xij2FgslT1IFXkSkjFoowz1VWfAPEOnCz1ALgREaR
         FuSrrVPAxQb05w0YrIfG5VbnRY4AnU7xfQiy/XcxMa8L7Sky0PjX5D/407arpFNaXNQx
         sm6WDzhTEDfoW/bJO1c+YReaX2UO5ufJYzPxC3gKs+eDhjJuYioXmr8UzT7cbXaZsAom
         R8ckKFuzSAXuguahimw+A7erBmTSSl98jyWhfzZ30kU7XFUAiNea5ct4iEgYf788VBI2
         bbKhz/XbckY8sDlhJOdD1MW8nQb859GyzYwsQBFhOgc/hv9aPgIxdAljntipvgDw4VcI
         W9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KpYmkgiErYVzTic7sL/QJ60Xil0yccGDRs7XZqzIspY=;
        b=OBND0mZphiGtnhPEb00y9cjv6UHz3FrVSBb9wGHjmy1DCjWzQ+xexxosN8p9/CaTc4
         1QOKOo8KMiQnq52VqE8JTQ4oXIk5i6IY/SSv3O8Qth+K5J6agyyq+Cp4V6Tu6H4EPsGO
         sXcpMTV2FubgblWDRsoMgtNUIi8uIveLK3XtpaZafQ3UNxvwVv8NueCZ4yNKPVK7uSZe
         MRJk5RClEBtzTXCDHzB8fG+7PkkbrYiMcoOQ17D/XsJYAAoCiWrrsKXfmCyM2bcZpDgb
         V+g8AHw/RHfvhDiFQjIhwtqFNblJv2bKrK4Iy2cwE7rSBb/eHaHY+46rkfqkZ29ZlQzk
         +IBQ==
X-Gm-Message-State: AOAM530UGHfzAw9hRc+wwjQAvXrGYs7ZKEkN0usTPT70naoJm37IhJK/
        yYXL7YjP4pvRC1XA1na+eTn9mBHnJLBbnQnWphw=
X-Google-Smtp-Source: ABdhPJxd/ROFFBz8d9hOT1GrPIMYp2/Rx8Mmg9s+4Nnk1ELr8ZG1CUtwgxnHs+ayljoZhYdQly3rs2aCbUuPPRR+13A=
X-Received: by 2002:a17:90a:c589:: with SMTP id l9mr9831296pjt.24.1618998862312;
 Wed, 21 Apr 2021 02:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618836460.git.siyanteng@loongson.cn> <c79b09e5d9ea442bd301894a7bc512eebfddcedc.1618836460.git.siyanteng@loongson.cn>
 <20210420052823.GA14788@bobwxc.top> <CAMU9jJpO6ktBrCqAYMbn6x0qSkhrM=QN4w19CixoYvX=tVi1aw@mail.gmail.com>
 <20210421081150.GA22902@bobwxc.top>
In-Reply-To: <20210421081150.GA22902@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 21 Apr 2021 17:54:12 +0800
Message-ID: <CAMU9jJppxf0BXVrN6dpD8SD-NB9w+XW1C1WsLy9K6pGLjsLipA@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN: add core-api printk-formats.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDIx5pel5ZGo5LiJIOS4i+WN
iDQ6MTLlhpnpgZPvvJoNCj4NCj4gT24gV2VkLCBBcHIgMjEsIDIwMjEgYXQgMDM6MTU6NDBQTSAr
MDgwMCwgdGVuZyBzdGVybGluZyB3cm90ZToNCj4gPiBXdSBYLkMuIDxib2J3eGNAZW1haWwuY24+
IOS6jjIwMjHlubQ05pyIMjDml6Xlkajkuowg5LiL5Y2IMToyOOWGmemBk++8mg0KPiA+IE9uIE1v
biwgQXByIDE5LCAyMDIxIGF0IDA5OjEwOjU3UE0gKzA4MDAsIFlhbnRlbmcgU2kgd3JvdGU6DQo+
ID4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9wcmludGst
Zm9ybWF0cy5yc3QgaW50byBDaGluZXNlLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi96
aF9DTi9jb3JlLWFwaS9wcmludGstZm9ybWF0cy5yc3QgICAgICAgICB8IDU3NyArKysrKysrKysr
KysrKysrKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTc3IGluc2VydGlvbnMoKykNCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRz
LnJzdA0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uODU1MmJiYjNjNzk3DQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9wcmludGstZm9ybWF0cy5yc3QNCj4g
Wy4uLl0NCj4gPiA+ICsNCj4gPiA+ICvnlKjkuo7miZPljbBJUHY2572R57uc6aG65bqP55qEMTbk
vY3ljYHlha3ov5vliLblnLDlnYDjgIIgYGBJNmBgIOWSjCBgYGk2YGAg6K+05piO56ym55qE57uT
5p6c5pivDQo+ID4gPiAr5omT5Y2w55qE5Zyw5Z2A5pyJKEk2KeaIluayoeaciShpNinliIblj7fj
gILlp4vnu4jkvb/nlKjliY3lr7zpm7bjgIINCj4gPiA+ICsNCj4gPiA+ICvpop3lpJbnmoQgYGBj
YGAg6K+05piO56ym5Y+v5LiOIGBgSWBgIOivtOaYjuespuS4gOi1t+S9v+eUqO+8jOS7peaJk+WN
sOWOi+e8qeeahElQdjblnLDlnYDvvIzlpoLkuIsNCj4gPiA+ICvmiYDov7ANCj4gPiA+ICtodHRw
czovL3Rvb2xzLmlldGYub3JnL2h0bWwvcmZjNTk1Mg0KPiA+ID4gKw0KPiA+DQo+ID4g5aaCaHR0
cHM6Ly9zc3BhaS5jb20vcG9zdC80NTUxNuaJgOi/sA0KPiA+DQo+ID4gT0vvvIENCj4NCj4gT2gs
IGhlcmUgSSB3cm90ZSBhIHdyb25nIGxpbmsuDQo+IFNob3VsZCBiZQ0KPg0KPiAgICAgICAgIOWm
gmh0dHBzOi8vdG9vbHMuaWV0Zi5vcmcvaHRtbC9yZmM1OTUy5omA6L+wDQoNCkZvcnR1bmF0ZWx5
LCBJIGRpZG4ndCBjb3B5IGFuZCBwYXN0ZS4gICB+Pl88fg0KPg0KPiBTb3JyeSBmb3IgdGhlIGlu
Y29udmllbmNlIQ0KPg0KPiBXdQ0KPg0K
