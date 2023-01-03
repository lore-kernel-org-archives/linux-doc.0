Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25EDC54EBD
	for <linux-doc@archiver.kernel.org>; Tue,  3 Jan 2023 19:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbjACTJG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Jan 2023 14:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbjACTI6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jan 2023 14:08:58 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32C6E0DF
        for <linux-doc@vger.kernel.org>; Tue,  3 Jan 2023 11:08:57 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id j16so25309790qtv.4
        for <linux-doc@vger.kernel.org>; Tue, 03 Jan 2023 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfSqSd0mxRLyCP4JPwoGgPSv4V5DgFE+NWQibLY7nHY=;
        b=LQt5OMztUt6H+6pe/VIHwx3Jz4d08J1ZZ7gv40yLS2RfQ9FYAN2BdqaHFaDSeqruh5
         UdriUa0s5l2hHmuDgCVQyqdP1mZma/3SqbLGsgMr+3W5DNoGaGK3GwMdoJI3ZUgmswPc
         hfRjTsp+o7b/O9CFRqovudaZXidsusavosKQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfSqSd0mxRLyCP4JPwoGgPSv4V5DgFE+NWQibLY7nHY=;
        b=h5KWaDK0Ce4oIzlSPmDo18JtnpJT+H1OoIu9TP1HHMOb9iTcdLdYbFeg0OczANeg7K
         XDYoBnngbbNCjWUUIsh9T6eHOPYPTfw/oSm/xcgJofVIMbOXnoMi8iJV4hPq6YAGFuxJ
         V6a52c/rTzvgvtRYk8vc0jQ+pDPJ+4cGuwDERUQwqg6aIkDmNl9DfwaJHGH0d2l3c42V
         SY0jZNotKPrb89GgvnaPxUAXwHqtv6tW7v2Mzc+He+l/z3EsLPFpipfx67BJaT8/FP4F
         JRoUyExiokiG8ynYl+qrUlWMqM1AarF5WqYsfIN/kUgdJ5OWol6Rd/vPqTjWU1t3BZ+6
         Cdzg==
X-Gm-Message-State: AFqh2kqX5UQa5AMFnjxti8qanl0fP5bheQwNvoMlCf4S6vHB/iOKMqqC
        0T0zVuTd754z6Gqkqkf/7TuHsxjrspVHzsnr
X-Google-Smtp-Source: AMrXdXtBXwFgd7puGYtvGDp7Wp1q3LUQ4rPAKp2DKkv5YRLWJdLeWuOqxV4KjPgoUo05eV83D1k9gw==
X-Received: by 2002:ac8:65da:0:b0:3a8:84f:1d59 with SMTP id t26-20020ac865da000000b003a8084f1d59mr59582068qto.19.1672772936452;
        Tue, 03 Jan 2023 11:08:56 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6-20020ac85646000000b003a6947863e1sm18873398qtt.11.2023.01.03.11.08.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 11:08:56 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id c7so25286391qtw.8
        for <linux-doc@vger.kernel.org>; Tue, 03 Jan 2023 11:08:55 -0800 (PST)
X-Received: by 2002:a05:620a:1379:b0:6fc:c48b:8eab with SMTP id
 d25-20020a05620a137900b006fcc48b8eabmr1650146qkl.216.1672772925520; Tue, 03
 Jan 2023 11:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20221219153525.632521981@infradead.org> <20221219154119.550996611@infradead.org>
 <Y7Ri+Uij1GFkI/LB@osiris>
In-Reply-To: <Y7Ri+Uij1GFkI/LB@osiris>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 3 Jan 2023 11:08:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9nK825MyHXu7zkegc7Va+ZxcperdOtRMZBCLHqGrr=g@mail.gmail.com>
Message-ID: <CAHk-=wj9nK825MyHXu7zkegc7Va+ZxcperdOtRMZBCLHqGrr=g@mail.gmail.com>
Subject: Re: [RFC][PATCH 11/12] slub: Replace cmpxchg_double()
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, corbet@lwn.net,
        will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com,
        catalin.marinas@arm.com, dennis@kernel.org, tj@kernel.org,
        cl@linux.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        joro@8bytes.org, suravee.suthikulpanit@amd.com,
        robin.murphy@arm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org, iommu@lists.linux.dev,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 3, 2023 at 9:17 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Mon, Dec 19, 2022 at 04:35:36PM +0100, Peter Zijlstra wrote:
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  include/linux/slub_def.h |   12 ++-
> >  mm/slab.h                |   41 +++++++++++--
> >  mm/slub.c                |  146 ++++++++++++++++++++++++++++-------------------
> >  3 files changed, 135 insertions(+), 64 deletions(-)
>
> Does this actually work? Just wondering since I end up with an instant
> list corruption on s390. Might be endianness related, but I can't see
> anything obvious at a first glance.

I don't see anything that looks related to endianness, because while
there is that 128-bit union member, it's always either used in full,
or it's accessed as other union members.

But I *do* note that this patch seems to be the only one that depends
on the new this_cpu_cmpxchg() updates to make it just automatically do
the right thing for a 128-bit value. And I have to admit that all
those games with __pcpu_cast_128() make no sense to me. Why isn't it
just using "u128" everywhere without any odd _Generic() games?

I could also easily see that if the asm constraints are wrong (like
the "cast pointer to (unsigned long *) instead of keeping it pointing
to a 128-bit type" thing discussed earlier), then code like this:

+       freelist_aba_t old = { .freelist = freelist_old, .counter = tid };
+       freelist_aba_t new = { .freelist = freelist_new, .counter =
next_tid(tid) };
+
+       return this_cpu_cmpxchg(s->cpu_slab->freelist_tid.full,
+                               old.full, new.full) == old.full;

would easily make the compiler go "the second word of 'old' is never
used by the asm, so I won't initialize it".

But yeah, that patch is hard to read, so hard to say. Does everything
leading up to it work fine?

                 Linus
