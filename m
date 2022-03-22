Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C03CC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237541AbiCVHdH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237518AbiCVHdG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:33:06 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A664E1CFDC
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:31:38 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e18so2932671ilr.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o05rd/6L7Q2IEz3DJw2IiuOA8shLomd90NA8WI5AyxI=;
        b=mKzCQXO8kmKdzCoZfYwSNBUvrrNBP+C2aZ7Fu3jqEVwOn0cMdsHb9raGquHt7Exo9R
         Y8or+SlmTHwheRRJAIEdAkNrA7xzf2UMI3WNaIhc72kZ6BA1ftzMl/kTmUNY6NzzCROV
         kmdi6xVuvl5XFMcgTUDKJoxwGAiBxNN0Hj2sMwZYxxv+5JLTn55JEOKYBBwQvwLt0jgt
         AKHeXNqZo1p/RDuyaw+1pAb/jKUa2VbRO1UfJqUIDEne2HVvShwEB3ST1lZ4tmTSFGBh
         dFdeuoINBTDSxfZvX5hO3NWdIIU68X5qoXVRW+qvoR6CLLr+mY3zB+J4pUtHjBAwHxH7
         E5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o05rd/6L7Q2IEz3DJw2IiuOA8shLomd90NA8WI5AyxI=;
        b=ExJePWxiMH/PSR2PI36SvJoCiL9YBFG9iTypAJFpV0JQVZ0p0ZNIfm/hdSn42otJ6P
         SATNYsEBxpixdK/Yq8NYzUv3DubclEBJxPgodsIySlemCM0onXo1DfzL5I8GOsfPvUnL
         Dt6ECBG51kbFptXfYZ/8Vj/zW9J4wZzqIX3S4FRXO1sBSktuceEVpjiiBsCNkdZcrHQd
         FWW8BZ1OH1b+mIzqkbBqeoTDsFDf+AeXspbRFaRZOnoeFCHOVZSeYllOQEhRZYv1CRYB
         ayZdWrtE+66M5oQ9O7RGV0+aF0FR+epdALqcG1I1EWYgNkg35lV1/FWqT5zvrMx5eVKk
         0zcQ==
X-Gm-Message-State: AOAM530faLRuRXkcgmLfHYkCzniY+QYrXn+tZKnS84E8YPcQWFj/uS7G
        doGbt2hWGwZlf7t5TrJYFaIk6pjFMEo8qjcL6SE=
X-Google-Smtp-Source: ABdhPJx3r/2/k3D3xOZ976W4JHklhT+ouieEhY02sfdwbnLB8vdmzLYdI2Vj1CLrw8r7FxU6fkHDyHrV/rxNjEg14QE=
X-Received: by 2002:a05:6e02:b49:b0:2c7:9e7d:2caa with SMTP id
 f9-20020a056e020b4900b002c79e7d2caamr11546601ilu.178.1647934298044; Tue, 22
 Mar 2022 00:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <7673f5199b8f28cb847fbaa9c44bf120fb6aebd7.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <7673f5199b8f28cb847fbaa9c44bf120fb6aebd7.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:31:01 +0800
Message-ID: <CAJy-AmknG2qTbmru=5UnDbZidNkDDp35ZoCkvb_Om0ZdSPFYiQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] docs/zh_CN: add vm zsmalloc translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0venNtYWxsb2MucnN0IGludG8gQ2hpbmVzZS4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0K
DQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgMiArLQ0KPiAg
Li4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS96c21hbGxvYy5yc3QgICAgICAgIHwgNzggKysrKysr
KysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0venNtYWxsb2MucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gaW5kZXggZTI4ZDBlOTE5YmZlLi5jNzE0ODEyNWU2
NTkgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2lu
ZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRl
eC5yc3QNCj4gQEAgLTM4LDYgKzM4LDcgQEAgVE9ETzrlvoXlvJXnlKjmlofmoaPpm4booqvnv7vo
r5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTlpITvvIkNCj4gICAgIHJlbWFwX2ZpbGVfcGFn
ZXMNCj4gICAgIHNwbGl0X3BhZ2VfdGFibGVfbG9jaw0KPiAgICAgejNmb2xkDQo+ICsgICB6c21h
bGxvYw0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+IEBAIC01
MCw0ICs1MSwzIEBAIFRPRE9MSVNUOg0KPiAgKiB0cmFuc2h1Z2UNCj4gICogdW5ldmljdGFibGUt
bHJ1DQo+ICAqIHZtYWxsb2NlZC1rZXJuZWwtc3RhY2tzDQo+IC0qIHpzbWFsbG9jDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS96c21hbGxvYy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS96c21hbGxvYy5yc3QNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4yOWU5YzcwYThlYjYNCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
bS96c21hbGxvYy5yc3QNCj4gQEAgLTAsMCArMSw3OCBAQA0KPiArOk9yaWdpbmFsOiBEb2N1bWVu
dGF0aW9uL3ZtL3pzX21hbGxvYy5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArIOWPuOW7
tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsNCj4gKzrmoKHor5E6
DQo+ICsNCj4gKz09PT09PT09DQo+ICt6c21hbGxvYw0KPiArPT09PT09PT0NCj4gKw0KPiAr6L+Z
5Liq5YiG6YWN5Zmo5piv5Li65LiOenJhbeS4gOi1t+S9v+eUqOiAjOiuvuiuoeeahOOAguWboOat
pO+8jOivpeWIhumFjeWZqOW6lOivpeWcqOS9juWGheWtmOadoeS7tuS4i+W3peS9nOiJr+WlveOA
gueJueWIq+aYr++8jA0KPiAr5a6D5LuO5pyq5bCd6K+V6L+HaGlnaGVyIG9yZGVy6aG16Z2i55qE
5YiG6YWN77yM6L+Z5Zyo5YaF5a2Y5Y6L5Yqb5LiL5b6I5Y+v6IO95Lya5aSx6LSl44CC5Y+m5LiA
5pa56Z2i77yM5aaC5p6c5oiR5Lus5Y+qDQo+ICvmmK/kvb/nlKjljZXvvIgwLW9yZGVy77yJ6aG1
77yM5a6D5bCG6YGt5Y+X6Z2e5bi46auY55qE56KO54mH5YyWIC0g5Lu75L2V5aSn5bCP5Li6UEFH
RV9TSVpFLzLmiJbmm7TlpKfnmoTlr7nosaHlsIYNCj4gK+WNoOaNruaVtOS4qumhtemdouOAgui/
meaYr+WFtuWJjei6q++8iHh2bWFsbG9j77yJ55qE5Li76KaB6Zeu6aKY5LmL5LiA44CCDQo+ICsN
Cj4gK+S4uuS6huWFi+acjei/meS6m+mXrumimO+8jHpzbWFsbG9j5YiG6YWN5LqG5LiA5aCGMC1v
cmRlcumhtemdou+8jOW5tuS9v+eUqOWQhOenjSJzdHJ1Y3QgcGFnZSLlrZfmrrXlsIblroMNCj4g
K+S7rOmTvuaOpei1t+adpeOAgui/meS6m+mTvuaOpeeahOmhtemdouS9nOS4uuS4gOS4quWNleS4
gOeahGhpZ2hlciBvcmRlcumhtemdou+8jOWNs+S4gOS4quWvueixoeWPr+S7pei3qOi2ijAtb3Jk
ZXINCj4gK+mhtemdoueahOi+ueeVjOOAguS7o+eggeWwhui/meS6m+mTvuaOpeeahOmhtemdouS9
nOS4uuS4gOS4quWunuS9k++8jOensOS4unpzcGFnZeOAgg0KPiArDQo+ICvkuLrkuobnroDljZXo
tbfop4HvvIx6c21hbGxvY+WPquiDveWIhumFjeWkp+Wwj+S4jei2hei/h1BBR0VfU0laReeahOWv
ueixoe+8jOWboOS4uui/mea7oei2s+S6huaJgOacieW9k+WJjeeUqOaIt+eahA0KPiAr6KaB5rGC
77yI5Zyo5pyA5Z2P55qE5oOF5Ya15LiL77yM6aG16Z2i5piv5LiN5Y+v5Y6L57yp55qE77yM5Zug
5q2k5LulIuWOn+agtyLljbPmnKrljovnvKnnmoTlvaLlvI/lrZjlgqjvvInjgILlr7nkuo7lpKfk
uo7ov5kNCj4gK+S4quWkp+Wwj+eahOWIhumFjeivt+axgu+8jOS8mui/lOWbnuWksei0pe+8iOin
gXpzX21hbGxvY++8ieOAgg0KPiArDQo+ICvmraTlpJbvvIx6c19tYWxsb2MoKeW5tuS4jei/lOWb
nuS4gOS4quWPr+mHjeWkjeW8leeUqOeahOaMh+mSiOOAguebuOWPje+8jOWug+i/lOWbnuS4gOS4
quS4jemAj+aYjueahOWPpeafhO+8iOaXoOespuWPtw0KPiAr6ZW/77yJ77yM5a6D57yW56CB5LqG
6KKr5YiG6YWN5a+56LGh55qE5a6e6ZmF5L2N572u44CC6L+Z56eN6Ze05o6l5oCn55qE5Y6f5Zug
5pivenNtYWxsb2PlubbkuI3kv53mjIF6c3BhZ2Vz55qE5rC45LmFDQo+ICvmmKDlsITvvIzlm6Dk
uLrov5nlnKgzMuS9jeezu+e7n+S4iuS8muWvvOiHtOmXrumimO+8jOWboOS4uuWGheaguOepuumX
tOaYoOWwhOeahFZB5Yy65Z+f6Z2e5bi45bCP44CC5Zug5q2k77yM5Zyo5L2/55So5YiG6YWNDQo+
ICvnmoTlhoXlrZjkuYvliY3vvIzlr7nosaHlv4Xpobvkvb/nlKh6c19tYXBfb2JqZWN0KCnov5vo
oYzmmKDlsITku6XojrflvpfkuIDkuKrlj6/nlKjnmoTmjIfpkojvvIzpmo/lkI7kvb/nlKgNCj4g
K3pzX3VubWFwX29iamVjdCgp6Kej6Zmk5pig5bCE44CCDQo+ICsNCj4gK3N0YXQNCj4gKz09PT0N
Cj4gKw0KPiAr6YCa6L+HQ09ORklHX1pTTUFMTE9DX1NUQVTvvIzmiJHku6zlj6/ku6XpgJrov4cg
YGAvc3lzL2tlcm5lbC9kZWJ1Zy96c21hbGxvYy88dXNlciBuYW1lPmBgDQo+ICvnnIvliLB6c21h
bGxvY+WGhemDqOS/oeaBr+OAguS4i+mdouaYr+S4gOS4que7n+iuoei+k+WHuueahOS+i+WtkOOA
gjo6DQo+ICsNCj4gKyAjIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy96c21hbGxvYy96cmFtMC9jbGFz
c2VzDQo+ICsNCj4gKyBjbGFzcyAgc2l6ZSBhbG1vc3RfZnVsbCBhbG1vc3RfZW1wdHkgb2JqX2Fs
bG9jYXRlZCAgIG9ial91c2VkIHBhZ2VzX3VzZWQgcGFnZXNfcGVyX3pzcGFnZQ0KPiArICAgIC4u
Lg0KPiArICAgIC4uLg0KPiArICAgICA5ICAgMTc2ICAgICAgICAgICAwICAgICAgICAgICAgMSAg
ICAgICAgICAgMTg2ICAgICAgICAxMjkgICAgICAgICAgOCAgICAgICAgICAgICAgICA0DQo+ICsg
ICAgMTAgICAxOTIgICAgICAgICAgIDEgICAgICAgICAgICAwICAgICAgICAgIDI4ODAgICAgICAg
Mjg3MiAgICAgICAgMTM1ICAgICAgICAgICAgICAgIDMNCj4gKyAgICAxMSAgIDIwOCAgICAgICAg
ICAgMCAgICAgICAgICAgIDEgICAgICAgICAgIDgxOSAgICAgICAgNzk1ICAgICAgICAgNDIgICAg
ICAgICAgICAgICAgMg0KPiArICAgIDEyICAgMjI0ICAgICAgICAgICAwICAgICAgICAgICAgMSAg
ICAgICAgICAgMjE5ICAgICAgICAxNTkgICAgICAgICAxMiAgICAgICAgICAgICAgICA0DQo+ICsg
ICAgLi4uDQo+ICsgICAgLi4uDQo+ICsNCj4gKw0KPiArY2xhc3MNCj4gKyAgICAgICDntKLlvJUN
Cj4gK3NpemUNCj4gKyAgICAgICB6c3BhZ2XlrZjlgqjlr7nosaHlpKflsI8NCj4gK2FsbW9zdF9l
bXB0eQ0KPiArICAgICAgIFpTX0FMTU9TVF9FTVBUWSB6c3BhZ2XnmoTmlbDph4/vvIjop4HkuIvm
lofvvInjgIINCj4gK2FsbW9zdF9mdWxsDQo+ICsgICAgICAgWlNfQUxNT1NUX0ZVTEwgenNwYWdl
55qE5pWw6YePKOingeS4i+WbvikNCj4gK29ial9hbGxvY2F0ZWQNCj4gKyAgICAgICDlt7LliIbp
hY3lr7nosaHnmoTmlbDph48NCj4gK29ial91c2VkDQo+ICsgICAgICAg5YiG6YWN57uZ55So5oi3
55qE5a+56LGh55qE5pWw6YePDQo+ICtwYWdlc191c2VkDQo+ICsgICAgICAg5Li66K+l57G75YiG
6YWN55qE6aG15pWwDQo+ICtwYWdlc19wZXJfenNwYWdlDQo+ICsgICAgICAg57uE5oiQ5LiA5Liq
enNwYWdl55qEMC1vcmRlcumhtemdoueahOaVsOmHjw0KPiArDQo+ICvlvZNuIDw9IE4gLyBm5pe2
77yM5oiR5Lus5bCG5LiA5LiqenNwYWdl5YiG6YWN57uZWlNfQUxNT1NUX0VNUFRZZnVsbG5lc3Pn
u4TvvIzlhbbkuK0NCj4gKw0KPiArKiBuID0g5bey5YiG6YWN5a+56LGh55qE5pWw6YePDQo+ICsq
IE4gPSB6c3BhZ2Xlj6/ku6XlrZjlgqjnmoTlr7nosaHmgLvmlbANCj4gKyogZiA9IGZ1bGxuZXNz
X3RocmVzaG9sZF9mcmFjKOWNs++8jOebruWJjeaYrzTkuKopDQo+ICsNCj4gK+WQjOagt+WcsO+8
jOaIkeS7rOWwhnpzcGFnZeWIhumFjee7mToNCj4gKw0KPiArKiBaU19BTE1PU1RfRlVMTCAgd2hl
biBuID4gTiAvIGYNCj4gKyogWlNfRU1QVFkgICAgICAgIHdoZW4gbiA9PSAwDQo+ICsqIFpTX0ZV
TEwgICAgICAgICB3aGVuIG4gPT0gTg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
