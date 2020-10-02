Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBC2C4363D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 21:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CB30206DB
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 21:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T9S8Ib37"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgJBV2Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 17:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJBV2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 17:28:25 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61587C0613E2
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 14:28:25 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id y25so720066oog.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zH8zzrg+xXVXd7NQ8OqgeM7KZ5LB+ZSk1cWcX09tTBI=;
        b=T9S8Ib37E0nEAzt58/3mFKBcYQZBL+AUZWg1RHKEI8YcEgkzl+zhg+iUyJcShofLym
         adUy3VXYaVJw4qH0ARA2opXokbhprcecl+xiECKEHSPNPKANK9N041AL1hOWHcZxTISz
         75/8QopBKHILebHvJPZCrLtxRg5XQ9sss/ad/Fj7yHOuH8HgviF0halDHMmt+OLPCc46
         a32zRvTWfMF/tIVNl2CVHZM3rjchAMQNqj76PE4HOP6RTztczmN4lU4pNfoP12ymVF1D
         +qutItDnQ2A65FnuPYHsSWxi2ag2I5uWo5diCMXDjG37okMaISf9tYs8byUgPIDGLW7J
         xG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zH8zzrg+xXVXd7NQ8OqgeM7KZ5LB+ZSk1cWcX09tTBI=;
        b=gwzP/RcSFZ7y5TB+DpDpsPuv32V/EXYrugtm/kvzTbpNBb5L7pMGBU/o0G+zUXO8c0
         c55wS0xBf5d0B6tcpWrW8eKJMKSSW7LA27vDJCneyfKo5NwMKnXkvTP13seLw1oBkrQa
         IUpJGc1hSpJ7A6SJ3AWdkZWZeQO1cmmU51b+lSssyrPS6WN5XfeMQQSP3gu0cEDHGsCU
         yaR9SJtOapdD8jVbH1U2qDismkJlV/Xl1otsvR1XZfY1G0G1U3Oup/82NK6P1JQBd4Zl
         LwncnSZI+jYYbteomDG2VKHiaNjEOBihfZwiC0Iw94zFntdAxGyYQyMl607Hq5tdKHb9
         45Cw==
X-Gm-Message-State: AOAM530zGIh9HmYVcMJJpYsHhG6KXXgFviCEUk73rkGEpuUob9zX6i+V
        lrksQ2nXuPStFUQGGw4zuJJM+qUFYjoi74k3uRm6oA==
X-Google-Smtp-Source: ABdhPJxOUoZnl87DrHfbRoTmo20SXV41YO+PeAn+DWWBv9LR0ddLe4qAXxw5Nx6yNfCgJCH4HtSP2kXaFFs8y0NqANA=
X-Received: by 2002:a4a:4fd0:: with SMTP id c199mr3387390oob.54.1601674104417;
 Fri, 02 Oct 2020 14:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200929133814.2834621-1-elver@google.com> <20200929133814.2834621-2-elver@google.com>
 <CAG48ez3+_K6YXoXgKBkB8AMeSQj++Mxi5u2OT--B+mJgE7Cyfg@mail.gmail.com>
 <20201002171959.GA986344@elver.google.com> <CAG48ez0D1+hStZaDOigwbqNqFHJAJtXK+8Nadeuiu1Byv+xp5A@mail.gmail.com>
In-Reply-To: <CAG48ez0D1+hStZaDOigwbqNqFHJAJtXK+8Nadeuiu1Byv+xp5A@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 2 Oct 2020 23:28:12 +0200
Message-ID: <CANpmjNN7s3o4DYbP64iLYo0MeDWciQnKd61njJKLsiZv+ZLQdA@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] mm: add Kernel Electric-Fence infrastructure
To:     Jann Horn <jannh@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexander Potapenko <glider@google.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kees Cook <keescook@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        SeongJae Park <sjpark@amazon.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2 Oct 2020 at 21:32, Jann Horn <jannh@google.com> wrote:

> > That's another check; we don't want to make this more expensive.
>
> Ah, right, I missed that this is the one piece of KFENCE that is
> actually really hot code until Dmitry pointed that out.
>
> But actually, can't you reduce how hot this is for SLUB by moving
> is_kfence_address() down into the freeing slowpath? At the moment you
> use it in slab_free_freelist_hook(), which is in the super-hot
> fastpath, but you should be able to at least move it down into
> __slab_free()...
>
> Actually, you already have hooked into __slab_free(), so can't you
> just get rid of the check in the slab_free_freelist_hook()?

I missed this bit: the loop that follows wants the free pointer, so I
currently see how this might work. :-/

We'll look at your other email re optimizing is_kfence_address() next
week; and thank you for the detailed comments thus far!

Thanks,
-- Marco
