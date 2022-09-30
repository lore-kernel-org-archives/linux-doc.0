Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCC5C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 09:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiI3JOK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 05:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbiI3JOJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 05:14:09 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F81152667
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 02:14:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a10so4179133ljq.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=FfQhpjOscWE8qj/FpkL46tn52XxG7ygtTTeLXHgH9hw=;
        b=e0Db0icyq98AqjHDE4yarsXeqBBCFIWSD1q+zBpoxJAjiwb0rQLlmtVHEtausA9BWS
         VSDq1r3kq21JH9CywYlxTmSqyHVP57qXweA/UFbtBTQBbVXBmga0OKBxuGOzuHuMDwe8
         fBA9yACqXCxUx4dRk/O/qB463xqge3wLjrTilq823Ik/yXOJP1SI7YVhgYihUrzvG3P9
         Em15KnZu1eo/reLgLLXmaa8PCGuv5VxyBBKg7aIu5oQTlmiAeFC0ZaswdIUaV1n0eZXO
         +KTs77N2uVZbVj/JySc3jivcGmTPgHZkBn+lz+hZ3jxuNkCYNTFhlqvAOOEn1eozWwby
         PW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FfQhpjOscWE8qj/FpkL46tn52XxG7ygtTTeLXHgH9hw=;
        b=VqmgHtv57DwxBIiZhFFEYRW8ERD8IIHvh2nL8IbcAkb3GBpnRkFRUblDKggn3KszLK
         qJzR7XjUSfupa3cjzjvXRf7UmXehFibTBEovF8yLrfkcvQfzu80kw/2CQ4QhWe03vL8d
         zs2SkVSRv5lJMpwNQRwTwTJ+4THwgNGEXJJCk8+hMEag3G326jhUVTgg1o58bhSLczSS
         aK+iYsHtMgwdMMXHNfN5nLnR57NIMSUEGoxfQUWk0bB+qUKkqczIAM5DKHmvXN0ZV3qr
         x4pBiUcsbuX0C9b8WEpdfhegZ/bp47CSUD7YhkFzt3oHEbCxRkZlF6QhLuhIP9AAN69a
         7d2g==
X-Gm-Message-State: ACrzQf2u5whS/HvL0F67iGy5Q5uuu3vchuTxb9NQj4kwlE0Ijtai36GP
        ra7yowTqkxTZQPtFFSXanDGU6CZlEHarY7bAK80=
X-Google-Smtp-Source: AMsMyM4c76hxtLErlV8cOLanR4Ht09btQczLL2J9eBrKtWbeiES4mybOMo3joBsodlyCEBgVG1gpV8P9PPHSVvmHgkU=
X-Received: by 2002:a2e:a495:0:b0:26d:8a96:c5c7 with SMTP id
 h21-20020a2ea495000000b0026d8a96c5c7mr2559070lji.439.1664529246672; Fri, 30
 Sep 2022 02:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664360331.git.siyanteng@loongson.cn> <52bc8df87618af951b34759487f05775416cb4d4.1664360331.git.siyanteng@loongson.cn>
In-Reply-To: <52bc8df87618af951b34759487f05775416cb4d4.1664360331.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 30 Sep 2022 17:13:30 +0800
Message-ID: <CAJy-AmkPq8u38kqoWFLJiWOWk268tiNY5Q13ReghE9JwSAjkLg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] docs/zh_CN: Update the translation of page_owner
 to 6.0-rc7
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBXZWQsIFNlcCAy
OCwgMjAyMiBhdCA2OjMyIFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3Jv
dGU6DQo+DQo+IDEpVXBkYXRlIHRvIGNvbW1pdCA4ZjBlZmE4MWRmYmMgKCJtbS9wYWdlX293bmVy
LmM6IGFkZA0KPiBsbHNlZWsgZm9yIHBhZ2Vfb3duZXIiKQ0KPg0KPiAyKVRyYW5zbGF0ZSBzb21l
IHdvcmRzIGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5
YW50ZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL21tL3BhZ2Vfb3duZXIucnN0IHwgMTAgKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21tL3BhZ2Vfb3duZXIucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbW0vcGFnZV9vd25lci5yc3QNCj4gaW5kZXggYjdm
ODFkN2E2NTg5Li4yMWE2YTA4MzdkNDIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL21tL3BhZ2Vfb3duZXIucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL21tL3BhZ2Vfb3duZXIucnN0DQo+IEBAIC03NCwxNSArNzQsMTkg
QEAgcGFnZSBvd25lcuWcqOm7mOiupOaDheWGteS4i+aYr+emgeeUqOeahOOAguaJgOS7pe+8jOWm
guaenOS9oOaDs+S9v+eUqOWug++8jOS9oA0KPiAgICAgICAgIGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9wYWdlX293bmVyID4gcGFnZV9vd25lcl9mdWxsLnR4dA0KPiAgICAgICAgIC4vcGFnZV9vd25l
cl9zb3J0IHBhZ2Vfb3duZXJfZnVsbC50eHQgc29ydGVkX3BhZ2Vfb3duZXIudHh0DQo+DQo+IC0g
ICBgYHBhZ2Vfb3duZXJfZnVsbC50eHRgYCDnmoTkuIDoiKzovpPlh7rmg4XlhrXlpoLkuIso6L6T
5Ye65L+h5oGv5peg57+76K+R5Lu35YC8KTo6DQo+ICsgICBgYHBhZ2Vfb3duZXJfZnVsbC50eHRg
YCDnmoTkuIDoiKzovpPlh7rmg4XlhrXlpoLkuIs6Og0KPg0KPiAgICAgICAgIFBhZ2UgYWxsb2Nh
dGVkIHZpYSBvcmRlciBYWFgsIC4uLg0KPiAgICAgICAgIFBGTiBYWFggLi4uDQo+IC0gICAgICAg
Ly8gRGV0YWlsZWQgc3RhY2sNCj4gKyAgICAgICAvLyDmoIjor6bmg4UNCj4NCj4gICAgICAgICBQ
YWdlIGFsbG9jYXRlZCB2aWEgb3JkZXIgWFhYLCAuLi4NCj4gICAgICAgICBQRk4gWFhYIC4uLg0K
PiAtICAgICAgIC8vIERldGFpbGVkIHN0YWNrDQo+ICsgICAgICAgLy8g5qCI6K+m5oOFDQo+ICsg
ICAg6buY6K6k5oOF5Ya15LiL77yM5a6D5bCG5Lul5LiA5Liq57uZ5a6a55qEcGZu5byA5aeL77yM
5YGa5a6M5pW055qEcGZu6L2s5YKo77yM5LiUcGFnZV9vd25lcuaUr+aMgWZzZWVr44CCDQo+ICsN
Cj4gKyAgICBGSUxFICpmcCA9IGZvcGVuKCIvc3lzL2tlcm5lbC9kZWJ1Zy9wYWdlX293bmVyIiwg
InIiKTsNCj4gKyAgICBmc2VlayhmcCwgcGZuX3N0YXJ0LCBTRUVLX1NFVCk7DQo+DQo+ICAgICBg
YHBhZ2Vfb3duZXJfc29ydGBgIOW3peWFt+W/veeVpeS6hiBgYFBGTmBgIOihjO+8jOWwhuWJqeS9
meeahOihjOaUvuWcqGJ1ZuS4re+8jOS9v+eUqHJlZ2V4cOaPkA0KPiAgICAg5Y+W6aG15bqP5YC8
77yM6K6h566XYnVm55qE5qyh5pWw5ZKM6aG15pWw77yM5pyA5ZCO5qC55o2u5Y+C5pWw6L+b6KGM
5o6S5bqP44CCDQo+IC0tDQo+IDIuMzEuMQ0KPg0K
