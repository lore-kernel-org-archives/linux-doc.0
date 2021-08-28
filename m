Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2564AC432BE
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 22:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E25DD604D7
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 22:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhH1WHo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 18:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231982AbhH1WHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 18:07:43 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4173C061796
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 15:06:52 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id z5so19927471ybj.2
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 15:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FaNp+rgluakS1NovJ9xRQmt2mW1nmBLtnie3IiMHfk=;
        b=hIw/qm9pg9ZdeTcKNLVVVOW4DRFhCbswcN4AUxuYQhsj8UGDdLJ/SeljNcx4n22yOJ
         C6jcmzcxhg7nfftciaoBfso9qRnMyBAO5PHFpG/udUXPdax6qLwAvxYqJYdYvmDya3xj
         7WtgdX+zuglKrfCseQdR07ng41SjaPz2H7F0bVObVVHfZw0V9pdKKOARroIHqjX72s5n
         vba2EQEd+3aOJO2sRbJ5TTKru6JrvWUogyWP0hAYWybVPUQ2COPxZi3D9MnQ+OroZSIs
         VTN253xQeZ2n6BmFRAoPI3FJlvfm9M5lU8N85Nu30Dqsmny9K9llY0zlZR7R4BHWRZYt
         efkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FaNp+rgluakS1NovJ9xRQmt2mW1nmBLtnie3IiMHfk=;
        b=hm0QwAfACY/oplhLLNvIpZy6j0zfYB3W+i3uqtajt9orqKskkTCF+HfqI7Qr5cv4/h
         grGZJQRRlsy8tIq65Dk23Fy51qV89hD1zRZHnDaxcvM4q79XAq1O5Wi3yduFS0xKabZG
         qETVri0I/kUp5byOL2ZnR6MorouqRXhFBsIKN7a5fJEY8wnA2Oy11ir7WWY/8aJea24j
         DvYU+GBO4HP12Zpm9jCqC0RdXdxUh1CNyqBW3bSQVW9jC2YYNxJyVXmgrl7GPwMrrGIY
         Je6xmCwOwOHDBbah+DjWnQOYUMahTiopwXn+7hStk0g6x6HyAkYWoGnrHlJhGK/5Di4o
         5vXA==
X-Gm-Message-State: AOAM532kKbPK7AbxFGMMhwMI/uoApxHzRCvdYd1HgxcH/zOdEeqQAIO3
        M6Je91Dx0YB+KHy49yRh+a29/RzzQQjbMKa37Lnoew==
X-Google-Smtp-Source: ABdhPJxnDgVOH0h+Up9Sphumk/kGeSq9m09jSJlI2gZqPuf7VFR01D96XmdG0df9NqzDHkYt3N6qEPla3dpUcRXoYxM=
X-Received: by 2002:a25:ba08:: with SMTP id t8mr13478289ybg.111.1630188411767;
 Sat, 28 Aug 2021 15:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210828124852.GA12580@duo.ucw.cz>
In-Reply-To: <20210828124852.GA12580@duo.ucw.cz>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Sat, 28 Aug 2021 15:06:40 -0700
Message-ID: <CAJuCfpE85Pbw7TDcZOOonMLNgHMWsaWR-2qR5iUZJ4dyJ-6k7g@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Anonymous VMA naming patches
To:     Pavel Machek <pavel@ucw.cz>
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
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 28, 2021 at 5:48 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> >  Documentation/filesystems/proc.rst |   2 +
>
> Documentation for the setting part would be welcome, too.

Absolutely! Thanks for reminding me. I'll add a description of the new
PR_SET_VMA and PR_SET_VMA_ANON_NAME options for prctl(2) manpage into
the second patch of this series which introduces them. After the patch
is finalized and accepted I'll also post a patch to update the
prctl(2) manpage.
Thanks,
Suren.


>
> Best regards,
>                                                         Pavel
> --
> http://www.livejournal.com/~pavelmachek
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
