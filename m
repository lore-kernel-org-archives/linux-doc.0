Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F7FC432BE
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 15:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C01EF61059
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 15:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343496AbhIAP3n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 11:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244181AbhIAP3n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 11:29:43 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B722C061760
        for <linux-doc@vger.kernel.org>; Wed,  1 Sep 2021 08:28:46 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id e133so5993526ybh.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GlOqsOpw3zZfxlN+CxYu9jIfOzsHv5cSyt625Vybl8=;
        b=pouVvtouO9DCggJX7QWS3tCOWjs/IVuHjqBQMcHhQ0STgWiOvIiZCSSrNXAY5ld81f
         LZ1tSIspJ93Le8JyfMvoJul1UlvtVWAf3Ztf2FqwZPU6rjLOwLaDy2z27rSUE5xeXbjs
         QLUk6yb4SBxpBWd9Ak1A2Z/ZZchEHnkRsFFSh7Hp74C0IIwTPtxicZvUFOz24o01Dwqu
         8PTDkYunv439Eipf41iI9fhCJBZN/ubgyxj1LESHmh5f7wxAPOm5SEwzYAHjC/qqTKZI
         18CwG0LwTneoTDEOQIHDU1N8oo2XrfLx49c7cxf2mvzUQ4wXyPFrbnQvKkLWtZ6b5kWg
         4+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GlOqsOpw3zZfxlN+CxYu9jIfOzsHv5cSyt625Vybl8=;
        b=riQah+wew3MN3nMm7JHiQw9aHLcWNdXYSdVLCYrItJcrZrpZW83hP2LxQu7lTaIFI1
         08t+ZeTP8HoGgLtrrSzkYA81lcOMHqV7lj7dJqzMr9dF/Qu6zHlNJghIbM682VBrVsx8
         4+Z7ymdQT2Xv/6X48O4NEUy1iWCbhNdCITLUPduqyuk+cxG3VIFLKLqVLk7LsRccjv5c
         1hZDp8jJoPSStbLyCFk/hrMDmCXWgX6uNxEKlHTYP7FNR1T1gFLv5D0LWtYthDNdaq3y
         Qtw9XgFnLxAqdyRM9M863lGoqyExKY2bLDXzSmJU5VSlrloniz2UguEXwbe2ujrovYS/
         A9Jw==
X-Gm-Message-State: AOAM531gdQ5W1JgrYjp1+JydUznYweQJ0XybwJQB1zLRph5pkdufLWUQ
        kP/oIcKj2OAefT0XfPiJUC1wi0MYmfMmw05h2qNoSg==
X-Google-Smtp-Source: ABdhPJzhZM0GkaML7l5NDkIdjuUzVHwpLZu9eyWoVcLH5iiYwRQjA1Xhn5CpBr/9c59LJQdRbh+17vthAETK0dGKDdw=
X-Received: by 2002:a25:4757:: with SMTP id u84mr23681yba.397.1630510125588;
 Wed, 01 Sep 2021 08:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210827191858.2037087-3-surenb@google.com>
 <YS81MDMgrL1tpcN7@dhcp22.suse.cz>
In-Reply-To: <YS81MDMgrL1tpcN7@dhcp22.suse.cz>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 1 Sep 2021 08:28:34 -0700
Message-ID: <CAJuCfpEahzbzD4OD0drrkDM-u4vG-jYG6DjkVUojix=+JsYBpg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mm: add a field to store names for private
 anonymous memory
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        John Hubbard <jhubbard@nvidia.com>,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        chris.hyser@oracle.com, Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 1, 2021 at 1:09 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Fri 27-08-21 12:18:57, Suren Baghdasaryan wrote:
> [...]
> > Userspace can set the name for a region of memory by calling
> > prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME, start, len, (unsigned long)name);
> > Setting the name to NULL clears it.
>
> Maybe I am missing this part but I do not see this being handled
> anywhere.

It's handled in replace_vma_anon_name(). When name==NULL we call
free_vma_anon_name() which frees and resets anon_name pointer. Except
that, as you noticed, the check after strndup_user() will prevent NULL
to be passed here. I forgot to test this case after conversion to
strndup_user() and missed this important point. Thanks for pointing it
out. Will fix and retest.

>
> [...]
> > @@ -3283,5 +3283,16 @@ static inline int seal_check_future_write(int seals, struct vm_area_struct *vma)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_ADVISE_SYSCALLS
> > +int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > +                       unsigned long len_in, const char *name);
> > +#else
> > +static inline int
> > +madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > +                   unsigned long len_in, const char *name) {
> > +     return 0;
> > +}
> > +#endif
>
> You want to make this depend on CONFIG_PROC_FS.

Ack.

>
> [...]
> > +#ifdef CONFIG_MMU
> > +
> > +#define ANON_VMA_NAME_MAX_LEN        64
> > +
> > +static int prctl_set_vma(unsigned long opt, unsigned long addr,
> > +                      unsigned long size, unsigned long arg)
> > +{
> > +     struct mm_struct *mm = current->mm;
> > +     char *name, *pch;
> > +     int error;
> > +
> > +     switch (opt) {
> > +     case PR_SET_VMA_ANON_NAME:
> > +             name = strndup_user((const char __user *)arg,
> > +                                 ANON_VMA_NAME_MAX_LEN);
> > +
> > +             if (IS_ERR(name))
> > +                     return PTR_ERR(name);
>
> unless I am missing something NULL name would lead to an error rather
> than a name clearing as advertised above.

Correct, I missed that. Will fix.

>
> > +
> > +             for (pch = name; *pch != '\0'; pch++) {
> > +                     if (!isprint(*pch)) {
> > +                             kfree(name);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +
> > +             mmap_write_lock(mm);
> > +             error = madvise_set_anon_name(mm, addr, size, name);
> > +             mmap_write_unlock(mm);
> > +             kfree(name);
> > +             break;
> > +     default:
> > +             error = -EINVAL;
> > +     }
> > +
> > +     return error;
> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
