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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE566C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 15 Aug 2021 06:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 901456103A
	for <linux-doc@archiver.kernel.org>; Sun, 15 Aug 2021 06:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhHOGRG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Aug 2021 02:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhHOGRF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Aug 2021 02:17:05 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5A0C061764
        for <linux-doc@vger.kernel.org>; Sat, 14 Aug 2021 23:16:36 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so17190691oth.7
        for <linux-doc@vger.kernel.org>; Sat, 14 Aug 2021 23:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n5muUAgCgamZ4dgWbB6ABR+qaAx5LaI0LbYc0Cs46E8=;
        b=XylPZV0dlmG+2zOjs8qT3EBgAe7XBXlbuIzdxF1WJdxFCauoEdLi5EQWibMJET2NiU
         fh7c7smVksLyoIiXBX2C2rym1ZojPNwM4Y4j9F1g+8PCSxeX5uaEcxkXXtM6Cko/lgvo
         24vqS54vbNJUFfWJzfpJ0CqGCAfzbJo3qh/TYgwlcs4hb0EYG6qBetOZns6Awk6LivY3
         rFYgvPpBFqWsxfVer5pTotO0A9XJwAb2Okqom5kbSkj/dIGGvTPOPW4UIyEBCvDWYvvs
         jpiDN32AFNr00TbJejUE1iOO7TEedwK3MMkCZ4OoeJ+EW5/rHo6+iMDnH0TbwgS3NoqS
         TvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n5muUAgCgamZ4dgWbB6ABR+qaAx5LaI0LbYc0Cs46E8=;
        b=VrEGGNCU/WTp/T9sTmj1i9qXlb8s+7C1qrKGNBH9XPM1rH2cx73oxX0oGF0g1REY9v
         FdyIo1uKnGhvFQQEsZbCWyi5Ryh8yOj22woyqV+dCyWpSs/ftdHof5+bTsDuBk7s3hgP
         tj8Hi5RJGJtXCcl7rKZWlIP9kewBSK+59A3nPgm6fsb78k1oGSmx/Wi/voSF/jwMTL/e
         bpaZgYA8EU6hIV86iQu9DZmzenIebVUee0Hlkjh98uOue96y7Ncbd3VkdHjvyWatw/Xn
         nqGBBpj1HJG1O4FjjUxCbXYWTpDOoEJmiek7X1GshBasdWjE5aleUlPxVDZJes4QoGDd
         Uy9g==
X-Gm-Message-State: AOAM532rFoP9POGD2iP6rSiMEODKKz0lW0hjeyz9s6lXQXkQZ9hF+RiF
        QL1YZm5NmccVcc+CEqEPcXo9Y18/obxB0sorKVc=
X-Google-Smtp-Source: ABdhPJx8amRC4Zm4vVdtSDjEtCtDGiAS42KQ9OrhmKUzZuRrpvBVljvVjK5uItcek2qLlNkhCre94bopp4mvLQEYVn0=
X-Received: by 2002:a9d:6d02:: with SMTP id o2mr3036069otp.302.1629008195676;
 Sat, 14 Aug 2021 23:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625795862.git.siyanteng@loongson.cn> <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
 <d67612cc-e396-25dd-bcc6-1129db8cf08d@flygoat.com>
In-Reply-To: <d67612cc-e396-25dd-bcc6-1129db8cf08d@flygoat.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sun, 15 Aug 2021 14:16:26 +0800
Message-ID: <CAEensMzF2F0za7QoYiv8MwpaVLRzptWcHzs4yUigsGNQSVbiJQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] docs/zh_CN: add core-api boot-time-mm translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPiDkuo4yMDIx5bm0OOaciDEx5pel
5ZGo5LiJIOS4i+WNiDg6MjTlhpnpgZPvvJoNCj4NCj4NCj4g5ZyoIDIwMjEvNy85IDEwOjU3LCBZ
YW50ZW5nIFNpIOWGmemBkzoNCj4gPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9i
b290LXRpbWUtbW0ucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiBSZXZpZXdlZC1ieTogQWxleCBT
aGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4gICAuLi4vemhfQ04vY29yZS1hcGkv
Ym9vdC10aW1lLW1tLnJzdCAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrDQo+ID4g
ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2luZGV4LnJzdCAgICAgfCAgMiArLQ0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
Y29yZS1hcGkvYm9vdC10aW1lLW1tLnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2Jvb3QtdGltZS1tbS5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9ib290LXRpbWUtbW0ucnN0DQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJhMjBkZmVk
MTAxNw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9jb3JlLWFwaS9ib290LXRpbWUtbW0ucnN0DQo+ID4gQEAgLTAsMCArMSw0OSBA
QA0KPiA+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiArDQo+ID4g
KzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9ib290LXRpbWUtbW0ucnN0DQo+ID4g
Kw0KPiA+ICs657+76K+ROg0KPiA+ICsNCj4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlh
bnRlbmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+ICs65qCh6K+ROg0KPiA+ICsNCj4gPiArIOaX
tuWljuS6rjxhbGV4c0BrZXJuZWwub3JnPg0KPiA+ICsNCj4gPiArLi4gX2NuX2NvcmUtYXBpX2Jv
b3QtdGltZS1tbToNCj4gPiArDQo+ID4gKz09PT09PT09PT09PT09PT0NCj4gPiAr5ZCv5Yqo5pe2
55qE5YaF5a2Y566h55CGDQo+ID4gKz09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gK+ezu+e7
n+WIneWni+WMluaXqeacn+S4jeiDveS9v+eUqOKAnOato+W4uOKAneeahOWGheWtmOeuoeeQhu+8
jOWPquaYr+WboOS4uuWug+i/mOayoeacieiiq+iuvue9ruWlveOAguS9huaYr+S7jQ0KPiA+ICvn
hLbpnIDopoHkuLrlkITnp43mlbDmja7nu5PmnoTliIbphY3lhoXlrZjvvIzkvovlpoLkuLrniann
kIbpobXliIbphY3lmajliIbphY3lhoXlrZjjgIINCj4NCj4g57O757uf5Yid5aeL5YyW5pep5pyf
4oCc5q2j5bi44oCd55qE5YaF5a2Y566h55CG55Sx5LqO5rKh5pyJ6K6+572u5a6M5q+V5peg5rOV
5L2/55So44CC5L2G5piv5YaF5qC45LuN54S26ZyA6KaB5Li65ZCE56eN5pWw5o2u57uT5p6E5YiG
6YWN5YaF5a2Y77yM5L6L5aaC54mp55CG6aG15YiG6YWN5Zmo44CCDQpPSyENCj4NCj4NCj4gPiAr
DQo+ID4gK+S4gOS4quWPq+WBmiBgYG1lbWJsb2NrYGAg55qE5LiT55So5YiG6YWN5Zmo5omn6KGM
5ZCv5Yqo5pe255qE5YaF5a2Y566h55CG44CC54m55a6a5p625p6E55qE5Yid5aeL5YyWDQo+ID4g
K+W/hemhu+WcqHNldHVwX2FyY2goKeS4reiuvue9ruWug++8jOW5tuWcqG1lbV9pbml0KCnlh73m
lbDkuK3np7vpmaTlroPjgIINCj4gPiArDQo+ID4gK+S4gOaXpuaXqeacn+eahOWGheWtmOeuoeeQ
huWPr+eUqO+8jOWug+WwseS4uuWGheWtmOWIhumFjeaPkOS+m+S6huWQhOenjeWHveaVsOWSjOWu
j+OAguWIhumFjeivt+axguWPr+S7peaMh+WQkQ0KPiA+ICvnrKzkuIDkuKrvvIjkuZ/lj6/og73m
mK/llK/kuIDnmoTvvInoioLngrnmiJZOVU1B57O757uf5Lit55qE5p+Q5Liq54m55a6a6IqC54K5
44CC5pyJ5LiA5LqbQVBJ5Y+Y5L2T5Zyo5YiGDQo+ID4gK+mFjeWksei0peaXtnBhbmlj77yM5Lmf
5pyJ5LiA5Lqb5LiNcGFuaWPnmoTjgIINCj4gXiDkuI3kvJpwYW5pY+OAgg0KT0shDQo+ID4gKw0K
PiA+ICtNZW1ibG9ja+i/mOaPkOS+m+S6huWQhOenjeaOp+WItuWFtuiHqui6q+ihjOS4uueahEFQ
SeOAgg0KPiA+ICsNCj4gPiArTWVtYmxvY2vmpoLov7ANCj4gPiArPT09PT09PT09PT09DQo+ID4g
Kw0KPiA+ICvor6VBUEnlnKjku6XkuIvlhoXmoLjku6PnoIHkuK06DQo+ID4gKw0KPiA+ICttbS9t
ZW1ibG9jay5jDQo+ID4gKw0KPiA+ICsNCj4gPiAr5Ye95pWw5ZKM57uT5p6E5L2TDQo+ID4gKz09
PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr5LiL6Z2i5piv5YWz5LqObWVtYmxvY2vmlbDmja7nu5Pm
noTjgIHlh73mlbDlkozlro/nmoTmj4/ov7DjgILlhbbkuK3kuIDkupvlrp7pmYXkuIrmmK/lhoXp
g6jvvIjlhoXogZTlh73mlbDms6jph4rvvIkNCj4gPiAr55qE77yM5L2G55Sx5LqO5a6D5Lus6KKr
6K6w5b2V5LiL5p2l77yM5ryP5o6J5a6D5Lus5piv5b6I5oSa6KCi55qE44CC5q2k5aSW77yM6ZiF
6K+75YaF6YOo5Ye95pWw55qE5rOo6YeK5Y+v5Lul5biu5Yqp55CGDQo+ID4gK+ino+W8leaTjueb
luS4i+ecn+ato+WPkeeUn+eahOS6i+aDheOAgg0KPg0KPiBJIHRoaW5rIGludGVybmFsIGhlcmUg
bWVhbnMgbm90IGZhY2luZyBtZW1ibG9jayB1c2Vycywg5YaF6IGU5Ye95pWw5rOo6YeKIHNlZW1z
DQo+IHdpcmVkLg0KT0shIHJlbW92ZSDvvIjlhoXogZTlh73mlbDms6jph4rvvIkNCg0KQnV0IEkg
c3RpbGwgdGhpbmsgaXQgbWVhbnMgY29tbWVudHMgaW4gdGhlIGNvZGUuICA6LSkNCg0KaG93IGFi
b3V0ICAiKOWcqOS7o+eggeS4reeahCki77yfDQoNClRoYW5rcywNCg0KWWFudGVuZw0K
