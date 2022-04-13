Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7871AC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 01:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiDMByf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Apr 2022 21:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbiDMByb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 21:54:31 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7181B2C120
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 18:52:12 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id x200so1139037ybe.13
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7NZmS1+0QPgcFP8SwzpZ0W9PeHsE8+RAMLseEwDwybY=;
        b=KOxpMmKXfCSxEyQOt0YrqhXFe0tQzY+hNU9dHQPl+2EcCYgsxJoxhMlF6J3GRhgvrm
         Sz4VO4oRg60HEw82satDEdemFScU++yYkVJFRUTXb6wPMcmoDBcv4WeSKHVuUOJYf9j5
         kE26znfQguxPLNgLX53qg5GbgjiKt6XP0+Btcwh5NeapBW8svEnQ2ioRZETEF8DM4Dgj
         xUfzWf1BF+kIZ3lDMtLfwDD8Ux+scn6rQ0SXrBh+xgfY843YLn2HazoQjxGlWGAKQHZG
         Wpgb65i1t+een8ognUmrG0GT8S7IIGMuoWfnaCXHROWHzpt/Lz9DlGmHQZUx4W57AK6f
         iX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7NZmS1+0QPgcFP8SwzpZ0W9PeHsE8+RAMLseEwDwybY=;
        b=2ALFdNRMHGW9OpDetymZxNiaP5tO//cyrBiCX4DuMZbV+W1eFU1hQZV1TX/3hfEdSG
         vVJEx+kPKy3p68wAuJqkudeqQCoILu+r2IFIR7kD5DrmsW58O576an3t5zsUL06YY5+z
         SGiz5Sk54glOJgsZWan5vvTV9Mnx9+gNu4rqqIPRaKIJt+DRMLiy+XxX3Uj5tb44qLst
         K8rMnbA9XdKkaHaFLjxh97JvDiddpzuHlzGsyYjOa8ra25IAD3XKxegy0EujhE1eym8F
         Yd8fCbqzJ1zqHPGznSQO9EJG16wV4BSKVGjipt+gVxDiviS0L6PW3Sau0zoZI8MC2euO
         Gdrw==
X-Gm-Message-State: AOAM532pvJhdRBIjAub4gt6i7Hw5CToaRil9U8k3yKfdLICj2b788pO4
        ltLi4n0iXXQ/UsM4g2gcm87oTAXsoEs0nMzx+zQ=
X-Google-Smtp-Source: ABdhPJzIX2FEren4YuTk5HQNb9f+CilTz4QfpRKEZmWZJx6eV1+h9ZJzlpUaGvfot0aYXc7sl2AoyK953uxVaRYg8zk=
X-Received: by 2002:a25:6b0f:0:b0:633:d1a3:9dbf with SMTP id
 g15-20020a256b0f000000b00633d1a39dbfmr28959415ybc.216.1649814731499; Tue, 12
 Apr 2022 18:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220408144742.23225-1-tangyizhou@huawei.com> <20220408144742.23225-3-tangyizhou@huawei.com>
 <2b7b690a-5ead-65a3-35ad-c6d366f13a63@gmail.com>
In-Reply-To: <2b7b690a-5ead-65a3-35ad-c6d366f13a63@gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 13 Apr 2022 09:51:58 +0800
Message-ID: <CAEensMwx5Xh9bD=JM7oLY6k3ULqKFT86vKx1NsFLYTDK4wqC5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add spinlocks Chinese translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Tang Yizhou <tangyizhou@huawei.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIy5bm0NOaciDEw5pel5ZGo5pelIDEx
OjQ55YaZ6YGT77yaDQo+DQo+DQo+IE9uIDQvOC8yMiAyMjo0NywgVGFuZyBZaXpob3Ugd3JvdGU6
DQo+ID4gVHJhbnNsYXRlIGxvY2tpbmcvc3BpbmxvY2tzLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW5nIFlpemhvdSA8dGFuZ3lpemhvdUBodWF3ZWkuY29tPg0K
Pg0KPg0KPiBSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQpSZXZpZXdl
ZC1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPg0KPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2xvY2tpbmcvc3BpbmxvY2tzLnJzdCAgfCAxNDkg
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDkgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vbG9ja2luZy9zcGlubG9ja3MucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbG9ja2luZy9zcGlubG9ja3MucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbG9ja2luZy9zcGlubG9ja3MucnN0DQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjIwMTdjMDFmMGE0Yg0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9sb2NraW5nL3NwaW5sb2Nrcy5yc3QNCj4gPiBAQCAtMCwwICsxLDE0OSBAQA0KPiA+ICsuLiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsuLiBpbmNsdWRlOjogLi4vZGlz
Y2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9s
b2NraW5nL3NwaW5sb2Nrcy5yc3QNCj4gPiArDQo+ID4gKzrnv7vor5E6DQo+ID4gKw0KPiA+ICsg
IOWUkOiJuuiInyBUYW5nIFlpemhvdSA8dGFuZ3llZWNob3VAZ21haWwuY29tPg0KPiA+ICsNCj4g
PiArPT09PT09PT09PQ0KPiA+ICvliqDplIHnmoTmlZnorq0NCj4gPiArPT09PT09PT09PQ0KPiA+
ICsNCj4gPiAr5pWZ6K6tIDHvvJroh6rml4vplIENCj4gPiArPT09PT09PT09PT09PT0NCj4gPiAr
DQo+ID4gK+WKoOmUgeacgOWfuuacrOeahOWOn+ivreaYr+iHquaXi+mUge+8iHNwaW5sb2Nr77yJ
OjoNCj4gPiArDQo+ID4gKyAgc3RhdGljIERFRklORV9TUElOTE9DSyh4eHhfbG9jayk7DQo+ID4g
Kw0KPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gKw0KPiA+ICsgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZ4eHhfbG9jaywgZmxhZ3MpOw0KPiA+ICsgICAgIC4uLiDov5nph4zmmK/k
uLTnlYzljLogLi4NCj4gPiArICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ4eHhfbG9jaywg
ZmxhZ3MpOw0KPiA+ICsNCj4gPiAr5LiK6L+w5Luj56CB5oC75piv5a6J5YWo55qE44CC6Ieq5peL
6ZSB5bCG5ZyoIF/mnKzlnLBfIOemgeeUqOS4reaWre+8jOS9huWug+acrOi6q+WwhuS/neivgeWF
qOWxgOmUgeWumuOAguaJgOS7peWugw0KPiA+ICvlsIbkv53or4HlnKjor6XplIHkv53miqTnmoTl
jLrln5/lhoXlj6rmnInkuIDkuKrmjqfliLbnur/nqIvjgILljbPkvb/lnKjljZXlpITnkIblmajv
vIhVUO+8ieS4i+S5n+iDveW+iOWlveeahOW3peS9nO+8jA0KPiA+ICvmiYDku6Xku6PnoIEgX+S4
jV8g6ZyA6KaB5ouF5b+DVVDov5jmmK9TTVDnmoTpl67popjvvJroh6rml4vplIHlnKjkuKTnp43m
g4XlhrXkuIvpg73og73mraPluLjlt6XkvZzjgIINCj4gPiArDQo+ID4gKyAgIOazqOaEj++8geiH
quaXi+mUgeWvueWGheWtmOeahOa9nOWcqOW9seWTjeeUseS4i+i/sOaWh+aho+i/m+S4gOatpeaP
j+i/sO+8mg0KPiA+ICsNCj4gPiArICAgICBEb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50
eHQNCj4gPiArDQo+ID4gKyAgICAgICAoNSkgQUNRVUlSRSBvcGVyYXRpb25zLg0KPiA+ICsNCj4g
PiArICAgICAgICg2KSBSRUxFQVNFIG9wZXJhdGlvbnMuDQo+ID4gKw0KPiA+ICvkuIrov7Dku6Pn
oIHpgJrluLjpnZ7luLjnroDljZXvvIjlr7nlpKfpg6jliIbmg4XlhrXvvIzkvaDpgJrluLjpnIDo
poHlubbkuJTlj6rluIzmnJvmnInkuIDkuKroh6rml4vplIHigJTigJTkvb/nlKjlpJrkuKoNCj4g
PiAr6Ieq5peL6ZSB5Lya5L2/5LqL5oOF5Y+Y5b6X5pu05aSN5p2C77yM55Sa6Iez5pu05oWi77yM
6ICM5LiU6YCa5bi45LuF5LuF5Zyo5L2gICoq55CG6Kej55qEKiog5bqP5YiX5pyJ6KKr5ouG5YiG
55qEDQo+ID4gK+mcgOaxguaXtuaJjeWAvOW+l+i/meS5iOWBmu+8muWmguaenOS9oOS4jeehruWu
mueahOivne+8jOivt+S4jeaDnOS4gOWIh+S7o+S7t+mBv+WFjei/meagt+WBmu+8ieOAgg0KPiA+
ICsNCj4gPiAr6L+Z5piv5YWz5LqO6Ieq5peL6ZSB55qE5ZSv5LiA55yf5q2j5Zuw6Zq+55qE6YOo
5YiG77ya5LiA5pem5L2g5byA5aeL5L2/55So6Ieq5peL6ZSB77yM5a6D5Lus5b6A5b6A5Lya5omp
5bGV5Yiw5L2g5Lul5YmNDQo+ID4gK+WPr+iDveayoeacieazqOaEj+WIsOeahOmihuWfn++8jOWb
oOS4uuS9oOW/hemhu+ehruS/neiHquaXi+mUgeato+ehruWcsOS/neaKpOWFseS6q+aVsOaNrue7
k+aehCAqKuavj+S4gOWkhCoqIOiiqw0KPiA+ICvkvb/nlKjnmoTlnLDmlrnjgILoh6rml4vplIHm
mK/mnIDlrrnmmJPooqvmt7vliqDliLDlrozlhajni6znq4vkuo7lhbblroPku6PnoIHnmoTlnLDm
lrnvvIjkvovlpoLvvIzmsqHmnInkurrorr/pl67nmoQNCj4gPiAr5YaF6YOo6amx5Yqo5pWw5o2u
57uT5p6E77yJ55qE44CCDQo+ID4gKw0KPiA+ICsgICDms6jmhI/vvIHku4XlvZPkvaDlnKjot6hD
UFXmoLjorr/pl67ml7bkvb/nlKggKirlkIzkuIDmiooqKiDoh6rml4vplIHvvIzlr7nlroPnmoTk
vb/nlKjmiY3mmK/lronlhajnmoTjgIINCj4gPiArICAg6L+Z5oSP5ZGz552A5omA5pyJ6K6/6Zeu
5YWx5Lqr5Y+Y6YeP55qE5Luj56CB5b+F6aG75a+55a6D5Lus5oOz5L2/55So55qE6Ieq5peL6ZSB
6L6+5oiQ5LiA6Ie044CCDQo+ID4gKw0KPiA+ICstLS0tDQo+ID4gKw0KPiA+ICvmlZnorq0gMu+8
muivuy3lhpnoh6rml4vplIENCj4gPiArPT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr
5aaC5p6c5L2g55qE5pWw5o2u6K6/6Zeu5pyJ5LiA5Liq6Z2e5bi46Ieq54S255qE5qih5byP77yM
5YC+5ZCR5LqO5LuO5YWx5Lqr5Y+Y6YeP5Lit6K+75Y+W5pWw5o2u77yM6K+7LeWGmeiHquaXi+mU
gQ0KPiA+ICvvvIhyd19sb2Nr77yJ5pyJ5pe25piv5pyJ55So55qE44CC5a6D5Lus5YWB6K645aSa
5Liq6K+76ICF5ZCM5pe25Ye6546w5Zyo5ZCM5LiA5Liq5Li055WM5Yy677yM5L2G5piv5aaC5p6c
5pyJ5Lq65oOzDQo+ID4gK+aUueWPmOWPmOmHj++8jOWug+W/hemhu+iOt+W+l+S4gOS4queLrOWN
oOeahOWGmemUgeOAgg0KPiA+ICsNCj4gPiArICAg5rOo5oSP77yB6K+7LeWGmeiHquaXi+mUgeav
lOWOn+Wni+iHquaXi+mUgemcgOimgeabtOWkmueahOWOn+WtkOWGheWtmOaTjeS9nOOAgumZpOmd
nuivu+iAheeahOS4tOeVjOWMuuW+iOmVv++8jA0KPiA+ICsgICDlkKbliJnkvaDmnIDlpb3lj6rk
vb/nlKjljp/lp4voh6rml4vplIHjgIINCj4gPiArDQo+ID4gK+S+i+eoi+eci+i1t+adpeWSjOS4
iumdouS4gOagtzo6DQo+ID4gKw0KPiA+ICsgICByd2xvY2tfdCB4eHhfbG9jayA9IF9fUldfTE9D
S19VTkxPQ0tFRCh4eHhfbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQo+ID4gKw0KPiA+ICsgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZ4eHhfbG9jaywgZmxhZ3Mp
Ow0KPiA+ICsgICAgIC4uIOS7heivu+WPluS/oeaBr+eahOS4tOeVjOWMuiAuLi4NCj4gPiArICAg
ICByZWFkX3VubG9ja19pcnFyZXN0b3JlKCZ4eHhfbG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiAr
ICAgICB3cml0ZV9sb2NrX2lycXNhdmUoJnh4eF9sb2NrLCBmbGFncyk7DQo+ID4gKyAgICAgLi4g
6K+75Y+W5ZKM54us5Y2g5YaZ5L+h5oGvIC4uLg0KPiA+ICsgICAgIHdyaXRlX3VubG9ja19pcnFy
ZXN0b3JlKCZ4eHhfbG9jaywgZmxhZ3MpOw0KPiA+ICsNCj4gPiAr5LiK6Z2i6L+Z56eN6ZSB5a+5
5LqO5aSN5p2C55qE5pWw5o2u57uT5p6E5aaC6ZO+6KGo5Y+v6IO95Lya5pyJ55So77yM54m55Yir
5piv5Zyo5LiN5pS55Y+Y6ZO+6KGo55qE5oOF5Ya15LiL5pCc57Si5YW25LitDQo+ID4gK+eahOad
oeebruOAguivu+mUgeWFgeiuuOiuuOWkmuW5tuWPkeeahOivu+iAheOAguS7u+S9leW4jOacmyAq
KuS/ruaUuSoqIOmTvuihqOeahOS7o+eggeWwhuW/hemhu+WFiOiOt+WPluWGmemUgeOAgg0KPiA+
ICsNCj4gPiArICAg5rOo5oSP77yBUkNV6ZSB5pu06YCC5ZCI6YGN5Y6G6ZO+6KGo77yM5L2G6ZyA
6KaB5LuU57uG5rOo5oSP6K6+6K6h57uG6IqC77yI6KeBRG9jdW1lbnRhdGlvbi9SQ1UvbGlzdFJD
VS5yc3TvvInjgIINCj4gPiArDQo+ID4gK+WPpuWklu+8jOS9oOS4jeiDveaKiuivu+mUgeKAnOWN
h+e6p+KAneS4uuWGmemUge+8jOaJgOS7peWmguaenOS9oOWcqCBf5Lu75L2VXyDml7blgJnpnIDo
poHlgZrku7vkvZXkv67mlLkNCj4gPiAr77yI5Y2z5L2/5L2g5LiN5piv5q+P5qyh6YO96L+Z5qC3
5YGa77yJ77yM5L2g5b+F6aG75Zyo5LiA5byA5aeL5bCx6I635b6X5YaZ6ZSB44CCDQo+ID4gKw0K
PiA+ICsgICDms6jmhI/vvIHmiJHku6zmraPlnKjliqrlipvmtojpmaTlpKflpJrmlbDmg4XlhrXk
uIvnmoTor7st5YaZ6Ieq5peL6ZSB55qE5L2/55So77yM5omA5Lul6K+35LiN6KaB5Zyo5rKh5pyJ
6L6+5oiQDQo+ID4gKyAgIOWFseivhueahOaDheWGteS4i+WinuWKoOS4gOS4quaWsOeahO+8iOeb
uOWPje+8jOivt+WPgumYhURvY3VtZW50YXRpb24vUkNVL3JjdS5yc3Tku6XojrflvpflrozmlbQN
Cj4gPiArICAg5L+h5oGv77yJ44CCDQo+ID4gKw0KPiA+ICstLS0tDQo+ID4gKw0KPiA+ICvmlZno
rq0gM++8mumHjeaWsOWuoeinhuiHquaXi+mUgQ0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09
DQo+ID4gKw0KPiA+ICvkuIrov7DnmoToh6rml4vplIHljp/or63nu53kuI3mmK/llK/kuIDnmoTj
gILlroPku6zmmK/mnIDlronlhajnmoTvvIzlnKjmiYDmnInmg4XlhrXkuIvpg73og73mraPluLjl
t6XkvZzvvIzkvYbpg6jliIYNCj4gPiArKirlm6DkuLoqKiDlroPku6zmmK/lronlhajnmoTvvIzl
roPku6zkuZ/mmK/nm7jlvZPmhaLnmoTjgILlroPku6zmr5Tljp/mnKzpnIDopoHnmoTmm7TmhaLv
vIzlm6DkuLrlroPku6zlv4XpobvopoENCj4gPiAr56aB55So5Lit5pat77yI5ZyoWDg25LiK5Y+q
5piv5LiA5p2h5oyH5Luk77yM5L2G5Y205piv5LiA5p2h5piC6LS155qE5oyH5Luk4oCU4oCU6ICM
5Zyo5YW25LuW5L2T57O757uT5p6E5LiK77yM5oOF5Ya1DQo+ID4gK+WPr+iDveabtOezn++8ieOA
gg0KPiA+ICsNCj4gPiAr5aaC5p6c5L2g5pyJ5b+F6aG75L+d5oqk6LeoQ1BV6K6/6Zeu55qE5pWw
5o2u57uT5p6E5LiU5L2g5oOz5L2/55So6Ieq5peL6ZSB55qE5Zy65pmv77yM5L2g5pyJ5Y+v6IO9
5L2/55So5Luj5Lu35bCP55qEDQo+ID4gK+iHquaXi+mUgeeJiOacrOOAguW9k+S4lOS7heW9k+S9
oOefpemBk+afkOiHquaXi+mUgeawuOi/nOS4jeS8muWcqOS4reaWreWkhOeQhueoi+W6j+S4reS9
v+eUqO+8jOS9oOWPr+S7peS9v+eUqOmdnuS4reaWrQ0KPiA+ICvnmoTniYjmnKw6Og0KPiA+ICsN
Cj4gPiArICAgICBzcGluX2xvY2soJmxvY2spOw0KPiA+ICsgICAgIC4uLg0KPiA+ICsgICAgIHNw
aW5fdW5sb2NrKCZsb2NrKTsNCj4gPiArDQo+ID4gK++8iOW9k+eEtu+8jOS5n+WPr+S7peS9v+eU
qOebuOW6lOeahOivuy3lhpnplIHniYjmnKzvvInjgILov5nnp43oh6rml4vplIHlsIblkIzmoLfl
j6/ku6Xkv53or4Hni6zljaDorr/pl67vvIzogIzkuJQNCj4gPiAr6YCf5bqm5Lya5b+r5b6I5aSa
44CC5aaC5p6c5L2g55+l6YGT5pyJ5YWz55qE5pWw5o2u5Y+q5Zyo4oCc6L+b56iL5LiK5LiL5paH
4oCd5Lit6KKr5a2Y5Y+W77yM5Y2z77yM5LiN5raJ5Y+K5Lit5pat77yMDQo+ID4gK+i/meenjeiH
quaXi+mUgeWwseacieeUqOS6huOAgg0KPiA+ICsNCj4gPiAr5b2T6L+Z5Lqb54mI5pys55qE6Ieq
5peL6ZSB5raJ5Y+K5Lit5pat5pe277yM5L2g5LiN6IO95L2/55So55qE5Y6f5Zug5piv5Lya6Zm3
5YWl5q276ZSBOjoNCj4gPiArDQo+ID4gKyAgICAgc3Bpbl9sb2NrKCZsb2NrKTsNCj4gPiArICAg
ICAuLi4NCj4gPiArICAgICAgICAgICAgIDwtIOS4reaWreadpeS4tO+8mg0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBzcGluX2xvY2soJmxvY2spOw0KPiA+ICsNCj4gPiAr5LiA5Liq5Lit5pat
6K+V5Zu+5a+55LiA5Liq5bey57uP6ZSB5a6a55qE5Y+Y6YeP5LiK6ZSB44CC5aaC5p6c5Lit5pat
5Y+R55Sf5Zyo5Y+m5LiA5LiqQ1BV5LiK77yM5LiN5Lya5pyJ6Zeu6aKY77ybDQo+ID4gK+S9huWm
guaenOS4reaWreWPkeeUn+WcqOW3sue7j+aMgeacieiHquaXi+mUgeeahOWQjOS4gOS4qkNQVeS4
iu+8jOWwhiBf5LyaXyDmnInpl67popjvvIzlm6DkuLror6XplIHmmL7nhLbmsLjov5wNCj4gPiAr
5LiN5Lya6KKr6YeK5pS+77yI5Zug5Li65Lit5pat5q2j5Zyo562J5b6F6K+l6ZSB77yM6ICM6ZSB
55qE5oyB5pyJ6ICF6KKr5Lit5pat5omT5pat77yM5bm25LiU5peg5rOV57un57ut5omn6KGM77yM
DQo+ID4gK+ebtOWIsOS4reaWreWkhOeQhue7k+adn++8ieOAgg0KPiA+ICsNCj4gPiAr77yI6L+Z
5Lmf5piv6Ieq5peL6ZSB55qE5Lit5pat54mI5pys5Y+q6ZyA6KaB56aB55SoIF/mnKzlnLBfIOS4
reaWreeahOWOn+WboOKAlOKAlOWcqOWPkeeUn+S6juWFtuWug0NQVeeahOS4reaWreS4rQ0KPiA+
ICvkvb/nlKjlkIzkuIDmioroh6rml4vplIHmmK/msqHpl67popjnmoTvvIzlm6DkuLrlj5HnlJ/k
uo7lhbblroNDUFXnmoTkuK3mlq3kuI3kvJrmiZPmlq3lt7Lnu4/mjIHplIHnmoRDUFXvvIzmiYDk
u6UNCj4gPiAr6ZSB55qE5oyB5pyJ6ICF5Y+v5Lul57un57ut5omn6KGM5bm25pyA57uI6YeK5pS+
6ZSB77yJ44CCDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgTGludXMNCj4gPiArDQo+ID4gKy0t
LS0NCj4gPiArDQo+ID4gK+WPguiAg+S/oeaBrw0KPiA+ICs9PT09PT09PQ0KPiA+ICsNCj4gPiAr
5a+55LqO5Yqo5oCB5Yid5aeL5YyW77yM5L2/55Soc3Bpbl9sb2NrX2luaXQoKeaIlnJ3bG9ja19p
bml0KCnmmK/lkIjpgILnmoQ6Og0KPiA+ICsNCj4gPiArICAgc3BpbmxvY2tfdCB4eHhfbG9jazsN
Cj4gPiArICAgcndsb2NrX3QgeHh4X3J3X2xvY2s7DQo+ID4gKw0KPiA+ICsgICBzdGF0aWMgaW50
IF9faW5pdCB4eHhfaW5pdCh2b2lkKQ0KPiA+ICsgICB7DQo+ID4gKyAgICAgc3Bpbl9sb2NrX2lu
aXQoJnh4eF9sb2NrKTsNCj4gPiArICAgICByd2xvY2tfaW5pdCgmeHh4X3J3X2xvY2spOw0KPiA+
ICsgICAgIC4uLg0KPiA+ICsgICB9DQo+ID4gKw0KPiA+ICsgICBtb2R1bGVfaW5pdCh4eHhfaW5p
dCk7DQo+ID4gKw0KPiA+ICvlr7nkuo7pnZnmgIHliJ3lp4vljJbvvIzkvb/nlKhERUZJTkVfU1BJ
TkxPQ0soKSAvIERFRklORV9SV0xPQ0soKeaIlg0KPiA+ICtfX1NQSU5fTE9DS19VTkxPQ0tFRCgp
IC8gX19SV19MT0NLX1VOTE9DS0VEKCnmmK/lkIjpgILnmoTjgIINCg==
