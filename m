Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE12C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17FA36103C
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbhHDC7o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhHDC7m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:59:42 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9CEC061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:59:30 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id i9so476742ilk.9
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mUVouOFbwgAfqoQp1Lcp0hfVKNUHBLSYeiGMYtLGap0=;
        b=G3I+29wslSU6USGazIdtDzbyZ9DBrxURzREdMQa7Y4/RuzsV02EeocOMvnUxU1y9B3
         y685er22B86014XfOddABC0ovqn2HZ4sdmBaTex/cVA3LQQFCnHi/xwVdf/3j7st5aaO
         n7UhVndWHbAO5FZ41/k/8gGEe5PB8MD0hmC1BladJobzHIDiu5r5865jQL7VPlUKQ75n
         MgI8myG9LCMl84JxMZ3rcNKmmOjxLC7/5Hr/Tyt6eLLhYxPCKKUzDYLjQa3wuI0Vc2Ud
         W4fbtNjA5qTOxkASvA4uIRlCmK1QZsXVIa1IMbRFH6fVSPigfBke9/1ZopwPnAXwLRst
         vI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mUVouOFbwgAfqoQp1Lcp0hfVKNUHBLSYeiGMYtLGap0=;
        b=uBTqrqiWk9eUGvTrf7G0lhpYA3RWn/LYGvRFqLzJV5mNpbT5KmAaNKJGPYQwobQOUu
         6wMI9zw82xijvkoZl43MpBk9Xdt9govrKkrpbTjzWbHCy7lALiN7PNW0+NNw8RThLKRZ
         4Z2+AG4bZfmM0LCzI70VtHZ6Jo4xTFDiA60H81axIOx0LSBsqbqxRIcwnAPOsDfvi+td
         h3nVsoJTZJ2Fi5OE/2Z4PUeTBGhEZ3Fm7zb0kdCplSxnstErCz7S/zFiMQFy9LsDKsx6
         caW3uKpzDiTxsrG3SKqZbEw5KcWS/+3NgaOkbwdYOvXyHd+R6vXFMaZzpxGkWJn4dNNR
         pKAg==
X-Gm-Message-State: AOAM533GTVUUvkFi57XtkDZGufFkOr931+QZKvn0W1mUepqFEAqeFaKW
        unns9DaWsy/tQq/XkuC7Lo7T6cP082WazM5gOAo=
X-Google-Smtp-Source: ABdhPJz3cposVkSOmcgnXLiQnGVF37gq3yb+6I1rn24w3b+UiXeairQse9yTJVTwdnpilxQOwouyiALuQSTZuD8fDSs=
X-Received: by 2002:a05:6e02:602:: with SMTP id t2mr671665ils.118.1628045969645;
 Tue, 03 Aug 2021 19:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <33dc70b6669547ead21410740d0fd9b8c85d7abb.1627823347.git.siyanteng@loongson.cn>
In-Reply-To: <33dc70b6669547ead21410740d0fd9b8c85d7abb.1627823347.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:58:53 +0800
Message-ID: <CAJy-Am=aWUq_15fW00d4X0LWoS2RSNW828C9Ki92HGT=zk6yXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] docs/zh_CN: add virt guest-halt-polling translation
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
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3ZpcnQvZ3Vlc3Qt
aGFsdC1wb2xsaW5nLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRl
bmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4c0BrZXJuZWwub3JnPg0KPiAtLS0NCj4gIC4uLi96aF9DTi92aXJ0L2d1ZXN0LWhhbHQtcG9s
bGluZy5yc3QgICAgICAgICB8IDg3ICsrKysrKysrKysrKysrKysrKysNCj4gIC4uLi90cmFuc2xh
dGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QgICAgICAgICB8ICAyICstDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2d1ZXN0LWhhbHQtcG9s
bGluZy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZpcnQvZ3Vlc3QtaGFsdC1wb2xsaW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3ZpcnQvZ3Vlc3QtaGFsdC1wb2xsaW5nLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmYxMjcxMmM1MDZjMw0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvZ3Vlc3QtaGFs
dC1wb2xsaW5nLnJzdA0KPiBAQCAtMCwwICsxLDg3IEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlz
Y2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZpcnQv
Z3Vlc3QtaGFsdC1wb2xsaW5nLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu2
6IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToN
Cj4gKw0KPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4gKw0KPiAr
Li4gX2NuX3ZpcnRfZ3Vlc3QtaGFsdC1wb2xsaW5nOg0KPiArDQo+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICvlrqLmiLfmnLrlgZzmraLova7or6LmnLrliLbv
vIhHdWVzdCBoYWx0IHBvbGxpbmfvvIkNCg0KSSBzdGlsbCBmZWVsIHRoZSBoYWx0IGlzIGJldHRl
ciB0byBiZSB0cmFubGF0ZWQgYXMg5YGc5py677yMIGlzIHRoaXMgcmlnaHQ/DQoNCj4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiArY3B1aWRsZV9oYWx0
cG9sbOmpseWKqO+8jOS4jmhhbHRwb2xs566h55CG5Zmo5LiA6LW377yM5YWB6K645a6i5oi35py6
dmNwdXPlnKjlgZzmraLliY3ova7or6INCj4gK+S4gOWumueahOaXtumXtOOAgg0KPiArDQo+ICvo
v5nkuLrniannkIbmnLrkvqfnmoTova7or6Lmj5Dkvpvkuobku6XkuIvlpb3lpIQ6DQo+ICsNCj4g
KyAgICAgICAxKSDlnKjmiafooYzova7or6Lml7bvvIxQT0xM5qCH5b+X6KKr6K6+572u77yM6L+Z
5YWB6K646L+c56iLdkNQVeWcqOaJp+ihjOWUpOmGkuaXtumBv+WFjeWPkemAgQ0KPiArICAgICAg
ICAgIElQSe+8iOS7peWPiuWkhOeQhklQSeeahOebuOWFs+aIkOacrO+8ieOAgg0KPiArDQo+ICsg
ICAgICAgMikg5Y+v5Lul6YG/5YWN6Jma5ouf5py66YCA5Ye655qE5oiQ5pys44CCDQo+ICsNCj4g
K+WuouaIt+acuuS+p+i9ruivoueahOe8uueCueaYr++8jOWNs+S9v+WcqOeJqeeQhuacuuS4reea
hOWFtuS7luWPr+i/kOihjOS7u+WKoeS4reS5n+S8mui/m+ihjOi9ruivouOAgg0KPiArDQo+ICvl
hbbln7rmnKzpgLvovpHlpoLkuIvjgILkuIDkuKrlhajlsYDlgLzvvIzljbNndWVzdF9oYWx0X3Bv
bGxfbnPvvIzmmK/nlLHnlKjmiLfphY3nva7nmoTvvIzooajnpLrlhYENCj4gK+iuuOi9ruivouea
hOacgOWkp+aXtumXtOmHj+OAgui/meS4quWAvOaYr+WbuuWumueahOOAgg0KPiArDQo+ICvmr4/k
uKp2Y3B16YO95pyJ5LiA5Liq5Y+v6LCD5pW055qEZ3Vlc3RfaGFsdF9wb2xsX25z77yIInBlci1j
cHUgZ3Vlc3RfaGFsdF9wb2xsX25zIu+8ie+8jA0KPiAr5a6D55Sx566X5rOV5ZON5bqU5LqL5Lu2
6L+b6KGM6LCD5pW077yI6Kej6YeK5aaC5LiL77yJ44CCDQo+ICsNCj4gK+aooeWdl+WPguaVsA0K
PiArPT09PT09PT0NCj4gKw0KPiAraGFsdHBvbGznrqHnkIblmajmnIk15Liq5Y+v6LCD5pW055qE
5qih5Z2X5Y+C5pWwOg0KPiArDQo+ICsxKSBndWVzdF9oYWx0X3BvbGxfbnM6DQo+ICsNCj4gK+i9
ruivouWBnOatouWJjeaJp+ihjOeahOacgOWkp+aXtumXtO+8jOS7pee6s+enkuS4uuWNleS9jeOA
gg0KPiArDQo+ICvpu5jorqTlgLw6IDIwMDAwMA0KPiArDQo+ICsyKSBndWVzdF9oYWx0X3BvbGxf
c2hyaW5rOg0KPiArDQo+ICvlvZPllKTphpLkuovku7blj5HnlJ/lnKjlhajlsYDnmoRndWVzdF9o
YWx0X3BvbGxfbnPkuYvlkI7vvIznlKjkuo7nvKnlh4/mr4/kuKpDUFXnmoRndWVzdF9oYWx0X3Bv
bGxfbnMNCj4gK+eahOWIkuWIhuezu+aVsOOAgg0KPiArDQo+ICvpu5jorqTlgLw6IDINCj4gKw0K
PiArMykgZ3Vlc3RfaGFsdF9wb2xsX2dyb3c6DQo+ICsNCj4gK+W9k+S6i+S7tuWPkeeUn+WcqHBl
ci1jcHUgZ3Vlc3RfaGFsdF9wb2xsX25z5LmL5ZCO5L2G5ZyoZ2xvYmFsIGd1ZXN0X2hhbHRfcG9s
bF9uc+S5i+WJje+8jA0KPiAr55So5LqO5aKe6ZW/cGVyLWNwdSBndWVzdF9oYWx0X3BvbGxfbnPn
moTkuZjms5Xns7vmlbDjgIINCj4gKw0KPiAr6buY6K6k5YC8OiAyDQo+ICsNCj4gKzQpIGd1ZXN0
X2hhbHRfcG9sbF9ncm93X3N0YXJ0Og0KPiArDQo+ICvlnKjns7vnu5/nqbrpl7LnmoTmg4XlhrXk
uIvvvIzmr4/kuKpjcHUgZ3Vlc3RfaGFsdF9wb2xsX25z5pyA57uI6L6+5Yiw6Zu244CC6L+Z5Liq
5YC86K6+572u5LqG5aKe6ZW/5pe255qEDQo+ICvliJ3lp4vmr49jcHUgZ3Vlc3RfaGFsdF9wb2xs
X25z44CC6L+Z5Liq5YC85Y+v5Lul5LuOMTAwMDDlvIDlp4vlop7liqDvvIzku6Xpgb/lhY3lnKjm
nIDliJ3nmoTlop7plb/pmLYNCj4gK+auteWHuueOsOWkseivr+OAgjoNCj4gKw0KPiArMTBrLCAy
MGssIDQwaywgLi4uICjkvovlpoLvvIzlgYforr5ndWVzdF9oYWx0X3BvbGxfZ3Jvdz0yKS4NCj4g
Kw0KPiAr6buY6K6k5YC8OiA1MDAwMA0KPiArDQo+ICs1KSBndWVzdF9oYWx0X3BvbGxfYWxsb3df
c2hyaW5rOg0KPiArDQo+ICvlhYHorrjnvKnlh4/nmoRCb29s5Y+C5pWw44CC6K6+572u5Li6TuS7
pemBv+WFjeWug++8iOS4gOaXpui+vuWIsOWFqOWxgOeahGd1ZXN0X2hhbHRfcG9sbF9uc+WAvO+8
jOavj0NQVeeahA0KPiArZ3Vlc3RfaGFsdF9wb2xsX25z5bCG5L+d5oyB6auY5L2N77yJ44CCDQo+
ICsNCj4gK+m7mOiupOWAvDogWQ0KPiArDQo+ICvmqKHlnZflj4LmlbDlj6/ku6Xku45EZWJ1Z2Zz
5paH5Lu25Lit6K6+572u77yM5ZyoOjoNCj4gKw0KPiArICAgICAgIC9zeXMvbW9kdWxlL2hhbHRw
b2xsL3BhcmFtZXRlcnMvDQo+ICsNCj4gK+i/m+S4gOatpeivtOaYjg0KPiArPT09PT09PT09PQ0K
PiArDQo+ICstIOWcqOiuvue9rmd1ZXN0X2hhbHRfcG9sbF9uc+WPguaVsOaXtuW6lOivpeWwj+W/
g++8jOWboOS4uuS4gOS4quWkp+eahOWAvOacieWPr+iDveS9v+acuuWZqOS4iueahGNwdeS9v+eU
qOeOhw0KPiArICDovr7liLAxMDAl77yM5ZCm5YiZ5Yeg5LmO5piv5a6M5YWo56m66Zey55qE44CC
DQoNCmlzIHRoZSBmb2xsb3dpbmcgYmV0dGVyPw0K5Zug5Li65LiA5Liq5aSn55qE5YC85pyJ5Y+v
6IO95L2/5Yeg5LmO5piv5a6M5YWo56m66Zey5py65Zmo5LiK55qEY3B15L2/55So546H6L6+5Yiw
MTAwJQ0KDQpUaGFua3MNCkFsZXgNCg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiBpbmRleCBiOWIyM2JiODhmZmEuLmI5NGY2YTNjMjI1
NyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9p
bmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9p
bmRleC5yc3QNCj4gQEAgLTIxLDEyICsyMSwxMiBAQCBMaW51eOiZmuaLn+WMluaUr+aMgQ0KPiAg
ICAgOm1heGRlcHRoOiAyDQo+DQo+ICAgICBwYXJhdmlydF9vcHMNCj4gKyAgIGd1ZXN0LWhhbHQt
cG9sbGluZw0KPg0KPiAgVE9ET0xJU1Q6DQo+DQo+ICAgICBrdm0vaW5kZXgNCj4gICAgIHVtbC91
c2VyX21vZGVfbGludXhfaG93dG9fdjINCj4gLSAgIGd1ZXN0LWhhbHQtcG9sbGluZw0KPiAgICAg
bmVfb3ZlcnZpZXcNCj4gICAgIGFjcm4vaW5kZXgNCj4NCj4gLS0NCj4gMi4yNy4wDQo+DQo=
