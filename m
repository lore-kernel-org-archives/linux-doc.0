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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE59C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAAC86139C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbhDGI2w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234447AbhDGI2w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 04:28:52 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E6FC06174A
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 01:28:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ep1-20020a17090ae641b029014d48811e37so898100pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 01:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKVhXXdVelUke93XrkiteYMFIGUwijvgTjfClqhiyN4=;
        b=U07amTl36WDftCG25Y7ZRiWvJT6GBW07IMxsSfV1mhFZ/0325SzTlibGApv7df/NoG
         FnV+b6pLb6/6TTDU8hXKOCPe+VNTik+vU7k7aj4Lsc9mlxRum0vB8TWCchbvLtJ8KTYz
         lVVk2QlmLAxoIeH7/mVjGUdPF90esWTmyoM3lCixFI/flwJGsHI5Oqv1MWtHTE3GW4ue
         gFphLkPuP9Z7DJNDH0VpnnU+bJFGt+JnlY8Abwd8+YU3D1LP4a2VlOapy5I3wEn377rN
         zQoroYTrAJKvzJoM1wrygri9Jd0ZyiTb/sf0jvyHEoEoNBEjEjl3D5dZJV+5jSZoonS0
         HBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKVhXXdVelUke93XrkiteYMFIGUwijvgTjfClqhiyN4=;
        b=djwwp4VenoJQOUXNgNZ6wnBhKL85YW5p1Apqb1GHOAcEu1BzPJRmTERNl0VorirqPs
         KW+3DPmEN07Kr9woQXGcEa+2DC1364gnn+JRDkEEiu+barYX6Jphd//AFzUy3ZrbFXM1
         EOm4auJ1eWtEOcpaVxix57T+5PTv/En6BSYqJi23hne1/ZXWn7SpeZHDigseboL3Kbxj
         B3oHoxMb1eSGCwpU6ICHXvLvDOkAQhXqDjlraFWtU3joMmi5gpchwxfePb+Z796iREIW
         4VtOBubrpEuL/onK9Z3wR17sjdSXHv1J8Z3KLA0rey6UXSxS99lH0hVS0D15PFeqjHCh
         cJAQ==
X-Gm-Message-State: AOAM5308MQInzdlAzXW5OF65FTsYAfXiJtKcdwHdz+2u5TUcVOjkYxEY
        qOBQIXartOBwob5cwb170ApSgl15hhR3Y7iipPY=
X-Google-Smtp-Source: ABdhPJxjGz3UTXc474GX9hkV1HGMBhUyTQr71AEuXBI0JdP6vhBg483+wHQl8YsnQmGwIaM1SVcZaBycj38v6HIe5Vw=
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id
 p16-20020a1709032490b02900e6faf586dfmr1901487plw.69.1617784116553; Wed, 07
 Apr 2021 01:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617699755.git.bobwxc@email.cn> <c2c2d12ac6b85a357ef76889bcb3797efbad1fd4.1617699755.git.bobwxc@email.cn>
In-Reply-To: <c2c2d12ac6b85a357ef76889bcb3797efbad1fd4.1617699755.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 7 Apr 2021 16:28:25 +0800
Message-ID: <CAMU9jJrhExJZyGKZFtSCdfTcT_E4LMznn5NMdSNHYe+na5e=Lg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg
5LiL5Y2IMzo1MeWGmemBk++8mg0KPg0KPiBBZGQgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9jLWd1aWRlL21haW50YWluZXItcHJvZmlsZS5y
c3QNCj4NCj4gU2lnbmVkLW9mZi1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0K
PiAtLS0NCj4gIC4uLi96aF9DTi9kb2MtZ3VpZGUvbWFpbnRhaW5lci1wcm9maWxlLnJzdCAgICB8
IDQzICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vZG9jLWd1aWRlL21haW50YWluZXItcHJvZmlsZS5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9tYWludGFpbmVyLXByb2Zp
bGUucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9jLWd1aWRlL21haW50
YWluZXItcHJvZmlsZS5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lM2UxMDI4N2FlZjANCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kb2MtZ3VpZGUvbWFpbnRhaW5lci1wcm9maWxlLnJzdA0K
PiBAQCAtMCwwICsxLDQzIEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KPiArDQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiAr
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS9tYWludGFpbmVyLXByb2ZpbGUucnN0
DQo+ICsNCj4gKzror5HogIU6IOWQtOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwu
Y24+DQo+ICsNCj4gK+aWh+aho+WtkOezu+e7n+e7tOaKpOS6uuWRmOadoeebruamgui/sA0KPiAr
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK+aWh+aho+KAnOWtkOezu+e7n+KA
neaYr+WGheaguOaWh+aho+WSjOebuOWFs+WfuuehgOiuvuaWveeahOS4reW/g+WNj+iwg+eCueOA
guWug+a2teebluS6hiBEb2N1bWVudGF0aW9uLyDkuIsNCj4gK+eahOaWh+S7tuWxgue6p++8iERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZSDpmaTlpJbvvInjgIFzY3JpcHRzLyDkuIvnmoTlkITnp43l
rp7nlKjnqIvluo/vvIzlubbkuJQNCj4gK+WcqOafkOS6m+aDheWGteS4i+eahOS5n+WMheaLrCBM
SUNFTlNFUy8g44CCDQo+ICsNCj4gK+S4jei/h+WAvOW+l+azqOaEj+eahOaYr++8jOi/meS4quWt
kOezu+e7n+eahOi+ueeVjOavlOmAmuW4uOabtOWKoOaooeeziuOAguiuuOWkmuWFtuS7luWtkOez
u+e7n+e7tOaKpOS6uuWRmOmcgOimgQ0KPiAr5L+d5oyB5a+5IERvY3VtZW50YXRpb24vIOafkOS6
m+mDqOWIhueahOaOp+WItu+8jOS7peS+v+S6juWPr+S7peabtOiHqueUseWcsOWBmuabtOaUueOA
gumZpOatpOS5i+Wklu+8jA0KPiAr6K645aSa5YaF5qC45paH5qGj6YO95Lula2VybmVsLWRvY+az
qOmHiueahOW9ouW8j+WHuueOsOWcqOa6kOS7o+eggeS4re+8m+i/meS6m+azqOmHiumAmuW4uO+8
iOS9huS4jeaAu+aYr++8iQ0KPiAr55Sx55u45YWz55qE5a2Q57O757uf57u05oqk5Lq65ZGY57u0
5oqk44CCDQo+ICsNCj4gK+aWh+aho+WtkOezu+e7n+eahOmCruS7tuWIl+ihqOaYrzxsaW51eC1k
b2NAdmdlci5rZXJuZWwub3JnPuOAgg0KPiAr6KGl5LiB5bqU5bC96YeP6ZKI5a+5ZG9jcy1uZXh0
5qCR44CCDQo+ICsNCj4gK+aPkOS6pOajgOafpeWNleihpemBlw0KPiArLS0tLS0tLS0tLS0tLS0t
DQo+ICsNCj4gK+WcqOi/m+ihjOaWh+aho+abtOaUueaXtu+8jOaCqOW6lOW9k+aehOW7uuaWh+ah
o+S7pea1i+ivle+8jOW5tuehruS/neayoeacieW8leWFpeaWsOeahOmUmeivr+aIluitpuWRiuOA
gueUn+aIkA0KPiArSFRNTOaWh+aho+W5tuafpeeci+e7k+aenOWwhuacieWKqeS6jumBv+WFjeWv
ueaWh+aho+a4suafk+e7k+aenOeahOS4jeW/heimgeS6ieaJp+OAgg0KPiArDQo+ICvlvIDlj5Hl
kajmnJ/nmoTlhbPplK7oioLngrkNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKw0KPiAr6KGl
5LiB5Y+v5Lul6ZqP5pe25Y+R6YCB77yM5L2G5Zyo5ZCI5bm256qX5Y+j5pyf6Ze077yM5ZON5bqU
5bCG5q+U6YCa5bi45oWi44CC5paH5qGj5qCR5b6A5b6A5Zyo5ZCI5bm256qX5Y+j5omT5byADQo+
ICvkuYvliY3lhbPpl63lvpfmr5TovoPmmZrvvIzlm6DkuLrmlofmoaPooaXkuIHlr7zoh7Tlm57l
vZLnmoTpo47pmanlvojlsI/jgIINCuWbnuW9kiAtPiDlm57mu5ogb3Ig5Zue6YCA5oyH6ZKI77yf
DQo+ICsNCj4gK+WuoemYheiKguWljw0KPiArLS0tLS0tLS0tDQo+ICsNCj4gK+aIke+8iOivkeaz
qO+8muaMh0pvbmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+77yJ5piv5paH5qGj5a2Q57O7
57uf55qE5ZSv5LiA57u05oqk6ICF77yM5oiR5ZyoDQo+ICvoh6rlt7HnmoTml7bpl7Tph4zlrozm
iJDov5npobnlt6XkvZzvvIzmiYDku6Xlr7nooaXkuIHnmoTlk43lupTmnInml7bkvJrlvojmhaLj
gILlvZPooaXkuIHooqvlkIjlubbml7bvvIjmiJblvZPmiJENCj4gK+WGs+WumuaLkue7neWQiOW5
tuihpeS4geaXtu+8ie+8jOaIkemDveS8muWPkemAgemAmuefpeOAguWmguaenOaCqOWcqOWPkemA
geihpeS4geWQjuS4gOWRqOWGheayoeacieaUtuWIsOWbnuWkje+8jA0KPiAr6K+35LiN6KaB54q5
6LGr77yM5Y+R6YCB5o+Q6YaS5bCx5aW944CCDQo+ICsNCj4gLS0NCj4gMi4yMC4xDQo+DQoNClRo
YW5rcw0KDQpZYW50ZW5nDQo=
