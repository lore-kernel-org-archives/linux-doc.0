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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBF0C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0626C60C41
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237629AbhG2N1P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237608AbhG2N1L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:27:11 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233CFC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:27:07 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id l126so7105994ioa.12
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=56uytofmQOOdubWVGjZyEMOUzqhChB9cktVT/3phhHY=;
        b=Ryd2p3ln91hu05nrVuNJ/hvkfj4XKVqg5F+jl6SHrujXU6uurMCtd7dXLTmCsjkMsf
         bLvGbxs6l0JG9riPxxiEDW8FC5eIFVSHt3EzfGVOc6Jbxth3KavmZlu1N9m72YkE14vG
         7l+FRrYIIn1L57+/8sjzZHkH+RT43bbWnHkbfiChg/OiVHqaInIXgoa4PjLpWrCT3YfZ
         WFWLqpNHXTf/LSo9Ww+qwTIi02D6e2zRk5UUEfcJTdI8flbBaaqSUWJvNAnhS1uru8EP
         xoDf2NsvaYMkMOCkX1a79oo2FhMEqGfCCZI1oMMntaj0jDoZfWDVDr4MfXWRrRnR/Tb+
         DyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=56uytofmQOOdubWVGjZyEMOUzqhChB9cktVT/3phhHY=;
        b=MlahYIHIWHkdT2zjnxsFaTqUyJVreKE6n+UhkieE8/u3F/YpRlk6JYX2fqIaqfYVtK
         T9qGclDbOZbHPoj6u/3eSe+cjuozud0+iXRwY5tBUxdxir01Hr2A9N4eys4nsoL9H0Ii
         RgDgH4VyxVW2zu3ORpNbStO/rrv+egGemoK0Ek++CEvTb/xue3ADd9C0R9d+1gM9GBtR
         esupz+3rw8ldnoCvESbidD9YXEGZJOmKiTtacunwNK0h4qdoLZMRYIbPUGVGETuJJ36D
         7Csq6lq14jkXu+k2w5XzzvWCY6/GVD47erOePNBgVZBf2TLixjkaEksA3QP16O8WxNXF
         bvxA==
X-Gm-Message-State: AOAM530L3OQO5tKzXS+LvfPgRCFwdOGooG1t59ifQVf1a5lBPTaqIgxP
        o6nth8OGA286vdcbaRI56uas4CgKaEXos+EuQkY=
X-Google-Smtp-Source: ABdhPJxn5e1ZdFqD+DLQn6S73+b2cIJGd0pQb+810pfNN9q0cgBMXVciJfH8pNzxiNicO17y2RjvvqN1AHqQju4jQVA=
X-Received: by 2002:a05:6638:1490:: with SMTP id j16mr4515112jak.27.1627565226609;
 Thu, 29 Jul 2021 06:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <1fea4748009626365c5756a305b6a8bd1ec6b37f.1627007853.git.siyanteng@loongson.cn>
In-Reply-To: <1fea4748009626365c5756a305b6a8bd1ec6b37f.1627007853.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:26:30 +0800
Message-ID: <CAJy-Amm9c+MQJFqauAj_4vvsBNttmRBYkqKo9T9QzyE-uvptLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] docs/zh_CN: add virt guest-halt-polling translation
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

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBGcmksIEp1bCAy
MywgMjAyMSBhdCAxMDo0NSBBTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+IHdy
b3RlOg0KPg0KPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi92aXJ0L2d1ZXN0LWhhbHQtcG9sbGlu
Zy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlh
bnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3poX0NOL3ZpcnQvZ3Vlc3QtaGFsdC1w
b2xsaW5nLnJzdCAgICAgICAgIHwgODcgKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5z
bGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdCAgICAgICAgIHwgIDIgKy0NCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvZ3Vlc3QtaGFsdC1w
b2xsaW5nLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vdmlydC9ndWVzdC1oYWx0LXBvbGxpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdmlydC9ndWVzdC1oYWx0LXBvbGxpbmcucnN0DQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmQzNWFlYjg4ZmZjDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9ndWVzdC1o
YWx0LXBvbGxpbmcucnN0DQo+IEBAIC0wLDAgKzEsODcgQEANCj4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdmly
dC9ndWVzdC1oYWx0LXBvbGxpbmcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jl
u7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+R
Og0KPiArDQo+ICsNCj4gKw0KPiArLi4gX2NuX3ZpcnRfZ3Vlc3QtaGFsdC1wb2xsaW5nOg0KPiAr
DQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICvlrqLmiLfm
nLrlgZzmraLova7or6LmnLrliLbvvIhHdWVzdCBoYWx0IHBvbGxpbmfvvIkNCj4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKw0KPiArY3B1aWRsZV9oYWx0cG9s
bOmpseWKqO+8jOS4jmhhbHRwb2xs566h55CG5Zmo5LiA6LW377yM5YWB6K645a6i5oi35py6dmNw
dXPlnKjlgZzmraLliY3ova7or6INCj4gK+S4gOWumueahOaXtumXtOOAgg0KPiArDQo+ICvov5nk
uLrniannkIbmnLrkvqfnmoTova7or6Lmj5Dkvpvkuobku6XkuIvlpb3lpIQ6DQo+ICsNCj4gKyAg
ICAgICAxKSDlnKjmiafooYzova7or6Lml7bvvIxQT0xM5qCH5b+X6KKr6K6+572u77yM6L+Z5YWB
6K646L+c56iLdkNQVeWcqOaJp+ihjOWUpOmGkuaXtumBv+WFjeWPkemAgQ0KPiArICAgICAgICAg
IElQSe+8iOS7peWPiuWkhOeQhklQSeeahOebuOWFs+aIkOacrO+8ieOAgg0KPiArDQo+ICsgICAg
ICAgMikg5Y+v5Lul6YG/5YWN6Jma5ouf5py66YCA5Ye655qE5oiQ5pys44CCDQo+ICsNCj4gK+Wu
ouaIt+acuuS+p+i9ruivoueahOe8uueCueaYr++8jOWNs+S9v+WcqOeJqeeQhuacuuS4reeahOWF
tuS7luWPr+i/kOihjOS7u+WKoeS4reS5n+S8mui/m+ihjOi9ruivouOAgg0KPiArDQo+ICvlhbbl
n7rmnKzpgLvovpHlpoLkuIvjgILkuIDkuKrlhajlsYDlgLzvvIzljbNndWVzdF9oYWx0X3BvbGxf
bnPvvIzmmK/nlLHnlKjmiLfphY3nva7nmoTvvIzooajnpLrlhYENCj4gK+iuuOi9ruivoueahOac
gOWkp+aXtumXtOmHj+OAgui/meS4quWAvOaYr+WbuuWumueahOOAgg0KPiArDQo+ICvmr4/kuKp2
Y3B16YO95pyJ5LiA5Liq5Y+v6LCD5pW055qEZ3Vlc3RfaGFsdF9wb2xsX25z77yIInBlci1jcHUg
Z3Vlc3RfaGFsdF9wb2xsX25zIu+8ie+8jA0KPiAr5a6D55Sx566X5rOV5ZON5bqU5LqL5Lu26L+b
6KGM6LCD5pW077yI6Kej6YeK5aaC5LiL77yJ44CCDQo+ICsNCj4gK+aooeWdl+WPguaVsA0KPiAr
PT09PT09PT0NCj4gKw0KPiAraGFsdHBvbGznrqHnkIblmajmnIk15Liq5Y+v6LCD5pW055qE5qih
5Z2X5Y+C5pWwOg0KPiArDQo+ICsxKSBndWVzdF9oYWx0X3BvbGxfbnM6DQo+ICsNCj4gK+i9ruiv
ouWBnOatouWJjeaJp+ihjOeahOacgOWkp+aXtumXtO+8jOS7pee6s+enkuS4uuWNleS9jeOAgg0K
PiArDQo+ICvpu5jorqTlgLw6IDIwMDAwMA0KPiArDQo+ICsyKSBndWVzdF9oYWx0X3BvbGxfc2hy
aW5rOg0KPiArDQo+ICvlvZPllKTphpLkuovku7blj5HnlJ/lnKjlhajlsYDnmoRndWVzdF9oYWx0
X3BvbGxfbnPkuYvlkI7vvIznlKjkuo7nvKnlh4/mr4/kuKpDUFXnmoRndWVzdF9oYWx0X3BvbGxf
bnMNCj4gK+eahOWIkuWIhuezu+aVsOOAgg0KPiArDQo+ICvpu5jorqTlgLw6IDINCj4gKw0KPiAr
MykgZ3Vlc3RfaGFsdF9wb2xsX2dyb3c6DQo+ICsNCj4gK+W9k+S6i+S7tuWPkeeUn+WcqHBlci1j
cHUgZ3Vlc3RfaGFsdF9wb2xsX25z5LmL5ZCO5L2G5ZyoZ2xvYmFsIGd1ZXN0X2hhbHRfcG9sbF9u
c+S5i+WJje+8jA0KPiAr55So5LqO5aKe6ZW/cGVyLWNwdSBndWVzdF9oYWx0X3BvbGxfbnPnmoTk
uZjms5Xns7vmlbDjgIINCj4gKw0KPiAr6buY6K6k5YC8OiAyDQo+ICsNCj4gKzQpIGd1ZXN0X2hh
bHRfcG9sbF9ncm93X3N0YXJ0Og0KPiArDQo+ICvlnKjns7vnu5/nqbrpl7LnmoTmg4XlhrXkuIvv
vIzmr4/kuKpjcHUgZ3Vlc3RfaGFsdF9wb2xsX25z5pyA57uI6L6+5Yiw6Zu244CC6L+Z5Liq5YC8
6K6+572u5LqG5aKe6ZW/5pe255qEDQo+ICvliJ3lp4vmr49jcHUgZ3Vlc3RfaGFsdF9wb2xsX25z
44CC6L+Z5Liq5YC85Y+v5Lul5LuOMTAwMDDlvIDlp4vlop7liqDvvIzku6Xpgb/lhY3lnKjmnIDl
iJ3nmoTlop7plb/pmLYNCj4gK+auteWHuueOsOWkseivr+OAgjoNCj4gKw0KPiArMTBrLCAyMGss
IDQwaywgLi4uICjkvovlpoLvvIzlgYforr5ndWVzdF9oYWx0X3BvbGxfZ3Jvdz0yKS4NCj4gKw0K
PiAr6buY6K6k5YC8OiA1MDAwMA0KPiArDQo+ICs1KSBndWVzdF9oYWx0X3BvbGxfYWxsb3dfc2hy
aW5rOg0KPiArDQo+ICvlhYHorrjnvKnlh4/nmoRCb29s5Y+C5pWw44CC6K6+572u5Li6TuS7pemB
v+WFjeWug++8iOS4gOaXpui+vuWIsOWFqOWxgOeahGd1ZXN0X2hhbHRfcG9sbF9uc+WAvO+8jOav
j0NQVeeahA0KPiArZ3Vlc3RfaGFsdF9wb2xsX25z5bCG5L+d5oyB6auY5L2N77yJ44CCDQo+ICsN
Cj4gK+m7mOiupOWAvDogWQ0KPiArDQo+ICvmqKHlnZflj4LmlbDlj6/ku6Xku45EZWJ1Z2Zz5paH
5Lu25Lit6K6+572u77yM5ZyoOjoNCj4gKw0KPiArICAgICAgIC9zeXMvbW9kdWxlL2hhbHRwb2xs
L3BhcmFtZXRlcnMvDQo+ICsNCj4gK+i/m+S4gOatpeivtOaYjg0KPiArPT09PT09PT09PQ0KPiAr
DQo+ICstIOWcqOiuvue9rmd1ZXN0X2hhbHRfcG9sbF9uc+WPguaVsOaXtuW6lOivpeWwj+W/g++8
jOWboOS4uuS4gOS4quWkp+eahOWAvOacieWPr+iDveS9v+acuuWZqOS4iueahGNwdeS9v+eUqOeO
hw0KPiArICDovr7liLAxMDAl77yM5ZCm5YiZ5Yeg5LmO5piv5a6M5YWo56m66Zey55qE44CCDQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0DQo+
IGluZGV4IDZhZGRhM2ZiYTZlMC4uMWM2MDJiODYzOGY1IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiBAQCAtMjEsMTIgKzIx
LDEyIEBAIExpbnV46Jma5ouf5YyW5pSv5oyBDQo+ICAgICA6bWF4ZGVwdGg6IDINCj4NCj4gICAg
IHBhcmF2aXJ0X29wcw0KPiArICAgZ3Vlc3QtaGFsdC1wb2xsaW5nDQo+DQo+ICBUT0RPTElTVDoN
Cj4NCj4gICAgIGt2bS9pbmRleA0KPiAgICAgdW1sL3VzZXJfbW9kZV9saW51eF9ob3d0b192Mg0K
PiAtICAgZ3Vlc3QtaGFsdC1wb2xsaW5nDQo+ICAgICBuZV9vdmVydmlldw0KPiAgICAgYWNybi9p
bmRleA0KPg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
