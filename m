Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF1EC433FE
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 09:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356857AbhLBJ4z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 04:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356723AbhLBJ4n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 04:56:43 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D9FC061757
        for <linux-doc@vger.kernel.org>; Thu,  2 Dec 2021 01:53:20 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id nn15-20020a17090b38cf00b001ac7dd5d40cso4198276pjb.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Dec 2021 01:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rtwf81mcIuqslzo7XVrrKgtVKSnKeo2a8d+tSRwsDSM=;
        b=bDxdg2CAhSV4c/riFHP9RhrA1m2gUWO9qyvo6bq91fj/nSWzcTDY/LtBiCV+R8uto2
         YnuiHCHYWMFZoSFyRbSp7YVjFSs+P7KwzeBmnjJnJ08D5afngUnauAPVU4nS2xEZa6mt
         bq8D21vUFNdmc2YZrQG5tAZq6rZoY9ogP4+6KSkkex7qBUk+W55bIDUSI+RTtAWr/bVD
         q50+2RjidU/kCMKMD1GQ2v04Aed/4MwGpXX++6qyvgs4HQtHE+ZR0fQUbikS8GfMNEgm
         Q5OpWvoaYovqCGtzA+1LM4zWor63/0wKZu3dXLkSnMzT6FgmiGrJgQvfwj0JI47QnlgZ
         Hl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rtwf81mcIuqslzo7XVrrKgtVKSnKeo2a8d+tSRwsDSM=;
        b=7rajnNuOlWAIPlMHsqj5NOfrmA+G6mrMdhLgMGmyCLJ9XpRA9NltsBI9zrga8fTit6
         eOlg55u9aX8LG5UTJx+XU4+3myUdAk+RCcNWEUYTwnJmR9US5C+f7hp8QeFDv86OizjN
         7kRKyxbteDW/RdpHe0vR8zlN1WlLpVAfZp0kDsM24dingM+5E4VkQlsgkPvwMGwag0pU
         WYXLTCqeXRCwvqgU0wIJkiTF52S4ozmq1XUJkkxeiujDef4VdFiwYKvALiYgyMWyX6/9
         tFDLqAPGIGI6HMYLCqoiXCg6eXNu3zexUKGx2AFN+5Kdtx0R3tJJOur+CnjphU+h+Uhs
         JVGw==
X-Gm-Message-State: AOAM530rUgfCrc4V4wgwQBpxJvNx9XLJZECaFC4XiulsWTJJFaAO1zLw
        2ISCQzo4/IFzjhrQ6AtpLGy1kDypt+iZp9Vmarg=
X-Google-Smtp-Source: ABdhPJxybq1IVuTqEVF8CGlQ6lLNGcQ+cTA1nOehlrEggQOairNlHGG9sGE7GC1eEKyTcEtbG1WqyDf+98hrXIM2SrQ=
X-Received: by 2002:a17:90b:4c4b:: with SMTP id np11mr4889713pjb.233.1638438799768;
 Thu, 02 Dec 2021 01:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20211130153400.6409-1-tangyizhou@huawei.com>
In-Reply-To: <20211130153400.6409-1-tangyizhou@huawei.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 2 Dec 2021 17:53:08 +0800
Message-ID: <CAMU9jJpVH3aX--zfOhWuT3taS3MPQ37LT_FS6FREr45yA+Li2Q@mail.gmail.com>
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

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyIMeaXpeWR
qOS4iSDkuIvljYg5OjUx5YaZ6YGT77yaDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmcgWWl6aG91
IDx0YW5neWl6aG91QGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9D
Ti9jcHUtZnJlcS9jb3JlLnJzdCAgICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdA0K
PiBpbmRleCAwYzZmZDQ0N2NlZDYuLmJmODNjYWQ3MGI2OCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gQEAgLTI5
LDEwICsyOSwxMCBAQCBDUFVGcmVx5qC45b+D5ZKMQ1BVRnJlcemAmuefpeWZqOeahOmAmueUqOiv
tOaYjg0KPiAgPT09PT09PT09PT09PT09PT09PT09PQ0KPg0KPiAgY3B1ZnJlceaguOW/g+S7o+eg
geS9jeS6jmRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmPkuK3jgILov5nkuptjcHVmcmVx5Luj56CB
5Li6Q1BVRnJlceaetuaehOeahOmpsQ0KPiAt5Yqo56iL5bqP77yI6YKj5Lqb5pON5L2c56Gs5Lu2
5YiH5o2i6aKR546H55qE5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmaggIuaPkOS+m+S6huS4gOS4
quagh+WHhuWMlueahOaOpeWPo+OAgg0KPiAt6L+Z5Lqb5piv6K6+5aSH6amx5Yqo56iL5bqP5oiW
6ZyA6KaB5LqG6Kej562W55Wl5Y+Y5YyW55qE5YW25a6D5YaF5qC46YOo5YiG77yI5aaCIEFDUEkg
54Ot6YeP566h55CG77yJ5oiW5omA5pyJ6aKR546H5pu05pS577yI6ZmkDQo+IC3orqHml7bku6Pn
oIHlpJbvvInvvIznlJroh7PpnIDopoHlvLrliLbnoa7lrprpgJ/luqbpmZDliLbnmoTpgJrnn6Xl
majvvIjlpoIgQVJNIOaetuaehOS4iueahCBMQ0Qg6amx5Yqo56iL5bqP77yJ44CCDQo+IC3mraTl
pJbvvIwg5YaF5qC4ICLluLjmlbAiIGxvb3BzX3Blcl9qaWZmeeS8muagueaNrumikeeOh+WPmOWM
luiAjOabtOaWsOOAgg0KPiAr5Yqo56iL5bqP77yI6YKj5Lqb5omn6KGM56Gs5Lu26aKR546H5YiH
5o2i55qE5Luj56CB77yJ5Lul5Y+KICLpgJrnn6XlmagiIOaPkOS+m+S6huS4gOS4quagh+WHhuWM
lueahOaOpeWPo+OAgg0KPiAr5YyF5ous6K6+5aSH6amx5Yqo56iL5bqP77yb6ZyA6KaB5LqG6Kej
562W55Wl5Y+Y5YyW77yI5aaCIEFDUEkg54Ot6YeP566h55CG77yJ77yM5oiW5omA5pyJ6aKR546H
5Y+Y5YyW77yI5aaC6K6h5pe25Luj56CB77yJ77yMDQo+ICvnlJroh7PpnIDopoHlvLrliLbpmZDl
iLbkuLrmjIflrprpopHnjofvvIjlpoIgQVJNIOaetuaehOS4iueahCBMQ0Qg6amx5Yqo56iL5bqP
77yJ55qE5YW25a6D5YaF5qC457uE5Lu244CCDQo+ICvmraTlpJbvvIzlhoXmoLggIuW4uOaVsCIg
bG9vcHNfcGVyX2ppZmZ5IOS8muagueaNrumikeeOh+WPmOWMluiAjOabtOaWsOOAgg0KPg0KPiAg
Y3B1ZnJlceetlueVpeeahOW8leeUqOiuoeaVsOeUsSBjcHVmcmVxX2NwdV9nZXQg5ZKMIGNwdWZy
ZXFfY3B1X3B1dCDmnaXlrozmiJDvvIzku6Xnoa7kv50gY3B1ZnJlcSDpqbENCj4gIOWKqOeoi+W6
j+iiq+ato+ehruWcsOazqOWGjOWIsOaguOW/g+S4re+8jOW5tuS4lOmpseWKqOeoi+W6j+WcqCBj
cHVmcmVxX3B1dF9jcHUg6KKr6LCD55So5LmL5YmN5LiN5Lya6KKr5Y246L2944CC6L+Z5Lmf5L+d
6K+BDQo+IEBAIC00MSw3ICs0MSw3IEBAIGNwdWZyZXHnrZbnlaXnmoTlvJXnlKjorqHmlbDnlLEg
Y3B1ZnJlcV9jcHVfZ2V0IOWSjCBjcHVmcmVxX2NwdV9wdXQg5p2l5a6M5oiQ77yMDQo+ICAyLiBD
UFVGcmVxIOmAmuefpeWZqA0KPiAgPT09PT09PT09PT09PT09PT09PT0NCj4NCj4gLUNQVUZyZXHp
gJrnn6XlmajnrKblkIjmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gK0NQVUZy
ZXHpgJrnn6XlmajpgbXlvqrmoIflh4bnmoTlhoXmoLjpgJrnn6XlmajmjqXlj6PjgIINCj4gIOWF
s+S6jumAmuefpeWZqOeahOe7huiKguivt+WPgumYhSBsaW51eC9pbmNsdWRlL2xpbnV4L25vdGlm
aWVyLmjjgIINCj4NCj4gIOi/memHjOacieS4pOS4quS4jeWQjOeahENQVWZyZXHpgJrnn6Xlmagg
LSDnrZbnlaXpgJrnn6XlmajlkozovazmjaLpgJrnn6XlmajjgIINCj4gQEAgLTY5LDIwICs2OSwy
MCBAQCBDUFVGcmVx6YCa55+l5Zmo56ym5ZCI5qCH5YeG55qE5YaF5qC46YCa55+l5Zmo5o6l5Y+j
44CCDQo+DQo+ICDnrKzkuInkuKrlj4LmlbDmmK/kuIDkuKrljIXlkKvlpoLkuIvlgLznmoTnu5Pm
noTkvZNjcHVmcmVxX2ZyZXFz77yaDQo+DQo+IC09PT09PSAgPT09PT09PT09PT09PT09PT09PT0N
Cj4gLWNwdSAgICDlj5flvbHlk41jcHXnmoTnvJblj7cNCj4gKz09PT09PSA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+ICtwb2xpY3kg5oyH5ZCRc3RydWN0IGNwdWZyZXFfcG9saWN5
55qE5oyH6ZKIDQo+ICBvbGQgICAg5pen6aKR546HDQo+ICBuZXcgICAg5paw6aKR546HDQo+ICBm
bGFncyAgY3B1ZnJlcempseWKqOeahOagh+W/lw0KPiAtPT09PT0gID09PT09PT09PT09PT09PT09
PT09DQo+ICs9PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPg0KPiAgMy4g
5ZCr5pyJT3BlcmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJlceihqOeahOeU
n+aIkA0KPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+ICDlhbPkuo5PUFDnmoTnu4boioLor7flj4LpmIUgRG9jdW1l
bnRhdGlvbi9wb3dlci9vcHAucnN0DQo+DQo+ICBkZXZfcG1fb3BwX2luaXRfY3B1ZnJlcV90YWJs
ZSAtDQo+IC0gICAgICAg6L+Z5Liq5Yqf6IO95o+Q5L6b5LqG5LiA5Liq6ZqP5pe25Y+v55So55qE
6L2s5o2i56iL5bqP77yM55So5p2l5bCGT1BQ5bGC5YWz5LqO5Y+v55So6aKR546H55qE5YaF6YOo
5L+h5oGv57+76K+R5oiQ5LiA56eN5a655piT5o+Q5L6b57uZDQo+IC0gICAgICAgY3B1ZnJlceea
hOagvOW8j+OAgg0KPiArICAgICAgIOi/meS4quWHveaVsOaPkOS+m+S6huS4gOS4qumaj+aXtuWP
r+eUqOeahOi9rOaNouS+i+eoi++8jOeUqOadpeWwhk9QUOWxguWFs+S6juWPr+eUqOmikeeOh+ea
hOWGhemDqOS/oeaBr+e/u+ivkeaIkOS4gOenjQ0KPiArICAgICAgIGNwdWZyZXHmmJPkuo7nkIbo
p6PmoLzlvI/jgIINCmNwdWZyZXHmmJPkuo7nkIbop6PnmoTmoLzlvI/vvJ8NCg0KT3RoZXJzIHBh
cnQgbG9va3MgZmluZSB0byBtZS4NCkFja2VkLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+DQo+DQo+ICAgICAgICAgLi4gV2FybmluZzo6DQo+DQo+IC0tDQo+IDIuMTcuMQ0K
Pg0K
