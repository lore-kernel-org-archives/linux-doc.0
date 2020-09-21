Return-Path: <SRS0=TOdD=C6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A52C43465
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 14:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C88C21D91
	for <linux-doc@archiver.kernel.org>; Mon, 21 Sep 2020 14:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pihm+3yZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgIUO6a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Sep 2020 10:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgIUO63 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Sep 2020 10:58:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F205C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 07:58:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q9so12451566wmj.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2020 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J02fUfHHsGOzjhQyl/tGfPUtfr9BJPAQxULq+u6ZRXM=;
        b=pihm+3yZMKHKcYdASAww1rGEr2Dxntu4UArY54j2rSj/+nD8st9ACxliUmFGSoTDpl
         SYW62IX43tVBiVLsps+pLlr7PiVubwfDVu+sMPAAohuq9lp51Wt+ZKPdFLEW5q1jOV8c
         gHEiTzelfZRUecETp856lFG5KxFqbnWRRKGCMMVYJZjouqjBSXhYGnFaCZFWXgSa1LUb
         ai9mNZxna9283GvRyEzueoFeoB+ZRgjB5RX5cuh1j9wmW0tjAud9Zcy8sSSNEi8Xb2ng
         Z3Tf5sz8f37TbIMVt9ldV5IFpSNNDZPcFzAk2iQT9uFSoB6+wMOCyrSDB5nuhmuIbtdW
         L2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J02fUfHHsGOzjhQyl/tGfPUtfr9BJPAQxULq+u6ZRXM=;
        b=H7k4ZuK/7sRZ1ncrFqq620LZNEFYLRxtvww2SZj3KQhRHRnDjoIoe9ECspXh6hooOU
         139cxFAfxcR/U5N2fo9a3K/37+rLmSy0fMWKOBJvV2xJC+Y9fZWa4FGdwot2QzKgqYrQ
         8YLO98vYVpCJhm+UcYVmBNWN+WpiJyYjFVEtGfsUl77yVEkgeX1k81yC4kzisZ6g3qgk
         iVVa3jpvxeoY5t+haoCV80jW2mO9jySpI5Qcj72wkVV7yEObB0Xdm1G+Gcv9ydgQ9xeO
         unupOVs/18KvU4gbYk/vrnw9b6zGVa9R1iJ7p9Z+IjB9Zj+XvM3HJnypATm3CWR0Tog9
         yKow==
X-Gm-Message-State: AOAM533GPitKe4KbqMN0kYB9nVBHaPjHe7cQ5EEhAVZxrheS1EsyIwBI
        WeK6HQRBPhd32fCXdY0QzXFjsGwA2RWGt/jzr3xIAg==
X-Google-Smtp-Source: ABdhPJz9PSmNZXFkAIl8F7mMeI1IkMs29iiL7Fx77FGziAuV1SJmSBTtJ48EjMLqI0Oj5jqQ4/LlPfa8EPlyupGmeWM=
X-Received: by 2002:a7b:c210:: with SMTP id x16mr47411wmi.37.1600700307697;
 Mon, 21 Sep 2020 07:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200921132611.1700350-1-elver@google.com> <20200921132611.1700350-4-elver@google.com>
 <20200921143059.GO2139@willie-the-truck>
In-Reply-To: <20200921143059.GO2139@willie-the-truck>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 21 Sep 2020 16:58:16 +0200
Message-ID: <CAG_fn=WKaY9MVmbpkgoN4vaJYD_T_A3z2Lgqn+2o8-irmCKywg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] arm64, kfence: enable KFENCE for ARM64
To:     Will Deacon <will@kernel.org>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, sjpark@amazon.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
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

On Mon, Sep 21, 2020 at 4:31 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Sep 21, 2020 at 03:26:04PM +0200, Marco Elver wrote:
> > Add architecture specific implementation details for KFENCE and enable
> > KFENCE for the arm64 architecture. In particular, this implements the
> > required interface in <asm/kfence.h>. Currently, the arm64 version does
> > not yet use a statically allocated memory pool, at the cost of a pointe=
r
> > load for each is_kfence_address().
> >
> > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > Co-developed-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > For ARM64, we would like to solicit feedback on what the best option is
> > to obtain a constant address for __kfence_pool. One option is to declar=
e
> > a memory range in the memory layout to be dedicated to KFENCE (like is
> > done for KASAN), however, it is unclear if this is the best available
> > option. We would like to avoid touching the memory layout.
>
> Sorry for the delay on this.

NP, thanks for looking!

> Given that the pool is relatively small (i.e. when compared with our virt=
ual
> address space), dedicating an area of virtual space sounds like it makes
> the most sense here. How early do you need it to be available?

Yes, having a dedicated address sounds good.
We're inserting kfence_init() into start_kernel() after timekeeping_init().
So way after mm_init(), if that matters.

> An alternative approach would be to patch in the address at runtime, with
> something like a static key to swizzle off the direct __kfence_pool load
> once we're up and running.

IIUC there's no such thing as address patching in the kernel at the
moment, at least static keys work differently?
I am not sure how much we need to randomize this address range (we
don't on x86 anyway).

> Will
>
> --
> You received this message because you are subscribed to the Google Groups=
 "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kasan-dev/20200921143059.GO2139%40willie-the-truck.



--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
