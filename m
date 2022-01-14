Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7D8C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jan 2022 02:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236108AbiANCw3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jan 2022 21:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236078AbiANCw3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jan 2022 21:52:29 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AEFC061574
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:52:28 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id w9so10773725iol.13
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x9MEczxePKbksCwOj87HJD3b0TOQ6UZVO1d6pEinaEs=;
        b=B4mccdRpkFGxb+ScyMra/sfnXFjBxSHNczKvKaMCpIkgOE862PyJTfP80RGfQzeCk2
         AGGzwKYtxn8sLOZx4dHX4O1VfhiHvI4JYnzN/g/6C8dhaxI0Vx0YJc0t6eoY4Hm8dJif
         2mYgs3Mp5ywAGAvbCNS4zaPc7xW/qsRW0BiPXwMpduhDOZkpgoMVGvEroWItnkfhFLyI
         Ro7w0ZGQnp2V61p3DjmPGUUDb0Qn6ZsEuDo17nbTWvQKSc+I6LlTpVns8ZK5qqia5RpZ
         ULm8xTrz++1wf/0xZ8ebPmVeA7LsLHINCLEUh2RjAQ/wGnS0QO02A6ewf0U0ULuVjdgv
         1EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x9MEczxePKbksCwOj87HJD3b0TOQ6UZVO1d6pEinaEs=;
        b=Xqq/x3hgSlr2RcPSfJTFeB2jJViyVJTFdM3NABeUh6L0VY48uZJnMT5zJDhgcje3YP
         i+7/9GhjA+CD4gIw4hnW0YjepA7BDfUQzS+KBxBtURjLUcXqmBpeweqRgmaL/bu1Y9hU
         NwQB3F4+gyco708VQooXAGRQ07MK4Og4M1yHuvNxgXslp63wIaHk48kaJH/27kMV5jRd
         rL7Fod8K/mCeXEMjZrk+80rkbqjvU+PQDHm6oL3tU+BUZoIWvIGFgDTH/oszN2WiSELP
         wb/xqD+JG9zydg87CPWltmfKBSiCjfydyOC1csvQPg0F7J97lAr9msm5hT0p+/v+seNq
         thrw==
X-Gm-Message-State: AOAM532tON0c0hFzTVHoE9PpYmk6bVBCWh20rGZPrvyEZuJvsTiC0YHL
        JVK6b5q7r6Y5RjJCHhrlHbvvh0GF8rU9htwSdIE=
X-Google-Smtp-Source: ABdhPJxltkDxqbf0zUuBKuhwzF2Jk/ol7QvGyYFFk18zhNgrlI90LFOWfEnlfuGZUOq6HcoMg/H3FUazepENC0lNjo4=
X-Received: by 2002:a5d:9d92:: with SMTP id ay18mr3499564iob.130.1642128748297;
 Thu, 13 Jan 2022 18:52:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642043630.git.siyanteng@loongson.cn> <339c625323d59c7ac7db5c679a4c5d39e9006c3c.1642043630.git.siyanteng@loongson.cn>
In-Reply-To: <339c625323d59c7ac7db5c679a4c5d39e9006c3c.1642043630.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 14 Jan 2022 10:51:52 +0800
Message-ID: <CAJy-AmmjzPd+j3Gefzd59+AegL501K6B_D6RkF90dqVrF9Wvfg@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs/zh_CN: add damon index tronslation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKYW4gMTMsIDIwMjIgYXQgMTE6MjEgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFA
Z21haWwuY29tPiB3cm90ZToNCj4NCj4gMSkgVHJhbnNsYXRlIC4uLi92bS9kYW1vbi9pbmRleC5y
c3QgaW50byBDaGluZXNlLg0KPiAyKSBhZGQgZGFtb24gaW50byAuLi4vemhfQ04vdm0vaW5kZXgu
cnN0DQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5j
bj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KPiAtLS0NCj4g
IC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdm0vZGFtb24vaW5kZXgucnN0ICAgICB8IDMzICsrKysr
KysrKysrKysrKysrKysNCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2lu
ZGV4LnJzdCB8ICAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9kYW1vbi9pbmRleC5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2luZGV4LnJzdCBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2luZGV4LnJzdA0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjlhN2I0ZWE5MWNiOA0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2lu
ZGV4LnJzdA0KPiBAQCAtMCwwICsxLDMzIEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdm0vZGFtb24vaW5k
ZXgucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8
c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICtEQU1PTjrmlbDmja7orr/pl67nm5Hop4blmagN
Cj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK0RBTU9O5pivTGludXjlhoXm
oLjnmoTkuIDkuKrmlbDmja7orr/pl67nm5HmjqfmoYbmnrblrZDns7vnu5/jgIJEQU1PTueahOag
uOW/g+acuuWItuS9v+WFtuaIkOS4ug0KPiAr77yI6K+l5qC45b+D5py65Yi26K+m6KeBKERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2RhbW9uL2Rlc2lnbi5yc3Qp77yJDQo+ICsN
Cj4gKyAtICrlh4bnoa7luqYqIO+8iOebkea1i+i+k+WHuuWvuURSQU3nuqfliKvnmoTlhoXlrZjn
rqHnkIbotrPlpJ/mnInnlKjvvJvkvYblj6/og73kuI3pgILlkIhDUFUgQ2FjaGXnuqfliKvvvInv
vIwNCj4gKyAtICrovbvph4/nuqcqIO+8iOebkeaOp+W8gOmUgOS9juWIsOWPr+S7peWcqOe6v+W6
lOeUqO+8ie+8jOS7peWPig0KPiArIC0gKuWPr+aJqeWxlSog77yI5peg6K6655uu5qCH5bel5L2c
6LSf6L2955qE5aSn5bCP77yM5byA6ZSA55qE5LiK6ZmQ5YC86YO95Zyo5oGS5a6a6IyD5Zu05YaF
77yJ44CCDQo+ICsNCj4gK+WboOatpO+8jOWIqeeUqOi/meS4quahhuaetu+8jOWGheaguOeahOWG
heWtmOeuoeeQhuacuuWItuWPr+S7peWBmuWHuumrmOe6p+WGs+etluOAguS8muWvvOiHtOmrmOaV
sOaNruiuv+mXruebkeaOp+W8gOmUgOeahOWung0KPiAr6aqM5oCn5YaF5a2Y566h55CG5LyY5YyW
5bel5L2c5Y+v5Lul5YaN5qyh6L+b6KGM44CC5ZCM5pe277yM5Zyo55So5oi356m66Ze077yM5pyJ
5LiA5Lqb54m55q6K5bel5L2c6LSf6L2955qE55So5oi35Y+v5Lul57yW5YaZDQo+ICvkuKrmgKfl
jJbnmoTlupTnlKjnqIvluo/vvIzku6Xkvr/mm7Tlpb3lnLDkuobop6PlkozkvJjljJbku5bku6zn
moTlt6XkvZzotJ/ovb3lkozns7vnu5/jgIINCj4gKw0KPiArLi4gdG9jdHJlZTo6DQo+ICsgICA6
bWF4ZGVwdGg6IDINCj4gKw0KPiArVE9ET0xJU1Q6DQo+ICsqICAgZmFxDQo+ICsqICAgZGVzaWdu
DQo+ICsqICAgYXBpDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9p
bmRleC5yc3QNCj4gaW5kZXggZmMzOWYwZDYwMzE4Li40MzJiYzNlZjFjMTggMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gQEAgLTIz
LDEwICsyMywxMCBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuiv
t+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPg0KPiAgICAgYWN0aXZlX21tDQo+ICAgICBiYWxhbmNl
DQo+ICsgICBkYW1vbi9pbmRleA0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9o
ZWxwZXJzDQo+IC0qIGRhbW9uL2luZGV4DQo+ICAqIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gICog
ZnJvbnRzd2FwDQo+ICAqIGhpZ2htZW0NCj4gLS0NCj4gMi4yNy4wDQo+DQo=
