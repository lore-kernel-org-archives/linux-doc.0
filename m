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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28458C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 15:12:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E554261445
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 15:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242937AbhDWPNA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 11:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhDWPMt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 11:12:49 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C1EC06174A
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:12:11 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id p67so29319769pfp.10
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BpKTVvl9fNwhi3eT41Ly/hFjMDslruBXet7P1BPsOU4=;
        b=RwL2S73wxQNqfpGdZJnvan0IERAEmaHp4iv0ETit0VvtdbaZ60AH9jjNOAPhPQ8sFi
         8Z4qe4siyjg7kvKiUTIBotUswzx9gudz+z62NMikVfl8TWJBTUrpQiLugT2oN6jIUudm
         omTCUpQHpzJVkddR4LWH//OtJmhP+kXXFS/a6s1ZqQFRsKXAxMnQWzEhkv7HMdinY5K4
         0H9dFJWWqyq2MdJcHQznekYme70m4ikog1VhJ1TqCtEwHG+TqkJB88LcY+TXvCTJ8Xk/
         VZHZlH/PDFt7EIgf95QL2Dw15CFnbkvn/iQQK0PGjzUgixxtvuQC5NNyg8e2J2SnCeIL
         ZuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BpKTVvl9fNwhi3eT41Ly/hFjMDslruBXet7P1BPsOU4=;
        b=Jnm/Vzopxr1cdmkF5jJ01HYOa6DHmiYucc9P0h66AyH5JXH9HDL4UTxL+63VTU/do8
         n9DI7OS7+lAwIfrJAMKAFFro3IueZgA+DGPzlu1Rbqg4Lg71uRccYUlXW11DHH/OJ7mC
         ZX6lhZfyVTtI+nXlzxIL2wR4o1hD2kd3DMlvIo9LaXpmIgn+vQJ3wZEnODBcWNRgpUXo
         wVTDTNcVmp0/HKxokMzPQN8m3xtA7Jc8cbaqt8lV1sq9D84hF0Fcv5iF1DTdg6ThcLJ0
         gNoRZLpbRxT4uzaNYNw3EST8H6aFRfWJTpg0SLMa+iGKObgcomMHY5qysqfY3b826g+E
         Zd3w==
X-Gm-Message-State: AOAM533EnTXtrCRKfHbRw7cjzgKtXqR2jDrRRCqBRifuYz2eEGLTaJaP
        tv234bVksssHCiZ9IomWX5EJ4FR8ZsNUEjgUK/A=
X-Google-Smtp-Source: ABdhPJzcboYZgj9dltasg+XI9tz6piQQGRyLrP5J9C31Fxszj47go+IhTEAkNbhZjF3IhY2B7dltvsx3LMh6APAY0IA=
X-Received: by 2002:a05:6a00:72b:b029:218:6603:a6a9 with SMTP id
 11-20020a056a00072bb02902186603a6a9mr4125406pfm.78.1619190731133; Fri, 23 Apr
 2021 08:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619093668.git.bobwxc@email.cn> <710672f91fe72a6ee8a78a8ea3c714068bd9a322.1619093668.git.bobwxc@email.cn>
In-Reply-To: <710672f91fe72a6ee8a78a8ea3c714068bd9a322.1619093668.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 23 Apr 2021 23:11:58 +0800
Message-ID: <CAMU9jJqZt3RQd-xTyJU5G8N8nzP4-wwy3+SAS2PTb6pKaTHKTQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] docs/zh_CN: Add translation zh_CN/maintainer/modifying-patches.rst
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
iDg6MzDlhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9tb2RpZnlpbmctcGF0Y2hlcy5yc3QN
Cj4gYW5kIGxpbmsgaXQgdG8gemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QNCj4NCj4gU2lnbmVk
LW9mZi1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiAtLS0NCj4gIC4uLi90
cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QgICB8ICA0ICstDQo+ICAuLi4v
emhfQ04vbWFpbnRhaW5lci9tb2RpZnlpbmctcGF0Y2hlcy5yc3QgICAgfCA1MSArKysrKysrKysr
KysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vbWFpbnRhaW5lci9tb2RpZnlpbmctcGF0Y2hlcy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0IGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9pbmRleC5yc3QNCj4g
aW5kZXggMThhODIwNzQxZjUyLi5lYjc1Y2NlYTlhMjEgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0DQo+IEBA
IC0xNyw3ICsxNyw1IEBADQo+ICAgICByZWJhc2luZy1hbmQtbWVyZ2luZw0KPiAgICAgcHVsbC1y
ZXF1ZXN0cw0KPiAgICAgbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlDQo+ICsgICBtb2RpZnlpbmct
cGF0Y2hlcw0KPg0KPiAtVE9ET0xpc3Q6DQo+IC0NCj4gLS0gICBtb2RpZnlpbmctcGF0Y2hlcw0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5l
ci9tb2RpZnlpbmctcGF0Y2hlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti9tYWludGFpbmVyL21vZGlmeWluZy1wYXRjaGVzLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjZmM2JmNDkzNDQwYw0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvbW9kaWZ5
aW5nLXBhdGNoZXMucnN0DQo+IEBAIC0wLDAgKzEsNTEgQEANCj4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vbWFp
bnRhaW5lci9tb2RpZnlpbmctcGF0Y2hlcy5yc3QNCj4gKw0KPiArOuivkeiAhToNCj4gKw0KPiAr
IOWQtOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+ICsNCj4gKy4uIF9t
b2RpZnlpbmdwYXRjaGVzX3poOg0KPiArDQo+ICvkv67mlLnooaXkuIENCj4gKz09PT09PT09DQo+
ICsNCj4gK+WmguaenOS9oOaYr+WtkOezu+e7n+aIluiAheWIhuaUr+eahOe7tOaKpOiAhe+8jOeU
seS6juS7o+eggeWcqOS9oOeahOWSjOaPkOS6pOiAheeahOagkeS4reW5tuS4jeWujOWFqOebuOWQ
jO+8jA0KPiAr5pyJ5pe25L2g6ZyA6KaB56iN5b6u5L+u5pS55LiA5LiL5pS25Yiw55qE6KGl5LiB
5Lul5ZCI5bm25a6D5Lus44CCDQo+ICsNCj4gK+WmguaenOS9oOS4peagvOmBteWuiOW8gOWPkeiA
headpea6kOivgeS5pueahOinhOWIme+8iGPvvInvvIzkvaDlupTor6XopoHmsYLmj5DkuqTogIXp
h43lgZrvvIzkvYbov5nlrozlhajmmK/kvJoNCj4gK+mAguW+l+WFtuWPjeeahOaXtumXtOOAgeey
vuWKm+a1qui0ueOAguinhOWIme+8iGLvvInlhYHorrjkvaDosIPmlbTku6PnoIHvvIzkvYbov5nm
oLfkv67mlLnmj5DkuqTogIXnmoTku6PnoIHlubYNCj4gK+iuqeS7luiDjOS5puS9oOeahOmUmeiv
r+aYr+mdnuW4uOS4jeekvOiyjOeahOOAguS4uuino+WGs+atpOmXrumimO+8jOW7uuiuruWcqOS9
oOS5i+WJjeacgOWQjuS4gOS4qg0KPiArU2lnbmVkLW9mZi1ieeagh+etvuWSjOS9oOeahOS5i+mX
tOa3u+WKoOS4gOihjO+8jOS7peaMh+ekuuabtOaUueeahOaAp+i0qOOAgui/meayoeacieW8uuWI
tuaAp+imgeaxgu+8jOacgA0KPiAr5aW95Zyo5o+P6L+w5YmN6Z2i5Yqg5LiK5L2g55qE6YKu5Lu2
5ZKML+aIluWnk+WQje+8jOeUqOaWueaLrOWPt+aLrOS9j+aVtOihjO+8jOS7peaYjuaYvuaMh+WH
uuS9oOWvueacgOWQjuS4gOWIuw0KPiAr55qE5pu05pS56LSf6LSj44CC5L6L5aaCOjoNCj4gKw0K
PiArICAgICAgICBTaWduZWQtb2ZmLWJ5OiBSYW5kb20gSiBEZXZlbG9wZXIgPHJhbmRvbUBkZXZl
bG9wZXIuZXhhbXBsZS5vcmc+DQo+ICsgICAgICAgIFtsdWNreUBtYWludGFpbmVyLmV4YW1wbGUu
b3JnOiBzdHJ1Y3QgZm9vIG1vdmVkIGZyb20gZm9vLmMgdG8gZm9vLmhdDQo+ICsgICAgICAgIFNp
Z25lZC1vZmYtYnk6IEx1Y2t5IEsgTWFpbnRhaW5lciA8bHVja3lAbWFpbnRhaW5lci5leGFtcGxl
Lm9yZz4NCj4gKw0KPiAr5aaC5p6c5oKo57u05oqk552A5LiA5Liq56iz5a6a55qE5YiG5pSv77yM
5bm25biM5pyb5ZCM5pe25piO56Gu6LSh54yu44CB6Lef6Liq5pu05pS544CB5ZCI5bm25L+u5aSN
77yM5bm25L+d5oqkDQo+ICvmj5DkuqTogIXlhY3lj5fotKPpmr7vvIzov5nnp43lgZrms5XlsKTl
hbbmnInnlKjjgILor7fms6jmhI/vvIzlnKjku7vkvZXmg4XlhrXkuIvpg73kuI3lvpfmm7TmlLnk
vZzogIXnmoTouqvku70NCj4gK++8iEZyb23lpLTvvInvvIzlm6DkuLrlroPkvJrlnKjlj5jmm7Tm
l6Xlv5fkuK3mmL7npLrjgIINCj4gKw0KPiAr5Zue5Lyg77yIYmFjay1wb3J077yJ6ICF54m55Yir
6KaB5rOo5oSP77ya5Li65LqG5L6/5LqO6Lef6Liq77yM6K+35Zyo5o+Q5Lqk5raI5oGv55qE6aG2
6YOo77yI5bCx5Zyo5Li76aKY6KGMDQo+ICvkuYvlkI7vvInmj5LlhaXooaXkuIHnmoTmnaXmupDv
vIzov5nmmK/kuIDnp43luLjop4HogIzmnInnlKjnmoTlgZrms5XjgILkvovlpoLvvIzmiJHku6zl
j6/ku6XlnKgzLnjnqLPlrprniYjmnKwNCj4gK+S4reeci+WIsOS7peS4i+WGheWuuTo6DQo+ICsN
Cj4gKyAgICAgICAgRGF0ZTogICBUdWUgT2N0IDcgMDc6MjY6MzggMjAxNCAtMDQwMA0KPiArDQo+
ICsgICAgICAgIGxpYmF0YTogVW4tYnJlYWsgQVRBIGJsYWNrbGlzdA0KPiArDQo+ICsgICAgICAg
IGNvbW1pdCAxYzQwMjc5OTYwYmNkN2Q1MmRiZGYxZDQ2NmIyMGQyNGI5OTE3NmM4IHVwc3RyZWFt
Lg0KPiArDQo+ICvkuIvpnaLmmK/kuIDkuKrml6fnmoTlhoXmoLjlnKjmn5DooaXkuIHooqvlm57k
vKDlkI7kvJrlh7rnjrDnmoQ6Og0KPiArDQo+ICsgICAgICAgIERhdGU6ICAgVHVlIE1heSAxMyAy
MjoxMjoyNyAyMDA4ICswMjAwDQo+ICsNCj4gKyAgICAgICAgd2lyZWxlc3MsIGFpcm86IHdhaXRi
dXN5KCkgd29uJ3QgZGVsYXkNCj4gKw0KPiArICAgICAgICBbYmFja3BvcnQgb2YgMi42IGNvbW1p
dCBiN2FjYmRmYmQxZjI3N2MxZWIyM2YzNDRmODk5Y2ZhNGNkMGJmMzZhXQ0KPiArDQo+ICvkuI3n
rqHku4DkuYjmoLzlvI/vvIzov5nkupvkv6Hmga/pg73kuLrkurrku6zot5/ouKrkvaDnmoTmoJHv
vIzku6Xlj4ror5Xlm77op6PlhrPkvaDmoJHkuK3nmoTplJnor6/nmoTkurrmj5DkvpvkuoYNCj4g
K+acieS7t+WAvOeahOW4ruWKqeOAgg0KPiAtLQ0KPiAyLjIwLjENCj4NCg==
