Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E59DC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 06:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbhLFGfH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 01:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbhLFGfF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 01:35:05 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC39C0613F8
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 22:31:36 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id n66so19628070oia.9
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 22:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+GZZ7PA+IoTL6KRJocLpue9y5GPrnBDIJLgtD5ksisE=;
        b=OGkfE5dHX8B8pcfZVYp2m5AlbFzKePmu1U9XjEh+RD7oBfZDI6rtQ4QipRrxpzZI7n
         n2nBMPCyt+s/Rb3UA3iP9vULjYz1k/VH1hAr/1ybqzfzdQd0rt3ACM7GKuTooS3b+SzF
         IuTSZMUMKbq+tT10u/BJOojC2P7oj4+8TK038lW9TdJzqJFRSXUluhXQOgJ9aSdjZmh0
         yTYrh7lfM3tb8g7e9XY+YD+ccpH3s2K0OoPYJkL3Hsdqf4f03yT05OE8jLHBzOhlfedP
         PuC1YXsvNIpiUaJPUgjVpmL6vr9GosFMeWcAJgilmyI5bzcossC2TW3vx1iRgHaKw9g9
         9cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+GZZ7PA+IoTL6KRJocLpue9y5GPrnBDIJLgtD5ksisE=;
        b=pwxV9E0i8A2B+VFiM0ru6COt9b7JqWB5lEpvd7aOfF1IPOPrIHojsBDIFMD/HX29+V
         m/WKcQL+OpKdE6CAzPxZ0/ZV8Bd5SUOmBkS5/IkKMdigInvL5W1ZLTNECEPUnFuJtdjQ
         ZcOrzVxE8+bnT7zUVVTe0KMRb3S9MWl0mjOngOsQh/YEGvtgOJyCNgySxUgXY0/rE/Kg
         0dkySWXlqJNVWFw1r+UgLcZXt+qxRU8pfe/nErdCWSx6GtxCYCpeo4eLPPRbpIWYd5Em
         ZVn6jXnlFk5eeoWoUmzckZEC0UvTWKjy58Pu3lWvJf1EVFO6ubv5CWDgUo9+JdH8C+3u
         ub8Q==
X-Gm-Message-State: AOAM532f5Ss10Scr1/ujmWtc2/oM8yVX14fXc2CfT34YutRLwXwap5zF
        jiC/iW5Gm0sQ0Ro/kvMOn951YBJD+ZZMG865S1s=
X-Google-Smtp-Source: ABdhPJxUgXq9nw7Od/M5c6Txj2gXUu2KRiLjThsMGz1RiMVFtJZsmMdV5+rNp7/v+hgOVOX0iiBS6cFpTdcQFZfRVgM=
X-Received: by 2002:a05:6808:1709:: with SMTP id bc9mr22211323oib.130.1638772296195;
 Sun, 05 Dec 2021 22:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20211202142312.20052-1-tangyizhou@huawei.com> <a6b4c46e-7436-0fd5-e4af-8187bae2cf72@huawei.com>
In-Reply-To: <a6b4c46e-7436-0fd5-e4af-8187bae2cf72@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 6 Dec 2021 14:31:24 +0800
Message-ID: <CAEensMyCzyY46Z1nYG1Q6N9q-Pv+5Ouyqedk0VpWTi94jH=s7Q@mail.gmail.com>
Subject: Re: [PATCH] doc/zh-CN: Update cpufreq-stats.rst to make it more readable
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMeW5tDEy5pyINuaXpeWR
qOS4gCAxNDoxOOWGmemBk++8mg0KPg0KPiBPbiAyMDIxLzEyLzIgMjI6MjMsIFRhbmcgWWl6aG91
IHdyb3RlOg0KPiA+IFRoZXNlIENoaW5lc2UgdHJhbnNsYXRpb25zIGFyZSBlYXNpZXIgdG8gdW5k
ZXJzdGFuZC4NCj4gPiBBbHNvIGFkZCBwcm9vZnJlYWRlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRhbmcgWWl6aG91IDx0YW5neWl6aG91QGh1YXdlaS5jb20+DQpBY2tlZC1ieTogWWFudGVu
ZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpUaGFua3MsDQpZYW50ZW5nDQo+ID4gLS0t
DQo+ID4gIC4uLi96aF9DTi9jcHUtZnJlcS9jcHVmcmVxLXN0YXRzLnJzdCAgICAgICAgICB8IDQ1
ICsrKysrKysrKystLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NwdWZyZXEtc3RhdHMucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY3B1ZnJlcS1zdGF0cy5yc3QNCj4gPiBp
bmRleCBmMTQ0MjMwOTlkNGIuLmU4ZmRiYTkyM2NkNSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jcHVmcmVxLXN0YXRzLnJzdA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NwdWZyZXEt
c3RhdHMucnN0DQo+ID4gQEAgLTgsMTMgKzgsMTUgQEANCj4gPg0KPiA+ICAg5Y+45bu26IW+IFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPg0KPiA+IC0uLiBfY25fY3B1ZnJl
cS1zdGF0cy5yc3Q6DQo+ID4gKzrmoKHor5E6DQo+ID4gKw0KPiA+ICsg5ZSQ6Im66IifIFRhbmcg
WWl6aG91IDx0YW5neWVlY2hvdUBnbWFpbC5jb20+DQo+ID4NCj4gPiAgPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gIHN5c2ZzIENQVUZyZXEgU3RhdHPnmoTk
uIDoiKzor7TmmI4NCj4gPiAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+ID4NCj4gPiAt55So5oi35L+h5oGvDQo+ID4gK+S4uuS9v+eUqOiAheWHhuWkh+eahOS/
oeaBrw0KPiA+DQo+ID4NCj4gPiAg5L2c6ICFOiBWZW5rYXRlc2ggUGFsbGlwYWRpIDx2ZW5rYXRl
c2gucGFsbGlwYWRpQGludGVsLmNvbT4NCj4gPiBAQCAtMjksMTcgKzMxLDE2IEBAIHN5c2ZzIENQ
VUZyZXEgU3RhdHPnmoTkuIDoiKzor7TmmI4NCj4gPiAgMS4g566A5LuLDQo+ID4gID09PT09PT09
PT09PT09PQ0KPiA+DQo+ID4gLWNwdWZyZXEtc3RhdHPmmK/kuIDkuKrkuLrmr4/kuKpDUFXmj5Dk
vptDUFXpopHnjofnu5/orqHnmoTpqbHliqjjgIINCj4gPiAt6L+Z5Lqb57uf6K6h5pWw5o2u5Zyo
L3N5c2Zz5Lit5Lul5LiA5aCG5Y+q6K+75o6l5Y+j55qE5b2i5byP5o+Q5L6b44CC6L+Z5Liq5o6l
5Y+j77yI5Zyo6YWN572u5aW95ZCO77yJ5bCG5Ye6546w5ZyoDQo+ID4gLS9zeXNmc++8iDxzeXNm
cyByb290Pi9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1WC9jcHVmcmVxL3N0YXRzL++8ieS4rWNwdWZy
ZXHkuIvnmoTkuIDkuKrljZUNCj4gPiAt54us55qE55uu5b2V5Lit77yM5o+Q5L6b57uZ5q+P5Liq
Q1BV44CCDQo+ID4gLeWQhOenjee7n+iuoeaVsOaNruWwhuWcqOatpOebruW9leS4i+W9ouaIkOWP
quivu+aWh+S7tuOAgg0KPiA+ICtjcHVmcmVxLXN0YXRz5piv5LiA56eN5Li65q+P5LiqQ1BV5o+Q
5L6bQ1BV6aKR546H57uf6K6h55qE6amx5Yqo44CCDQo+ID4gK+i/meS6m+e7n+iuoeaVsOaNruS7
pS9zeXNmc+S4reS4gOezu+WIl+WPquivu+aOpeWPo+eahOW9ouW8j+WRiOeOsOOAgmNwdWZyZXEt
c3RhdHPmjqXlj6PvvIjoi6Xlt7LphY3nva7vvInlsIbkuLrmr4/kuKpDUFXnlJ/miJANCj4gPiAr
L3N5c2Zz77yIPHN5c2ZzIHJvb3Q+L2RldmljZXMvc3lzdGVtL2NwdS9jcHVYL2NwdWZyZXEvc3Rh
dHMv77yJ5LitY3B1ZnJlceebruW9leS4i+eahHN0YXRz55uu5b2V44CCDQo+ID4gK+WQhOmhuee7
n+iuoeaVsOaNruWwhuWcqHN0YXRz55uu5b2V5LiL5b2i5oiQ5a+55bqU55qE5Y+q6K+75paH5Lu2
44CCDQo+ID4NCj4gPiAt5q2k6amx5Yqo5piv54us56uL5LqO5Lu75L2V5Y+v6IO96L+Q6KGM5Zyo
5L2g5omA55SoQ1BV5LiK55qE54m55a6aY3B1ZnJlcV9kcml2ZXLogIzorr7orqHnmoTjgILlm6Dm
raTvvIzlroPlsIbkuI7miYDmnIkNCj4gPiAtY3B1ZnJlcV9kcml2ZXLkuIDotbflt6XkvZzjgIIN
Cj4gPiAr5q2k6amx5Yqo5piv5Lul54us56uL5LqO5Lu75L2V5Y+v6IO96L+Q6KGM5Zyo5L2g5omA
55SoQ1BV5LiK55qE54m55a6aY3B1ZnJlcV9kcml2ZXLnmoTmlrnlvI/orr7orqHnmoTjgILlm6Dm
raTvvIzlroPlsIbog73lkozku7vkvZUNCj4gPiArY3B1ZnJlcV9kcml2ZXLljY/lkIzlt6XkvZzj
gIINCj4gPg0KPiA+DQo+ID4gLTIuIOaPkOS+m+eahOe7n+iuoeaVsOaNrijkuL7kvovor7TmmI4p
DQo+ID4gKzIuIOW3suaPkOS+m+eahOe7n+iuoeaVsOaNrijmnInkvovlrZApDQo+ID4gID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPg0KPiA+ICBjcHVmcmVxIHN0YXRz
5o+Q5L6b5LqG5Lul5LiL57uf6K6h5pWw5o2u77yI5Zyo5LiL6Z2i6K+m57uG6Kej6YeK77yJ44CC
DQo+ID4gQEAgLTQ4LDggKzQ5LDggQEAgY3B1ZnJlcSBzdGF0c+aPkOS+m+S6huS7peS4i+e7n+iu
oeaVsOaNru+8iOWcqOS4i+mdouivpue7huino+mHiu+8ieOAgg0KPiA+ICAtICB0b3RhbF90cmFu
cw0KPiA+ICAtICB0cmFuc190YWJsZQ0KPiA+DQo+ID4gLeaJgOacieeahOe7n+iuoeaVsOaNruWw
huS7jue7n+iuoempseWKqOiiq+i9veWFpeeahOaXtumXtO+8iOaIlue7n+iuoeiiq+mHjee9ruea
hOaXtumXtO+8ieW8gOWni++8jOWIsOafkOS4gOe7n+iuoeaVsOaNruiiq+ivu+WPlueahOaXtumX
tOS4uuatouOAgg0KPiA+IC3mmL7nhLbvvIznu5/orqHpqbHliqjkuI3kvJrmnInku7vkvZXlhbPk
uo7nu5/orqHpqbHliqjovb3lhaXkuYvliY3nmoTpopHnjofovazmjaLkv6Hmga/jgIINCj4gPiAr
5omA5pyJ57uf6K6h5pWw5o2u5p2l6Ieq5Lul5LiL5pe26Ze06IyD5Zu077ya5LuO57uf6K6h6amx
5Yqo6KKr5Yqg6L2955qE5pe26Ze077yI5oiW57uf6K6h5pWw5o2u6KKr6YeN572u55qE5pe26Ze0
77yJ5byA5aeL77yM5Yiw5p+Q5LiA57uf6K6h5pWw5o2u6KKr6K+75Y+W55qE5pe26Ze05Li65q2i
44CCDQo+ID4gK+aYvueEtu+8jOe7n+iuoempseWKqOS4jeS8muS/neWtmOWug+iiq+WKoOi9veS5
i+WJjeeahOS7u+S9lemikeeOh+i9rOaNouS/oeaBr+OAgg0KPiA+DQo+ID4gIDo6DQo+ID4NCj4g
PiBAQCAtNjQsMTQgKzY1LDE0IEBAIGNwdWZyZXEgc3RhdHPmj5Dkvpvkuobku6XkuIvnu5/orqHm
lbDmja7vvIjlnKjkuIvpnaLor6bnu4bop6Pph4rvvInjgIINCj4gPg0KPiA+ICAtICoqcmVzZXQq
Kg0KPiA+DQo+ID4gLeWPquWGmeWxnuaAp++8jOWPr+eUqOS6jumHjee9rue7n+iuoeiuoeaVsOWZ
qOOAgui/meWvueS6juivhOS8sOS4jeWQjOiwg+iKguWZqOS4i+eahOezu+e7n+ihjOS4uumdnuW4
uOacieeUqO+8jOS4lOaXoOmcgOmHjeWQr+OAgg0KPiA+ICvlj6rlhpnlsZ7mgKfvvIzlj6/nlKjk
uo7ph43nva7nu5/orqHorqHmlbDlmajjgILov5nlr7nkuo7or4TkvLDkuI3lkIzosIPoioLlmajn
moTns7vnu5/ooYzkuLrpnZ7luLjmnInnlKjvvIzkuJTml6DpnIDph43lkK/jgIINCj4gPg0KPiA+
DQo+ID4gIC0gKip0aW1lX2luX3N0YXRlKioNCj4gPg0KPiA+IC3mraTpobnnu5nlh7rkuobov5nk
uKpDUFXmiYDmlK/mjIHnmoTmr4/kuKrpopHnjofmiYDoirHotLnnmoTml7bpl7TjgIJjYXTovpPl
h7rnmoTmr4/kuIDooYzpg73kvJrmnIkiPGZyZXF1ZW5jeT4NCj4gPiAtPHRpbWU+IuWvue+8jOih
qOekuui/meS4qkNQVeWcqDxmcmVxdWVuY3k+5LiK6Iqx6LS55LqGPHRpbWU+5LiqdXNlcnRpbWXl
jZXkvY3nmoTml7bpl7TjgILov5nph4znmoQNCj4gPiAtdXNlcnRpbWXljZXkvY3mmK8xMG1T77yI
57G75Ly85LqOL3Byb2PkuK3ovpPlh7rnmoTlhbbku5bml7bpl7TvvInjgIINCj4gPiAr5q2k5paH
5Lu257uZ5Ye65LqG5Zyo5pysQ1BV5pSv5oyB55qE5q+P5Liq6aKR546H5LiK5YiG5Yir6Iqx6LS5
55qE5pe26Ze044CCY2F06L6T5Ye655qE5q+P5LiA6KGM6YO95piv5LiA5LiqIjxmcmVxdWVuY3k+
DQo+ID4gKzx0aW1lPiLlr7nvvIzooajnpLrov5nkuKpDUFXlnKg8ZnJlcXVlbmN5PuS4iuiKsei0
ueS6hjx0aW1lPuS4qnVzZXJ0aW1l5Y2V5L2N55qE5pe26Ze044CC6L6T5Ye655qE5q+P5LiA6KGM
5a+55bqUDQo+ID4gK+S4gOS4qkNQVeaUr+aMgeeahOmikeeOh+OAgui/memHjHVzZXJ0aW1l5Y2V
5L2N5pivMTBtU++8iOexu+S8vOS6ji9wcm9j5a+85Ye655qE5YW25a6D5pe26Ze077yJ44CCDQo+
ID4NCj4gPiAgOjoNCj4gPg0KPiA+IEBAIC04NSw3ICs4Niw3IEBAIHVzZXJ0aW1l5Y2V5L2N5piv
MTBtU++8iOexu+S8vOS6ji9wcm9j5Lit6L6T5Ye655qE5YW25LuW5pe26Ze077yJ44CCDQo+ID4N
Cj4gPiAgLSAqKnRvdGFsX3RyYW5zKioNCj4gPg0KPiA+IC3nu5nlh7rkuobov5nkuKpDUFXkuIrp
opHnjofovazmjaLnmoTmgLvmrKHmlbDjgIJjYXTnmoTovpPlh7rlsIbmnInkuIDkuKrljZXkuIDn
moTorqHmlbDvvIzov5nlsLHmmK/popHnjofovazmjaLnmoTmgLvmlbDjgIINCj4gPiAr5q2k5paH
5Lu257uZ5Ye65LqG6L+Z5LiqQ1BV6aKR546H6L2s5o2i55qE5oC75qyh5pWw44CCY2F055qE6L6T
5Ye65piv5LiA5Liq6K6h5pWw5YC877yM5a6D5bCx5piv6aKR546H6L2s5o2i55qE5oC75qyh5pWw
44CCDQo+ID4NCj4gPiAgOjoNCj4gPg0KPiA+IEBAIC05NCwxMCArOTUsMTAgQEAgdXNlcnRpbWXl
jZXkvY3mmK8xMG1T77yI57G75Ly85LqOL3Byb2PkuK3ovpPlh7rnmoTlhbbku5bml7bpl7TvvInj
gIINCj4gPg0KPiA+ICAtICoqdHJhbnNfdGFibGUqKg0KPiA+DQo+ID4gLei/meWwhuaPkOS+m+aJ
gOaciUNQVemikeeOh+i9rOaNoueahOe7hueykuW6puS/oeaBr+OAgui/memHjOeahGNhdOi+k+WH
uuaYr+S4gOS4quS6jOe7tOefqemYte+8jOWFtuS4reS4gOS4quadoeebrjxpLCBqPu+8iOesrA0K
PiA+ICvmnKzmlofku7bmj5DkvpvmiYDmnIlDUFXpopHnjofovazmjaLnmoTnu4bnspLluqbkv6Hm
ga/jgILov5nph4znmoRjYXTovpPlh7rmmK/kuIDkuKrkuoznu7Tnn6npmLXvvIzlhbbkuK3kuIDk
uKrmnaHnm648aSwgaj7vvIjnrKwNCj4gPiAgaeihjO+8jOesrGrliJfvvInku6Pooajku45GcmVx
X2nliLBGcmVxX2rnmoTovazmjaLmrKHmlbDjgIJGcmVxX2nooYzlkoxGcmVxX2rliJfpgbXlvqrp
qbHliqjmnIDliJ3mj5Dkvpvnu5ljcHVmcmVxDQo+ID4gLeaguOeahOmikeeOh+ihqOeahOaOkuW6
j+mhuuW6j++8jOWboOatpOWPr+S7peaOkuW6j++8iOWNh+W6j+aIlumZjeW6j++8ieaIluS4jeaO
kuW6j+OAgiDov5nph4znmoTovpPlh7rkuZ/ljIXlkKvkuobmr4/ooYzmr4/liJfnmoTlrp7pmYUN
Cj4gPiAt6aKR546H5YC877yM5Lul5L6/5pu05aW95Zyw6ZiF6K+744CCDQo+ID4gK+aguOW/g+ea
hOmikeeOh+ihqOeahOaOkuWIl+mhuuW6j++8jOWboOatpOWPr+S7peW3suaOkuW6j++8iOWNh+W6
j+aIlumZjeW6j++8ieaIluacquaOkuW6j+OAgui/memHjOeahOi+k+WHuuS5n+WMheWQq+S6huWu
numZhQ0KPiA+ICvpopHnjoflgLzvvIzliIbliKvmjInooYzlkozmjInliJfmmL7npLrvvIzku6Xk
vr/mm7Tlpb3lnLDpmIXor7vjgIINCj4gPg0KPiA+ICDlpoLmnpzovazmjaLooajlpKfkuo5QQUdF
X1NJWkXvvIzor7vlj5bml7blsIbov5Tlm57kuIDkuKotRUZCSUfplJnor6/jgIINCj4gPg0KPiA+
IEBAIC0xMTUsNyArMTE2LDcgQEAgaeihjO+8jOesrGrliJfvvInku6Pooajku45GcmVxX2nliLBG
cmVxX2rnmoTovazmjaLmrKHmlbDjgIJGcmVxX2nooYzlkoxGcmVxX2rliJcNCj4gPiAgMy4g6YWN
572uY3B1ZnJlcS1zdGF0cw0KPiA+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4N
Cj4gPiAt6KaB5Zyo5L2g55qE5YaF5qC45Lit6YWN572uY3B1ZnJlcS1zdGF0czo6DQo+ID4gK+aM
ieS7peS4i+aWueW8j+WcqOS9oOeahOWGheaguOS4remFjee9rmNwdWZyZXEtc3RhdHM6Og0KPiA+
DQo+ID4gICAgICAgQ29uZmlnIE1haW4gTWVudQ0KPiA+ICAgICAgICAgICAgICAgUG93ZXIgbWFu
YWdlbWVudCBvcHRpb25zIChBQ1BJLCBBUE0pICAtLS0+DQo+ID4gQEAgLTEyNCw3ICsxMjUsNyBA
QCBp6KGM77yM56ysauWIl++8ieS7o+ihqOS7jkZyZXFfaeWIsEZyZXFfaueahOi9rOaNouasoeaV
sOOAgkZyZXFfaeihjOWSjEZyZXFfauWIlw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsqXSAgIENQVSBmcmVxdWVuY3kgdHJhbnNsYXRpb24gc3RhdGlzdGljcw0KPiA+DQo+ID4N
Cj4gPiAtIkNQVSBGcmVxdWVuY3kgc2NhbGluZyIgKENPTkZJR19DUFVfRlJFUSkg5bqU6K+l6KKr
5ZCv55So5Lul6YWN572uY3B1ZnJlcS1zdGF0c+OAgg0KPiA+ICsiQ1BVIEZyZXF1ZW5jeSBzY2Fs
aW5nIiAoQ09ORklHX0NQVV9GUkVRKSDlupTor6XooqvlkK/nlKjvvIzku6XmlK/mjIHphY3nva5j
cHVmcmVxLXN0YXRz44CCDQo+ID4NCj4gPiAgIkNQVSBmcmVxdWVuY3kgdHJhbnNsYXRpb24gc3Rh
dGlzdGljcyIgKENPTkZJR19DUFVfRlJFUV9TVEFUKeaPkOS+m+S6huWMheaLrA0KPiA+ICB0aW1l
X2luX3N0YXRl44CBdG90YWxfdHJhbnPlkox0cmFuc190YWJsZeeahOe7n+iuoeaVsOaNruOAgg0K
PiA+DQo+DQo+IGNjIFlhbmd0ZW5nJ3MgYW5vdGhlciBlbWFpbCBhZGRyZXNzLCBzaXlhbnRlbmcw
MUBnbWFpbC5jb20NCg==
