Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 235B37D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Jun 2018 16:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933744AbeFLQYj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Jun 2018 12:24:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:50792 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933363AbeFLQYi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jun 2018 12:24:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2018 09:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,215,1526367600"; 
   d="scan'208";a="47184132"
Received: from 2b52.sc.intel.com (HELO [143.183.136.147]) ([143.183.136.147])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2018 09:24:37 -0700
Message-ID: <1528820489.9324.14.camel@2b52.sc.intel.com>
Subject: Re: [PATCH 00/10] Control Flow Enforcement - Part (3)
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     bsingharora@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
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
Date:   Tue, 12 Jun 2018 09:21:29 -0700
In-Reply-To: <CALCETrXK6hypCb5sXwxWRKr=J6_7XtS6s5GB1WPBiqi79q8-8g@mail.gmail.com>
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
         <bbfde1b3-5e1b-80e3-30e8-fd1e46a2ceb1@gmail.com>
         <1528815820.8271.16.camel@2b52.sc.intel.com>
         <CALCETrXK6hypCb5sXwxWRKr=J6_7XtS6s5GB1WPBiqi79q8-8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-06-12 at 09:00 -0700, Andy Lutomirski wrote:
> On Tue, Jun 12, 2018 at 8:06 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> >
> > On Tue, 2018-06-12 at 20:56 +1000, Balbir Singh wrote:
> > >
> > > On 08/06/18 00:37, Yu-cheng Yu wrote:
> > > > This series introduces CET - Shadow stack
> > > >
> > > > At the high level, shadow stack is:
> > > >
> > > >     Allocated from a task's address space with vm_flags VM_SHSTK;
> > > >     Its PTEs must be read-only and dirty;
> > > >     Fixed sized, but the default size can be changed by sys admin.
> > > >
> > > > For a forked child, the shadow stack is duplicated when the next
> > > > shadow stack access takes place.
> > > >
> > > > For a pthread child, a new shadow stack is allocated.
> > > >
> > > > The signal handler uses the same shadow stack as the main program.
> > > >
> > >
> > > Even with sigaltstack()?
> > >
> > >
> > > Balbir Singh.
> >
> > Yes.
> >
> 
> I think we're going to need some provision to add an alternate signal
> stack to handle the case where the shadow stack overflows.

The shadow stack stores only return addresses; its consumption will not
exceed a percentage of (program stack size + sigaltstack size) before
those overflow.  When that happens, there is usually very little we can
do.  So we set a default shadow stack size that supports certain nested
calls and allow sys admin to adjust it.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
