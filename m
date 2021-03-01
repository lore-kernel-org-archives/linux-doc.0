Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB16C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 01:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7CCA6146D
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 01:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhCABeN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 20:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhCABeM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Feb 2021 20:34:12 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C796C06174A
        for <linux-doc@vger.kernel.org>; Sun, 28 Feb 2021 17:33:31 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id f6so2833135edd.12
        for <linux-doc@vger.kernel.org>; Sun, 28 Feb 2021 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uXvTb+CIUkmJE9PhuwfBYbEoVyrXVG3RXTqmLF05Wp8=;
        b=Ob3Vi+OExjELQ0OndXtKgivNbVJ1oTECGLwWoyoFqN+vIYK0LWXddVUx09EgxZS746
         NhBkHV2DuXI38AEiN6jLgQjEyE8PyTRVlXdOUxIY3SZ7/8YsseDZfbYTNfMexq2TF414
         +mhTToi6ebhuj5Xwl71U+nQ+iKIy1ojtubRHnc6P4OcSiYASWDh7CTs7qdFIuJ2H70eQ
         XZ8NykU1w4XPR3OZtNchbXkMJ5rnPfxY33wKJBFU12Z+Pz3x1GV+HYKRgeYHIOABZ9mk
         T4iqkHpgdJZfSBBHespBFXWxjzW/74fJgSZimnJmihGYfAEtHc8wyDTE4KYZnZGVVSDv
         mUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uXvTb+CIUkmJE9PhuwfBYbEoVyrXVG3RXTqmLF05Wp8=;
        b=qUtUqc9hcN2hsrhWBMU7e9EOsSP8g6bzOiEu+RsywnNoCVotB1fyUo2Au+8pOJS9G9
         QvVfmtC9173KDfbDJY1VZg0ZFtvtXVCSRhE21E9aqq9B1TFCRDp3I3A6Qg2GGZhm1Y48
         ZCEy3ptGKgpS/NIl0lce9oIt37U+qPau43/w8RW6eWFRLBugffq48V3zIq8AfuBGa+oO
         6DWYeXmz+tsH/Hg++F+0s/6TLJ/CcJuF0Qxtz3URxs5SE2bZUXoPQxc6z5ZX1vvVdJz8
         Y1SLSv+bRhqxGVIynKw0ze0IfUxmYcK9fUXwD5xf5ZIb7ZohC2VD1sNExz/QKSmECpkj
         Z/Rg==
X-Gm-Message-State: AOAM532LCbYK2zIjYazpWzNUsqSlIj603OpSVEx9Kvl3jsFrnONZKU1P
        F1d/OkgEKaLSA6qW2uvh2dJTS1I5M7btvAKsAQw=
X-Google-Smtp-Source: ABdhPJxzTh1JwemmfSuWkhADYwP51kYX2sucQe7iLev89pgRKczuCCM5JCztRkGvliwNoglAjxHvsEIO85nBYmowoEo=
X-Received: by 2002:a05:6402:d05:: with SMTP id eb5mr14066214edb.143.1614562409979;
 Sun, 28 Feb 2021 17:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20210225184136.4526-1-siyanteng@loongson.cn> <20210225184136.4526-2-siyanteng@loongson.cn>
 <69ead859-ec9f-499b-a148-38af97d26da7@www.fastmail.com>
In-Reply-To: <69ead859-ec9f-499b-a148-38af97d26da7@www.fastmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 1 Mar 2021 09:34:16 +0800
Message-ID: <CAEensMw2AaCsk1VTWLH0acvZ5A=hm-kWzrVQbgU0NUU-wa=hUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] docs/zh_CN:add riscv boot-image-header.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T0suIFRoYW5rcyENCg0KWWFudGVuZw0KDQpKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29h
dC5jb20+IOS6jjIwMjHlubQy5pyIMjbml6XlkajkupQg5LiL5Y2IMTI6MzjlhpnpgZPvvJoNCj4N
Cj4NCj4NCj4gT24gRnJpLCBGZWIgMjYsIDIwMjEsIGF0IDI6NDEgQU0sIFlhbnRlbmcgU2kgd3Jv
dGU6DQo+ID4gVGhpcyBwYXRjaCB0cmFuc2xhdGVzIERvY3VtZW50YXRpb24vcmlzY3YvYm9vdC1p
bWFnZS1oZWFkZXIucnN0IGludG9DaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFu
dGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IFJldmlld2VkLWJ5OiBBbGV4IFNo
aSA8YWxleC5zaGlAbGludXguYWxpYmFiYS5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi96aF9DTi9y
aXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L2Jvb3QtaW1h
Z2UtaGVhZGVyLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vcmlzY3YvYm9vdC1pbWFnZS1oZWFkZXIucnN0DQo+ID4gYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9yaXNjdi9ib290LWltYWdlLWhlYWRlci5yc3QN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmFkZmUw
OGQwM2Q1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdA0KPiA+IEBAIC0wLDAgKzEs
NjcgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0K
PiA+ICs6T3JpZ2luYWw6IDpkb2M6YC4uLy4uLy4uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyYA0K
PiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+
ICsNCj4gPiArLi4gX2NuX2Jvb3QtaW1hZ2UtaGVhZGVyLnJzdDoNCj4gPiArDQo+ID4gKw0KPiA+
ICs9PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICtSSVNDLVYgTGludXjlkK/liqjplZzl
g4/mlofku7blpLQNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4g
KzpBdXRob3I6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiA+ICs6RGF0ZTog
ICAyMCBNYXkgMjAxOQ0KPiA+ICsNCj4gPiAr5q2k5paH5qGj5LuF5o+P6L+wUklTQy1WIExpbnV4
IOWQr+WKqOaWh+S7tuWktOeahOivpuaDheOAgg0KPiA+ICsNCj4gPiArVE9ETzoNCj4gPiArICDl
hpnkuIDkuKrlrozmlbTnmoTlkK/liqjmjIfljZfjgIINCj4gPiArDQo+ID4gK+WcqOino+WOi+WQ
jueahExpbnV45YaF5qC46ZWc5YOP5Lit5a2Y5Zyo5Lul5LiLNjTlrZfoioLnmoTmlofku7blpLQ6
Og0KPiA+ICsNCj4gPiArICAgICB1MzIgY29kZTA7ICAgICAgICAgICAgICAgIC8qIEV4ZWN1dGFi
bGUgY29kZSAqLw0KPiA+ICsgICAgIHUzMiBjb2RlMTsgICAgICAgICAgICAgICAgLyogRXhlY3V0
YWJsZSBjb2RlICovDQo+ID4gKyAgICAgdTY0IHRleHRfb2Zmc2V0OyAgICAgICAgICAvKiBJbWFn
ZSBsb2FkIG9mZnNldCwgbGl0dGxlIGVuZGlhbiAqLw0KPiA+ICsgICAgIHU2NCBpbWFnZV9zaXpl
OyAgICAgICAgICAgLyogRWZmZWN0aXZlIEltYWdlIHNpemUsIGxpdHRsZSBlbmRpYW4gKi8NCj4g
PiArICAgICB1NjQgZmxhZ3M7ICAgICAgICAgICAgICAgIC8qIGtlcm5lbCBmbGFncywgbGl0dGxl
IGVuZGlhbiAqLw0KPiA+ICsgICAgIHUzMiB2ZXJzaW9uOyAgICAgICAgICAgICAgLyogVmVyc2lv
biBvZiB0aGlzIGhlYWRlciAqLw0KPiA+ICsgICAgIHUzMiByZXMxID0gMDsgICAgICAgICAgICAg
LyogUmVzZXJ2ZWQgKi8NCj4gPiArICAgICB1NjQgcmVzMiA9IDA7ICAgICAgICAgICAgIC8qIFJl
c2VydmVkICovDQo+ID4gKyAgICAgdTY0IG1hZ2ljID0gMHg1NjQzNTM0OTUyOyAvKiBNYWdpYyBu
dW1iZXIsIGxpdHRsZSBlbmRpYW4sICJSSVNDViIgKi8NCj4gPiArICAgICB1MzIgbWFnaWMyID0g
MHgwNTQzNTM1MjsgIC8qIE1hZ2ljIG51bWJlciAyLCBsaXR0bGUgZW5kaWFuLCAiUlNDXHgwNSIN
Cj4gPiAqLw0KPiA+ICsgICAgIHUzMiByZXMzOyAgICAgICAgICAgICAgICAgLyogUmVzZXJ2ZWQg
Zm9yIFBFIENPRkYgb2Zmc2V0ICovDQo+ID4gKw0KPiA+ICvov5nnp43lpLTmoLzlvI/kuI5QRS9D
T0ZG5paH5Lu25aS05YW85a6577yM5bm25Zyo5b6I5aSn56iL5bqm5LiK5Y+X5YiwQVJNNjTmlofk
u7blpLTnmoTlkK/lj5HjgILlm6DmraTvvIxBUk02NA0KPiA+ICvlkoxSSVNDLVbmlofku7blpLTl
j6/ku6XlnKjmnKrmnaXlkIjlubbkuLrkuIDkuKrlhbHlkIznmoTlpLTjgIINCj4gPiArDQo+ID4g
K+azqOaEjw0KPiA+ICs9PT09DQo+ID4gKw0KPiA+ICstIOWwhuadpeS5n+WPr+S7peWkjeeUqOi/
meS4quaWh+S7tuWktO+8jOeUqOadpeWvuVJJU0MtVueahEVGSeahqeaPkOS+m+aUr+aMgeOAguS4
uuS6huS9v+WGheaguOmVnOWDj+WmguWQjOS4gOS4qg0KPiA+ICsgIEVGSeW6lOeUqOeoi+W6j+S4
gOagt+WKoOi9ve+8jEVGSeinhOiMg+S4reinhOWumuWcqOWGheaguOmVnOWDj+eahOW8gOWni+mc
gOimgVBFL0NPRkbplZzlg4/mlofku7blpLTjgILkuLrkuoYNCj4gPiArICDmlK/mjIFFRknmoanv
vIzlupTor6XnlKjigJxNWuKAnemtlOacr+Wtl+espuabv+aNouaOiWNvZGUw77yM5bm25LiUcmVz
M++8iOWBj+enu+mHj+acqjB4M2PvvInlupTmjIflkJFQRS9DT0ZGDQo+IOS4ujB4M2MgLT4g5Li6
IDB4M2M/DQo+IEFsc28gSSdkIHByZWZlciBub3QgdG8gdHJhbnNsYXRlIHN0dWIgYXMgaXQgYWxy
ZWFkeSBiZWNvbWUgYSB3ZWxsIGtub3duIG5vdW4uDQo+DQo+ID4gKyAg5paH5Lu25aS055qE5YW2
5L2Z6YOo5YiGLg0KPiA+ICsNCj4gPiArLSDooajnpLrmlofku7blpLTnmoTniYjmnKzlj7fnmoRi
aXTkvY3ln58NCj4gRHJvcCBiaXQNCj4NCj4gPiArDQo+ID4gKyAgICAgPT09PT09PT09PSAgPT09
PT09PT09PQ0KPiA+ICsgICAgIEJpdHMgMDoxNSAgIOasoeimgSAg54mI5pysDQo+ID4gKyAgICAg
Qml0cyAxNjozMSAg5Li76KaBICDniYjmnKwNCj4gPiArICAgICA9PT09PT09PT09ICA9PT09PT09
PT09DQo+ID4gKw0KPiA+ICsgIOi/meS/neaMgeS6huaWsOaXp+eJiOacrOS5i+mXtOeahOWFvOWu
ueaAp+OAgg0KPiA+ICsgIOW9k+WJjeeJiOacrOiiq+WumuS5ieS4ujAuMuOAgg0KPiA+ICsNCj4g
PiArLSDku47niYjmnKwwLjLlvIDlp4vvvIznu5PmnoTkvZPmiJDlkZjigJxtYWdpY+KAneWwseW3
sue7j+iiq+W8g+eUqO+8jOWcqOS5i+WQjueahOeJiOacrOS4re+8jOWPr+iDveS8muenu+mZpOaO
ieWug+OAgg0KPiA+ICsgIOacgOWIne+8jOivpeaIkOWRmOW6lOivpeS4jkFSTTY05aS055qE4oCc
bWFnaWPigJ3miJDlkZjljLnphY3vvIzkvYbpgZfmhr7nmoTmmK/lubbmsqHmnInjgIINCj4gPiAr
ICDigJxtYWdpYzLigJ3miJDlkZjku6Pmm7/igJxtYWdpY+KAneaIkOWRmOS4jkFSTTY05aS055u4
5Yy56YWN44CCDQo+ID4gKw0KPiA+ICstIOWcqOW9k+WJjeeahOaWh+S7tuWktO+8jOagh+W/l+S9
jeWfn+WPquWJqeS4i+S6huS4gOS4quOAgg0KPiDliankuIvkuobkuIDkuKrkvY0NCj4NCj4gPiAr
DQo+ID4gKyAgICAgPT09PT0gID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsg
ICAgIEJpdCAwICDlhoXmoLjlrZfoioLluo/jgIIxIGlmIEJFLCAwIGlmIExFLg0KPiA+ICsgICAg
ID09PT09ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gKy0g5a+5
5LqO5byV5a+85Yqg6L2956iL5bqP5Yqg6L295YaF5qC45pig5YOP5p2l6K+077yMaW1hZ2Vfc2l6
ZeaIkOWRmOaYr+W8uuWItuaAp+imgeWGmei/m+aWh+S7tuWktOeahO+8jOWQpuWImeWwhuW8lQ0K
PiA+ICsgIOWvvOWksei0peOAgg0KPiBJbWFnZSBzaXplIOaIkOWRmOWvueW8leWvvOWKoOi9veeo
i+W6jyhvciDliqDovb3lmajvvJ8pIOiAjOiogOaYr+W/hemhu+eahOOAgg0KPg0KPiA+IC0tDQo+
ID4gMi4yNS4xDQo+ID4NCj4gPg0KPg0KPiAtLQ0KPiAtIEppYXh1bg0K
