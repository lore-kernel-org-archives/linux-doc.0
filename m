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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E8C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BCDD61934
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhC2MUA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 08:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhC2MTg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 08:19:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6184EC061574
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:19:35 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l4so19073224ejc.10
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SV97Q0VbvSnRHir8xazoZJTVFOCvJN5jr3RLro6vRRI=;
        b=mENwkQjzoQj69fZNnVW3UPVjLjSpOFIc1lMN+fzSiAKrcYsOw0BaK/IxTmQUIVSzLW
         XIrENwJdQiLtLBxOo+SG3woL+smU5hNLgdMSBU94Fxzd3LaPVto/BhP+6hF/C1mvhj5P
         gdTUau+fm7hj5XTR0k18E3oJbMYzAgM2aACeLfRdiLPjIQdeX2OPRB37q3CsYZ0diJEn
         jxklh1bZsZFlY+WU7xt6oqCFyluanml8Dci3X/cYFnM+II4vWeAT+HdmqE58LCHiZRSv
         74mciwEKI2u6MVCwIY50m51Qnjo4aId3dwlxd83WgoXWycGXV4KX698qTGSmKrvOOEYC
         y22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SV97Q0VbvSnRHir8xazoZJTVFOCvJN5jr3RLro6vRRI=;
        b=SzfuKlS//8iOFqE+oM6MP1PJQyEiRx/UUPHpdMe9KsMvScWAGzjOk0aQG5rjIOC+3P
         BAah8cOq0jiLb1apv+86MpgKFag6XmD+xXvh/DRhhlY9QJHJizgIEs6VCrtYnQL+SwJI
         VOy7hsqCAisoBzrciJkkIQY3y8w6tVVL1PPRmbrnVyzmyamJjt6uG+CmyVyXWUIglPRg
         FMg0RXVNAL877t/aigFA20qlqnJkRN2SiQcXHN8ZBuGuv2TvegQ8uyc1yIGK+2K6MwFr
         0kaNIOG934cMYUQ8czKoJiq113ZFXQHU46Tr2HR/Q5TdwhvrbTY8kukik9v5ZJoFUIdH
         RPgQ==
X-Gm-Message-State: AOAM530OLn51ejffwMqvBUHFYtw4HNyOu5WeYBjqNeyw5Jxdxdz6QLl7
        ClCuXEOgkmUAn67exsC51rOkBfgT9h8dveKag6U=
X-Google-Smtp-Source: ABdhPJzkbL7YTbecmkw8LmwiiSxgwKQAjEOYkw35oU24V2h8GnZb34Wd+xmbow7LF/D/tPKRofgbAlB5u0FnPewjMgQ=
X-Received: by 2002:a17:906:82c5:: with SMTP id a5mr28859149ejy.232.1617020374138;
 Mon, 29 Mar 2021 05:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210329025144.9776-1-siyanteng@loongson.cn> <20210329025144.9776-4-siyanteng@loongson.cn>
 <20210329062342.GB8845@mipc>
In-Reply-To: <20210329062342.GB8845@mipc>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 29 Mar 2021 20:19:23 +0800
Message-ID: <CAEensMxBMjT1D31-dbQ2Y14Rp61=-vuxmoej2-Xyyw6w1K7Dnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGl+DQoNCkRvIHlvdSBtaW5kIGlmIEkgYWRkIHRoZSBmb2xsb3dpbmc/DQoNCis65qCh6K+ROg0K
Kw0KKyDlkLTmg7PmiJAgV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KDQpXdSBYLkMu
IDxib2J3eGNAZW1haWwuY24+IOS6jjIwMjHlubQz5pyIMjnml6XlkajkuIAg5LiL5Y2IMjoyM+WG
memBk++8mg0KPg0KPiBPbiBNb24sIE1hciAyOSwgMjAyMSBhdCAxMDo1MTozOUFNICswODAwLCBZ
YW50ZW5nIFNpIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGlvbi9j
cHUtZnJlcS9jcHVmcmVxLXN0YXRzLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4g
IC4uLi96aF9DTi9jcHUtZnJlcS9jcHVmcmVxLXN0YXRzLnJzdCAgICAgICAgICB8IDEzMCArKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzMCBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9j
cHUtZnJlcS9jcHVmcmVxLXN0YXRzLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NwdWZyZXEtc3RhdHMucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY3B1ZnJlcS1zdGF0cy5yc3QN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDIxYTMx
N2Q5NjU5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2NwdS1mcmVxL2NwdWZyZXEtc3RhdHMucnN0DQo+ID4gQEAgLTAsMCArMSwx
MzAgQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArDQo+
ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9y
aWdpbmFsOiA6ZG9jOmAuLi8uLi8uLi9jcHUtZnJlcS9jcHVmcmVxLXN0YXRzYA0KPiA+ICs6VHJh
bnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiAr
Li4gX2NuX2NwdWZyZXEtc3RhdHMucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICtzeXNmcyBDUFVGcmVxIFN0YXRz
55qE5LiA6Iis6K+05piODQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+ICsNCj4gPiAr55So5oi35L+h5oGvDQo+ID4gKw0KPiA+ICsNCj4gPiAr5L2c
6ICFOiBWZW5rYXRlc2ggUGFsbGlwYWRpIDx2ZW5rYXRlc2gucGFsbGlwYWRpQGludGVsLmNvbT4N
Cj4gPiArDQo+ID4gKy4uIENvbnRlbnRzDQo+ID4gKw0KPiA+ICsgICAxLiDnroDku4sNCj4gPiAr
ICAgMi4g5o+Q5L6b55qE57uf6K6h5pWw5o2uKOS4vuS+i+ivtOaYjikNCj4gPiArICAgMy4g6YWN
572uY3B1ZnJlcS1zdGF0cw0KPiA+ICsNCj4gPiArDQo+ID4gKzEuIOeugOS7iw0KPiA+ICs9PT09
PT09PT09PT09PT0NCj4gPiArDQo+ID4gK2NwdWZyZXEtc3RhdHPmmK/kuIDkuKrkuLrmr4/kuKpD
UFXmj5DkvptDUFXpopHnjofnu5/orqHnmoTpqbHliqjjgIINCj4gPiAr6L+Z5Lqb57uf6K6h5pWw
5o2u5ZyoL3N5c2Zz5Lit5Lul5LiA5aCG5Y+q6K+75o6l5Y+j55qE5b2i5byP5o+Q5L6b44CC6L+Z
5Liq5o6l5Y+j77yI5Zyo6YWN572u5aW95ZCO77yJ5bCG5Ye6546w5ZyoDQo+ID4gKy9zeXNmc++8
iDxzeXNmcyByb290Pi9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1WC9jcHVmcmVxL3N0YXRzL++8ieS4
rWNwdWZyZXHkuIvnmoTkuIDkuKrljZUNCj4gPiAr54us55qE55uu5b2V5Lit77yM5o+Q5L6b57uZ
5q+P5LiqQ1BV44CCDQo+ID4gK+WQhOenjee7n+iuoeaVsOaNruWwhuWcqOatpOebruW9leS4i+W9
ouaIkOWPquivu+aWh+S7tuOAgg0KPiA+ICsNCj4gPiAr5q2k6amx5Yqo5piv54us56uL5LqO5Lu7
5L2V5Y+v6IO96L+Q6KGM5Zyo5L2g5omA55SoQ1BV5LiK55qE54m55a6aY3B1ZnJlcV9kcml2ZXLo
gIzorr7orqHnmoTjgILlm6DmraTvvIzlroPlsIbkuI7miYDmnIkNCj4gPiArY3B1ZnJlcV9kcml2
ZXLkuIDotbflt6XkvZzjgIINCj4gPiArDQo+ID4gKw0KPiA+ICsyLiDmj5DkvpvnmoTnu5/orqHm
lbDmja4o5Li+5L6L6K+05piOKQ0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQo+ID4gKw0KPiA+ICtjcHVmcmVxIHN0YXRz5o+Q5L6b5LqG5Lul5LiL57uf6K6h5pWw
5o2u77yI5Zyo5LiL6Z2i6K+m57uG6Kej6YeK77yJ44CCDQo+ID4gKw0KPiA+ICstICB0aW1lX2lu
X3N0YXRlDQo+ID4gKy0gIHRvdGFsX3RyYW5zDQo+ID4gKy0gIHRyYW5zX3RhYmxlDQo+ID4gKw0K
PiA+ICvmiYDmnInnmoTnu5/orqHmlbDmja7lsIbku47nu5/orqHpqbHliqjooqvovb3lhaXnmoTm
l7bpl7TvvIjmiJbnu5/orqHooqvph43nva7nmoTml7bpl7TvvInlvIDlp4vvvIzliLDmn5DkuIDn
u5/orqHmlbDmja7ooqvor7vlj5bnmoTml7bpl7TkuLrmraLjgIINCj4NCj4gWW91IGNoYW5nZWQg
J2luc2VydCcgaW4gdGhpcyBzZW50ZW5jZS4NCj4gQW5kIG5leHQ/DQo+DQo+ID4gK+aYvueEtu+8
jOe7n+iuoempseWKqOS4jeS8muacieS7u+S9leWFs+S6jue7n+iuoempseWKqOaPkuWFpeS5i+WJ
jeeahOmikeeOh+i9rOaNouS/oeaBr+OAgg0KdjM6IOaPkuWFpSA9IOi9veWFpQ0KT0vvvIENCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXg0KPiBBbGwgb3RoZXJz
IGFyZSBsb29rIGdvb2QgdG8gbWUuDQo+DQo+IFRoYW5rcyENCj4NCj4gV3UgWC5DLg0KPg0KDQpU
aGFuayENCg0KWWFudGVuZw0K
