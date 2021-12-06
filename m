Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDB6C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 08:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238854AbhLFIFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238850AbhLFIFL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 03:05:11 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C820C061354
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 00:01:43 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so12540360oto.13
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 00:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VdEmx2YMnj4BOdoEe9dg3vn0lANy88mIMGAw+T2zWVw=;
        b=mHtabtR0id5jgyr5zyewA6THjfSh50GgJtxvq7eHu4wLmll08c7LI6I/KEhWrUGxmY
         GAzaLn1Sjd8HNNttI9pVjcbV1RjTVAZB2pHzmc6RZ8urnhPXy1g+EUVEp2mG/rKKT6Bj
         xSrDWDYLGcVG7+xm7hB8ug5BbgqCvMxDUsWcrH563JxJLSi+BH6cjx3ahrHuf4sJd8XC
         nj6AVuzA39qFfrQeulRNWQzvinrqEoRFrwgRUQ0Vf6mV2pc84KvvgW8nfwhWreXeqIPn
         85Q4IMkdiBSTNEPg+RVarxK5y4A9SrizJOuw7eArO1KfTWXYeodmDtN8HLnB5C9pfmEL
         5RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VdEmx2YMnj4BOdoEe9dg3vn0lANy88mIMGAw+T2zWVw=;
        b=rnRA6rDDh3Zxr0DVetYNqXOs5hgpvQPICP+P8G1c/kWS+ENUEVmzVnGTPTPXsTnSZo
         K7TBef3cDldD2JOxaLgfJRaoREt4qsoWcKnHhgdAhWWGzJrYcf8wgwUwH8af8M3FHoP+
         5dbbxPNEh5qvVgyIxEPDyZMGlCHla2lcpoj5anzmp/0OEaDV1sgdT2ai2BIz5UXRHcNS
         e7YiX0rRHJSN2A68lcuVxw/bVTjZD38t9c5WSxqPhKmqViWcglXLoi83ALk/EgHm8W+f
         0lG7CmmqpPrw+GPfZ2S1w2Sl+MdJ0W+Y4f4ypgpw59PRc2X4fdx1frH9Z7kavhqcUMAN
         TN4w==
X-Gm-Message-State: AOAM531OR3SH+bJeH4sjk+yKjRnydOtKmaBP3l8rREQhgWB+7sF+Gh2N
        hQRb1lnhHf30wYWq5Z07//ytWMJ4hdWM4wsPVbR4E2D2OXUiXWABfBwc1Q==
X-Google-Smtp-Source: ABdhPJxcs7n8csULz6DsA+cwuK8wMOzmtyCFWB4VhetOKm1aRc6/INNTDAMGdU/lGQRmjCrqgvTaR7lYW1gupIbEnXA=
X-Received: by 2002:a05:6830:1605:: with SMTP id g5mr29081137otr.46.1638777702767;
 Mon, 06 Dec 2021 00:01:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638517064.git.siyanteng@loongson.cn> <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
In-Reply-To: <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 6 Dec 2021 16:01:31 +0800
Message-ID: <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

WWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPiDkuo4yMDIx5bm0MTLmnIgz5pel5ZGo
5LqUIDE2OjA05YaZ6YGT77yaDQo+DQo+IEZyb206IFlhbnRlbmcgU2kgPHNpeWFudGVuZzAxQGdt
YWlsLmNvbT4NCj4NCj4gVHJhbnNsYXRlIC4uLi9zY2hlZHVsZXIvc2NoZWQtYXJjaC5yc3QgaW50
byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+DQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9zY2hlZHVsZXIvaW5k
ZXgucnN0ICAgIHwgIDIgKy0NCj4gIC4uLi96aF9DTi9zY2hlZHVsZXIvc2NoZWQtYXJjaC5yc3Qg
ICAgICAgICAgICB8IDc2ICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0K
Pg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1
bGVyL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxl
ci9pbmRleC5yc3QNCj4gaW5kZXggNWVjNzFlNjA0M2FlLi43OTdkZjNhOWM2NmYgMTAwNjQ0DQo+
IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9pbmRleC5y
c3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL2lu
ZGV4LnJzdA0KPiBAQCAtMjAsMTEgKzIwLDExIEBAIExpbnV46LCD5bqm5ZmoDQo+ICAgICAgOm1h
eGRlcHRoOiAxDQo+DQo+ICAgICAgY29tcGxldGlvbg0KPiArICAgIHNjaGVkLWFyY2gNCj4NCj4N
Cj4gIFRPRE9MaXN0Og0KPg0KPiAtICAgIHNjaGVkLWFyY2gNCj4gICAgICBzY2hlZC1id2MNCj4g
ICAgICBzY2hlZC1kZWFkbGluZQ0KPiAgICAgIHNjaGVkLWRlc2lnbi1DRlMNCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNo
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1h
cmNoLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc1
NGExNWM2YjYwZg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0KPiBAQCAtMCwwICsxLDc2IEBA
DQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdp
bmFsOiBEb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1hcmNoLnJzdA0KPiArDQo+ICs657+7
6K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5j
bj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArDQo+ICsNCj4gKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4gK+aetuaehOeJueWumuS7o+eggeeahENQVeiwg+W6puWZqOWunueO
sOaPkOekug0KPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICsgICAg
ICAgTmljayBQaWdnaW4sIDIwMDUNCj4gKw0KPiAr5LiK5LiL5paH5YiH5o2iDQo+ICs9PT09PT09
PT09DQo+ICsxLiDov5DooYzpmJ/liJfplIENCj4gK+m7mOiupOaDheWGteS4i++8jHN3aXRjaF90
byBhcmNo5Ye95pWw5Zyo6LCD55So5pe26ZSB5a6a5LqG6L+Q6KGM6Zif5YiX44CC6L+Z6YCa5bi4
5LiN5piv5LiA5Liq6Zeu6aKY77yM6Zmk6Z2eDQo+ICtzd2l0Y2hfdG/lj6/og73pnIDopoHojrfl
j5bov5DooYzpmJ/liJfplIHjgILov5npgJrluLjmmK/nlLHkuo7kuIrkuIvmlofliIfmjaLkuK3n
moTllKTphpLmk43kvZzpgKDmiJDnmoTjgILop4ENCj4gK2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9z
d2l0Y2hfdG8uaOeahOS+i+WtkOOAgg0KPiArDQo+ICvkuLrkuobopoHmsYLosIPluqblmajlnKjo
v5DooYzpmJ/liJfop6PplIHnmoTmg4XlhrXkuIvosIPnlKhzd2l0Y2hfdG/vvIzkvaDlv4Xpobvl
nKjlpLTmlofku7YNCj4gK+S4rWAjZGVmaW5lIF9fQVJDSF9XQU5UX1VOTE9DS0VEX0NUWFNXYCjp
gJrluLjmmK/lrprkuYlzd2l0Y2hfdG/nmoTpgqPkuKrmlofku7bvvInjgIINCj4gKw0KPiAr5Zyo
Q09ORklHX1NNUOeahOaDheWGteS4i++8jOino+mUgeeahOS4iuS4i+aWh+WIh+aNouWvueaguOW/
g+iwg+W6puWZqOeahOWunueOsOWPquW4puadpeS6humdnuW4uOWwj+eahOaAp+iDveaNnw0KPiAr
5aSx44CCDQo+ICsNCj4gK0NQVeepuui9rA0KPiArPT09PT09PQ0KPiAr5L2g55qEY3B1X2lkbGXn
qIvluo/pnIDopoHpgbXlrojku6XkuIvop4TliJnvvJoNCj4gKw0KPiArMS4g546w5Zyo5oqi5Y2g
5bqU6K+l5Zyo56m66Zey55qE5L6L56iL5LiK56aB55So44CC5bqU6K+l5Y+q5Zyo6LCD55Soc2No
ZWR1bGUoKeaXtuWQr+eUqO+8jOeEtuWQjuWGjeemgeeUqOOAgg0KPiArDQo+ICsyLiBuZWVkX3Jl
c2NoZWQvVElGX05FRURfUkVTQ0hFRCDlj6rkvJrooqvorr7nva7vvIzlubbkuJTlnKjov5DooYzk
u7vliqHosIPnlKggc2NoZWR1bGUoKQ0KPiArICAg5LmL5YmN5rC46L+c5LiN5Lya6KKr5riF6Zmk
44CC56m66Zey57q/56iL5Y+q6ZyA6KaB5p+l6K+ibmVlZF9yZXNjaGVk77yM5bm25LiU5rC46L+c
5LiN5Lya6K6+572u5oiW5riF6Zmk5a6D44CCDQo+ICsNCj4gKzMuIOW9k2NwdV9pZGxl5Y+R546w
77yIbmVlZF9yZXNjaGVkKCkgPT0gJ3RydWUn77yJ77yM5a6D5bqU6K+l6LCD55Soc2NoZWR1bGUo
KeOAguWQpuWImQ0KPiArICAg5a6D5LiN5bqU6K+l6LCD55Soc2NoZWR1bGUoKeOAgg0KPiArDQo+
ICs0LiDlnKjmo4Dmn6VuZWVkX3Jlc2NoZWTml7bvvIzllK/kuIDpnIDopoHnpoHnlKjkuK3mlq3n
moTmg4XlhrXmmK/vvIzmiJHku6zopoHorqnlpITnkIblmajkvJHnnKDliLDkuIvkuIDkuKrkuK0N
Cj4gKyAgIOaWre+8iOi/meW5tuS4jeWvuW5lZWRfcmVzY2hlZOaPkOS+m+S7u+S9leS/neaKpO+8
jOWug+WPr+S7pemYsuatouS4ouWkseS4gOS4quS4reaWre+8iToNCj4gKw0KPiArICAgICAgIDRh
LiDov5nnp43nnaHnnKDnsbvlnovnmoTluLjop4Hpl67popjkvLzkuY7mmK86Og0KPiArDQo+ICsg
ICAgICAgICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOw0KPiArICAgICAgICAgICAgICAgaWYg
KCFuZWVkX3Jlc2NoZWQoKSkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICBsb2NhbF9pcnFf
ZW5hYmxlKCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICoqKiByZXNjaGVkIGludGVycnVw
dCBhcnJpdmVzIGhlcmUgKioqDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fYXNtX18oInNs
ZWVwIHVudGlsIG5leHQgaW50ZXJydXB0Iik7DQo+ICsgICAgICAgICAgICAgICB9DQo+ICsNCj4g
KzUuIOW9k25lZWRfcmVzY2hlZOWPmOS4uumrmOeUteW5s+aXtu+8jFRJRl9QT0xMSU5HX05SRkxB
R+WPr+S7peeUseS4jemcgOimgeS4reaWreadpeWUpOmGkuWug+S7rA0KPiArICAg55qE56m66Zey
56iL5bqP6K6+572u44CC5o2i5Y+l6K+d6K+077yM5a6D5Lus5b+F6aG75a6a5pyf6L2u6K+ibmVl
ZF9yZXNjaGVk77yM5bC9566h5YGa5LiA5Lqb5ZCO5Y+w5bel5L2c5oiWDQo+ICsgICDov5vlhaXk
vY5DUFXkvJjlhYjnuqflj6/og73mmK/lkIjnkIbnmoTjgIINCj4gKw0KPiArICAgICAgLSA1YS4g
5aaC5p6cVElGX1BPTExJTkdfTlJGTEFH6KKr6K6+572u77yM6ICM5oiR5Lus56Gu5a6e5Yaz5a6a
6L+b5YWl5LiA5Liq5Lit5pat552h55yg77yM6YKjDQo+ICsgICAgICAgICAgICDkuYjpnIDopoHm
uIXpmaTlroPvvIznhLblkI7lj5Hlh7rkuIDkuKrlhoXlrZjlsY/pmpzvvIjmjqXnnYDmtYvor5Vu
ZWVkX3Jlc2NoZWTvvIznpoHnlKjkuK3mlq3vvIzlpoIz5Lit6Kej6YeK77yJ44CCDQo+ICsNCj4g
K2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzLmPmnInova7or6LlkoznnaHnnKDnqbrpl7Llh73mlbDn
moTkvovlrZDjgIINCj4gKw0KPiArDQo+ICvlj6/og73lh7rnjrDnmoRhcmNoL+mXrumimA0KPiAr
PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICvmiJHlj5HnjrDnmoTlj6/og73nmoRhcmNo6Zeu
6aKY77yI5bm26K+V5Zu+6Kej5Yaz5oiW5rKh5pyJ6Kej5Yaz77yJ44CCOg0KPiArDQo+ICtpYTY0
IC0gc2FmZV9oYWx055qE6LCD55So5LiO5Lit5pat55u45q+U77yM5piv5ZCm5b6I6I2S6LCs77yf
ICjlroPnnaHnnKDkuoblkJcpICjlj4LogIMgIzRhKQ0KPiArDQo+ICtzaDY0IC0g552h55yg5LiO
5Lit5pat55u45q+U77yM5piv5ZCm5b6I6I2S6LCs77yfICjlj4LogIMgIzRhKQ0KPiArDQo+ICtz
cGFyYyAtIOWcqOi/meS4gOeCueS4iu+8jElSUeaYr+W8gOedgOeahO+8iO+8n++8ie+8jOaKimxv
Y2FsX2lycV9zYXZl5pS55Li6X2Rpc2FibGXjgIINCj4gKyAgICAgIC0g5b6F5Yqe5LqL6aG5OiDp
nIDopoHnrKzkuozkuKpDUFXmnaXnpoHnlKjmiqLljaAgKOWPguiAgyAjMSkNCj4gLS0NCj4gMi4y
Ny4wDQo+DQoNCkNDICAgIFlpemhvdSB0YW5neWl6aG91QGh1YXdlaS5jb20NCg0KVGhhbmtzLA0K
WWFudGVuZw0K
