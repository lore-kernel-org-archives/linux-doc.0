Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_QUOTING
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B677DC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 03:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5928161369
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 03:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243147AbhDGDDc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 23:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243129AbhDGDDb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 23:03:31 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E52C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 20:03:21 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id c16so17353763oib.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 20:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rOaFbpIYJOMgWtFLtA2GD+VrHII+SixsQfBVLUspuj8=;
        b=Tig0zDgapGYO1slEzasEcN00yarnU0B8WA1mJd7lvtK7cur7iJx0Do7MSHs9sdRx99
         Ae07QSdXMzWjvJGDm1X3lBSmJlqSWy4K0c4SiIBF0azC6ZHvP23nLKbpNi30bOw62ZjI
         DxT2k6wbTPaTSJOLYjkz2MTbSnqC8Ybui6g3LGkldoKw+3AVWjBfldb6dO7Qw+JPzZFw
         d9yqPOh35t0pW6TrmTqZHXutUVRvWKQvNZaN9Lpvi8ZFFzZn/hBlkaOzXAbzSutPRYXI
         FCwMzNBUQUbUHMPx99FRmZzdPA04q2hmDR6GGrjOgLY+vVKuzLjpXwVw2bo1RQKoyK9+
         XoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rOaFbpIYJOMgWtFLtA2GD+VrHII+SixsQfBVLUspuj8=;
        b=XhuBtWvzNjQnosh1UvmwQeX727yMIXk7nXe8+1vORzR+ihSA09r4NzsgyXCsTh5RE/
         giJzRLLFzsgwll2yTqq9kYizYlYQ9n/pPy8MJYXRxGEvdEGDH7gMCD+6MubIJyes/mj3
         r/lqut9+EQGInz1QygSmIQVuBWh8n6jk/x516PzlK+Vr5KbucEM0mQiHXL+5b5qjz9oL
         U+9xNIxY2jkiGcLMmdrd+e5GUh8vfy8awBmbZGc6NwrmxC6scOyi+d12PmCQ1XJNutxj
         qhBYSycQ+GNXdNWwjaRaEcnObMG31mrgq0RYCwJ9UYXLM13cn9DOP8vZjn4LGBlBxv/E
         imYw==
X-Gm-Message-State: AOAM532eaUOQ376wL+cB5a84mdE9ie/tHwf9y37NxjyZLQNim7dSuS3N
        mGUE/etHgoQUxoQ2xcwRyLGd6yQnkPnjS7RuzCs=
X-Google-Smtp-Source: ABdhPJxAQt+pFuiwUBho7zEMmdC468VFTwno/LQ8xLUqDCEGN/YK0VfONdT4zT0doQIG5Evx7fXhy7C466TwXHG8RN4=
X-Received: by 2002:aca:2219:: with SMTP id b25mr710887oic.112.1617764601238;
 Tue, 06 Apr 2021 20:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-5-siyanteng@loongson.cn> <20210406161250.GD15259@bobwxc.top>
In-Reply-To: <20210406161250.GD15259@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 11:03:11 +0800
Message-ID: <CAEensMxwJ02n9QL+4pN7K4heNm4Wa0RfkEixnJ-tzrZ6RiZ=pg@mail.gmail.com>
Subject: Re: [PATCH 04/11] docs/zh_CN: add core-api irq irqflags-tracing.rst translation
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

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiK5Y2I
MTI6MTPlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDNQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1l
bnRhdGlvbi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QgaW50byBDaGluZXNlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+IC0tLQ0KPiA+ICAuLi4vemhfQ04vY29yZS1hcGkvaXJxL2lycWZsYWdzLXRyYWNpbmcu
cnN0ICAgfCA0NiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NiBp
bnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9p
cnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMmEzZjU3N2FjNmI1DQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBp
L2lycS9pcnFmbGFncy10cmFjaW5nLnJzdA0KPiA+IEBAIC0wLDAgKzEsNDUgQEANCj4gPiArLi4g
aW5jbHVkZTo6IC4uLy4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2lu
YWw6IDpkb2M6YC4uLy4uLy4uLy4uL2NvcmUtYXBpL2lycS9pcnFmbGFncy10cmFjaW5nYA0KPiA+
ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsN
Cj4gPiArLi4gX2NuX2lycWZsYWdzLXRyYWNpbmcucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09
PT09PT09PT09PT09PT09PT09PT09DQo+ID4gK0lSUS1mbGFnc+eKtuaAgei/vei4qg0KPiA+ICs9
PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArOkF1dGhvcjog5pyA5Yid55SxSW5n
byBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+5byA5aeL5pKw5YaZDQo+ID4gKw0KPiA+ICsiaXJx
LWZsYWdzIHRyYWNpbmciIOWKn+iDveWPr+S7pSAi6L+96LiqIiBoYXJkaXJx5ZKMc29mdGlyceea
hOeKtuaAge+8jOWug+iuqeaEn+WFtOi2o+eahOWtkA0KPg0KPiAiaXJxLWZsYWdzIHRyYWNpbmci
77yI5Lit5pat5qCH5b+X6L+96Liq77yJIO+8nw0KT0shDQo+DQo+ID4gK+ezu+e7n+acieacuuS8
muS6huino+WIsOWIsOWGheaguOS4reWPkeeUn+eahOavj+S4gOS4qg0KPiA+ICtoYXJkaXJxcy1v
ZmYvaGFyZGlycXMtb27jgIFzb2Z0aXJxcy1vZmYvc29mdGlycXMtb27kuovku7bjgIINCj4gPiAr
DQo+ID4gK0NPTkZJR19UUkFDRV9JUlFGTEFHU19TVVBQT1JU5piv6YCa55So6ZSB6LCD6K+V5Luj
56CB5o+Q5L6b55qEQ09ORklHX1BST1ZFX1NQSU5fTE9DS0lORw0KPiA+ICvlkoxDT05GSUdfUFJP
VkVfUldfTE9DS0lOR+aJgOmcgOimgeeahOOAguWQpuWImeWwhuWPquaciUNPTkZJR19QUk9WRV9N
VVRFWF9MT0NLSU5H5ZKMDQo+ID4gK0NPTkZJR19QUk9WRV9SV1NFTV9MT0NLSU5H5Zyo5LiA5Liq
5p625p6E5LiK6KKr5o+Q5L6bLS3ov5nkupvpg73mmK/kuI3lnKhJUlHkuIrkuIvmlofkuK3kvb/n
lKjnmoQNCj4gPiAr6ZSBQVBJ44CCKHJ3c2Vtc+eahOS4gOS4quW8guW4uOaYr+WPr+S7peino+WG
s+eahCkNCj4gPiArDQo+ID4gK+aetuaehOWvuei/meS4gOeCueeahOaUr+aMgeW9k+eEtuS4jeWx
nuS6jiAi55CQ56KOICLnmoTojIPnlbTvvIzlm6DkuLrlvojlpJrkvY7nuqfnmoTmsYfnvJbku6Pn
oIHpg73opoHlpITnkIZpcnEtZmxhZ3MNCj4NCj4gcXVvdGF0aW9uIG1hcmtzDQo+IOKAnOeQkOei
juKAnQ0K5b6u5LiN6Laz6YGTDQpPS++8nw0KPg0KPiA+ICvnmoTnirbmgIHlj5jljJbjgILkvYbm
mK/kuIDkuKrmnrbmnoTlj6/ku6Xku6XkuIDnp43nm7jlvZPnm7TmjqXkuJTml6Dpo47pmannmoTm
lrnlvI/lkK/nlKhpcnEtZmxhZ3MtdHJhY2luZ+OAgg0KPiA+ICsNCj4gPiAr5p625p6E5aaC5p6c
5oOz5pSv5oyB6L+Z5Liq77yM6ZyA6KaB5YWI5YGa5LiA5Lqb5Luj56CB57uE57uH5LiK55qE5pS5
5Y+YOg0KPiA+ICsNCj4gPiArLSDlnKjku5bku6znmoRhcmNo57qnS2NvbmZpZ+aWh+S7tuS4rea3
u+WKoOW5tuWQr+eUqFRSQUNFX0lSUUZMQUdTX1NVUFBPUlTjgIINCj4gPiArDQo+ID4gK+eEtuWQ
jui/mOmcgOimgeWBmuS4gOS6m+WKn+iDveS4iueahOaUueWPmOadpeWunueOsOWvuWlycS1mbGFn
cy10cmFjaW5n55qE5pSv5oyBOg0KPiA+ICsNCj4gPiArLSDlnKjkvY7nuqflhaXlj6Pku6PnoIHk
uK3lop7liqAo5p6E5bu65p2h5Lu2KeWvuXRyYWNlX2hhcmRpcnFzX29mZigpL3RyYWNlX2hhcmRp
cnFzX29uKCkNCj4NCj4gYnJhY2tldHMNCj4g77yI5p6E5bu65p2h5Lu277yJDQpPcmlnaW46IGlu
IGxvd2xldmVsIGVudHJ5IGNvZGUgYWRkIChidWlsZC1jb25kaXRpb25hbCkgY2FsbHMgdG8gdGhl
DQo+DQo+ID4gKyAg5Ye95pWw55qE6LCD55So44CC6ZSB6aqM6K+B5Zmo5Lya5a+G5YiH5YWz5rOo
ICLnnJ/lrp4gIueahGlycS1mbGFnc+aYr+WQpuS4jiAi6Jma5oufICLnmoRpcnEtZmxhZ3MNCj4N
Cj4g4oCc55yf5a6e4oCdICDigJzomZrmi5/igJ0NCkkgdHJpZWQgdG8gZGVsdmUgaW50byBpdCwg
YnV0IEkgZm91bmQgaXQgd2Fzbid0IGVhc3ksIGFuZCBJIG5lZWRlZCBzb21lIHRpbWUuDQphbHNv
ICDigJ1pcnEtZmxhZ3MtdHJhY2luZ+KAnA0KPg0KPiA+ICsgIOeKtuaAgeebuOWMuemFje+8jOWm
guaenOS4pOiAheS4jeWMuemFje+8jOWImeS8muWkp+WjsOaKseaAqO+8iOW5tuWFs+mXreiHquW3
se+8ieOAgumAmuW4uOWvueS6jmFyY2jmlK/mjIENCj4NCj4g5aSn5aOw5oqx5oCoIC0+IOWPkeWH
uuitpuWRiiDvvJ8NCj4gc28gYXMgZm9sbG93ZWQg5oqx5oCoDQpPSyENCj4NCj4gPiArICBpcnEt
ZmxhZ3MtdHJhY2vnmoTlpKfpg6jliIbml7bpl7Tpg73mmK/lnKjov5nnp43nirbmgIHkuIvluqbo
v4fnmoTvvJrnnIvnnItsb2NrZGVw55qE5oqx5oCo77yM6K+V552ADQo+DQo+IE1heWJlIHRoaXMg
aXMgYmV0dGVyDQo+IOmAmuW4uOe7tOaKpGFyY2jkuK1pcnEtZmxhZ3MtdHJhY2vnmoTlpKfpg6jl
iIbml7bpl7QuLi4NCk9LIQ0KPg0KPiA+ICsgIOaJvuWHuuaIkeS7rOi/mOayoeaciea2ieWPiuea
hOaxh+e8luS7o+eggeOAguS/ruWkjeW5tumHjeWkjeOAguS4gOaXpuezu+e7n+WQr+WKqO+8jOW5
tuS4lOWcqGlycS1mbGFnc+i3n+i4quWKnw0KPg0KPiAuLi7ov5jmsqHmnInmkJ7lrprnmoTmsYfn
vJbku6PnoIHvvIzkv67lpI3lubbph43lpI3jgIINCk9LIQ0KPg0KPiBpcnEtZmxhZ3MtdHJhY2lu
ZyAgY2hlY2sgdGhpcyB0ZXJtJ3MgdHJhbnNsYXRpb24NCj4NCj4gPiArICDog73kuK3msqHmnInl
h7rnjrBsb2NrZGVw5oqx5oCo55qE5oOF5Ya15LiL77yMYXJjaOaUr+aMgeWwseWujOaIkOS6huOA
gg0KPiA+ICsNCj4gPiArLSDlpoLmnpzor6XmnrbmnoTmnInkuI3lj6/lsY/olL3nmoTkuK3mlq3v
vIzpgqPkuYjpnIDopoHpgJrov4dsb2NrZGVwX29mZigpL2xvY2tkZXBfb24oKeWwhui/meS6m+S4
rQ0KPiA+ICsgIOaWreS7jmlycei3n+i4qlvlkozplIHpqozor4Fd5py65Yi25Lit5o6S6Zmk44CC
DQo+ID4gKw0KPg0KPiB3cm9uZyBpbmRlbnQgZm9yIG5leHQgcGFyYWdyYXBoDQpPSyENCj4NCj4g
PiArICDkuIDoiKzmnaXor7TvvIzlnKjkuIDkuKrmnrbmnoTkuK3vvIzkuI3lrozmlbTnmoRpcnEt
ZmxhZ3MtdHJhY2luZ+WunueOsOaYr+ayoeaciemjjumZqeeahO+8mmxvY2tkZXANCj4gPiArICDk
vJrmo4DmtYvliLDov5nkuIDngrnvvIzlubblsIboh6rlt7HlhbPpl63jgILljbPplIHpqozor4Hl
majku43nhLblj6/pnaDjgILlupTor6XkuI3kvJrlm6DkuLppcnEtdHJhY2luZ+eahOmUmQ0KPiA+
ICsgIOivr+iAjOW0qea6g+OAgijpmaTpnZ7pgJrov4fkv67mlLnkuI3or6Xkv67mlLnnmoTmnaHk
u7bmnaXmm7TmlLnmsYfnvJbmiJblr4TlrZjlmajogIznoLTlnY/lhbbku5bku6PnoIEpDQo+ID4g
LS0NCj4gPiAyLjI3LjANCj4NCg==
