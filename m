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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC3AC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 10:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1B30613B2
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 10:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhDMKAj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 06:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhDMKAj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 06:00:39 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC83C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 03:00:19 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso8712590pjh.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wLxewQimiZJyHRj5V+FYue2tiYzZmEdGYZPhHJvBIWw=;
        b=m+lv142lYeIYS+jqbweds4xJlkMK8DaEDYC89OC16K9gQPOPOKSbUJg8w7d7NT2rPY
         7i+WreXgwYXKi9r6TiWqkdhnMQ990rW6cQriVihxPHtEAa/xezDSnMSoM6Lt7FGdKnD0
         G56DZnq1uSsz2ml9UTN9TiajnNz8NCjA9sk9ISG99MbY6HiOgJwjzP++lvKSyc/aXdUD
         rjabQhusihVPGZbzswmdXGzsyha0xF9jrt1QzQB4yFKpZt+78g9dpZhqWm/SwHXyjhtK
         TU2hwQEpD4XoREk+4j10/WdU4DcbWTrrXiSbBDSeP2MPTXcuiHrvSVaLidgWFIBk5Z5g
         4sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wLxewQimiZJyHRj5V+FYue2tiYzZmEdGYZPhHJvBIWw=;
        b=c9tBdH0a4l13u0jO9dxaLDtSS4Q75byoHFrbUmuMNqEc4+NRwpSSw1aKLwu5+65ysn
         8zpOV7CdUb2mM8gmdOzi3YV0+FtTXJ0WMfcv35pB4sLVt+cR1mZV8ifHaczdoDAn8KZm
         U30fLWMb5F/9NHZ3Fk1JZMj6C0G9ozgwoXzUJGMIPf+L2HhEVVtwzqXDiWUF3JRmYr4z
         VbAvFAPNkecUqtPH+WEne8TjkuQlPbfwiJk8M5leW4oh+hAPSLSrxqxQIMgZkwoeqjIp
         x97RxlyOTLQ+IESgH7KLiGHxT5L6QtVwjO3weuCCNOjt3lZlHgo45RxuYrU4qq9gIkl4
         L7Zw==
X-Gm-Message-State: AOAM530jiFPKM6z+ELyP5Ou3I4CQW1mWuosGv+LYl5RVlbLXxXU0Wgu+
        dQiN3runeGu0dHGIy4pR2kPks0Y2JhGyO5X/mf8=
X-Google-Smtp-Source: ABdhPJy0PqBOhSIghAXenGvPSDFKpv3ELLl4qDpKLDWSLM848W/udm1CcZMBIEaTQKhHnIhJtMmJc+qggDR4fUIbpTs=
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr4137231pjr.179.1618308018887;
 Tue, 13 Apr 2021 03:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617699755.git.bobwxc@email.cn> <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
 <CAMU9jJpeyNBMg4a0GcyBZfPLtP2JheTD-JZ3e197VweyYhv-jg@mail.gmail.com> <20210413053407.GA19607@bobwxc.top>
In-Reply-To: <20210413053407.GA19607@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Tue, 13 Apr 2021 18:00:08 +0800
Message-ID: <CAMU9jJoweHOK1XwWySEY-4q9K+LOPF4kHH7UsKhOCbM0zyci1Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] docs/zh_CN: Add translation zh_CN/doc-guide/parse-headers.rst
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KV3UgWC5D
LiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDEz5pel5ZGo5LqMIOS4i+WNiDE6MzTl
hpnpgZPvvJoNCg0KDQo+DQo+IE9uIFR1ZSwgQXByIDEzLCAyMDIxIGF0IDEyOjEyOjMyQU0gKzA4
MDAsIHRlbmcgc3Rlcmxpbmcgd3JvdGU6DQo+ID4gV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWls
LmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiL5Y2IMzo1MeWGmemBk++8mg0KPiA+ID4N
Cj4gPiA+IEFkZCBuZXcgdHJhbnNsYXRpb24NCj4gPiA+ICAgRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vZG9jLWd1aWRlL3BhcnNlLWhlYWRlcnMucnN0DQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiA+ID4gLS0tDQo+
ID4gPiAgLi4uL3poX0NOL2RvYy1ndWlkZS9wYXJzZS1oZWFkZXJzLnJzdCAgICAgICAgIHwgMTgy
ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9kb2MtZ3VpZGUvcGFyc2UtaGVhZGVycy5yc3QNCj4gPiA+DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9jLWd1aWRlL3BhcnNlLWhl
YWRlcnMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9jLWd1aWRlL3Bh
cnNlLWhlYWRlcnMucnN0DQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi40ZjZmYTA4M2EzYzUNCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9wYXJzZS1oZWFk
ZXJzLnJzdA0KPiA+ID4gQEAgLTAsMCArMSwxODIgQEANCj4gWy4uLl0NCj4gPiA+ICsNCj4gPiA+
ICsNCj4gPiA+ICvor7TmmI4NCj4gPiA+ICt+fn5+fg0KPiA+ID4gKw0KPiA+ID4gKw0KPiA+ID4g
K+mAmui/h+aPj+i/sEFQSeeahOaWh+aho+S4reeahOacieS6pOWPieW8leeUqOeahOino+aekOWQ
juaWh+acrOWdl++8jOWwhkPlpLTmlofku7bmiJbmupDmlofku7bvvIg8Q+aWh+S7tj7vvIkNCj4N
Cj4gPiBUaGlzIGxpbmUgaXMgZGlmZmljdWx0IGZvciBtZSB0byB1bmRlcnN0YW5kLCBhbmQgaXQg
c2VlbXMgdG8gc2F5Og0KPiA+IOmAmui/h+ino+aekEPlpLTmlofku7bmiJZD5paH5Lu25Lit5a+5
QVBJ77yI5LiA5Liq5Ye95pWw5Y6f5Z6L77yJ5o+P6L+w55qE5paH5pys5Z2X77yI5Lul5LiA5a6a
5qC85byP57qm5a6a5YaZ55qE5rOo6YeK77yJ4oCm4oCm5YiwUmVTdHJ1Y3R1cmVUZXh044CCDQo+
ID4gSSdtIG5vdCBzdXJlLiAgIO+8mu+8iQ0KPiA+DQo+DQo+IEkgdGhvdWdodCBhZ2FpbiwgbWF5
YmUNCj4NCj4g6YCa6L+HQ+WktOaWh+S7tuaIlua6kOaWh+S7tu+8iDxD5paH5Lu2Pu+8ieS4reS4
uuaPj+i/sEFQSeaWh+aho+e8luWGmeeahA0KPiDluKbkuqTlj4nlvJXnlKjnmoQgLi7pooTmoLzl
vI/ljJbmlofmnKwg5Z2X5bCG5YW26L2s5o2i5oiQUmVTdHJ1Y3R1cmVUZXh044CCDQo+DQo+DQo+
ID4gPiAr6L2s5o2i6L+bUmVTdHJ1Y3R1cmVUZXh044CC5a6D5o6l5Y+X5LiA5Liq5Y+v6YCJ55qE
POS+i+WkluaWh+S7tj7vvIzlhbbkuK3mj4/ov7Dkuoblk6rkupvlhYPntKDlsIbooqvlv73nlaUN
Cj4gPiA+ICvmiJbmjIflkJHpnZ7pu5jorqTlvJXnlKjjgIINCj4gPiA+ICsNCj4gWy4uLl0NCj4g
PiA+IC0tDQo+ID4gPiAyLjIwLjENCj4gPiA+DQo+ID4NCj4gPiBUaGFua3PvvIENCj4gPg0KPiA+
IFlhbiB0ZW5nDQo+DQo=
