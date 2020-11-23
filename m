Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956D6C2D0E4
	for <linux-doc@archiver.kernel.org>; Mon, 23 Nov 2020 19:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35A8620728
	for <linux-doc@archiver.kernel.org>; Mon, 23 Nov 2020 19:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ecz6nru9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731777AbgKWTR5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Nov 2020 14:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbgKWTR5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Nov 2020 14:17:57 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836D7C061A4D
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2020 11:17:56 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id gj5so24932389ejb.8
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2020 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdQbgY+fGm8jxB4Ao2qaLqB1m6FKX93p0ZpDSNmzhRg=;
        b=ecz6nru9/eO/okMaZi3M1SqeAWBy3jSLMgd0jjhCQTgpbarec4ajNZc2z34SiLaYXP
         QaJ9mapXUBOQPHDszmlLh7XP42arbTRfXumSHa93MXICjloDTusJOZUbBPLUWOXgbgKZ
         pQ9+nKsc1i6ipcAuXP0mxabxLfUkdI0xLURbCfbeS8wWY5rV7x0QYGWPjdqiSV52K55x
         r78U+tHwgUxkiwIykrn1oTB8ldikaa6SeVOhCeVlAv4TB8gcYfIO54wMnjufMeoPn641
         F1cxLMBeI9aeXeCsYDbEt+ePAmXOLWf4j+g0oiKvF1rdE0jaZD3q/81yQfnX86AGm3aN
         H+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdQbgY+fGm8jxB4Ao2qaLqB1m6FKX93p0ZpDSNmzhRg=;
        b=Uxs8fz+KbatpFZOhVydQCXw7juBrew3keDQzYynqnlY8fIywbL0u6QKAH31Xd5S4lz
         UTENji5V7r2PDMiWfJfWH+VAHOwVFKXttr3MJGJMNFKWVox/WBfqqSuPkDIi2eKHoaI4
         PDW0Hk8M5rwcrzNGTJSNHZte/f8oyrB+D5UpT6iipVXVFjAN6RhMizyh6ScNhZ/RbUt/
         IopqYqEdCHMPvYcfMJcjEP81E7a2guqQFARzyR/t1onOztPQ1WHeu6+am2ZmDc7cwSTu
         lkvXAgqmHtKqeRpEOCHA5LZsH8an+S7+FKuGekGRiOUMkTGG2Bbv7XNq14WmVMVT9IUk
         98Ew==
X-Gm-Message-State: AOAM532HvpdHyDtadcJWETR5yARM0xXh615xgar7yYjT6j0rhJGR/5EU
        FUvDBgILOHBo707IjenikCzwNINqWZzROyARcQlFTw==
X-Google-Smtp-Source: ABdhPJxls2+tu09Rb1v/Dt0hKt61j+cTOrCnH79IazHpSsNU2scVK5iT+mwhaQK0QUof4aS2TvFYL72oX+JQ5QIXnVs=
X-Received: by 2002:a17:906:c059:: with SMTP id bm25mr1009217ejb.20.1606159074807;
 Mon, 23 Nov 2020 11:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20201120030411.2690816-1-lokeshgidra@google.com>
 <20201120030411.2690816-2-lokeshgidra@google.com> <20201120153337.431dc36c1975507bb1e44596@linux-foundation.org>
In-Reply-To: <20201120153337.431dc36c1975507bb1e44596@linux-foundation.org>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Mon, 23 Nov 2020 11:17:43 -0800
Message-ID: <CA+EESO7xnnJAsPneuy1dNj6F47gViGiL-z8rajY5EoGdFWs+-A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Add UFFD_USER_MODE_ONLY
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-mm@kvack.kernel.org, Daniel Colascione <dancol@google.com>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 3:33 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 19 Nov 2020 19:04:10 -0800 Lokesh Gidra <lokeshgidra@google.com> wrote:
>
> > userfaultfd handles page faults from both user and kernel code.
> > Add a new UFFD_USER_MODE_ONLY flag for userfaultfd(2) that makes
> > the resulting userfaultfd object refuse to handle faults from kernel
> > mode, treating these faults as if SIGBUS were always raised, causing
> > the kernel code to fail with EFAULT.
> >
> > A future patch adds a knob allowing administrators to give some
> > processes the ability to create userfaultfd file objects only if they
> > pass UFFD_USER_MODE_ONLY, reducing the likelihood that these processes
> > will exploit userfaultfd's ability to delay kernel page faults to open
> > timing windows for future exploits.
>
> Can we assume that an update to the userfaultfd(2) manpage is in the
> works?
>
Yes, I'm working on it. Can the kernel version which will have these
patches be known now so that I can mention it in the manpage?

> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -405,6 +405,13 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
> >
> >       if (ctx->features & UFFD_FEATURE_SIGBUS)
> >               goto out;
> > +     if ((vmf->flags & FAULT_FLAG_USER) == 0 &&
> > +         ctx->flags & UFFD_USER_MODE_ONLY) {
> > +             printk_once(KERN_WARNING "uffd: Set unprivileged_userfaultfd "
> > +                     "sysctl knob to 1 if kernel faults must be handled "
> > +                     "without obtaining CAP_SYS_PTRACE capability\n");
> > +             goto out;
> > +     }
> >
> >       /*
> >        * If it's already released don't get it. This avoids to loop
> > @@ -1965,10 +1972,11 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
> >       BUG_ON(!current->mm);
> >
> >       /* Check the UFFD_* constants for consistency.  */
> > +     BUILD_BUG_ON(UFFD_USER_MODE_ONLY & UFFD_SHARED_FCNTL_FLAGS);
>
> Are we sure this is true for all architectures?

Yes, none of the architectures are using the least-significant bit for
O_CLOEXEC or O_NONBLOCK.
>
> >       BUILD_BUG_ON(UFFD_CLOEXEC != O_CLOEXEC);
> >       BUILD_BUG_ON(UFFD_NONBLOCK != O_NONBLOCK);
> >
> > -     if (flags & ~UFFD_SHARED_FCNTL_FLAGS)
> > +     if (flags & ~(UFFD_SHARED_FCNTL_FLAGS | UFFD_USER_MODE_ONLY))
> >               return -EINVAL;
> >
> >       ctx = kmem_cache_alloc(userfaultfd_ctx_cachep, GFP_KERNEL);
> > diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
> > index e7e98bde221f..5f2d88212f7c 100644
> > --- a/include/uapi/linux/userfaultfd.h
> > +++ b/include/uapi/linux/userfaultfd.h
> > @@ -257,4 +257,13 @@ struct uffdio_writeprotect {
> >       __u64 mode;
> >  };
> >
> > +/*
> > + * Flags for the userfaultfd(2) system call itself.
> > + */
> > +
> > +/*
> > + * Create a userfaultfd that can handle page faults only in user mode.
> > + */
> > +#define UFFD_USER_MODE_ONLY 1
> > +
> >  #endif /* _LINUX_USERFAULTFD_H */
>
> It would be nice to define this in include/linux/userfaultfd_k.h,
> alongside the other flags.  But I guess it has to be here because it's
> part of the userspace API.
