Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FF7C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 08:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2280822D2C
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 08:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404365AbhALIHX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 03:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730314AbhALIHX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 03:07:23 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805B8C061786
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 00:06:42 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id w1so2152291ejf.11
        for <linux-doc@vger.kernel.org>; Tue, 12 Jan 2021 00:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7Sgvg1tPjZjbNBCzAfmr4JQAgmHYp6UU+LYrDUE5QYk=;
        b=l8MY9zdvNfZT6x0+R6KR9nX8qWsDv4QETbFaX2FvU4eUVdf4zmoMYdVx9/on5/Gj7E
         6LIA+ZTsLXEYtb8k3WRYM45moj5QwiUbRcziQ6IyI4LtDmHSTujCTcWw9EXgaDrQaUZI
         rkhXxb/ZwinWZ6nyF8nR7A+7YAVtZCs7Ct57tg0te1uVYf6zIAeHwt3CXguLuzSYqAdA
         cUbSjYutjWy3p5piYMkpSr3dHtrpCobRyRJO6htd1Wcrq0voUDqIsGI/a4rFVQJArR06
         6hfzRS1L9VV3ZnYPtxohra55wgTBzpktDOXzhfEaE6ECWeZvfqjUD8WAZANWew0FMZn/
         6y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7Sgvg1tPjZjbNBCzAfmr4JQAgmHYp6UU+LYrDUE5QYk=;
        b=IHjq4yn+hjyeSUbb//cdzeMgvuOFGIrkU68WyRh/bB5r2CgPnsgK+iSk4GExsPrvWo
         yzAIuY/QDtN24CCbuYizmxJ4dFgeDsy/0q0jm3AV3AgVny7mlejwTDWimKs0oSUkVQaO
         yTc3FlHkBag9KgHbIuZgkZ90nTLvQDRdERrWJOYclybHMYtkukjcd0JgF6jh6//pqEag
         nEMmKFbzoLgZllQyKYGO2/FcUxi4oB/UP97Gyl5XXTJNI0lIT7VV+CH78ZgysyGg5syd
         Pxw/14jJf3yUSi2alOdhmuwHr1SLpPO/uvNKqFZ32Q0BXb9yzjPn0Kpv8d9haFJsS95/
         K6sg==
X-Gm-Message-State: AOAM533hWSZsVulkl+CuLKGtd/LudZUhvGjt55tOc1KplzPT7YZtdY9O
        l3kKU3dp3o6ySwsawzrEwsxeJ/AXQ3NXBN8AV3c=
X-Google-Smtp-Source: ABdhPJy0o7b6PW+Mp/uRix0ln2l+fsEp2J2tZ84JAYzXQcJxLaGJQZkhaJFPYK0xwDowMI3gsc0yfONW/1AQoJ3Q4A0=
X-Received: by 2002:a17:906:704d:: with SMTP id r13mr2351029ejj.43.1610438800483;
 Tue, 12 Jan 2021 00:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108100221.1370763-1-siyanteng@loongson.cn>
 <20210108100221.1370763-4-siyanteng@loongson.cn> <6b6dd58a-0f59-c8c3-2a7a-8ee7c866a970@flygoat.com>
 <CAEensMxVwEzPZaGS9vUunieMJQYj3jGBA9oPn62WCW2hoTS5Ww@mail.gmail.com> <66520b7e-e911-20b9-dd72-29ff337434d8@flygoat.com>
In-Reply-To: <66520b7e-e911-20b9-dd72-29ff337434d8@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 12 Jan 2021 16:06:27 +0800
Message-ID: <CAEensMxzQQhgZx7WjsCOGj+XgDsaqzhDMVOBjL_XbKNrpb7EFQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ik9TVCIgYXBwZWFycyBtYW55IHRpbWVzIGFib3ZlLCBhbmQgaXQgaGFzIGJlZW4gaW50ZXJwcmV0
ZWQgYXMgIuezu+e7n+WumuaXtuWZqCINCndoZW4gaXQgZmlyc3QgYXBwZWFyZWQuIFRoZXJlZm9y
ZSwgaW4gb3JkZXIgdG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZQ0Kb3JpZ2luYWwgZG9jdW1lbnQg
c3R5bGUsIEkgdGhpbmsgIk9TVCIgZG9lcyBub3QgbmVlZCB0byBiZSB0cmFuc2xhdGVkLg0KVGhh
bmsgeW91IQ0KDQpKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+IOS6jjIwMjHl
ubQx5pyIMTLml6Xlkajkuowg5LiL5Y2IMzoxNuWGmemBk++8mg0KPg0KPiDlnKggMjAyMS8xLzkg
5LiK5Y2IOTo0OSwgeWFudGVuZyBzaSDlhpnpgZM6DQo+ID4gSSB0aGluayB0aGVzZSBjaGFuZ2Vz
IGFyZSB2ZXJ5IGdvb2QsIHlvdSB3aWxsIHNlZSBpdCBpbiBQQVRDSCB2NSwgdGhhbmsgeW91IQ0K
PiA+DQo+ID4gSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPiDkuo4yMDIx5bm0
MeaciDjml6XlkajkupQg5LiL5Y2INzoyNeWGmemBk++8mg0KPiA+PiDlnKggMjAyMS8xLzgg5LiL
5Y2INjowMiwgWWFudGVuZyBTaSDlhpnpgZM6DQo+IFsuLi5dDQo+ID4+PiAr5a6e546wDQo+ID4+
PiArPT09PQ0KPiA+Pj4gKw0KPiA+Pj4gK1RDVeehrOS7tueahOWKn+iDveWIhuW4g+WcqOWkmuS4
qumpseWKqOeoi+W6j++8mg0KPiA+Pj4gKw0KPiA+Pj4gKz09PT09PT09PT09ICA9PT09PQ0KPiA+
Pj4gK+aXtumSnyAgICAgICAgIGRyaXZlcnMvY2xrL2luZ2VuaWMvdGN1LmMNCj4gPj4+ICvkuK3m
lq0gICAgICAgICBkcml2ZXJzL2lycWNoaXAvaXJxLWluZ2VuaWMtdGN1LmMNCj4gPj4+ICvlrprm
l7blmaggICAgICAgZHJpdmVycy9jbG9ja3NvdXJjZS9pbmdlbmljLXRpbWVyLmMNCj4gPj4+ICtP
U1QgICAgICAgICAgZHJpdmVycy9jbG9ja3NvdXJjZS9pbmdlbmljLW9zdC5jDQo+ID4+IOaZtuaM
r++8nw0KPg0KPiBUbyBjb3JyZWN0IG15c2VsZiwgdGhlIE9TVCByZWZlcnMgdG8gIk9wZXJhdGlu
ZyBTeXN0ZW0gVGltZXIiLg0KPiBTbyBtYXliZSAi57O757uf5a6a5pe25ZmoIiBvciBqdXN0IGxl
YXZlIGl0IGFzIGlzLg0KPg0KPiBUaGFua3MuDQo+DQo+IC0gSmlheHVuLg0KPg0KPiBbLi4uXQ0K
