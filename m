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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755F2C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 01:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1F661176
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 01:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhDWBrm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 21:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhDWBrm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Apr 2021 21:47:42 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D05BC061574
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 18:47:05 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m11so33046034pfc.11
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 18:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sEBIIMky4VDwVbIerPlApPu/qz46WKtwjxW+bYEECVY=;
        b=BYyBVpfrWzsCUWezv4ZF95PsqpMqqODxJCNwjKCX0FIlKQowyxDIG+qdfh0IHU+XMW
         m4Z5oWfLZ0TEGI1eu/hlleUSi+WoElED7mxVEGR0nmdRxU3pixzRZfVKyAZc2hIAHjcn
         9ZMQaZzQ1SR8Y8s8EoAyV+Pl67VCfmKE7q9QulNBKci/Wx4viG0rLRcOpcQR8CQx3pjX
         6987dCpawvztL61VoFE1tlNS4e/jx77CaavyI1yAFhQyrc8OiK5Mv4SdPpSCbMOwt9oz
         0bEhd11TaO1ZOQ0TyW2oq+0qjzr3uhWJzYY3zXelo2UFGNl7Ypri6RpzJ2nW7womDOxq
         jNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sEBIIMky4VDwVbIerPlApPu/qz46WKtwjxW+bYEECVY=;
        b=XQY0b07oA9uNiRPdaR7dW2eZ+0qoUt6XBUyIn1MSbucsGpgWjtXRdRdmwu4qTQ9GvO
         IYYRH7NRN/XaC2fjCcgN2k4wpJpAOqIO/g7J5YMcy0CXbYAVfwMkETEkxPw8QJ0IORFb
         ytGYuaxVgUg0SYhgNPsvs3DVyhNHrhkNuLEjeluEPnP6LoqBkkPAZGYFolPbj0Y4uUVR
         zH+DQmBCo/GeeUBlSGsqGBPvtnSKilecxZNT5ERFPfhWHS5p8pAvhcMpTTm04lJEJiiO
         8I0iWZW/IdIqOiejkNjTvxW8GWa3rEFkjFj5ixMjigOJdrZeeSJ2jx6N49bAmaydHx5a
         jxdA==
X-Gm-Message-State: AOAM5310bxi5FIkHZgvohzi7qrVh/M3A3bA/tyE5N7qFg7Z6jWYwCEKe
        KUFsMji96FonHHEo0U8+QX/F3DEn2ZK9FqxPQGs=
X-Google-Smtp-Source: ABdhPJwRNRs2IOARVyrpqJGxhRr7dQJRGE1sQ23s1IpInxXzeVFSFaH57A19VapRKGC8/L/Qr+xTY6C5PDGgRDgw64Y=
X-Received: by 2002:a05:6a00:72b:b029:218:6603:a6a9 with SMTP id
 11-20020a056a00072bb02902186603a6a9mr1363171pfm.78.1619142424809; Thu, 22 Apr
 2021 18:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619093668.git.bobwxc@email.cn> <406cc9cfa48b399119b654e49b79cd4538f5f765.1619093668.git.bobwxc@email.cn>
In-Reply-To: <406cc9cfa48b399119b654e49b79cd4538f5f765.1619093668.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 23 Apr 2021 09:46:54 +0800
Message-ID: <CAMU9jJqgytAk+fcSqeaOhhH0TkfdtVuH_uUzu5R6kqXEJnjwPg@mail.gmail.com>
Subject: Re: [PATCH 2/6] docs/zh_CN: Add translation zh_CN/maintainer/configure-git.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KV3UgWGlh
bmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDIy5pel5ZGo5ZubIOS4i+WN
iDg6MjflhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9jb25maWd1cmUtZ2l0LnJzdA0KPiBh
bmQgbGluayBpdCB0byB6aF9DTi9tYWludGFpbmVyL2luZGV4LnJzdA0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+IC0tLQ0KPiAgLi4uL3poX0NO
L21haW50YWluZXIvY29uZmlndXJlLWdpdC5yc3QgICAgICAgIHwgNjIgKysrKysrKysrKysrKysr
KysrKw0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2luZGV4LnJzdCAgIHwg
IDYgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L21haW50YWluZXIvY29uZmlndXJlLWdpdC5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvY29uZmlndXJlLWdpdC5yc3QgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2NvbmZpZ3VyZS1naXQu
cnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTQ1ZWE3
MzZmNzNiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vbWFpbnRhaW5lci9jb25maWd1cmUtZ2l0LnJzdA0KPiBAQCAtMCwwICsxLDYyIEBA
DQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdp
bmFsOiBEb2N1bWVudGF0aW9uL21haW50YWluZXIvY29uZmlndXJlLWdpdC5yc3QNCj4gKw0KPiAr
OuivkeiAhToNCj4gKw0KPiArIOWQtOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwu
Y24+DQo+ICsNCj4gKy4uIF9jb25maWd1cmVnaXRfemg6DQo+ICsNCj4gK0dpdOmFjee9rg0KPiAr
PT09PT09PQ0KPiArDQo+ICvmnKznq6DorrLov7Dkuobnu7TmiqTogIXnuqfliKvnmoRnaXTphY3n
va7jgIINCj4gKw0KPiArRG9jdW1lbnRhdGlvbi9tYWludGFpbmVyL3B1bGwtcmVxdWVzdHMucnN0
IOS4reS9v+eUqOeahOagh+iusOWIhuaUr+W6lOS9v+eUqOW8gOWPkeS6uuWRmOeahA0KPiArR1BH
5YWs6ZKl6L+b6KGM562+5ZCN44CC5Y+v5Lul6YCa6L+H5bCGIGBgLXVgYCDmoIflv5fkvKDpgJLn
u5kgYGBnaXQgdGFnYGAg5p2l5Yib5bu6562+5ZCN5qCH6K6w44CCDQo+ICvkvYbmmK/vvIznlLHk
uo4gKumAmuW4uCog5a+55ZCM5LiA6aG555uu5L2/55So5ZCM5LiA5Liq5a+G6ZKl77yM5Zug5q2k
5Y+v5Lul6K6+572uOjoNCj4gKw0KPiArICAgICAgIGdpdCBjb25maWcgdXNlci5zaWduaW5na2V5
ICJrZXluYW1lIg0KPiArDQo+ICvmiJbogIXmiYvliqjnvJbovpHkvaDnmoQgYGAuZ2l0L2NvbmZp
Z2BgIOaIliBgYH4vLmdpdGNvbmZpZ2BgIOaWh+S7tjo6DQo+ICsNCj4gKyAgICAgICBbdXNlcl0N
Cj4gKyAgICAgICAgICAgICAgIG5hbWUgPSBKYW5lIERldmVsb3Blcg0KPiArICAgICAgICAgICAg
ICAgZW1haWwgPSBqZEBkb21haW4ub3JnDQo+ICsgICAgICAgICAgICAgICBzaWduaW5na2V5ID0g
amRAZG9tYWluLm9yZw0KPiArDQo+ICvkvaDlj6/og73pnIDopoHlkYror4kgYGBnaXRgYCDljrvk
vb/nlKggYGBncGcyYGA6Og0KPiArDQo+ICsgICAgICAgW2dwZ10NCj4gKyAgICAgICAgICAgICAg
IHByb2dyYW0gPSAvcGF0aC90by9ncGcyDQo+ICsNCj4gK+S9oOWPr+iDveS5n+mcgOimgeWRiuiv
iSBgYGdwZ2BgIOWOu+S9v+eUqOWTquS4qiBgYHR0eWBgIO+8iOa3u+WKoOWIsOS9oOeahHNoZWxs
IHJj5paH5Lu25Lit77yJOjoNCj4gKw0KPiArICAgICAgIGV4cG9ydCBHUEdfVFRZPSQodHR5KQ0K
PiArDQo+ICsNCj4gK+WIm+W7uumTvuaOpeWIsGxvcmUua2VybmVsLm9yZ+eahOaPkOS6pA0KPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtodHRwOi8vbG9yZS5rZXJu
ZWwub3JnIOe9keermeaYr+aJgOaciea2ieWPiuaIluW9seWTjeWGheaguOW8gOWPkeeahOmCruS7
tuWIl+ihqOeahOaAu+WtmOaho+OAguWcqOi/memHjA0KPiAr5a2Y5YKo6KGl5LiB5a2Y5qGj5piv
5o6o6I2Q55qE5YGa5rOV77yM5b2T57u05oqk5Lq65ZGY5bCG6KGl5LiB5bqU55So5Yiw5a2Q57O7
57uf5qCR5pe277yM5pyA5aW95o+Q5L6b5LiA5Liq5oyH5ZCRDQo+ICtsb3Jl5a2Y5qGj6ZO+5o6l
55qE5qCH562+77yM5Lul5L6/5rWP6KeI5o+Q5Lqk5Y6G5Y+y55qE5Lq65Y+v5Lul5om+5Yiw5p+Q
5Liq5pu05pS56IOM5ZCO55qE55u45YWz6K6o6K665ZKM5Z+65pysDQo+ICvljp/nkIbjgILpk77m
jqXmoIfnrb7lpoLkuIvmiYDnpLrvvJoNCj4gKw0KPiArICAgICAgIExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvPG1lc3NhZ2UtaWQ+DQo+ICsNCj4gK+mAmui/h+WcqGdpdOS4rea3u+WK
oOS7peS4i+mSqeWtkO+8jOWPr+S7peWwhuatpOmFjee9ruS4uuWcqOWPkeW4gyBgYGdpdCBhbWBg
IOaXtuiHquWKqOaJp+ihjO+8mg0KPiArDQo+ICsuLiBjb2RlLWJsb2NrOjogbm9uZQ0KPiArDQo+
ICsgICAgICAgJCBnaXQgY29uZmlnIGFtLm1lc3NhZ2VpZCB0cnVlDQo+ICsgICAgICAgJCBjYXQg
Pi5naXQvaG9va3MvYXBwbHlwYXRjaC1tc2cgPDwnRU9GJw0KPiArICAgICAgICMhL2Jpbi9zaA0K
PiArICAgICAgIC4gZ2l0LXNoLXNldHVwDQo+ICsgICAgICAgcGVybCAtcGkgLWUgJ3N8Xk1lc3Nh
Z2UtSWQ6XHMqPD8oW14+XSspPj8kfExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvJDF8
ZzsnICIkMSINCj4gKyAgICAgICB0ZXN0IC14ICIkR0lUX0RJUi9ob29rcy9jb21taXQtbXNnIiAm
Jg0KPiArICAgICAgICAgICAgICAgZXhlYyAiJEdJVF9ESVIvaG9va3MvY29tbWl0LW1zZyIgJHsx
KyIkQCJ9DQo+ICsgICAgICAgOg0KPiArICAgICAgIEVPRg0KPiArICAgICAgICQgY2htb2QgYSt4
IC5naXQvaG9va3MvYXBwbHlwYXRjaC1tc2cNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QNCj4gaW5kZXggNGNlMjdjMTJm
MzcwLi5lMjYzMzE1ZjVlN2EgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0DQo+IEBAIC0xMCw5ICsxMCwxMyBA
QA0KPiAg5pys5omL5YaM6L+Y6ZyA6KaB5aSn6YeP5a6M5ZaE77yB6K+36Ieq55Sx5o+Q5Ye677yI
5ZKM57yW5YaZ77yJ5pys5omL5YaM55qE6KGl5YWF5YaF5a6544CCDQo+ICAq6K+R5rOo77ya5oyH
6Iux5paH5Y6f54mIKg0KPg0KPiArLi4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDINCj4g
Kw0KPiArICAgY29uZmlndXJlLWdpdA0KPiArDQo+ICBUT0RPTGlzdDoNCj4NCj4gLS0gICBjb25m
aWd1cmUtZ2l0DQo+ICAtICAgcmViYXNpbmctYW5kLW1lcmdpbmcNCj4gIC0gICBwdWxsLXJlcXVl
c3RzDQo+ICAtICAgbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlDQo+IC0tDQo+IDIuMjAuMQ0KPg0K
