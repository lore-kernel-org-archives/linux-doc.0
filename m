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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C07C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFEE16121E
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbhDGOrb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233599AbhDGOrb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 10:47:31 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC19AC061756
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 07:47:21 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id ay2so9462149plb.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1eo6YsO1h241ad2d5tDf0CxxcnB2bGfHBv3T0aCiOAo=;
        b=Nj4EB7+EN3/vxU55WMMVesgrSLYb3V0kSbCIqFpdw5yGx/yJkuRorWRq0rMnG/kexu
         fK3YDqMifK/Clzct525emhJvU0eRVFestgKph/aaJPAQS7JBr0yYmY+OV5QNGSszLjom
         CpTIma+WL9QnkoRNhQqTQ08vKrqMt55nn2JDvQJme+tofUJ4LxQKsK/CImQ6WtXOqv7A
         yWoEKv820ZnSnrAgGJj+PKZTndV2HK511zL+XHQaGHRAGED8lCd4oDkC/C6QNRCGkNh1
         yC1y8ueiUjuitFLUcz/1SX/I9JvEy96JoI4mv01P7+aYIbhJWtZD+hc0LfSDiRTkUPII
         v69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1eo6YsO1h241ad2d5tDf0CxxcnB2bGfHBv3T0aCiOAo=;
        b=FmvcieJpl1T814u7d+4iIdP47TdzvDovEI+dyHZyBWupsUbYDOms5gZSS3ImmTM4oh
         3AgSQt0KGDf4tn88TgZDvOgOV5RqxUuu2lvpedrZePJvpfruUmon5+mc5BEsXOmuzNr1
         NCNvi+28tZVpIP5+ZNE3idg0gY+t0pvtRNl4BiZ0gJuX7AQc6MqODR0BV2l+2HydIb3X
         Np5nRtAx61mS0YPVSMTn9tb0Nlq9bXoghOUp1LK//vcllpxp6Bi4ikNbBDTb25iOqhSq
         MKY38TXeCsqdgEsdfcHJ6pml1CXJXtnw8wKFtdHehy/Gg54ezYIaPv/klxiJC90+pTkX
         jnRg==
X-Gm-Message-State: AOAM5337YbQ6/ops64zm7NsytPZ41HWbHZLhvwLdkgJMRkrQoxbehoo0
        J7h4zZq8zFMdxzdcApkXC/Ne5o6cRUCIoNbI23HDyfkRUlzoHg==
X-Google-Smtp-Source: ABdhPJyE9dYauHmwiXykEXXa/e3Q121Ir2vbNgbIP6h/JBJnvAjB1GYyome/+VeB08oiguvKjijj8ikfQ9Gf9OEgVDI=
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id
 p16-20020a1709032490b02900e6faf586dfmr3126751plw.69.1617806841355; Wed, 07
 Apr 2021 07:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617699755.git.bobwxc@email.cn> <c2c2d12ac6b85a357ef76889bcb3797efbad1fd4.1617699755.git.bobwxc@email.cn>
 <CAMU9jJrhExJZyGKZFtSCdfTcT_E4LMznn5NMdSNHYe+na5e=Lg@mail.gmail.com> <20210407091805.GA2492@bobwxc.top>
In-Reply-To: <20210407091805.GA2492@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 7 Apr 2021 22:47:09 +0800
Message-ID: <CAMU9jJokdPkSAz-aDMEOxytjJVtyze3Ls8eqVkA39FyRdL+gPQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] docs/zh_CN: Add translation zh_CN/doc-guide/maintainer-profile.rst
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KV3UgWC5D
LiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiL5Y2INToxOOWG
memBk++8mg0KPg0KPiBPbiBXZWQsIEFwciAwNywgMjAyMSBhdCAwNDoyODoyNVBNICswODAwLCB0
ZW5nIHN0ZXJsaW5nIHdyb3RlOg0KPiA+IFd1IFhpYW5nQ2hlbmcgPGJvYnd4Y0BlbWFpbC5jbj4g
5LqOMjAyMeW5tDTmnIg35pel5ZGo5LiJIOS4i+WNiDM6NTHlhpnpgZPvvJoNCj4gPiA+DQo+ID4g
PiBBZGQgbmV3IHRyYW5zbGF0aW9uDQo+ID4gPiAgIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2RvYy1ndWlkZS9tYWludGFpbmVyLXByb2ZpbGUucnN0DQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPg0KPiA+ID4gLS0tDQo+
ID4gPiAgLi4uL3poX0NOL2RvYy1ndWlkZS9tYWludGFpbmVyLXByb2ZpbGUucnN0ICAgIHwgNDMg
KysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2RvYy1ndWlkZS9tYWludGFpbmVyLXByb2ZpbGUucnN0DQo+ID4gPg0KPiA+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9tYWlu
dGFpbmVyLXByb2ZpbGUucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9j
LWd1aWRlL21haW50YWluZXItcHJvZmlsZS5yc3QNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmUzZTEwMjg3YWVmMA0KPiA+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZG9jLWd1
aWRlL21haW50YWluZXItcHJvZmlsZS5yc3QNCj4gPiA+IEBAIC0wLDAgKzEsNDMgQEANCj4gPiA+
ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ID4gKw0KPiA+ID4gKy4u
IGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ID4gKw0KPiA+ID4gKzpPcmln
aW5hbDogRG9jdW1lbnRhdGlvbi9kb2MtZ3VpZGUvbWFpbnRhaW5lci1wcm9maWxlLnJzdA0KPiA+
ID4gKw0KPiA+ID4gKzror5HogIU6IOWQtOaDs+aIkCBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1h
aWwuY24+DQo+ID4gPiArDQo+ID4gPiAr5paH5qGj5a2Q57O757uf57u05oqk5Lq65ZGY5p2h55uu
5qaC6L+wDQo+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiArDQo+ID4g
PiAr5paH5qGj4oCc5a2Q57O757uf4oCd5piv5YaF5qC45paH5qGj5ZKM55u45YWz5Z+656GA6K6+
5pa955qE5Lit5b+D5Y2P6LCD54K544CC5a6D5ra155uW5LqGIERvY3VtZW50YXRpb24vIOS4iw0K
PiA+ID4gK+eahOaWh+S7tuWxgue6p++8iERvY3VtZW50YXRpb24vZGV2aWNldHJlZSDpmaTlpJbv
vInjgIFzY3JpcHRzLyDkuIvnmoTlkITnp43lrp7nlKjnqIvluo/vvIzlubbkuJQNCj4gPiA+ICvl
nKjmn5Dkupvmg4XlhrXkuIvnmoTkuZ/ljIXmi6wgTElDRU5TRVMvIOOAgg0KPiA+ID4gKw0KPiA+
ID4gK+S4jei/h+WAvOW+l+azqOaEj+eahOaYr++8jOi/meS4quWtkOezu+e7n+eahOi+ueeVjOav
lOmAmuW4uOabtOWKoOaooeeziuOAguiuuOWkmuWFtuS7luWtkOezu+e7n+e7tOaKpOS6uuWRmOmc
gOimgQ0KPiA+ID4gK+S/neaMgeWvuSBEb2N1bWVudGF0aW9uLyDmn5Dkupvpg6jliIbnmoTmjqfl
iLbvvIzku6Xkvr/kuo7lj6/ku6Xmm7Toh6rnlLHlnLDlgZrmm7TmlLnjgILpmaTmraTkuYvlpJbv
vIwNCj4gPiA+ICvorrjlpJrlhoXmoLjmlofmoaPpg73ku6VrZXJuZWwtZG9j5rOo6YeK55qE5b2i
5byP5Ye6546w5Zyo5rqQ5Luj56CB5Lit77yb6L+Z5Lqb5rOo6YeK6YCa5bi477yI5L2G5LiN5oC7
5piv77yJDQo+ID4gPiAr55Sx55u45YWz55qE5a2Q57O757uf57u05oqk5Lq65ZGY57u05oqk44CC
DQo+ID4gPiArDQo+ID4gPiAr5paH5qGj5a2Q57O757uf55qE6YKu5Lu25YiX6KGo5pivPGxpbnV4
LWRvY0B2Z2VyLmtlcm5lbC5vcmc+44CCDQo+ID4gPiAr6KGl5LiB5bqU5bC96YeP6ZKI5a+5ZG9j
cy1uZXh05qCR44CCDQo+ID4gPiArDQo+ID4gPiAr5o+Q5Lqk5qOA5p+l5Y2V6KGl6YGXDQo+ID4g
PiArLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiArDQo+ID4gPiAr5Zyo6L+b6KGM5paH5qGj5pu05pS5
5pe277yM5oKo5bqU5b2T5p6E5bu65paH5qGj5Lul5rWL6K+V77yM5bm256Gu5L+d5rKh5pyJ5byV
5YWl5paw55qE6ZSZ6K+v5oiW6K2m5ZGK44CC55Sf5oiQDQo+ID4gPiArSFRNTOaWh+aho+W5tuaf
peeci+e7k+aenOWwhuacieWKqeS6jumBv+WFjeWvueaWh+aho+a4suafk+e7k+aenOeahOS4jeW/
heimgeS6ieaJp+OAgg0KPiA+ID4gKw0KPiA+ID4gK+W8gOWPkeWRqOacn+eahOWFs+mUruiKgueC
uQ0KPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICsNCj4gPiA+ICvooaXkuIHlj6/k
u6Xpmo/ml7blj5HpgIHvvIzkvYblnKjlkIjlubbnqpflj6PmnJ/pl7TvvIzlk43lupTlsIbmr5Tp
gJrluLjmhaLjgILmlofmoaPmoJHlvoDlvoDlnKjlkIjlubbnqpflj6PmiZPlvIANCj4gPiA+ICvk
uYvliY3lhbPpl63lvpfmr5TovoPmmZrvvIzlm6DkuLrmlofmoaPooaXkuIHlr7zoh7Tlm57lvZLn
moTpo47pmanlvojlsI/jgIINCj4gPiDlm57lvZIgLT4g5Zue5ruaIG9yIOWbnumAgOaMh+mSiO+8
nw0KPg0KPiBUaGlzIGlzIGEgdGVybSBvZiBhIGtpbmQgb2Yga2VybmVsIGJ1Zy4NCj4gSSBoYXZl
IGRpc2N1c3NlZCB0aGlzIHdvcmQgd2l0aCBBbGV4IFNoaSBpbg0KPiA8aHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtZG9jLzIwMjEwMjIwMDkzMDA3LkdBMTc5ODdAbWlwYy8+DQo+DQo+IEZZ
SToNCj4gPiA+ID4gMjguDQo+ID4gPiA+IFJlZ3Jlc3Npb25zDQo+ID4gPiA+IC3lm57lvZINCj4g
PiA+ID4gK+WbnumAgA0KPiA+ID4gPiAgICAgIlJlZ3Jlc3Npb24iIGFzIGEgc29mdHdhcmUgdGVy
bSBjYW4gYmUgdHJhbnNsYXRlZCB0byAi5Zue5b2SIiwgYnV0ICLlm57lvZIiDQo+ID4gPiA+ICAg
ICBvZnRlbiByZWZlcnMgdG8gdGhlIG1hdGhlbWF0aWNhbCBuYW1lIG9yIGJlbG9uZ2luZyBzdGF0
ZSwgYW5kIHdlIGFsc28NCj4gPiA+ID4gICAgIHVzZSAi5Zue5b2S5rWL6K+VIiBhcyAicmVncmVz
c2lvbiB0ZXN0Ii4NCj4gPiA+ID4gICAgIEJlc2lkZXMsIHRoZXJlIGlzIGFsc28gInJvbGxiYWNr
IiBidXQgcm9sbGJhY2sgaXMgb2J2aW91c2x5IGRpZmZlcmVudA0KPiA+ID4gPiAgICAgZnJvbSBy
ZWdyZXNzaW9uLCBzbyB3ZSBjYW4ndCB1c2UgIuWbnua7miIuDQo+ID4gPiA+ICAgICBTbywgd2hp
Y2ggd29yZCBzaG91bGQgd2UgdXNlIHRvIHRyYW5zbGF0ZSB0aGUgcHJvcGVyIHRlcm0gZm9yIGtl
cm5lbA0KPiA+ID4gPiAgICAgZXJyb3IsICLlm57pgIAiIG9yIGp1c3QgdXNlICLlm57lvZIiID8N
Cj4gPiA+DQo+ID4gPiAncmVncmVzc2lvbicgaGVyZSBoYXMgc2FtZSBtZWFuaW5nZnVsIHdpdGgg
J3JlZ3Jlc3Npb24gdGVzdCcuIGJldHRlciBubyBjaGFuZ2UuDQo+ID4gT2suDQo+DQo+DQo+ID4g
PiArDQo+ID4gPiAr5a6h6ZiF6IqC5aWPDQo+ID4gPiArLS0tLS0tLS0tDQo+ID4gPiArDQo+ID4g
PiAr5oiR77yI6K+R5rOo77ya5oyHSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD7vvInm
mK/mlofmoaPlrZDns7vnu5/nmoTllK/kuIDnu7TmiqTogIXvvIzmiJHlnKgNCj4gPiA+ICvoh6rl
t7HnmoTml7bpl7Tph4zlrozmiJDov5npobnlt6XkvZzvvIzmiYDku6Xlr7nooaXkuIHnmoTlk43l
upTmnInml7bkvJrlvojmhaLjgILlvZPooaXkuIHooqvlkIjlubbml7bvvIjmiJblvZPmiJENCj4g
PiA+ICvlhrPlrprmi5Lnu53lkIjlubbooaXkuIHml7bvvInvvIzmiJHpg73kvJrlj5HpgIHpgJrn
n6XjgILlpoLmnpzmgqjlnKjlj5HpgIHooaXkuIHlkI7kuIDlkajlhoXmsqHmnInmlLbliLDlm57l
pI3vvIwNCj4gPiA+ICvor7fkuI3opoHnirnosavvvIzlj5HpgIHmj5DphpLlsLHlpb3jgIINCj4g
PiA+ICsNCj4gPiA+IC0tDQo+ID4gPiAyLjIwLjENCj4gPiA+DQo+ID4NCj4gPiBUaGFua3MNCj4g
Pg0KPiA+IFlhbnRlbmcNCj4NCg==
