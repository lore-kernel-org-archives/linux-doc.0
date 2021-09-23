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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818FCC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 03:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57E2960E73
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 03:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239051AbhIWDyJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 23:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhIWDyJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 23:54:09 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBA8C061574
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 20:52:38 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id h129so6426320iof.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 20:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=19AxYAvQ6HcXgZfippgZkTcBtz0z0w5kiVOmD6pVg70=;
        b=JCy+viW76ujH20WIfk+1n+2oOiVsm5XcbUaiHHIUX/swJj/Hp3Kun0zmoIUnFUL01u
         BddZVQeVPGifU4pqjeDdhfHUg5l3BYC/g7wQJMil1LPfRXbcZOyNhqnB7ncz/GJOCbTC
         FJ5G+U8jBaTfs4mmr4XucOzZYr4VJLajjEDRHuYl18brNyLOp9Rvk/cWiYLoFJOU65id
         jXP+3hCl7d8wP2cOnu3HvAOhG484frsOCf94IQDBws6WE3ozQAk2tSc+FInabbUdEjJx
         Ma/gQEcS+QkMHEBhr9XxqiCO5GygnYoIt/Yq6Sy3RjXx1KbkIbP9z38cskBKy1W2isOe
         PMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=19AxYAvQ6HcXgZfippgZkTcBtz0z0w5kiVOmD6pVg70=;
        b=7fc5OgLQ9PSIBff3Sb+6rnnx5Op3wulXBsK2C97quyi7zAKfrhi39vAY+DT4M2n/Qc
         6zzKA17sRMFewsfFEC2X9oepPc6lgyW1KJc2vqL3Xxg9HmAycjAgyZTPpAhGLCxI7I/S
         MbokB1yR2n1N5htAUdO29OLwdvKZqtTLfdYdUh8IL/6zHn1/o2TVPFChcOrePtq7sB0a
         L2kpqBprtaBYh8sBt2Nd2fdOXOaGKb0fkRqj9KmtHO1n4egTwNOW85TYDb2PCMvY97Nm
         hfE1E+r4jf0FdmSae3PGs/8kbfGXg6U8ZaKVq17uGNMf3v6ieBdwel9a/rRs4nPOwa0/
         d02A==
X-Gm-Message-State: AOAM532RmjJm7gdzTpCjTVA3A1ErYpdlYk6nKZyLmiIO52NsKPXtan80
        ZJIPSpKezcpLXMl0Rsnfo2aeHkrVkJJLXyJ9i7mIt74D
X-Google-Smtp-Source: ABdhPJykqPXga8DVQum3xK0tQMxQTkR2+bJzqwfBjyrRbk4Z0qDVQhBrl+0Kw1aeuarwYrMTL1pn4f4TGDtdGIY/feA=
X-Received: by 2002:a05:6602:25d4:: with SMTP id d20mr2031226iop.135.1632369156851;
 Wed, 22 Sep 2021 20:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631605791.git.siyanteng@loongson.cn> <4a5927bd26e35b989520b4bb2c6a23a8431711be.1631605791.git.siyanteng@loongson.cn>
In-Reply-To: <4a5927bd26e35b989520b4bb2c6a23a8431711be.1631605791.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 23 Sep 2021 11:52:01 +0800
Message-ID: <CAJy-Ammk8gLjWwf-FO+LXotzos-Nhyf9rbqepL9_Ei235qy0QQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN: modify some words
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBTZXAgMTQsIDIwMjEgYXQgNDowMCBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBjb21taXQgbWVzc2FnZSBpbiBFbmdsaXNoLCB3ZSBiZXR0
ZXIgbm90IGdpdmUgdGhlIENoaW5lc2UgcmVhZGVycyBhIHdyb25nIGd1aWRhbmNlLg0KPg0KDQpS
ZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gU2lnbmVkLW9mZi1i
eTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAtLS0NCj4gIC4uLi90cmFu
c2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0ICAgICAgICAgfCA0
ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QNCj4gaW5kZXggNGZjNmQxNmY1MTk2
Li4zMjk2YjhmN2JlZGYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QNCj4g
QEAgLTEyNyw4ICsxMjcsOCBAQA0KPiAgVVJM5p2l5p+l5om+6KGl5LiB5o+P6L+w5bm25bCG5YW2
5pS+5YWl6KGl5LiB5Lit44CC5Lmf5bCx5piv6K+077yM6KGl5LiB77yI57O75YiX77yJ5Y+K5YW2
5o+P6L+w5bqU6K+l5piv54us56uL55qE44CCDQo+ICDov5nlr7nnu7TmiqTkurrlkZjlkozlrqHm
n6XkurrlkZjpg73mnInlpb3lpITjgILkuIDkupvor4TlrqHogIXlj6/og73nlJroh7PmsqHmnInm
lLbliLDooaXkuIHnmoTml6nmnJ/niYjmnKzjgIINCj4NCj4gLeaPj+i/sOS9oOWcqOWRveS7pOiv
reawlOS4reeahOWPmOWMlu+8jOS+i+WmguKAnG1ha2UgeHl6enkgZG8gZnJvdHrigJ3ogIzkuI3m
mK/igJxb6L+Z5Liq6KGl5LiBXW1ha2UNCj4gLXh5enp5IGRvIGZyb3R64oCd5oiW4oCcW+aIkV1j
aGFuZ2VkIHh5enp5IHRvIGRvIGZyb3R64oCd77yM5bCx5aW95YOP5L2g5Zyo5ZG95Luk5Luj56CB
5bqT5pS55Y+YDQo+ICvmj4/ov7DkvaDlnKjlkb3ku6Tor63msJTkuK3nmoTlj5jljJbvvIzkvovl
poLigJxtYWtlIHh5enp5IGRvIGZyb3R64oCd6ICM5LiN5piv4oCcW1RoaXMgcGF0Y2hdbWFrZQ0K
PiAreHl6enkgZG8gZnJvdHrigJ3miJbigJxbSV1jaGFuZ2VkIHh5enp5IHRvIGRvIGZyb3R64oCd
77yM5bCx5aW95YOP5L2g5Zyo5ZG95Luk5Luj56CB5bqT5pS55Y+YDQo+ICDlroPnmoTooYzkuLrk
uIDmoLfjgIINCj4NCj4gIOWmguaenOS/ruihpeeoi+W6j+S/ruWkjeS6huS4gOS4quiusOW9leea
hGJ1Z+adoeebru+8jOivt+aMiee8luWPt+WSjFVSTOW8leeUqOivpWJ1Z+adoeebruOAguWmguae
nOihpeS4geadpQ0KPiAtLQ0KPiAyLjI3LjANCj4NCg==
