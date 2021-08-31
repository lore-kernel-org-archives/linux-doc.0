Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE8BC432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 17:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB57A610CF
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 17:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbhHaRWr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 13:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhHaRWq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 13:22:46 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF12C061764
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 10:21:51 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id z5so36608480ybj.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WrEonas+JepcSOY1s7UkcRJkLLwq2Xbze1BTfCD2A34=;
        b=FUmATkIwZg5ZsdXIB4Beeo0WFBRLtX/xMW4hRtj8U9Wo67Z07U2YrBoqMyWD89anYc
         jsZEr/hMAxrvTFvMC8Z8Rep0v1FYAbDiZxWZvwtcd3E3rkJu/fEI9TdMwKHr1bbDR+uG
         HrstyAHrLttUKuChWSzh50+cnHbAvQTldLsIhAWnCQBRs8xuX9pTMDALn1e7AG1Tzrqv
         9CTf/X/hTTE4PneuIB0GsckhUTCqGhd/28jqAa/6Z1Ghl1YlkghiTFTzQHBQ4qZadojQ
         QpfxNyuvbhGMfLmre6jfNGm/k46DQ96BSRhwvSufQ0V0iRfZBfjkohXmi+r4VNOa0Hou
         z5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WrEonas+JepcSOY1s7UkcRJkLLwq2Xbze1BTfCD2A34=;
        b=J5yAvOcl5GHtErpexBt+35T8DUa2nZ7hpN+ImhjSwrP8mEMLNL7ODxhwRiar1TutCn
         l9/9J+H52dZWOQZt34KdGB+u1GxosQiHTm47M4ZQZPjoL+wgFlvpTN/aZKSIKcJtzdpt
         p14MpzIMACn1TFTGZf55jkyDiX1CweYEUmOxf/3dwgrN1mhq5kPNUaYRFuUOXQIcMYHo
         SRk3RcoDoFpU3a66ssaikMcZnbYkidUzGNzAovkRMSZ1gnGX+ETUz5JLZrFa9kW1e3FS
         7p0BvUKYSJscWl8CjuCInWrTC1vzE6vG3Ti01U7ZokXwpXa/WMUcbn93YxxWZnnKqARn
         zDjA==
X-Gm-Message-State: AOAM532sFHyQtT8n5ljBH6IvKjThXQ+W5cnK4kI2m0IMSmtOaAPrnl4u
        v1kSADAEELVUexMjqr7yk/+7Re5oUJtpm4nRyhgsYQ==
X-Google-Smtp-Source: ABdhPJyPBOY0YfeCm+axOI1GWL+mwhLsLVw2QaKm2MUud1FTTcYJfKTafsAGvTRvAVjyZR0pFmQLoHwTabaoQHWnias=
X-Received: by 2002:a25:9ac6:: with SMTP id t6mr32228595ybo.190.1630430510051;
 Tue, 31 Aug 2021 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210827191858.2037087-3-surenb@google.com>
 <YSmVl+DEPrU6oUR4@casper.infradead.org> <202108272228.7D36F0373@keescook>
 <CAJuCfpEWc+eTLYp_Xf9exMJCO_cFtvBUzi39+WbcSKZBXHe3SQ@mail.gmail.com>
 <f7117620-28ba-cfa5-b2c6-21812f15e4d6@rasmusvillemoes.dk> <CAJuCfpHXF34THa=zVcRozYiLA9QPeNyU09WvyJFKk=ZjCq0ZZw@mail.gmail.com>
 <YS0OWFnzLHJViamF@casper.infradead.org>
In-Reply-To: <YS0OWFnzLHJViamF@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 31 Aug 2021 10:21:38 -0700
Message-ID: <CAJuCfpEnZo8nji3R=6ek=2T2TSG=Ke22PJzV_WkYFeSV4R9beg@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mm: add a field to store names for private
 anonymous memory
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Kees Cook <keescook@chromium.org>,
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

On Mon, Aug 30, 2021 at 9:59 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 30, 2021 at 09:16:14AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Aug 30, 2021 at 1:12 AM Rasmus Villemoes
> > <linux@rasmusvillemoes.dk> wrote:
> > >
> > > On 28/08/2021 23.47, Suren Baghdasaryan wrote:
> > > > On Fri, Aug 27, 2021 at 10:52 PM Kees Cook <keescook@chromium.org> wrote:
> > > >>
> > > >>>> +   case PR_SET_VMA_ANON_NAME:
> > > >>>> +           name = strndup_user((const char __user *)arg,
> > > >>>> +                               ANON_VMA_NAME_MAX_LEN);
> > > >>>> +
> > > >>>> +           if (IS_ERR(name))
> > > >>>> +                   return PTR_ERR(name);
> > > >>>> +
> > > >>>> +           for (pch = name; *pch != '\0'; pch++) {
> > > >>>> +                   if (!isprint(*pch)) {
> > > >>>> +                           kfree(name);
> > > >>>> +                           return -EINVAL;
> > > >>>
> > > >>> I think isprint() is too weak a check.  For example, I would suggest
> > > >>> forbidding the following characters: ':', ']', '[', ' '.  Perhaps
> > >
> > > Indeed. There's also the issue that the kernel's ctype actually
> > > implements some almost-but-not-quite latin1, so (some) chars above 0x7f
> > > would also pass isprint() - while everybody today expects utf-8, so the
> > > ability to put almost arbitrary sequences of chars with the high bit set
> > > could certainly confuse some parsers. IOW, don't use isprint() at all,
> > > just explicitly check for the byte values that we and up agreeing to
> > > allow/forbid.
> > >
> > > >>> isalnum() would be better?  (permit a-zA-Z0-9)  I wouldn't necessarily
> > > >>> be opposed to some punctuation characters, but let's avoid creating
> > > >>> confusion.  Do you happen to know which characters are actually in use
> > > >>> today?
> > > >>
> > > >> There's some sense in refusing [, ], and :, but removing " " seems
> > > >> unhelpful for reasonable descriptors. As long as weird stuff is escaped,
> > > >> I think it's fine. Any parser can just extract with m|\[anon:(.*)\]$|
> > > >
> > > > I see no issue in forbidding '[' and ']' but whitespace and ':' are
> > > > currently used by Android. Would forbidding or escaping '[' and ']' be
> > > > enough?
> > >
> > > how about allowing [0x20, 0x7e] except [0x5b, 0x5d], i.e. all printable
> > > (including space) ascii characters, except [ \ ] - the brackets as
> > > already discussed, and backslash because then there's nobody who can get
> > > confused about whether there's some (and then which?) escaping mechanism
> > > in play - "\n" is simply never going to appear. Simple rules, easy to
> > > implement, easy to explain in a man page.
> >
> > Thanks for the suggestion, Rasmus. I'm all for keeping it simple.
> > Kees, Matthew, would that be acceptable?
>
> Yes, I think so.  It permits all kinds of characters that might
> be confusing if passed on to something else, but we can't prohibit
> everything, and forbidding just these three should remove any confusion
> for any parser of /proc.  Little Bobby Tables thanks you.

Thanks for all the feedback! I think I have enough change suggestions
to resping the next revision. Will send an update later today.
