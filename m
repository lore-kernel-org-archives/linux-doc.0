Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FC6C6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 03:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjCPDRZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 23:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCPDRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 23:17:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BA0856AC
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 20:17:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b13so264617ljf.6
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678936640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpSONzeiXbnF6a+TR0uwezkX7CnfhK34t7ir+4j6xyc=;
        b=ODacuaT+Ce9idqr0rK6SckQf2xkyFp16DJMgGBnGxSKrpetZXCKMjxrIHXTAEfotqQ
         63Fk9FiphvahADiFlzMcN1TTLx2oBlClVOQDHlrQtfaaLGUyoTvQEu3HqArwcTu62Vp6
         ZtSh6nwldMynhBi5RWyD9TkaS0g+fWIlvZZkBEJ3biLajiLthIFHnlG7SCmABkXnPTJd
         uQNqL+o7dBHgNgUtaMkh7VzldHuSiNy47a0kgDMvZUhnT/QFIvGEZ5l+PV8Y77jK/3lj
         s8yrQ4GHyVYzapFhII0lPE8xlIXJl8eiA5Huvcbq967axIwdrq7tYaD4vMjlxLiHWCvT
         la1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678936640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpSONzeiXbnF6a+TR0uwezkX7CnfhK34t7ir+4j6xyc=;
        b=pywTKqxDYV/Eblk7BK5u5JA9EsmKdcA1QBJ7ZeT5ttc4p7USImDODEg1ICk6sixFEX
         FhXImKCVSyFi+JCwHCc8wA/k2RV0tPzF0z/clrNRT/hsaHVnt5RyT21owsPHkF9ah9Mu
         7Gv/KqZhymSDdu3vvwsVz/lQwrarNucaV2N1vLgAF/x1wOY2yQIlMBZ0g4ZB/ZLd2Wt/
         xMqLnh93i4kCdSG3QnOLk21lyiCXT78DGpJ0ULaVbISxJ2E0XpIFKkIAAgC5MaYIx5rA
         5nqPP4eAFrc7n7CU/rf4dKMUJ+Xm4Ak2ysS5T5Gg2kTJVtmuDs8udDUdToKPMIpiOz+s
         H4AA==
X-Gm-Message-State: AO0yUKVnZukcmDpk9zmdLghOp6o+60R6FE7v+ThItv6O+KHo5ifK6oNM
        ounYlXvaMGRj9uqwM1+feiYORy0Dy5/CPCDdhWuYpsEhX3eauw==
X-Google-Smtp-Source: AK7set9zsKlSyKeInjIHrcAYy44SZVHSTLEZRZVwzlpeyndRUPMDevvDSTG/wbc08Vnvbzf/n8jSvHz3H9wMlCRCK7I=
X-Received: by 2002:a2e:9b8a:0:b0:298:b337:c127 with SMTP id
 z10-20020a2e9b8a000000b00298b337c127mr1020479lji.1.1678936640440; Wed, 15 Mar
 2023 20:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230316024519.27992-1-zangleigang@hisilicon.com>
In-Reply-To: <20230316024519.27992-1-zangleigang@hisilicon.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 16 Mar 2023 11:16:44 +0800
Message-ID: <CAJy-Amn1R-0Nq-tEqNcW7-kCmjPpYUtD=EjAfCK3oJVPWirB0g@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: fix a wrong format
To:     Zang Leigang <zangleigang@hisilicon.com>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        rppt@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBUaHUsIE1hciAx
NiwgMjAyMyBhdCAxMDo0NeKAr0FNIFphbmcgTGVpZ2FuZyA8emFuZ2xlaWdhbmdAaGlzaWxpY29u
LmNvbT4gd3JvdGU6DQo+DQo+IEFkZCBhIG1pc3NpbmcgbWFya3VwIGZvciB0aGUgY29kZSBzbmlw
cGV0IGF0IHRoZSBlbmQgb2YgbHJ1X3NvcnQucnN0DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFphbmcg
TGVpZ2FuZyA8emFuZ2xlaWdhbmdAaGlzaWxpY29uLmNvbT4NCj4gLS0tDQo+ICAuLi4vdHJhbnNs
YXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2RhbW9uL2xydV9zb3J0LnJzdCAgICAgICAgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1
aWRlL21tL2RhbW9uL2xydV9zb3J0LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2FkbWluLWd1aWRlL21tL2RhbW9uL2xydV9zb3J0LnJzdA0KPiBpbmRleCA4MTJlZjMxNWM4
ZjYuLjAzZDMzYzcxMDYwNCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vYWRtaW4tZ3VpZGUvbW0vZGFtb24vbHJ1X3NvcnQucnN0DQo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2RhbW9uL2xydV9zb3J0
LnJzdA0KPiBAQCAtMjUwLDcgKzI1MCw3IEBAIExSVeeahOS8mOWFiOe6p+eahOaPkOWNh++8jOWQ
jOaXtumZjeS9jumCo+S6m+i2hei/hzEyMOenkuaXoOS6uuiuv+mXrueahOWGheWtmA0KPiAg55CG
6KKr6ZmQ5Yi25Zyo5pyA5aSaMSXnmoRDUFXku6Xpgb/lhY1EQU1PTl9MUlVfU09SVOa2iOi0uei/
h+WkmkNQVeaXtumXtOOAguWcqOezu+e7n+epuumXsuWGheWtmOi2hei/hzUwJQ0KPiAg5pe2REFN
T05fTFJVX1NPUlTlgZzmraLlt6XkvZzvvIzlubblnKjkvY7kuo40MCXml7bph43mlrDlvIDlp4vl
t6XkvZzjgILlpoLmnpxEQU1PTl9SRUNMQUlN5rKh5pyJ5Y+W5b6XDQo+ICDov5vlsZXkuJTnqbrp
l7LlhoXlrZjkvY7kuo4yMCXvvIzlho3mrKHorqlEQU1PTl9MUlVfU09SVOWBnOatouW3peS9nO+8
jOS7peatpOWbnumAgOWIsOS7pUxSVemTvuihqOS4uuWfuuehgA0KPiAt5Lul6aG16Z2i5Li65Y2V
5L2N55qE5YaF5a2Y5Zue5pS25LiK44CCDQo+ICvku6XpobXpnaLkuLrljZXkvY3nmoTlhoXlrZjl
m57mlLbkuIrjgIIgOjoNCj4NCj4gICAgICAjIGNkIC9zeXMvbW9kdWxlcy9kYW1vbl9scnVfc29y
dC9wYXJhbWV0ZXJzDQo+ICAgICAgIyBlY2hvIDUwMCA+IGhvdF90aHJlc19hY2Nlc3NfZnJlcQ0K
PiAtLQ0KPiAyLjE3LjENCj4NCg==
