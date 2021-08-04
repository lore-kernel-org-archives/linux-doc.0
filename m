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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8D8C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EA261029
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbhHDCki (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbhHDCkh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:40:37 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D812C061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:40:26 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id a14so476110ila.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gxbamhxGz/7PBQ9EMluPexAQNViSW1BucDVUkr8hxNQ=;
        b=UlnjAiOHuy+ceVNRqpVCnKF/jbvMrn1ctZfG6XVCL451oHeYQHWG1TwofwhvHM6ftL
         kLXsMjRwxptAMfZ/Y0m8mNyA9mO8SMvw+39myxw5JwvB+aslmLBB2tlrHOEN+MTvMSUs
         m/X6e6s4GPI4kIjVfS6G40twdZsLBZXvs4Mjjhl8yZStqJTHY+JkoePOb7iTlj1TGPSc
         CNw9d1oOHxsXvAJ8FehwdqyJOSI0IOImf7O10sjbqIRHx5BH/4DDBjgSQk7hOuMmCPLL
         BgVHND63RJImnHpncQKVEFmDA7rZlbTPvDW10c/WzIWuKm7ZUyzsrGw7Ra/k+BP4D56i
         /FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gxbamhxGz/7PBQ9EMluPexAQNViSW1BucDVUkr8hxNQ=;
        b=Bj5BRe36Y871vG5ZTCLNBl1MHpkPPuHUrGedO2OSf6Qb49wAYVd9SqUZ5aHdAI558X
         rnjX2FbWjCWXqD3W03dydidMRlz28QdybhqiPqNp/s97wwTcRocKFCe/ZNYrYpPjcNE5
         cEsisgAz39PP57BAFy1Y48BqfO7KsGhztFf2Rav6B/97TZZDdTj6/3b/kS3ixkqD1cNh
         DIIsbmO2MM3w1EN8vbqAjWujBlcU062t2Co3MhtjzPGt3TkVFauIRWtx3a/hEoz/X3Vl
         uCV2dJt1H14RYhk3Yl0n5b9foW6DbkXhThcm3LXxjPUQAQ2TzhTWwt6GTAQLpS6Ngpw3
         NFjg==
X-Gm-Message-State: AOAM531KD4zsQTyWuUzHSLVEjG1CscyPZiUOW6NnwdcOcmJ3xxjqH2+w
        W7RjELWKIRv99/C/5EIXsKsAOR625lI3bWniXRk=
X-Google-Smtp-Source: ABdhPJySACM8iMhY2GglEeMs67Db1nf9osGtVQoAIKDREVVfa4xuVCq8aXyP0mJOpq8wkXB0ZujG43Qpv+8HAr2tiBE=
X-Received: by 2002:a05:6e02:1849:: with SMTP id b9mr715159ilv.88.1628044825637;
 Tue, 03 Aug 2021 19:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <56b196333c3070657da3e85841fb43592dd81ca0.1627823347.git.siyanteng@loongson.cn>
In-Reply-To: <56b196333c3070657da3e85841fb43592dd81ca0.1627823347.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:39:49 +0800
Message-ID: <CAJy-AmnXZ7M=0T8-jHXUwGYbp2xGA0vhGR2qGMqE1S_juGiO=w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] docs/zh_CN: add virt paravirt_ops translation
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
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3ZpcnQvcGFyYXZp
cnRfb3BzLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kg
PHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0Br
ZXJuZWwub3JnPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5y
c3QgICAgICAgICB8ICAzICstDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZp
cnRfb3BzLnJzdCAgfCA0MSArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QNCj4N
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5k
ZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QN
Cj4gaW5kZXggOWU1ZGY1YjVkZTE1Li5iOWIyM2JiODhmZmEgMTAwNjQ0DQo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0DQo+IEBAIC0yMCwxMSAr
MjAsMTIgQEAgTGludXjomZrmi5/ljJbmlK/mjIENCj4gIC4uIHRvY3RyZWU6Og0KPiAgICAgOm1h
eGRlcHRoOiAyDQo+DQo+ICsgICBwYXJhdmlydF9vcHMNCj4gKw0KPiAgVE9ET0xJU1Q6DQo+DQo+
ICAgICBrdm0vaW5kZXgNCj4gICAgIHVtbC91c2VyX21vZGVfbGludXhfaG93dG9fdjINCj4gLSAg
IHBhcmF2aXJ0X29wcw0KPiAgICAgZ3Vlc3QtaGFsdC1wb2xsaW5nDQo+ICAgICBuZV9vdmVydmll
dw0KPiAgICAgYWNybi9pbmRleA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTllMDcwOGExZDYzDQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMu
cnN0DQo+IEBAIC0wLDAgKzEsNDEgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiAr
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPiArDQo+ICs6
57+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nv
bi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArIOmZiOmjnuadqCBGZWl5YW5nIENoZW4g
PGNoZW5mZWl5YW5nQGxvb25nc29uLmNuPg0KPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNA
a2VybmVsLm9yZz4NCj4gKw0KPiArLi4gX2NuX3ZpcnRfcGFyYXZpcnRfb3BzOg0KPiArDQo+ICs9
PT09PT09PT09PT0NCj4gK1BhcmF2aXJ0X29wcw0KDQp0aGlzIHRpdGxlIGNvdWxkIGJlIHRyYW5z
bGF0ZWQgYXMg5Y2K6Jma5ouf5YyW5pON5L2c77yfDQoNCj4gKz09PT09PT09PT09PQ0KPiArDQo+
ICtMaW51eOaPkOS+m+S6huWvueS4jeWQjOeuoeeQhueoi+W6j+iZmuaLn+WMluaKgOacr+eahOaU
r+aMgeOAguWOhuWPsuS4iu+8jOS4uuS6huaUr+aMgeS4jeWQjOeahOiZmuaLn+acuui2hee6p+eu
oeeQhuWZqA0KPiAr77yIaHlwZXJ2aXNvcu+8jOS4i+aWh+eugOensOi2hee6p+euoeeQhuWZqO+8
ie+8jOmcgOimgeS4jeWQjOeahOS6jOi/m+WItuWGheaguO+8jOi/meS4qumZkOWItuW3sue7j+ii
q3B2X29wc+enuw0KPiAr6Zmk5LqG44CCTGludXggcHZfb3Bz5piv5LiA5Liq6Jma5ouf5YyWQVBJ
77yM5a6D6IO95aSf5pSv5oyB5LiN5ZCM55qE566h55CG56iL5bqP44CC5a6D5YWB6K645q+P5Liq
566h55CG56iL5bqPDQo+ICvkvJjlhYjkuo7lhbPplK7mk43kvZzvvIzlubblhYHorrjljZXkuIDn
moTlhoXmoLjkuozov5vliLbmlofku7blnKjmiYDmnInmlK/mjIHnmoTmiafooYznjq/looPkuK3o
v5DooYzvvIzljIXmi6zmnKzmnLrigJTigJTmsqENCj4gK+acieS7u+S9leeuoeeQhueoi+W6j+OA
gg0KPiArDQo+ICtwdl9vcHPmj5DkvpvkuobkuIDnu4Tlh73mlbDmjIfpkojvvIzku6Pooajkuobk
uI7kvY7nuqflhbPplK7mjIfku6TlkozlkITpoobln5/pq5jnuqflip/og73nm7jlr7nlupTnmoTm
k43kvZzjgIINCj4gK3B2LW9wc+WFgeiuuOWcqOi/kOihjOaXtui/m+ihjOS8mOWMlu+8jOWcqOWQ
r+WKqOaXtuWvueS9jue6p+WFs+mUruaTjeS9nOi/m+ihjOS6jOi/m+WItuS/ruihpeOAgg0KPiAr
DQo+ICtwdl9vcHPmk43kvZzooqvliIbkuLrkuInnsbs6DQo+ICsNCj4gKy0g566A5Y2V55qE6Ze0
5o6l6LCD55SoDQo+ICsgICDov5nkupvmk43kvZzlr7nlupTkuo7pq5jmsLTlubPnmoTlh73mlbDv
vIzkvJfmiYDlkajnn6XvvIzpl7TmjqXosIPnlKjnmoTlvIDplIDlubbkuI3ljYHliIbph43opoHj
gIINCj4gKw0KPiArLSDpl7TmjqXosIPnlKjvvIzlhYHorrjnlKjkuozov5vliLbooaXkuIHov5vo
oYzkvJjljJYNCj4gKyAgIOmAmuW4uOaDheWGteS4i++8jOi/meS6m+aTjeS9nOWvueW6lOS6juS9
jue6p+WIq+eahOWFs+mUruaMh+S7pOOAguWug+S7rOiiq+mikee5geWcsOiwg+eUqO+8jOW5tuS4
lOaYr+WvueaAp+iDveWFsw0KPiArICAg6ZSu44CC5byA6ZSA5piv6Z2e5bi46YeN6KaB55qE44CC
DQo+ICsNCj4gKy0g5LiA5aWX55So5LqO5omL5YaZ5rGH57yW5Luj56CB55qE5a6P56iL5bqPDQo+
ICsgICDmiYvlhpnnmoTmsYfnvJbku6PnoIHvvIguU+aWh+S7tu+8ieS5n+mcgOimgeWHhuiZmuaL
n+WMlu+8jOWboOS4uuWug+S7rOWMheaLrOaVj+aEn+aMh+S7pOaIluWFtuS4reeahOS4gOS6m+S7
ow0KDQpwYXJhdmlydCB1c3VhbGx5IGlzIHRyYW5sYXRlZCBhcyDljYromZrmi5/ljJbvvIwNCg0K
b3RoZXJzIGxvb2tzIGdvb2QgZm9yIG1lLg0KDQpUaGFua3MNCkFsZXgNCg0KPiArICAg56CB6Lev
5b6E5a+55oCn6IO96Z2e5bi45YWz6ZSu44CCDQo+IC0tDQo+IDIuMjcuMA0KPg0K
