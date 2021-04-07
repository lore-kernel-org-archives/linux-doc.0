Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBAEC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 01:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D386124C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 01:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238506AbhDGBVG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 21:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhDGBVF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 21:21:05 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F936C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 18:20:57 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso16533594otq.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 18:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EXfDUAnVP+/5gQ121w+m2dfJQTpM49dtIYlSkmuIogA=;
        b=EMNgc8lA3qWWGk1hX+UpWfPaSG2YxfsFXYWJ1F5X7xUKqQ9ZM12X3Fb2wDFM4ZoUJE
         fTV23kPgJYCPXtx3Etpq7OV3H6GxUlTXqcDYtJsrjLwM5hUBCIrnPM+33q+BnYnzm0OO
         3H3OhimhZE03q+BKmfw3GuV6lNZS0H8pqMWrW0uhFBgLoRMqWf30yLKopScxrLmtqGjg
         8U4V1ZyYvXYQF3efHlEY7w9e8arscqytDPfN/3oEBk1t5XjXFYQsK3MDqEmR/O062pmW
         mbwK+doTwtzHf3htKMqoz+whvTb7yjQlUSsYcQmA1+jslijUJ95YECDb4BEq/fLLEnI1
         Y3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EXfDUAnVP+/5gQ121w+m2dfJQTpM49dtIYlSkmuIogA=;
        b=IVh+RHfh/Pn4RxzTk/ISeNPk4LiCREA11xMmYcEXleOpptH8RhgYpWNGFBL9yBMRta
         /uZcaZ32ZjrBSSFMY95aOICekKN2QSaLKpXh8sK+MopYrB0RSi5gecVoznymNkPePu04
         mZE2HMkZVibYsTvIYruk49r2tv+3fJNjmCJ4Wmbk38skDg3zKtJuPEEbQicdVNpy0uYS
         1RE5ZTLvq+FvPvAHvavsi4KhrCTJSwdFPwWefhAT8WJZQxx6IJrCoRJymFRqa0Or1XJM
         oLWUmnYrK4dlVReb2DGScErkPgRHz6PHcgdv0GUWT4hE33ivPcHAAucywcsC1hTH8pN+
         ToSQ==
X-Gm-Message-State: AOAM5305vzJesqnymAYpQ1SPecWWntaYY7JERgbGPj55ltxOXsksdA4r
        nJMMG+0m8m8JD7K1CVRfiO5eIkplM1KFfye7Rg6Sg4Cm37g=
X-Google-Smtp-Source: ABdhPJwh6z07sOo37vJw3hhlX5ggRwy2RuatKmruw5RaCzmbf9e9PLCmp8AocWa4Cd2hOVe1EWJoXlKZybhQot6jI/g=
X-Received: by 2002:a9d:750c:: with SMTP id r12mr746449otk.322.1617758456384;
 Tue, 06 Apr 2021 18:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-2-siyanteng@loongson.cn> <20210406151220.GA15259@bobwxc.top>
In-Reply-To: <20210406151220.GA15259@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 09:20:46 +0800
Message-ID: <CAEensMx3=uwCQT5jQdHPHV1y75VJujdDkK3zGcc1ek4aLYChwQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] docs/zh_CN: add core-api irq concepts.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDbml6Xlkajkuowg5LiL5Y2I
MTE6MTLlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDBQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1l
bnRhdGlvbi9jb3JlLWFwaS9pcnEvY29uY2VwdHMucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAt
LS0NCj4gPiAgLi4uL3poX0NOL2NvcmUtYXBpL2lycS9jb25jZXB0cy5yc3QgICAgICAgICAgIHwg
MjQgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vY29yZS1hcGkvaXJxL2NvbmNlcHRzLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2lycS9jb25jZXB0cy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvY29uY2VwdHMu
cnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI4
Yjk4YTE5NmE1ZA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvY29uY2VwdHMucnN0DQo+ID4gQEAgLTAsMCAr
MSwyNCBAQA0KPiA+ICsuLiBpbmNsdWRlOjogLi4vLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4g
PiArDQo+ID4gKzpPcmlnaW5hbDogOmRvYzpgLi4vLi4vLi4vLi4vY29yZS1hcGkvaXJxL2NvbmNl
cHRzYA0KPiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+ICsNCj4gPiArLi4gX2NuX2NvbmNlcHRzLnJzdDoNCj4gPiArDQo+ID4gKw0KPiA+ICs9
PT09PT09PT09PT09PT0NCj4gPiAr5LuA5LmI5pivSVJR77yfDQo+ID4gKz09PT09PT09PT09PT09
PQ0KPiA+ICsNCj4gPiAr5LiA5Liq5p2l6Ieq6K6+5aSH55qE5Lit5pat6K+35rGC5bCx5piv5LiA
5LiqSVJR44CCDQo+DQo+IE1heWJlIHRoaXMgYmV0dGVyPw0KPg0KPiBJUlHvvIhJbnRlcnJ1cHQg
UmVRdWVzdO+8ieaMh+adpeiHquiuvuWkh+eahOS4reaWreivt+axgg0KT0shDQo+DQo+ID4gK+eb
ruWJje+8jOWug+S7rOWPr+S7pemAmui/h+S4gOS4quW8leiEmuaIlumAmui/h+S4gOS4quaVsOaN
ruWMhei/m+WFpeOAgg0KPiA+ICvlpJrkuKrorr7lpIflj6/ku6Xov57mjqXliLDlkIzkuIDkuKrl
vJXohJrvvIzku47ogIzlhbHkuqvkuIDkuKpJUlHjgIINCj4gPiArDQo+ID4gK0lSUee8luWPt+aY
r+eUqOadpeaPj+i/sOehrOS7tuS4reaWrea6kOeahOWGheaguOagh+ivhuespuOAgumAmuW4uOWu
g+aYr+S4gOS4quWIsOWFqOWxgGlycV9kZXNj5pWw57uE55qE57Si5byV77yMDQo+ID4gK+S9huaY
r+mZpOS6huWcqGxpbnV4L2ludGVycnVwdC5o5Lit5a6e546w55qE5LmL5aSW77yM5YW25a6D57uG
6IqC5piv5L2T57O757uT5p6E54m55b6B55u45YWz55qE44CCDQo+ID4gKw0KPiA+ICtJUlHnvJbl
j7fmmK/lr7nmnLrlmajkuIrlj6/og73nmoTkuK3mlq3mupDnmoTmnprkuL7jgILpgJrluLjmnprk
uL7nmoTmmK/ns7vnu5/kuK3miYDmnInkuK3mlq3mjqfliLblmajnmoTovpPlhaXlvJXohJoNCj4g
PiAr57yW5Y+344CC5ZyoSVNB77yI5bel5Lia5qCH5YeG5L2T57O757uT5p6E77yJ55qE5oOF5Ya1
5LiL5omA5p6a5Li+55qE5piv5Lik5LiqaTgyNTnkuK3mlq3mjqfliLblmajnmoQxNuS4qui+k+WF
peW8leiEmuOAgg0KPiA+ICsNCj4gPiAr5L2T57O757uT5p6E5Y+v5Lul57uZSVJR5Y+36LWL5LqI
6aKd5aSW55qE5ZCr5LmJ77yM5Zyo5raJ5Y+K5Yiw56Gs5Lu25omL5Yqo6YWN572u55qE5oOF5Ya1
5LiL77yM5oiR5Lus6byT5Yqx6L+Z5qC35YGa44CCDQo+ID4gK0lTQSBJUlHmmK/otYvkuojov5nn
p43pop3lpJblkKvkuYnnmoTkuIDkuKrlhbjlnovkvovlrZDjgIINCj4gPiAtLQ0KPiA+IDIuMjcu
MA0KPg0KDQpUaGFua3MhDQoNCllhbnRlbmcNCg==
