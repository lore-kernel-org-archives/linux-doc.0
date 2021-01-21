Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1609AC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCBE02395A
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbhAUJ2D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbhAUJ15 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 04:27:57 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6524C061575
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:27:15 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id d81so2701868iof.3
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PmXDcKZsQnkMVl63ncYIEE6l1cU/wF6luqJoJdzCweY=;
        b=WTb5x8aNJaZN0sz9Pf+EIHjAZnVAAA3F8HcR5Qhefh//zhNAq5Bo4Ag+TK/p93zaiC
         9+BrFZ/D7e34x3q9rmDhYc9AWqm4ypc71/XRzI7dLwPSvMunjhGVo3Jj+kNyitQj/Hhv
         PPuqFKvkSzc2bbzKMfVAunMOydP+Zm2pMGMMf3AenUD4g7YFdz2qczf1Hb2cB0r3CPYk
         VIx+42d6u3CuAOsRFtRppe6a6oERaN/9R6Zri2xRU5S6hQdLzg5FPlum8A1bNe1R1fes
         2aUgfb0HSB+9aNC9iAsR7e8DJx3KDm6lH+N0wYJSrw0XAcZPxURQekJ7/ZNeXqdIAfzG
         aSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PmXDcKZsQnkMVl63ncYIEE6l1cU/wF6luqJoJdzCweY=;
        b=XS8GVGKMxPXDLDjlJM+mb4z76cY+WUlI6zDBQ4Hm3/qmyCPUyIi2AgZLKoJdzfBCu1
         Xc/t0O7gs5ea5kldNXto4GITiZHKe/FCoZLTV3Ep2nCa0Uml/uqiA9Cu7j8+3QSBF1Sp
         FHRGhPc5aQQdxYoVfoxvl10G5SAKJo1kVDytCiveeZi2V/RhAzsvAswSR9r0veHRrblH
         zpdu2vY7ZsB0TynYCvJgZrLYA174nfxutDbbiql7I7PvidNoWmJGoGBcybxQOo4rjjw0
         yrZSNlsJkLsuQwfacKsw3P+vk4zJYGfKNud8BkteL4HAMZUZo7sDe2xutMp1C7VBdN/a
         KTvQ==
X-Gm-Message-State: AOAM532hOMRNINZmQ5v8JMn9+YZGp+ideCMz3UDbm+yja+C+/EoIZjN0
        yuqWbk/FBKNFg9gtwOL5nQZiUFtjpGuhozarVzbdNG27S6JY0A==
X-Google-Smtp-Source: ABdhPJwrMj+712guAfrWhVJ3G+a+gXURgqoLusJZLi8dRC35t7od6lOogNYE2e8Q+3xEPZtnPMqDSFjOSc96I3krMNU=
X-Received: by 2002:a05:6638:50e:: with SMTP id i14mr10891172jar.92.1611221235291;
 Thu, 21 Jan 2021 01:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20210121033302.558935-1-siyanteng@loongson.cn>
In-Reply-To: <20210121033302.558935-1-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Thu, 21 Jan 2021 17:27:05 +0800
Message-ID: <CAAhV-H44phCgb7bUsA6fwi=bSz9sCwJgY9W8dZxKQTv+dOoKGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] docs/zh_CN: add iio iio_configfs.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+DQoNCk9uIFRo
dSwgSmFuIDIxLCAyMDIxIGF0IDExOjMyIEFNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nv
bi5jbj4gd3JvdGU6DQo+DQo+IFRoaXMgcGF0Y2ggdHJhbnNsYXRlcyBEb2N1bWVudGF0aW9uL2lp
by9paW9fY29uZmlnZnMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFu
dGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiBSZXZpZXdlZC1ieTogQWxleCBTaGkg
PGFsZXguc2hpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vaWlvL2lpb19jb25maWdmcy5yc3QgICB8IDEwMiArKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lpby9paW9fY29uZmlnZnMucnN0DQo+
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9paW8vaWlv
X2NvbmZpZ2ZzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lpby9paW9f
Y29uZmlnZnMucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMjIzYmM3MzJjZTY2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaWlvL2lpb19jb25maWdmcy5yc3QNCj4gQEAgLTAsMCArMSwxMDIg
QEANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3Jp
Z2luYWw6IDpkb2M6YC4uLy4uLy4uL2lpby9paW9fY29uZmlnZnNgDQo+ICs6VHJhbnNsYXRvcjog
WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICsuLiBfY25faWlvX2Nv
bmZpZ2ZzOg0KPiArDQo+ICsNCj4gKz09PT09PT09PT09PT09PT09PT09PQ0KPiAr5bel5LiaIElJ
TyBjb25maWdmc+aUr+aMgQ0KPiArPT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gKzEuIOam
gui/sA0KPiArPT09PT09PQ0KPiArDQo+ICtDb25maWdmc+aYr+S4gOenjeWGheaguOWvueixoeea
hOWfuuS6juaWh+S7tuezu+e7n+eahOeuoeeQhuezu+e7n++8jElJT+S9v+eUqOS4gOS6m+WPr+S7
pemAmui/hw0KPiArY29uZmlnZnPovbvmnb7phY3nva7nmoTlr7nosaHvvIjkvovlpoLvvJrorr7l
pIfvvIzop6blj5HlmajvvInjgIINCj4gKw0KPiAr5YWz5LqOY29uZmlnZnPmmK/lpoLkvZXov5Do
oYznmoTvvIzor7fmn6XpmIVEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2NvbmZpZ2ZzLnJzdA0K
PiAr5LqG6Kej5pu05aSa5L+h5oGv44CCDQo+ICsNCj4gKzIuIOeUqOazlQ0KPiArPT09PT09PQ0K
PiAr5Li65LqG5L2/Y29uZmlnZnPmlK/mjIFJSU/vvIzmiJHku6zpnIDopoHlnKjnvJbor5Hml7bp
gInkuK1jb25maWfnmoRDT05GSUdfSUlPX0NPTkZJR0ZTDQo+ICvpgInpobnjgIINCj4gKw0KPiAr
54S25ZCO77yM5oyC6L29Y29uZmlnZnPmlofku7bns7vnu58o6YCa5bi45ZyoIC9jb25maWcgZGly
ZWN0b3J555uu5b2V5LiL77yJ77ya77yaDQo+ICsNCj4gKyAgJCBta2Rpci9jb25maWcNCj4gKyAg
JCBtb3VudCAtdCBjb25maWdmcyBub25lL2NvbmZpZw0KPiArDQo+ICvmraTml7bvvIzlsIbliJvl
u7rmiYDmnInpu5jorqRJSU/nu4TvvIzlubblj6/ku6XlnKgvIGNvbmZpZyAvIGlpb+S4i+WvueWF
tui/m+ihjOiuv+mXruOAgiDkuIvkuIDnq6ANCj4gK+WwhuS7i+e7jeWPr+eUqOeahElJT+mFjee9
ruWvueixoeOAgg0KPiArDQo+ICszLiDova/ku7bop6blj5HlmagNCj4gKz09PT09PT09PT09PT0N
Cj4gKw0KPiArSUlP6buY6K6kY29uZmlnZnPnu4TkuYvkuIDmmK/igJzop6blj5HlmajigJ3nu4Tj
gIIg5oyC6L29Y29uZmlnZnPlkI7lj6/ku6Xoh6rliqjorr/pl67lroPvvIzlubbkuJTlj68NCj4g
K+S7peWcqC9jb25maWcvaWlvL3RyaWdnZXJz5LiL5om+5Yiw44CCDQo+ICsNCj4gK0lJT+i9r+S7
tuinpuWPkeWZqOS4uuWIm+W7uuWkmuenjeinpuWPkeWZqOexu+Wei+aPkOS+m+S6huaUr+aMgeOA
giDpgJrluLjlnKhpbmNsdWRlL2xpbnV4L2lpbw0KPiArL3N3X3RyaWdnZXIuaO+8muS4reeahOaO
peWPo+S4i+WwhuaWsOeahOinpuWPkeWZqOexu+Wei+WunueOsOS4uuWNleeLrOeahOWGheaguOao
oeWdl++8mg0KPiArOjoNCj4gKw0KPiArICAvKg0KPiArICAgKiBkcml2ZXJzL2lpby90cmlnZ2Vy
L2lpby10cmlnLXNhbXBsZS5jDQo+ICsgICAqIOS4gOenjeaWsOinpuWPkeWZqOexu+Wei+eahOWG
heaguOaooeWdl+WunuS+iw0KPiArICAgKi8NCj4gKyAgI2luY2x1ZGUgPGxpbnV4L2lpby9zd190
cmlnZ2VyLmg+DQo+ICsNCj4gKw0KPiArICBzdGF0aWMgc3RydWN0IGlpb19zd190cmlnZ2VyICpp
aW9fdHJpZ19zYW1wbGVfcHJvYmUoY29uc3QgY2hhciAqbmFtZSkNCj4gKyAgew0KPiArICAgICAg
IC8qDQo+ICsgICAgICAgICog6L+Z5bCG5YiG6YWN5bm25rOo5YaM5LiA5LiqSUlP6Kem5Y+R5Zmo
5Lul5Y+K5YW25LuW6Kem5Y+R5Zmo57G75Z6L54m55oCn55qE5Yid5aeL5YyW44CCDQo+ICsgICAg
ICAgICovDQo+ICsgIH0NCj4gKw0KPiArICBzdGF0aWMgaW50IGlpb190cmlnX3NhbXBsZV9yZW1v
dmUoc3RydWN0IGlpb19zd190cmlnZ2VyICpzd3QpDQo+ICsgIHsNCj4gKyAgICAgICAvKg0KPiAr
ICAgICAgICAqIOi/meS8muW6n+W8g2lpb190cmlnX3NhbXBsZV9wcm9iZeS4reeahOaTjeS9nA0K
PiArICAgICAgICAqLw0KPiArICB9DQo+ICsNCj4gKyAgc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9f
c3dfdHJpZ2dlcl9vcHMgaWlvX3RyaWdfc2FtcGxlX29wcyA9IHsNCj4gKyAgICAgICAucHJvYmUg
ICAgICAgICAgPSBpaW9fdHJpZ19zYW1wbGVfcHJvYmUsDQo+ICsgICAgICAgLnJlbW92ZSAgICAg
ICAgID0gaWlvX3RyaWdfc2FtcGxlX3JlbW92ZSwNCj4gKyAgfTsNCj4gKw0KPiArICBzdGF0aWMg
c3RydWN0IGlpb19zd190cmlnZ2VyX3R5cGUgaWlvX3RyaWdfc2FtcGxlID0gew0KPiArICAgICAg
IC5uYW1lID0gInRyaWctc2FtcGxlIiwNCj4gKyAgICAgICAub3duZXIgPSBUSElTX01PRFVMRSwN
Cj4gKyAgICAgICAub3BzID0gJmlpb190cmlnX3NhbXBsZV9vcHMsDQo+ICsgIH07DQo+ICsNCj4g
K21vZHVsZV9paW9fc3dfdHJpZ2dlcl9kcml2ZXIoaWlvX3RyaWdfc2FtcGxlKTsNCj4gKw0KPiAr
5q+P56eN6Kem5Y+R5Zmo57G75Z6L5ZyoL2NvbmZpZy9paW8vdHJpZ2dlcnPkuIvpg73mnInlhbbo
h6rlt7HnmoTnm67lvZXjgIIg5Yqg6L29aWlvLXRyaWctc2FtcGxlDQo+ICvmqKHlnZflsIbliJvl
u7rigJwgdHJpZy1zYW1wbGXigJ3op6blj5Hlmajnsbvlnovnm67lvZUvY29uZmlnL2lpby90cmln
Z2Vycy90cmlnLXNhbXBsZS4NCj4gKw0KPiAr5oiR5Lus5pSv5oyB5Lul5LiL5Lit5pat5rqQ77yI
6Kem5Y+R5Zmo57G75Z6L77yJDQo+ICsNCj4gKyAgICAgICAqIGhydGltZXIs5L2/55So6auY5YiG
6L6o546H5a6a5pe25Zmo5L2c5Li65Lit5pat5rqQDQo+ICsNCj4gKzMuMSBIcnRpbWVy6Kem5Y+R
5Zmo5Yib5bu65LiO6ZSA5q+BDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0K
PiAr5Yqg6L29aWlvLXRyaWctaHJ0aW1lcuaooeWdl+WwhuazqOWGjGhydGltZXLop6blj5Hlmajn
sbvlnovvvIzku47ogIzlhYHorrjnlKjmiLflnKgNCj4gKy9jb25maWcvaWlvL3RyaWdnZXJzL2hy
dGltZXLkuIvliJvlu7pocnRpbWVy6Kem5Y+R5Zmo44CCDQo+ICsNCj4gK+S+i+Wmgjo6DQo+ICsN
Cj4gKyAgJCBta2RpciAvY29uZmlnL2lpby90cmlnZ2Vycy9ocnRpbWVyL2luc3RhbmNlMQ0KPiAr
ICAkIHJtZGlyIC9jb25maWcvaWlvL3RyaWdnZXJzL2hydGltZXIvaW5zdGFuY2UxDQo+ICsNCj4g
K+avj+S4quinpuWPkeWZqOWPr+S7peWFt+acieS4gOS4quaIluWkmuS4queLrOeJueeahOinpuWP
keWZqOexu+Wei+eahOWxnuaAp+OAgg0KPiArDQo+ICszLjIgImhydGltZXIiIOinpuWPkeWZqOex
u+Wei+WxnuaApw0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICsiaHJ0
aW1lcuKAneinpuWPkeWZqOexu+Wei+ayoeacieadpeiHqi9jb25maWcgZGly55qE5Lu75L2V5Y+v
6YWN572u5bGe5oCn44CCDQo+ICvkvYblroPnoa7lrp7lsIbph4fmoLfpopHnjoflsZ7mgKflvJXl
haXkuobop6blj5Hnm67lvZXjgIINCj4gLS0NCj4gMi4yNy4wDQo+DQo=
