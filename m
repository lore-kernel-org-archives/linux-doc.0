Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AF0C56201
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE65C206CA
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 10:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFhtam6c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgJ3KAC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 06:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgJ3KAC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 06:00:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B31C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:00:01 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n15so5798103wrq.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1kpn8tL60J6jUZj6S/8IL9NPr/GsyMly5AdFbYCZgvQ=;
        b=MFhtam6cQr0WDVqRVGrFF0SN/MFXEP3V0VwTX6NBN3v8QKE/PkUDesI5KjDfTb11nE
         VLjuLyKy+4jexu+gDDYMvZFFFfuuM6NBAUGcLWCxuI1FrcpuzPgPObLxkPxElGCbB317
         ool+JyCmgDCjjBTr0Z3EBtSVbhAyTVIZEIsmsYo3IJSSHefYmRmht/pWnmFR1xFKk18F
         rfMZ766LyhVB8VINDPlu2ShTUZFS6dZcydX8V88LPiGT3nIGC7yvBIE43IkAmH8rfaRL
         RKiOnKFt/JODSXKArqagTnc4WnV/DHpLBBmzJOUxQO3XxnJ1fo80M/ZXJz8u8KqIKUA3
         T2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1kpn8tL60J6jUZj6S/8IL9NPr/GsyMly5AdFbYCZgvQ=;
        b=B+xI6LNMh6uLowcez0BHCw/qvc2ei6vYBnlKcw8sgGBJ0TYQK6UGz4EydbotO4LVHG
         KXGZxc+SxakftHLZIMdRADGvYJYmO4E4jQqCZ0+kM8HDwf7Zz7Lr9Xr3L0S3mRQFaPV0
         BNlNbrk7bt0gerHhv0YmAdFxRziLtAVDCWA10VpchMIi8mW3REXVUeGp7AJECjBu6lSQ
         ZOaYUbNMScgB8CMXaO3u3BYllGT7rf7YYecONYN955aL/dKsTpk4sVnC+Ge8FiZ2JmAk
         Hm0toANs/M0gAqgIWyaJYAUO1/YdQsRnDWnWtcbLrv8/0Tx5QHl5G0NJ+ubaztw7ePtO
         HJ3Q==
X-Gm-Message-State: AOAM530GOeJL8yZNaV/CY8THVi4pNRG7gwZnGcpvGHUcHH0FZQLgYGwd
        TYYx6v/sc/3Xis4HPwyoJVuCqxpe5SIJW7KPK+vRyg==
X-Google-Smtp-Source: ABdhPJx2AapdVpzESp7l+9ioty7xKcHGb/WVGuWkjUItyCyA6sKR7NX97R6xtF97EzRWcSdTxjQ9t3NI3ksYCtk7guU=
X-Received: by 2002:adf:ea49:: with SMTP id j9mr2008573wrn.391.1604051999974;
 Fri, 30 Oct 2020 02:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201029131649.182037-1-elver@google.com> <20201029131649.182037-8-elver@google.com>
 <CAG48ez2ak7mWSSJJ3Zxd+cK1c5uZVqeF2zZ9HLtmXEoiG5=m-Q@mail.gmail.com>
In-Reply-To: <CAG48ez2ak7mWSSJJ3Zxd+cK1c5uZVqeF2zZ9HLtmXEoiG5=m-Q@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Fri, 30 Oct 2020 10:59:48 +0100
Message-ID: <CAG_fn=Xq+E5s_2rVBm-cM4Bvfyn9Ar9fTHWtxeFFZkcAUBwHiQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] kfence, Documentation: add KFENCE documentation
To:     Jann Horn <jannh@google.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, joern@purestorage.com,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 30, 2020 at 3:50 AM Jann Horn <jannh@google.com> wrote:
>
> On Thu, Oct 29, 2020 at 2:17 PM Marco Elver <elver@google.com> wrote:
> > Add KFENCE documentation in dev-tools/kfence.rst, and add to index.
> [...]
> > +The KFENCE memory pool is of fixed size, and if the pool is exhausted,=
 no
> > +further KFENCE allocations occur. With ``CONFIG_KFENCE_NUM_OBJECTS`` (=
default
> > +255), the number of available guarded objects can be controlled. Each =
object
> > +requires 2 pages, one for the object itself and the other one used as =
a guard
> > +page; object pages are interleaved with guard pages, and every object =
page is
> > +therefore surrounded by two guard pages.
> > +
> > +The total memory dedicated to the KFENCE memory pool can be computed a=
s::
> > +
> > +    ( #objects + 1 ) * 2 * PAGE_SIZE
>
> Plus memory overhead from shattered hugepages. With the default object
> count, on x86, we allocate 2MiB of memory pool, but if we have to
> shatter a 2MiB hugepage for that, we may cause the allocation of one
> extra page table, or 4KiB. Of course that's pretty much negligible.
> But on arm64 it's worse, because there we have to disable hugepages in
> the linear map completely. So on a device with 4GiB memory, we might
> end up with something on the order of 4GiB/2MiB * 0x1000 bytes =3D 8MiB
> of extra L1 page tables that wouldn't have been needed otherwise -
> significantly more than the default memory pool size.

Note that with CONFIG_RODATA_FULL_DEFAULT_ENABLED (which is on by
default now) these hugepages are already disabled (see patch 3/9)

> If the memory overhead is documented, this detail should probably be
> documented, too.

But, yes, documenting that also makes sense.

> > +Using the default config, and assuming a page size of 4 KiB, results i=
n
> > +dedicating 2 MiB to the KFENCE memory pool.
> [...]
> > +For such errors, the address where the corruption as well as the inval=
idly
>
> nit: "the address where the corruption occurred" or "the address of
> the corruption"
>
> > +written bytes (offset from the address) are shown; in this representat=
ion, '.'
> > +denote untouched bytes. In the example above ``0xac`` is the value wri=
tten to
> > +the invalid address at offset 0, and the remaining '.' denote that no =
following
> > +bytes have been touched. Note that, real values are only shown for
> > +``CONFIG_DEBUG_KERNEL=3Dy`` builds; to avoid information disclosure fo=
r non-debug
> > +builds, '!' is used instead to denote invalidly written bytes.
> [...]
> > +KFENCE objects each reside on a dedicated page, at either the left or =
right
> > +page boundaries selected at random. The pages to the left and right of=
 the
> > +object page are "guard pages", whose attributes are changed to a prote=
cted
> > +state, and cause page faults on any attempted access. Such page faults=
 are then
> > +intercepted by KFENCE, which handles the fault gracefully by reporting=
 an
> > +out-of-bounds access.
>
> ... and marking the page as accessible so that the faulting code can
> continue (wrongly) executing.
>
>
> [...]
> > +Interface
> > +---------
> > +
> > +The following describes the functions which are used by allocators as =
well page
>
> nit: "as well as"?
>
>
>
> > +handling code to set up and deal with KFENCE allocations.



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
