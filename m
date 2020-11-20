Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AFDC388F9
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:09:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19A8322282
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BlMJXUOr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgKTDJr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 22:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgKTDJr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 22:09:47 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2641FC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:09:47 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id f20so10886592ejz.4
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHaBikdORLgIWL2Zcc+GTT7BbTPgBYlKWDmbyDdvnI0=;
        b=BlMJXUOrMkE8p1dWkSA6E9qAZQAPL7vNYFrLTslEl0CJ6Tk5TIEsqYITg83d96s/zP
         Gn68dv0zAK/lYizr1/20RvnZ4ZrKPLNxWzZNgiIqGzbOPUKd/TSif/KO4B+fKTy5o9zO
         +N06jKbNsJzav1XU/O3kcsWYleXjdIcIckDilyv44CTt6GxudNElOH4rQFC2D+YPuzmk
         SMJ7WFpSIzX8I4th8i+uqUkyRjLXmxVhlVpJnF786qLWQ3hhCtP6YVwZmoR/KpQPhw46
         aHrCDm9+1u9Qz8gitoX9eR/5aw7h7yqbvEKXp5AgTV3oRjV2nq1o7MMTOaSq75sGn4k2
         NTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHaBikdORLgIWL2Zcc+GTT7BbTPgBYlKWDmbyDdvnI0=;
        b=LJFdPZ6qH9ASnMS3Qd9fYks0pf7S5BPKnAF0KTFbSGc9jGwdYXM677MBFp7LlXgEP/
         KP2uzigQNk4dv7P1rnPKcj0bAwvgUbPMVmk9dXcVkSgnZ7o9EKIU9cyOXD5zXHs0PYnF
         leQQVJdVVbN0fBejJPCsHudJqg03FTPAQHtt0hx9higuZUursaEXwj1rNfozDBPdFKxn
         ARAnc4T94H/DPkpEEXVpd3Zb1S6/TlLGrUVdp9G+ztL7PKyRbZ8vTIajBjtbeOYMfmue
         kDMb5mKou+wKUp6e8TCWYEzL1r4SHxutpK2TZ/ugzzWhgbHgZ9XcQXYTgoQXYYK+yasi
         Pr5A==
X-Gm-Message-State: AOAM532dM+wu5LSNTRhnZ0sCzL6n0S+XZN/7q992s+0EhkDXUQ/EgJGi
        ZxnzukwH/YDnl8EB+quqUBc1rxHYA8K8NUmD7+mxoA==
X-Google-Smtp-Source: ABdhPJx5v3n3B2swPuZb7KD4eIkmwhRaWF/FXiLbVFI6wx/oCnz34Y7gUKNQv8DzpME54THwdKVT1yn9jrayayaWLBg=
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr31380199eje.201.1605841785662;
 Thu, 19 Nov 2020 19:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20201120030411.2690816-1-lokeshgidra@google.com> <20201120030411.2690816-2-lokeshgidra@google.com>
In-Reply-To: <20201120030411.2690816-2-lokeshgidra@google.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Thu, 19 Nov 2020 19:09:34 -0800
Message-ID: <CA+EESO6xfnRWD2xrmar6VrcWBA8P53J8gVZmOtR0Ri65yb-Q4w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Add UFFD_USER_MODE_ONLY
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
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
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 7:04 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
>
> userfaultfd handles page faults from both user and kernel code.
> Add a new UFFD_USER_MODE_ONLY flag for userfaultfd(2) that makes
> the resulting userfaultfd object refuse to handle faults from kernel
> mode, treating these faults as if SIGBUS were always raised, causing
> the kernel code to fail with EFAULT.
>
> A future patch adds a knob allowing administrators to give some
> processes the ability to create userfaultfd file objects only if they
> pass UFFD_USER_MODE_ONLY, reducing the likelihood that these processes
> will exploit userfaultfd's ability to delay kernel page faults to open
> timing windows for future exploits.
>
> Signed-off-by: Daniel Colascione <dancol@google.com>
> Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
> Reviewed-by: Andrea Arcangeli <aarcange@redhat.com>
> ---
>  fs/userfaultfd.c                 | 10 +++++++++-
>  include/uapi/linux/userfaultfd.h |  9 +++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 000b457ad087..605599fde015 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -405,6 +405,13 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
>
>         if (ctx->features & UFFD_FEATURE_SIGBUS)
>                 goto out;
> +       if ((vmf->flags & FAULT_FLAG_USER) == 0 &&
> +           ctx->flags & UFFD_USER_MODE_ONLY) {
> +               printk_once(KERN_WARNING "uffd: Set unprivileged_userfaultfd "
> +                       "sysctl knob to 1 if kernel faults must be handled "
> +                       "without obtaining CAP_SYS_PTRACE capability\n");
> +               goto out;
> +       }
>
>         /*
>          * If it's already released don't get it. This avoids to loop
> @@ -1965,10 +1972,11 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
>         BUG_ON(!current->mm);
>
>         /* Check the UFFD_* constants for consistency.  */
> +       BUILD_BUG_ON(UFFD_USER_MODE_ONLY & UFFD_SHARED_FCNTL_FLAGS);
>         BUILD_BUG_ON(UFFD_CLOEXEC != O_CLOEXEC);
>         BUILD_BUG_ON(UFFD_NONBLOCK != O_NONBLOCK);
>
> -       if (flags & ~UFFD_SHARED_FCNTL_FLAGS)
> +       if (flags & ~(UFFD_SHARED_FCNTL_FLAGS | UFFD_USER_MODE_ONLY))
>                 return -EINVAL;
>
>         ctx = kmem_cache_alloc(userfaultfd_ctx_cachep, GFP_KERNEL);
> diff --git a/include/uapi/linux/userfaultfd.h b/include/uapi/linux/userfaultfd.h
> index e7e98bde221f..5f2d88212f7c 100644
> --- a/include/uapi/linux/userfaultfd.h
> +++ b/include/uapi/linux/userfaultfd.h
> @@ -257,4 +257,13 @@ struct uffdio_writeprotect {
>         __u64 mode;
>  };
>
> +/*
> + * Flags for the userfaultfd(2) system call itself.
> + */
> +
> +/*
> + * Create a userfaultfd that can handle page faults only in user mode.
> + */
> +#define UFFD_USER_MODE_ONLY 1
> +
>  #endif /* _LINUX_USERFAULTFD_H */
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
Adding linux-mm@kvack.org mailing list
