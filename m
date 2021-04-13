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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55889C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 11:28:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D45861370
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 11:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhDML20 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 07:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhDML2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 07:28:25 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76252C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:28:06 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id l131so11607274oih.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tIVux5TNOHfkP0Z1iUq/h5xgoiSXhhJH8IWNB2+8FDc=;
        b=jDR5NcslhQH3bCog5Osv/jJREunh+bi5UN5r9U/CqNeq3Q3YvatTMHGCXfnBsFmq12
         WEYPo+aaigTCYdS7QgBFJmtTS5F2VnRNIDfL2zP9X8s4e33RwudIlCutquXR4cEsBCeu
         eG2BAl+Bt+LPXRCIEks9W+muM1JAi7PZ5EJdAijBDTBkYDrlWMrpwfJyBP/sUQQiClA9
         5ogZnjHG6Who2ktpleUOeNJ33ec9fgR4tUPb9B0dpaj7p4UgbZh9jm6ZV2qdhfqrH/PW
         TUYt7wnj+YPkYRsEZTIblHKWUhKPGYrWEFPUxgTyUnwujmwP1W7Z476V7c8awG5Ej0uH
         BcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tIVux5TNOHfkP0Z1iUq/h5xgoiSXhhJH8IWNB2+8FDc=;
        b=OvrgG+sKySfB4fAeeFtcT8FaU/DU1VZEgO2k3+tZvZdOzd6Cx6/D1o4U54xvOyrdSE
         3D7Qwgg2UQtSU6N9Zwqq9sPxseS07AADTSvMNSr5DGIgB246mZjeqso8D5YSFzr2okJ/
         t0i985+quJImsNuyi7wABYp7PjWBk56qKEDP98OuGMe3+naqX5aGu9B1y+BRYORhaS6y
         ibPIZI9kvHBWTX2/Qm3VhFX4IC9SNlNMUzSsJ7XU9bZhlpYOrvibw/B3V74Odeae5keW
         Hv6lavR6ROtT2OTFmRYfBoLsDlUNyLpNDVfaPgx4D78n5G78NVzKHtNIzZRwIzxYPD46
         vOEQ==
X-Gm-Message-State: AOAM530xYKaH2C70UkygreabA5vPFX9BhgADt3ZopEIAX2pKXi4CDCeL
        tJmdFTzqtQBQpjo/2sr6y5pIh0CyFzUqJxdX0A4=
X-Google-Smtp-Source: ABdhPJwVfj5WYlJtPT89CPjgyO82j7myrsTyi7lffEyeDxnHXZxkUsBIXc48tXryMNg2SrK1Cu5eldWFPwP2vU1zYAg=
X-Received: by 2002:aca:5755:: with SMTP id l82mr2955766oib.37.1618313285573;
 Tue, 13 Apr 2021 04:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-3-siyanteng@loongson.cn> <20210409105145.GA26339@bobwxc.top>
In-Reply-To: <20210409105145.GA26339@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 13 Apr 2021 19:27:55 +0800
Message-ID: <CAEensMyQ9DLjHemsiNXSe3AR-VZJGnTj9MYbaEP4EMJkzkEC7g@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] docs/zh_CN: add core-api irq irq-affinity.rst translation
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

T0shDQoNCnRoYW5rcw0KWWFuIHRlbmcNCg0KV3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4y
MDIx5bm0NOaciDnml6XlkajkupQg5LiL5Y2INjo1MuWGmemBk++8mg0KPg0KPiBPbiBGcmksIEFw
ciAwOSwgMjAyMSBhdCAwNToxMDowNFBNICswODAwLCBZYW50ZW5nIFNpIHdyb3RlOg0KPiA+IFRo
aXMgcGF0Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2lycS9pcnEtYWZmaW5p
dHkucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kg
PHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAgLi4uL3poX0NOL2NvcmUtYXBp
L2lycS9pcnEtYWZmaW5pdHkucnN0ICAgICAgIHwgNzQgKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2lycS1hZmZp
bml0eS5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9jb3JlLWFwaS9pcnEvaXJxLWFmZmluaXR5LnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2lycS9pcnEtYWZmaW5pdHkucnN0DQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM0YWFmMGQxZGRjMg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9jb3JlLWFwaS9pcnEvaXJxLWFmZmluaXR5LnJzdA0KPiA+IEBAIC0wLDAgKzEsNzQgQEANCj4g
PiArLi4gaW5jbHVkZTo6IC4uLy4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6
T3JpZ2luYWw6IDpkb2M6YC4uLy4uLy4uLy4uL2NvcmUtYXBpL2lycS9pcnEtYWZmaW5pdHlgDQo+
ID4gKzpUcmFuc2xhdG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4g
Kw0KPiA+ICsuLiBfY25faXJxLWFmZmluaXR5LnJzdDoNCj4gPiArDQo+ID4gKw0KPiA+ICs9PT09
PT09PT09PT09PT09DQo+ID4gK1NNUCBJUlEg5Lqy5ZKM5oCnDQo+ID4gKz09PT09PT09PT09PT09
PT0NCj4gPiArDQo+ID4gK+WPmOabtOiusOW9lToNCj4gPiArICAgICAtIOS9nOiAhe+8muacgOWI
neeUsUluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPuW8gOWni+aSsOWGmQ0KPiA+ICsgICAg
IC0g5ZCO5pyf5pu05paw57u05oqk77yaIE1heCBLcmFzbnlhbnNreSA8bWF4a0BxdWFsY29tbS5j
b20+DQo+ID4gKw0KPiA+ICsNCj4gPiArL3Byb2MvaXJxL0lSUSMvc21wX2FmZmluaXR55ZKML3By
b2MvaXJxL0lSUSMvc21wX2FmZmluaXR5X2xpc3TmjIflrprkuoblk6rkuptDUFXog70NCj4gPiAr
5aSf5YWz6IGU5Yiw5LiA5Liq57uZ5a6a55qESVJR5rqQ77yM6L+Z5Lik5Liq5paH5Lu25YyF5ZCr
5LqG6L+Z5Lqb5oyH5a6aY3B155qEY3B15L2N5o6p56CBKHNtcF9hZmZpbml0eSnlkoxjcHXliJcN
Cj4gPiAr6KGoKHNtcF9hZmZpbml0eV9saXN0KeOAguWug+S4jeWFgeiuuOWFs+mXreaJgOaciUNQ
Ve+8jCDlkIzml7blpoLmnpxJUlHmjqfliLblmajkuI3mlK/mjIHkuK3mlq3or7fmsYLkurLlkowN
Cj4gPiArKElSUSBhZmZpbml0eSnvvIzpgqPkuYjmiYDmnIljcHXnmoTpu5jorqTlgLzlsIbkv53m
jIHkuI3lj5go5Y2z5YWz6IGU5Yiw5omA5pyJQ1BVKS4NCj4gPiArDQo+ID4gKy9wcm9jL2lycS9k
ZWZhdWx0X3NtcF9hZmZpbml0eeaMh+aYjuS6humAgueUqOS6juaJgOaciemdnua/gOa0u0lSUeea
hOm7mOiupOS6suWSjOaAp+aOqeeggeOAguS4gOaXpklSUeiiqw0KPiA+ICvliIbphY0v5r+A5rS7
77yM5a6D55qE5Lqy5ZKM5L2N5o6p56CB5bCG6KKr6K6+572u5Li66buY6K6k5o6p56CB44CC54S2
5ZCO5Y+v5Lul5aaC5LiK5omA6L+w5pS55Y+Y5a6D44CC6buY6K6k5o6p56CB5pivMHhmZmZmZmZm
ZuOAgg0KPiA+ICsNCj4gPiAr5LiL6Z2i5piv5LiA5Liq5YWI5bCGSVJRNDQoZXRoMSnpmZDliLbl
nKhDUFUwLTPkuIrvvIznhLblkI7pmZDliLblnKhDUFU0LTfkuIrnmoTkvovlrZAo6L+Z5piv5LiA
5LiqOENQVeeahFNNUCBib3gpDQo+ID4gKw0KPiA+ICs6Og0KPiA+ICsNCj4gPiArICAgICBbcm9v
dEBtb29uIDQ0XSMgY2QgL3Byb2MvaXJxLzQ0DQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIGNh
dCBzbXBfYWZmaW5pdHkNCj4gPiArICAgICBmZmZmZmZmZg0KPiA+ICsNCj4gPiArICAgICBbcm9v
dEBtb29uIDQ0XSMgZWNobyAwZiA+IHNtcF9hZmZpbml0eQ0KPiA+ICsgICAgIFtyb290QG1vb24g
NDRdIyBjYXQgc21wX2FmZmluaXR5DQo+ID4gKyAgICAgMDAwMDAwMGYNCj4gPiArICAgICBbcm9v
dEBtb29uIDQ0XSMgcGluZyAtZiBoDQo+ID4gKyAgICAgUElORyBoZWxsICgxOTUuNC43LjMpOiA1
NiBkYXRhIGJ5dGVzDQo+ID4gKyAgICAgLi4uDQo+ID4gKyAgICAgLS0tIGhlbGwgcGluZyBzdGF0
aXN0aWNzIC0tLQ0KPiA+ICsgICAgIDYwMjkgcGFja2V0cyB0cmFuc21pdHRlZCwgNjAyNyBwYWNr
ZXRzIHJlY2VpdmVkLCAwJSBwYWNrZXQgbG9zcw0KPiA+ICsgICAgIHJvdW5kLXRyaXAgbWluL2F2
Zy9tYXggPSAwLjEvMC4xLzAuNCBtcw0KPiA+ICsgICAgIFtyb290QG1vb24gNDRdIyBjYXQgL3By
b2MvaW50ZXJydXB0cyB8IGdyZXAgJ0NQVVx8NDQ6Jw0KPiA+ICsgICAgICAgICAgICAgQ1BVMCAg
ICAgICBDUFUxICAgICAgIENQVTIgICAgICAgQ1BVMyAgICAgIENQVTQgICAgICAgQ1BVNSAgICAg
ICAgQ1BVNiAgICAgICBDUFU3DQo+ID4gKyAgICAgNDQ6ICAgICAgIDEwNjggICAgICAgMTc4NSAg
ICAgICAxNzg1ICAgICAgIDE3ODMgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgIDAgICAg
ICAgICAwICAgIElPLUFQSUMtbGV2ZWwgIGV0aDENCj4gPiArDQo+ID4gK+S7juS4iumdouS4gOih
jOWPr+S7peeci+WHuu+8jElSUTQ05Y+q5Lyg6YCS57uZ5YmN5Zub5Liq5aSE55CG5Zmo77yIMC0z
77yJ44CCDQo+ID4gK+eOsOWcqOiuqeaIkeS7rOaKiui/meS4qklSUemZkOWItuWcqENQVSg0LTcp
44CCDQo+ID4gKw0KPiA+ICs6Og0KPiA+ICsNCj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgZWNo
byBmMCA+IHNtcF9hZmZpbml0eQ0KPiA+ICsgICAgIFtyb290QG1vb24gNDRdIyBjYXQgc21wX2Fm
ZmluaXR5DQo+ID4gKyAgICAgMDAwMDAwZjANCj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgcGlu
ZyAtZiBoDQo+ID4gKyAgICAgUElORyBoZWxsICgxOTUuNC43LjMpOiA1NiBkYXRhIGJ5dGVzDQo+
ID4gKyAgICAgLi4NCj4gPiArICAgICAtLS0gaGVsbCBwaW5nIHN0YXRpc3RpY3MgLS0tDQo+ID4g
KyAgICAgMjc3OSBwYWNrZXRzIHRyYW5zbWl0dGVkLCAyNzc3IHBhY2tldHMgcmVjZWl2ZWQsIDAl
IHBhY2tldCBsb3NzDQo+ID4gKyAgICAgcm91bmQtdHJpcCBtaW4vYXZnL21heCA9IDAuMS8wLjUv
NTg1LjQgbXMNCj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgY2F0IC9wcm9jL2ludGVycnVwdHMg
fCAgJ0NQVVx8NDQ6Jw0KPiA+ICsgICAgICAgICAgICAgQ1BVMCAgICAgICBDUFUxICAgICAgIENQ
VTIgICAgICAgQ1BVMyAgICAgIENQVTQgICAgICAgQ1BVNSAgICAgICAgQ1BVNiAgICAgICBDUFU3
DQo+ID4gKyAgICAgNDQ6ICAgICAgIDEwNjggICAgICAgMTc4NSAgICAgICAxNzg1ICAgICAgIDE3
ODMgICAgICAxNzg0ICAgICAgIDEwNjkgICAgICAgIDEwNzAgICAgICAgMTA2OSAgIElPLUFQSUMt
bGV2ZWwgIGV0aDENCj4gPiArDQo+ID4gK+i/measoUlSUTQ05Y+q5Lyg6YCS57uZ5pyA5ZCO5Zub
5Liq5aSE55CG5Zmo44CCDQo+ID4gK+WNs0NQVTAtM+eahOiuoeaVsOWZqOayoeacieWPmOWMluOA
gg0KPiA+ICsNCj4gPiAr5LiL6Z2i5piv5LiA5Liq5bCG55u45ZCM55qEaXJxKDQ0KemZkOWItuWc
qGNwdXMgMTAyNOWIsDEwMzHnmoTkvovlrZDvvJoNCj4NCj4gJ++8micgLT4gJzo6Jw0KPg0KPiBU
aGlzIGlzIGEgY29kZSBibG9jay4NCj4NCj4gPiArDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0j
IGVjaG8gMTAyNC0xMDMxID4gc21wX2FmZmluaXR5X2xpc3QNCj4gPiArICAgICBbcm9vdEBtb29u
IDQ0XSMgY2F0IHNtcF9hZmZpbml0eV9saXN0DQo+ID4gKyAgICAgMTAyNC0xMDMxDQo+ID4gKw0K
PiA+ICvpnIDopoHms6jmhI/nmoTmmK/vvIzlpoLmnpzopoHnlKjkvY3mjqnnoIHmnaXlgZrov5nk
u7bkuovvvIzlsLHpnIDopoEzMuS4quS4ujDnmoTkvY3mjqnnoIHmnaXov73ouKrlhbbnm7jlhbPn
moTkuIDkuKrjgIINCj4gPiAtLQ0KPiA+IDIuMjcuMA0KPg0K
