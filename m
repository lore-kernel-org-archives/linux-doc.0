Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CAEC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 02:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE23361212
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 02:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239630AbhJPCbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Oct 2021 22:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhJPCbn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Oct 2021 22:31:43 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621AEC061570
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 19:29:36 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v20so7493362plo.7
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 19:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qs+HgkxPd0pTeQ2dRFb+3kYbpP66rFbDb0eG++GqOUA=;
        b=OpJ/Ljk84LnVw5OIeNMJmKI8HVNLBW6uy9ScblTTh6V2hNMgksjc2xnfta8wKwEEBv
         robZICe1ea37iBXK9fuY8+sNiAwXb4iHIgoJS42lrlVsbZG4bZknP1aZRosknPi+2LVY
         pKa4Yj/2oINCH02fH3jMYFjSXFvcGOWqZymgs++CDo4FBLQQMZTDDqaUsTGSDJMx3T3Y
         BpvdWRMspjNE6347kffo0JqH862Tmtnwxem875KikEyZw1cZ9D1M1TS6UzPL3qSVzht2
         ZpzL3WkwSe9GIyyNmSIdg2J32lTKLk4oSRclnq+Sz+81bSLiDNDSXph90QhBn82Mgjc2
         aBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qs+HgkxPd0pTeQ2dRFb+3kYbpP66rFbDb0eG++GqOUA=;
        b=GptzBUh20AkAKN1YUbY6e8jxXRGHEUBLnYK5mIdI3cxIWTrlv4T58rWz6cxYUJFOJt
         zhYCDM8usztkKReUygf5lr2KRUHNXYz2NuEimVzMeqWd4PRCsZLfz429k6xHiWo3CT95
         uBOxkbsp2Ev76Gu9/OACsZVHBEQRRFKCGHvSMnimt+wvu/fBHW7+S5THIgw4o/mkWbh+
         jHAcFE4860rguEmXWOWEe4ekQGtmp2b/D8auNKO5nKT9QvoL6uJrWUZhzHRUUBpy3qHP
         bh/lyPUGqXlgawK8bLfWGSxOJpEh6RDctrES1Xabp+AD/4XwoYx11jyvKrxaGQ/+n6a/
         KlfA==
X-Gm-Message-State: AOAM531p/BC7YJw3wp+VUSixbsal0gxxmfxBWZky3try62daMtI7GKHC
        Cgpm0PpivR5RuImyL3XSIeQA4w9khYXZPtIr9rQ/vzozoz0=
X-Google-Smtp-Source: ABdhPJzxhR5WOGKxJKLDGQbLl0cjlHSurz8kVokPuLVLVeIGUyFo6rCOyK3mtvQVbj5ucz0CVdK8ECSdhJMPvFgHMFE=
X-Received: by 2002:a17:90b:3901:: with SMTP id ob1mr32128896pjb.12.1634351375818;
 Fri, 15 Oct 2021 19:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634041639.git.siyanteng@loongson.cn> <1d7e11699bab1f970b324b711fde199680023c53.1634041639.git.siyanteng@loongson.cn>
 <CAJy-AmkfEtxesokqU2DSGtTWVSJv0Ec7-d-1TQCpiKe6KTKDzw@mail.gmail.com>
In-Reply-To: <CAJy-AmkfEtxesokqU2DSGtTWVSJv0Ec7-d-1TQCpiKe6KTKDzw@mail.gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Sat, 16 Oct 2021 10:29:24 +0800
Message-ID: <CAMU9jJp-XwCB2h2O3i=UuTb2x=-=eCyjWc-OoqM+4pB251JBHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: add core-api assoc_array translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0MTDmnIgxNeaXpeWRqOS6lCDk
uIvljYg0OjIx5YaZ6YGT77yaDQo+DQo+IE9uIFR1ZSwgT2N0IDEyLCAyMDIxIGF0IDg6MzQgUE0g
WWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRyYW5z
bGF0ZSBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2Fzc29jX2FycmF5LnJzdCBpbnRvIENoaW5lc2Uu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24u
Y24+DQo+ID4gLS0tDQo+ID4gIC4uLi96aF9DTi9jb3JlLWFwaS9hc3NvY19hcnJheS5yc3QgICAg
ICAgICAgICB8IDQ3MyArKysrKysrKysrKysrKysrKysNCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96
aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QgICAgIHwgICAyICstDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDc0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2Fzc29jX2FycmF5
LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NvcmUtYXBpL2Fzc29jX2FycmF5LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2NvcmUtYXBpL2Fzc29jX2FycmF5LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44MDcxZDkyNDFkYzkNCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvYXNz
b2NfYXJyYXkucnN0DQo+ID4gQEAgLTAsMCArMSw0NzMgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4u
L2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRp
b24vY29yZS1hcGkvYXNzb2NfYXJyYXkucnN0DQo+ID4gKw0KPiA+ICs657+76K+ROg0KPiA+ICsN
Cj4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4g
Kw0KPiA+ICs65qCh6K+ROg0KPiA+ICsNCj4gPiArDQo+ID4gKw0KPiA+ICsuLiBfY25fY29yZS1h
cGlfYXNzb2NfYXJyYXk6DQo+ID4gKw0KPiA+ICs9PT09PT09PT09PT09PT09PT0NCj4gPiAr6YCa
55So5YWz6IGU5pWw57uE55qE5a6e546wDQo+ID4gKz09PT09PT09PT09PT09PT09PQ0KPiA+ICsN
Cj4gPiAr566A5LuLDQo+ID4gKz09PT0NCj4gPiArDQo+ID4gK+i/meS4quWFs+iBlOaVsOe7hOea
hOWunueOsOaYr+S4gOS4quWFt+acieS7peS4i+WxnuaAp+eahOWvueixoeWuueWZqDoNCj4gPiAr
DQo+ID4gKzEuIOWvueixoeaYr+S4jemAj+aYjueahOaMh+mSiOOAguivpeWunueOsOS4jeWFs+W/
g+Wug+S7rOaMh+WQkeWTqumHjO+8iOWmguaenOacieeahOivne+8ieaIluWug+S7rOaMh+WQkeS7
gOS5iO+8iOWmguaenOacieeahA0KPiA+ICsgICDor53vvInjgIINCj4gPiArDQo+ID4gKyAgIC4u
IG5vdGU6Og0KPiA+ICsNCj4gPiArICAgICAg5oyH5ZCR5a+56LGh55qE5oyH6ZKIICrlv4Xpobsq
IOWcqOacgOWwj+acieaViOS9jeS4uumbtuOAgg0KPiA+ICsNCj4gPiArMi4g5a+56LGh5LiN6ZyA
6KaB5YyF5ZCr5L6b5pWw57uE5L2/55So55qE6ZO+5o6l5Z2X44CC6L+Z5YWB6K645LiA5Liq5a+5
6LGh5ZCM5pe25L2N5LqO5aSa5Liq5pWw57uE5Lit44CC55u45Y+N77yM5pWw57uE5pivDQo+ID4g
KyAgIOeUseaMh+WQkeWvueixoeeahOWFg+aVsOaNruWdl+e7hOaIkOeahOOAgg0KPiA+ICsNCj4g
PiArMy4g5a+56LGh6ZyA6KaB57Si5byV6ZSu5p2l5a6a5L2N5a6D5Lus5Zyo6Zi15YiX5Lit55qE
5L2N572u44CCDQo+ID4gKw0KPiA+ICs0LiDntKLlvJXplK7lv4XpobvmmK/llK/kuIDnmoTjgILm
j5LlhaXkuIDkuKrkuI7lt7Lnu4/lnKjmlbDnu4TkuK3nmoTkuJTlhbfmnInnm7jlkIzplK7lgLzn
moTlr7nosaHlsIblj5bku6Pml6fnmoTlr7nosaHjgIINCj4gPiArDQo+ID4gKzUuIOe0ouW8lemU
ruWPr+S7peaYr+S7u+S9lemVv+W6pu+8jOS5n+WPr+S7peaYr+S4jeWQjOeahOmVv+W6puOAgg0K
PiA+ICsNCj4gPiArNi4g57Si5byV6ZSu5bqU6K+l5Zyo5pep5pyf5bCx5a+56ZW/5bqm6L+b6KGM
57yW56CB77yM5Y2z5Zyo5Lu75L2V55Sx5LqO6ZW/5bqm5byV6LW355qE5Y+Y5YyW5Ye6546w5LmL
5YmN44CCDQo+ID4gKw0KPiA+ICs3LiDntKLlvJXplK7lj6/ku6XljIXmi6zkuIDkuKrlk4jluIzl
gLzvvIzku6Xkvr/lsIblr7nosaHliIbmlaPliLDmlbTkuKrmlbDnu4TkuK3jgIINCj4gPiArDQo+
ID4gKzguIOivpeaVsOe7hOWPr+S7pei/reS7o+OAguWvueixoeS4jeS4gOWumuS8muaMiee0ouW8
lemUrueahOmhuuW6j+WHuueOsOOAgg0KPiA+ICsNCj4gPiArOS4gIOaVsOe7hOWPr+S7peWcqOii
q+S/ruaUueeahOaXtuWAmei/m+ihjOi/reS7o++8jOWPquimgVJDVeeahOivu+mUgeiiq+i/reS7
o+WZqOaMgeacieOAgueEtuiAjO+8jOivt+azqOaEj++8jOWcqOi/meenjeaDhQ0KPiA+ICsgICAg
5Ya15LiL77yM5LiA5Lqb5a+56LGh5Y+v6IO95Lya6KKr55yL5Yiw5LiN5q2i5LiA5qyh44CC5aaC
5p6c6L+Z5piv5Liq6Zeu6aKY77yM6L+t5Luj5Zmo5bqU6K+l6ZSB5a6a5Lul6Ziy5q2i5L+u5pS5
44CC54S2DQo+ID4gKyAgICDogIzvvIzpmaTpnZ7liKDpmaTvvIzlkKbliJnlr7nosaHkuI3kvJro
oqvplJnov4fjgIINCj4gPiArDQo+ID4gKzEwLiDmlbDnu4TkuK3nmoTlr7nosaHlj6/ku6XpgJro
v4flhbbntKLlvJXplK7ov5vooYzmn6Xor6LjgIINCj4gPiArDQo+ID4gKzExLiDlvZPmlbDnu4To
oqvkv67mlLnml7bvvIzlr7nosaHlj6/ku6Xooqvmn6Xor6LvvIzliY3mj5DmmK/ov5vooYzmn6Xo
r6LnmoTnur/nqIvmjIHmnIlSQ1XnmoTor7vplIHjgIINCj4gPiArDQo+ID4gK+ivpeWunueOsOWc
qOWGhemDqOS9v+eUqOS6huS4gOajteeUsTE25Liq5oyH6ZKI6IqC54K557uE5oiQ55qE5qCR77yM
6L+Z5Lqb6IqC54K55Zyo5q+P5LiA5bGC6YO955Sx57Si5byV6ZSu55qE5bCP5pWw54K56L+b6KGM
57SiDQo+ID4gK+W8le+8jOWFtuaWueW8j+S4juWfuuaVsOagkeebuOWQjOOAguS4uuS6huaPkOmr
mOWGheWtmOaViOeOh++8jOWPr+S7peaUvue9ruW/q+aNt+mUru+8jOS7pei3s+i/h+acrOadpeaY
r+S4gOezu+WIl+WNleWNoOiKgueCueeahOWcsA0KPiA+ICvmlrnjgILmraTlpJbvvIzoioLngrnl
sIblj7blrZDlr7nosaHmjIfpkojmiZPljIXliLDoioLngrnnmoTnqbrpl7Lnqbrpl7TkuK3vvIzo
gIzkuI3mmK/lgZrkuIDkuKrpop3lpJbnmoTliIbmlK/vvIznm7TliLDmnInlr7nosaENCj4gPiAr
6ZyA6KaB6KKr5re75Yqg5Yiw5LiA5Liq5a6M5pW055qE6IqC54K55Lit44CCDQo+ID4gKw0KPiA+
ICvlhaznlKhBUEkNCj4gPiArPT09PT09PQ0KPiA+ICsNCj4gPiAr5YWs55SoQVBJ5Y+v5Lul5Zyo
IGBgPGxpbnV4L2Fzc29jX2FycmF5Lmg+YGAg5Lit5om+5Yiw44CC5YWz6IGU5pWw57uE55qE5qC5
5piv5Lul5LiL57uT5p6EOjoNCj4gPiArDQo+ID4gKyAgICBzdHJ1Y3QgYXNzb2NfYXJyYXkgew0K
PiA+ICsgICAgICAgICAgICAuLi4NCj4gPiArICAgIH07DQo+ID4gKw0KPiA+ICvor6Xku6PnoIHm
mK/pgJrov4flkK/nlKggYGBDT05GSUdfQVNTT0NJQVRJVkVfQVJSQVlgYCDmnaXpgInmi6nnmoTv
vIzku6U6Og0KPiA+ICsNCj4gPiArICAgIC4vc2NyaXB0L2NvbmZpZyAtZSBBU1NPQ0lBVElWRV9B
UlJBWQ0KPiA+ICsNCj4gPiArDQo+ID4gK+e8lui+keiEmuacrA0KPiA+ICstLS0tLS0tLQ0KPiA+
ICsNCj4gPiAr5o+S5YWl5ZKM5Yig6Zmk5Yqf6IO95Lya5Lqn55Sf5LiA5Liq4oCc57yW6L6R6ISa
5pys4oCd77yM5Lul5ZCO5Y+v5Lul5bqU55So6L+Z5Liq6ISa5pys5p2l5a6e546w5pu05pS577yM
6ICM5LiN5Lya5a+5RU5PTUVN6YCgDQo+DQo+IOiAjOS4jeS8mumAoOaIkCBgYEVOT01FTWBg55qE
6aOO6Zmp44CCDQpPSyxUaGFua3MhDQo+DQo+ID4gK+aIkOmjjumZqeOAgui/meS/neeVmeS6huWw
huiiq+WuieijheWcqOWGhemDqOagkeS4reeahOmihOWIhumFjeeahOWFg+aVsOaNruWdl++8jOW5
tui3n+i4quWcqOW6lOeUqOiEmuacrOaXtuWwhuS7juagkeS4reWIoOmZpOeahA0KPiA+ICvlhYPm
lbDmja7lnZfjgIINCj4NCj4gcmVtb3ZlICflnKgnLCBjaGFuZ2UgdG8gIuW5tui3n+i4quW6lOeU
qOiEmuacrOaXti4uLiI/DQpPSyxUaGFua3MhDQo+DQo+ID4gKw0KPiA+ICvlnKjohJrmnKzlupTn
lKjlkI7vvIzov5nkuZ/ooqvnlKjmnaXot5/ouKrmrbvlnZflkozmrbvlr7nosaHvvIzku6Xkvr/k
u6XlkI7lj6/ku6Xph4rmlL7lroPku6zjgILph4rmlL7mmK/lnKhSQ1Xlrr3pmZDmnJ/ov4flkI4N
Cj4gPiAr6L+b6KGM55qELS3lm6DmraTlhYHorrjorr/pl67lip/og73lnKhSQ1Xor7vplIHkuIvo
v5vooYzjgIINCj4gPiArDQo+ID4gK+iEmuacrOWcqEFQSeS5i+WkluaYvuekuuS4uuS4gOS4quex
u+Wei+S4ujo6DQo+ID4gKw0KPiA+ICsgICAgc3RydWN0IGFzc29jX2FycmF5X2VkaXQ7DQo+ID4g
Kw0KPiA+ICvmnInkuKTkuKrlpITnkIbohJrmnKznmoTlip/og706DQo+ID4gKw0KPiA+ICsxLiDl
upTnlKjkuIDkuKrnvJbovpHohJrmnKw6Og0KPiA+ICsNCj4gPiArICAgIHZvaWQgYXNzb2NfYXJy
YXlfYXBwbHlfZWRpdChzdHJ1Y3QgYXNzb2NfYXJyYXlfZWRpdCAqZWRpdCk7DQo+ID4gKw0KPiA+
ICvov5nlsIbmiafooYznvJbovpHlip/og73vvIzmj5LlgLzlkITnp43lhpnlsY/pmpzvvIzku6Xl
hYHorrjlnKhSQ1Xor7vplIHkuIvnmoTorr/pl67nu6fnu63ov5vooYzjgILnhLblkI7vvIznvJbo
vpHohJrmnKzlsIbooqsNCj4gPiAr5Lyg6YCS57uZIGNhbGxfcmN1KCnvvIzku6Xph4rmlL7lroPl
kozlroPmiYDmjIflkJHnmoTku7vkvZXmrbvnmoTkuJzopb/jgIINCj4NCj4gRm9yZ2l2ZSBteSBw
b29yIG1lbW9yeSwgd2h5IHdlIHJlbW92ZSB0aGUgYmFja3F1b3RlIGBgIGFyb3VuZCBjYWxsX3Jj
dQ0KPiBhbmQgb3RoZXJzPw0KSSBhbSBzbyBzb3JyeSwgSSB3aWxsIGZpeCBpdC4NCj4NCj4gRm9y
IHRoZSBsZWZ0LA0KPiBSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQpU
aGFuayB5b3UgdmVyeSBtdWNoIQ0KDQoNClRoYW5rcy4NCllhbnRlbmcNCg==
