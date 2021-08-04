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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEB0C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78BFF61037
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234089AbhHDDD5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 23:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233769AbhHDDD5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 23:03:57 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F15DC061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 20:03:44 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id a14so516215ila.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CwK03rN2+zR32sUNlHK035F9weQ7xutwo0IRz3QhUto=;
        b=V65Enm0s/cI0JV54VlVmNEYE7EXDgxFeNBAPuSp+aeQu2FWNF79JpLGyHHg71V7X7q
         vnWzkG5h89ybWeQkU8wqLt6oqZmguE714cTslinFfeeHRHF0hqeQCJLY1PyGOkcoIv0n
         mq8Rgds5weQBjnX5JBtD/84uyKVQud5LAVCMKBspLPhIAlRywQgJCf1ldnGerDjuELVW
         0R44K/74/g/oGam0f6prV9p17IiZXr4IxtG+u9aDuAOzJNAHtLQ6wu+F2EqOHarXSDfW
         aQzuo78+8hJHOZoS6xCRCluAYRSYqnQ0iariPXqdDl5w7DZxTqETPw+ZwjMHwrDXxE9K
         elKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CwK03rN2+zR32sUNlHK035F9weQ7xutwo0IRz3QhUto=;
        b=cAAUQX0J4nJ1g0lOd2JAtUO1TCq8pdzto4ViO5bwVf2+1OJPhjPnQ3urRi/iHzyRgg
         z68CWCADm/Dgbj3694epPvN1u9XhuD8OK+Oq397rcaGnb7pvhwQpzBqVL9mEMxWRY2wD
         /ci6rK9PyeUXw/p2ne4zCdgcuvmhYbvoSogTtBzfSqSacqmeUuCg3zE3qE68sgZNd9Y9
         YY4BX8jFXaew0YtNoTkGstCemJmSDyoF3k7fGimo+D20rsUfnO1yNyT0XaOrEZPbIBer
         SOrp+9qngQPn+/uBadn/KLPXU7ZHRejtMU26QTbtq6/jNz5UDhoeFPYnng525sLsKB8c
         gQDw==
X-Gm-Message-State: AOAM5336uAxQlyo9upEZxuXXde7ja1KO1f0bbMsbj74iBYXbbLAoQIBS
        K05/Cl/lOZ5tLYjvtKb3p/P9jOdGjNAdQzChuz0=
X-Google-Smtp-Source: ABdhPJzJ5mH2AmKrrQ7pAKs2wSBwmaAWVIZi7XpY9yujevYl5DaMG6rQZjUhkA+YDVD5RtqxaSGc9KuaqycP0xCdGgg=
X-Received: by 2002:a05:6e02:602:: with SMTP id t2mr683184ils.118.1628046223999;
 Tue, 03 Aug 2021 20:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <90643c240d63b4eedc498a1f5cfb6dd846912b64.1627823347.git.siyanteng@loongson.cn>
In-Reply-To: <90643c240d63b4eedc498a1f5cfb6dd846912b64.1627823347.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 11:03:07 +0800
Message-ID: <CAJy-Amm6+C3TvRmRzmF5uz+SnbS8goaaX1M3bwEWm=Ai0MQbhg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] docs/zh_CN: add virt acrn cpuid translation
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
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3ZpcnQvYWNybi9j
cHVpZC5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxz
aXlhbnRlbmdAbG9vbmdzb24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2Vy
bmVsLm9yZz4NCg0KDQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fjcm4v
Y3B1aWQucnN0ICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5zbGF0aW9u
cy96aF9DTi92aXJ0L2Fjcm4vaW5kZXgucnN0ICAgIHwgIDUgLS0NCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fjcm4vY3B1aWQucnN0DQo+
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fj
cm4vY3B1aWQucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9hY3Ju
L2NwdWlkLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjI1MmFhMTBhZDUyZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZpcnQvYWNybi9jcHVpZC5yc3QNCj4gQEAgLTAsMCArMSw1NiBAQA0K
PiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6OiAu
Li8uLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRp
b24vdmlydC9hY3JuL2NwdWlkLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu2
6IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToN
Cj4gKw0KPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4gKw0KPiAr
Li4gX2NuX3ZpcnRfYWNybl9jcHVpZDoNCj4gKw0KPiArPT09PT09PT09PT09PT0NCj4gK0FDUk4g
Q1BVSUTkvY3ln58NCj4gKz09PT09PT09PT09PT09DQo+ICsNCj4gK+WcqEFDUk7otoXnuqfnrqHn
kIblmajkuIrov5DooYznmoTlrqLmiLfomZrmi5/mnLrlj6/ku6Xkvb/nlKhDUFVJROajgOafpeWF
tuS4gOS6m+WKn+iDveOAgg0KPiArDQo+ICtBQ1JO55qEY3B1aWTlh73mlbDmmK86DQo+ICsNCj4g
K+WHveaVsDogMHg0MDAwMDAwMA0KPiArDQo+ICvov5Tlm546Og0KPiArDQo+ICsgICBlYXggPSAw
eDQwMDAwMDEwDQo+ICsgICBlYnggPSAweDRlNTI0MzQxDQo+ICsgICBlY3ggPSAweDRlNTI0MzQx
DQo+ICsgICBlZHggPSAweDRlNTI0MzQxDQo+ICsNCj4gK+azqOaEj++8jGVieO+8jGVjeOWSjGVk
eOS4reeahOi/meS4quWAvOWvueW6lOS6juWtl+espuS4suKAnEFDUk5BQ1JOQUNSTuKAneOAgmVh
eOS4reeahOWAvOWvueW6lOS6jui/meS4quWPtuWtkA0KPiAr5Lit5a2Y5Zyo55qE5pyA5aSnY3B1
aWTlh73mlbDvvIzlpoLmnpzlsIbmnaXmnInmm7TlpJrnmoTlh73mlbDliqDlhaXvvIzlsIbooqvm
m7TmlrDjgIINCj4gKw0KPiAr5Ye95pWwOiBkZWZpbmUgQUNSTl9DUFVJRF9GRUFUVVJFUyAoMHg0
MDAwMDAwMSkNCj4gKw0KPiAr6L+U5ZueOjoNCj4gKw0KPiArICAgICAgICAgIGVieCwgZWN4LCBl
ZHgNCj4gKyAgICAgICAgICBlYXggPSBhbiBPUidlZCBncm91cCBvZiAoMSA8PCBmbGFnKQ0KPiAr
DQo+ICvlhbbkuK0gYGBmbGFnYGAg55qE5a6a5LmJ5aaC5LiLOg0KPiArDQo+ICs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0gPT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gK+agh+W/lyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOWAvCAg
ICAgICAgICDmj4/ov7ANCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSA9PT09
PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArQUNSTl9GRUFUVVJF
X1BSSVZJTEVHRURfVk0gICAgICAgIDAgICAgICAgICAgIOWuouaIt+iZmuaLn+acuuaYr+S4gOS4
quacieeJueadg+eahOiZmuaLn+acug0KPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09ID09PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4g
K+WHveaVsDogMHg0MDAwMDAxMA0KPiArDQo+ICvov5Tlm546Og0KPiArDQo+ICsgICAgICAgICAg
ZWJ4LCBlY3gsIGVkeA0KPiArICAgICAgICAgIGVheCA9IChWaXJ0dWFsKSBUU0MgZnJlcXVlbmN5
IGluIGtIei4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3ZpcnQvYWNybi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
aXJ0L2Fjcm4vaW5kZXgucnN0DQo+IGluZGV4IGI1Mzk3NmUyMGEzNC4uMzQ2MDVkODdmMTAzIDEw
MDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fjcm4v
aW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQv
YWNybi9pbmRleC5yc3QNCj4gQEAgLTIyLDkgKzIyLDQgQEAgQUNSTui2hee6p+euoeeQhuWZqA0K
Pg0KPiAgICAgaW50cm9kdWN0aW9uDQo+ICAgICBpby1yZXF1ZXN0DQo+IC0NCj4gLVRPRE9MSVNU
Og0KPiAtDQo+IC0NCj4gLQ0KPiAgICAgY3B1aWQNCj4gLS0NCj4gMi4yNy4wDQo+DQo=
