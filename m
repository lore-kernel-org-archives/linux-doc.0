Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF2CC761AF
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 22:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbjDCWO4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 18:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbjDCWOz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 18:14:55 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A49D3A86
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:14:51 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b20so123146537edd.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1680560090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz91yzAU2UAnIEGcuZAN2UBettORvR8cQ9bqohgSsk0=;
        b=ALO8Qn5xFvNz4rsPDF44hTiNkO4Evw9/Okujyehi/8Walss4GDxeTrJdXNumvKuXhX
         3CBxSkVdS2peJUdjMCOxgjtSf4ZEVha/oijhlDUGxD4AZOGLW57VjTbBG8Fk4rKq/BUq
         lZLLFG/4pGHPQ1Q5nFL0sv73HUS3Jz0QyOnmlK5XLMxoiq8xUOeBuFlw+yB6qCpI7iW2
         hOVu+4Lu7i0Pe6YDLMWw6rDMmsBUjPeIfCK/rhgQ8X2aRpd6VkI+sMxpONP151Lvyrmy
         v3xZTUTouhFktpwj5xqLsYJhnGaCMxP3Tmk+0djfL1qgJHj5auj0ppFrHyHxrCcnPZfA
         0VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680560090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pz91yzAU2UAnIEGcuZAN2UBettORvR8cQ9bqohgSsk0=;
        b=goSYZS/aQXGqyeeEcsS1ibHc/RAet05YTZG5wX+N7MNbiLrmpOyfCBRPFAKaUTbxTI
         dA4KmdudHW3IbNaaQpF2s2lCFTCNYMp8Kk5x5FoiJVxLsc0zjEV6/SO4AFxRVwwzbxJe
         EB0J3YOs8tfcxDmSWLXZemNplc2lSePy9a1KT/ZN1BR3agQDoexB2cqxKGEcSy78Kq7n
         9uzdf97zMlLxkPnsxWyYNjS1NLDcZoFpVo3SwGCjjluJJFyuYG0xOaCe99vOXSiz0UYw
         e5+t8RrXx/dEvTyr7zpVbFqH+Hut7rT3buX/gCw5WHWU4A5bMDLVxeqcxEqSWHtwq/ah
         xToA==
X-Gm-Message-State: AAQBX9caSxOlR++976+rzbCkhMWyK1wa+VhNT8QrV4+T76aDCwe5HnC8
        VbJc9Cn68zR4tlZVBlAkFCLVlGZdG6AWsPzStIZxnw==
X-Google-Smtp-Source: AKy350YmRv1iLngkX0mOxnDqYMEfEwwayOWjMkTvHV7B+sEUefsVnWdOIcoeTTZqAnBKtezbUNy00LAlmbCeogBuH3M=
X-Received: by 2002:a17:906:b55:b0:93f:82cb:fe44 with SMTP id
 v21-20020a1709060b5500b0093f82cbfe44mr114966ejg.11.1680560089996; Mon, 03 Apr
 2023 15:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230401200651.1022113-1-joe@isovalent.com> <ZCpMv1UHM1Vn+/ha@debian.me>
In-Reply-To: <ZCpMv1UHM1Vn+/ha@debian.me>
From:   Joe Stringer <joe@isovalent.com>
Date:   Mon, 3 Apr 2023 15:14:39 -0700
Message-ID: <CADa=RyzmpE-XwOan0B5s20yi58EbM2VUFZDSLaGJQ3nnWgzvWw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] docs/bpf: Add table to describe LRU properties
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ast@kernel.org, corbet@lwn.net,
        martin.lau@linux.dev, maxtram95@gmail.com, john.fastabend@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCA4OjQ54oCvUE0gQmFnYXMgU2FuamF5YSA8YmFnYXNkb3Rt
ZUBnbWFpbC5jb20+IHdyb3RlOg0KPg0KPiBPbiBTYXQsIEFwciAwMSwgMjAyMyBhdCAwMTowNjo1
MFBNIC0wNzAwLCBKb2UgU3RyaW5nZXIgd3JvdGU6DQo+ID4gKz09PT09PT09PT09PT09PT09PT09
PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQo+ID4gK0ZsYWcgICAgICAgICAgICAgICAgICAgICBgYEJQRl9NQVBfVFlQRV9MUlVf
SEFTSGBgIGBgQlBGX01BUF9UWVBFX0xSVV9QRVJDUFVfSEFTSGBgDQo+ID4gKz09PT09PT09PT09
PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+ID4gK2BgQlBGX0ZfTk9fQ09NTU9OX0xSVWBgICBQZXItQ1BVIExS
VSwgZ2xvYmFsIG1hcCAgIFBlci1DUFUgTFJVLCBwZXItY3B1IG1hcA0KPiA+ICtgYCFCUEZfRl9O
T19DT01NT05fTFJVYGAgR2xvYmFsIExSVSwgZ2xvYmFsIG1hcCAgICBHbG9iYWwgTFJVLCBwZXIt
Y3B1IG1hcA0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09
PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPg0KPiBUaGUgaGVhZGVy
IGNvbHVtbiBlbnRyaWVzIHNob3VsZCBhbHNvIGJlIGJvbGQgKGFzIGFib3ZlIGlzIHR3by13YXkN
Cj4gdGFibGUpLg0KDQpUaGV5IGxvb2sgYm9sZCB0byBtZSBhbHJlYWR5LCBkbyBJIG5lZWQgdG8g
dGFrZSBhbnkgYWN0aW9uIGhlcmU/DQo=
