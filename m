Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06754C4320E
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 16:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE39560F57
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 16:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbhH3QRV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Aug 2021 12:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237761AbhH3QRU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Aug 2021 12:17:20 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C9FC061575
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 09:16:26 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id z18so29199362ybg.8
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=939bu+vC3jVVcLM9PeqTLcUxKeTQvKl0T/UCGWNALp8=;
        b=ITcI2RF50tbf5jpbW8hW2EUztHNlrwGsnfhzC6mjwauuNvS7Ua57LXmxQsEnU6SN4T
         lto0AKR9E+HNrA9uKZlePPX15hLOkKucpln1AUjIYkD7r7xSa3cKuEc7anPJF1svsnfO
         i6BGb2efCdpIl7cKmaMjc0QMbb/duELn6Xi+FOJIky16dA00UFatdp/+ivybREcLter0
         eVp/pctX4PieOXuJmI7pr65UDYdEmRdtGBnMrUvXdskwjfGi+hEO4yAY2WV23PIUXpod
         3Xz7s5C5n7uMdSMZy2ShvmwViZLPojKgRtCfw/fWgP7Z7fPUiarooICeuhOQppGopW13
         13yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=939bu+vC3jVVcLM9PeqTLcUxKeTQvKl0T/UCGWNALp8=;
        b=m0xalB7uz3VdjnQREAh284zkQ+vDkrLj1scrNmGU07aXFTFyaRbwkSMxLMVn4Sdbsq
         xd8JrHckZOYB0zNLQEHVCCxIuxNhsJpRcy9huWY21gGIdn96R0Ah6IdZgu4xq0zHGMb1
         7A1aLisAOogOP+1Il/yYL1bxZox4yD7nwd33hiG+6YuryULwqqwwEVKqTUZAaKfnuEoH
         ZX2aocyy7t56d/DxAkBMAIQbIcD5jYXOw9DDXhSvonWVZXAWMdhjWMOIjTOLsyjrg7aB
         Ld/D5V9AjtUwEf2pdXbSGQptxjdyjl50r7e4olyXjtBSxdu/Q23LBHqgyYD9eHI+4pAJ
         yDew==
X-Gm-Message-State: AOAM531tm5pchOKnjFoPn3+dSP/D9eT3M3aSeAkgT2JKfqXjhuQDOZHC
        4BMJucuwilmAKGgtYPC4K/3hwE2QQdnMwQLQvoDzDQ==
X-Google-Smtp-Source: ABdhPJxpO4KRrWzp9HPBWsZPHteLt3ldMMBKdPlVWSrBRAgXZx0fVjGjzTe9UARBxOQ2FzMofCcoEJhTK10UQiuzOkM=
X-Received: by 2002:a25:2f84:: with SMTP id v126mr23529062ybv.397.1630340185705;
 Mon, 30 Aug 2021 09:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210827191858.2037087-3-surenb@google.com>
 <YSmVl+DEPrU6oUR4@casper.infradead.org> <202108272228.7D36F0373@keescook>
 <CAJuCfpEWc+eTLYp_Xf9exMJCO_cFtvBUzi39+WbcSKZBXHe3SQ@mail.gmail.com> <f7117620-28ba-cfa5-b2c6-21812f15e4d6@rasmusvillemoes.dk>
In-Reply-To: <f7117620-28ba-cfa5-b2c6-21812f15e4d6@rasmusvillemoes.dk>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 30 Aug 2021 09:16:14 -0700
Message-ID: <CAJuCfpHXF34THa=zVcRozYiLA9QPeNyU09WvyJFKk=ZjCq0ZZw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mm: add a field to store names for private
 anonymous memory
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Kees Cook <keescook@chromium.org>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
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
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 30, 2021 at 1:12 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 28/08/2021 23.47, Suren Baghdasaryan wrote:
> > On Fri, Aug 27, 2021 at 10:52 PM Kees Cook <keescook@chromium.org> wrote:
> >>
> >>>> +   case PR_SET_VMA_ANON_NAME:
> >>>> +           name = strndup_user((const char __user *)arg,
> >>>> +                               ANON_VMA_NAME_MAX_LEN);
> >>>> +
> >>>> +           if (IS_ERR(name))
> >>>> +                   return PTR_ERR(name);
> >>>> +
> >>>> +           for (pch = name; *pch != '\0'; pch++) {
> >>>> +                   if (!isprint(*pch)) {
> >>>> +                           kfree(name);
> >>>> +                           return -EINVAL;
> >>>
> >>> I think isprint() is too weak a check.  For example, I would suggest
> >>> forbidding the following characters: ':', ']', '[', ' '.  Perhaps
>
> Indeed. There's also the issue that the kernel's ctype actually
> implements some almost-but-not-quite latin1, so (some) chars above 0x7f
> would also pass isprint() - while everybody today expects utf-8, so the
> ability to put almost arbitrary sequences of chars with the high bit set
> could certainly confuse some parsers. IOW, don't use isprint() at all,
> just explicitly check for the byte values that we and up agreeing to
> allow/forbid.
>
> >>> isalnum() would be better?  (permit a-zA-Z0-9)  I wouldn't necessarily
> >>> be opposed to some punctuation characters, but let's avoid creating
> >>> confusion.  Do you happen to know which characters are actually in use
> >>> today?
> >>
> >> There's some sense in refusing [, ], and :, but removing " " seems
> >> unhelpful for reasonable descriptors. As long as weird stuff is escaped,
> >> I think it's fine. Any parser can just extract with m|\[anon:(.*)\]$|
> >
> > I see no issue in forbidding '[' and ']' but whitespace and ':' are
> > currently used by Android. Would forbidding or escaping '[' and ']' be
> > enough?
>
> how about allowing [0x20, 0x7e] except [0x5b, 0x5d], i.e. all printable
> (including space) ascii characters, except [ \ ] - the brackets as
> already discussed, and backslash because then there's nobody who can get
> confused about whether there's some (and then which?) escaping mechanism
> in play - "\n" is simply never going to appear. Simple rules, easy to
> implement, easy to explain in a man page.

Thanks for the suggestion, Rasmus. I'm all for keeping it simple.
Kees, Matthew, would that be acceptable?

>
> >>
> >> For example, just escape it here instead of refusing to take it. Something
> >> like:
> >>
> >>         name = strndup_user((const char __user *)arg,
> >>                             ANON_VMA_NAME_MAX_LEN);
> >>         escaped = kasprintf(GFP_KERNEL, "%pE", name);
>
> I would not go down that road. First, it makes it much harder to explain
> the rules for what are allowed and not allowed. Second, parsers become
> much more complicated. Third, does the length limit then apply to the
> escaped or unescaped string?
>
> Rasmus
