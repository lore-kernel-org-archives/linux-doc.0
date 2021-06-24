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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E640C49EA5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 06:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 341636102A
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 06:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFXHCE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 03:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhFXHCD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 03:02:03 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E379C061574
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 23:59:44 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id w127so6235206oig.12
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 23:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u1e4wzMgHupBhsPiMDdBKB7rsQVXh23xWuyP5NRn2ZE=;
        b=REMx6M3BHkWn9nfPiUsoJ3YizMZvg1xiiN8zMkxmuU+cVsNN06VxOpLZ3eZR6Mbb4s
         Nq+NiIjHkvl7e+ue8gN9K9KdhaNOkVaOiysrAKGdhOV28TJAj2KV3PoDt7TsJta+zH7h
         lhK9RTDUg97qznR92LOzp6Ubecb+vo+Chk9cLd4RsF1qvSb4YCCUFEZAaMJmP8/NiIm2
         DlgjgSrju93rnhjoNMaL+bcwwX/J7UW0+UJTXf5nDcwp4SGrdSdyhYc69TIgmQNuvyI0
         iclu3O8BGnNBiw+xRUHoAjxPZ1Dut831XEkP2UTnmi9BdEHs6mwjEbIdEhwCcqPPO6sP
         9oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u1e4wzMgHupBhsPiMDdBKB7rsQVXh23xWuyP5NRn2ZE=;
        b=iPdxtM5JZy0Yi7aW9st1lLvBgVYISi7bQaDSkq5eIDaaqtxg6/Px4z0EcXxaA+Mm85
         SRT2xONTBOld9oJtvH1O1LAC2BCvSfvGTo19Hx22rtERKwVujbJVWNtnwwWx7WLENHUY
         u1CwMBRUonVHK4GcTt2FzW5AQuk7tXrvuCCCcmImEX42hWf7ZtmNcOo1ChruP/lJXaUU
         cSotn9sDKzm2PHCieHCDUUqhepEtB71o51Z4lxKzKWa8nyZ4HKi/v5eNSsrvFSOM/3+F
         UuIWn3/JTSPAwR6P6iS3hqDTA07tUAS+2w5epU7jOxJuju5rlpBREMfT81Wh5YeaVws1
         I0tA==
X-Gm-Message-State: AOAM530VvIt5J0fyRpjKyMP68YjfGbRIGYrPv0kIkuOFaEmnVfDnQ1xL
        gEKeMBIgvVFx3pnI01AplreRSqawjjcW1fiOj/Y=
X-Google-Smtp-Source: ABdhPJxx62ghWgphPgf4ui3CacNrtC+L3wwyJNNqMFQmPYXYPksxzYRErLtOQvuX4Ry0xd4EsdAPdltchu+zQ+l5DAY=
X-Received: by 2002:aca:d5c2:: with SMTP id m185mr868026oig.37.1624517983597;
 Wed, 23 Jun 2021 23:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624370078.git.siyanteng@loongson.cn> <0a7cf1ed40f04a80ac7a556572f3b2b8f965e1f2.1624370078.git.siyanteng@loongson.cn>
 <20210623064342.GA20445@bobwxc.top>
In-Reply-To: <20210623064342.GA20445@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 24 Jun 2021 14:59:34 +0800
Message-ID: <CAEensMyDBOxk+rObuSE63Fr4UnbdC5OVBsYbN0Xu4kRCQd8WCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] docs/zh_CN: add core api protection keys translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDIz5pel5ZGo5LiJIOS4i+WN
iDI6NDPlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMTA6MDA6MThQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9jb3Jl
LWFwaS9wcm90ZWN0aW9uLWtleXMucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAg
Li4uL3poX0NOL2NvcmUtYXBpL3Byb3RlY3Rpb24ta2V5cy5yc3QgICAgICAgIHwgOTkgKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQ0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvcHJvdGVjdGlvbi1rZXlzLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL3Byb3RlY3Rpb24ta2V5cy5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9wcm90ZWN0aW9uLWtleXMu
cnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVk
ZDJhMzIwMmEyYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9wcm90ZWN0aW9uLWtleXMucnN0DQo+ID4gQEAgLTAs
MCArMSw5OSBAQA0KPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+
ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4gKzpPcmln
aW5hbDogRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9wcm90ZWN0aW9uLWtleXMucnN0DQo+ID4gKw0K
PiA+ICs657+76K+ROg0KPiA+ICsNCj4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRl
bmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+ICs65qCh6K+ROg0KPiA+ICsNCj4gPiArIOWQtOaD
s+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+ID4gKw0KPiA+ICsuLiBfY25f
Y29yZS1hcGlfcHJvdGVjdGlvbi1rZXlzOg0KPiA+ICsNCj4gPiArPT09PT09PT09PT09DQo+ID4g
K+WGheWtmOS/neaKpOWvhumSpQ0KPiA+ICs9PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+eUqOaI
t+epuumXtOeahOWGheWtmOS/neaKpOWvhumSpe+8iE1lbW9yeSBQcm90ZWN0aW9uIEtleXMgZm9y
IFVzZXJzcGFjZe+8jFBLVe+8jOS6pg0KPiA+ICvljbNQS0VZc++8ieaYr+iLseeJueWwlFNreWxh
a2XvvIjlj4rku6XlkI7vvInigJzlj6/mianlsZXlpITnkIblmajigJ3mnI3liqHlmahDUFXkuIrn
moTkuIDpobnlip/og73jgIINCj4gPiAr5a6D5bCG5Zyo5pyq5p2l55qE6Z2e5pyN5Yqh5Zmo6Iux
54m55bCU5aSE55CG5Zmo5ZKM5pyq5p2l55qEQU1E5aSE55CG5Zmo5Lit5Y+v55So44CCDQo+ID4g
Kw0KPiA+ICvlr7nkuo7ku7vkvZXluIzmnJvmtYvor5XmiJbkvb/nlKjor6Xlip/og73nmoTkurrm
naXor7TvvIzlroPlnKjkuprpqazpgIrnmoRFQzIgQzXlrp7kvovkuK3mmK/lj6/nlKjnmoTvvIwN
Cj4gPiAr5bm25LiU5bey55+l5Y+v5Lul5Zyo6YKj6YeM5L2/55SoVWJ1bnR1IDE3LjA06ZWc5YOP
6L+Q6KGM44CCDQo+ID4gKw0KPiA+ICvlhoXlrZjkv53miqTlr4bpkqXmj5DkvpvkuobkuIDnp43m
nLrliLbmnaXmiafooYzln7rkuo7pobXpnaLnmoTkv53miqTvvIzkvYblnKjlupTnlKjnqIvluo/m
lLnlj5jkv53miqTln58NCj4gPiAr5pe25LiN6ZyA6KaB5L+u5pS56aG16KGo44CC5a6D55qE5bel
5L2c5Y6f55CG5piv5Zyo5q+P5Liq6aG16KGo6aG55Lit5Li64oCc5L+d5oqk5a+G6ZKl4oCd5YiG
6YWNNOS4quS7pQ0KPiA+ICvliY3ooqvlv73nlaXnmoTkvY3vvIzku47ogIzmj5DkvpsxNuS4quWP
r+iDveeahOWvhumSpeOAgg0KPiA+ICsNCj4gPiAr6L+Y5pyJ5LiA5Liq5paw55So5oi35Y+v6K6/
6Zeu55qE5a+E5a2Y5Zmo77yIUEtSVe+8ie+8jOS4uuavj+S4quWvhumSpeaPkOS+m+S4pOS4quWN
leeLrOeahOS9je+8iOiuvw0KPg0KPiBhIG5ldyB1c2VyLWFjY2Vzc2libGUgcmVnaXN0ZXIgKFBL
UlUpDQo+IOS4gOS4quaWsOeahOeUqOaIt+WPr+iuv+mXruWvhOWtmOWZqO+8iFBLUlXvvIkNCj4g
ICAgICAgIHwNCj4NCj4gWW91J3ZlIHJlbW92ZWQgYSB3cm9uZyBvbmUuDQpvayxmaXhlZC4NCg0K
VGhhbmtzLA0KDQpZYW50ZW5nDQo+DQo+IEFsbCBvdGhlcnMgYXJlIGdvb2QuDQo+DQo+IFJldmll
d2VkLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+DQo+IFRoYW5rcywNCj4g
ICAgICAgICBXdSBYLkMuDQo+DQo=
