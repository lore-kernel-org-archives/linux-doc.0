Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BABCC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BBFF61244
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234445AbhJELwp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234354AbhJELwo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:52:44 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05E9C061755
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:50:53 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id w206so25844468oiw.4
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXyHYhWprLF6VOTKKbJ9elBPTHHvHE5sqZFrMqC4ukc=;
        b=AdpPxdZ9CqU5FBxAA98Y3fzXjRIpzwI+jLyQpXlS0B2Zag9lwe0Tm/W8yG54SJ9A9u
         ZloN1JllYx08BhPRvTu5lLeMVb90zvrbUzw51Q/oTdDElg8798X7vT7CKO7GyYUcONLE
         k9O1RUB4qxTUoeLEVIq3Grm6ll7KDg+JufpDII0qJIcg/GKTG35cmkQ5XWHVutEWOyV9
         afmn3IVBAGabm9Ko1S1/pP/T924r2z5QRlfubG528dYb2KvZAfCV+7dPjVhxdNnppO46
         HYvS1v3YPsVAuU8KqDjulvXw2WkI0lv0lSxJUhzjPCzS4XqZ3dFKVW9ScGGE+fi2AxGF
         NvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXyHYhWprLF6VOTKKbJ9elBPTHHvHE5sqZFrMqC4ukc=;
        b=G6cPeIjyJEjcXjlwPheg/mhcESK2mOa9ROG063YQH13p1we7wdlHQfBeAW4dGq/YRX
         XyXApCX801kM0JPvapI5gsSqRUVaAtE/dt3JuD3bwfyQGljy+Oo+Bz1TBry4w9olAeqW
         i6I2KzghiGaMmyTDGHoTIBKAe0rUHnnf2aVG8YG/jLGWoexiIf/Q8Ki3jTCZA4PdfYfu
         +eGT8EwKtsJT9gnqYnWmLhWz0LK+7Qu5M53yp1pE0mwFOnDGgwnRfW91/p5HNc54MS5t
         o7VfR76OdJm5SuxTA6j73Iqq3gwsUe1IRMdua1BGEjf7L48UUnoQhqAitP+BSuR/4dPs
         LeFQ==
X-Gm-Message-State: AOAM531bRotAFsXl7/oxH+9mmvrw+j7e4wS9gebF+pgV/1A0DXx3/9PS
        FF+Px/UX31k/CQhUBqoV7AZmphtxNOyHe7zJoi/7DA==
X-Google-Smtp-Source: ABdhPJxU3FVSA1SHRlaHXINF41V/Q42Bl2cBP1TOm69/Ej2eU70kaiasNkoR/CPckzvekLYzclXnlPHunaY5s8EHghQ=
X-Received: by 2002:a54:4618:: with SMTP id p24mr2068916oip.134.1633434652953;
 Tue, 05 Oct 2021 04:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com> <20211005105905.1994700-6-elver@google.com>
 <YVw53mP3VkWyCzxn@hirez.programming.kicks-ass.net> <YVw63tqctCMm+d7M@hirez.programming.kicks-ass.net>
In-Reply-To: <YVw63tqctCMm+d7M@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Tue, 5 Oct 2021 13:50:41 +0200
Message-ID: <CANpmjNOXWtUg9qsLJ6m9n3GYZf-AHE_21=zLnFnUMDBHMP2umg@mail.gmail.com>
Subject: Re: [PATCH -rcu/kcsan 05/23] kcsan: Add core memory barrier
 instrumentation functions
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

On Tue, 5 Oct 2021 at 13:45, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 05, 2021 at 01:41:18PM +0200, Peter Zijlstra wrote:
> > On Tue, Oct 05, 2021 at 12:58:47PM +0200, Marco Elver wrote:
> > > +static __always_inline void kcsan_atomic_release(int memorder)
> > > +{
> > > +   if (memorder == __ATOMIC_RELEASE ||
> > > +       memorder == __ATOMIC_SEQ_CST ||
> > > +       memorder == __ATOMIC_ACQ_REL)
> > > +           __kcsan_release();
> > > +}
> > > +
[...]
> > > +   kcsan_atomic_release(memorder);
> > >     __atomic_thread_fence(memorder);
> > >  }
> > >  EXPORT_SYMBOL(__tsan_atomic_thread_fence);
> >
> > I find that very hard to read.. kcsan_atomic_release() it not in fact a
> > release. It might be a release if @memorder implies one.

You're right, this name can be improved.
`kcsan_atomic_builtin_memorder(..)` is probably better

> Also, what's the atomic part signify? Is that because you're modeling
> the difference in acquire/release semantics between
> smp_load_{acquire,release}() and atomic*_{acquire,release}() ?

Sorry, just a bad name. It's about the builtins. The above suggested
name should hopefully be clearer.
