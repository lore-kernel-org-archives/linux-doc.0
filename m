Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 510067D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 15:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbeJCWGA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 18:06:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:13896 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbeJCWF7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Oct 2018 18:05:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2018 08:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,336,1534834800"; 
   d="scan'208";a="78169137"
Received: from 2b52.sc.intel.com ([143.183.136.147])
  by orsmga007.jf.intel.com with ESMTP; 03 Oct 2018 08:17:08 -0700
Message-ID: <c4d78905d1914fc1d15c919fabff6f83756e4ab4.camel@intel.com>
Subject: Re: [RFC PATCH v4 18/27] x86/cet/shstk: User-mode shadow stack
 support
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Wed, 03 Oct 2018 08:12:29 -0700
In-Reply-To: <20181003150754.GC32759@asgard.redhat.com>
References: <20180921150351.20898-1-yu-cheng.yu@intel.com>
         <20180921150351.20898-19-yu-cheng.yu@intel.com>
         <20181003150754.GC32759@asgard.redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-10-03 at 17:08 +0200, Eugene Syromiatnikov wrote:
> On Fri, Sep 21, 2018 at 08:03:42AM -0700, Yu-cheng Yu wrote:
> 
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 5ea1d64cb0b4..b20450dde5b7 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -652,6 +652,9 @@ static void show_smap_vma_flags(struct seq_file *m,
> > struct vm_area_struct *vma)
> >  		[ilog2(VM_PKEY_BIT4)]	= "",
> >  #endif
> >  #endif /* CONFIG_ARCH_HAS_PKEYS */
> > +#ifdef CONFIG_X86_INTEL_SHADOW_STACK_USER
> > +		[ilog2(VM_SHSTK)]	= "ss"
> > +#endif
> 
> It's probably makes sense to have this hunk as a part of "x86/cet/shstk:
> Add Kconfig option for user-mode shadow stack", where VM_SHSTK was
> initially introduced.

Yes, move it to "mm/Introduce VM_SHSTK for shadow stack memory".

Yu-cheng
