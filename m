Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101E4C4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8BA360F35
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbhHDGlw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 02:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235419AbhHDGlv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 02:41:51 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A31C0613D5
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 23:41:38 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so825829oti.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D/mxDoYD0JEObKLl3p6yhpIWd5BIuCelivuj6fZGEfs=;
        b=JO6/ed9Ro2aBo9Nw3c8c/Pgr5cdaztkcc2z8yqVdQXRt/7HwLIyiAyseQRejeEvjCv
         8TqV3GfXyF9E4rxaj5otGgX42VIwLQUnLc7im/e5zy6albNYYk76W4zMNrxYiIEyakbF
         ucBe4ieTjaBsaplOk0QwVJFvq6bLRICTOsYXXi2l9Khkk71q3qIl3Bj0aKbmgArG3XJK
         EUdlPa+u0XDU1KSJh3PlVdFoBkFEZ6VZSmKVIXvJl86akfMqSpsCMQ1UvWP8Vuruxw9c
         cgUW57YfV4anDnku8cg3HUpfXC4Q9DTlhF0BHNKYYBzmq+Q8PBlucYGWKK0wf+50ZUc5
         yH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D/mxDoYD0JEObKLl3p6yhpIWd5BIuCelivuj6fZGEfs=;
        b=SS5B5G5ex1/upSu0NkoWVsefw+ZSNksr2IG7vjk5XAebb8KKJLxahEjjCF8CiHmpCQ
         JJljIfOZjtMSUO6HrzovDeMiwnzwbqxIkQ1NVsIahEiRVYQtiSd1JUIS/UiKkoypM0Xg
         +rrlg6dLHRdA1Y3iddwIq5+3OQXBgUG6fQDA4ZaS6EVmOKOjJRskYXFLiCNWzV/QcO4n
         VVMpF+u/ubDlVRipAoKPFnRwFlHTmZ0dpRD97W0SvfRG5sCiAcvyWiqnR0zbcg/8PdBZ
         EL/lRrx+shWenYfiTRoOwLEstWnn0i/KrYPtEyoI5NOCaXJqoGqWO3/MT2eNF8OcHghl
         iR9Q==
X-Gm-Message-State: AOAM532pz92/0KNjqp9BrD3ppclgZweEdY9liYKUWyIzFLVoJm9GcrWa
        bSQZu46/w6z+HBV9oMVyQQWw4y3l4bQndHgUvwE=
X-Google-Smtp-Source: ABdhPJwwCisq8WoRiVHsVZc0Hgngm4u+RRedKNmDo4Btjbv7mf4rk5dKDZlyQHMfTj2A40Fa42HmIEx+6HfRxVDYceU=
X-Received: by 2002:a05:6830:4491:: with SMTP id r17mr18684364otv.243.1628059298213;
 Tue, 03 Aug 2021 23:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <56b196333c3070657da3e85841fb43592dd81ca0.1627823347.git.siyanteng@loongson.cn>
 <CAJy-AmnXZ7M=0T8-jHXUwGYbp2xGA0vhGR2qGMqE1S_juGiO=w@mail.gmail.com>
In-Reply-To: <CAJy-AmnXZ7M=0T8-jHXUwGYbp2xGA0vhGR2qGMqE1S_juGiO=w@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 4 Aug 2021 14:41:28 +0800
Message-ID: <CAEensMzRyiRPAm8QTp4LeKcwXbYnwBvK82fr_vnv5vtFVf1NpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] docs/zh_CN: add virt paravirt_ops translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDTml6XlkajkuIkg5LiK
5Y2IMTA6NDDlhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBBdWcgMSwgMjAyMSBhdCA5OjMyIFBNIFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+ID4NCj4gPiBUcmFuc2xh
dGUgRG9jdW1lbnRhdGlvbi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QgaW50byBDaGluZXNlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0K
PiA+IFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4g
PiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdCAgICAgICAgIHwgIDMgKy0N
Cj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QgIHwgNDEg
KysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0IGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9pbmRleC5yc3QNCj4gPiBpbmRl
eCA5ZTVkZjViNWRlMTUuLmI5YjIzYmI4OGZmYSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2luZGV4LnJzdA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZpcnQvaW5kZXgucnN0DQo+ID4gQEAgLTIwLDExICsy
MCwxMiBAQCBMaW51eOiZmuaLn+WMluaUr+aMgQ0KPiA+ICAuLiB0b2N0cmVlOjoNCj4gPiAgICAg
Om1heGRlcHRoOiAyDQo+ID4NCj4gPiArICAgcGFyYXZpcnRfb3BzDQo+ID4gKw0KPiA+ICBUT0RP
TElTVDoNCj4gPg0KPiA+ICAgICBrdm0vaW5kZXgNCj4gPiAgICAgdW1sL3VzZXJfbW9kZV9saW51
eF9ob3d0b192Mg0KPiA+IC0gICBwYXJhdmlydF9vcHMNCj4gPiAgICAgZ3Vlc3QtaGFsdC1wb2xs
aW5nDQo+ID4gICAgIG5lX292ZXJ2aWV3DQo+ID4gICAgIGFjcm4vaW5kZXgNCj4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMu
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9wYXJhdmlydF9vcHMu
cnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmU5
ZTA3MDhhMWQ2Mw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92aXJ0L3BhcmF2aXJ0X29wcy5yc3QNCj4gPiBAQCAtMCwwICsxLDQx
IEBADQo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy4uIGlu
Y2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBE
b2N1bWVudGF0aW9uL3ZpcnQvcGFyYXZpcnRfb3BzLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkToN
Cj4gPiArDQo+ID4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+ICsNCj4gPiArOuagoeivkToNCj4gPiArDQo+ID4gKyDpmYjpo57mnaggRmVpeWFuZyBD
aGVuIDxjaGVuZmVpeWFuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiArIOaXtuWljuS6riBBbGV4IFNoaSA8
YWxleHNAa2VybmVsLm9yZz4NCj4gPiArDQo+ID4gKy4uIF9jbl92aXJ0X3BhcmF2aXJ0X29wczoN
Cj4gPiArDQo+ID4gKz09PT09PT09PT09PQ0KPiA+ICtQYXJhdmlydF9vcHMNCj4NCj4gdGhpcyB0
aXRsZSBjb3VsZCBiZSB0cmFuc2xhdGVkIGFzIOWNiuiZmuaLn+WMluaTjeS9nO+8nw0KT0shDQo+
DQo+ID4gKz09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArTGludXjmj5Dkvpvkuoblr7nkuI3lkIzn
rqHnkIbnqIvluo/omZrmi5/ljJbmioDmnK/nmoTmlK/mjIHjgILljoblj7LkuIrvvIzkuLrkuobm
lK/mjIHkuI3lkIznmoTomZrmi5/mnLrotoXnuqfnrqHnkIblmagNCj4gPiAr77yIaHlwZXJ2aXNv
cu+8jOS4i+aWh+eugOensOi2hee6p+euoeeQhuWZqO+8ie+8jOmcgOimgeS4jeWQjOeahOS6jOi/
m+WItuWGheaguO+8jOi/meS4qumZkOWItuW3sue7j+iiq3B2X29wc+enuw0KPiA+ICvpmaTkuobj
gIJMaW51eCBwdl9vcHPmmK/kuIDkuKromZrmi5/ljJZBUEnvvIzlroPog73lpJ/mlK/mjIHkuI3l
kIznmoTnrqHnkIbnqIvluo/jgILlroPlhYHorrjmr4/kuKrnrqHnkIbnqIvluo8NCj4gPiAr5LyY
5YWI5LqO5YWz6ZSu5pON5L2c77yM5bm25YWB6K645Y2V5LiA55qE5YaF5qC45LqM6L+b5Yi25paH
5Lu25Zyo5omA5pyJ5pSv5oyB55qE5omn6KGM546v5aKD5Lit6L+Q6KGM77yM5YyF5ous5pys5py6
4oCU4oCU5rKhDQo+ID4gK+acieS7u+S9leeuoeeQhueoi+W6j+OAgg0KPiA+ICsNCj4gPiArcHZf
b3Bz5o+Q5L6b5LqG5LiA57uE5Ye95pWw5oyH6ZKI77yM5Luj6KGo5LqG5LiO5L2O57qn5YWz6ZSu
5oyH5Luk5ZKM5ZCE6aKG5Z+f6auY57qn5Yqf6IO955u45a+55bqU55qE5pON5L2c44CCDQo+ID4g
K3B2LW9wc+WFgeiuuOWcqOi/kOihjOaXtui/m+ihjOS8mOWMlu+8jOWcqOWQr+WKqOaXtuWvueS9
jue6p+WFs+mUruaTjeS9nOi/m+ihjOS6jOi/m+WItuS/ruihpeOAgg0KPiA+ICsNCj4gPiArcHZf
b3Bz5pON5L2c6KKr5YiG5Li65LiJ57G7Og0KPiA+ICsNCj4gPiArLSDnroDljZXnmoTpl7TmjqXo
sIPnlKgNCj4gPiArICAg6L+Z5Lqb5pON5L2c5a+55bqU5LqO6auY5rC05bmz55qE5Ye95pWw77yM
5LyX5omA5ZGo55+l77yM6Ze05o6l6LCD55So55qE5byA6ZSA5bm25LiN5Y2B5YiG6YeN6KaB44CC
DQo+ID4gKw0KPiA+ICstIOmXtOaOpeiwg+eUqO+8jOWFgeiuuOeUqOS6jOi/m+WItuihpeS4gei/
m+ihjOS8mOWMlg0KPiA+ICsgICDpgJrluLjmg4XlhrXkuIvvvIzov5nkupvmk43kvZzlr7nlupTk
uo7kvY7nuqfliKvnmoTlhbPplK7mjIfku6TjgILlroPku6zooqvpopHnuYHlnLDosIPnlKjvvIzl
ubbkuJTmmK/lr7nmgKfog73lhbMNCj4gPiArICAg6ZSu44CC5byA6ZSA5piv6Z2e5bi46YeN6KaB
55qE44CCDQo+ID4gKw0KPiA+ICstIOS4gOWll+eUqOS6juaJi+WGmeaxh+e8luS7o+eggeeahOWu
j+eoi+W6jw0KPiA+ICsgICDmiYvlhpnnmoTmsYfnvJbku6PnoIHvvIguU+aWh+S7tu+8ieS5n+mc
gOimgeWHhuiZmuaLn+WMlu+8jOWboOS4uuWug+S7rOWMheaLrOaVj+aEn+aMh+S7pOaIluWFtuS4
reeahOS4gOS6m+S7ow0KPg0KPiBwYXJhdmlydCB1c3VhbGx5IGlzIHRyYW5sYXRlZCBhcyDljYro
mZrmi5/ljJbvvIwNCk9LIQ0KPg0KPiBvdGhlcnMgbG9va3MgZ29vZCBmb3IgbWUuDQo+DQoNClRo
YW5rcywNCg0KWWFudGVuZw0K
