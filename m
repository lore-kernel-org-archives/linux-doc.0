Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3885C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 02:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236400AbhLCCdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 21:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234029AbhLCCdW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 21:33:22 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F0AC06174A
        for <linux-doc@vger.kernel.org>; Thu,  2 Dec 2021 18:29:59 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so4003791pjc.4
        for <linux-doc@vger.kernel.org>; Thu, 02 Dec 2021 18:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ACaOq6NHOd6xNKMYIpF98zNiyrhmyTXomlmZv9PbDJ0=;
        b=Ne8qMBrwg23PUonLSAK2Xa/mhvdEDEKnMc4vkCrKAaxumKYQr4PXWNiJqTY1bHNohy
         BScGk0uhv7SLkJhSzbcfZKy7qozC2RHqrpXyYJZF5z7LpBpNK9hDIWmQ+ePkJEh45Ny6
         5gRuXhuVm4OuH+MxXZTKyDrpFP6F/Kd1YrTAgZ8lw+sbxSKC6j/Xj0W9LB7EC0NszLt2
         EL4aCsih2+4tEx/aLLyhmXnVpahoAPKXIU0TSODxGbPCWe8LEpHCYh49KfzVW2fNQzp0
         UyYuqzntGsvASWBmkT/l8bTPIEEkY4g0wmWOeP5T4+TRAzJggYCgsJNmlqa3Dti4WqhR
         F2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ACaOq6NHOd6xNKMYIpF98zNiyrhmyTXomlmZv9PbDJ0=;
        b=8EcYYBEQaeGeCcDo41hj6fLMHygDE//IJvFj+bBzpU/Ifi93gYGTT8O0hQaMYkjah8
         bEwcXxtMnvrvIUJbvA7t5sc+ndfbvPvlmkvbvzHu+1WPJ8BwzmdtAOGKSO+la19o7woq
         lH4VCAb09NS8TDPdCUnNwNukY2eZ8B/QdFxxBNrVgFtAWk1ypSomDqyoGJOPZaarYWx+
         u9W9Y+4XA4JuRN6QOVIMKO6Ze1v2wYlIdBY2Ifwh+zv55NrDoAtjF4XjpnBUrn3+QtRw
         UWHB07n9cbM3KMA9xxrJ2cz1hNArfZWo5/YAV8733RtICo3tbbbxhDkprdtIxbeuJwbu
         xERA==
X-Gm-Message-State: AOAM532G8U4f5JQhHkg2/ctKhXkeXHjj/9iucKIJSns3KRp3pMwgy0QE
        79VAQdrQ1797KcEgyz9kVj962aMbivwnBkf4cWe8NlmW
X-Google-Smtp-Source: ABdhPJx2Co3Z2yVIUlH66UOSB799LM4v2TYqob8E9+kpxzzTpxbK2n8l+1tr9OFTRLMWf12yZzEb3mRbZhD68nTWYEI=
X-Received: by 2002:a17:90a:6b44:: with SMTP id x4mr10496536pjl.27.1638498598546;
 Thu, 02 Dec 2021 18:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20211130153400.6409-1-tangyizhou@huawei.com> <CAMU9jJpVH3aX--zfOhWuT3taS3MPQ37LT_FS6FREr45yA+Li2Q@mail.gmail.com>
 <284a4410-51f9-ff54-b903-9cae7ec17f6e@huawei.com>
In-Reply-To: <284a4410-51f9-ff54-b903-9cae7ec17f6e@huawei.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 3 Dec 2021 10:29:47 +0800
Message-ID: <CAMU9jJr6V=tXCbX9ftfJXf8CP78VUz6Li5VQwpTC0=kZgJpCCw@mail.gmail.com>
Subject: Re: [PATCH] doc/zh-CN: Update cpu-freq/core.rst to make it more readable
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        tangyeechou@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyIMuaXpeWR
qOWbmyAyMDoyNuWGmemBk++8mg0KPg0KPiBPbiAyMDIxLzEyLzIgMTc6NTMsIHRlbmcgc3Rlcmxp
bmcgd3JvdGU6DQo+ID4gVGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAy
MeW5tDEy5pyIMeaXpeWRqOS4iSDkuIvljYg5OjUx5YaZ6YGT77yaDQo+ID4+DQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IFRhbmcgWWl6aG91IDx0YW5neWl6aG91QGh1YXdlaS5jb20+DQo+ID4+IC0tLQ0K
PiA+PiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdCAgICAgIHwgMjAg
KysrKysrKysrLS0tLS0tLS0tLQ0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdA0KPiA+PiBpbmRleCAwYzZmZDQ0N2Nl
ZDYuLmJmODNjYWQ3MGI2OCAxMDA2NDQNCj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gPj4gQEAgLTI5LDEwICsyOSwx
MCBAQCBDUFVGcmVx5qC45b+D5ZKMQ1BVRnJlcemAmuefpeWZqOeahOmAmueUqOivtOaYjg0KPiA+
PiAgPT09PT09PT09PT09PT09PT09PT09PQ0KPiA+Pg0KPiA+PiAgY3B1ZnJlceaguOW/g+S7o+eg
geS9jeS6jmRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmPkuK3jgILov5nkuptjcHVmcmVx5Luj56CB
5Li6Q1BVRnJlceaetuaehOeahOmpsQ0KPiA+PiAt5Yqo56iL5bqP77yI6YKj5Lqb5pON5L2c56Gs
5Lu25YiH5o2i6aKR546H55qE5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmaggIuaPkOS+m+S6huS4
gOS4quagh+WHhuWMlueahOaOpeWPo+OAgg0KPiA+PiAt6L+Z5Lqb5piv6K6+5aSH6amx5Yqo56iL
5bqP5oiW6ZyA6KaB5LqG6Kej562W55Wl5Y+Y5YyW55qE5YW25a6D5YaF5qC46YOo5YiG77yI5aaC
IEFDUEkg54Ot6YeP566h55CG77yJ5oiW5omA5pyJ6aKR546H5pu05pS577yI6ZmkDQo+ID4+IC3o
rqHml7bku6PnoIHlpJbvvInvvIznlJroh7PpnIDopoHlvLrliLbnoa7lrprpgJ/luqbpmZDliLbn
moTpgJrnn6XlmajvvIjlpoIgQVJNIOaetuaehOS4iueahCBMQ0Qg6amx5Yqo56iL5bqP77yJ44CC
DQo+ID4+IC3mraTlpJbvvIwg5YaF5qC4ICLluLjmlbAiIGxvb3BzX3Blcl9qaWZmeeS8muagueaN
rumikeeOh+WPmOWMluiAjOabtOaWsOOAgg0KPiA+PiAr5Yqo56iL5bqP77yI6YKj5Lqb5omn6KGM
56Gs5Lu26aKR546H5YiH5o2i55qE5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmagiIOaPkOS+m+S6
huS4gOS4quagh+WHhuWMlueahOaOpeWPo+OAgg0KPiA+PiAr5YyF5ous6K6+5aSH6amx5Yqo56iL
5bqP77yb6ZyA6KaB5LqG6Kej562W55Wl5Y+Y5YyW77yI5aaCIEFDUEkg54Ot6YeP566h55CG77yJ
77yM5oiW5omA5pyJ6aKR546H5Y+Y5YyW77yI5aaC6K6h5pe25Luj56CB77yJ77yMDQo+ID4+ICvn
lJroh7PpnIDopoHlvLrliLbpmZDliLbkuLrmjIflrprpopHnjofvvIjlpoIgQVJNIOaetuaehOS4
iueahCBMQ0Qg6amx5Yqo56iL5bqP77yJ55qE5YW25a6D5YaF5qC457uE5Lu244CCDQo+ID4+ICvm
raTlpJbvvIzlhoXmoLggIuW4uOaVsCIgbG9vcHNfcGVyX2ppZmZ5IOS8muagueaNrumikeeOh+WP
mOWMluiAjOabtOaWsOOAgg0KPiA+Pg0KPiA+PiAgY3B1ZnJlceetlueVpeeahOW8leeUqOiuoeaV
sOeUsSBjcHVmcmVxX2NwdV9nZXQg5ZKMIGNwdWZyZXFfY3B1X3B1dCDmnaXlrozmiJDvvIzku6Xn
oa7kv50gY3B1ZnJlcSDpqbENCj4gPj4gIOWKqOeoi+W6j+iiq+ato+ehruWcsOazqOWGjOWIsOag
uOW/g+S4re+8jOW5tuS4lOmpseWKqOeoi+W6j+WcqCBjcHVmcmVxX3B1dF9jcHUg6KKr6LCD55So
5LmL5YmN5LiN5Lya6KKr5Y246L2944CC6L+Z5Lmf5L+d6K+BDQo+ID4+IEBAIC00MSw3ICs0MSw3
IEBAIGNwdWZyZXHnrZbnlaXnmoTlvJXnlKjorqHmlbDnlLEgY3B1ZnJlcV9jcHVfZ2V0IOWSjCBj
cHVmcmVxX2NwdV9wdXQg5p2l5a6M5oiQ77yMDQo+ID4+ICAyLiBDUFVGcmVxIOmAmuefpeWZqA0K
PiA+PiAgPT09PT09PT09PT09PT09PT09PT0NCj4gPj4NCj4gPj4gLUNQVUZyZXHpgJrnn6Xlmajn
rKblkIjmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gPj4gK0NQVUZyZXHpgJrn
n6XlmajpgbXlvqrmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gPj4gIOWFs+S6
jumAmuefpeWZqOeahOe7huiKguivt+WPgumYhSBsaW51eC9pbmNsdWRlL2xpbnV4L25vdGlmaWVy
LmjjgIINCj4gPj4NCj4gPj4gIOi/memHjOacieS4pOS4quS4jeWQjOeahENQVWZyZXHpgJrnn6Xl
maggLSDnrZbnlaXpgJrnn6XlmajlkozovazmjaLpgJrnn6XlmajjgIINCj4gPj4gQEAgLTY5LDIw
ICs2OSwyMCBAQCBDUFVGcmVx6YCa55+l5Zmo56ym5ZCI5qCH5YeG55qE5YaF5qC46YCa55+l5Zmo
5o6l5Y+j44CCDQo+ID4+DQo+ID4+ICDnrKzkuInkuKrlj4LmlbDmmK/kuIDkuKrljIXlkKvlpoLk
uIvlgLznmoTnu5PmnoTkvZNjcHVmcmVxX2ZyZXFz77yaDQo+ID4+DQo+ID4+IC09PT09PSAgPT09
PT09PT09PT09PT09PT09PT0NCj4gPj4gLWNwdSAgICDlj5flvbHlk41jcHXnmoTnvJblj7cNCj4g
Pj4gKz09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4+ICtwb2xpY3kg
5oyH5ZCRc3RydWN0IGNwdWZyZXFfcG9saWN555qE5oyH6ZKIDQo+ID4+ICBvbGQgICAg5pen6aKR
546HDQo+ID4+ICBuZXcgICAg5paw6aKR546HDQo+ID4+ICBmbGFncyAgY3B1ZnJlcempseWKqOea
hOagh+W/lw0KPiA+PiAtPT09PT0gID09PT09PT09PT09PT09PT09PT09DQo+ID4+ICs9PT09PT0g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+Pg0KPiA+PiAgMy4g5ZCr5pyJT3Bl
cmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJlceihqOeahOeUn+aIkA0KPiA+
PiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQo+ID4+ICDlhbPkuo5PUFDnmoTnu4boioLor7flj4LpmIUgRG9jdW1lbnRh
dGlvbi9wb3dlci9vcHAucnN0DQo+ID4+DQo+ID4+ICBkZXZfcG1fb3BwX2luaXRfY3B1ZnJlcV90
YWJsZSAtDQo+ID4+IC0gICAgICAg6L+Z5Liq5Yqf6IO95o+Q5L6b5LqG5LiA5Liq6ZqP5pe25Y+v
55So55qE6L2s5o2i56iL5bqP77yM55So5p2l5bCGT1BQ5bGC5YWz5LqO5Y+v55So6aKR546H55qE
5YaF6YOo5L+h5oGv57+76K+R5oiQ5LiA56eN5a655piT5o+Q5L6b57uZDQo+ID4+IC0gICAgICAg
Y3B1ZnJlceeahOagvOW8j+OAgg0KPiA+PiArICAgICAgIOi/meS4quWHveaVsOaPkOS+m+S6huS4
gOS4qumaj+aXtuWPr+eUqOeahOi9rOaNouS+i+eoi++8jOeUqOadpeWwhk9QUOWxguWFs+S6juWP
r+eUqOmikeeOh+eahOWGhemDqOS/oeaBr+e/u+ivkeaIkOS4gOenjQ0KPiA+PiArICAgICAgIGNw
dWZyZXHmmJPkuo7nkIbop6PmoLzlvI/jgIINCj4gPiBjcHVmcmVx5piT5LqO55CG6Kej55qE5qC8
5byP77yfDQo+DQo+IOaUueaIkOKAnOaYk+S6juWkhOeQhueahOagvOW8j+KAneWQpw0KR3JlYXQh
DQoNClRoYW5rcywNCllhbnRlbmcNCj4NCj4gPg0KPiA+IE90aGVycyBwYXJ0IGxvb2tzIGZpbmUg
dG8gbWUuDQo+ID4gQWNrZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4N
Cj4gPj4NCj4gPj4gICAgICAgICAuLiBXYXJuaW5nOjoNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi4x
Ny4xDQo+ID4+DQo=
