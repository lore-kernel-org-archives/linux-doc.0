Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1939D7D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 20:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbeIOCH3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 22:07:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:6051 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbeIOCH3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 Sep 2018 22:07:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Sep 2018 13:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,374,1531810800"; 
   d="scan'208";a="91835832"
Received: from 2b52.sc.intel.com ([143.183.136.51])
  by orsmga002.jf.intel.com with ESMTP; 14 Sep 2018 13:51:20 -0700
Message-ID: <1536958012.12990.14.camel@intel.com>
Subject: Re: [RFC PATCH v3 19/24] x86/cet/shstk: Introduce WRUSS instruction
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Jann Horn <jannh@google.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Date:   Fri, 14 Sep 2018 13:46:52 -0700
In-Reply-To: <CALCETrV_aDasfkd6LD1cT11Hs1dO064uHjROLQPyhQfy_iuS8w@mail.gmail.com>
References: <20180830143904.3168-1-yu-cheng.yu@intel.com>
         <20180830143904.3168-20-yu-cheng.yu@intel.com>
         <CAG48ez3uZrC-9uJ0uMoVPTtxRXRN8D+3zs5FknZD2woTT6mazg@mail.gmail.com>
         <CALCETrW78UKt6AQJeN8GkhtxjuASnH1PV5QSpzQtDz9-2d3Asw@mail.gmail.com>
         <1535646146.26689.11.camel@intel.com> <1535752180.31230.4.camel@intel.com>
         <CALCETrV_aDasfkd6LD1cT11Hs1dO064uHjROLQPyhQfy_iuS8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-08-31 at 15:16 -0700, Andy Lutomirski wrote:
> On Fri, Aug 31, 2018 at 2:49 PM, Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > 
> > On Thu, 2018-08-30 at 09:22 -0700, Yu-cheng Yu wrote:
> > > 
> > > On Thu, 2018-08-30 at 08:55 -0700, Andy Lutomirski wrote:
> > > > 
> > > > 
> > > > On Thu, Aug 30, 2018 at 8:39 AM, Jann Horn <jannh@google.com>
> > > > wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On Thu, Aug 30, 2018 at 4:44 PM Yu-cheng Yu <yu-cheng.yu@intel.c
> > > > > om
> > > > > > 
> > > > > > 
> > > > > > wrote:
> > > > > > 
> > > > > > 
> > > > > > WRUSS is a new kernel-mode instruction but writes directly
> > > > > > to user shadow stack memory.  This is used to construct
> > > > > > a return address on the shadow stack for the signal
> > > > > > handler.
> > > > > > 
> > > > > > This instruction can fault if the user shadow stack is
> > > > > > invalid shadow stack memory.  In that case, the kernel does
> > > > > > fixup.
> > > > > > 
> > > > > > Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > > > > [...]
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > +static inline int write_user_shstk_64(unsigned long addr,
> > > > > > unsigned long val)
> > > > > > +{
> > > > > > +       int err = 0;
> > > > > > +
> > > > > > +       asm volatile("1: wrussq %1, (%0)\n"
> > > > > > +                    "2:\n"
> > > > > > +                    _ASM_EXTABLE_HANDLE(1b, 2b,
> > > > > > ex_handler_wruss)
> > > > > > +                    :
> > > > > > +                    : "r" (addr), "r" (val));
> > > > > > +
> > > > > > +       return err;
> > > > > > +}
> > > > > What's up with "err"? You set it to zero, and then you return
> > > > > it,
> > > > > but
> > > > > nothing can ever set it to non-zero, right?
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > +__visible bool ex_handler_wruss(const struct
> > > > > > exception_table_entry *fixup,
> > > > > > +                               struct pt_regs *regs, int
> > > > > > trapnr)
> > > > > > +{
> > > > > > +       regs->ip = ex_fixup_addr(fixup);
> > > > > > +       regs->ax = -1;
> > > > > > +       return true;
> > > > > > +}
> > > > > And here you just write into regs->ax, but your "asm volatile"
> > > > > doesn't
> > > > > reserve that register. This looks wrong to me.
> > > > > 
> > > > > I think you probably want to add something like an explicit
> > > > > `"+&a"(err)` output to the asm statements.
> > > > We require asm goto support these days.  How about using
> > > > that?  You
> > > > won't even need a special exception handler.
> > Maybe something like this?  It looks simple now.
> > 
> > static inline int write_user_shstk_64(unsigned long addr, unsigned
> > long val)
> > {
> >         asm_volatile_goto("wrussq %1, (%0)\n"
> >                      "jmp %l[ok]\n"
> >                      ".section .fixup,\"ax\"n"
> >                      "jmp %l[fail]\n"
> >                      ".previous\n"
> >                      :: "r" (addr), "r" (val)
> >                      :: ok, fail);
> > ok:
> >         return 0;
> > fail:
> >         return -1;
> > }
> > 
> I think you can get rid of 'jmp %l[ok]' and the ok label and just fall
> through.  And you don't need an explicit jmp to fail -- just set the
> _EX_HANDLER entry to land on the fail label.

Thanks!  This now looks simple and much better.

Yu-cheng



+static inline int write_user_shstk_64(unsigned long addr, unsigned long val)
+{
+	asm_volatile_goto("1: wrussq %1, (%0)\n"
+			  _ASM_EXTABLE(1b, %l[fail])
+			  :: "r" (addr), "r" (val)
+			  :: fail);
+	return 0;
+fail:
+	return -1;
+}

