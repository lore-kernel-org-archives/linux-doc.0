Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D53357D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Jul 2018 23:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733154AbeGLXPY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 19:15:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:10312 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732493AbeGLXPY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 12 Jul 2018 19:15:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jul 2018 16:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,345,1526367600"; 
   d="scan'208";a="66542265"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2018 16:03:38 -0700
Message-ID: <1531436398.2965.18.camel@intel.com>
Subject: Re: [RFC PATCH v2 18/27] x86/cet/shstk: Introduce WRUSS instruction
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Thu, 12 Jul 2018 15:59:58 -0700
In-Reply-To: <bbb487cc-ac1c-f734-eee3-2463a0ba7efc@linux.intel.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
         <20180710222639.8241-19-yu-cheng.yu@intel.com>
         <bbb487cc-ac1c-f734-eee3-2463a0ba7efc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-07-10 at 16:48 -0700, Dave Hansen wrote:
> > 
> > +/*
> > + * WRUSS is a kernel instrcution and but writes to user
> > + * shadow stack memory.  When a fault occurs, both
> > + * X86_PF_USER and X86_PF_SHSTK are set.
> > + */
> > +static int is_wruss(struct pt_regs *regs, unsigned long error_code)
> > +{
> > +	return (((error_code & (X86_PF_USER | X86_PF_SHSTK)) ==
> > +		(X86_PF_USER | X86_PF_SHSTK)) && !user_mode(regs));
> > +}
> I thought X86_PF_USER was set based on the mode in which the fault
> occurred.  Does this mean that the architecture of this bit is different
> now?

Yes.

> That seems like something we need to call out if so.  It also means we
> need to update the SDM because some of the text is wrong.

It needs to mention the WRUSS case.

> 
> > 
> >  static void
> >  show_fault_oops(struct pt_regs *regs, unsigned long error_code,
> >  		unsigned long address)
> > @@ -848,7 +859,7 @@ __bad_area_nosemaphore(struct pt_regs *regs, unsigned long error_code,
> >  	struct task_struct *tsk = current;
> >  
> >  	/* User mode accesses just cause a SIGSEGV */
> > -	if (error_code & X86_PF_USER) {
> > +	if ((error_code & X86_PF_USER) && !is_wruss(regs, error_code)) {
> >  		/*
> >  		 * It's possible to have interrupts off here:
> >  		 */
> This needs commenting about why is_wruss() is special.

Ok.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
