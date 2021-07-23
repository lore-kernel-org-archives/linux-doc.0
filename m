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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC80C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01A9D60EB0
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 02:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhGWBus (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 21:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhGWBur (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 21:50:47 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0703C061575
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 19:31:21 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id o20so316785oiw.12
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 19:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/oHgE8SMEqjZnZiLLvBJUfNsYmmz2vUVXYPnlh2s0mU=;
        b=Ua/3sOfKmDEGX6pZHQvd1RQ9L/9pJS2Yd2svIKPdzr/9m+NYve4GWMY5VhjQ8jXSaF
         bRZMLqxdWFW3KRqHDzuu3jUUZKTwXjThxyJg6l+JUhubWXwdnLkO9ta6F4GaYrJtjiXC
         waDjnq6lBUa9nSLyUUnkbwfEel65+95+S9NDGWcO1dbPXWoCGLNIdkZa7qE1fDE6ffSc
         Za0iCXK4qGz1GHzENeitx1UyPZG/wzFANKxp8Vfsoy1J/f1e1JC8nQyb5UYhx3pZpFGr
         qxLusRWY6rLMl3L8NfeCSIiVvQ+8imBaouDeiNBt/Bvj+aN0ddo1vUWbBmbcczfk8m7h
         UtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/oHgE8SMEqjZnZiLLvBJUfNsYmmz2vUVXYPnlh2s0mU=;
        b=j/qPVP0v0K7yM4tJSxIR7lM+0bxlQ6U1zfci8ReczsND/m0UIIcsRI1witC7uM7QNS
         0ngnPCfNztx52ZGhTmi8Bmh8moAKR4dKC567PQhot75lwhgg5IV3v5a9uwVZkROsWBnb
         DYZpuTYNqpATYD1M4mV+U/DnP7C5cXplNdJLhuUZ2wgn8Wt10Nt/3w4eaouPnnnlF5hf
         donPMQvC61REVxDvlAzPJsu8TBApYwn25ze8wrQfthqMSgU83gazkQyf2t6YsyTHcYx7
         seYD330yz2Meke2If7xTH6Lr5OpayAxBxn6whXzBRBicCo1dyc8RyDhx0rI+yYuuUzBd
         u4rA==
X-Gm-Message-State: AOAM5309nYYYFkpceGBNy/ty0o7do5vmSES6CQtPInlSEz46mocmdZpc
        zfz613r0AzTd8UDILhO8hRyCChoRCfgI9btocns=
X-Google-Smtp-Source: ABdhPJylkgdInwesvIPLThJZKSZlGD5nfIgprtIA/4kkbbfJMjXKKFU9I5uB5ql3yd0NtEnGmpDvIO4XJStumTJJyAw=
X-Received: by 2002:a54:488f:: with SMTP id r15mr1842909oic.130.1627007479942;
 Thu, 22 Jul 2021 19:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626687013.git.siyanteng@loongson.cn> <442c95117f33f48ac6f11bc984bdcca3a3772912.1626687013.git.siyanteng@loongson.cn>
 <CACWXhKkL20ddUJiL1ViLYzBe_aCdtJf9HFFfP3R7hePaxifuDg@mail.gmail.com>
In-Reply-To: <CACWXhKkL20ddUJiL1ViLYzBe_aCdtJf9HFFfP3R7hePaxifuDg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 23 Jul 2021 10:31:10 +0800
Message-ID: <CAEensMz-Z+pduFp2S65GqqruW=Bh2zVsXqOJG+pSqyKMHg6eaw@mail.gmail.com>
Subject: Re: [PATCH 2/8] docs/zh_CN: add virt paravirt_ops translation
To:     =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

6ZmI6aOe5omsIDxjaHJpcy5jaGVuZmVpeWFuZ0BnbWFpbC5jb20+IOS6jjIwMjHlubQ35pyIMTnm
l6XlkajkuIAg5LiL5Y2INzowNOWGmemBk++8mg0KPg0KPiBIaSwgWWFudGVuZywNCj4NCj4gT24g
TW9uLCAxOSBKdWwgMjAyMSBhdCAxNzo0MiwgWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29u
LmNuPiB3cm90ZToNCj4gPg0KPiA+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3Bh
cmF2aXJ0X29wcy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBEbyB5b3UgbWVhbiBEb2N1bWVudGF0
aW9uL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdD8NCnllYWguIEZpeGVkIQ0KPg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0ICAgICAgICAgfCAgMyAr
LQ0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdCAgfCA0
MCArKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMucnN0DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiA+IGlu
ZGV4IGY1YzkyMmJiZDhhOC4uNmFkZGEzZmJhNmUwIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QNCj4gPiBAQCAtMjAsMTEg
KzIwLDEyIEBAIExpbnV46Jma5ouf5YyW5pSv5oyBDQo+ID4gIC4uIHRvY3RyZWU6Og0KPiA+ICAg
ICA6bWF4ZGVwdGg6IDINCj4gPg0KPiA+ICsgICBwYXJhdmlydF9vcHMNCj4gPiArDQo+ID4gIFRP
RE9MSVNUOg0KPiA+DQo+ID4gICAgIGt2bS9pbmRleA0KPiA+ICAgICB1bWwvdXNlcl9tb2RlX2xp
bnV4X2hvd3RvX3YyDQo+ID4gLSAgIHBhcmF2aXJ0X29wcw0KPiA+ICAgICBndWVzdC1oYWx0LXBv
bGxpbmcNCj4gPiAgICAgbmVfb3ZlcnZpZXcNCj4gPiAgICAgYWNybi9pbmRleA0KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29w
cy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29w
cy5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NzNmNDljMzM4YzNiDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPiA+IEBAIC0wLDAgKzEs
NDAgQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLi4g
aW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2luYWw6
IERvY3VtZW50YXRpb24vdmlydC9wYXJhdmlydF9vcHMucnN0DQo+ID4gKw0KPiA+ICs657+76K+R
Og0KPiA+ICsNCj4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24u
Y24+DQo+ID4gKw0KPiA+ICs65qCh6K+ROg0KPiA+ICsNCj4gPiArDQo+ID4gKw0KPiA+ICsuLiBf
Y25fdmlydF9wYXJhdmlydF9vcHM6DQo+ID4gKw0KPiA+ICs9PT09PT09PT09PT0NCj4gPiArUGFy
YXZpcnRfb3BzDQo+ID4gKz09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArTGludXjmj5Dkvpvkuobl
r7nkuI3lkIznrqHnkIbnqIvluo/omZrmi5/ljJbmioDmnK/nmoTmlK/mjIHjgILljoblj7LkuIrv
vIzkuLrkuobmlK/mjIHkuI3lkIznmoTomZrmi5/mnLrnrqHnkIblubPlj7ANCj4gPiAr77yIaHlw
ZXJ2aXNvcu+8jOS4i+aWh+eugOensOeuoeeQhuW5s+WPsO+8ie+8jOmcgOimgeS4jeWQjOeahOS6
jOi/m+WItuWGheaguO+8jOi/meS4qumZkOWItuW3sue7j+iiq3B2X29wc+enuw0KPiA+ICvpmaTk
uobjgIJMaW51eCBwdl9vcHPmmK/kuIDkuKromZrmi5/ljJZBUEnvvIzlroPog73lpJ/mlK/mjIHk
uI3lkIznmoTnrqHnkIbnqIvluo/jgILlroPlhYHorrjmr4/kuKrnrqHnkIbnqIvluo8NCj4gPiAr
5LyY5YWI5LqO5YWz6ZSu5pON5L2c77yM5bm25YWB6K645Y2V5LiA55qE5YaF5qC45LqM6L+b5Yi2
5paH5Lu25Zyo5omA5pyJ5pSv5oyB55qE5omn6KGM546v5aKD5Lit6L+Q6KGM77yM5YyF5ous5pys
5py64oCU4oCU5rKhDQo+ID4gK+acieS7u+S9leeuoeeQhueoi+W6j+OAgg0KPiA+ICsNCj4gPiAr
cHZfb3Bz5o+Q5L6b5LqG5LiA57uE5Ye95pWw5oyH6ZKI77yM5Luj6KGo5LqG5LiO5L2O57qn5YWz
6ZSu5oyH5Luk5ZKM5ZCE6aKG5Z+f6auY57qn5Yqf6IO955u45a+55bqU55qE5pON5L2c44CCDQo+
ID4gK3B2LW9wc+WFgeiuuOWcqOi/kOihjOaXtui/m+ihjOS8mOWMlu+8jOWcqOWQr+WKqOaXtuWv
ueS9jue6p+WFs+mUruaTjeS9nOi/m+ihjOS6jOi/m+WItuS/ruihpeOAgg0KPiA+ICsNCj4gPiAr
cHZfb3Bz5pON5L2c6KKr5YiG5Li65LiJ57G7Og0KPiA+ICsNCj4gPiArLSDnroDljZXnmoTpl7Tm
jqXosIPnlKgNCj4gPiArICAg6L+Z5Lqb5pON5L2c5a+55bqU5LqO6auY5rC05bmz55qE5Ye95pWw
77yM5LyX5omA5ZGo55+l77yM6Ze05o6l6LCD55So55qE5byA6ZSA5bm25LiN5Y2B5YiG6YeN6KaB
44CCDQo+ID4gKw0KPiA+ICstIOmXtOaOpeiwg+eUqO+8jOWFgeiuuOeUqOS6jOi/m+WItuihpeS4
gei/m+ihjOS8mOWMlg0KPiA+ICsgICDpgJrluLjmg4XlhrXkuIvvvIzov5nkupvmk43kvZzlr7nl
upTkuo7kvY7nuqfliKvnmoTlhbPplK7mjIfku6TjgILlroPku6zooqvpopHnuYHlnLDosIPnlKjv
vIzlubbkuJTmmK/mgKfog73lhbMNCj4gPiArICAg6ZSu44CC5byA6ZSA5piv6Z2e5bi46YeN6KaB
55qE44CCDQo+DQo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNheSAi5a+55oCn6IO9
5YWz6ZSuIi4NCmdyZWF0IQ0KDQoNClRoYW5rcywNCg0KWWFudGVuZw0K
