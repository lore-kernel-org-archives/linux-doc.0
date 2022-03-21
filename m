Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA99C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 03:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344262AbiCUDBh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Mar 2022 23:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbiCUDBh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Mar 2022 23:01:37 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13014F211E
        for <linux-doc@vger.kernel.org>; Sun, 20 Mar 2022 20:00:13 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b9so9540157ila.8
        for <linux-doc@vger.kernel.org>; Sun, 20 Mar 2022 20:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8ZDRlhu0XvTiiuL/Gyihgbru4KfchQNT5Xd0l+YXT4c=;
        b=i+i47bznjROMHrs3LXJbDVlPC6LwQk+Lp54Lv+qmx3fFFKOBlTzu7PpfCWlxcXft5o
         74qXhai9Cs2ugZJRDY9bvLhyoIQinC6BT4UkZupEGy+9jKJjTObk88Kq4sH+cuygGCfm
         4qM3WnVi/mPdUFbFoGWL5gyxNXDNsb9lOSDpq+44HNRMkfNx/xE/6rRJJHzk6Xm5ruSk
         XvJCd2s3QIRrT5FXUvlvteG6zp+GiGA7eIqVGIfBdGvoYYnr8Bc05GFpEVPkY/ecfS/K
         vfiKVf0tTPf5wNs0ztdh6JJG+lSVlvN7nvbJ73Zi3m+cifZsorw/fJUwBC3tsLekuuV7
         rlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8ZDRlhu0XvTiiuL/Gyihgbru4KfchQNT5Xd0l+YXT4c=;
        b=qTkyYsGi6x8UZZs5TJqF7MO2YutSFePDH0x+POHk+U6xb6NMtQjf3LPI/oXGfrXdI8
         FpEq1h8SReaesJz53/m9kkVBj43vxWl4KSXdl+vU1ayAZKToSk81EQu6IU3rpbrMkGrD
         7GNDf/fpJqxFvlGJV7Y2RcQHTo30Ofhr9jkH/ghJYIWeBXmfpBlqajTm1kBWEzAYOq3I
         gm5rFFS1m5qfFoWc48ir/SkA6NtYU7wP6MzQLvJq3PgvBSjOpNwd/2poOeMkURq0CzBt
         fINtn6KZ+y/FfenANzt1cODL3eKicRe3/MztOnYy9jawC9XBZE7ZgAE7gIi/tGwwmNvv
         40lQ==
X-Gm-Message-State: AOAM530F80sStcqNxX6/nSckp84jmhk1cC30OJlh3OzRJfA+EA5iuBGz
        TnHrGFHKTjil7Xn99sgemiChAE8fO7liEEPaof0=
X-Google-Smtp-Source: ABdhPJzUArDOSwJMcqYm5TwZfi6JPlbnzxyuEFvYfilyiAl38aQTuSwb3SyHHkDSpNFYcsbH1FP1W65u4qCE+Cgd8Q0=
X-Received: by 2002:a92:cac4:0:b0:2c8:1095:b352 with SMTP id
 m4-20020a92cac4000000b002c81095b352mr3551757ilq.103.1647831612508; Sun, 20
 Mar 2022 20:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647598049.git.siyanteng@loongson.cn> <b996bc4cc9db7517d9938c19edbab86313d0dc7f.1647598049.git.siyanteng@loongson.cn>
In-Reply-To: <b996bc4cc9db7517d9938c19edbab86313d0dc7f.1647598049.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 21 Mar 2022 10:59:36 +0800
Message-ID: <CAJy-AmkjqpCQN9YYZZJg7nk04r=nwUFx5Xu-jfqB-43-amHXxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN/damon: update outdated term 'regions
 update interval'
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgNjoxMSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBTaW5jZSAwNzJmZDFiNDcyMTUoIkRvY3MvZGFtb246IHVw
ZGF0ZSBvdXRkYXRlZCB0ZXJtICdyZWdpb25zIHVwZGF0ZSBpbnRlcnZhbCciKQ0KPiB1c2UgdXBk
YXRlIGludGVydmFsLHpoX0NOIHNob3VsZCB1c2Ug5pu05paw6Ze06ZqULCBzbyBsZXQncyBzeW5j
IHVwZGF0ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25n
c29uLmNuPg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQo+IC0t
LQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9tbS9kYW1vbi91c2FnZS5y
c3QgICAgICB8IDYgKysrLS0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
bS9kYW1vbi9kZXNpZ24ucnN0ICAgICAgIHwgNyArKysrLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2RhbW9uL3VzYWdlLnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2RhbW9u
L3VzYWdlLnJzdA0KPiBpbmRleCA1ZDc1MzMzNDcyMTYuLjEwYjlhYzc2NjRkMyAxMDA2NDQNCj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvbW0vZGFt
b24vdXNhZ2UucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Fk
bWluLWd1aWRlL21tL2RhbW9uL3VzYWdlLnJzdA0KPiBAQCAtNDYsNyArNDYsNyBAQCBEQU1PTuWv
vOWHuuS6huWFq+S4quaWh+S7tiwgYGBhdHRyc2BgLCBgYHRhcmdldF9pZHNgYCwgYGBpbml0X3Jl
Z2lvbnNgYCwNCj4gIOWxnuaApw0KPiAgLS0tLQ0KPg0KPiAt55So5oi35Y+v5Lul6YCa6L+H6K+7
5Y+W5ZKM5YaZ5YWlIGBgYXR0cnNgYCDmlofku7bojrflvpflkozorr7nva4gYGDph4fmoLfpl7Tp
mpRgYCDjgIEgYGDogZrpm4bpl7TpmpRgYCDjgIEgYGDljLrln5/mm7TmlrDpl7TpmpRgYA0KPiAr
55So5oi35Y+v5Lul6YCa6L+H6K+75Y+W5ZKM5YaZ5YWlIGBgYXR0cnNgYCDmlofku7bojrflvpfl
kozorr7nva4gYGDph4fmoLfpl7TpmpRgYCDjgIEgYGDogZrpm4bpl7TpmpRgYCDjgIEgYGDmm7Tm
lrDpl7TpmpRgYA0KPiAg5Lul5Y+K55uR5rWL55uu5qCH5Yy65Z+f55qE5pyA5bCPL+acgOWkp+aV
sOmHj+OAguimgeivpue7huS6huino+ebkea1i+WxnuaAp++8jOivt+WPguiAgyBgOmRvYzovdm0v
ZGFtb24vZGVzaWduYCDjgILkvovlpoLvvIwNCj4gIOS4i+mdoueahOWRveS7pOWwhui/meS6m+WA
vOiuvue9ruS4ujVtc+OAgTEwMG1z44CBMTAwMG1z44CBMTDlkowxMDAw77yM54S25ZCO5YaN5qyh
5qOA5p+lOjoNCj4NCj4gQEAgLTEwOCw4ICsxMDgsOCBAQCBEQU1PTuWvvOWHuuS6huWFq+S4quaW
h+S7tiwgYGBhdHRyc2BgLCBgYHRhcmdldF9pZHNgYCwgYGBpbml0X3JlZ2lvbnNgYCwNCj4gICAg
ICAgICAgICAgIDEgICAyMCAgICAgIDQwDQo+ICAgICAgICAgICAgICAxICAgNTAgICAgICAxMDAi
ID4gaW5pdF9yZWdpb25zDQo+DQo+IC3or7fms6jmhI/vvIzov5nlj6rmmK/orr7nva7kuobliJ3l
p4vnmoTnm5HmtYvnm67moIfljLrln5/jgILlnKjomZrmi5/lhoXlrZjnm5HmtYvnmoTmg4XlhrXk
uIvvvIxEQU1PTuS8muWcqOS4gOS4qiBgYOWMuuWfn+abtOaWsOmXtOmalGBgDQo+IC3lkI7oh6rl
iqjmm7TmlrDljLrln5/nmoTovrnnlYzjgILlm6DmraTvvIzlnKjov5nnp43mg4XlhrXkuIvvvIzl
poLmnpznlKjmiLfkuI3luIzmnJvmm7TmlrDnmoTor53vvIzlupTor6XmioogYGDljLrln5/nmoTm
m7TmlrDpl7TpmpRgYCDorr4NCj4gK+ivt+azqOaEj++8jOi/meWPquaYr+iuvue9ruS6huWIneWn
i+eahOebkea1i+ebruagh+WMuuWfn+OAguWcqOiZmuaLn+WGheWtmOebkea1i+eahOaDheWGteS4
i++8jERBTU9O5Lya5Zyo5LiA5LiqIGBg5pu05paw6Ze06ZqUYGANCj4gK+WQjuiHquWKqOabtOaW
sOWMuuWfn+eahOi+ueeVjOOAguWboOatpO+8jOWcqOi/meenjeaDheWGteS4i++8jOWmguaenOeU
qOaIt+S4jeW4jOacm+abtOaWsOeahOivne+8jOW6lOivpeaKiiBgYOabtOaWsOmXtOmalGBgIOiu
vg0KPiAg572u5b6X6Laz5aSf5aSn44CCDQo+DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9kYW1vbi9kZXNpZ24ucnN0IGIvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdm0vZGFtb24vZGVzaWduLnJzdA0KPiBpbmRleCAwNWY2NmMw
Mjc0MGEuLjQ2MTI4Yjc3YzJiMyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vZGFtb24vZGVzaWduLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9kYW1vbi9kZXNpZ24ucnN0DQo+IEBAIC03Nyw3ICs3Nyw3IEBA
IERBTU9O55uu5YmN5Li654mp55CG5ZKM6Jma5ouf5Zyw5Z2A56m66Ze05o+Q5L6b5LqG5Z+65YWD
55qE5a6e546w44CC5LiL6Z2i5Lik5LiqDQo+ICA9PT09PT09PT09PT09PT09PT09PT09PT0NCj4N
Cj4gIOS4i+mdouWbm+S4qumDqOWIhuWIhuWIq+aPj+i/sOS6hkRBTU9O55qE5qC45b+D5py65Yi2
5ZKM5LqU5Liq55uR5rWL5bGe5oCn77yM5Y2zIGBg6YeH5qC36Ze06ZqUYGAg44CBIGBg6IGa6ZuG
6Ze06ZqUYGAg44CBDQo+IC1gYOWMuuWfn+abtOaWsOmXtOmalGBgIOOAgSBgYOacgOWwj+WMuuWf
n+aVsGBgIOWSjCBgYOacgOWkp+WMuuWfn+aVsGBgIOOAgg0KPiArYGDmm7TmlrDpl7TpmpRgYCDj
gIEgYGDmnIDlsI/ljLrln5/mlbBgYCDlkowgYGDmnIDlpKfljLrln5/mlbBgYCDjgIINCj4NCj4N
Cj4gIOiuv+mXrumikeeOh+ebkea1iw0KPiBAQCAtMTM1LDUgKzEzNSw2IEBAIERBTU9O55qE6L6T
5Ye65pi+56S65LqG5Zyo57uZ5a6a55qE5pe26Ze05YaF5ZOq5Lqb6aG16Z2i55qE6K6/6Zeu6aKR
546H5piv5aSa5bCRDQo+ICDnm5HmtYvnm67moIflnLDlnYDojIPlm7Tlj6/ku6XliqjmgIHmlLnl
j5jjgILkvovlpoLvvIzomZrmi5/lhoXlrZjlj6/ku6XliqjmgIHlnLDooqvmmKDlsITlkozop6Pm
mKDlsITjgILniannkIblhoXlrZjlj6/ku6XooqsNCj4gIOeDreaPkuaLlOOAgg0KPg0KPiAt55Sx
5LqO5Zyo5p+Q5Lqb5oOF5Ya15LiL5Y+Y5YyW5Y+v6IO955u45b2T6aKR57mB77yMREFNT07mo4Dm
n6XliqjmgIHlhoXlrZjmmKDlsITnmoTlj5jljJbvvIzlubbku4XlnKjnlKjmiLfmjIflrprnmoTm
l7bpl7QNCj4gLemXtOmalO+8iCBgYOWMuuWfn+abtOaWsOmXtOmalGBgIO+8ieWGheWwhuWFtuW6
lOeUqOS6juaKveixoeeahOebruagh+WMuuWfn+OAgg0KPiAr55Sx5LqO5Zyo5p+Q5Lqb5oOF5Ya1
5LiL5Y+Y5YyW5Y+v6IO955u45b2T6aKR57mB77yMREFNT07lhYHorrjnm5Hmjqfmk43kvZzmo4Dm
n6XliqjmgIHlj5jljJbvvIzljIXmi6zlhoXlrZjmmKDlsITlj5jljJbvvIwNCj4gK+W5tuS7heWc
qOeUqOaIt+aMh+WumueahOaXtumXtOmXtOmalO+8iCBgYOabtOaWsOmXtOmalGBgIO+8ieS4reea
hOavj+S4quaXtumXtOaute+8jOWwhuWFtuW6lOeUqOS6juebkeaOp+aTjeS9nOebuOWFs+eahA0K
PiAr5pWw5o2u57uT5p6E77yM5aaC5oq96LGh55qE55uR5o6n55uu5qCH5YaF5a2Y5Yy644CCDQo+
IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
