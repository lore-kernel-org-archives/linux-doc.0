Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF43C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 21:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234615AbhKSVfM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Nov 2021 16:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhKSVfM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Nov 2021 16:35:12 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8C8C061574
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 13:32:09 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id bk14so24217085oib.7
        for <linux-doc@vger.kernel.org>; Fri, 19 Nov 2021 13:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GXHfM1zHpJu5wwWGSWsee6iiyt6MnGHGfBIxpmPLPk=;
        b=Da5fgDtGaSWg7kBA6Vl+Q0b9xSV4Gr/s+wRD9Ww4yELap/aNMC7gluX3kCAdnxxYeN
         kAm9K98pzWsJ58l/6xgKwb6HnUlc4hLwODYnaAU5ZbeGd1xUq9tgrmbAbhuTj2zsVV+T
         vPF4Zx+hH1fqAZ9xmvVvbkW5y6FT/BcFV9Am66hfoZ1UiBVFlhrbPWu0DSm13Zk1G0gn
         Ql/PXS3MRTJWKbDGwezkLwA9tBLRrS+lJ+2JO7IdMcS/OiyebpH0wKVl54H9qoceriTI
         MT8WWuE6XaQbcAbK7KdQl4nzGGKYRmdOOsF7vnhtGQOEjdaR+9XJ9Br9HRxzXBOhS3pO
         u3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GXHfM1zHpJu5wwWGSWsee6iiyt6MnGHGfBIxpmPLPk=;
        b=DBWFxWJmnFKpbND0iS15ycGMqk1TNeYHSiJcusFAcFObzHsWa71J3gUWkDyBh1RGqw
         ZMpCld0Rb+akt9h/f7n2TN6mhD8msCtTj4scJ1CXetjQIuL2wujq36NYzF8PRe7X+JoQ
         8luDVbTN6VDNoneuDF/mn1csUO9XN2oODHY/I9/tnUye85gTOkVKqC4SBBg/HAYik2OT
         3mNHw+P2rGwPaTQrgjMBQV5PeTvZ4G6jD0/LtpnOT2IpyUaZ54w2ccGV2erACvSXMDc8
         IVRDyxRcrHKQ/Xsyz4R7VTE1ksmG2krBBEO+HrbAoqVlWMIPF89EqvbS/aLlIO95ly39
         yXkA==
X-Gm-Message-State: AOAM531cD9fZI13bJO/LHsNYzcALbK8upsBB8l474l+1YwETBMEp2KlQ
        ZDYgu8wjYso4+bRApF/4Ut2fd50EJefhjmiAv1nQJQ==
X-Google-Smtp-Source: ABdhPJwXmXhmZIoAJvQyEg5ELH0NOHKM8Z2VTFX+cXoZyPNtSc4glckFT5TqVjn11VDqUStoWJnf1FN/l/YZlXmY86E=
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr2759146oil.65.1637357529142;
 Fri, 19 Nov 2021 13:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com> <20211118081027.3175699-24-elver@google.com>
 <20211119203135.clplwzh3hyo5xddg@treble>
In-Reply-To: <20211119203135.clplwzh3hyo5xddg@treble>
From:   Marco Elver <elver@google.com>
Date:   Fri, 19 Nov 2021 22:31:57 +0100
Message-ID: <CANpmjNPG1OdL9i73jiGH3XNmR+q+fRJfCaGrUXefRYu1kqhOGw@mail.gmail.com>
Subject: Re: [PATCH v2 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
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

On Fri, 19 Nov 2021 at 21:31, Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> > +     if (insn->sec->noinstr && sym->removable_instr) {
> >               if (reloc) {
> >                       reloc->type = R_NONE;
> >                       elf_write_reloc(file->elf, reloc);
>
> I'd love to have a clearer name than 'removable_instr', though I'm
> having trouble coming up with something.
>
> 'profiling_func'?
>
> Profiling isn't really accurate but maybe it gets the point across.  I'm
> definitely open to other suggestions.

Well, this bit is not true for all "profiling functions" either. It's
only true for instrumentation functions that appear in 'noinstr' and
that the compiler can't remove on its own, but are valid to remove by
objtool in noinstr code, hence 'removable_instr'.

I'm really quite indifferent what we call it, so I'll leave you to
pick whatever sounds best:

-- profiling_func
-- nop_profiling_func
-- optional_profiling_func
-- noinstr_remove
-- removable_profiling_func
-- noinstr_nop_func
-- noinstr_nop
-- nop_in_noinstr
-- invalid_in_noinstr

?

> Also, the above code isn't very self-evident so there still needs to be
> a comment there, like:
>
>         /*
>          * Many compilers cannot disable KCOV or sanitizer calls with a
>          * function attribute so they need a little help, NOP out any
>          * such calls from noinstr text.
>          */
>

I'll add it.

> > +{
> > +     /*
> > +      * Many compilers cannot disable KCOV with a function attribute so they
> > +      * need a little help, NOP out any KCOV calls from noinstr text.
> > +      */
> > +     if (!strncmp(name, "__sanitizer_cov_", 16))
> > +             return true;
>
> A comment is good here, but the NOP-ing bit seems out of place.

I'll fix that.
