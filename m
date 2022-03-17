Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9056C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 05:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiCQFUl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 01:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiCQFUk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 01:20:40 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAD1274290
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 22:08:54 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y142so8177894ybe.11
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 22:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FleboilfAs5RIuKPpayJ5FwkyFa4YCroft1wIOsVIeo=;
        b=gSHvH4olQWTeC/Etz4fQ7g/vSrZCUoVv78sqnaYD3w9M2o5WqQ2338DSXUceliauhM
         7tglex9h8bMakFB8KkhPAdpw1+tVi7Na0WCBf1wmiZafebc/h6K0ZiBlwNjJtpXfwKpF
         UQXXv56T2/vvnIZ7uxBwwKjntdcQFBSvNgc5VCrSZRDxmyy+J29VXBWClL1V98oprNMz
         X1DpYqI9FBTnLB7XpBykBDA9dKFXFSWDhY1tIpEZGyfw3nPcN5STBFe7NnbGPr+afN/B
         ikjry9tn/YDT4jXC92aolCH0rrYD5yPAsY8qzoPM326I4a+rSdD+7KPcXp9p35TeLcZS
         AIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FleboilfAs5RIuKPpayJ5FwkyFa4YCroft1wIOsVIeo=;
        b=RPLP9XPAyuxG/z40DiU7IpVZ5Kb2DQDs2j15t74ArNKDtAYJ1aZC5+iPUTWBAlvftf
         A2uEpJmUF7xZO5/ByhXI5GXvJXTAbmpsESlH1Gy3C8KwqInvBuYyEj3pBqzIQQfwGIbo
         VBNfJba5idvlpnGff9fNf4kAJ/rXo4qTbUQTsStY/4XjJUwVCy/fjDyoKYWyUb4BzqGS
         xkODBS1kMO9myAaWNtBci6Z9fYXU1k4jZpDg9+W69K+7CcSOFVlG/U+L2fx78Mmb+wun
         7DSY6DkZZYkyaepxbTEPYTRhjHbCl0MLNY8JQ4oB9YDiqf5kCh8ymm2H5KKhDnY+kN0K
         Re2Q==
X-Gm-Message-State: AOAM533/c5HVl6FUFK6jwCjLNv4/hmNApPr9cauL0w39UJTqAAYIMbEO
        xRYUUgrTTK1WY+v2UHC4vCiSlcCn+Exj4eWKI8fehoi8AYIvU2rB
X-Google-Smtp-Source: ABdhPJxWfUj0BANt43A/GqYa4nra0ri6kQ2zH9vcUDa33Tv3U3yG01hZgb4HPg/jEB7dZWn4vWbnbo7afahk9HJ9Jag=
X-Received: by 2002:a25:e08f:0:b0:633:7d68:f21a with SMTP id
 x137-20020a25e08f000000b006337d68f21amr3212086ybg.650.1647490045941; Wed, 16
 Mar 2022 21:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220317025914.27588-1-tangyizhou@huawei.com>
In-Reply-To: <20220317025914.27588-1-tangyizhou@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 17 Mar 2022 12:07:13 +0800
Message-ID: <CAEensMzNoiJHWUCgr0=wUBS+kg0XPYSBMuOAyBd9CfD-Wa5kUA@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-debug Chinese translation
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

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMuW5tDPmnIgxN+aXpeWR
qOWbmyAxMDoyN+WGmemBk++8mg0KPg0KPiBUcmFuc2xhdGUgc2NoZWR1bGVyL3NjaGVkLWRlYnVn
LnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmcgWWl6aG91IDx0YW5n
eWl6aG91QGh1YXdlaS5jb20+DQpSZXZpZXdlZC1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2lu
ZGV4LnJzdCAgICB8ICAxICsNCj4gIC4uLi96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZGVidWcucnN0
ICAgICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kZWJ1Zy5yc3QNCj4NCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0DQo+
IGluZGV4IDEyYmYzYmQwMmNjZi4uNWMwZTA3YWVlMjk5IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5yc3QNCj4gQEAg
LTI3LDYgKzI3LDcgQEAgTGludXjosIPluqblmagNCj4gICAgICBzY2hlZC1lbmVyZ3kNCj4gICAg
ICBzY2hlZC1uaWNlLWRlc2lnbg0KPiAgICAgIHNjaGVkLXN0YXRzDQo+ICsgICAgc2NoZWQtZGVi
dWcNCj4NCj4gIFRPRE9MaXN0Og0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWRlYnVnLnJzdCBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kZWJ1Zy5yc3QNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZTE3NzQwYzJiZjMNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVs
ZXIvc2NoZWQtZGVidWcucnN0DQo+IEBAIC0wLDAgKzEsNTEgQEANCj4gKy4uIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9D
Ti5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1k
ZWJ1Zy5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArICDllJDoibroiJ8gVGFuZyBZaXpo
b3UgPHRhbmd5ZWVjaG91QGdtYWlsLmNvbT4NCj4gKw0KPiArPT09PT09PT09PT09PQ0KPiAr6LCD
5bqm5ZmoZGVidWdmcw0KPiArPT09PT09PT09PT09PQ0KPiArDQo+ICvnlKjphY3nva7poblDT05G
SUdfU0NIRURfREVCVUc9eeWQr+WKqOWGheaguOWQju+8jOWwhuWPr+S7peiuv+mXri9zeXMva2Vy
bmVsL2RlYnVnL3NjaGVkDQo+ICvkuIvnmoTosIPluqblmajkuJPnlKjosIPor5Xmlofku7bjgILl
hbbkuK3kuIDkupvmlofku7bmj4/ov7DlpoLkuIvjgIINCj4gKw0KPiArbnVtYV9iYWxhbmNpbmcN
Cj4gKz09PT09PT09PT09PT09DQo+ICsNCj4gK2BudW1hX2JhbGFuY2luZ2Ag55uu5b2V55So5p2l
5a2Y5pS+5o6n5Yi26Z2e57uf5LiA5YaF5a2Y6K6/6Zeu77yITlVNQe+8ieW5s+ihoeeJueaAp+ea
hOebuOWFs+aWh+S7tuOAgg0KPiAr5aaC5p6c6K+l54m55oCn5a+86Ie057O757uf6LSf6L295aSq
6auY77yM6YKj5LmI5Y+v5Lul6YCa6L+HIGBzY2FuX3BlcmlvZF9taW5fbXMsIHNjYW5fZGVsYXlf
bXMsDQo+ICtzY2FuX3BlcmlvZF9tYXhfbXMsIHNjYW5fc2l6ZV9tYmAg5paH5Lu25o6n5Yi2TlVN
Qee8uumhteeahOWGheaguOmHh+agt+mAn+eOh+OAgg0KPiArDQo+ICsNCj4gK3NjYW5fcGVyaW9k
X21pbl9tcywgc2Nhbl9kZWxheV9tcywgc2Nhbl9wZXJpb2RfbWF4X21zLCBzY2FuX3NpemVfbWIN
Cj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr6Ieq5YqoTlVNQeW5s+ihoeS8muaJq+aPj+S7u+WKoeWc
sOWdgOepuumXtO+8jOajgOa1i+mhtemdouaYr+WQpuiiq+ato+ehruaUvue9ru+8jOaIluiAheaV
sOaNruaYr+WQpuW6lOivpeiiqw0KPiAr6L+B56e75Yiw5Lu75Yqh5q2j5Zyo6L+Q6KGM55qE5pys
5Zyw5YaF5a2Y57uT54K577yM5q2k5pe26ZyA6Kej5pig5bCE6aG16Z2i44CC5q+P5Liq4oCc5omr
5o+P5bu26L+f4oCd77yIc2NhbiBkZWxhee+8iQ0KPiAr5pe26Ze05LmL5ZCO77yM5Lu75Yqh5omr
5o+P5YW25Zyw5Z2A56m66Ze05Lit5LiL5LiA5om54oCc5omr5o+P5aSn5bCP4oCd77yIc2NhbiBz
aXpl77yJ5Liq6aG16Z2i44CC6Iul5oq16L6+DQo+ICvlhoXlrZjlnLDlnYDnqbrpl7TmnKvlsL7v
vIzmiavmj4/lmajlsIbku47lpLTlvIDlp4vph43mlrDmiavmj4/jgIINCj4gKw0KPiAr57uT5ZCI
5p2l55yL77yM4oCc5omr5o+P5bu26L+f4oCd5ZKM4oCc5omr5o+P5aSn5bCP4oCd5Yaz5a6a5omr
5o+P6YCf546H44CC5b2T4oCc5omr5o+P5bu26L+f4oCd5YeP5bCP5pe277yM5omr5o+P6YCf546H
DQo+ICvlop7liqDjgILigJzmiavmj4/lu7bov5/igJ3lkozmr4/kuKrku7vliqHnmoTmiavmj4/p
gJ/njofpg73mmK/oh6rpgILlupTnmoTvvIzkuJTkvp3otZbljoblj7LooYzkuLrjgILlpoLmnpzp
obXpnaLooqsNCj4gK+ato+ehruaUvue9ru+8jOmCo+S5iOaJq+aPj+W7tui/n+WwseS8muWinuWK
oO+8m+WQpuWImeaJq+aPj+W7tui/n+WwseS8muWHj+WwkeOAguKAnOaJq+aPj+Wkp+Wwj+KAneS4
jeaYr+iHqumAguW6lOeahO+8jA0KPiAr4oCc5omr5o+P5aSn5bCP4oCd6LaK5aSn77yM5omr5o+P
6YCf546H6LaK6auY44CCDQo+ICsNCj4gK+abtOmrmOeahOaJq+aPj+mAn+eOh+S8muS6p+eUn+ab
tOmrmOeahOezu+e7n+W8gOmUgO+8jOWboOS4uuW/hemhu+aNleiOt+e8uumhteW8guW4uO+8jOW5
tuS4lOa9nOWcqOWcsOW/hemhu+i/geenuw0KPiAr5pWw5o2u44CC54S26ICM77yM5b2T5omr5o+P
6YCf546H6LaK6auY77yM6Iul5bel5L2c6LSf6L295qih5byP5Y+R55Sf5Y+Y5YyW77yM5Lu75Yqh
55qE5YaF5a2Y5bCG6LaK5b+r5Zyw6L+B56e75YiwDQo+ICvmnKzlnLDnu5PngrnvvIznlLHkuo7o
v5znqIvlhoXlrZjorr/pl67ogIzkuqfnlJ/nmoTmgKfog73lvbHlk43lsIbpmY3liLDmnIDkvY7j
gILkuIvpnaLov5nkupvmlofku7bmjqfliLbmiavmj4/lu7bov58NCj4gK+eahOmYiOWAvOWSjOii
q+aJq+aPj+eahOmhtemdouaVsOmHj+OAgg0KPiArDQo+ICtgYHNjYW5fcGVyaW9kX21pbl9tc2Bg
IOaYr+aJq+aPj+S4gOS4quS7u+WKoeiZmuaLn+WGheWtmOeahOacgOWwj+aXtumXtO+8jOWNleS9
jeaYr+avq+enkuOAguWug+acieaViOWcsA0KPiAr5o6n5Yi25LqG5q+P5Liq5Lu75Yqh55qE5pyA
5aSn5omr5o+P6YCf546H44CCDQo+ICsNCj4gK2Bgc2Nhbl9kZWxheV9tc2BgIOaYr+S4gOS4quS7
u+WKoeWIneWni+WMluWIm+W7uu+8iGZvcmvvvInml7bvvIznrKzkuIDmrKHkvb/nlKjnmoTigJzm
iavmj4/lu7bov5/igJ3jgIINCj4gKw0KPiArYGBzY2FuX3BlcmlvZF9tYXhfbXNgYCDmmK/miavm
j4/kuIDkuKrku7vliqHomZrmi5/lhoXlrZjnmoTmnIDlpKfml7bpl7TvvIzljZXkvY3mmK/mr6vn
p5LjgILlroPmnInmlYjlnLANCj4gK+aOp+WItuS6huavj+S4quS7u+WKoeeahOacgOWwj+aJq+aP
j+mAn+eOh+OAgg0KPiArDQo+ICtgYHNjYW5fc2l6ZV9tYmBgIOaYr+S4gOasoeeJueWumueahOaJ
q+aPj+S4re+8jOimgeaJq+aPj+WkmuWwkeWFhuWtl+iKgu+8iE1C77yJ5a+55bqU55qE6aG16Z2i
5pWw44CCDQo+IC0tDQo+IDIuMTcuMQ0KPg0K
