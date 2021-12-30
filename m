Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EE9C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 30 Dec 2021 03:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhL3DiS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Dec 2021 22:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbhL3DiS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 22:38:18 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39A9C061574
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 19:38:17 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id y70so28248401iof.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=alsZbzzIMC++dquFnfxAGhMyWX3RD+e8eB4O+Hq73JM=;
        b=Gs1e71N++Vns2vHctNYy/5nrM2Z1Czo4FnFH4JdWPm5jzJAea8/Ej/ebw/HpLg1Lo/
         NABbCh7t7rDzT6KgJ9EE/ZvfkcrmQiZ7JDUyx2TvqGlsdxktkMfUtdc0R/b1V3FGOcln
         iWvvNXFkKY1l6HrvZrVSORFRNAn6bQB4d5jZJrbdxb5SlNEh8D1uy2XgtZWf5lhHKusD
         ACbeNBvAKSpX3nlSRFprK1iUlyCjmOwPkjjwe6jEWVKO9Ees4nyCeZ+SY9CxO+zqLjNh
         6GUGsKLYw97oUwh21aD0FWSFAAkatAE15hfmA4lUm3Xb0htJnH8CZwAKqb1F5LQef2qg
         zwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=alsZbzzIMC++dquFnfxAGhMyWX3RD+e8eB4O+Hq73JM=;
        b=ERQJDaXZjqX63+3S96k8DQp9agRPkPLsRfQirUHMvYFGaJ6lId4pr1e3uCl3knswZ0
         vbyYSze4r2+/cis0L6qM98kJfZe0SRo94oQL+WNOmTFgfhS02zF6N4htvCY/mvzqQdPH
         qEQ6dpst7ruP/Ia0QTKF9FrWI13aoH4Hs4Rm0MSSbJLXHMfcjWRg5N8y/eFs1y9zu4rW
         bCOaV8Sz5cKKYxrzFmwVNNOlgRvVmPXiW2qSmRRG1ElHEewrXuE320Wu2PBKzV7CyFl7
         /9+YHEAzGCwBUjMmaDAd0XWkzBYprq1/VPPy0OVNw0vJIgR3aXjcVhVYIRRZCrXhZ/Eu
         Qwuw==
X-Gm-Message-State: AOAM532WVXuH+ly+pUIEk9vvc/wp+XxXViWF8w1O/sLymoxFqJSlyXkV
        vxIdWVMGXS/tiuYhcuomlhteB8N4dgjSHtD+l30=
X-Google-Smtp-Source: ABdhPJygYVOL0/WD7FgbVcpj1bFfkGYEMnKX7kyv0RInKOz6AFXmsRoOfbFE+oPDxYLkcRFqi66+b4n8AXPWXfvcKFI=
X-Received: by 2002:a5d:8b55:: with SMTP id c21mr11084771iot.176.1640835496899;
 Wed, 29 Dec 2021 19:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20211230025702.186158-1-shile.zhang@linux.alibaba.com>
In-Reply-To: <20211230025702.186158-1-shile.zhang@linux.alibaba.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 30 Dec 2021 11:37:41 +0800
Message-ID: <CAJy-AmkBWdHTz=-po2xUgLiguvUCLwV4_jiPMVU+NLR9quKWYw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update and fix a couple of typos
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <bobwxc@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBEZWMgMzAsIDIwMjEgYXQgMTA6NTcgQU0gU2hpbGUgWmhhbmcNCjxzaGlsZS56aGFu
Z0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6DQo+DQo+IFVwZGF0ZSB0byB0aGUgb3JpZ2luYWwg
UkVBRE1FLnJzdCBhbmQgZml4IHNvbWUgdHlwb3MuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNoaWxl
IFpoYW5nIDxzaGlsZS56aGFuZ0BsaW51eC5hbGliYWJhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFs
ZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96
aF9DTi9hZG1pbi1ndWlkZS9SRUFETUUucnN0ICAgICAgICAgfCAxMSArKysrKystLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL1JF
QURNRS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9S
RUFETUUucnN0DQo+IGluZGV4IDk4MGViMjA1MjFjZi4uZDIwOTQ5ZThiZjZmIDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9SRUFETUUu
cnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRl
L1JFQURNRS5yc3QNCj4gQEAgLTEzMyw3ICsxMzMsNyBAQCBMaW51eOWGheaguDUueOeJiOacrCA8
aHR0cDovL2tlcm5lbC5vcmcvPg0KPg0KPiAgICAg5Y2z5L2/5Y+q5Y2H57qn5LiA5Liq5bCP54mI
5pys77yM5Lmf5LiN6KaB6Lez6L+H5q2k5q2l6aqk44CC5q+P5Liq54mI5pys5Lit6YO95Lya5re7
5Yqg5paw55qE6YWN572u6YCJ6aG577yMDQo+ICAgICDlpoLmnpzphY3nva7mlofku7bmsqHmnInm
jInpooTlrprorr7nva7vvIzlsLHkvJrlh7rnjrDlpYfmgKrnmoTpl67popjjgILlpoLmnpzmgqjm
g7Pku6XmnIDlsJHnmoTlt6XkvZzph48NCj4gLSAgIOWwhueOsOaciemFjee9ruWNh+e6p+WIsOaW
sOeJiOacrO+8jOivt+S9v+eUqCBgYG1ha2VvbGRjb25maWdgYCDvvIzlroPlj6rkvJror6Lpl67m
gqjmlrDphY3nva4NCj4gKyAgIOWwhueOsOaciemFjee9ruWNh+e6p+WIsOaWsOeJiOacrO+8jOiv
t+S9v+eUqCBgYG1ha2Ugb2xkY29uZmlnYGAg77yM5a6D5Y+q5Lya6K+i6Zeu5oKo5paw6YWN572u
DQo+ICAgICDpgInpobnnmoTnrZTmoYjjgIINCj4NCj4gICAtIOWFtuS7lumFjee9ruWRveS7pOWM
heaLrDo6DQo+IEBAIC0xNjEsNyArMTYxLDcgQEAgTGludXjlhoXmoLg1LnjniYjmnKwgPGh0dHA6
Ly9rZXJuZWwub3JnLz4NCj4gICAgICAgIm1ha2UgJHtQTEFURk9STX1fZGVmY29uZmlnIg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAg5L2/55SoYXJjaC8kYXJjaC9jb25maWdzLyR7UExBVEZP
Uk19X2RlZmNvbmZpZ+S4rQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg55qE6buY6K6k6YCJ
6aG55YC85Yib5bu65LiA5LiqLi8uY29uZmln5paH5Lu244CCDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICDnlKjigJxtYWtlaGVscOKAneadpeiOt+WPluaCqOS9k+ezu+aetuaehOS4reaJgOac
ieWPr+eUqOW5s+WPsOeahOWIl+ihqOOAgg0KPiArICAgICAgICAgICAgICAgICAgICAgICAg55So
4oCcbWFrZSBoZWxw4oCd5p2l6I635Y+W5oKo5L2T57O75p625p6E5Lit5omA5pyJ5Y+v55So5bmz
5Y+w55qE5YiX6KGo44CCDQo+DQo+ICAgICAgICJtYWtlIGFsbHllc2NvbmZpZyINCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIOmAmui/h+WwveWPr+iDveWwhumAiemhueWAvOiuvue9ruS4uuKA
nHnigJ3vvIzliJvlu7rkuIDkuKoNCj4gQEAgLTE5Nyw5ICsxOTcsMTAgQEAgTGludXjlhoXmoLg1
LnjniYjmnKwgPGh0dHA6Ly9rZXJuZWwub3JnLz4NCj4gICAgICAgIm1ha2UgbG9jYWx5ZXNjb25m
aWciIOS4jmxvY2FsbW9kY29uZmln57G75Ly877yM5Y+q5piv5a6D5Lya5bCG5omA5pyJ5qih5Z2X
6YCJ6aG56L2s5o2iDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICDkuLrlhoXnva7vvIg9
ee+8ieOAguS9oOWPr+S7peWQjOaXtumAmui/h0xNQ19LRUVQ5L+d55WZ5qih5Z2X44CCDQo+DQo+
IC0gICAgICJtYWtlIGt2bWNvbmZpZyIgICDkuLprdm3lrqLkvZPlhoXmoLjmlK/mjIHlkK/nlKjl
hbbku5bpgInpobnjgIINCj4gKyAgICAgIm1ha2Uga3ZtX2d1ZXN0LmNvbmZpZyINCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIOS4umt2beWuouaIt+acuuWGheaguOaUr+aMgeWQr+eUqOWFtuS7
lumAiemhueOAgg0KPg0KPiAtICAgICAibWFrZSB4ZW5jb25maWciICAg5Li6eGVuIGRvbTDlrqLk
vZPlhoXmoLjmlK/mjIHlkK/nlKjlhbbku5bpgInpobnjgIINCj4gKyAgICAgIm1ha2UgeGVuLmNv
bmZpZyIgIOS4unhlbiBkb20w5a6i5oi35py65YaF5qC45pSv5oyB5ZCv55So5YW25LuW6YCJ6aG5
44CCDQo+DQo+ICAgICAgICJtYWtlIHRpbnljb25maWciICDphY3nva7lsL3lj6/og73lsI/nmoTl
hoXmoLjjgIINCj4NCj4gQEAgLTIyOSw3ICsyMzAsNyBAQCBMaW51eOWGheaguDUueOeJiOacrCA8
aHR0cDovL2tlcm5lbC5vcmcvPg0KPiAgICAg6K+35rOo5oSP77yM5oKo5LuN54S25Y+v5Lul5L2/
55So5q2k5YaF5qC46L+Q6KGMYS5vdXTnlKjmiLfnqIvluo/jgIINCj4NCj4gICAtIOaJp+ihjCBg
YG1ha2VgYCDmnaXliJvlu7rljovnvKnlhoXmoLjmmKDlg4/jgILlpoLmnpzmgqjlronoo4XkuoZs
aWxv5Lul6YCC6YWN5YaF5qC4bWFrZWZpbGXvvIwNCj4gLSAgIOmCo+S5iOS5n+WPr+S7pei/m+ih
jCBgYG1ha2VpbnN0YWxsYGAg77yM5L2G5piv5oKo5Y+v6IO96ZyA6KaB5YWI5qOA5p+l54m55a6a
55qEbGlsb+iuvue9ruOAgg0KPiArICAg6YKj5LmI5Lmf5Y+v5Lul6L+b6KGMIGBgbWFrZSBpbnN0
YWxsYGAg77yM5L2G5piv5oKo5Y+v6IO96ZyA6KaB5YWI5qOA5p+l54m55a6a55qEbGlsb+iuvue9
ruOAgg0KPg0KPiAgICAg5a6e6ZmF5a6J6KOF5b+F6aG75Lulcm9vdOi6q+S7veaJp+ihjO+8jOS9
huS7u+S9leato+W4uOaehOW7uumDveS4jemcgOimgeOAgg0KPiAgICAg5peg6aG75b6S54S25L2/
55Socm9vdOi6q+S7veOAgg0KPiAtLQ0KPiAyLjMzLjAucmMyDQo+DQo=
