Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ECDC4320A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB42060F6F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbhG2N2q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237683AbhG2N2o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:28:44 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CD0C061765
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:28:41 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id l18so7107619ioh.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zl9k1QrgT4OquinRU+Txkak3bKu3jVVwyHQ1yR1rZ3w=;
        b=O55xqXratGnp1pN2/QNzqa1pj2y7x/Qr7CE+r5gIKZv9MUVz0L0nHvQ98m5BLarlOu
         W81w/Y7/5xazylxhdYwoDgkTtCUaTrE+nVLeC70RrC8jqYuSJvXfmlcGqpK5ea+u5JDE
         /MuUBsMmZSK9+tpGJo7yPciVMO5BsqJrAaK5iBDvXcBpC6USa/ndEahfWAtTIWUtdgmz
         aAGMYxML+Ys526foi4NCrf67GcgStQVrpPvqwckfqYUEgUnAPQxSNunEvrTpK2axvoW3
         xXW7pmzf+UftdjElMh6ehoQsPSPLVAbedT3V/+a3WNinSjdu7jY8hxOLFz7PQ4u/ffDs
         kHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zl9k1QrgT4OquinRU+Txkak3bKu3jVVwyHQ1yR1rZ3w=;
        b=dp66LkJL5w0AWdrP6LSAdgExtQPcy2F8m1OoK8SQK3MmuIY1B1DBReS40FuOy9Whjm
         74VhUEeml0X5/qGt4asGfMHB1C1AJY9imPg0Kg52kzwTwvjSpu1++JaHKAKeBt4gCgkX
         vxRT//BfE8iOJCK0W0wRxDNGKAoCVFPqnqBC0pVTynyMOMil6dSGvo0m00jW7ZVJ5Yv3
         EHTGnHC8eO2QopS50wRmd72cD7iN8sGPSS1P3+6uZ9adr00CRyteOm2LHZagVVeIWaBF
         ZTtDPRrn8Od6BXQb64PxG0mgleadEXIDOrH4Cn92ZA4gNCEdpJmCA9z4GFeiJ81UH1oP
         Hyzw==
X-Gm-Message-State: AOAM533Jy57j2GL7ho7g9zKaSNBnDB4T36/W3nVGKfpUXg7dL2hF+NPb
        w3ibbk1u9pAGag7lhG2jT8/s6VV05xcrdcpI/so=
X-Google-Smtp-Source: ABdhPJwX79kMjUWimw4on2lnNldf1ubiQE311kLsoY4u6JfBVWH83dk0QlD/uoiBZuQtXnuRVFXvIREseTqxHav31g4=
X-Received: by 2002:a02:cbb1:: with SMTP id v17mr4694511jap.0.1627565320662;
 Thu, 29 Jul 2021 06:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <603212ad57757cf820fb6170babaf0ac11266222.1627007853.git.siyanteng@loongson.cn>
In-Reply-To: <603212ad57757cf820fb6170babaf0ac11266222.1627007853.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:28:04 +0800
Message-ID: <CAJy-Amnhjr2VLP3yrVyzppyTzMBEjBNf=L9wDkVOSg4ups-Omw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] docs/zh_CN: add virt paravirt_ops translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBKdWwgMjMsIDIwMjEgYXQgMTA6NDUgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxv
b25nc29uLmNuPiB3cm90ZToNCj4NCj4gVHJhbnNsYXRlIERvY3VtZW50YXRpb24vdmlydC9wYXJh
dmlydF9vcHMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhz
QGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5k
ZXgucnN0ICAgICAgICAgfCAgMyArLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3Bh
cmF2aXJ0X29wcy5yc3QgIHwgNDAgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMucnN0
DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0
L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgu
cnN0DQo+IGluZGV4IGY1YzkyMmJiZDhhOC4uNmFkZGEzZmJhNmUwIDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiBAQCAtMjAs
MTEgKzIwLDEyIEBAIExpbnV46Jma5ouf5YyW5pSv5oyBDQo+ICAuLiB0b2N0cmVlOjoNCj4gICAg
IDptYXhkZXB0aDogMg0KPg0KPiArICAgcGFyYXZpcnRfb3BzDQo+ICsNCj4gIFRPRE9MSVNUOg0K
Pg0KPiAgICAga3ZtL2luZGV4DQo+ICAgICB1bWwvdXNlcl9tb2RlX2xpbnV4X2hvd3RvX3YyDQo+
IC0gICBwYXJhdmlydF9vcHMNCj4gICAgIGd1ZXN0LWhhbHQtcG9sbGluZw0KPiAgICAgbmVfb3Zl
cnZpZXcNCj4gICAgIGFjcm4vaW5kZXgNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU5NmIyY2E1ODUxMg0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRf
b3BzLnJzdA0KPiBAQCAtMCwwICsxLDQwIEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsN
Cj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QNCj4gKw0K
PiArOue/u+ivkToNCj4gKw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+DQo+ICsNCj4gKzrmoKHor5E6DQo+ICsNCj4gKyDpmYjpo57mnaggRmVpeWFuZyBD
aGVuIDxjaGVuZmVpeWFuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArLi4gX2NuX3ZpcnRfcGFyYXZp
cnRfb3BzOg0KPiArDQo+ICs9PT09PT09PT09PT0NCj4gK1BhcmF2aXJ0X29wcw0KPiArPT09PT09
PT09PT09DQo+ICsNCj4gK0xpbnV45o+Q5L6b5LqG5a+55LiN5ZCM566h55CG56iL5bqP6Jma5ouf
5YyW5oqA5pyv55qE5pSv5oyB44CC5Y6G5Y+y5LiK77yM5Li65LqG5pSv5oyB5LiN5ZCM55qE6Jma
5ouf5py6566h55CG5bmz5Y+wDQo+ICvvvIhoeXBlcnZpc29y77yM5LiL5paH566A56ew566h55CG
5bmz5Y+w77yJ77yM6ZyA6KaB5LiN5ZCM55qE5LqM6L+b5Yi25YaF5qC477yM6L+Z5Liq6ZmQ5Yi2
5bey57uP6KKrcHZfb3Bz56e7DQo+ICvpmaTkuobjgIJMaW51eCBwdl9vcHPmmK/kuIDkuKromZrm
i5/ljJZBUEnvvIzlroPog73lpJ/mlK/mjIHkuI3lkIznmoTnrqHnkIbnqIvluo/jgILlroPlhYHo
rrjmr4/kuKrnrqHnkIbnqIvluo8NCj4gK+S8mOWFiOS6juWFs+mUruaTjeS9nO+8jOW5tuWFgeiu
uOWNleS4gOeahOWGheaguOS6jOi/m+WItuaWh+S7tuWcqOaJgOacieaUr+aMgeeahOaJp+ihjOeO
r+Wig+S4rei/kOihjO+8jOWMheaLrOacrOacuuKAlOKAlOayoQ0KPiAr5pyJ5Lu75L2V566h55CG
56iL5bqP44CCDQo+ICsNCj4gK3B2X29wc+aPkOS+m+S6huS4gOe7hOWHveaVsOaMh+mSiO+8jOS7
o+ihqOS6huS4juS9jue6p+WFs+mUruaMh+S7pOWSjOWQhOmihuWfn+mrmOe6p+WKn+iDveebuOWv
ueW6lOeahOaTjeS9nOOAgg0KPiArcHYtb3Bz5YWB6K645Zyo6L+Q6KGM5pe26L+b6KGM5LyY5YyW
77yM5Zyo5ZCv5Yqo5pe25a+55L2O57qn5YWz6ZSu5pON5L2c6L+b6KGM5LqM6L+b5Yi25L+u6KGl
44CCDQo+ICsNCj4gK3B2X29wc+aTjeS9nOiiq+WIhuS4uuS4ieexuzoNCj4gKw0KPiArLSDnroDl
jZXnmoTpl7TmjqXosIPnlKgNCj4gKyAgIOi/meS6m+aTjeS9nOWvueW6lOS6jumrmOawtOW5s+ea
hOWHveaVsO+8jOS8l+aJgOWRqOefpe+8jOmXtOaOpeiwg+eUqOeahOW8gOmUgOW5tuS4jeWNgeWI
humHjeimgeOAgg0KPiArDQo+ICstIOmXtOaOpeiwg+eUqO+8jOWFgeiuuOeUqOS6jOi/m+WItuih
peS4gei/m+ihjOS8mOWMlg0KPiArICAg6YCa5bi45oOF5Ya15LiL77yM6L+Z5Lqb5pON5L2c5a+5
5bqU5LqO5L2O57qn5Yir55qE5YWz6ZSu5oyH5Luk44CC5a6D5Lus6KKr6aKR57mB5Zyw6LCD55So
77yM5bm25LiU5piv5a+55oCn6IO95YWzDQo+ICsgICDplK7jgILlvIDplIDmmK/pnZ7luLjph43o
poHnmoTjgIINCj4gKw0KPiArLSDkuIDlpZfnlKjkuo7miYvlhpnmsYfnvJbku6PnoIHnmoTlro/n
qIvluo8NCj4gKyAgIOaJi+WGmeeahOaxh+e8luS7o+egge+8iC5T5paH5Lu277yJ5Lmf6ZyA6KaB
5YeG6Jma5ouf5YyW77yM5Zug5Li65a6D5Lus5YyF5ous5pWP5oSf5oyH5Luk5oiW5YW25Lit55qE
5LiA5Lqb5LujDQo+ICsgICDnoIHot6/lvoTlr7nmgKfog73pnZ7luLjlhbPplK7jgIINCj4gLS0N
Cj4gMi4yNy4wDQo+DQo=
