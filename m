Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 86C207D062
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 20:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753057AbeFGUPn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 16:15:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:14891 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752602AbeFGUPn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 16:15:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2018 13:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,487,1520924400"; 
   d="scan'208";a="235596131"
Received: from 2b52.sc.intel.com (HELO [143.183.136.51]) ([143.183.136.51])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2018 13:15:41 -0700
Message-ID: <1528402350.5265.21.camel@2b52.sc.intel.com>
Subject: Re: [PATCH 03/10] x86/cet: Signal handling for shadow stack
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Dmitry Safonov <dsafonov@virtuozzo.com>,
        Cyrill Gorcunov <gorcunov@openvz.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Date:   Thu, 07 Jun 2018 13:12:30 -0700
In-Reply-To: <CALCETrWo77RS_wOzskw5OG-LdC1S-b_NY=uPWUmPbQEnNwANgQ@mail.gmail.com>
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
         <20180607143807.3611-4-yu-cheng.yu@intel.com>
         <CALCETrWo77RS_wOzskw5OG-LdC1S-b_NY=uPWUmPbQEnNwANgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-06-07 at 11:30 -0700, Andy Lutomirski wrote:
> On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> >
> > Set and restore shadow stack pointer for signals.
> 
> How does this interact with siglongjmp()?
> 
> This patch makes me extremely nervous due to the possibility of ABI
> issues and CRIU breakage.

Longjmp/Siglongjmp is handled in GLIBC and basically the shadow stack
pointer is unwound.  There could be some unexpected conditions.
However, we run all GLIBC tests.

> 
> > diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
> > index 844d60eb1882..6c8997a0156a 100644
> > --- a/arch/x86/include/uapi/asm/sigcontext.h
> > +++ b/arch/x86/include/uapi/asm/sigcontext.h
> > @@ -230,6 +230,7 @@ struct sigcontext_32 {
> >         __u32                           fpstate; /* Zero when no FPU/extended context */
> >         __u32                           oldmask;
> >         __u32                           cr2;
> > +       __u32                           ssp;
> >  };
> >
> >  /*
> > @@ -262,6 +263,7 @@ struct sigcontext_64 {
> >         __u64                           trapno;
> >         __u64                           oldmask;
> >         __u64                           cr2;
> > +       __u64                           ssp;
> >
> >         /*
> >          * fpstate is really (struct _fpstate *) or (struct _xstate *)
> > @@ -320,6 +322,7 @@ struct sigcontext {
> >         struct _fpstate __user          *fpstate;
> >         __u32                           oldmask;
> >         __u32                           cr2;
> > +       __u32                           ssp;
> 
> Is it actually okay to modify these structures like this?  They're
> part of the user ABI, and I don't know whether any user code relies on
> the size being constant.
> 
> > +int cet_push_shstk(int ia32, unsigned long ssp, unsigned long val)
> > +{
> > +       if (val >= TASK_SIZE)
> > +               return -EINVAL;
> 
> TASK_SIZE_MAX.  But I'm a bit unsure why you need this check at all.

If an invalid address is put on the shadow stack, the task will get a
control protection fault.  I will change it to TASK_SIZE_MAX.

> 
> > +int cet_restore_signal(unsigned long ssp)
> > +{
> > +       if (!current->thread.cet.shstk_enabled)
> > +               return 0;
> > +       return cet_set_shstk_ptr(ssp);
> > +}
> 
> This will blow up if the shadow stack enabled state changes in a
> signal handler.  Maybe we don't care.

Yes, the task will get a control protection fault.



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
