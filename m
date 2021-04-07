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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AA1C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 02:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85C3613A9
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 02:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhDGCI5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 22:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347834AbhDGCI5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 22:08:57 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7FFC06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 19:08:48 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso16594868oti.11
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 19:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sYoempKqt7OLCcWgF47tjU256Nbs8fb8iQFBNMMvDBU=;
        b=jFFtHToV9ZV6AxJK0ntZ8VP3q/mTPmGRZ6/ENXQIDUDFJa8wcMQzTOMxPL/N0C7RHr
         TsHuaJXBSEIlv/DKtDyfu9lUQfjpRa15/ckGbZPJY306c+1S3ocjMkF0ZOK7K+twlz+F
         CzfgJIypjAoYUiL6r7HptmB0aw4F1vy6cP3VcHSztwUyJpNe5SAI3r595HuFsKWC9UrE
         wMNuALrSaQI7kDeP7ET3xhOo44K1TjMKR2PFQiA0vdx6OhqSELyc8zCTPoEh9W2DpY15
         Jpo26RrYPbCIzes1+EItmXGvfdMjR+VAdD+BGuGlQEugYdrx+vmvqRLb90HLtNzPxzyO
         6iVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sYoempKqt7OLCcWgF47tjU256Nbs8fb8iQFBNMMvDBU=;
        b=GLca6eYLorn/C3RLxuGENsq91jTUV4iO2tZuruvu/lzovHq/arMTSV+IwLUs8gjcPf
         7l/FkzSSex5GafJvdguMx8f+q/6ynIGPsSdCkWmhZSL7T42lwYqh4lUSN87WxY8Y7omT
         9HrOUIHCRDy6I/EFAjpPPXyW3nU2YdKHpflQ0AbUG38x3ryhqYnCTQaBg+5fepW5Je5Y
         dnIIkhF1zOOLfwKlpYoE+nU9hDIz74CuGv3b7jKfoi6cmEE8L7XYAKG1Q5nt9qIhjuRe
         0ULWxkFW4fgvJ6JL0H0upeWNEGAEoe9ZrJvD5uE6k70PRkcbOV2EtRbzWakq4Gy6nzqz
         ZMpg==
X-Gm-Message-State: AOAM5323nvO+zQ4EUw07zmkRxpKGnew45pKJPb1p9r8BcQaYezzq6neP
        DjrimpCcxALJ+8S/rfr7WdWX+0ZYlrHvwUqhg7c=
X-Google-Smtp-Source: ABdhPJzaGTzz+s1r0Fpy3G5bMnUdoCtT2Ae5jHYavOaz8iBZ9d6Y1Wpa4hWhjWojs3zQg3wrSulUs62tuze6XQJp4B8=
X-Received: by 2002:a9d:750c:: with SMTP id r12mr879169otk.322.1617761327782;
 Tue, 06 Apr 2021 19:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-3-siyanteng@loongson.cn> <20210406153505.GC15259@bobwxc.top>
In-Reply-To: <20210406153505.GC15259@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 10:08:38 +0800
Message-ID: <CAEensMxkgSauL9SFiiY1-E8dWHj9AuBGyGFf52Bc0F0cd4FAtA@mail.gmail.com>
Subject: Re: [PATCH 02/11] docs/zh_CN: add core-api irq irq-affinity.rst translation
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
MTE6MzXlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDFQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1l
bnRhdGlvbi9jb3JlLWFwaS9pcnEvaXJxLWFmZmluaXR5LnJzdCBpbnRvIENoaW5lc2UuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+
ID4gLS0tDQo+ID4gIC4uLi96aF9DTi9jb3JlLWFwaS9pcnEvaXJxLWFmZmluaXR5LnJzdCAgICAg
ICB8IDczICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDczIGluc2Vy
dGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2NvcmUtYXBpL2lycS9pcnEtYWZmaW5pdHkucnN0DQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2lycS1h
ZmZpbml0eS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9p
cnEvaXJxLWFmZmluaXR5LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi4zNGFhZjBkMWRkYzINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2lycS1hZmZpbml0
eS5yc3QNCj4gPiBAQCAtMCwwICsxLDczIEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi8uLi9kaXNj
bGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiA6ZG9jOmAuLi8uLi8uLi8u
Li9jb3JlLWFwaS9pcnEvaXJxLWFmZmluaXR5YA0KPiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArLi4gX2NuX2lycS1hZmZpbml0
eS5yc3Q6DQo+ID4gKw0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT09PQ0KPiA+ICtTTVAgSVJR
IOS6suWSjOaApw0KPiA+ICs9PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICvlj5jmm7TorrDl
vZU6DQo+ID4gKyAgICAgLSDkvZzogIXvvJrmnIDliJ3nlLFJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT7lvIDlp4vmkrDlhpkNCj4gPiArICAgICAtIOWQjuacn+abtOaWsOe7tOaKpO+8miBN
YXggS3Jhc255YW5za3kgPG1heGtAcXVhbGNvbW0uY29tPg0KPiA+ICsNCj4gPiArDQo+ID4gKy9w
cm9jL2lycS9JUlEjL3NtcF9hZmZpbml0eeWSjC9wcm9jL2lycS9JUlEjL3NtcF9hZmZpbml0eV9s
aXN05oyH5piO5LqG57uZ5a6aSVJR5rqQDQo+ID4gK+WFgeiuuOWTquS6m+ebruagh0NQVeS9v+eU
qOOAguWug+aYr+iiq+WFgeiuuOeahENQVeeahOS9jeaOqeeggShzbXBfYWZmaW5pdHkp5oiWY3B1
5YiX6KGoKHNtcF9hZmZpbml0eV9saXN0KeOAgg0KPiA+ICvlroPkuI3lhYHorrjlhbPpl63miYDm
nInnmoRDUFXvvIzlpoLmnpzkuIDkuKpJUlHmjqfliLblmajkuI3mlK/mjIFJUlHkurLlkozmgKfv
vIzpgqPkuYjmiYDmnIljcHXnmoTpu5jorqTlgLzlsIbkuI3kvJrlj5HnlJ8NCj4NCj4g5YWz6Zet
IC0+IOemgeatou+8nw0KZW1tbW1t4oCm4oCmDQpJIGxvb2tlZCB1cCB0aGUgRW5nbGlzaC1DaGlu
ZXNlIGRpY3Rpb25hcnnvvJp0dXJuIG9mZiAtPiDlhbPpl63vvIzlhbPmjonnlLXlmajjgIHmsLTp
vpnlpLTigKbigKYNCm1heWJl77ya5LiN5YWB6K645YWz6ZetIC0+IOemgeatouWFs+mXre+8nw0K
Pg0KPiA+ICvlj5jljJbjgIINCj4gPiArDQo+ID4gKy9wcm9jL2lycS9kZWZhdWx0X3NtcF9hZmZp
bml0eeaMh+aYjuS6humAgueUqOS6juaJgOaciemdnua/gOa0u0lSUeeahOm7mOiupOS6suWSjOaA
p+aOqeeggeOAguS4gOaXpklSUeiiqw0KPiA+ICvliIbphY0v5r+A5rS777yM5a6D55qE5Lqy5ZKM
5L2N5o6p56CB5bCG6KKr6K6+572u5Li66buY6K6k5o6p56CB44CC54S25ZCO5Y+v5Lul5aaC5LiK
5omA6L+w5pS55Y+Y5a6D44CC6buY6K6k5o6p56CB5pivMHhmZmZmZmZmZmZm44CCDQo+DQo+IDB4
ZmZmZmZmZmYNCj4gZWlnaHQgZg0KPg0KT0shDQo+ID4gKw0KPiA+ICvkuIvpnaLmmK/kuIDkuKrl
hYjlsIZJUlE0NChldGgxKemZkOWItuWcqENQVTAtM+S4iu+8jOeEtuWQjumZkOWItuWcqENQVTQt
N+S4iueahOS+i+WtkCjov5nmmK/kuIDkuKo4Q1BV55qEU01QIGJveCkNCj4gYSBlbXB0eSBsaW5l
DQpPSyENCj4gPiArOjoNCj4gPiArDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIGNkIC9wcm9j
L2lycS80NA0KPiA+ICsgICAgIFtyb290QG1vb24gNDRdIyBjYXQgc21wX2FmZmluaXR5DQo+ID4g
KyAgICAgZmZmZmZmZmYNCj4gPiArDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIGVjaG8gMGYg
PiBzbXBfYWZmaW5pdHkNCj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgY2F0IHNtcF9hZmZpbml0
eQ0KPiA+ICsgICAgIDAwMDAwMDBmDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIHBpbmcgLWYg
aA0KPiA+ICsgICAgIFBJTkcgaGVsbCAoMTk1LjQuNy4zKTogNTYgZGF0YSBieXRlcw0KPiA+ICsg
ICAgIC4uLg0KPiA+ICsgICAgIC0tLSBoZWxsIHBpbmcgc3RhdGlzdGljcyAtLS0NCj4gPiArICAg
ICA2MDI5IHBhY2tldHMgdHJhbnNtaXR0ZWQsIDYwMjcgcGFja2V0cyByZWNlaXZlZCwgMCUgcGFj
a2V0IGxvc3MNCj4gPiArICAgICByb3VuZC10cmlwIG1pbi9hdmcvbWF4ID0gMC4xLzAuMS8wLjQg
bXMNCj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgY2F0IC9wcm9jL2ludGVycnVwdHMgfCBncmVw
ICdDUFVcfDQ0OicNCj4gPiArICAgICAgICAgICAgIENQVTAgICAgICAgQ1BVMSAgICAgICBDUFUy
ICAgICAgIENQVTMgICAgICBDUFU0ICAgICAgIENQVTUgICAgICAgIENQVTYgICAgICAgQ1BVNw0K
PiA+ICsgICAgIDQ0OiAgICAgICAxMDY4ICAgICAgIDE3ODUgICAgICAgMTc4NSAgICAgICAxNzgz
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgICAwICAgICAgICAgMCAgICBJTy1BUElDLWxl
dmVsICBldGgxDQo+ID4gKw0KPiA+ICvku47kuIrpnaLkuIDooYzlj6/ku6XnnIvlh7rvvIxJUlE0
NOWPquS8oOmAkue7meWJjeWbm+S4quWkhOeQhuWZqO+8iDAtM++8ieOAgg0KPiA+ICvnjrDlnKjo
rqnmiJHku6zmiorov5nkuKpJUlHpmZDliLblnKhDUFUoNC03KeOAgg0KPiA+ICsNCj4gPiArOjoN
Cj4gPiArDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIGVjaG8gZjAgPiBzbXBfYWZmaW5pdHkN
Cj4gPiArICAgICBbcm9vdEBtb29uIDQ0XSMgY2F0IHNtcF9hZmZpbml0eQ0KPiA+ICsgICAgIDAw
MDAwMGYwDQo+ID4gKyAgICAgW3Jvb3RAbW9vbiA0NF0jIHBpbmcgLWYgaA0KPiA+ICsgICAgIFBJ
TkcgaGVsbCAoMTk1LjQuNy4zKTogNTYgZGF0YSBieXRlcw0KPiA+ICsgICAgIC4uDQo+ID4gKyAg
ICAgLS0tIGhlbGwgcGluZyBzdGF0aXN0aWNzIC0tLQ0KPiA+ICsgICAgIDI3NzkgcGFja2V0cyB0
cmFuc21pdHRlZCwgMjc3NyBwYWNrZXRzIHJlY2VpdmVkLCAwJSBwYWNrZXQgbG9zcw0KPiA+ICsg
ICAgIHJvdW5kLXRyaXAgbWluL2F2Zy9tYXggPSAwLjEvMC41LzU4NS40IG1zDQo+ID4gKyAgICAg
W3Jvb3RAbW9vbiA0NF0jIGNhdCAvcHJvYy9pbnRlcnJ1cHRzIHwgICdDUFVcfDQ0OicNCj4gPiAr
ICAgICAgICAgICAgIENQVTAgICAgICAgQ1BVMSAgICAgICBDUFUyICAgICAgIENQVTMgICAgICBD
UFU0ICAgICAgIENQVTUgICAgICAgIENQVTYgICAgICAgQ1BVNw0KPiA+ICsgICAgIDQ0OiAgICAg
ICAxMDY4ICAgICAgIDE3ODUgICAgICAgMTc4NSAgICAgICAxNzgzICAgICAgMTc4NCAgICAgICAx
MDY5ICAgICAgICAxMDcwICAgICAgIDEwNjkgICBJTy1BUElDLWxldmVsICBldGgxDQo+ID4gKw0K
PiA+ICvov5nmrKFJUlE0NOWPquS8oOmAkue7meacgOWQjuWbm+S4quWkhOeQhuWZqOOAgg0KPiA+
ICvljbNDUFUwLTPnmoTorqHmlbDlmajmsqHmnInlj5jljJbjgIINCj4gPiArDQo+ID4gK+S4i+md
ouaYr+S4gOS4quWwhuebuOWQjOeahGlycSg0NCnpmZDliLblnKhjcHVzIDEwMjTliLAxMDMx55qE
5L6L5a2Q77ya44CCDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeXl4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAg77yaIC0+ICAgICA6Og0KPg0KT0shDQo+ID4gKw0KPiA+ICsgICAgIFtyb290QG1v
b24gNDRdIyBlY2hvIDEwMjQtMTAzMSA+IHNtcF9hZmZpbml0eV9saXN0DQo+ID4gKyAgICAgW3Jv
b3RAbW9vbiA0NF0jIGNhdCBzbXBfYWZmaW5pdHlfbGlzdA0KPiA+ICsgICAgIDEwMjQtMTAzMQ0K
PiA+ICsNCj4gPiAr6ZyA6KaB5rOo5oSP55qE5piv77yM5aaC5p6c6KaB55So5L2N5o6p56CB5p2l
5YGa6L+Z5Lu25LqL77yM5bCx6ZyA6KaBMzLkuKrkuLow55qE5L2N5o6p56CB5p2l6L+96Liq5YW2
55u45YWz55qE5LiA5Liq44CCDQo+ID4gLS0NCj4gPiAyLjI3LjANCj4NCg0KVGhhbmtzIQ0KDQpZ
YW50ZW5nDQo=
