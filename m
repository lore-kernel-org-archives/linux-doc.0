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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BB3C48BC2
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDE8F613A9
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFXBvI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 21:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFXBvI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 21:51:08 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA5C061574
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:48:48 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id a2so3356741pgi.6
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Urmej+dZsOeHyujhb20kmMmJnV+xuXWzi/7B/uJE2Ek=;
        b=W+51LAIrErU9XoYwdiCkbID5M60GxzJMj8U9RsxUokrcol2/decWzRNGsZuNWhGCBu
         QAYXujE7mv0TZC6n77DV0R/qqfE3jVA4+eJQiPisyRQMsi4qTVa6qVP/YftZ8sxm7GCB
         FEgnPaxK128xRTjcQBf3l7qoLpR8nMd/a8t56JQi2FM69UN9XTohNbgh2k1JfBEz1whf
         bap325upODp/5oJf7+AtwUS44L6neQnJFA0HEyCWRKfdfQ8hh2VJPE7ImZ3AEvFSuskT
         pxKiqP7qOtrlYOk1Qq12n3A7mMb1uLE/biwT0yY9zWAzd8wwzqzKai6dj05ey+6mIDrH
         kYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Urmej+dZsOeHyujhb20kmMmJnV+xuXWzi/7B/uJE2Ek=;
        b=njRg8YoQCKyayZqjLjbGtG0dVfmReOCIbJzXbylMVZm0PpYu1hmEK/HO9CNhs6AO9j
         xXyEkTaFwm99zag05GB1Nkjc/gtNrA4IjuzfJwoApTgY6h5EgwXqtvQyeG8O4eOCFZ0D
         798gezfVhr0IPOTyJrexnSTbSLIyJTwafIwzGvSwKVlW3SCQkJQOZaVaiYEZmDVjb47h
         /6dbqQqi2zqPx8Bjinihm/LVloBhLA37QgX30r9I3p84B987uwUnnyKLuGDF1j8+dn4J
         DeX6SRLdJ+CvmOADH3IuOvnBBKFRoXRo0D9ZKf/kAthUjB/HF78frtk/D4UJLv+bo9p7
         tUEg==
X-Gm-Message-State: AOAM530+To/J7/3f96widcTZznr62+vK8KpmOa4Urymb2YnAdIuYnJaT
        P84zhtsQK8xiXfJotheQkFXjXT/P1iPzOZBDbs8=
X-Google-Smtp-Source: ABdhPJxdybvbcyqTN6eyd75Py6CG290quLGwTLm3xtlqWJbmb8x4kOE1vHKPpgPuoqDJgl+QFVOGb9Ggf2SVuW9bbIM=
X-Received: by 2002:a65:44cc:: with SMTP id g12mr2287802pgs.227.1624499328552;
 Wed, 23 Jun 2021 18:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624434673.git.bobwxc@email.cn> <523e3940c5deca62145845a35f9028c0dd12fd43.1624434673.git.bobwxc@email.cn>
In-Reply-To: <523e3940c5deca62145845a35f9028c0dd12fd43.1624434673.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 24 Jun 2021 09:48:38 +0800
Message-ID: <CAMU9jJrL0SLkmFfrv93+r4Af3ngom_3DkeDWQob0XrGzbarZiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDIz5pel5ZGo5LiJ
IOS4i+WNiDc6MTTlhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+
IGFuZCBsaW5rIGl0IHRvIHpoX0NOL2FkbWluLWd1aWRlL2luZGV4LnJzdA0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQpSZXZpZXdlZC1ieTogWWFu
dGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KDQpUaGFua3MsDQoNCllhbnRlbmcNCj4g
LS0tDQo+ICAuLi4vemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0ICAgICAgICAgICAgfCA4
NiArKysrKysrKysrKysrKysrKysrDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1
aWRlL2luZGV4LnJzdCAgfCAgMiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+DQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmktc3R1
Yi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmkt
c3R1Yi5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5k
NjVmZjY1NDYwMTkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3QNCj4gQEAgLTAsMCArMSw4NiBA
QA0KPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmln
aW5hbDogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3QNCj4gKw0KPiArOuiv
keiAhToNCj4gKw0KPiArIOWQtOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+
DQo+ICsNCj4gKz09PT09PT09PQ0KPiArRUZJ5byV5a+85qGpDQo+ICs9PT09PT09PT0NCj4gKw0K
PiAr5ZyoeDg25ZKMQVJN5bmz5Y+w5LiK77yM5YaF5qC4ekltYWdlL2J6SW1hZ2Xlj6/ku6XkvKro
o4XmiJBQRS9DT0ZG5pig5YOP77yM5LuO6ICM5L2/RUZJ5Zu65Lu25Yqg6L29DQo+ICvnqIvluo/l
sIblhbbkvZzkuLpFRknlj6/miafooYzmlofku7bliqDovb3jgILkv67mlLliekltYWdl5aS05Lul
5Y+K5Zu65Lu25Yqg6L2956iL5bqP6Lez6L2s54m55a6a5YWl5Y+j54K555qEDQo+ICvku6PnoIHo
oqvnu5/np7DkuLrigJxFRknlvJXlr7zmoanvvIhFRkkgQm9vdCBTdHVi77yJ4oCd77yM5YiG5biD
5ZyoYXJjaC94ODYvYm9vdC9oZWFkZXIuU+WSjA0KPiArYXJjaC94ODYvYm9vdC9jb21wcmVzc2Vk
L2Vib290LmPkuK3jgILlr7nkuo5BUk3vvIxFRknmoanlnKhhcmNoL2FybS9ib290L2NvbXByZXNz
ZWQvZWZpLWhlYWRlci5TDQo+ICvlkoxhcmNoL2FybS9ib290L2NvbXByZXNzZWQvZWZpLXN0dWIu
Y+S4reWunueOsOOAguS9k+ezu+e7k+aehOS5i+mXtOWFseS6q+eahEVGSeahqeS7o+eggQ0KPiAr
5L2N5LqOZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1YuS4reOAgg0KPiArDQo+ICvogIxhcm02
NOS4jeaUr+aMgeWOi+e8qeWGheaguO+8jOWboOatpOaYoOWDj+acrOi6q+S8quijheaIkFBFL0NP
RkbmmKDlg4/vvIxFRknmoanpk77mjqXliLDlhoXmoLjjgIJhcm02NA0KPiArRUZJ5qGp5L2N5LqO
YXJjaC9hcm02NC9rZXJuZWwvRUZJIGVudHJ5LlPlkoxkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJz
dHViL2FybTY0LXN0dWIuYw0KPiAr5Lit44CCDQo+ICsNCj4gK+mAmui/h+S9v+eUqEVGSeW8leWv
vOahqe+8jOWPr+S7peWcqOS4jeS9v+eUqOS8oOe7n0VGSeW8leWvvOWKoOi9veeoi+W6j+eahOaD
heWGteS4i+W8leWvvExpbnV45YaF5qC477yMDQo+ICvlpoJncnVi5oiWZWxpbG/jgILnlLHkuo5F
RknlvJXlr7zmoanmiafooYzkuoblvJXlr7zliqDovb3nqIvluo/nmoTlt6XkvZzvvIzlm6DmraTm
n5Dnp43mhI/kuYnkuIrmnaXor7QNCj4gK+WugyAq5bCx5pivKiDlvJXlr7zliqDovb3nqIvluo/j
gIINCj4gKw0KPiArRUZJ5byV5a+85qGp6YCa6L+HQ09ORklHX0VGSV9TVFVC5YaF5qC46YCJ6aG5
5ZCv55So44CCDQo+ICsNCj4gKw0KPiAr5aaC5L2V5a6J6KOFYnpJbWFnZS5lZmkNCj4gKy0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr5L2N5LqOYXJjaC94ODYvYm9vdC9iekltYWdl5Lit55qE
YnpJbWFnZeW/hemhu+WkjeWItuWIsEVGSeezu+e7n+WIhuWMuu+8iEVTUO+8ieW5tuS/ruaUueaJ
qeWxleWQjQ0KPiAr5Li64oCcLmVmaeKAneOAguayoeacieaJqeWxleWQjeeahOivnUVGSeWbuuS7
tuWKoOi9veeoi+W6j+WwhuaLkue7neaJp+ihjOWug+OAguWwmuaXoOazleS7juaZrumAmueahExp
bnV45paH5Lu2DQo+ICvns7vnu5/kuK3miafooYxiekltYWdlLmVmae+8jOWboOS4ukVGSeWbuuS7
tuS4jeaUr+aMgei/meS6m+aWh+S7tuezu+e7n+OAgkFSTeW5s+WPsOmcgOimgeWwhmFyY2gvYXJt
L2Jvb3QvekltYWdlDQo+ICvlpI3liLbliLDns7vnu5/liIbljLrvvIzlubblj6/og73ml6DpnIDp
h43lkb3lkI3vvJthcm02NOS5n+exu+S8vO+8jOmcgOimgeWkjeWItmFyY2gvYXJtNjQvYm9vdC9J
bWFnZe+8jA0KPiAr5L2G5LiN5LiA5a6a6KaB6YeN5ZG95ZCN44CCDQo+ICsNCj4gKw0KPiAr5LuO
RUZJIHNoZWxs5Lyg6YCS5YaF5qC45Y+C5pWwDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiArDQo+ICvlhoXmoLjlj4LmlbDlj6/kuo5iekltYWdlLmVmaeS5i+WQjuS8oOmAku+8jOS+i+Wm
gjo6DQo+ICsNCj4gKyAgICAgICBmczA6PiBiekltYWdlLmVmaSBjb25zb2xlPXR0eVMwIHJvb3Q9
L2Rldi9zZGE0DQo+ICsNCj4gKw0KPiAr4oCcaW5pdHJkPeKAnemAiemhuQ0KPiArLS0tLS0tLS0t
LS0tLQ0KPiArDQo+ICvkuI7lpKflpJrmlbDlvJXlr7zliqDovb3nqIvluo/kuIDmoLfvvIxFRknm
oanlhYHorrjnlKjmiLfkvb/nlKjigJxpbml0cmQ94oCd6YCJ6aG55oyH5a6a5aSa5LiqaW5pdHJk
5paH5Lu244CCDQo+ICvov5nmmK/llK/kuIDnmoRFRknmoannibnmrornibnlkb3ku6TooYzlj4Lm
lbDvvIzlhbbku5bmiYDmnInlhoXlrrnpg73lnKjlsIblhoXmoLjlkK/liqjml7bkvKDpgJLnu5nl
hoXmoLjjgIINCj4gKw0KPiAraW5pdHJk5paH5Lu255qE6Lev5b6E5b+F6aG75Li65LuORVNQ5byA
5aeL55qE57ud5a+56Lev5b6E77yM55u45a+56Lev5b6E5peg5rOV5L2/55So44CC5ZCM5pe25q2k
6Lev5b6E5Li6RUZJDQo+ICvpo47moLzvvIznm67lvZXlhYPntKDlv4XpobvnlKjlj43mlpzmnaDv
vIhc77yJ5YiG6ZqU44CC5L6L5aaC57uZ5a6a5Lul5LiL55uu5b2V5biD5bGAOjoNCj4gKw0KPiAr
ICBmczA6Pg0KPiArICAgICAgIEtlcm5lbHNcDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJ6
SW1hZ2UuZWZpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGluaXRyZC1sYXJnZS5pbWcNCj4g
Kw0KPiArICAgICAgIFJhbWRpc2tzXA0KPiArICAgICAgICAgICAgICAgICAgICAgICBpbml0cmQt
c21hbGwuaW1nDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGluaXRyZC1tZWRpdW0uaW1nDQo+
ICsNCj4gK+eOsOW3peS9nOebruW9leS4umZzMDpcS2VybmVsc++8jOimgeS9v+eUqGluaXRyZC1s
YXJnZS5pbWfmlofku7blvJXlr7zvvIzliJnpobvkvb/nlKjku6XkuIvlkb3ku6Q6Og0KPiArDQo+
ICsgICAgICAgZnMwOlxLZXJuZWxzPiBiekltYWdlLmVmaSBpbml0cmQ9XEtlcm5lbHNcaW5pdHJk
LWxhcmdlLmltZw0KPiArDQo+ICvor7fms6jmhI9iekltYWdlLmVmaeaYr+aAjuagt+WPr+eUqOeb
uOWvuei3r+W+hOaMh+WumueahOOAgumCo+aYr+WboOS4uuaIkeS7rOaJp+ihjOeahOaYoOWDj+aY
r+eUsUVGSSBzaGVsbA0KPiAr6Kej6YeK55qE77yM5a6D5Y+v6Kej5p6Q55u45a+56Lev5b6E77yM
6ICM5ZG95Luk6KGM55qE5YW25L2Z6YOo5YiG5YiZ5Lyg6YCS57uZYnpJbWFnZS5lZmnjgIINCj4g
Kw0KPiArDQo+ICvigJxkdGI94oCd6YCJ6aG5DQo+ICstLS0tLS0tLS0tDQo+ICsNCj4gK+WvueS6
jkFSTeWSjGFybTY05L2T57O757uT5p6E77yM5b+F6aG75Li65YaF5qC45o+Q5L6b5LiA5Liq6K6+
5aSH5qCR44CC6YCa5bi45Zu65Lu25bqU6YCa6L+HRUZJIENPTkZJR1VSQVRJT04NCj4gK1RBQkxF
77yIRUZJ6YWN572u6KGo77yJ5p2l5pSv5oyB6K6+5aSH5qCR44CC5L2G5piv4oCcZHRiPeKAneWR
veS7pOihjOmAiemhueWPr+S7peeUqOS6juimhuebluWbuuS7tuaPkOS+m+eahOiuvuWkhw0KPiAr
5qCR77yM5oiW5Zyo5Zu65Lu25peg5rOV5o+Q5L6b5pe25p2l5o+Q5L6b5LiA5Liq6K6+5aSH5qCR
44CCDQo+ICsNCj4gK+ivt+azqOaEj++8muWbuuS7tuWwhuWcqOWQr+WKqOWGheaguOS5i+WJjeWw
hui/kOihjOaXtumFjee9ruS/oeaBr+a3u+WKoOWIsOiuvuWkh+agkeOAguWmguaenCBgYGR0Yj1g
YCDooqvnlKjmnaUNCj4gK+imhuebluiuvuWkh+agke+8jOWImeWbuuS7tuaPkOS+m+eahOS7u+S9
lei/kOihjOaXtuaVsOaNrumDveWwhuS4ouWkseOAgiBgYGR0Yj1gYCDpgInpobnlupTlj6rnlKjk
vZzosIPor5Xlt6XlhbfvvIwNCj4gK+aIluiAheWcqEVGSSBDT05GSUdVUkFUSU9OIFRBQkxF5Lit
5pyq5o+Q5L6b6K6+5aSH5qCR5pe25L2c5Li65pyA5ZCO55qE5omL5q6144CCDQo+ICsNCj4gK+KA
nGR0Yj3igJ3nmoTlpITnkIbmlrnlvI/kuI7kuIrov7DigJxpbml0cmQ94oCd6YCJ6aG555u45ZCM
44CCDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1p
bi1ndWlkZS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1p
bi1ndWlkZS9pbmRleC5yc3QNCj4gaW5kZXggNDYwMDM0Y2JjMmFiLi5kNzRmNWU4NjQ4OTggMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRl
L2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1p
bi1ndWlkZS9pbmRleC5yc3QNCj4gQEAgLTY1LDYgKzY1LDcgQEAgVG9kb2xpc3Q6DQo+DQo+ICAg
ICBjbGVhcmluZy13YXJuLW9uY2UNCj4gICAgIGNwdS1sb2FkDQo+ICsgICBlZmktc3R1Yg0KPiAg
ICAgbG9ja3VwLXdhdGNoZG9ncw0KPiAgICAgdW5pY29kZQ0KPg0KPiBAQCAtODcsNyArODgsNiBA
QCBUb2RvbGlzdDoNCj4gICAgIGRlbGxfcmJ1DQo+ICAgICBkZXZpY2UtbWFwcGVyL2luZGV4DQo+
ICAgICBlZGlkDQo+IC0gICBlZmktc3R1Yg0KPiAgICAgZXh0NA0KPiAgICAgbmZzL2luZGV4DQo+
ICAgICBncGlvL2luZGV4DQo+IC0tDQo+IDIuMjAuMQ0KPg0K
