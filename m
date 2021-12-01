Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7148CC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Dec 2021 08:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbhLAIfN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Dec 2021 03:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhLAIfJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 03:35:09 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E709C061574
        for <linux-doc@vger.kernel.org>; Wed,  1 Dec 2021 00:31:49 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id x10so29711739ioj.9
        for <linux-doc@vger.kernel.org>; Wed, 01 Dec 2021 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2orbIXPJRQAXqoPxwJlFfCUZ7P7D3S/hps/N3hW0KKo=;
        b=V3povEe0HXhLDmhYeiPtYC9zzUhqaZdHsrK1RiJ+/ue5YrzWqU+KRjz1mE/8KEYcJW
         V3a4cxYdDpKRg9GjTJzCeimXUI0+EWoRHTgCSLq67Gquw5zYIyn5ZqFYHrQQ2gQJShhm
         kAUibQAgDhrLDbsPtnkYDUpVW1QLZc9kiKoNWzuT9+SrkeIbAFGlUD52Vt4RFqdRdDgZ
         OzfLKv4jc34JtB7qZv/zcWNMaQaTupMq32xGezlb4Jsglk1pZLGgJ8XbBzjzfS1bAVe7
         TJwzDKphG0ucBFvHWGJLdMMCpTGMjqFAUumDIkngGCJRLwN19slqwHRzHSWSMkna4Ani
         AJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2orbIXPJRQAXqoPxwJlFfCUZ7P7D3S/hps/N3hW0KKo=;
        b=xP7EJ9SN2z2WU/WB0sCyaLHJXxAjy8Hcs4kLVGAj65fO6rDZ76ou/Gf9hWqvaCFGkK
         z0g8P8pp3ebxQWYpLZqwavpIv5+3rKrVTDPrh0SX8NNQoevkQxHtYXX0C1th3zjf0O6X
         L2NlF3PNDdLtxyB4gwzmCQfMhv/c9Z0Zmv3IBraUawG1qIL1y2ZgMwTuGHhUs+vCjzz2
         ldO+IePMlQZ1MlUoPc0KnGN2N9JcuCBoxvPQdNAMS40vsRrsuNS0X4/6wL7eAKB8h8Rr
         PD8Q0/9kO6qYzHOY18prrteMytBDJeoIE7aAD3M93JT8mlpCGkqSBSIY30bHbOyR34Pw
         QJiA==
X-Gm-Message-State: AOAM5313gkngza1k5jxX9I77sg01QLkqX1L/3rvaxFRIyzm4pbLo+5SQ
        MTK3RF4aXdypM7Ntko8nthyOcV0bUwu/JmNkUgk=
X-Google-Smtp-Source: ABdhPJxBtgOO1g683eNsJ0tNaNZqxhCWarfCETmk5CtU3mLpudqQqUV5Nm+DSlvBDi/RtHK5zXmo13iHa3P9gpjdlEk=
X-Received: by 2002:a05:6638:3182:: with SMTP id z2mr7636687jak.134.1638347508403;
 Wed, 01 Dec 2021 00:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20211130153400.6409-1-tangyizhou@huawei.com>
In-Reply-To: <20211130153400.6409-1-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 1 Dec 2021 16:31:12 +0800
Message-ID: <CAJy-Amk1iYsJQcerQG+JCE-ARyyvtUYGLminhZhW6aBj1vfSNQ@mail.gmail.com>
Subject: Re: [PATCH] doc/zh-CN: Update cpu-freq/core.rst to make it more readable
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBOb3YgMzAsIDIwMjEgYXQgMTE6MDYgUE0gVGFuZyBZaXpob3UgPHRhbmd5aXpob3VA
aHVhd2VpLmNvbT4gd3JvdGU6DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmcgWWl6aG91IDx0YW5n
eWl6aG91QGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUt
ZnJlcS9jb3JlLnJzdCAgICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdA0KPiBpbmRl
eCAwYzZmZDQ0N2NlZDYuLmJmODNjYWQ3MGI2OCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gQEAgLTI5LDEwICsy
OSwxMCBAQCBDUFVGcmVx5qC45b+D5ZKMQ1BVRnJlcemAmuefpeWZqOeahOmAmueUqOivtOaYjg0K
PiAgPT09PT09PT09PT09PT09PT09PT09PQ0KPg0KPiAgY3B1ZnJlceaguOW/g+S7o+eggeS9jeS6
jmRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmPkuK3jgILov5nkuptjcHVmcmVx5Luj56CB5Li6Q1BV
RnJlceaetuaehOeahOmpsQ0KPiAt5Yqo56iL5bqP77yI6YKj5Lqb5pON5L2c56Gs5Lu25YiH5o2i
6aKR546H55qE5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmaggIuaPkOS+m+S6huS4gOS4quagh+WH
huWMlueahOaOpeWPo+OAgg0KPiAt6L+Z5Lqb5piv6K6+5aSH6amx5Yqo56iL5bqP5oiW6ZyA6KaB
5LqG6Kej562W55Wl5Y+Y5YyW55qE5YW25a6D5YaF5qC46YOo5YiG77yI5aaCIEFDUEkg54Ot6YeP
566h55CG77yJ5oiW5omA5pyJ6aKR546H5pu05pS577yI6ZmkDQo+IC3orqHml7bku6PnoIHlpJbv
vInvvIznlJroh7PpnIDopoHlvLrliLbnoa7lrprpgJ/luqbpmZDliLbnmoTpgJrnn6XlmajvvIjl
poIgQVJNIOaetuaehOS4iueahCBMQ0Qg6amx5Yqo56iL5bqP77yJ44CCDQo+IC3mraTlpJbvvIwg
5YaF5qC4ICLluLjmlbAiIGxvb3BzX3Blcl9qaWZmeeS8muagueaNrumikeeOh+WPmOWMluiAjOab
tOaWsOOAgg0KPiAr5Yqo56iL5bqP77yI6YKj5Lqb5omn6KGM56Gs5Lu26aKR546H5YiH5o2i55qE
5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmagiIOaPkOS+m+S6huS4gOS4quagh+WHhuWMlueahOaO
peWPo+OAgg0KPiAr5YyF5ous6K6+5aSH6amx5Yqo56iL5bqP77yb6ZyA6KaB5LqG6Kej562W55Wl
5Y+Y5YyW77yI5aaCIEFDUEkg54Ot6YeP566h55CG77yJ77yM5oiW5omA5pyJ6aKR546H5Y+Y5YyW
77yI5aaC6K6h5pe25Luj56CB77yJ77yMDQo+ICvnlJroh7PpnIDopoHlvLrliLbpmZDliLbkuLrm
jIflrprpopHnjofvvIjlpoIgQVJNIOaetuaehOS4iueahCBMQ0Qg6amx5Yqo56iL5bqP77yJ55qE
5YW25a6D5YaF5qC457uE5Lu244CCDQo+ICvmraTlpJbvvIzlhoXmoLggIuW4uOaVsCIgbG9vcHNf
cGVyX2ppZmZ5IOS8muagueaNrumikeeOh+WPmOWMluiAjOabtOaWsOOAgg0KPg0KPiAgY3B1ZnJl
ceetlueVpeeahOW8leeUqOiuoeaVsOeUsSBjcHVmcmVxX2NwdV9nZXQg5ZKMIGNwdWZyZXFfY3B1
X3B1dCDmnaXlrozmiJDvvIzku6Xnoa7kv50gY3B1ZnJlcSDpqbENCj4gIOWKqOeoi+W6j+iiq+at
o+ehruWcsOazqOWGjOWIsOaguOW/g+S4re+8jOW5tuS4lOmpseWKqOeoi+W6j+WcqCBjcHVmcmVx
X3B1dF9jcHUg6KKr6LCD55So5LmL5YmN5LiN5Lya6KKr5Y246L2944CC6L+Z5Lmf5L+d6K+BDQo+
IEBAIC00MSw3ICs0MSw3IEBAIGNwdWZyZXHnrZbnlaXnmoTlvJXnlKjorqHmlbDnlLEgY3B1ZnJl
cV9jcHVfZ2V0IOWSjCBjcHVmcmVxX2NwdV9wdXQg5p2l5a6M5oiQ77yMDQo+ICAyLiBDUFVGcmVx
IOmAmuefpeWZqA0KPiAgPT09PT09PT09PT09PT09PT09PT0NCj4NCj4gLUNQVUZyZXHpgJrnn6Xl
majnrKblkIjmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gK0NQVUZyZXHpgJrn
n6XlmajpgbXlvqrmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gIOWFs+S6jumA
muefpeWZqOeahOe7huiKguivt+WPgumYhSBsaW51eC9pbmNsdWRlL2xpbnV4L25vdGlmaWVyLmjj
gIINCj4NCj4gIOi/memHjOacieS4pOS4quS4jeWQjOeahENQVWZyZXHpgJrnn6XlmaggLSDnrZbn
laXpgJrnn6XlmajlkozovazmjaLpgJrnn6XlmajjgIINCj4gQEAgLTY5LDIwICs2OSwyMCBAQCBD
UFVGcmVx6YCa55+l5Zmo56ym5ZCI5qCH5YeG55qE5YaF5qC46YCa55+l5Zmo5o6l5Y+j44CCDQo+
DQo+ICDnrKzkuInkuKrlj4LmlbDmmK/kuIDkuKrljIXlkKvlpoLkuIvlgLznmoTnu5PmnoTkvZNj
cHVmcmVxX2ZyZXFz77yaDQo+DQo+IC09PT09PSAgPT09PT09PT09PT09PT09PT09PT0NCj4gLWNw
dSAgICDlj5flvbHlk41jcHXnmoTnvJblj7cNCj4gKz09PT09PSA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQoNCkxHVE0sDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5l
bC5vcmc+DQoNCkJUVywgcGxlYXNlIG1ha2Ugc3VyZSB0aGUgJz0nIGNvdW50IGlzIHJpZ2h0LiAt
LSBJIGRpZG4ndCBjb3VudCB0aGVtLiA6KQ0KDQo+ICtwb2xpY3kg5oyH5ZCRc3RydWN0IGNwdWZy
ZXFfcG9saWN555qE5oyH6ZKIDQo+ICBvbGQgICAg5pen6aKR546HDQo+ICBuZXcgICAg5paw6aKR
546HDQo+ICBmbGFncyAgY3B1ZnJlcempseWKqOeahOagh+W/lw0KPiAtPT09PT0gID09PT09PT09
PT09PT09PT09PT09DQo+ICs9PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
Pg0KPiAgMy4g5ZCr5pyJT3BlcmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJl
ceihqOeahOeUn+aIkA0KPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICDlhbPkuo5PUFDnmoTnu4boioLor7flj4Lp
mIUgRG9jdW1lbnRhdGlvbi9wb3dlci9vcHAucnN0DQo+DQo+ICBkZXZfcG1fb3BwX2luaXRfY3B1
ZnJlcV90YWJsZSAtDQo+IC0gICAgICAg6L+Z5Liq5Yqf6IO95o+Q5L6b5LqG5LiA5Liq6ZqP5pe2
5Y+v55So55qE6L2s5o2i56iL5bqP77yM55So5p2l5bCGT1BQ5bGC5YWz5LqO5Y+v55So6aKR546H
55qE5YaF6YOo5L+h5oGv57+76K+R5oiQ5LiA56eN5a655piT5o+Q5L6b57uZDQo+IC0gICAgICAg
Y3B1ZnJlceeahOagvOW8j+OAgg0KPiArICAgICAgIOi/meS4quWHveaVsOaPkOS+m+S6huS4gOS4
qumaj+aXtuWPr+eUqOeahOi9rOaNouS+i+eoi++8jOeUqOadpeWwhk9QUOWxguWFs+S6juWPr+eU
qOmikeeOh+eahOWGhemDqOS/oeaBr+e/u+ivkeaIkOS4gOenjQ0KPiArICAgICAgIGNwdWZyZXHm
mJPkuo7nkIbop6PmoLzlvI/jgIINCj4NCj4gICAgICAgICAuLiBXYXJuaW5nOjoNCj4NCj4gLS0N
Cj4gMi4xNy4xDQo+DQo=
