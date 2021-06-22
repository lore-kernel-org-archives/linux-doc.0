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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7830C2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 13:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92CED6109E
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 13:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhFVNu0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 09:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFVNu0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 09:50:26 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B15C061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 06:48:09 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so21268728oti.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u7ve+xt2dxNSfwVh4j9flrc28Arptbr+ANi8opjtMTw=;
        b=dNZ0pHgrlh1vVzMfmjksPbq1j9gxSaw82+/4FB3E5U4xgrWCJxKYiNtzOEov/QdLcT
         0xhAPelk0uT+gDi/4OC4ACECTdHlzugzsNfMRUQmTtcdT5yUU9BxSiG+YhNAmbwVwimt
         ozOczq+CmMQ1MIk8MregJ+aCm3i1HNGMfmrQ2qJ+zSM0AiTLdTJ6c/hwKBI7AkcYpUn7
         B9Y4iKDt3gH3fGDFgUOJZuRB2CuWFEpTEJ0PhtayQQMaKRg0JL9LlT7TvakkyvFva2Ea
         1xDhnpxpA2f91xxHbuKQni9aIPE3pEWaI1NRklHxiXVZEhCIMZQyfzsSlGeJHRSAauIY
         UUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u7ve+xt2dxNSfwVh4j9flrc28Arptbr+ANi8opjtMTw=;
        b=kQV2V5sVfofBkC3Z8i5vEjIGMFrDYqZmTZM80rOwnps71tL4X5n9h2jHFz3RVPPKxT
         YGnlAheiuyCMXb4xkDet7XglE7uAN3q2kDpZmL5jQgz/UzkymNq7d/1sShGv5QAueNyB
         y0BzXwGfypNbCKUYQVfPUO9GtQfS+2wkcZMSaiRRm6alrOApIOdBerYP9XJyyqg7yE2M
         zLM6soiWluESNxjkV0BGcUOTzx+Qb5IMEGg/yJVVdmvwSuAwsLXClktpbO4oUpCouGmT
         cN66TgwOHqWPfSvzPOs2hrxplW/mWTGhTJm2cwsuElRrCdgYqIYMZpMpCVR1AWVZH8fd
         y/PA==
X-Gm-Message-State: AOAM533Ek8DsVbr6I6JDj8PRUPnLTizQ+KatornHgMxG7/JWik8mNXW2
        eJCdhjvQmr1jkFOh/le85zfrEob+6Ew14QljVHY=
X-Google-Smtp-Source: ABdhPJwRhkQzlDftS2ONN12kdOstoMnE1A7o84rX7bE6xtVk2r5ZCThy5qVKj3NzQCsO6LO2sfNQyJwcfBhVwSuT1Jk=
X-Received: by 2002:a9d:1ea5:: with SMTP id n34mr3249939otn.340.1624369689071;
 Tue, 22 Jun 2021 06:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623743265.git.siyanteng@loongson.cn> <6cf9d7c35867d303ba4e66169f3ed1c9d5399e8e.1623743265.git.siyanteng@loongson.cn>
 <20210620043304.GA14958@bobwxc.top>
In-Reply-To: <20210620043304.GA14958@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 22 Jun 2021 21:47:59 +0800
Message-ID: <CAEensMx00b1tENuHmzfY+UeYRJYvvvYc0qkcZgzfttCLARuiQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: add core api protection keys translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDIw5pel5ZGo5pelIOS4i+WN
iDEyOjMz5YaZ6YGT77yaDQo+DQo+IE9uIFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDAzOjUyOjQwUE0g
KzA4MDAsIFlhbnRlbmcgU2kgd3JvdGU6DQo+ID4gVHJhbnNsYXRlIERvY3VtZW50YXRpb24vY29y
ZS1hcGkvcHJvdGVjdGlvbi1rZXlzLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4g
IC4uLi96aF9DTi9jb3JlLWFwaS9wcm90ZWN0aW9uLWtleXMucnN0ICAgICAgICB8IDk4ICsrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Nv
cmUtYXBpL3Byb3RlY3Rpb24ta2V5cy5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9wcm90ZWN0aW9uLWtleXMucnN0IGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvcHJvdGVjdGlvbi1rZXlz
LnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi45
MWEyODJiOWE1NzYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvcHJvdGVjdGlvbi1rZXlzLnJzdA0KPiA+IEBAIC0w
LDAgKzEsOTggQEANCj4gPiArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
PiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3Jp
Z2luYWw6IERvY3VtZW50YXRpb24vY29yZS1hcGkvcHJvdGVjdGlvbi1rZXlzLnJzdA0KPiA+ICsN
Cj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50
ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArOuagoeivkToNCj4gPiArDQo+ID4gKw0KPiA+
ICsuLiBfY25fY29yZS1hcGlfcHJvdGVjdGlvbi1rZXlzOg0KPiA+ICsNCj4gPiArPT09PT09PT09
PT09DQo+ID4gK+WGheWtmOS/neaKpOWvhumSpQ0KPiA+ICs9PT09PT09PT09PT0NCj4gPiArDQo+
ID4gK+eUqOaIt+epuumXtOeahOWGheWtmOS/neaKpOWvhumSpe+8iFBLVe+8jOWPiOensFBLRVlz
77yJ5piv6Iux54m55bCUU2t5bGFrZe+8iOWPiuS7peWQju+8iSLlj6/miakNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQo+IO+8iE1lbW9yeSBQcm90ZWN0aW9uIEtleXMgZm9yIFVzZXJzcGFjZe+8jFBLVe+8jOS6
puWNs1BLRVlz77yJDQpvaw0KPg0KPiA+ICvlsZXlpITnkIblmaggIuacjeWKoeWZqENQVeS4iuea
hOS4gOmhueWKn+iDveOAguWug+WwhuWcqOacquadpeeahOmdnuacjeWKoeWZqOiLseeJueWwlOWk
hOeQhuWZqOWSjOacquadpQ0KPiAgICAgICAgICAgIF5eDQo+ICAgICAgICAgICAg4oCc4oCdDQpv
aw0KPg0KPiA+ICvnmoRBTUTlpITnkIblmajkuK3kvb/nlKjjgIINCj4NCj4gcy/kvb/nlKgv5Y+v
55SoLw0Kb2sNCj4NCj4gPiArDQo+ID4gK+WvueS6juS7u+S9leW4jOacm+a1i+ivleaIluS9v+eU
qOivpeWKn+iDveeahOS6uuadpeivtO+8jOWug+WcqOS6mumprOmAiueahEVDMiBDNeWunuS+i+S4
reaYr+WPr+eUqOeahO+8jA0KPiA+ICvlubbkuJTlt7Lnn6Xlj6/ku6XlnKjpgqPph4zkvb/nlKhV
YnVudHUgMTcuMDTplZzlg4/ov5DooYzjgIINCj4gPiArDQo+ID4gK+WGheWtmOS/neaKpOWvhumS
peaPkOS+m+S6huS4gOenjeacuuWItuadpeaJp+ihjOWfuuS6jumhtemdoueahOS/neaKpO+8jOS9
huWcqOW6lOeUqOeoi+W6j+aUueWPmOS/neaKpOWfnw0KPiA+ICvml7bkuI3pnIDopoHkv67mlLnp
obXooajjgILlroPnmoTlt6XkvZzljp/nkIbmmK/lnKjmr4/kuKrpobXooajpobnkuK3kuLogIuS/
neaKpOWvhumSpSAi5YiG6YWNNOS4quS7pQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeXiAgICAgICAgXl4NCm9rDQo+DQo+ID4gK+WJjeiiq+W/
veeVpeeahOS9je+8jOS7juiAjOaPkOS+mzE25Liq5Y+v6IO955qE5a+G6ZKl44CCDQo+ID4gKw0K
PiA+ICvov5jmnInkuIDkuKrmlrDnmoTnlKjmiLflj6/orr/pl67nmoTlr4TlrZjlmajvvIhQS1JV
77yJ77yM5Li65q+P5Liq5a+G6ZKl5o+Q5L6b5Lik5Liq5Y2V54us55qE5L2N77yI6K6/DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICBeXg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmVt
b3ZlIOeahA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg5pat5Y+l5q2n5LmJDQpvayxyZW1v
dmVkDQo+DQo+ID4gK+mXruemgeatouWSjOWGmeWFpeemgeatou+8ieOAguS9nOS4uuS4gOS4qkNQ
VeWvhOWtmOWZqO+8jFBLUlXlnKjmnKzotKjkuIrmmK/nur/nqIvmnKzlnLDnmoTvvIzlj6/og70N
Cj4gPiAr5Lya57uZ5q+P5Liq57q/56iL5o+Q5L6b5LiA5aWX5LiN5ZCM5LqO5YW25LuW57q/56iL
55qE5L+d5oqk5o6q5pa944CCDQo+ID4gKw0KPiA+ICvmnInkuKTmnaHmlrDmjIfku6TvvIhSRFBL
UlUvV1JQS1JV77yJ55So5LqO6K+75Y+W5ZKM5YaZ5YWl5paw55qE5a+E5a2Y5Zmo44CC6K+l5Yqf
6IO95LuF5ZyoNjTkvY0NCj4gPiAr5qih5byP5LiL5Y+v55So77yM5bC9566hUEFFIFBURXPkuK3n
kIborrrkuIrmnInnqbrpl7TjgILov5nkupvmnYPpmZDlj6rlnKjmlbDmja7orr/pl67kuIrlvLrl
iLbmiafooYzvvIwNCj4gPiAr5a+55oyH5Luk6I635Y+W5rKh5pyJ5b2x5ZON44CCDQo+DQo+IHMv
UEFFIFBURXMv54mp55CG5Zyw5Z2A5omp5bGV6aG16KGoLyDvvJ8NCm9rDQo+DQo+ID4gKw0KPiA+
ICsNCj4gPiAr57O757uf6LCD55SoDQo+ID4gKz09PT09PT09DQo+ID4gKw0KPiA+ICvmnIkz5Liq
57O757uf6LCD55So5Y+v5Lul55u05o6l5LiOcGtleXPov5vooYzkuqTkupI6Og0KPiA+ICsNCj4g
PiArICAgICBpbnQgcGtleV9hbGxvYyh1bnNpZ25lZCBsb25nIGZsYWdzLCB1bnNpZ25lZCBsb25n
IGluaXRfYWNjZXNzX3JpZ2h0cykNCj4gPiArICAgICBpbnQgcGtleV9mcmVlKGludCBwa2V5KTsN
Cj4gPiArICAgICBpbnQgcGtleV9tcHJvdGVjdCh1bnNpZ25lZCBsb25nIHN0YXJ0LCBzaXplX3Qg
bGVuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcHJvdCwgaW50
IHBrZXkpOw0KPiA+ICsNCj4gPiAr5Zyo5L2/55So5LiA5LiqcGtleeS5i+WJje+8jOW/hemhu+WF
iOeUqHBrZXlfYWxsb2MoKeWIhumFjeWug+OAguS4gOS4quW6lOeUqOeoi+W6j+ebtOaOpeiwg+eU
qA0KPiA+ICtXUlBLUlXmjIfku6TvvIzku6XmlLnlj5jkuIDkuKrlr4bpkqXopobnm5bnmoTlhoXl
rZjnmoTorr/pl67mnYPpmZDjgILlnKjov5nkuKrkvovlrZDkuK3vvIxXUlBLUlUNCj4gPiAr6KKr
5LiA5Liq5Y+r5YGacGtleV9zZXQoKeeahEPlh73mlbDmiYDlsIHoo4U6Og0KPiA+ICsNCj4gPiAr
ICAgICBpbnQgcmVhbF9wcm90ID0gUFJPVF9SRUFEfFBST1RfV1JJVEU7DQo+ID4gKyAgICAgcGtl
eSA9IHBrZXlfYWxsb2MoMCwgUEtFWV9ESVNBQkxFX1dSSVRFKTsNCj4gPiArICAgICBwdHIgPSBt
bWFwKE5VTEwsIFBBR0VfU0laRSwgUFJPVF9OT05FLCBNQVBfQU5PTllNT1VTfE1BUF9QUklWQVRF
LCAtMSwgMCk7DQo+ID4gKyAgICAgcmV0ID0gcGtleV9tcHJvdGVjdChwdHIsIFBBR0VfU0laRSwg
cmVhbF9wcm90LCBwa2V5KTsNCj4gPiArICAgICAuLi4gYXBwbGljYXRpb24gcnVucyBoZXJlDQo+
ID4gKw0KPiA+ICvnjrDlnKjvvIzlpoLmnpzlupTnlKjnqIvluo/pnIDopoHmm7TmlrAncHRyJ+Wk
hOeahOaVsOaNru+8jOWug+WPr+S7peiOt+W+l+iuv+mXruadg++8jOi/m+ihjOabtOaWsO+8jA0K
PiA+ICvnhLblkI7lj5bmtojlhbblhpnorr/pl67mnYM6Og0KPiA+ICsNCj4gPiArICAgICBwa2V5
X3NldChwa2V5LCAwKTsgLy8gY2xlYXIgUEtFWV9ESVNBQkxFX1dSSVRFDQo+ID4gKyAgICAgKnB0
ciA9IGZvbzsgLy8gYXNzaWduIHNvbWV0aGluZw0KPiA+ICsgICAgIHBrZXlfc2V0KHBrZXksIFBL
RVlfRElTQUJMRV9XUklURSk7IC8vIHNldCBQS0VZX0RJU0FCTEVfV1JJVEUgYWdhaW4NCj4gPiAr
DQo+ID4gK+eOsOWcqO+8jOW9k+Wug+mHiuaUvuWGheWtmOaXtu+8jOWug+S5n+WwhumHiuaUvnBr
ZXnvvIzlm6DkuLrlroPkuI3lho3ooqvkvb/nlKjkuoY6Og0KPiA+ICsNCj4gPiArICAgICBtdW5t
YXAocHRyLCBQQUdFX1NJWkUpOw0KPiA+ICsgICAgIHBrZXlfZnJlZShwa2V5KTsNCj4gPiArDQo+
ID4gKy4uIG5vdGU6OiBwa2V5X3NldCgp5pivUkRQS1JV5ZKMV1JQS1JV5oyH5Luk55qE5LiA5Liq
5bCB6KOF5Zmo44CC5ZyodG9vbHMvdGVzdGluZy9zZWxmdGVzdHMveDg2L3Byb3RlY3Rpb25fa2V5
cy5j5Lit5Y+v5Lul5om+5Yiw5LiA5Liq5a6e546w5a6e5L6L44CCDQo+ID4gKyAgICAgICAgICB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy94ODYvcHJvdGVjdGlvbl9rZXlzLmMuDQo+ID4gKw0KPiA+
ICvooYzkuLoNCj4gPiArPT09PQ0KPiA+ICsNCj4gPiAr5YaF5qC46K+V5Zu+5L2/5L+d5oqk5a+G
6ZKl5LiO5pmu6YCa55qEcHJvdGVjdCgp55qE6KGM5Li65LiA6Ie044CC5L6L5aaC77yM5aaC5p6c
5L2g6L+Z5qC35YGaOjoNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl4N
Cj4NCm9rLA0KPg0KPiA+ICsNCj4gPiArICAgICBtcHJvdGVjdChwdHIsIHNpemUsIFBST1RfTk9O
RSk7DQo+ID4gKyAgICAgc29tZXRoaW5nKHB0cik7DQo+ID4gKw0KPiA+ICvov5nmoLflgZrnmoTm
l7blgJnvvIzkvaDlj6/ku6XmnJ/lvoXkv53miqTlr4bpkqXnmoTnm7jlkIzmlYjmnpw6Og0KPiA+
ICsNCj4gPiArICAgICBwa2V5ID0gcGtleV9hbGxvYygwLCBQS0VZX0RJU0FCTEVfV1JJVEUgfCBQ
S0VZX0RJU0FCTEVfUkVBRCk7DQo+ID4gKyAgICAgcGtleV9tcHJvdGVjdChwdHIsIHNpemUsIFBS
T1RfUkVBRHxQUk9UX1dSSVRFLCBwa2V5KTsNCj4gPiArICAgICBzb21ldGhpbmcocHRyKTsNCj4g
PiArDQo+ID4gK+aXoOiuunNvbWV0aGluZygp5piv5ZCm5piv5a+5J3B0cifnmoTnm7TmjqXorr/p
l67vvIzov5npg73lupTor6XkuLrnnJ/jgIINCj4gPiAr5aaCOjoNCj4gPiArDQo+ID4gKyAgICAg
KnB0ciA9IGZvbzsNCj4gPiArDQo+ID4gK+aIluiAheW9k+WGheaguOS7o+ihqOW6lOeUqOeoi+W6
j+i/m+ihjOiuv+mXruaXtu+8jOavlOWmgnJlYWQoKTo6DQo+ID4gKw0KPiA+ICsgICAgIHJlYWQo
ZmQsIHB0ciwgMSk7DQo+ID4gKw0KPiA+ICvlnKjov5nkuKTnp43mg4XlhrXkuIvvvIzlhoXmoLjp
g73kvJrlj5HpgIHkuIDkuKpTSUdTRUdW77yM5L2G5b2T6L+d5Y+N5L+d5oqk5a+G6ZKl5pe277yM
c2lfY29kZQ0KPiA+ICvlsIbooqvorr7nva7kuLpTRUdWX1BLRVJS77yM6ICM5b2T6L+d5Y+N5pmu
6YCa55qEbXByb3RlY3QoKeadg+mZkOaXtu+8jOWImeaYr1NFR1ZfQUNDRVJS44CCDQo+ID4gLS0N
Cj4gPiAyLjI3LjANCj4NCj4gVGhhbmtzLA0KPiAgICAgICAgIFd1IFguQy4NClRoYW5rcyB5b3Ug
Zm9yIHlvdXIgcmV2aWV3IQ0KDQpUaGFua3MsDQoNCllhbnRlbmcNCg==
