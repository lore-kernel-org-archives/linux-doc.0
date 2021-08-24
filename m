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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0CAC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 11:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D5CE6120A
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 11:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhHXLTm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 07:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbhHXLTl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Aug 2021 07:19:41 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301C6C061757
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 04:18:57 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so36464342otg.11
        for <linux-doc@vger.kernel.org>; Tue, 24 Aug 2021 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bXzCEfxCRgmCKLZrbkn/VI25FIAwR2Oka2xODnds5sY=;
        b=OWaFG+FQQBsbCIWiQIzXHnqBxTNEDF8ZYnKITZz6yKDH0+aVTnjS1vjsA24+EM34oP
         /L7zYDgtFrYoMJYATd7NwldmvgMoG9ZtUUGIB/wYHBigYAHkXEIgar8K7Heff5s76wkH
         QQ7Oe28fZ9lnHAsL/9Rr1/9B6kfr3iBj8vdA0/HE4gvOHVeSLwh6iA7fvNtpBHG77s7g
         hVG/EMbS7uuqwMksUyYHZCONH/M2Yj2IDTPnR1tooO2c7/PAWtXhdtauXvDwe2iOnD4V
         wjcBal3QsuLsaPu2xiDzfyKgDKgrtBKiy1oz04Id7ZFeKvzMk1muXoyA/0kGmJIf86If
         vkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bXzCEfxCRgmCKLZrbkn/VI25FIAwR2Oka2xODnds5sY=;
        b=MriLETmnAeAwOsc0cWmva2emkvdMM9OZsMC2Isvelltoj9ShuR5YJQywvp9w88u7Qs
         lkVbShXe0NATa2sVAMLdVr9McXh8yGyR7BB14FlZYkMe3PH45wJAMkreJVdO64WUXez8
         Xb/BoHQHqR4hLtd8A7XPfZfwzAQ5c1YeebTbglPf0OQjzylex0xQwY+7p+2c4OYOHfED
         fvLjSCFbBjd8ClpbiJjBqQMwjo3fLZXEcF1hR+cTZrNFKHQ4HvVZ4/1wLYDbAuKCjmlN
         YFgSAGvUAV11AxupiPKaBVNBv3FpjayrLJO4Iw/RbY1/1ccFMB823JjcwiF1riw0gBHs
         komQ==
X-Gm-Message-State: AOAM5331uCoFVcH3kQ/arL0hgpUpztf6ZiAtz+LhV2YFkmv2ywxn7QRX
        a6hb5NsVIW1B8JNXvB82I9jQAjiIasNAmJxrSSY=
X-Google-Smtp-Source: ABdhPJzDG0Xcfaj7b9bbkATcXox1prApCGt0v2bX/VyNyXPhEZZvaUt4w22JAGNcukIS93MRPqsgmjMxphSMxQvyt34=
X-Received: by 2002:a9d:664c:: with SMTP id q12mr32845098otm.243.1629803936447;
 Tue, 24 Aug 2021 04:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629274856.git.siyanteng@loongson.cn> <ead97c192e0f947e214fd857905bab5eeaeda14f.1629274856.git.siyanteng@loongson.cn>
 <CAJy-Amkm-_UrxXkTMn0=EJb+no3Y_rf8TQUAu-AjGJH0jniQkQ@mail.gmail.com>
In-Reply-To: <CAJy-Amkm-_UrxXkTMn0=EJb+no3Y_rf8TQUAu-AjGJH0jniQkQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 24 Aug 2021 19:18:45 +0800
Message-ID: <CAEensMxVp3J-tDJUJz7k2TS7aid2Xtj_tNDiEEO1n5Lv-b67wQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] docs/zh_CN: add core-api gfp_mask-from-fs-io translation
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

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDI05pel5ZGo5LqMIOS4
i+WNiDU6MTXlhpnpgZPvvJoNCj4NCj4gT24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgNDozMiBQTSBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+IHdyb3RlOg0KPiA+DQo+ID4gVHJhbnNs
YXRlIERvY3VtZW50YXRpb24vY29yZS1hcGkvZ2ZwX21hc2stZnJvbS1mcy1pby5yc3QgaW50byBD
aGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICAuLi4vemhfQ04vY29yZS1hcGkvZ2ZwX21hc2stZnJv
bS1mcy1pby5yc3QgICAgfCA2NiArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi90cmFuc2xh
dGlvbnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0ICAgICB8ICAyICstDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvZ2ZwX21h
c2stZnJvbS1mcy1pby5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9nZnBfbWFzay1mcm9tLWZzLWlvLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2dmcF9tYXNrLWZyb20tZnMtaW8u
cnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmEy
YjgxMzEzZjdhNw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9nZnBfbWFzay1mcm9tLWZzLWlvLnJzdA0KPiA+IEBA
IC0wLDAgKzEsNjYgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0
DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vY29yZS1hcGkvZ2ZwX21hc2st
ZnJvbS1mcy1pby5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4gKw0KPiA+ICsg5Y+45bu2
6IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiArDQo+ID4gKzrmoKHo
r5E6DQo+ID4gKw0KPiA+ICsNCj4gPiArDQo+ID4gKy4uIF9jbl9jb3JlLWFwaV9nZnBfbWFzay1m
cm9tLWZzLWlvOg0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+
ICvku45GUy9JT+S4iuS4i+aWh+S4reS9v+eUqOeahEdGUOaOqeeggQ0KPiA+ICs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICs65pel5pyfOiAyMDE45bm0NeaciA0KPiA+
ICs65L2c6ICFOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3JnPg0KPiA+ICsNCj4gPiAr
566A5LuLDQo+ID4gKz09PT0NCj4gPiArDQo+ID4gK+aWh+S7tuezu+e7n+WSjElP5qCI5Lit55qE
5Luj56CB6Lev5b6E5Zyo5YiG6YWN5YaF5a2Y5pe25b+F6aG75bCP5b+D77yM5Lul6Ziy5q2i5Zug
55u05o6l6LCD55SoRlPmiJZJT+i3r+W+hOeahOWGhQ0KPiA+ICvlrZjlm57mlLblkozpmLvloZ7l
t7Lnu4/mjIHmnInnmoTotYTmupDvvIjkvovlpoLplIEtLeacgOW4uOingeeahOaYr+eUqOS6juS6
i+WKoeS4iuS4i+aWh+eahOmUge+8ieiAjOmAoOaIkOmAkuW9kuatuw0KPiA+ICvplIHjgIINCj4N
Cj4g4oCdYW5kIGJsb2NraW5n4oCcICBoZXJlLCBhcyBteSB1bmRlcnN0YW5kaW5nLCBpcyB0byBl
bXBoYXNpemUgdGhlICdhbmQnLA0KPiBzbyBtYXliZSB0aGUgJ2FuZCcgY291bGQgYmUNCj4gdHJh
bnNsYXRlZCBhcyDigJjlubbkuJTigJnvvJ8NCk9LIQ0KPg0KPiBBcyB0byBvdGhlcnMsDQo+IFJl
dmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0KVGhhbmsgeW91IGZvciB5
b3VyIHJldmlldyENCg0KDQpUaGFua3MsDQoNCllhbnRlbmcNCg==
