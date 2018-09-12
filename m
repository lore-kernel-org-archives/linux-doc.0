Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0DD77D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 17:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbeILWpd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 18:45:33 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:39730 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727662AbeILWpc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 18:45:32 -0400
Received: by mail-oi0-f65.google.com with SMTP id c190-v6so5396679oig.6
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 10:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6V/aV/+k1BBD/HPURXTodsmTL76rHoEie/dN99q9HdQ=;
        b=pu6aCrBND0VZfIhoZwOaSiWE0flAsHcaC0fFIWhI4d0URhvqdvh2XCZ/r8VwgcfQ0X
         5jpzDm3dx5r6LMeuscKKRSKVKpF9EjgcDI7+yphsqhteubFZWeAWrncCIXYG6jqzGRbd
         PwBTmz+YzEeesRVI0aqlZYoPaWIG4biM/Q2n0t7LN71Jz/AMLGQMVj87OMkclqe8jv5w
         QyPeK7uPKYVJ2RyQbSR/alGpAbKo5kFC3gCfakaDWblpiLbCucW/YrdpBjnLhzEy2bd8
         D2vKBn7QVzQAOQlgxz28eBiYRXcstCpIpdsnjhzMJxFcjkq24sbEli+2FaXtJzbS1qoj
         Ea3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6V/aV/+k1BBD/HPURXTodsmTL76rHoEie/dN99q9HdQ=;
        b=odXocWW3hrD6a5SwMRX6aVoZn9AujWXzNpyNPnYMk0tHIKGROzarMprDzmceTV4vkA
         H3I+ZEK0HzCbjQw0DQOPUvuScpXSc/mJ59NXMwKd4hGPWf0F2t2GUvlUrG0t7cS4QrAr
         x+N1pIiwJKApQZedzWEJM82nYyYnXbxBf8+D+WNfuYs6q9/wHImouF7N/q0p9il2Zs+S
         93JuXXLQytWOzLIYWDr9iEdt4zw8wDFn5llfcGph2443XNFc0Z4iioQrnp5/guP5GsFi
         VRi3xNhDt9Go7FEnBqSeS1pD76rOVa92Ye4flnVZO3aCYt8tDi4OEYeP1TjFRUqFrSwq
         hx/Q==
X-Gm-Message-State: APzg51AXNgjp1bo1tdSabTvJtLvPJFZeu++NDp8utbEBxxwBfLJ8iyke
        7ngyKJmFCWIC5DZ6TCCuMBBjCxd67eSqy1Tk5neiWQ==
X-Google-Smtp-Source: ANB0Vdb9hO0g8/W63eFHHmGNqqbDr1jEzmr4V5NPX48jMeiuxzdN7Hm2KOhpmvq57yJsgZH0d3rrYtUUMq6Nuc2AinU=
X-Received: by 2002:aca:a94c:: with SMTP id s73-v6mr3047079oie.68.1536773997185;
 Wed, 12 Sep 2018 10:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535462971.git.andreyknvl@google.com> <f5e73b5ead3355932ad8b5fc96b141c3f5b8c16c.1535462971.git.andreyknvl@google.com>
 <CACT4Y+aEwYiaVN--RH_0VBh0wbCcrf-Ndz+_eOaBNi6nKxrfQA@mail.gmail.com>
In-Reply-To: <CACT4Y+aEwYiaVN--RH_0VBh0wbCcrf-Ndz+_eOaBNi6nKxrfQA@mail.gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 12 Sep 2018 19:39:30 +0200
Message-ID: <CAG48ez2oT1dtDcH8SfPLnoX5F8d6Pd=M-eOKHhYJ83EuL_j6wQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] khwasan, arm64: add brk handler for inline instrumentation
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>, dave.martin@arm.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>, geert@linux-m68k.org,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kstewart@linuxfoundation.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>, linux-kbuild@vger.kernel.org,
        Kostya Serebryany <kcc@google.com>,
        Evgenii Stepanov <eugenis@google.com>, Lee.Smith@arm.com,
        Ramana.Radhakrishnan@arm.com, Jacob.Bramley@arm.com,
        Ruben.Ayrapetyan@arm.com, Mark Brand <markbrand@google.com>,
        cpandya@codeaurora.org, Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 12, 2018 at 7:16 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Aug 29, 2018 at 1:35 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
[...]
> > +static int khwasan_handler(struct pt_regs *regs, unsigned int esr)
> > +{
> > +       bool recover = esr & KHWASAN_ESR_RECOVER;
> > +       bool write = esr & KHWASAN_ESR_WRITE;
> > +       size_t size = KHWASAN_ESR_SIZE(esr);
> > +       u64 addr = regs->regs[0];
> > +       u64 pc = regs->pc;
> > +
> > +       if (user_mode(regs))
> > +               return DBG_HOOK_ERROR;
> > +
> > +       kasan_report(addr, size, write, pc);
> > +
> > +       /*
> > +        * The instrumentation allows to control whether we can proceed after
> > +        * a crash was detected. This is done by passing the -recover flag to
> > +        * the compiler. Disabling recovery allows to generate more compact
> > +        * code.
> > +        *
> > +        * Unfortunately disabling recovery doesn't work for the kernel right
> > +        * now. KHWASAN reporting is disabled in some contexts (for example when
> > +        * the allocator accesses slab object metadata; same is true for KASAN;
> > +        * this is controlled by current->kasan_depth). All these accesses are
> > +        * detected by the tool, even though the reports for them are not
> > +        * printed.
> > +        *
> > +        * This is something that might be fixed at some point in the future.
> > +        */
> > +       if (!recover)
> > +               die("Oops - KHWASAN", regs, 0);
>
> Why die and not panic? Die seems to be much less used function, and it
> calls panic anyway, and we call panic in kasan_report if panic_on_warn
> is set.

die() is vaguely equivalent to BUG(); die() and BUG() normally only
terminate the current process, which may or may not leave the system
somewhat usable, while panic() always brings down the whole system.
AFAIK panic() shouldn't be used unless you're in some very low-level
code where you know that trying to just kill the current process can't
work and the entire system is broken beyond repair.

If KASAN traps on some random memory access, there's a good chance
that just killing the current process will allow at least parts of the
system to continue. I'm not sure whether BUG() or die() is more
appropriate here, but I think it definitely should not be a panic().
