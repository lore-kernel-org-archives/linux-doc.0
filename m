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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1F0C432BE
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 244BA611C8
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237147AbhHFCpr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240058AbhHFCpr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:45:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A64C061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:45:32 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id o185so10102743oih.13
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NokwJkE7jNaBhW23q0GhxfceUGY7WfqUP7e8Nn9AHJo=;
        b=iA2vcwFtabs0sGw8VOHvIZdwVKKyjUhq9ucEmOSfuYmsLYA9bFOzr0Y/uKN1kcgqBd
         XzdQJPt+H5L+kVbmP45x3ks5el5kKZrMrSFNMG3WWquFpBn8RTBj9oHhkDrLuqkiTIxS
         vPFVtp6doYyKVsGbsJ0tletDFdJwjifsDrH4GPC0ByvYG7S5JXyarUhPSOPpW3bjk644
         p6j6m6DVUeS3aV7skMIuUEg4vJ2hYsJO0giw43uL02tFELQ4ETdcsaCkBI4A0OXvvPJv
         IpMEKG5Az/u2KNzg0BaGCQB/tpF7SUbdpdLNce641NHvPkL2F7E8hosWjc34bOfUhkt5
         LKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NokwJkE7jNaBhW23q0GhxfceUGY7WfqUP7e8Nn9AHJo=;
        b=OO23e6DsaODo1B+eFp/SdYUjCwH1PaX/HvIrgQ3FbMSf+D2+v51NxKzi7Rloa/iIZc
         0GgtaIP1CrVlxCuD6DHmZ3Lap0jr/N0Qx7i5l/qedmSWx5ZJwrAMCIvo2gyGFq5COrku
         AMbNwz4gLaKPNstrKmNf4XWkqXvQFAuxE9E6s4ss3YM0kOmWpI32RN0aTwuvzSjjbZka
         sLLynqfAhjOZuG/+IA0nb0gRFK/opt4SnVzGOIL0BeygKnmYynq5tDkbwDqp/LeClGMD
         yItM1N42NHMTZfTNQQ6i8vDvzMUhT3Q7WlL0LU+vsw5E7vjLiNh3MeAx+KKEayR1UYap
         JjDg==
X-Gm-Message-State: AOAM5307w3PHdqn2fVpPBOOxpZsSzVaUwkOU8qzKBbQjaCk+XXcMf9wn
        jiSmaAqRYdv+hSovLMV70wRNT8SSt32nP/B4mrU=
X-Google-Smtp-Source: ABdhPJy/TATqv30WGnryhmTtzT9WaZO6FWxrBlRwhteAdreEjW+9z3Gn1iqtIaTPuizsigqbyOTULNB/OvZ6Ux7rEz8=
X-Received: by 2002:a05:6808:209d:: with SMTP id s29mr5715197oiw.103.1628217931279;
 Thu, 05 Aug 2021 19:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
 <CADQR0QgROPTwPMsGcYv9S3hCPD5V7Ym-jZE_SW7gcVSn8bbNjg@mail.gmail.com>
In-Reply-To: <CADQR0QgROPTwPMsGcYv9S3hCPD5V7Ym-jZE_SW7gcVSn8bbNjg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 6 Aug 2021 10:45:21 +0800
Message-ID: <CAEensMyuqRouk3CTWEEBmfgfaDgBeVncaTrHpEnOtxD4ouRgjw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] docs/zh_CN: add infiniband user_verbs translation
To:     Puyu Wang <realpuyuwang@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, chenweiguang82@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UHV5dSBXYW5nIDxyZWFscHV5dXdhbmdAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDbml6Xlkajk
upQg5LiK5Y2IMTA6MjnlhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBBdWcgMSwgMjAyMSBhdCAxMjoy
NSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+IHdyb3RlOg0KPiA+DQo+ID4g
VHJhbnNsYXRlIERvY3VtZW50YXRpb24vaW5maW5pYmFuZC91c2VyX3ZlcmJzLnJzdCBpbnRvIENo
aW5lc2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+DQo+IFJldmlld2VkLWJ5OiBQdXl1IFdhbmcgPHJlYWxwdXl1d2FuZ0BnbWFpbC5j
b20+DQo+ID4gLS0tDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC9pbmRl
eC5yc3QgICB8ICAzICstDQo+ID4gIC4uLi96aF9DTi9pbmZpbmliYW5kL3VzZXJfdmVyYnMucnN0
ICAgICAgICAgICB8IDcyICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA3MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC91c2VyX3ZlcmJz
LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZmluaWJhbmQvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vaW5maW5pYmFuZC9pbmRleC5yc3QNCj4gPiBpbmRleCA1NTY0NTE3MWE2NzUuLjU2MzRjYzQ4
Mzc5ZiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9p
bmZpbmliYW5kL2luZGV4LnJzdA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2luZmluaWJhbmQvaW5kZXgucnN0DQo+ID4gQEAgLTI4LDEwICsyOCw5IEBAIGluZmlu
aWJhbmQNCj4gPiAgICAgc3lzZnMNCj4gPiAgICAgdGFnX21hdGNoaW5nDQo+ID4gICAgIHVzZXJf
bWFkDQo+ID4gKyAgIHVzZXJfdmVyYnMNCj4gPg0KPiA+IC1UT0RPTElTVDoNCj4gPg0KPiA+IC0g
ICB1c2VyX3ZlcmJzDQo+ID4NCj4gPiAgLi4gb25seTo6ICBzdWJwcm9qZWN0IGFuZCBodG1sDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5m
aW5pYmFuZC91c2VyX3ZlcmJzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2luZmluaWJhbmQvdXNlcl92ZXJicy5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYmE1ZGI4NWFlNzIyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdXNlcl92
ZXJicy5yc3QNCj4gPiBAQCAtMCwwICsxLDcyIEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNj
bGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2lu
ZmluaWJhbmQvdXNlcl92ZXJicy5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4gKw0KPiA+
ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiArDQo+
ID4gKzrmoKHor5E6DQo+ID4gKw0KPiA+ICsg546L5pmu5a6HIFB1eXUgV2FuZyA8cmVhbHB1eXV3
YW5nQGdtYWlsLmNvbT4NCj4gPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9y
Zz4NCj4gPiArDQo+ID4gKy4uIF9jbl9pbmZpbmliYW5kX3VzZXJfdmVyYnM6DQo+ID4gKw0KPiA+
ICs9PT09PT09PT09PT09PT09PQ0KPiA+ICvnlKjmiLfnqbrpl7R2ZXJic+iuv+mXrg0KPiA+ICs9
PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArICBpYl91dmVyYnPmqKHlnZfvvIzpgJrov4fl
kK/nlKhDT05GSUdfSU5GSU5JQkFORF9VU0VSX1ZFUkJT5p6E5bu677yM5L2/55So5oi356m66Ze0
DQo+ID4gKyAg6YCa6L+H4oCcdmVyYnPigJ3nm7TmjqXorr/pl65JQuehrOS7tu+8jOWmgkluZmlu
aUJhbmTmnrbmnoTop4TojIPnrKwxMeeroOaJgOi/sOOAgg0KPiA+ICsNCj4gPiArICDopoHkvb/n
lKh2ZXJic++8jOmcgOimgWxpYmlidmVyYnPlupPvvIzlj6/ku45odHRwczovL2dpdGh1Yi5jb20v
bGludXgtcmRtYS9yZG1hLWNvcmXjgIINCj4gPiArICBsaWJpYnZlcmJz5YyF5ZCr5LiA5Liq54us
56uL5LqO6K6+5aSH55qEQVBJ77yM55So5LqO5L2/55SoaWJfdXZlcmJz5o6l5Y+j44CCbGliaWJ2
ZXJicw0KPiA+ICsgIOi/mOmcgOimgeS4uuS9oOeahEluZmluaUJhbmTnoazku7bmj5DkvpvpgILl
vZPnmoTni6znq4vkuo7orr7lpIfnmoTlhoXmoLjlkoznlKjmiLfnqbrpl7TpqbHliqjjgILkvovl
poLvvIwNCj4gPiArICDopoHkvb/nlKhNZWxsYW5veCBIQ0HvvIzkvaDpnIDopoHlronoo4VpYl9t
dGhjYeWGheaguOaooeWdl+WSjGxpYm10aGNh55So5oi356m66Ze06amx5Yqo44CCDQo+ID4gKw0K
PiA+ICvnlKjmiLct5YaF5qC46YCa5L+hDQo+ID4gKz09PT09PT09PT09PT0NCj4gPiArDQo+ID4g
KyAg55So5oi356m66Ze06YCa6L+HL2Rldi9pbmZpbmliYW5kL3V2ZXJic07lrZfnrKborr7lpIfk
uI7lhoXmoLjov5vooYzmhaLpgJ/ot6/lvoTjgIHotYTmupDnrqHnkIYNCj4gPiArICDmk43kvZzn
moTpgJrkv6HjgILlv6vpgJ/ot6/lvoTmk43kvZzpgJrluLjmmK/pgJrov4fnm7TmjqXlhpnlhaXn
oazku7blr4TlrZjlmahtbWFwKCnliLDnlKjmiLfnqbrpl7TmnaXlrozmiJANCj4gPiArICDnmoTv
vIzmsqHmnInns7vnu5/osIPnlKjmiJbkuIrkuIvmlofliIfmjaLliLDlhoXmoLjjgIINCj4gPiAr
DQo+ID4gKyAg5ZG95Luk5piv6YCa6L+H5Zyo6L+Z5Lqb6K6+5aSH5paH5Lu25LiK55qEd3JpdGUo
KXPlj5HpgIHnu5nlhoXmoLjnmoTjgIJBQknlnKgNCj4gPiArICBkcml2ZXJzL2luZmluaWJhbmQv
aW5jbHVkZS9pYl91c2VyX3ZlcmJzLmjkuK3lrprkuYnjgILpnIDopoHlhoXmoLjlk43lupTnmoTl
kb3ku6TnmoTnu5MNCj4gPiArICDmnoTljIXlkKvkuIDkuKo2NOS9jeWtl+aute+8jOeUqOadpeS8
oOmAkuS4gOS4quaMh+WQkei+k+WHuue8k+WGsuWMuueahOaMh+mSiOOAgueKtuaAgeS9nOS4undy
aXRlKCnns7vnu5/osIMNCj4gPiArICDnlKjnmoTov5Tlm57lgLzooqvov5Tlm57liLDnlKjmiLfn
qbrpl7TjgIINCj4gPiArDQo+ID4gK+i1hOa6kOeuoeeQhg0KPiA+ICs9PT09PT09PQ0KPiA+ICsN
Cj4gPiArICDnlLHkuo7miYDmnIlJQui1hOa6kOeahOWIm+W7uuWSjOmUgOavgemDveaYr+mAmui/
h+aWh+S7tuaPj+i/sOespuS8oOmAkueahOWRveS7pOWujOaIkOeahO+8jOaJgOS7peWGheaguOWP
r+S7pei3nw0KPiA+ICsgIOi4quWTquS6m+i1hOa6kOiiq+mZhOWKoOWIsOS4gOS4que7meWumuea
hOeUqOaIt+epuumXtOS4iuS4i+aWh+OAgmliX3V2ZXJic+aooeWdl+e7tOaKpOedgGlkcuihqO+8
jOeUqOadpeWcqA0KPiBJIHRoaW5rIGl0IHNob3VsZCBiZSAn6Lef6Liq6YKj5Lqb6KKr6ZmE5Yqg
5Yiw57uZ5a6a55So5oi356m66Ze05LiK5LiL5paH55qE6LWE5rqQJywgaW5zdGVhZCBvZg0KPiDi
gJjot5/ouKrlk6rkupvotYTmupDooqvpmYTliqDliLDkuIDkuKrnu5nlrprnmoTnlKjmiLfnqbrp
l7TkuIrkuIvmlofigJkuDQpva++8jEkgd2lsbCBtb2RpZnkgaXQgaW4gbmV4dCBwYXRjaCB2ZXJz
aW9uLiA+XzwNCg0KVGhhbmtzLA0KDQpZYW50ZW5nDQo=
