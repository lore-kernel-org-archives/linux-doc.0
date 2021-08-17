Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B4FC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 17 Aug 2021 01:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190C660EFF
	for <linux-doc@archiver.kernel.org>; Tue, 17 Aug 2021 01:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhHQBgk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Aug 2021 21:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhHQBgk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Aug 2021 21:36:40 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240A7C061764
        for <linux-doc@vger.kernel.org>; Mon, 16 Aug 2021 18:36:08 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id r26so3606474oij.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Aug 2021 18:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d6Do4a/3lelFf30t80adHWlhaod/bZrHaXiVn4o2yrE=;
        b=aw7mgm03jGlOCSiRerlhkYnqc8Fv07s/sSQ76vcbWMgJOqTVQPu4TeHdB7sUTokkQQ
         +qR5Dj0Q0LlajLGxIwrfc0vwS9TeVodg9ZkAPHjNThRr6HvY+eWnspYO1dTR6dlzYtQN
         bvEdJ3AFwrGD5Jae0xD0ChgMnpKQ1ghpPV2XXmE7v3OhYTyawv2KfTMyHoYQAW8g+XlZ
         Sa6iEbZ+AsOL7Udoap29fvLoNUtvJ58k3BA4cR2mdnGbYUtisuYfnAnrO8KeyQ5q6Lmu
         y2JFpOkrCI0LmGIxlG+KchWxNKAWTfg1sUiyL4L/5zmV2lU/w4vDGwCn4jojPsGNvS5C
         lbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d6Do4a/3lelFf30t80adHWlhaod/bZrHaXiVn4o2yrE=;
        b=jv4UYrbs5yUXdEOD2no1yO3Xffj0H7NsuztxwxoDmvgijXRivFs7dYs/9Fd+yNx8Kj
         Cggojl6rLfnputrPfUOmSeYr36I7U/AGCTfdr2yyPem0GdsbrqNV35YNwe3ApHUdZLfj
         mZ3DsdafZaD2ysN8tx5bW+pdbSHlVTcGKRZx1EYC59bhYCYcjcx4h69tjlihStGID3nF
         C5fc8Moc1c9WIAbewV7IioViXplIj4eu3DPPJon6mBOpbE0gfiPyc3+KlcjVRNSWkRkM
         nqVTOztLa8hyORODggiM82yKGbIvD60QUTM5cVAIciNerhXgBM6O1BOjGgOL9NNRDeuK
         Ec7w==
X-Gm-Message-State: AOAM531TsGsETywsUW2ByG/uJ0jEqiascqlOYwfrY8Uab/MVs3PL1M6W
        YGpUhRQDDqbL3lPDEHRN/AuivAlkU/fYVwFS1oI=
X-Google-Smtp-Source: ABdhPJxaEONUrJZg+i6yf4O0NmMzQR39Z90XN6VeezXIYB3VpxRy7f9od/A8Q2FgKG19ieUey/BScDUazsWZTCQdDF4=
X-Received: by 2002:a54:4714:: with SMTP id k20mr503917oik.103.1629164167526;
 Mon, 16 Aug 2021 18:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625795862.git.siyanteng@loongson.cn> <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
 <d67612cc-e396-25dd-bcc6-1129db8cf08d@flygoat.com> <CAEensMzF2F0za7QoYiv8MwpaVLRzptWcHzs4yUigsGNQSVbiJQ@mail.gmail.com>
 <e9661eaf-b06d-174d-1d07-6e026d95b0c9@flygoat.com>
In-Reply-To: <e9661eaf-b06d-174d-1d07-6e026d95b0c9@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 17 Aug 2021 09:35:58 +0800
Message-ID: <CAEensMzP7doY9=syLi7MyNnAYYNc=ZPaydRWEa37GXfTmy6BZw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] docs/zh_CN: add core-api boot-time-mm translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPiDkuo4yMDIx5bm0OOaciDE15pel
5ZGo5pelIOS4i+WNiDk6NDflhpnpgZPvvJoNCj4NCj4NCj4g5ZyoIDIwMjEvOC8xNSAxNDoxNiwg
eWFudGVuZyBzaSDlhpnpgZM6DQo+ID4gSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQu
Y29tPiDkuo4yMDIx5bm0OOaciDEx5pel5ZGo5LiJIOS4i+WNiDg6MjTlhpnpgZPvvJoNCj4gPj4N
Cj4gPj4g5ZyoIDIwMjEvNy85IDEwOjU3LCBZYW50ZW5nIFNpIOWGmemBkzoNCj4gPj4+IFRyYW5z
bGF0ZSBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2Jvb3QtdGltZS1tbS5yc3QgaW50byBDaGluZXNl
Lg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gPj4+IFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4N
Cj4gPj4+IC0tLQ0KPiA+Pj4gICAgLi4uL3poX0NOL2NvcmUtYXBpL2Jvb3QtdGltZS1tbS5yc3Qg
ICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gICAgLi4uL3RyYW5zbGF0
aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QgICAgIHwgIDIgKy0NCj4gPj4+ICAgIDIgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4gICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBp
L2Jvb3QtdGltZS1tbS5yc3QNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvYm9vdC10aW1lLW1tLnJzdCBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2Jvb3QtdGltZS1tbS5yc3QNCj4gPj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmJhMjBkZmVk
MTAxNw0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vY29yZS1hcGkvYm9vdC10aW1lLW1tLnJzdA0KPiA+Pj4gQEAgLTAsMCAr
MSw0OSBAQA0KPiA+Pj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+
Pj4gKw0KPiA+Pj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9ib290LXRpbWUt
bW0ucnN0DQo+ID4+PiArDQo+ID4+PiArOue/u+ivkToNCj4gPj4+ICsNCj4gPj4+ICsg5Y+45bu2
6IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPj4+ICsNCj4gPj4+ICs6
5qCh6K+ROg0KPiA+Pj4gKw0KPiA+Pj4gKyDml7blpY7kuq48YWxleHNAa2VybmVsLm9yZz4NCj4g
Pj4+ICsNCj4gPj4+ICsuLiBfY25fY29yZS1hcGlfYm9vdC10aW1lLW1tOg0KPiA+Pj4gKw0KPiA+
Pj4gKz09PT09PT09PT09PT09PT0NCj4gPj4+ICvlkK/liqjml7bnmoTlhoXlrZjnrqHnkIYNCj4g
Pj4+ICs9PT09PT09PT09PT09PT09DQo+ID4+PiArDQo+ID4+PiAr57O757uf5Yid5aeL5YyW5pep
5pyf5LiN6IO95L2/55So4oCc5q2j5bi44oCd55qE5YaF5a2Y566h55CG77yM5Y+q5piv5Zug5Li6
5a6D6L+Y5rKh5pyJ6KKr6K6+572u5aW944CC5L2G5piv5LuNDQo+ID4+PiAr54S26ZyA6KaB5Li6
5ZCE56eN5pWw5o2u57uT5p6E5YiG6YWN5YaF5a2Y77yM5L6L5aaC5Li654mp55CG6aG15YiG6YWN
5Zmo5YiG6YWN5YaF5a2Y44CCDQo+ID4+IOezu+e7n+WIneWni+WMluaXqeacn+KAnOato+W4uOKA
neeahOWGheWtmOeuoeeQhueUseS6juayoeacieiuvue9ruWujOavleaXoOazleS9v+eUqOOAguS9
huaYr+WGheaguOS7jeeEtumcgOimgeS4uuWQhOenjeaVsOaNrue7k+aehOWIhumFjeWGheWtmO+8
jOS+i+WmgueJqeeQhumhteWIhumFjeWZqOOAgg0KPiA+IE9LIQ0KPiA+Pg0KPiA+Pj4gKw0KPiA+
Pj4gK+S4gOS4quWPq+WBmiBgYG1lbWJsb2NrYGAg55qE5LiT55So5YiG6YWN5Zmo5omn6KGM5ZCv
5Yqo5pe255qE5YaF5a2Y566h55CG44CC54m55a6a5p625p6E55qE5Yid5aeL5YyWDQo+ID4+PiAr
5b+F6aG75Zyoc2V0dXBfYXJjaCgp5Lit6K6+572u5a6D77yM5bm25ZyobWVtX2luaXQoKeWHveaV
sOS4reenu+mZpOWug+OAgg0KPiA+Pj4gKw0KPiA+Pj4gK+S4gOaXpuaXqeacn+eahOWGheWtmOeu
oeeQhuWPr+eUqO+8jOWug+WwseS4uuWGheWtmOWIhumFjeaPkOS+m+S6huWQhOenjeWHveaVsOWS
jOWuj+OAguWIhumFjeivt+axguWPr+S7peaMh+WQkQ0KPiA+Pj4gK+esrOS4gOS4qu+8iOS5n+WP
r+iDveaYr+WUr+S4gOeahO+8ieiKgueCueaIlk5VTUHns7vnu5/kuK3nmoTmn5DkuKrnibnlrpro
ioLngrnjgILmnInkuIDkuptBUEnlj5jkvZPlnKjliIYNCj4gPj4+ICvphY3lpLHotKXml7ZwYW5p
Y++8jOS5n+acieS4gOS6m+S4jXBhbmlj55qE44CCDQo+ID4+IF4g5LiN5LyacGFuaWPjgIINCj4g
PiBPSyENCj4gPj4+ICsNCj4gPj4+ICtNZW1ibG9ja+i/mOaPkOS+m+S6huWQhOenjeaOp+WItuWF
tuiHqui6q+ihjOS4uueahEFQSeOAgg0KPiA+Pj4gKw0KPiA+Pj4gK01lbWJsb2Nr5qaC6L+wDQo+
ID4+PiArPT09PT09PT09PT09DQo+ID4+PiArDQo+ID4+PiAr6K+lQVBJ5Zyo5Lul5LiL5YaF5qC4
5Luj56CB5LitOg0KPiA+Pj4gKw0KPiA+Pj4gK21tL21lbWJsb2NrLmMNCj4gPj4+ICsNCj4gPj4+
ICsNCj4gPj4+ICvlh73mlbDlkoznu5PmnoTkvZMNCj4gPj4+ICs9PT09PT09PT09PT0NCj4gPj4+
ICsNCj4gPj4+ICvkuIvpnaLmmK/lhbPkuo5tZW1ibG9ja+aVsOaNrue7k+aehOOAgeWHveaVsOWS
jOWuj+eahOaPj+i/sOOAguWFtuS4reS4gOS6m+WunumZheS4iuaYr+WGhemDqO+8iOWGheiBlOWH
veaVsOazqOmHiu+8iQ0KPiA+Pj4gK+eahO+8jOS9hueUseS6juWug+S7rOiiq+iusOW9leS4i+ad
pe+8jOa8j+aOieWug+S7rOaYr+W+iOaEmuigoueahOOAguatpOWklu+8jOmYheivu+WGhemDqOWH
veaVsOeahOazqOmHiuWPr+S7peW4ruWKqeeQhg0KPiA+Pj4gK+ino+W8leaTjuebluS4i+ecn+at
o+WPkeeUn+eahOS6i+aDheOAgg0KPiA+PiBJIHRoaW5rIGludGVybmFsIGhlcmUgbWVhbnMgbm90
IGZhY2luZyBtZW1ibG9jayB1c2Vycywg5YaF6IGU5Ye95pWw5rOo6YeKIHNlZW1zDQo+ID4+IHdp
cmVkLg0KPiA+IE9LISByZW1vdmUg77yI5YaF6IGU5Ye95pWw5rOo6YeK77yJDQo+ID4NCj4gPiBC
dXQgSSBzdGlsbCB0aGluayBpdCBtZWFucyBjb21tZW50cyBpbiB0aGUgY29kZS4gIDotKQ0KPg0K
PiBUaGlzIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4gSWYgeW91IGNvbnNpc3QgSSdkIHN1Z2d1
ZXN0IGp1c3QgZHJvcCAoKS4NClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcsIEkgd2lsbCBkcm9w
IGl0Lg0KDQpUaGFua3MsDQoNCllhbnRlbmcNCg==
