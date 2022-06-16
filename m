Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64219C43334
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 09:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiFPJvF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 05:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiFPJvF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 05:51:05 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448A34EF75
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 02:51:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l18so881527lje.13
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 02:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wggZB95TVX55rt+Iz6LVGwkwCPTGjnRsTYyXi298t1k=;
        b=H+IYReu0cle2MQzAPV9xBDkglaCDoFxHcB/NXA9W0O3YxvZx/0LOrqEmcYVeWlnVtw
         E7/D3ggqd9oyfopvOz2Crly3CDxzVm6/OLiPRujU/ckLLjX0/+1oQDm56PxxqPu71JiN
         EF1GA0kwB15EHCj5YK8e5D/1tSx6Lgv/hB8fjyLby62dA7Pk1edtz7c+nuC1l37/Bm1I
         i4MFfIuLvCxKvyszUYCunQ9Yo/3uYYbE5pZQRKJCYjqAw22PHy9SDzjn0lJOpCywYFh7
         um33qzgwVPuTWN4yudhLkCAuLmQKSDqqmSMNwz3eSL/xfYElwnalOONdhZZ20HeTXoUq
         H4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wggZB95TVX55rt+Iz6LVGwkwCPTGjnRsTYyXi298t1k=;
        b=XKcHYCQkoVFG1eMPHISXEbu4mYqSkDRANFg7O/vwELnsDbpOudptbXCRuZawbhI8im
         8UeDdS2X6IN6a6sUGUhK8yw3gQu95Uf6gERhWn2I9DpfnVl1rJ9adNjcgVlkER0g27pr
         cxnRlDw5GfqjDZnSvGQB2jX5yDQPpW3xcN8I28btjHIEHIjEU5e4Ujj9b5JZBq1RWNCy
         GLgaZpwfmdqwAYrlLhBw03d2t2Si8UnnidUsS118/kFILdqGKnu5SPJm/X1MgaUh6H+O
         ZaEWoevEETAA7AZRF0zsakdmfuBGm3fAjd7uw/wpVvMWMul/cCMGehp/UPnVRe32r/kJ
         QdCQ==
X-Gm-Message-State: AJIora803xH2p1klRpoSISK0Pw3P5h7xbO+GR1cHgaMjCGR5mp9J4tSw
        +ZeC7XTn3+EO2yjZsiDLEVWB7AZ7E2ZIqEzwj/ZqXa//bbAF6w==
X-Google-Smtp-Source: AGRyM1uX5JrR3Jt1H0JYc2sBMC4goNKcpHmzLMwmYguhCtkeE1HLQ0gTasCiXuyjDUD07LarONp0h368CzPeTOVJ5/Y=
X-Received: by 2002:a2e:818a:0:b0:255:8239:3b1b with SMTP id
 e10-20020a2e818a000000b0025582393b1bmr2076679ljg.470.1655373062617; Thu, 16
 Jun 2022 02:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655362610.git.siyanteng@loongson.cn> <35d10864fb9b57bf288d4efa5642f93a60079029.1655362610.git.siyanteng@loongson.cn>
In-Reply-To: <35d10864fb9b57bf288d4efa5642f93a60079029.1655362610.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 16 Jun 2022 17:50:26 +0800
Message-ID: <CAJy-AmkRNPUyLscsm6WLXFvgF+n95=eYTTLD2yetza8JCYGEyw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMzo0MyBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiB1cGRhdGUgdG8gY29tbWl0IDQ4MWNjOTczNDlkNiAoIm1t
LGRvYzogQWRkIG5ldw0KPiBkb2N1bWVudGF0aW9uIHN0cnVjdHVyZSIpDQo+DQo+IE5vdGU6IFRo
ZXJlIGFyZSBzb21lIGVtcHR5IGZpbGVzIHRoYXQgZG8gbm90IG5lZWQgdG8gYmUgdXBkYXRlZCBm
b3Igbm93LA0KPiB0aGV5IGFyZToNCj4NCj4gYm9vdG1lbSwNCj4gb29tLA0KPiBwYWdlX2FsbG9j
YXRpb24sDQo+IHBhZ2VfY2FjaGUsDQo+IHBhZ2VfcmVjbGFpbSwNCj4gcGFnZV90YWJsZXMsDQo+
IHBoeXNpY2FsX21lbW9yeQ0KPiBwcm9jZXNzX2FkZHJzLA0KPiBzaG1mcywNCj4gc2xhYiwNCj4g
dm1hbGxvYywNCj4gc3dhcC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50
ZW5nQGxvb25nc29uLmNuPg0KPiBSZXZpZXdlZC1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVt
YWlsLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4g
LS0tDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAy
NyArKysrKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZtL2luZGV4LnJzdA0KPiBpbmRleCBhMWM2ZDUyOWI2ZmYuLmUwMjk3NmY0MzhhYiAxMDA2
NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0K
PiBAQCAtMTIsMTEgKzEyLDI3IEBADQo+ICBMaW51eOWGheWtmOeuoeeQhuaWh+ahow0KPiAgPT09
PT09PT09PT09PT09PT0NCj4NCj4gLei/meaYr+S4gOS4quWFs+S6jkxpbnV45YaF5a2Y566h55CG
77yIbW3vvInlrZDns7vnu5/lhoXpg6jnmoTmlofmoaPpm4bvvIzlhbbkuK3mnInkuI3lkIzlsYLm
rKHnmoTnu4boioLvvIzljIXmi6zms6jph4oNCj4gLeWSjOmCruS7tuWIl+ihqOeahOWbnuWkje+8
jOeUqOS6jumYkOi/sOaVsOaNrue7k+aehOWSjOeul+azleeahOWfuuacrOaDheWGteOAguWmguae
nOS9oOato+WcqOWvu+aJvuWFs+S6jueugOWNleWIhumFjeWGheWtmOeahOW7ug0KPiAt6K6u77yM
6K+35Y+C6ZiFKERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL21lbW9y
eS1hbGxvY2F0aW9uLnJzdCnjgIINCj4gLeWvueS6juaOp+WItuWSjOiwg+aVtOaMh+WNl++8jOiv
t+WPgumYhShEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL2luZGV4KeOAgg0KPiAtVE9ETzrl
voXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTlpITv
vIkNCj4gK+i/meaYr+S4gOS7veWFs+S6juS6huino0xpbnV455qE5YaF5a2Y566h55CG5a2Q57O7
57uf55qE5oyH5Y2X44CC5aaC5p6c5L2g5q2j5Zyo5a+75om+5YWz5LqO566A5Y2V5YiG6YWN5YaF
5a2Y55qEDQo+ICvlu7rorq7vvIzor7flj4LpmIXlhoXlrZjliIbphY3mjIfljZcNCj4gKyhEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9tZW1vcnktYWxsb2NhdGlvbi5y
c3Qp44CCDQo+ICvlhbPkuo7mjqfliLblkozosIPmlbTnmoTmjIfljZfvvIzor7fnnIvnrqHnkIbm
jIfljZcNCj4gKyhEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9t
bS9pbmRleC5yc3Qp44CCDQo+ICsNCj4gKw0KPiArLi4gdG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVw
dGg6IDENCj4gKw0KPiArICAgaGlnaG1lbQ0KPiArDQo+ICvor6XlpITliankvZnmlofmoaPlvoXl
jp/lp4vmlofmoaPmnInlhoXlrrnlkI7nv7vor5HjgIINCj4gKw0KPiArDQo+ICvpgZfnlZnmlofm
oaMNCj4gKz09PT09PT09DQo+ICsNCj4gK+i/meaYr+S4gOS4quWFs+S6jkxpbnV45YaF5a2Y566h
55CG77yITU3vvInlrZDns7vnu5/lhoXpg6jnmoTml6fmlofmoaPnmoTpm4blkIjvvIzlhbbkuK3m
nInkuI3lkIzlsYLmrKHnmoTnu4boioLvvIwNCj4gK+WMheaLrOazqOmHiuWSjOmCruS7tuWIl+ih
qOeahOWbnuWkje+8jOeUqOS6jumYkOi/sOaVsOaNrue7k+aehOWSjOeul+azleeahOaPj+i/sOOA
guWug+W6lOivpeiiq+W+iOWlveWcsOaVtOWQiOWIsOS4iui/sA0KPiAr57uT5p6E5YyW55qE5paH
5qGj5Lit77yM5aaC5p6c5a6D5bey57uP5a6M5oiQ5LqG5a6D55qE5L2/5ZG977yM5Y+v5Lul5Yig
6Zmk44CCDQo+DQo+ICAuLiB0b2N0cmVlOjoNCj4gICAgIDptYXhkZXB0aDogMQ0KPiBAQCAtMjUs
NyArNDEsNiBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WP
iuaXtuS/ruaUueatpOWkhO+8iQ0KPiAgICAgYmFsYW5jZQ0KPiAgICAgZGFtb24vaW5kZXgNCj4g
ICAgIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gLSAgIGhpZ2htZW0NCj4gICAgIGtzbQ0KPiAgICAg
ZnJvbnRzd2FwDQo+ICAgICBobW0NCj4gLS0NCj4gMi4yNy4wDQo+DQo=
