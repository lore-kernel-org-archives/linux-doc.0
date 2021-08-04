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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DDAC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4CDB608FC
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhHDGn6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 02:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbhHDGn5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 02:43:57 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70C9C0613D5
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 23:43:45 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id x15so1743292oic.9
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qxeMWp1S8CmgvwF9UASFGw+Jly9tVwcqvme9axxkHtg=;
        b=NGLKhUPfnJF2VriY5loBqiMgZmtKvyEbgIO4MdHDENqT/7EwkHM/QhW+RWZOu0UjvR
         H20jQ8O9RyY7oHy0w7OpR5wzPVzLtsJ7uxJIuSUzow1bgZ6VPEG9NtmOjrKfMamrdKs1
         Ii8GZ9eOasOpWtCA9ZOgvvHQiVN2qlaE384A2tB229diNP2wBEVW/sSzFa4mETv/xf1R
         8xELnXQU4Kq3TKEifPP4jO9/SzeRhF7iZHYvsPilWwXUT2/bJonAu1MueZkjU7oWx9ru
         PPPqnCqX1TKJARp0/eJ1BBrdZGVpyIGCLT1lZWjPOjg/Iu1oV+n1y/DfQP+F8JaTbIyI
         NkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qxeMWp1S8CmgvwF9UASFGw+Jly9tVwcqvme9axxkHtg=;
        b=onhGcUeWM4k7KbPPHiP1cMXEQf48EcUO4ST9jnkoc+FjoJOIdNlnXBXDyLj/eobSoZ
         Jt8LVeV22R5YIpM5i4Myi/YF7z1r0Pj23PwnL87cAvc7FGoO+4I5V2jWVvrbyDtDGPBL
         BciJqVmDkKziDKfq9bQ4oKOYdQHqV8aD7k47zWjfKS+YkbemhgwKjXWKad9a2nY26ESP
         +OV6r9Fo5aLP6+Jeqf1g4fyDDr0M7yvBufoEMX0gIpy5iW2nqATkG29myan+6Nl7LeoS
         maLp7vnA2wsv/XHvSUwDSdtWf80wrT6S2EqqUPMdQnIRQGH8HSQsjqxNeoRxzzzrMgnu
         PzFg==
X-Gm-Message-State: AOAM531TNWDWkQvdFQAXQgKhvgKzmca5/ujIkZa72DNcU9Il1tP2eZyo
        TtrfM1l66QMpqj8e9NxB6stQR1QuhG22uMh6W2A=
X-Google-Smtp-Source: ABdhPJy+cP7eG8VWrDZ7KYDHEKOzqnIKrpXfS1SaYF9+8PTSeg/wEBSz+ZrNqfbD5jQOqxbrSrUKs3FPkY/fT01KN3o=
X-Received: by 2002:a54:488f:: with SMTP id r15mr112146oic.130.1628059425263;
 Tue, 03 Aug 2021 23:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <33dc70b6669547ead21410740d0fd9b8c85d7abb.1627823347.git.siyanteng@loongson.cn>
 <CAJy-Am=aWUq_15fW00d4X0LWoS2RSNW828C9Ki92HGT=zk6yXg@mail.gmail.com>
In-Reply-To: <CAJy-Am=aWUq_15fW00d4X0LWoS2RSNW828C9Ki92HGT=zk6yXg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 4 Aug 2021 14:43:35 +0800
Message-ID: <CAEensMy87p1CjYjoU6W9+iQZ5dFVJfa9kx6YzrZtzx2-1=O23A@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] docs/zh_CN: add virt guest-halt-polling translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDTml6XlkajkuIkg5LiK
5Y2IMTA6NTnlhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBBdWcgMSwgMjAyMSBhdCA5OjMyIFBNIFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+ID4NCj4gPiBUcmFuc2xh
dGUgRG9jdW1lbnRhdGlvbi92aXJ0L2d1ZXN0LWhhbHQtcG9sbGluZy5yc3QgaW50byBDaGluZXNl
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29u
LmNuPg0KPiA+IFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4gPiAt
LS0NCj4gPiAgLi4uL3poX0NOL3ZpcnQvZ3Vlc3QtaGFsdC1wb2xsaW5nLnJzdCAgICAgICAgIHwg
ODcgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQv
aW5kZXgucnN0ICAgICAgICAgfCAgMiArLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvZ3Vlc3QtaGFsdC1wb2xsaW5nLnJzdA0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQv
Z3Vlc3QtaGFsdC1wb2xsaW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3ZpcnQvZ3Vlc3QtaGFsdC1wb2xsaW5nLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mMTI3MTJjNTA2YzMNCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9ndWVzdC1oYWx0
LXBvbGxpbmcucnN0DQo+ID4gQEAgLTAsMCArMSw4NyBAQA0KPiA+ICsuLiBpbmNsdWRlOjogLi4v
ZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlv
bi92aXJ0L2d1ZXN0LWhhbHQtcG9sbGluZy5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4g
Kw0KPiA+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4g
PiArDQo+ID4gKzrmoKHor5E6DQo+ID4gKw0KPiA+ICsg5pe25aWO5LquIEFsZXggU2hpIDxhbGV4
c0BrZXJuZWwub3JnPg0KPiA+ICsNCj4gPiArLi4gX2NuX3ZpcnRfZ3Vlc3QtaGFsdC1wb2xsaW5n
Og0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiA+ICvlrqLmiLfmnLrlgZzmraLova7or6LmnLrliLbvvIhHdWVzdCBoYWx0IHBvbGxpbmfvvIkN
Cj4NCj4gSSBzdGlsbCBmZWVsIHRoZSBoYWx0IGlzIGJldHRlciB0byBiZSB0cmFubGF0ZWQgYXMg
5YGc5py677yMIGlzIHRoaXMgcmlnaHQ/DQp5ZWFoIQ0KPg0KPiA+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICtjcHVpZGxlX2hhbHRwb2xs6amx
5Yqo77yM5LiOaGFsdHBvbGznrqHnkIblmajkuIDotbfvvIzlhYHorrjlrqLmiLfmnLp2Y3B1c+Wc
qOWBnOatouWJjei9ruivog0KPiA+ICvkuIDlrprnmoTml7bpl7TjgIINCj4gPiArDQo+ID4gK+i/
meS4uueJqeeQhuacuuS+p+eahOi9ruivouaPkOS+m+S6huS7peS4i+WlveWkhDoNCj4gPiArDQo+
ID4gKyAgICAgICAxKSDlnKjmiafooYzova7or6Lml7bvvIxQT0xM5qCH5b+X6KKr6K6+572u77yM
6L+Z5YWB6K646L+c56iLdkNQVeWcqOaJp+ihjOWUpOmGkuaXtumBv+WFjeWPkemAgQ0KPiA+ICsg
ICAgICAgICAgSVBJ77yI5Lul5Y+K5aSE55CGSVBJ55qE55u45YWz5oiQ5pys77yJ44CCDQo+ID4g
Kw0KPiA+ICsgICAgICAgMikg5Y+v5Lul6YG/5YWN6Jma5ouf5py66YCA5Ye655qE5oiQ5pys44CC
DQo+ID4gKw0KPiA+ICvlrqLmiLfmnLrkvqfova7or6LnmoTnvLrngrnmmK/vvIzljbPkvb/lnKjn
iannkIbmnLrkuK3nmoTlhbbku5blj6/ov5DooYzku7vliqHkuK3kuZ/kvJrov5vooYzova7or6Lj
gIINCj4gPiArDQo+ID4gK+WFtuWfuuacrOmAu+i+keWmguS4i+OAguS4gOS4quWFqOWxgOWAvO+8
jOWNs2d1ZXN0X2hhbHRfcG9sbF9uc++8jOaYr+eUseeUqOaIt+mFjee9rueahO+8jOihqOekuuWF
gQ0KPiA+ICvorrjova7or6LnmoTmnIDlpKfml7bpl7Tph4/jgILov5nkuKrlgLzmmK/lm7rlrprn
moTjgIINCj4gPiArDQo+ID4gK+avj+S4qnZjcHXpg73mnInkuIDkuKrlj6/osIPmlbTnmoRndWVz
dF9oYWx0X3BvbGxfbnPvvIgicGVyLWNwdSBndWVzdF9oYWx0X3BvbGxfbnMi77yJ77yMDQo+ID4g
K+Wug+eUseeul+azleWTjeW6lOS6i+S7tui/m+ihjOiwg+aVtO+8iOino+mHiuWmguS4i++8ieOA
gg0KPiA+ICsNCj4gPiAr5qih5Z2X5Y+C5pWwDQo+ID4gKz09PT09PT09DQo+ID4gKw0KPiA+ICto
YWx0cG9sbOeuoeeQhuWZqOaciTXkuKrlj6/osIPmlbTnmoTmqKHlnZflj4LmlbA6DQo+ID4gKw0K
PiA+ICsxKSBndWVzdF9oYWx0X3BvbGxfbnM6DQo+ID4gKw0KPiA+ICvova7or6LlgZzmraLliY3m
iafooYznmoTmnIDlpKfml7bpl7TvvIzku6XnurPnp5LkuLrljZXkvY3jgIINCj4gPiArDQo+ID4g
K+m7mOiupOWAvDogMjAwMDAwDQo+ID4gKw0KPiA+ICsyKSBndWVzdF9oYWx0X3BvbGxfc2hyaW5r
Og0KPiA+ICsNCj4gPiAr5b2T5ZSk6YaS5LqL5Lu25Y+R55Sf5Zyo5YWo5bGA55qEZ3Vlc3RfaGFs
dF9wb2xsX25z5LmL5ZCO77yM55So5LqO57yp5YeP5q+P5LiqQ1BV55qEZ3Vlc3RfaGFsdF9wb2xs
X25zDQo+ID4gK+eahOWIkuWIhuezu+aVsOOAgg0KPiA+ICsNCj4gPiAr6buY6K6k5YC8OiAyDQo+
ID4gKw0KPiA+ICszKSBndWVzdF9oYWx0X3BvbGxfZ3JvdzoNCj4gPiArDQo+ID4gK+W9k+S6i+S7
tuWPkeeUn+WcqHBlci1jcHUgZ3Vlc3RfaGFsdF9wb2xsX25z5LmL5ZCO5L2G5ZyoZ2xvYmFsIGd1
ZXN0X2hhbHRfcG9sbF9uc+S5i+WJje+8jA0KPiA+ICvnlKjkuo7lop7plb9wZXItY3B1IGd1ZXN0
X2hhbHRfcG9sbF9uc+eahOS5mOazleezu+aVsOOAgg0KPiA+ICsNCj4gPiAr6buY6K6k5YC8OiAy
DQo+ID4gKw0KPiA+ICs0KSBndWVzdF9oYWx0X3BvbGxfZ3Jvd19zdGFydDoNCj4gPiArDQo+ID4g
K+WcqOezu+e7n+epuumXsueahOaDheWGteS4i++8jOavj+S4qmNwdSBndWVzdF9oYWx0X3BvbGxf
bnPmnIDnu4jovr7liLDpm7bjgILov5nkuKrlgLzorr7nva7kuoblop7plb/ml7bnmoQNCj4gPiAr
5Yid5aeL5q+PY3B1IGd1ZXN0X2hhbHRfcG9sbF9uc+OAgui/meS4quWAvOWPr+S7peS7jjEwMDAw
5byA5aeL5aKe5Yqg77yM5Lul6YG/5YWN5Zyo5pyA5Yid55qE5aKe6ZW/6Zi2DQo+ID4gK+auteWH
uueOsOWkseivr+OAgjoNCj4gPiArDQo+ID4gKzEwaywgMjBrLCA0MGssIC4uLiAo5L6L5aaC77yM
5YGH6K6+Z3Vlc3RfaGFsdF9wb2xsX2dyb3c9MikuDQo+ID4gKw0KPiA+ICvpu5jorqTlgLw6IDUw
MDAwDQo+ID4gKw0KPiA+ICs1KSBndWVzdF9oYWx0X3BvbGxfYWxsb3dfc2hyaW5rOg0KPiA+ICsN
Cj4gPiAr5YWB6K6457yp5YeP55qEQm9vbOWPguaVsOOAguiuvue9ruS4uk7ku6Xpgb/lhY3lroPv
vIjkuIDml6bovr7liLDlhajlsYDnmoRndWVzdF9oYWx0X3BvbGxfbnPlgLzvvIzmr49DUFXnmoQN
Cj4gPiArZ3Vlc3RfaGFsdF9wb2xsX25z5bCG5L+d5oyB6auY5L2N77yJ44CCDQo+ID4gKw0KPiA+
ICvpu5jorqTlgLw6IFkNCj4gPiArDQo+ID4gK+aooeWdl+WPguaVsOWPr+S7peS7jkRlYnVnZnPm
lofku7bkuK3orr7nva7vvIzlnKg6Og0KPiA+ICsNCj4gPiArICAgICAgIC9zeXMvbW9kdWxlL2hh
bHRwb2xsL3BhcmFtZXRlcnMvDQo+ID4gKw0KPiA+ICvov5vkuIDmraXor7TmmI4NCj4gPiArPT09
PT09PT09PQ0KPiA+ICsNCj4gPiArLSDlnKjorr7nva5ndWVzdF9oYWx0X3BvbGxfbnPlj4LmlbDm
l7blupTor6XlsI/lv4PvvIzlm6DkuLrkuIDkuKrlpKfnmoTlgLzmnInlj6/og73kvb/mnLrlmajk
uIrnmoRjcHXkvb/nlKjnjocNCj4gPiArICDovr7liLAxMDAl77yM5ZCm5YiZ5Yeg5LmO5piv5a6M
5YWo56m66Zey55qE44CCDQo+DQo+IGlzIHRoZSBmb2xsb3dpbmcgYmV0dGVyPw0KPiDlm6DkuLrk
uIDkuKrlpKfnmoTlgLzmnInlj6/og73kvb/lh6DkuY7mmK/lrozlhajnqbrpl7LmnLrlmajkuIrn
moRjcHXkvb/nlKjnjofovr7liLAxMDAlDQpncmVhdCENCg0KVGhhbmtzLA0KDQpZYW50ZW5nDQo=
