Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68DCD7D8D4
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 12:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbeLFM0H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 07:26:07 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34292 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729909AbeLFM0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 07:26:07 -0500
Received: by mail-io1-f66.google.com with SMTP id r9so223018ioa.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 04:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wcrQnAPF661+3WixbW/biGMry6TOjJEviqadHK67u1g=;
        b=HmoGJlRIzBGjTI45c6oZZWLJ27CVota+y9lZnaIsdIwFfftDE7rpBoZpiV81DpW8E5
         bbbZYB/VJq7jFDkIkODJxkM3IF6YadZuGC/qRwXJP9f62FgsVCDuHjXhnBihZhIJ/kzJ
         ijdLXpZMnjydMB5b0mgfN+X3h7uOXtsClC2AN1sXVvipVgnPbKk76xGdmLRK4ap3xQ/O
         YElv6bsfYZYa+Zd6qnV6DwOmTbb0LvEUGzkjH9esFyq4N/gqsIa3+0kdORAXODRkS0A1
         Te4u9veYTWfdeWYC4NlC1HZfzLvHS7zt88QxWijgLt9P3lEYMEDW28wpHbxPz356g1Er
         +4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wcrQnAPF661+3WixbW/biGMry6TOjJEviqadHK67u1g=;
        b=Gv0IwELe2PnDxUmrJYKDX/toKQFTc+25cUWQ1Qw3jEwBi+HnX9ZU2rh/rYmcGDKaX5
         fbPZg1jbSGn8QND42Ouzvnn1h++6XhPPmsr7GFIPE4sGCgFIrASOEiQqGR0nzaNiOZWm
         6C5FIm5siUNOJ7xj6tAoXUtM6Sv3e7Ogr4UyYt7vRGLkiulD/wQJdQXO+zD/qALnrDrc
         dWXF/KsHaVbyi444BFCBeZxQfQVAqH9YyRyrHgqdxkEasx+g7wWDf1h+gH8d5BICLzwj
         gzaWvzaCt3vhU8BcqJsWuREy8lsu5aHyGYHYO66CMkPqB4cyEGXSYxySZoa+BnfQVNCH
         hgEA==
X-Gm-Message-State: AA+aEWaRgLeQUQCasHiPKacup4/5IC68NCpK6/n/N4+7nflWyAN2YtfO
        utxWudkLeSLx+wWmlnhy2mcp8r16YY4JrHknJGkc0g==
X-Google-Smtp-Source: AFSGD/XMruDrVJTKAoWkikR35kp0TkElzg8XSiJWXCLDTiuVscHdJFtYhqXFO5HCqhr+U+ZmpZE9vl5ADf7M7pl8HHs=
X-Received: by 2002:a5d:91d7:: with SMTP id k23mr26027272ior.31.1544099165799;
 Thu, 06 Dec 2018 04:26:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543337629.git.andreyknvl@google.com> <e825441eda1dbbbb7f583f826a66c94e6f88316a.1543337629.git.andreyknvl@google.com>
 <20181129180138.GB4318@arm.com> <CAAeHK+zVzWJ7RBsX88SOsebq0a40ypuawYFd4w4woFSHuximOw@mail.gmail.com>
 <20181206111107.GE23697@arm.com>
In-Reply-To: <20181206111107.GE23697@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 6 Dec 2018 13:25:54 +0100
Message-ID: <CAAeHK+w9NQYRHuNw-fAFDKVjF1L7pxTVRfe=DX1aC1iq5hYt1w@mail.gmail.com>
Subject: Re: [PATCH v12 20/25] kasan, arm64: add brk handler for inline instrumentation
To:     Will Deacon <will.deacon@arm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 6, 2018 at 12:10 PM Will Deacon <will.deacon@arm.com> wrote:
>
> On Thu, Dec 06, 2018 at 11:31:43AM +0100, Andrey Konovalov wrote:
> > On Thu, Nov 29, 2018 at 7:01 PM Will Deacon <will.deacon@arm.com> wrote:
> > >
> > > On Tue, Nov 27, 2018 at 05:55:38PM +0100, Andrey Konovalov wrote:
> > > > Tag-based KASAN inline instrumentation mode (which embeds checks of shadow
> > > > memory into the generated code, instead of inserting a callback) generates
> > > > a brk instruction when a tag mismatch is detected.
> > > >
> > > > This commit adds a tag-based KASAN specific brk handler, that decodes the
> > > > immediate value passed to the brk instructions (to extract information
> > > > about the memory access that triggered the mismatch), reads the register
> > > > values (x0 contains the guilty address) and reports the bug.
> > > >
> > > > Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > > ---
> > > >  arch/arm64/include/asm/brk-imm.h |  2 +
> > > >  arch/arm64/kernel/traps.c        | 68 +++++++++++++++++++++++++++++++-
> > > >  include/linux/kasan.h            |  3 ++
> > > >  3 files changed, 71 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
> > > > index ed693c5bcec0..2945fe6cd863 100644
> > > > --- a/arch/arm64/include/asm/brk-imm.h
> > > > +++ b/arch/arm64/include/asm/brk-imm.h
> > > > @@ -16,10 +16,12 @@
> > > >   * 0x400: for dynamic BRK instruction
> > > >   * 0x401: for compile time BRK instruction
> > > >   * 0x800: kernel-mode BUG() and WARN() traps
> > > > + * 0x9xx: tag-based KASAN trap (allowed values 0x900 - 0x9ff)
> > > >   */
> > > >  #define FAULT_BRK_IMM                        0x100
> > > >  #define KGDB_DYN_DBG_BRK_IMM         0x400
> > > >  #define KGDB_COMPILED_DBG_BRK_IMM    0x401
> > > >  #define BUG_BRK_IMM                  0x800
> > > > +#define KASAN_BRK_IMM                        0x900
> > > >
> > > >  #endif
> > > > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > > > index 5f4d9acb32f5..04bdc53716ef 100644
> > > > --- a/arch/arm64/kernel/traps.c
> > > > +++ b/arch/arm64/kernel/traps.c
> > > > @@ -35,6 +35,7 @@
> > > >  #include <linux/sizes.h>
> > > >  #include <linux/syscalls.h>
> > > >  #include <linux/mm_types.h>
> > > > +#include <linux/kasan.h>
> > > >
> > > >  #include <asm/atomic.h>
> > > >  #include <asm/bug.h>
> > > > @@ -284,10 +285,14 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
> > > >       }
> > > >  }
> > > >
> > > > -void arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
> > > > +void __arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
> > > >  {
> > > >       regs->pc += size;
> > > > +}
> > > >
> > > > +void arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
> > > > +{
> > > > +     __arm64_skip_faulting_instruction(regs, size);
> > > >       /*
> > > >        * If we were single stepping, we want to get the step exception after
> > > >        * we return from the trap.
> > > > @@ -959,7 +964,7 @@ static int bug_handler(struct pt_regs *regs, unsigned int esr)
> > > >       }
> > > >
> > > >       /* If thread survives, skip over the BUG instruction and continue: */
> > > > -     arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
> > > > +     __arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
> > >
> > > Why do you want to avoid the single-step logic here? Given that we're
> > > skipping over the brk instruction, why wouldn't you want that to trigger
> > > a step exception if single-step is enabled?
> >
> > I was asked to do that, see the discussion here:
> >
> > https://www.spinics.net/lists/linux-mm/msg146575.html
> > https://www.spinics.net/lists/linux-mm/msg148215.html
> > https://www.spinics.net/lists/linux-mm/msg148367.html
>
> Aha, but we subsequently fixed the underlying problem in commit
> 9478f1927e6e ("arm64: only advance singlestep for user instruction traps").
> You were on cc, but I appreciate it's not clear that it was related to this.

Sorry, missed that patch.

> Anyway, you can just call arm64_skip_faulting_instruction() as you were
> doing and there's no need for this refactoring.
>
> Please could you spin a new version so that akpm can replace the one which
> he has queued?

Done. Thanks!
