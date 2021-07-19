Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED220C07E9B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 11:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB143610C7
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 11:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236697AbhGSKYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 06:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbhGSKYM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 06:24:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156C8C061574
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 03:14:10 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id o8so9373379plg.11
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AIa5FAi7aqh8Dw/3QDeNz0PrF1OSx/0kOtXDntcScrY=;
        b=Ur5D0kNh8zkU5t21wfF0io0pNYiXBYkOL42ZIpUshUiN0OzjEhU64N2/fxAzaFFvUR
         gnqj3l+Q7EwwH5VfTgXjvQaKqzJLg6mysNSsVovbg9PzlQi6lpdQpCVomCEfA/r7tEe7
         gkbW9cplk+pdgw6RAxwuKbEIsMHC88lG1735r9HpSkHnTV3a9P6P9s6oikhjAZiuHqKc
         t1ScHL6d0nVM82F6wBpHKUafzZ3bxDIv00daifUFRqCU7fqlil3Wn1cQpo3A6uTwNvUE
         WyLIsN4kf4m81WNNsopW1jq0yGZxaIdEbBBVo5A7vsTgA5Izy2jdZYt9Xe097a+t+IA5
         Dbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AIa5FAi7aqh8Dw/3QDeNz0PrF1OSx/0kOtXDntcScrY=;
        b=hwn9v7Uz8uB+9muxXmqR4k1bqqOEp9YGM69FEwd+4J4R1oOGfi0PYiwFvAKNnkgF8a
         v86py/7lHP6m7IrQwSjfLXdTyWw7KX6n/MgVrDQdZ8C6mADmhfb8BVPD5KvqwUk/24ip
         MvlNg7HDu3YginWEA8m24HjlkA4XX2+tCKUNk+5T0GpMTn2Qvn2Wk9zxLZnaGN4wWYum
         K5220HL9SnijgJjooKDHcDdDi/wW3ejONTXobpPHnO7pvJLHrnV6RUR0ounmceYr+qwF
         CuFPdtCTi9BdS1pGuulhC2t7IfaI247kDS2IOgf39n/EePDDWKLIpQyu5bGeIrCREnFC
         mQeA==
X-Gm-Message-State: AOAM533+scdY0TEQ/4+3tKLbqJUvlvoiH87JKQgfKbtfR6x16xgUNTd4
        npByrrEffXKY3ErsrzmLLS+/doVOa4R2u+cozD8=
X-Google-Smtp-Source: ABdhPJxyis0+bSCG4hBMzbtyw6sjkabr9xT5RrN5Od3VRDGbNLtMlYdwM9NWcuYLcDi7qXt/xJFIItk4gDzkEoCSJWk=
X-Received: by 2002:a17:90a:c7d7:: with SMTP id gf23mr163831pjb.38.1626692689858;
 Mon, 19 Jul 2021 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626687013.git.siyanteng@loongson.cn> <442c95117f33f48ac6f11bc984bdcca3a3772912.1626687013.git.siyanteng@loongson.cn>
In-Reply-To: <442c95117f33f48ac6f11bc984bdcca3a3772912.1626687013.git.siyanteng@loongson.cn>
From:   =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Date:   Mon, 19 Jul 2021 19:04:39 +0800
Message-ID: <CACWXhKkL20ddUJiL1ViLYzBe_aCdtJf9HFFfP3R7hePaxifuDg@mail.gmail.com>
Subject: Re: [PATCH 2/8] docs/zh_CN: add virt paravirt_ops translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        chenfeiyang@loongson.cn, siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGksIFlhbnRlbmcsDQoNCk9uIE1vbiwgMTkgSnVsIDIwMjEgYXQgMTc6NDIsIFlhbnRlbmcgU2kg
PHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0
aW9uL2NvcmUtYXBpL3BhcmF2aXJ0X29wcy5yc3QgaW50byBDaGluZXNlLg0KDQpEbyB5b3UgbWVh
biBEb2N1bWVudGF0aW9uL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdD8NCg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3Ry
YW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdCAgICAgICAgIHwgIDMgKy0NCj4gIC4uLi90
cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMucnN0ICB8IDQwICsrKysrKysrKysr
KysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiBpbmRleCBmNWM5MjJiYmQ4YTguLjZhZGRh
M2ZiYTZlMCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dmlydC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dmlydC9pbmRleC5yc3QNCj4gQEAgLTIwLDExICsyMCwxMiBAQCBMaW51eOiZmuaLn+WMluaUr+aM
gQ0KPiAgLi4gdG9jdHJlZTo6DQo+ICAgICA6bWF4ZGVwdGg6IDINCj4NCj4gKyAgIHBhcmF2aXJ0
X29wcw0KPiArDQo+ICBUT0RPTElTVDoNCj4NCj4gICAgIGt2bS9pbmRleA0KPiAgICAgdW1sL3Vz
ZXJfbW9kZV9saW51eF9ob3d0b192Mg0KPiAtICAgcGFyYXZpcnRfb3BzDQo+ICAgICBndWVzdC1o
YWx0LXBvbGxpbmcNCj4gICAgIG5lX292ZXJ2aWV3DQo+ICAgICBhY3JuL2luZGV4DQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29w
cy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29w
cy5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43M2Y0
OWMzMzhjM2INCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QNCj4gQEAgLTAsMCArMSw0MCBAQA0KPiAr
Li4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdmly
dC9wYXJhdmlydF9vcHMucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4g
WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiAr
DQo+ICsNCj4gKw0KPiArLi4gX2NuX3ZpcnRfcGFyYXZpcnRfb3BzOg0KPiArDQo+ICs9PT09PT09
PT09PT0NCj4gK1BhcmF2aXJ0X29wcw0KPiArPT09PT09PT09PT09DQo+ICsNCj4gK0xpbnV45o+Q
5L6b5LqG5a+55LiN5ZCM566h55CG56iL5bqP6Jma5ouf5YyW5oqA5pyv55qE5pSv5oyB44CC5Y6G
5Y+y5LiK77yM5Li65LqG5pSv5oyB5LiN5ZCM55qE6Jma5ouf5py6566h55CG5bmz5Y+wDQo+ICvv
vIhoeXBlcnZpc29y77yM5LiL5paH566A56ew566h55CG5bmz5Y+w77yJ77yM6ZyA6KaB5LiN5ZCM
55qE5LqM6L+b5Yi25YaF5qC477yM6L+Z5Liq6ZmQ5Yi25bey57uP6KKrcHZfb3Bz56e7DQo+ICvp
maTkuobjgIJMaW51eCBwdl9vcHPmmK/kuIDkuKromZrmi5/ljJZBUEnvvIzlroPog73lpJ/mlK/m
jIHkuI3lkIznmoTnrqHnkIbnqIvluo/jgILlroPlhYHorrjmr4/kuKrnrqHnkIbnqIvluo8NCj4g
K+S8mOWFiOS6juWFs+mUruaTjeS9nO+8jOW5tuWFgeiuuOWNleS4gOeahOWGheaguOS6jOi/m+WI
tuaWh+S7tuWcqOaJgOacieaUr+aMgeeahOaJp+ihjOeOr+Wig+S4rei/kOihjO+8jOWMheaLrOac
rOacuuKAlOKAlOayoQ0KPiAr5pyJ5Lu75L2V566h55CG56iL5bqP44CCDQo+ICsNCj4gK3B2X29w
c+aPkOS+m+S6huS4gOe7hOWHveaVsOaMh+mSiO+8jOS7o+ihqOS6huS4juS9jue6p+WFs+mUruaM
h+S7pOWSjOWQhOmihuWfn+mrmOe6p+WKn+iDveebuOWvueW6lOeahOaTjeS9nOOAgg0KPiArcHYt
b3Bz5YWB6K645Zyo6L+Q6KGM5pe26L+b6KGM5LyY5YyW77yM5Zyo5ZCv5Yqo5pe25a+55L2O57qn
5YWz6ZSu5pON5L2c6L+b6KGM5LqM6L+b5Yi25L+u6KGl44CCDQo+ICsNCj4gK3B2X29wc+aTjeS9
nOiiq+WIhuS4uuS4ieexuzoNCj4gKw0KPiArLSDnroDljZXnmoTpl7TmjqXosIPnlKgNCj4gKyAg
IOi/meS6m+aTjeS9nOWvueW6lOS6jumrmOawtOW5s+eahOWHveaVsO+8jOS8l+aJgOWRqOefpe+8
jOmXtOaOpeiwg+eUqOeahOW8gOmUgOW5tuS4jeWNgeWIhumHjeimgeOAgg0KPiArDQo+ICstIOmX
tOaOpeiwg+eUqO+8jOWFgeiuuOeUqOS6jOi/m+WItuihpeS4gei/m+ihjOS8mOWMlg0KPiArICAg
6YCa5bi45oOF5Ya15LiL77yM6L+Z5Lqb5pON5L2c5a+55bqU5LqO5L2O57qn5Yir55qE5YWz6ZSu
5oyH5Luk44CC5a6D5Lus6KKr6aKR57mB5Zyw6LCD55So77yM5bm25LiU5piv5oCn6IO95YWzDQo+
ICsgICDplK7jgILlvIDplIDmmK/pnZ7luLjph43opoHnmoTjgIINCg0KSSB0aGluayBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gc2F5ICLlr7nmgKfog73lhbPplK4iLg0KDQo+ICsNCj4gKy0g5LiA5aWX
55So5LqO5omL5YaZ5rGH57yW5Luj56CB55qE5a6P56iL5bqPDQo+ICsgICDmiYvlhpnnmoTmsYfn
vJbku6PnoIHvvIguU+aWh+S7tu+8ieS5n+mcgOimgeWHhuiZmuaLn+WMlu+8jOWboOS4uuWug+S7
rOWMheaLrOaVj+aEn+aMh+S7pOaIluWFtuS4reeahOS4gOS6m+S7ow0KPiArICAg56CB6Lev5b6E
5a+55oCn6IO96Z2e5bi45YWz6ZSu44CCDQo+IC0tDQo+IDIuMjcuMA0KPg0KDQpUaGFua3MsDQpG
ZWl5YW5nDQo=
