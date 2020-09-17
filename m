Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB681C433E2
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A34C7221E7
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 09:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2R7ulBT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgIQJvf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 05:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgIQJve (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Sep 2020 05:51:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EACCC061756
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2020 02:51:33 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j2so1343844wrx.7
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2020 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1z0Dzoz+hRHyGT5fLUrVWCjo5PxPXHMObR+QlG59yhI=;
        b=G2R7ulBTU9c5dYXtC3MYccrDA+Ffcx8heJQxw6ZGWY0f4Jf/wKoCDPwFEJdPQjqJY7
         3hJgJ6hVTXPVmQENRP7Sd81Q78EXP1mZlytu3a3+Sdl1VZr7D5mqqfDcRbWRhKlZhjaM
         1/lUceDIrEzfG75yh9QwFu3x24GH6fu1csNQboGJ8TZc7Onv6MTafL682UNedHWLHoPb
         loIDKYpSlWYPPDFE6D0n89acqNQtqzDkJSfX3uDPdeO9OgG1J5VUGDLsei4BTMfN8UVW
         bBuNjg0zDtYDRoDh3jrGHaRvvAyW64d3s/v/NGlSIid8oAAthGBjywiebwB0Nbn4Xz17
         3udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1z0Dzoz+hRHyGT5fLUrVWCjo5PxPXHMObR+QlG59yhI=;
        b=AFZbfMpB6KCaUFV9x6nOpFfg7wmEdvNJyjRVtC7DxOzSSAst1+0ba7mRd+EO0EOPOp
         pzXI0kAA5125yzR1C3IHrnBzLX0VhkslzmETMJCX7qamFisxOtlPiIF+RdHHmW4rNCcN
         8rbDCOQm0OBn8KNIZbJxH9axrSMZ8Aj9dUoPiK3M/k6XW6r3nGK6oex+cJenIDcaXJKo
         msh0jXM/WkLz62IXkDPaTQOnHzSMSU2mp2on/O/xPEaGkEhJjBtKF7FVInjEJVW77Mbx
         wulEWbQimDPTR2f7J2uUOGbtjTE7CjsGlVjlZb4fjMVcNkdIxKFdy/rIRXFaGFGKOzTq
         k05w==
X-Gm-Message-State: AOAM532tWnYe2YI1C9uJRjBJ8QV/xvNh6hEn+D9h7KPlxt6m2GV1lZI/
        AwRFMgUcmL4+etW6ZSJX+d165xZnLZfD8fX+A9eE/A==
X-Google-Smtp-Source: ABdhPJxp3caZkciDO+kZlUmnf4BVgA4nM2LwzCMfmtO8IXe8l0MGsqh3S+LXbtGEI7UMy2c4M0H9WHgAwQUzzWRYWQQ=
X-Received: by 2002:adf:e312:: with SMTP id b18mr8525505wrj.372.1600336291198;
 Thu, 17 Sep 2020 02:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200915132046.3332537-1-elver@google.com> <20200915132046.3332537-6-elver@google.com>
 <alpine.DEB.2.22.394.2009170938030.1492@www.lameter.com>
In-Reply-To: <alpine.DEB.2.22.394.2009170938030.1492@www.lameter.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 17 Sep 2020 11:51:19 +0200
Message-ID: <CAG_fn=W1CqBgCqpYBNgYE7V+i4iqK4iyVydJyz7K4Zfc0zZvEw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mm, kfence: insert KFENCE hooks for SLUB
To:     Christopher Lameter <cl@linux.com>
Cc:     Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitriy Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan.Cameron@huawei.com, Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
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

On Thu, Sep 17, 2020 at 11:40 AM Christopher Lameter <cl@linux.com> wrote:
>
> On Tue, 15 Sep 2020, Marco Elver wrote:
>
> >  void *kmem_cache_alloc(struct kmem_cache *s, gfp_t gfpflags)
> >  {
> > -     void *ret =3D slab_alloc(s, gfpflags, _RET_IP_);
> > +     void *ret =3D slab_alloc(s, gfpflags, _RET_IP_, s->object_size);
>
> The additional size parameter is a part of a struct kmem_cache that is
> already passed to the function. Why does the parameter list need to be
> expanded?

See my response to the similar question about the SLAB allocator:
https://lore.kernel.org/linux-arm-kernel/CAG_fn=3DXMc8NPZPFtUE=3DrdoR=3DXJH=
4F+TxZs-w5n4VuaWKTjcasw@mail.gmail.com/



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
