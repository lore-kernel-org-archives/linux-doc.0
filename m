Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05D5C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C209360F35
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhHDCgU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbhHDCgU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:36:20 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94795C061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:36:07 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id h1so751217iol.9
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Ol/1bnkwNSNzY0WCsFqtfP0QAlkQrd8yMwK+amqeuY=;
        b=aB5VBvf/3UPlDPgPs+9bR4E7rdIYIMYZ8RrSbRQmcXvSOC8Qs8Z8kNXG53C08YOS/F
         kqIvj9Go4OTU8wAqJ3FzSmavZxH+spVkUt3bS3MQEMzz2zwx0vBH/+5w7dnauDbYcAmo
         Yy3Ym/R1jJnC69PvyNSprzSvks71iKTHSh7lg3g6BmFEw7DxpAQoxlSSgJT5fzu5eG7U
         Xh4dE4YyUTsHLaOjhJV6Jv6zjJ1ZLnbHeBURZ0eDuArO33EkB5gc83MpwdHud1Kl/bIO
         UF1CUI9SK3xTuV58gH+3TQX5kEb6tWjtc2hJlHnafHYdgDgl+e2nNGwRv9/VCFXTbHh+
         1bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Ol/1bnkwNSNzY0WCsFqtfP0QAlkQrd8yMwK+amqeuY=;
        b=WoZKWLcGYCMCzorCh0V8Ry/osKKCjKUNqexWoKMPcXw/28G2i3t90pM+kc7hrdIgne
         WK9+J5BYUO0JaOv/pU77ehRtvsmDEfM3dy55egZScs0SpA53bNbOet745JRXNBQmF5Ng
         n5GCj//l/VZpxvhY+hy7vytEWgJgzbNU2qhczK8VsLxaQus2uQo/pb3+PkmM1jqHDRnH
         2V+BHScmNbrYsncoVACTkBHQiJxdQYsHU2hF/0crP4w0a+tuBaYf7o8MjUih/VSaaCJF
         axWTOVA4EivTW/ifw+YVnBEb97xN6W24RZIlcqnS6ZDLb9Wi7KOcbR7jJs06Oo0XtES/
         VoKA==
X-Gm-Message-State: AOAM5308Ei6ANuiGDvUfnPkcsWkrj59c308M606o3xBV6p1LYbb/UEk1
        nuxt7+tLNspF5RH74IvdRW949lv7VR/7o7thQfQ=
X-Google-Smtp-Source: ABdhPJyyT557ss5oPC3BXAyRVfTU63bpwC4VeX6Fu9E79BN6p5256ZOyYBFBzq/r8N9559PZfs9D7jOXFHvFmq1c7Dw=
X-Received: by 2002:a05:6638:1af:: with SMTP id b15mr21673784jaq.124.1628044567028;
 Tue, 03 Aug 2021 19:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:35:30 +0800
Message-ID: <CAJy-AmntbHamVdhSH=ZPsXVTF+byLDv=jhfBUcppUvkLcXPDjQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] docs/zh_CN: add infiniband user_verbs translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCA4OjI1IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL2luZmluaWJhbmQv
dXNlcl92ZXJicy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5n
IFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96
aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdCAgIHwgIDMgKy0NCj4gIC4uLi96aF9DTi9pbmZpbmli
YW5kL3VzZXJfdmVyYnMucnN0ICAgICAgICAgICB8IDcyICsrKysrKysrKysrKysrKysrKysNCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmli
YW5kL3VzZXJfdmVyYnMucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2luZmluaWJhbmQvaW5kZXgucnN0DQo+IGluZGV4IDU1NjQ1MTcxYTY3NS4u
NTYzNGNjNDgzNzlmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdA0KPiBAQCAtMjgsMTAgKzI4LDkgQEAgaW5m
aW5pYmFuZA0KPiAgICAgc3lzZnMNCj4gICAgIHRhZ19tYXRjaGluZw0KPiAgICAgdXNlcl9tYWQN
Cj4gKyAgIHVzZXJfdmVyYnMNCj4NCj4gLVRPRE9MSVNUOg0KPg0KPiAtICAgdXNlcl92ZXJicw0K
Pg0KPiAgLi4gb25seTo6ICBzdWJwcm9qZWN0IGFuZCBodG1sDQo+DQo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3VzZXJfdmVyYnMucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC91c2VyX3ZlcmJz
LnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJhNWRi
ODVhZTcyMg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2luZmluaWJhbmQvdXNlcl92ZXJicy5yc3QNCj4gQEAgLTAsMCArMSw3MiBAQA0K
PiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi9pbmZpbmliYW5kL3VzZXJfdmVyYnMucnN0DQo+ICsNCj4gKzrnv7vo
r5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsg546L5pmu5a6HIFB1eXUgV2FuZyA8cmVhbHB1
eXV3YW5nQGdtYWlsLmNvbT4NCj4gKyDml7blpY7kuq4gQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5v
cmc+DQo+ICsNCj4gKy4uIF9jbl9pbmZpbmliYW5kX3VzZXJfdmVyYnM6DQo+ICsNCj4gKz09PT09
PT09PT09PT09PT09DQo+ICvnlKjmiLfnqbrpl7R2ZXJic+iuv+mXrg0KPiArPT09PT09PT09PT09
PT09PT0NCj4gKw0KPiArICBpYl91dmVyYnPmqKHlnZfvvIzpgJrov4flkK/nlKhDT05GSUdfSU5G
SU5JQkFORF9VU0VSX1ZFUkJT5p6E5bu677yM5L2/55So5oi356m66Ze0DQo+ICsgIOmAmui/h+KA
nHZlcmJz4oCd55u05o6l6K6/6ZeuSULnoazku7bvvIzlpoJJbmZpbmlCYW5k5p625p6E6KeE6IyD
56ysMTHnq6DmiYDov7DjgIINCj4gKw0KPiArICDopoHkvb/nlKh2ZXJic++8jOmcgOimgWxpYmli
dmVyYnPlupPvvIzlj6/ku45odHRwczovL2dpdGh1Yi5jb20vbGludXgtcmRtYS9yZG1hLWNvcmXj
gIINCj4gKyAgbGliaWJ2ZXJic+WMheWQq+S4gOS4queLrOeri+S6juiuvuWkh+eahEFQSe+8jOeU
qOS6juS9v+eUqGliX3V2ZXJic+aOpeWPo+OAgmxpYmlidmVyYnMNCj4gKyAg6L+Y6ZyA6KaB5Li6
5L2g55qESW5maW5pQmFuZOehrOS7tuaPkOS+m+mAguW9k+eahOeLrOeri+S6juiuvuWkh+eahOWG
heaguOWSjOeUqOaIt+epuumXtOmpseWKqOOAguS+i+Wmgu+8jA0KPiArICDopoHkvb/nlKhNZWxs
YW5veCBIQ0HvvIzkvaDpnIDopoHlronoo4VpYl9tdGhjYeWGheaguOaooeWdl+WSjGxpYm10aGNh
55So5oi356m66Ze06amx5Yqo44CCDQo+ICsNCj4gK+eUqOaIty3lhoXmoLjpgJrkv6ENCj4gKz09
PT09PT09PT09PT0NCj4gKw0KPiArICDnlKjmiLfnqbrpl7TpgJrov4cvZGV2L2luZmluaWJhbmQv
dXZlcmJzTuWtl+espuiuvuWkh+S4juWGheaguOi/m+ihjOaFoumAn+i3r+W+hOOAgei1hOa6kOeu
oeeQhg0KPiArICDmk43kvZznmoTpgJrkv6HjgILlv6vpgJ/ot6/lvoTmk43kvZzpgJrluLjmmK/p
gJrov4fnm7TmjqXlhpnlhaXnoazku7blr4TlrZjlmahtbWFwKCnliLDnlKjmiLfnqbrpl7TmnaXl
rozmiJANCj4gKyAg55qE77yM5rKh5pyJ57O757uf6LCD55So5oiW5LiK5LiL5paH5YiH5o2i5Yiw
5YaF5qC444CCDQo+ICsNCj4gKyAg5ZG95Luk5piv6YCa6L+H5Zyo6L+Z5Lqb6K6+5aSH5paH5Lu2
5LiK55qEd3JpdGUoKXPlj5HpgIHnu5nlhoXmoLjnmoTjgIJBQknlnKgNCj4gKyAgZHJpdmVycy9p
bmZpbmliYW5kL2luY2x1ZGUvaWJfdXNlcl92ZXJicy5o5Lit5a6a5LmJ44CC6ZyA6KaB5YaF5qC4
5ZON5bqU55qE5ZG95Luk55qE57uTDQo+ICsgIOaehOWMheWQq+S4gOS4qjY05L2N5a2X5q6177yM
55So5p2l5Lyg6YCS5LiA5Liq5oyH5ZCR6L6T5Ye657yT5Yay5Yy655qE5oyH6ZKI44CC54q25oCB
5L2c5Li6d3JpdGUoKeezu+e7n+iwgw0KPiArICDnlKjnmoTov5Tlm57lgLzooqvov5Tlm57liLDn
lKjmiLfnqbrpl7TjgIINCj4gKw0KPiAr6LWE5rqQ566h55CGDQo+ICs9PT09PT09PQ0KPiArDQo+
ICsgIOeUseS6juaJgOaciUlC6LWE5rqQ55qE5Yib5bu65ZKM6ZSA5q+B6YO95piv6YCa6L+H5paH
5Lu25o+P6L+w56ym5Lyg6YCS55qE5ZG95Luk5a6M5oiQ55qE77yM5omA5Lul5YaF5qC45Y+v5Lul
6LefDQo+ICsgIOi4quWTquS6m+i1hOa6kOiiq+mZhOWKoOWIsOS4gOS4que7meWumueahOeUqOaI
t+epuumXtOS4iuS4i+aWh+OAgmliX3V2ZXJic+aooeWdl+e7tOaKpOedgGlkcuihqO+8jOeUqOad
peWcqA0KPiArICDlhoXmoLjmjIfpkojlkozkuI3pgI/mmI7nmoTnlKjmiLfnqbrpl7Tlj6Xmn4Tk
uYvpl7Tov5vooYzovazmjaLvvIzov5nmoLflhoXmoLjmjIfpkojlsLHkuI3kvJrmmrTpnLLnu5nn
lKjmiLfnqbrpl7TvvIwNCj4gKyAg6ICM55So5oi356m66Ze05Lmf5peg5rOV5qy66aqX5YaF5qC4
5Y676Lef6Liq5LiA5Liq5YGH55qE5oyH6ZKI44CCDQo+ICsNCj4gKyAg6L+Z5Lmf5YWB6K645YaF
5qC45Zyo5LiA5Liq6L+b56iL6YCA5Ye65pe26L+b6KGM5riF55CG77yM5bm26Ziy5q2i5LiA5Liq
6L+b56iL6Kem5Y+K5Y+m5LiA5Liq6L+b56iL55qE6LWE5rqQ44CCDQo+ICsNCj4gK+WGheWtmOW8
leiEmg0KDQptZW1vcnkgcGlubmluZywgbWVhbnMg5YaF5a2Y5YaF5a656KKr5Zu65a6a77yMIOS4
jeiDveWIoOmZpOaIluiAhemHiuaUvuetie+8jCDmiYDku6XvvIwgcGlubmluZyBzaG91bGQgYmUN
CnRyYW5zbGF0ZWQgYXMg5Zu65a6aIGFzIHlvdXIgdHJhbmxhdGlvbiBpbiBmb2xsb3dpbmcgY29u
dGV4dHMuDQoNCndpdGggdGhpcyBjaGFuZ2UNCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4
c0BrZXJuZWwub3JnPg0KDQpUaGFua3MNCkFsZXgNCg0KPiArPT09PT09PT0NCj4gKw0KPiArICDn
m7TmjqXnmoTnlKjmiLfnqbrpl7RJL0/opoHmsYLkuI7kvZzkuLrmvZzlnKhJL0/nm67moIfnmoTl
hoXlrZjljLrln5/kv53mjIHlnKjlkIzkuIDniannkIblnLDlnYDkuIrjgIJpYl91dmVyYnMNCj4g
KyAg5qih5Z2X6YCa6L+HZ2V0X3VzZXJfcGFnZXMoKeWSjHB1dF9wYWdlKCnosIPnlKjmnaXnrqHn
kIblhoXlrZjljLrln5/nmoTlm7rlrprlkozop6PpmaTlm7rlrprjgILlroPov5jmoLgNCj4gKyAg
566X6L+b56iL55qEcGlubmVkX3Zt5Lit6KKr5Zu65a6a55qE5YaF5a2Y6YeP77yM5bm25qOA5p+l
6Z2e54m55p2D6L+b56iL5piv5ZCm6LaF6L+H5YW2UkxJTUlUX01FTUxPQ0vpmZDliLbjgIINCj4g
Kw0KPiArICDooqvlpJrmrKHlm7rlrprnmoTpobXpnaLlnKjmr4/mrKHooqvlm7rlrprml7bpg73k
vJrooqvorqHmlbDvvIzmiYDku6VwaW5uZWRfdm3nmoTlgLzlj6/og73kvJrpq5jkvLDkuIDkuKro
v5vnqIvmiYANCj4gKyAg5Zu65a6a55qE6aG16Z2i5pWw6YeP44CCDQo+ICsNCj4gKy9kZXbmlofk
u7YNCj4gKz09PT09PT09DQo+ICsNCj4gKyAg6KaB5oOz55SodWRlduiHquWKqOWIm+W7uumAguW9
k+eahOWtl+espuiuvuWkh+aWh+S7tu+8jOWPr+S7pemHh+eUqOWmguS4i+inhOWImTo6DQo+ICsN
Cj4gKyAgICBLRVJORUw9PSJ1dmVyYnMqIiwgTkFNRT0iaW5maW5pYmFuZC8layINCj4gKw0KPiAr
ICDlj6/ku6Xkvb/nlKjjgIIg6L+Z5bCG5Yib5bu66K6+5aSH6IqC54K577yM5ZCN5Li6OjoNCj4g
Kw0KPiArICAgIC9kZXYvaW5maW5pYmFuZC91dmVyYnMwDQo+ICsNCj4gKyAg562J562J44CC55Sx
5LqOSW5maW5pQmFuZOeahOeUqOaIt+epuumXtHZlcmJz5a+55LqO6Z2e54m55p2D6L+b56iL5p2l
6K+05bqU6K+l5piv5a6J5YWo55qE77yM5Zug5q2k5ZyodWRlduinhA0KPiArICDliJnkuK3liqDl
haXpgILlvZPnmoRNT0RF5oiWR1JPVVDlj6/og73mmK/mnInnlKjnmoTjgIINCj4gLS0NCj4gMi4y
Ny4wDQo+DQo=
