Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16BAC432BE
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 21:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85BB560E77
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 21:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbhH1WAg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 18:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhH1WAc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 18:00:32 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC767C0612A6
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 14:59:27 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id v19so6307305ybv.9
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pyWbJNHHz8eg8MTD7gm92l9NEwd2/uLCVNwtVRUk+N8=;
        b=RtWc0eULZASFS2c8UT3utLEPhZqsSiVw4hdmjvsPupSThfmle1yxbAmgOSFLM1o7lV
         7X72oEIxSujnXwjV8bx2uMA4uZgDJ5sYemIqpxhRKsyJZJr6OEjZbWXiXnBE7GiPSS7e
         gDC2jE+VsDNNpvIxQfR/v1D46KuGZfJO/lyuifEhSVr8GTZbrc9XmwRcFat4Ght4g83P
         j5lsNBhkGkRZGyKtF9aPiYaNts0GyiDAxnqG68VrxKwwwqP5usAYcy6aBN7avZicL7CR
         bYoDwqQf4ZtSk8C66XQOP04BnHYF+fnfJCGDzn8ZriiSkUjhboIZQ+ijtZZgiFhDd6vC
         OElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pyWbJNHHz8eg8MTD7gm92l9NEwd2/uLCVNwtVRUk+N8=;
        b=LEKXByPZ5FSoYe0G5+NP/mQkJbBeuCxFKVTvp1jmSXcx0zzCJEfsNwPGa4NV+d5qTq
         ZVyq1R8WDJoia/Bs7X8PqQCVKzqqY8v5rwRMpA178VU5AdWtmlR4cd9BFWCImS/HSe6g
         EzYvT+HtI+/3Pd5tyWILJGXvGfm8S6gCwHs0BTpgAbUaAAkvidllkGJqSL09ghry5BUJ
         XQgxy9+4hhPC9xNrlTKvChlZEzBWBn3P+elsQMpP+1EYC458CM9o1zy22XCPfY5CHWvQ
         pdkxkx/2Mqeym/PRcvmEX/QSpg2TQCT4QqY202ZA91lvAObpLUasW3KtBudOSRHIHcaX
         SYaw==
X-Gm-Message-State: AOAM530sSWTlot/CaWd/q/HjGyJgFR6S+xpZoJnL+2/SiRqzJLOGdw4T
        viNOnaBxK09QM94D0ArfyU5evAMSA5XnSpe8iZJ2rg==
X-Google-Smtp-Source: ABdhPJxcsvbqwcIf6UU/EabbulfP5bhcIGDCQHmNnC1Py259tPI6pmKG7LONTo/wpRs8g1yhIw0178/u97GU7v8ekPI=
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr13867314ybc.136.1630187967034;
 Sat, 28 Aug 2021 14:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210827191858.2037087-2-surenb@google.com>
 <YSpiIrQKs5RUccYk@grain>
In-Reply-To: <YSpiIrQKs5RUccYk@grain>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Sat, 28 Aug 2021 14:59:16 -0700
Message-ID: <CAJuCfpGsr4Za7xj5O1-KJyj+WF2OTiWdMUWPALq3K155G539yw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] mm: rearrange madvise code to allow for reuse
To:     Cyrill Gorcunov <gorcunov@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
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
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org, eb@emlix.com,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>,
        Pekka Enberg <penberg@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Jan Glauber <jan.glauber@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Rob Landley <rob@landley.net>,
        "Serge E. Hallyn" <serge.hallyn@ubuntu.com>,
        David Rientjes <rientjes@google.com>,
        Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>,
        Michel Lespinasse <walken@google.com>,
        Tang Chen <tangchen@cn.fujitsu.com>, Robin Holt <holt@sgi.com>,
        Shaohua Li <shli@fusionio.com>,
        Sasha Levin <sasha.levin@oracle.com>,
        Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 28, 2021 at 9:19 AM Cyrill Gorcunov <gorcunov@gmail.com> wrote:
>
> On Fri, Aug 27, 2021 at 12:18:56PM -0700, Suren Baghdasaryan wrote:
> ...
> >
> > +/*
> > + * Apply an madvise behavior to a region of a vma.  madvise_update_vma
> > + * will handle splitting a vm area into separate areas, each area with its own
> > + * behavior.
> > + */
> > +static int madvise_vma_behavior(struct vm_area_struct *vma,
> > +                             struct vm_area_struct **prev,
> > +                             unsigned long start, unsigned long end,
> > +                             unsigned long behavior)
> > +{
> > +     int error = 0;
>
>
> Hi Suren! A nitpick -- this variable is never used with default value
> so I think we could drop assignment here.
> ...
> > +     case MADV_DONTFORK:
> > +             new_flags |= VM_DONTCOPY;
> > +             break;
> > +     case MADV_DOFORK:
> > +             if (vma->vm_flags & VM_IO) {
> > +                     error = -EINVAL;
>
> We can exit early here, without jumping to the end of the function, right?
>
> > +                     goto out;
> > +             }
> > +             new_flags &= ~VM_DONTCOPY;
> > +             break;
> > +     case MADV_WIPEONFORK:
> > +             /* MADV_WIPEONFORK is only supported on anonymous memory. */
> > +             if (vma->vm_file || vma->vm_flags & VM_SHARED) {
> > +                     error = -EINVAL;
>
> And here too.
>
> > +                     goto out;
> > +             }
> > +             new_flags |= VM_WIPEONFORK;
> > +             break;
> > +     case MADV_KEEPONFORK:
> > +             new_flags &= ~VM_WIPEONFORK;
> > +             break;
> > +     case MADV_DONTDUMP:
> > +             new_flags |= VM_DONTDUMP;
> > +             break;
> > +     case MADV_DODUMP:
> > +             if (!is_vm_hugetlb_page(vma) && new_flags & VM_SPECIAL) {
> > +                     error = -EINVAL;
>
> Same.
>
> > +                     goto out;
> > +             }
> > +             new_flags &= ~VM_DONTDUMP;
> > +             break;
> > +     case MADV_MERGEABLE:
> > +     case MADV_UNMERGEABLE:
> > +             error = ksm_madvise(vma, start, end, behavior, &new_flags);
> > +             if (error)
> > +                     goto out;
> > +             break;
> > +     case MADV_HUGEPAGE:
> > +     case MADV_NOHUGEPAGE:
> > +             error = hugepage_madvise(vma, &new_flags, behavior);
> > +             if (error)
> > +                     goto out;
> > +             break;
> > +     }
> > +
> > +     error = madvise_update_vma(vma, prev, start, end, new_flags);
> > +
> > +out:
>
> I suppose we better keep the former comment on why we maps ENOMEM to EAGAIN?

Thanks for the review Cyrill! Proposed changes sound good to me. Will
change in the next revision.
Suren.

>
>         Cyrill
