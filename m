Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B755C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D652560F35
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbhHDGiZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 02:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235419AbhHDGiZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 02:38:25 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C76C0613D5
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 23:38:12 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id f33-20020a4a89240000b029027c19426fbeso301516ooi.8
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X7CJOTyovliGNx6JCBvbggR3BFPZ/d6d2unxclEqPJ4=;
        b=IQq9SCPfRa8WBy7NvQRUqr5BMhS7qp4ZJ5AMu9K5u1UqQewnwuM2fzyGeDnt5B3duK
         Er3ta9lIECgBj3mF92rWTY5i6NQN9YT7z+cex4GDopo4ZjIFWhB4GJySaH1QPWJAvB7N
         wt0VhNtbhepulsCLF/lF6zhbe+00IbvlKaXnhFyyypUj4ebrwWbFiVF5UghAiC4yyJey
         A9mdNLKj4/vbBWzZTPwTE0H6ABUO0LUM1WADR0rwLIlALvovXOr1JlDT73JLV5sNr+s0
         ndCIExQjCaQK53LeZSBA1U5/YVGrD3nJKWTkD60n0gPl/MkqIVf7FS50GurrO60piLwz
         9TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X7CJOTyovliGNx6JCBvbggR3BFPZ/d6d2unxclEqPJ4=;
        b=NAsfW9LojyJsrwC59eU7Gaj7jj8OA67USzQJLEx31QfOer8RMoXcl1tzI7fd+mLLXZ
         sgwOdppnaJf/ts+KQEdpftu4FOccmMHyZWV9i0VIU38JnlMVH0QDQQNiys/3dPZaSgNm
         bj69NeFZrktGwJFDg3sfvfwoAsbx/jSo+bbWPlGjzbOKgGTsWgiICivz++6sVLOxhgL2
         ujcxi3AUq222L+c8kg1/PtUCk4fTAAOqqGjdZZMHW4H1uzjF4GOAYvEodL7ap7y3kdym
         o0xQ9j27FNvOWf1dkWXSO0VfvKV90ahhsVEl2G+467i5o/pFla41qvZTufjxBqZTrU4h
         8rzQ==
X-Gm-Message-State: AOAM531c81vZdCQASQVWpZz1dlz0LJ/jiNAItFOBDZGKnwqqLWWIU3Qz
        oOLZTyQvlHsV4S8CJ0zPuzLy1E7kbaWUmdQuWh8=
X-Google-Smtp-Source: ABdhPJyijnqyrHUsiIshGFAOAthIDoCkweJBFRRAlzbWiAvpyyFVW/4WgV5AT83FtYsDSJiPOOKqxgvKsevRd3Oc+h8=
X-Received: by 2002:a4a:b04c:: with SMTP id g12mr6109018oon.3.1628059092221;
 Tue, 03 Aug 2021 23:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
 <CAJy-AmntbHamVdhSH=ZPsXVTF+byLDv=jhfBUcppUvkLcXPDjQ@mail.gmail.com>
In-Reply-To: <CAJy-AmntbHamVdhSH=ZPsXVTF+byLDv=jhfBUcppUvkLcXPDjQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 4 Aug 2021 14:38:02 +0800
Message-ID: <CAEensMywN6voPpNEaY8Mk8NE97NZRNzU+DGrR5aQ5eGwCq2xBg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] docs/zh_CN: add infiniband user_verbs translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDTml6XlkajkuIkg5LiK
5Y2IMTA6MzblhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBBdWcgMSwgMjAyMSBhdCA4OjI1IFBNIFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+ID4NCj4gPiBUcmFuc2xh
dGUgRG9jdW1lbnRhdGlvbi9pbmZpbmliYW5kL3VzZXJfdmVyYnMucnN0IGludG8gQ2hpbmVzZS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5j
bj4NCj4gPiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL2luZGV4
LnJzdCAgIHwgIDMgKy0NCj4gPiAgLi4uL3poX0NOL2luZmluaWJhbmQvdXNlcl92ZXJicy5yc3Qg
ICAgICAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDczIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3VzZXJfdmVyYnMu
cnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vaW5maW5pYmFuZC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9pbmZpbmliYW5kL2luZGV4LnJzdA0KPiA+IGluZGV4IDU1NjQ1MTcxYTY3NS4uNTYzNGNjNDgz
NzlmIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lu
ZmluaWJhbmQvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vaW5maW5pYmFuZC9pbmRleC5yc3QNCj4gPiBAQCAtMjgsMTAgKzI4LDkgQEAgaW5maW5p
YmFuZA0KPiA+ICAgICBzeXNmcw0KPiA+ICAgICB0YWdfbWF0Y2hpbmcNCj4gPiAgICAgdXNlcl9t
YWQNCj4gPiArICAgdXNlcl92ZXJicw0KPiA+DQo+ID4gLVRPRE9MSVNUOg0KPiA+DQo+ID4gLSAg
IHVzZXJfdmVyYnMNCj4gPg0KPiA+ICAuLiBvbmx5OjogIHN1YnByb2plY3QgYW5kIGh0bWwNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZp
bmliYW5kL3VzZXJfdmVyYnMucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
aW5maW5pYmFuZC91c2VyX3ZlcmJzLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5iYTVkYjg1YWU3MjINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC91c2VyX3Zl
cmJzLnJzdA0KPiA+IEBAIC0wLDAgKzEsNzIgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2Ns
YWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vaW5m
aW5pYmFuZC91c2VyX3ZlcmJzLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4g
PiArOuagoeivkToNCj4gPiArDQo+ID4gKyDnjovmma7lrocgUHV5dSBXYW5nIDxyZWFscHV5dXdh
bmdAZ21haWwuY29tPg0KPiA+ICsg5pe25aWO5LquIEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3Jn
Pg0KPiA+ICsNCj4gPiArLi4gX2NuX2luZmluaWJhbmRfdXNlcl92ZXJiczoNCj4gPiArDQo+ID4g
Kz09PT09PT09PT09PT09PT09DQo+ID4gK+eUqOaIt+epuumXtHZlcmJz6K6/6ZeuDQo+ID4gKz09
PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICsgIGliX3V2ZXJic+aooeWdl++8jOmAmui/h+WQ
r+eUqENPTkZJR19JTkZJTklCQU5EX1VTRVJfVkVSQlPmnoTlu7rvvIzkvb/nlKjmiLfnqbrpl7QN
Cj4gPiArICDpgJrov4figJx2ZXJic+KAneebtOaOpeiuv+mXrklC56Gs5Lu277yM5aaCSW5maW5p
QmFuZOaetuaehOinhOiMg+esrDEx56ug5omA6L+w44CCDQo+ID4gKw0KPiA+ICsgIOimgeS9v+eU
qHZlcmJz77yM6ZyA6KaBbGliaWJ2ZXJic+W6k++8jOWPr+S7jmh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eC1yZG1hL3JkbWEtY29yZeOAgg0KPiA+ICsgIGxpYmlidmVyYnPljIXlkKvkuIDkuKrni6zn
q4vkuo7orr7lpIfnmoRBUEnvvIznlKjkuo7kvb/nlKhpYl91dmVyYnPmjqXlj6PjgIJsaWJpYnZl
cmJzDQo+ID4gKyAg6L+Y6ZyA6KaB5Li65L2g55qESW5maW5pQmFuZOehrOS7tuaPkOS+m+mAguW9
k+eahOeLrOeri+S6juiuvuWkh+eahOWGheaguOWSjOeUqOaIt+epuumXtOmpseWKqOOAguS+i+Wm
gu+8jA0KPiA+ICsgIOimgeS9v+eUqE1lbGxhbm94IEhDQe+8jOS9oOmcgOimgeWuieijhWliX210
aGNh5YaF5qC45qih5Z2X5ZKMbGlibXRoY2HnlKjmiLfnqbrpl7TpqbHliqjjgIINCj4gPiArDQo+
ID4gK+eUqOaIty3lhoXmoLjpgJrkv6ENCj4gPiArPT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr
ICDnlKjmiLfnqbrpl7TpgJrov4cvZGV2L2luZmluaWJhbmQvdXZlcmJzTuWtl+espuiuvuWkh+S4
juWGheaguOi/m+ihjOaFoumAn+i3r+W+hOOAgei1hOa6kOeuoeeQhg0KPiA+ICsgIOaTjeS9nOea
hOmAmuS/oeOAguW/q+mAn+i3r+W+hOaTjeS9nOmAmuW4uOaYr+mAmui/h+ebtOaOpeWGmeWFpeeh
rOS7tuWvhOWtmOWZqG1tYXAoKeWIsOeUqOaIt+epuumXtOadpeWujOaIkA0KPiA+ICsgIOeahO+8
jOayoeacieezu+e7n+iwg+eUqOaIluS4iuS4i+aWh+WIh+aNouWIsOWGheaguOOAgg0KPiA+ICsN
Cj4gPiArICDlkb3ku6TmmK/pgJrov4flnKjov5nkupvorr7lpIfmlofku7bkuIrnmoR3cml0ZSgp
c+WPkemAgee7meWGheaguOeahOOAgkFCSeWcqA0KPiA+ICsgIGRyaXZlcnMvaW5maW5pYmFuZC9p
bmNsdWRlL2liX3VzZXJfdmVyYnMuaOS4reWumuS5ieOAgumcgOimgeWGheaguOWTjeW6lOeahOWR
veS7pOeahOe7kw0KPiA+ICsgIOaehOWMheWQq+S4gOS4qjY05L2N5a2X5q6177yM55So5p2l5Lyg
6YCS5LiA5Liq5oyH5ZCR6L6T5Ye657yT5Yay5Yy655qE5oyH6ZKI44CC54q25oCB5L2c5Li6d3Jp
dGUoKeezu+e7n+iwgw0KPiA+ICsgIOeUqOeahOi/lOWbnuWAvOiiq+i/lOWbnuWIsOeUqOaIt+ep
uumXtOOAgg0KPiA+ICsNCj4gPiAr6LWE5rqQ566h55CGDQo+ID4gKz09PT09PT09DQo+ID4gKw0K
PiA+ICsgIOeUseS6juaJgOaciUlC6LWE5rqQ55qE5Yib5bu65ZKM6ZSA5q+B6YO95piv6YCa6L+H
5paH5Lu25o+P6L+w56ym5Lyg6YCS55qE5ZG95Luk5a6M5oiQ55qE77yM5omA5Lul5YaF5qC45Y+v
5Lul6LefDQo+ID4gKyAg6Liq5ZOq5Lqb6LWE5rqQ6KKr6ZmE5Yqg5Yiw5LiA5Liq57uZ5a6a55qE
55So5oi356m66Ze05LiK5LiL5paH44CCaWJfdXZlcmJz5qih5Z2X57u05oqk552AaWRy6KGo77yM
55So5p2l5ZyoDQo+ID4gKyAg5YaF5qC45oyH6ZKI5ZKM5LiN6YCP5piO55qE55So5oi356m66Ze0
5Y+l5p+E5LmL6Ze06L+b6KGM6L2s5o2i77yM6L+Z5qC35YaF5qC45oyH6ZKI5bCx5LiN5Lya5pq0
6Zyy57uZ55So5oi356m66Ze077yMDQo+ID4gKyAg6ICM55So5oi356m66Ze05Lmf5peg5rOV5qy6
6aqX5YaF5qC45Y676Lef6Liq5LiA5Liq5YGH55qE5oyH6ZKI44CCDQo+ID4gKw0KPiA+ICsgIOi/
meS5n+WFgeiuuOWGheaguOWcqOS4gOS4qui/m+eoi+mAgOWHuuaXtui/m+ihjOa4heeQhu+8jOW5
tumYsuatouS4gOS4qui/m+eoi+inpuWPiuWPpuS4gOS4qui/m+eoi+eahOi1hOa6kOOAgg0KPiA+
ICsNCj4gPiAr5YaF5a2Y5byV6ISaDQo+DQo+IG1lbW9yeSBwaW5uaW5nLCBtZWFucyDlhoXlrZjl
hoXlrrnooqvlm7rlrprvvIwg5LiN6IO95Yig6Zmk5oiW6ICF6YeK5pS+562J77yMIOaJgOS7pe+8
jCBwaW5uaW5nIHNob3VsZCBiZQ0KPiB0cmFuc2xhdGVkIGFzIOWbuuWumiBhcyB5b3VyIHRyYW5s
YXRpb24gaW4gZm9sbG93aW5nIGNvbnRleHRzLg0KPg0KPiB3aXRoIHRoaXMgY2hhbmdlDQo+DQo+
IFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4NCk9LIQ0KVGhhbmsg
eW91IGZvciB5b3VyIHJldmlldyENCg0KVGhhbmtzLA0KDQpZYW50ZW5nDQo=
