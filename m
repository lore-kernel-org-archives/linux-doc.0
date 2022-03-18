Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBE0C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 12:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbiCRMIB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 08:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbiCRMIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 08:08:01 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB992E0446
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 05:06:42 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id 195so9073307iou.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pqlq0P+0rWfQqeTLK+RvFWJ8YCzj24znyY3KOh0Vh/M=;
        b=N+imPzpzl6evLMhNwdgJttGG9rtqLxF8nMb1eIeCMqrJzrX3MkVZnvpI0qYO+76ojy
         HhD3cifWfu11WRpZTZ3KjuWjtHInxfB5SwhTv5XdZxNH56CJRwRzJV0Pu/kGOhAV6B66
         YHwV+33m/Qexz5nZdEWRy4TBXbdsqoKB8WL/Myth/kLs1yy5poS4ow1XjsROEmhD1tuj
         4ahcH63rNrC4eeTgynWmjxmh++bmd3H777yDMy5agIHn5AXB8SbJUY/ACho+nRvWs8+t
         Cgwmrn4KMZGHyzZfhdu+WYlzILy7DYFcX5DcaqjdnySrhsKKz2VMgdQA9qI3DwEHPK+f
         F48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pqlq0P+0rWfQqeTLK+RvFWJ8YCzj24znyY3KOh0Vh/M=;
        b=J8vK82nJwpWvqJTFmjfccsBEaEqYE42puZnj0wOU+h5usorjV//PrQcqDC5DujOZ4M
         blhadJUV5FlgO+PcvqTUlOlMDUWRhtJKi9xoQToPaTNtqf1wKGR6NtQjNHj1q3xN3SdL
         +Rd3jDGPUIPrBhOHbcD5bIaBo4cAxjtk4qxhdps+EGR5p+D+HvmRA7xrseY5ghvMJsP7
         FAgYM4YBFL0/8fDbIFQSuSORCthUl1hr0oafqeSHRZdY6HvmbeqzgcUe9G9pmG4x/1DK
         Wtu3YAlQMgmK91xp3c6P/Dut10pgkL83QIm2ZXhl7V4B6qdth8eDlkSZToPD4JmzbhE1
         J99A==
X-Gm-Message-State: AOAM532AwYYZwLgTpD4A+L59dVLS47vyl8qBFORn1zfAZscg7aNahAub
        fdBqTcs9iWJgNh0lDlacnTNMe78AKCzsKJaf3gNJvjKoHaw=
X-Google-Smtp-Source: ABdhPJzrPi7Q7HSgHV+N1dTYqrZiDsEfB7upgFR1qALObMFof9FMDCBFs+USHPa7RFmhg7VirymmQ4hG/6RmrVbuEyY=
X-Received: by 2002:a05:6638:13cf:b0:319:e4eb:ac0 with SMTP id
 i15-20020a05663813cf00b00319e4eb0ac0mr4268327jaj.209.1647605201721; Fri, 18
 Mar 2022 05:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220317025914.27588-1-tangyizhou@huawei.com>
In-Reply-To: <20220317025914.27588-1-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 18 Mar 2022 20:06:05 +0800
Message-ID: <CAJy-Amn=mPVTEYiM1QRD1a6xDkdVUPAHWorRCiQUEyQo9mPTRg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add sched-debug Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBUaHUsIE1hciAx
NywgMjAyMiBhdCAxMDoyNyBBTSBUYW5nIFlpemhvdSA8dGFuZ3lpemhvdUBodWF3ZWkuY29tPiB3
cm90ZToNCj4NCj4gVHJhbnNsYXRlIHNjaGVkdWxlci9zY2hlZC1kZWJ1Zy5yc3QgaW50byBDaGlu
ZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYW5nIFlpemhvdSA8dGFuZ3lpemhvdUBodWF3ZWku
Y29tPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2luZGV4LnJz
dCAgICB8ICAxICsNCj4gIC4uLi96aF9DTi9zY2hlZHVsZXIvc2NoZWQtZGVidWcucnN0ICAgICAg
ICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTIgaW5z
ZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kZWJ1Zy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0DQo+IGluZGV4
IDEyYmYzYmQwMmNjZi4uNWMwZTA3YWVlMjk5IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5yc3QNCj4gQEAgLTI3LDYg
KzI3LDcgQEAgTGludXjosIPluqblmagNCj4gICAgICBzY2hlZC1lbmVyZ3kNCj4gICAgICBzY2hl
ZC1uaWNlLWRlc2lnbg0KPiAgICAgIHNjaGVkLXN0YXRzDQo+ICsgICAgc2NoZWQtZGVidWcNCj4N
Cj4gIFRPRE9MaXN0Og0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWRlYnVnLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1kZWJ1Zy5yc3QNCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZTE3NzQwYzJiZjMNCj4gLS0tIC9kZXYvbnVs
bA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvc2No
ZWQtZGVidWcucnN0DQo+IEBAIC0wLDAgKzEsNTEgQEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QN
Cj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1kZWJ1Zy5y
c3QNCj4gKw0KPiArOue/u+ivkToNCj4gKw0KPiArICDllJDoibroiJ8gVGFuZyBZaXpob3UgPHRh
bmd5ZWVjaG91QGdtYWlsLmNvbT4NCj4gKw0KPiArPT09PT09PT09PT09PQ0KPiAr6LCD5bqm5Zmo
ZGVidWdmcw0KPiArPT09PT09PT09PT09PQ0KPiArDQo+ICvnlKjphY3nva7poblDT05GSUdfU0NI
RURfREVCVUc9eeWQr+WKqOWGheaguOWQju+8jOWwhuWPr+S7peiuv+mXri9zeXMva2VybmVsL2Rl
YnVnL3NjaGVkDQo+ICvkuIvnmoTosIPluqblmajkuJPnlKjosIPor5Xmlofku7bjgILlhbbkuK3k
uIDkupvmlofku7bmj4/ov7DlpoLkuIvjgIINCj4gKw0KPiArbnVtYV9iYWxhbmNpbmcNCj4gKz09
PT09PT09PT09PT09DQo+ICsNCj4gK2BudW1hX2JhbGFuY2luZ2Ag55uu5b2V55So5p2l5a2Y5pS+
5o6n5Yi26Z2e57uf5LiA5YaF5a2Y6K6/6Zeu77yITlVNQe+8ieW5s+ihoeeJueaAp+eahOebuOWF
s+aWh+S7tuOAgg0KPiAr5aaC5p6c6K+l54m55oCn5a+86Ie057O757uf6LSf6L295aSq6auY77yM
6YKj5LmI5Y+v5Lul6YCa6L+HIGBzY2FuX3BlcmlvZF9taW5fbXMsIHNjYW5fZGVsYXlfbXMsDQo+
ICtzY2FuX3BlcmlvZF9tYXhfbXMsIHNjYW5fc2l6ZV9tYmAg5paH5Lu25o6n5Yi2TlVNQee8uumh
teeahOWGheaguOmHh+agt+mAn+eOh+OAgg0KPiArDQo+ICsNCj4gK3NjYW5fcGVyaW9kX21pbl9t
cywgc2Nhbl9kZWxheV9tcywgc2Nhbl9wZXJpb2RfbWF4X21zLCBzY2FuX3NpemVfbWINCj4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gKw0KPiAr6Ieq5YqoTlVNQeW5s+ihoeS8muaJq+aPj+S7u+WKoeWcsOWdgOep
uumXtO+8jOajgOa1i+mhtemdouaYr+WQpuiiq+ato+ehruaUvue9ru+8jOaIluiAheaVsOaNruaY
r+WQpuW6lOivpeiiqw0KPiAr6L+B56e75Yiw5Lu75Yqh5q2j5Zyo6L+Q6KGM55qE5pys5Zyw5YaF
5a2Y57uT54K577yM5q2k5pe26ZyA6Kej5pig5bCE6aG16Z2i44CC5q+P5Liq4oCc5omr5o+P5bu2
6L+f4oCd77yIc2NhbiBkZWxhee+8iQ0KPiAr5pe26Ze05LmL5ZCO77yM5Lu75Yqh5omr5o+P5YW2
5Zyw5Z2A56m66Ze05Lit5LiL5LiA5om54oCc5omr5o+P5aSn5bCP4oCd77yIc2NhbiBzaXpl77yJ
5Liq6aG16Z2i44CC6Iul5oq16L6+DQo+ICvlhoXlrZjlnLDlnYDnqbrpl7TmnKvlsL7vvIzmiavm
j4/lmajlsIbku47lpLTlvIDlp4vph43mlrDmiavmj4/jgIINCj4gKw0KPiAr57uT5ZCI5p2l55yL
77yM4oCc5omr5o+P5bu26L+f4oCd5ZKM4oCc5omr5o+P5aSn5bCP4oCd5Yaz5a6a5omr5o+P6YCf
546H44CC5b2T4oCc5omr5o+P5bu26L+f4oCd5YeP5bCP5pe277yM5omr5o+P6YCf546HDQo+ICvl
op7liqDjgILigJzmiavmj4/lu7bov5/igJ3lkozmr4/kuKrku7vliqHnmoTmiavmj4/pgJ/njofp
g73mmK/oh6rpgILlupTnmoTvvIzkuJTkvp3otZbljoblj7LooYzkuLrjgILlpoLmnpzpobXpnaLo
oqsNCj4gK+ato+ehruaUvue9ru+8jOmCo+S5iOaJq+aPj+W7tui/n+WwseS8muWinuWKoO+8m+WQ
puWImeaJq+aPj+W7tui/n+WwseS8muWHj+WwkeOAguKAnOaJq+aPj+Wkp+Wwj+KAneS4jeaYr+iH
qumAguW6lOeahO+8jA0KPiAr4oCc5omr5o+P5aSn5bCP4oCd6LaK5aSn77yM5omr5o+P6YCf546H
6LaK6auY44CCDQo+ICsNCj4gK+abtOmrmOeahOaJq+aPj+mAn+eOh+S8muS6p+eUn+abtOmrmOea
hOezu+e7n+W8gOmUgO+8jOWboOS4uuW/hemhu+aNleiOt+e8uumhteW8guW4uO+8jOW5tuS4lOa9
nOWcqOWcsOW/hemhu+i/geenuw0KPiAr5pWw5o2u44CC54S26ICM77yM5b2T5omr5o+P6YCf546H
6LaK6auY77yM6Iul5bel5L2c6LSf6L295qih5byP5Y+R55Sf5Y+Y5YyW77yM5Lu75Yqh55qE5YaF
5a2Y5bCG6LaK5b+r5Zyw6L+B56e75YiwDQo+ICvmnKzlnLDnu5PngrnvvIznlLHkuo7ov5znqIvl
hoXlrZjorr/pl67ogIzkuqfnlJ/nmoTmgKfog73lvbHlk43lsIbpmY3liLDmnIDkvY7jgILkuIvp
naLov5nkupvmlofku7bmjqfliLbmiavmj4/lu7bov58NCj4gK+eahOmYiOWAvOWSjOiiq+aJq+aP
j+eahOmhtemdouaVsOmHj+OAgg0KPiArDQo+ICtgYHNjYW5fcGVyaW9kX21pbl9tc2BgIOaYr+aJ
q+aPj+S4gOS4quS7u+WKoeiZmuaLn+WGheWtmOeahOacgOWwj+aXtumXtO+8jOWNleS9jeaYr+av
q+enkuOAguWug+acieaViOWcsA0KPiAr5o6n5Yi25LqG5q+P5Liq5Lu75Yqh55qE5pyA5aSn5omr
5o+P6YCf546H44CCDQo+ICsNCj4gK2Bgc2Nhbl9kZWxheV9tc2BgIOaYr+S4gOS4quS7u+WKoeWI
neWni+WMluWIm+W7uu+8iGZvcmvvvInml7bvvIznrKzkuIDmrKHkvb/nlKjnmoTigJzmiavmj4/l
u7bov5/igJ3jgIINCj4gKw0KPiArYGBzY2FuX3BlcmlvZF9tYXhfbXNgYCDmmK/miavmj4/kuIDk
uKrku7vliqHomZrmi5/lhoXlrZjnmoTmnIDlpKfml7bpl7TvvIzljZXkvY3mmK/mr6vnp5LjgILl
roPmnInmlYjlnLANCj4gK+aOp+WItuS6huavj+S4quS7u+WKoeeahOacgOWwj+aJq+aPj+mAn+eO
h+OAgg0KPiArDQo+ICtgYHNjYW5fc2l6ZV9tYmBgIOaYr+S4gOasoeeJueWumueahOaJq+aPj+S4
re+8jOimgeaJq+aPj+WkmuWwkeWFhuWtl+iKgu+8iE1C77yJ5a+55bqU55qE6aG16Z2i5pWw44CC
DQo+IC0tDQo+IDIuMTcuMQ0KPg0K
