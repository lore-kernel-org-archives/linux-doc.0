Return-Path: <SRS0=J8tN=EK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BDCC2D0A3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 15:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CBA02074F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 15:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4vUVRsl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730399AbgKDPRD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Nov 2020 10:17:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgKDPRC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Nov 2020 10:17:02 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01FEC0613D3
        for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2020 07:17:01 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s9so22426014wro.8
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2020 07:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3oz+jge3s+KLxPkjd9JJaeKDtMt4BIAKRrZrd3MFLg0=;
        b=H4vUVRslVGswQktW6uTlKz4ERUC7RF0H6BU61qylvAbEAF9gd3bft3mtlaPRXGvPXX
         foxhvpjekNSIn5xpv18qmgCbZGa2qJX4NkLO+XFyIt5IIJ54iq+mWbP448RHhfQkIR2Q
         opqQxhNzu/y44xFfEPnzXdmo12N/9WlKQ+7hZeKXG0i8ki1OperdYUhucZqgo/VFEKb+
         BWfaMz/ggp0YPke5eVHns+YjWZW/lhYoNh95CMcPZhzsNAxxJJOcF3PbgLk0vuqC8ySX
         UXThh30Q7yQtu19I7M/iW6LU9U7u6CV4bIqONIoA/g3d1eW1TOISqbf2ndQDKQDYIWyc
         QZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3oz+jge3s+KLxPkjd9JJaeKDtMt4BIAKRrZrd3MFLg0=;
        b=j1ThpxweHucewR/YdacSu/W81YZS1uPpZqBwgMxrB5SVrXqx91QiZd4eS3yM7KZT4i
         AMr/HR8JGMPqXd9QmAG71VWNE3BQGID+6MjFa5jiKVZHrO0n9OUN2hwqrm3k9jzGVJ+T
         WQ+KhysR3IpnTeu5pBhUomUoS1jEWOBwRwb7wUAxBkEQxlp4ogpvc8hWkej0rbHb5Wvu
         EDkDL9/0AwWGvnr9eBy4H/5S+0MdXax7ptSZrwdcIIR3Q5CtTeJTRQKRKu5vX3F6ZxWl
         H13dNICrFp2wOvGSw0DjzwCDtZBQH4mF/cDs6+dgb4lB01e7Ny0AZFPNbPKCbgQkUS7s
         H0pQ==
X-Gm-Message-State: AOAM5314kLUTFCH6lW2zmRSZ1hPUnyrx+oawuQHEglTeXp/FPYdQhJCK
        AcL1EF1GP1fbfi0aPtk6J1LuYXhfQJcT8qgpn02hvQ==
X-Google-Smtp-Source: ABdhPJyDgXGI/PJcCnAYlipgyUWtUpd2n0eMy2oUke7ZUq3ABr2ft1z4Yy2zt0k/xLyq/L7e1MvnVurfagWCQ2rLFmQ=
X-Received: by 2002:adf:e486:: with SMTP id i6mr32693599wrm.397.1604503020514;
 Wed, 04 Nov 2020 07:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20201103175841.3495947-1-elver@google.com> <20201103163103.109deb9d49a140032d67434f@linux-foundation.org>
 <CANpmjNM1HQ_TwqJ6Ad=Mr=oKVnud-qzD=-LhchPAouu1RDHLqw@mail.gmail.com>
In-Reply-To: <CANpmjNM1HQ_TwqJ6Ad=Mr=oKVnud-qzD=-LhchPAouu1RDHLqw@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Wed, 4 Nov 2020 16:16:49 +0100
Message-ID: <CAG_fn=UJJqPiVi-rfih0XTSQOqQ15Pn+c5Ecj-4QKyoT8pRqdA@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] KFENCE: A low-overhead sampling-based memory
 safety error detector
To:     Marco Elver <elver@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Jann Horn <jannh@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 4, 2020 at 1:36 PM Marco Elver <elver@google.com> wrote:
>
> On Wed, 4 Nov 2020 at 01:31, Andrew Morton <akpm@linux-foundation.org> wr=
ote:
> > On Tue,  3 Nov 2020 18:58:32 +0100 Marco Elver <elver@google.com> wrote=
:
> >
> > > This adds the Kernel Electric-Fence (KFENCE) infrastructure. KFENCE i=
s a
> > > low-overhead sampling-based memory safety error detector of heap
> > > use-after-free, invalid-free, and out-of-bounds access errors.  This
> > > series enables KFENCE for the x86 and arm64 architectures, and adds
> > > KFENCE hooks to the SLAB and SLUB allocators.
> > >
> > > KFENCE is designed to be enabled in production kernels, and has near
> > > zero performance overhead. Compared to KASAN, KFENCE trades performan=
ce
> > > for precision. The main motivation behind KFENCE's design, is that wi=
th
> > > enough total uptime KFENCE will detect bugs in code paths not typical=
ly
> > > exercised by non-production test workloads. One way to quickly achiev=
e a
> > > large enough total uptime is when the tool is deployed across a large
> > > fleet of machines.
> >
> > Has kfence detected any kernel bugs yet?  What is its track record?
>
> Not yet, but once we deploy in various production kernels, we expect
> to find new bugs (we'll report back with results once deployed).
> Especially in drivers or subsystems that syzkaller+KASAN can't touch,
> e.g. where real devices are required to get coverage. We expect to
> have first results on this within 3 months, and can start backports
> now that KFENCE for mainline is being finalized. This will likely also
> make it into Android, but deployment there will take much longer.
>
> The story is similar with the user space version of the tool
> (GWP-ASan), where results started to materialize once it was deployed
> across the fleet.
>
> > Will a kfence merge permit us to remove some other memory debugging
> > subsystem?  We seem to have rather a lot of them.
>
> Nothing obvious I think. KFENCE is unique in that it is meant for
> production fleets of machines (with ~zero overhead and no new HW
> features), with the caveat that due to it being sampling based, it's
> not so suitable for single machine testing. The other debugging tools
> are suitable for the latter, but not former.

Agreeing with everything Marco said I can only add that it would be
nice to have a separate discussion about the existing memory debugging
subsystems and the need to remove any of them.
Having many tools in a toolbox does not hurt, but we need to ensure
that all the tools in question are visible to the users (so that
people know when and how to use them), can find important bugs and do
not duplicate each other.


> Thanks,
> -- Marco



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
