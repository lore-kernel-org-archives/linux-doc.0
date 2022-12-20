Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD899C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 20 Dec 2022 14:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiLTOkG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Dec 2022 09:40:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233929AbiLTOkE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Dec 2022 09:40:04 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CB819295
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 06:40:03 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3c090251d59so171847777b3.4
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 06:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T/NCsYKC04yFcK1fgm0juUVbSixz96HJYgI6+8cFKck=;
        b=aW5RhtAsBkNvIR682pacJYjMBchjsl6CBpgm1GNt+MoU0xR7oZIbXklJVEhSA5imlQ
         5u50ol+9QlNXecXRFfrW9BlWpiEgwr54V46RQJ7vPMFVZN8nUM7UL5cjfEyDNsEd6TlT
         I+s90R9sBzg5F4fXqzDg5UVxzzA1ZnYyjdfck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/NCsYKC04yFcK1fgm0juUVbSixz96HJYgI6+8cFKck=;
        b=eW5nsB7ErywQcta1Qb5beDehKB/xQV1Wh0opgov+FQxpA+IVFnhn3CWII3+KWpDCfc
         oLuHE+2+n0H5pXWC/UoXhj2xcEBrevchSmJMxPVDNIziXxMZv9hHP8EUaGwhn2fIZ03k
         PaFMmMfM0MibSCi9GcHa6SRLIf9Wty5c3/ca4g15RYLf7mv92u7LvEWL/ifpXz+DKBdn
         v8HT+A7DDDaCSwYG2llpStIk6ezlnqwM5F3shYa+aQGCbycYDxANSzDNJO2ghMEv81pl
         oFkR7xZjraezo6RhSqXFCP6o4em5Z/suzjJeifTAjUleeRuTU01Tbtfhc1rIUWba11+8
         aZLA==
X-Gm-Message-State: ANoB5pkCw9gGkl6AzvGr1BV8QMo8jSJM7rd8zZLhUObFgZyvq1Rwk+WI
        gabDYyNY1NKdITUpFt/HJL+8Lhc55sd+ClQM
X-Google-Smtp-Source: AA0mqf56DR0xhOcJbHnxOei7U3c7z8ZJJ+OuDknUz63N0NVUUL1l6wwtp2bJbmME7MkeBWEM7tfFDQ==
X-Received: by 2002:a0d:ca17:0:b0:402:654d:63cf with SMTP id m23-20020a0dca17000000b00402654d63cfmr43393311ywd.29.1671547202928;
        Tue, 20 Dec 2022 06:40:02 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com. [209.85.160.177])
        by smtp.gmail.com with ESMTPSA id c144-20020ae9ed96000000b006fb11eee465sm8847991qkg.64.2022.12.20.06.40.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 06:40:02 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id h26so7206960qtu.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 06:40:02 -0800 (PST)
X-Received: by 2002:ac8:4988:0:b0:3a7:ef7b:6aa5 with SMTP id
 f8-20020ac84988000000b003a7ef7b6aa5mr8424356qtq.436.1671546695878; Tue, 20
 Dec 2022 06:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20221219153525.632521981@infradead.org> <20221219154119.154045458@infradead.org>
 <Y6DEfQXymYVgL3oJ@boqun-archlinux> <Y6GXoO4qmH9OIZ5Q@hirez.programming.kicks-ass.net>
In-Reply-To: <Y6GXoO4qmH9OIZ5Q@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 20 Dec 2022 08:31:19 -0600
X-Gmail-Original-Message-ID: <CAHk-=wi493ukLwziiqofe=WCSfUU8Qa+LK0mp_GrGWKV3NnTpQ@mail.gmail.com>
Message-ID: <CAHk-=wi493ukLwziiqofe=WCSfUU8Qa+LK0mp_GrGWKV3NnTpQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 05/12] arch: Introduce arch_{,try_}_cmpxchg128{,_local}()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, corbet@lwn.net, will@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, dennis@kernel.org,
        tj@kernel.org, cl@linux.com, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, Herbert Xu <herbert@gondor.apana.org.au>,
        davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, joro@8bytes.org, suravee.suthikulpanit@amd.com,
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

On Tue, Dec 20, 2022 at 5:09 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Dec 19, 2022 at 12:07:25PM -0800, Boqun Feng wrote:
> >
> > I wonder whether we should use "(*(u128 *)ptr)" instead of "(*(unsigned
> > long *) ptr)"? Because compilers may think only 64bit value pointed by
> > "ptr" gets modified, and they are allowed to do "useful" optimization.
>
> In this I've copied the existing cmpxchg_double() code; I'll have to let
> the arch folks speak here, I've no clue.

It does sound like the right thing to do. I doubt it ends up making a
difference in practice, but yes, the asm doesn't have a memory
clobber, so the input/output types should be the right ones for the
compiler to not possibly do something odd and cache the part that it
doesn't see as being accessed.

              Linus
