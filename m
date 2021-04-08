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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F06C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 03:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0F0361186
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 03:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhDHDYN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 23:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhDHDYM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 23:24:12 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233E2C061760
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 20:24:01 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id l76so380371pga.6
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 20:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g5pZATMd+PsYZPgrtwu4HOGRJKHwiWRGPkCh5Lz8tsU=;
        b=DXEtOrFOE4aL00b1OJxN6d3+/mrr6isAtzZSWch6eL19lmkDRVmSq5ZYrTqAcX2frN
         hxKsTHUPZdhs3f57vfJHiLzd5Xzce/K/TrGuyiTdo1B7+8C2gPh7f53LlK66DUK5u1CB
         9jNS1mib2+YO4S4wx/oeHjkunoggBshFeCsO8JSrcz1RnHvj1FRpp1/p7e/QYy/5DCeN
         OzdhXAgCOq3TTiapmCgBNPokXwQ/2rFWH1bwDHv1fPEbpqtZ+10EZQzAvTLSN0VQF3GV
         aRoKQkfTNSB3SmTxb+lUdMBScM4BsBhfuzf1coZFewSoVmX269jLNUsUwCqEs+IpW9jk
         +r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g5pZATMd+PsYZPgrtwu4HOGRJKHwiWRGPkCh5Lz8tsU=;
        b=co9wUspe5dh9UiC8igBjvHAU+Xz0O4MJWajpahy7YEqdWFJrmyUFkdx63n7msRHTZ/
         za4iFF8npAtNgYoh0jDRYcAZXYiTBcFbSwIIGoJ9taNHMPRPkcRo0rKyY7ufpLqFm0Oa
         RnvfIcvqY4joCDIS77Q34rqUBJu7r0w/RydDTRIIuMAQ52v0fBaWdO0BDe4wOkeMhxXJ
         JmWYA7tpLtUU2S0tG0fchc46/ntrpYfmh43foFv4uXBRV+pyfSL2bp4Sl+uerLaPJ5G3
         0NywvTfWtj1To4I3iiwRqCwgvFmRedqjHaYI838NQE+D3GxvldAnniBPuKL5DePWf0vG
         DotQ==
X-Gm-Message-State: AOAM533gBlTzIQqyDmDKNo5eCWS0oEWPa585GHkFmmwj1x8Yu07RNfUE
        r/SvvfYo3h+ZZEEwFAeUW06CQinXinUqqY0a7io=
X-Google-Smtp-Source: ABdhPJwD3h1r5CswJ9nlwJEpAaMe2AmoZG57OAvN+Xwbk1NV3vONb8CTB9F37QY8/w7OGLiQW79W/eHEAyh1zpWedD4=
X-Received: by 2002:a65:4006:: with SMTP id f6mr6196596pgp.108.1617852240291;
 Wed, 07 Apr 2021 20:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617699755.git.bobwxc@email.cn> <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
 <CAMU9jJqkveD3rDgRG5Y3Oi2niU6Ji3XTm_ed84vy_j2TCGAAjg@mail.gmail.com>
 <20210407095454.GC2492@bobwxc.top> <CAMU9jJoKwVGuzjuNGNNg2pX=aV_b-xF8m+aB+mMhK1-inPTA6Q@mail.gmail.com>
 <20210407152216.GA13278@bobwxc.top>
In-Reply-To: <20210407152216.GA13278@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 8 Apr 2021 11:23:51 +0800
Message-ID: <CAMU9jJqhP8Y1=iRCJXubWd-6-7OUqETbUJ4wbd5WFG_WJvZDSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] docs/zh_CN: Add translation zh_CN/doc-guide/contributing.rst
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
LiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiL5Y2IMTE6MjLl
hpnpgZPvvJoNCj4NCj4gT24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMTE6MDA6MTBQTSArMDgwMCwg
dGVuZyBzdGVybGluZyB3cm90ZToNCj4gPiBXdSBYLkMuIDxib2J3eGNAZW1haWwuY24+IOS6jjIw
MjHlubQ05pyIN+aXpeWRqOS4iSDkuIvljYg1OjU15YaZ6YGT77yaDQo+ID4gPg0KPiA+ID4gT24g
V2VkLCBBcHIgMDcsIDIwMjEgYXQgMDU6MzA6MDNQTSArMDgwMCwgdGVuZyBzdGVybGluZyB3cm90
ZToNCj4gPiA+ID4gV3UgWGlhbmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOac
iDfml6XlkajkuIkg5LiL5Y2IMzo1MeWGmemBk++8mg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQWRk
IG5ldyB0cmFuc2xhdGlvbg0KPiA+ID4gPiA+ICAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vZG9jLWd1aWRlL2NvbnRyaWJ1dGluZy5yc3QNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFd1IFhpYW5nQ2hlbmcgPGJvYnd4Y0BlbWFpbC5jbj4NCj4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiAgLi4uL3poX0NOL2RvYy1ndWlkZS9jb250cmlidXRpbmcucnN0ICAgICAg
ICAgIHwgMjM4ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MjM4IGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RvYy1ndWlkZS9jb250cmlidXRpbmcucnN0DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vZG9jLWd1aWRlL2NvbnRyaWJ1dGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9kb2MtZ3VpZGUvY29udHJpYnV0aW5nLnJzdA0KPiBbLi4uXQ0KPiA+ID4gPiA+
ICvigJzkuIrlj6TigJ3mlofmoaMNCj4gPiA+ID4gPiArfn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICvkuIDkupvlhoXmoLjmlofmoaPmmK/mnIDmlrDnmoTjgIHo
oqvnu7TmiqTnmoTvvIzlubbkuJTpnZ7luLjmnInnlKjvvIzmnInkupvmlofku7bnoa7lubbpnZ7l
poLmraTjgILlsJjlsIHjgIHpmYjml6cNCj4gPiA+ID4gPiAr5ZKM5LiN5YeG56Gu55qE5paH5qGj
5Y+v6IO95Lya6K+v5a+86K+76ICF77yM5bm25a+55oiR5Lus55qE5pW05Liq5paH5qGj5Lqn55Sf
5oCA55aR44CC5Lu75L2V6Kej5Yaz6L+Z5Lqb6Zeu6aKY55qEDQo+ID4gPiA+ID4gK+S6i+aDhemD
veaYr+mdnuW4uOWPl+asoui/jueahOOAgg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAr5peg6K66
5L2V5pe25aSE55CG5paH5qGj77yM6K+36ICD6JmR5a6D5piv5ZCm5piv5pyA5paw55qE77yM5piv
5ZCm6ZyA6KaB5pu05paw77yM5oiW6ICF5piv5ZCm5bqU6K+l5a6M5YWo5Yig6Zmk44CCDQo+ID4g
PiA+ID4gK+aCqOWPr+S7peazqOaEj+S7peS4i+WHoOS4quitpuWRiuagh+W/l++8mg0KPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiArIC0g5a+5Mi545YaF5qC455qE5byV55SoDQo+ID4gPiA+ID4gKyAt
IOaMh+WQkVNvdXJjZUZvcmdl5a2Y5YKo5bqTDQo+ID4gPiA+ID4gKyAtIOWOhuWPsuiusOW9lemZ
pOS6huaLvOWGmemUmeivr+WVpeS5n+ayoeacieaMgee7reWHoOW5tA0KPiA+ID4gPiA+ICsgLSDo
rqjorrpHaXTkuYvliY3ml7bku6PnmoTlt6XkvZzmtYENCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
K+W9k+eEtu+8jOacgOWlveeahOWKnuazleaYr+abtOaWsOaWh+aho++8jOa3u+WKoOaJgOmcgOea
hOS7u+S9leS/oeaBr+OAgui/meagt+eahOW3peS9nOmAmuW4uOmcgOimgeeGn+aCieebuOWFsw0K
PiA+ID4gPiDpgJrluLjpnIDopoHkuI7nhp/mgonnm7gNCj4gPiA+ID4NCj4gPiA+IE5vcGUuDQo+
ID4gPg0KPiA+ID4g6L+Z5qC355qE5bel5L2c6YCa5bi46ZyA6KaBIC8g54af5oKJ55u45YWz5a2Q
57O757uf55qE5byA5Y+R5Lq65ZGYIC8g55qE5ZCI5L2c44CCDQo+ID4gTW9yZSB0aGFuIHR3byBw
ZW9wbGUgY2FuIOKAnOWQiOS9nOKAneOAgmhvdyBhYm91dCB0aGlzOg0KPiA+IOi/meagt+eahOW3
peS9nOmAmuW4uOmcgOimgeS4jueGn+aCieebuOWFs+WtkOezu+e7n+eahOW8gOWPkeS6uuWRmOea
hOWQiOS9nO+8nyBvcg0KPiA+IOi/meagt+eahOW3peS9nOmAmuW4uOmcgOimgeeGn+aCieebuOWF
s+WtkOezu+e7n+eahOW8gOWPkeS6uuWRmOS5i+mXtOeahOWQiOS9nO+8nw0KPg0KPiB1c2Ug6L+Z
5qC355qE5bel5L2c6YCa5bi46ZyA6KaB5LiO54af5oKJ55u45YWz5a2Q57O757uf55qE5byA5Y+R
5Lq65ZGY5ZCI5L2cDQo+DQo+ID4NCj4gPiA+DQo+ID4gPiA+ID4gK+WtkOezu+e7n+eahOW8gOWP
keS6uuWRmOeahOWQiOS9nOOAguW9k+acieS6uuWWhOaEj+WcsOivoumXruW8gOWPkeS6uuWRmO+8
jOW5tuWQrOWPluS7luS7rOeahOWbnuetlOeEtuWQjumHh+WPlg0KPiA+ID4gPiA+ICvooYzliqjm
l7bvvIzlvIDlj5HkurrlkZjpgJrluLjmm7TmhL/mhI/kuI7ov5nkupvoh7Tlipvkuo7mlLnov5vm
lofmoaPnmoTkurrlkZjlkIjkvZzjgIINCj4gPiA+ID4gPiArDQo+DQo+IFRoYW5rcyAhDQo+DQo+
IFd1IFguQy4NCj4NCg==
