Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F9DC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 13:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF0161881
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 13:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbhJENP2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 09:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbhJENP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 09:15:27 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF03C06174E
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 06:13:37 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id y16-20020a4ade10000000b002b5dd6f4c8dso6369904oot.12
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6G7malU1QffNFlLHyGnF0GE1rVke+5aiG8YVR53mxq8=;
        b=Uo5Dxx/8CK3cBObyCN+G6zjFAZKGtDxuUZOCiZhE8emJWurCVGfpeQbXCqRz/ifw8h
         5hJG4lOZ1j+wsv17NwZ2izgQ7JLzW/ft2ZZ3ui7naNTAy9MMSaSzlMSgOCEBE0K7Qs0t
         PGSRYvlOSlUpoORJazPfM8UN/kLb9qnhtdMtq0XuKNTETS4ZCdnWTuLhsuCks3oPF//n
         wf8xGuAxUqWcWqkBx+CDmE/gNFN5HOJjTlwmMXm8VSDfCjJt1mgSLS0RjAeKs7jE1lCa
         uTfhMSHLyVhB2mkQfBO+UMdTDtPE/eSnpRBBglK2HfZhOmKx3KBZqBW59LtAzXHqvVZb
         JaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6G7malU1QffNFlLHyGnF0GE1rVke+5aiG8YVR53mxq8=;
        b=KRVChzYGDBbcYU8Mief20qYNhnCdi53STky2XQCOgEtvW3p34RmRTsWtKZbHTMaF9D
         Zpg6kaHWZu66P+jhq8V4h/8x33VqeqRQ8EGjtO6lVQy3viiBIQcpGiE87ONskdE4QDvR
         uvFhipNPjUMu2QS8tu6CW7qWiJ7lP19HlkV36F5gM/Ne191QPtg/TvHXE5iK10geHzKg
         B0+Yn7gXEynT/EmA1Uczz01vE7CrbZOcfEQY15AwiO4nDmIw/6nEgA3JlZ3NabI+ucuM
         Md0yHbpVAneFyOAk9QClnvS6vFoCce7824HyaB6fQNSY7b771/TlVaSAfe0zrgfdS+Ds
         tOlA==
X-Gm-Message-State: AOAM532qr4oS2BIOQ9hSI37IAcDi3r7RUrskemWR6ai2DFeaUwADdVtq
        n7UUKUtknPR1yvkO6pOsemu2e+cYj3BQtvB1ww6zeQ==
X-Google-Smtp-Source: ABdhPJxqMq8cjDTc9QTKdqIRvlnQBOs1H6JCXbF5h1q6usAXXwdA/S40EKnb/uwBvgOd/CGMKkYqHGw1riXb4Giu+98=
X-Received: by 2002:a4a:de57:: with SMTP id z23mr13364623oot.70.1633439616620;
 Tue, 05 Oct 2021 06:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com> <20211005105905.1994700-5-elver@google.com>
 <YVxKplLAMJJUlg/w@hirez.programming.kicks-ass.net>
In-Reply-To: <YVxKplLAMJJUlg/w@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Tue, 5 Oct 2021 15:13:25 +0200
Message-ID: <CANpmjNMk0ubjYEVjdx=gg-S=zy7h=PSjZDXZRVfj_BsNzd6zkg@mail.gmail.com>
Subject: Re: [PATCH -rcu/kcsan 04/23] kcsan: Add core support for a subset of
 weak memory modeling
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Oct 2021 at 14:53, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 05, 2021 at 12:58:46PM +0200, Marco Elver wrote:
> > +#if !defined(CONFIG_ARCH_WANTS_NO_INSTR) || defined(CONFIG_STACK_VALIDATION)
> > +/*
> > + * Arch does not rely on noinstr, or objtool will remove memory barrier
> > + * instrumentation, and no instrumentation of noinstr code is expected.
> > + */
> > +#define kcsan_noinstr
>
> I think this still wants to be at the very least:
>
> #define kcsan_noinstr noinline notrace
>
> without noinline it is possible LTO (or similarly daft things) will end
> up inlining the calls, and since we rely on objtool to NOP out CALLs
> this must not happen.

Good point about noinline, will add.

> And since you want to mark these functions as uaccess_safe, there must
> not be any tracing on, hence notrace.

In the Makefile we've relied on:

  CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)

just to disable it for all code here. That should be enough, right?
