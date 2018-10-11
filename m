Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 47F5A7D087
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 20:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbeJLEWq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 00:22:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:50401 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbeJLEWp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 00:22:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2018 13:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,369,1534834800"; 
   d="scan'208";a="98441634"
Received: from 2b52.sc.intel.com ([143.183.136.147])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2018 13:53:47 -0700
Message-ID: <c61b4c393f938ee6e97f84d97ed76867ae75cb02.camel@intel.com>
Subject: Re: [PATCH v5 07/27] mm/mmap: Create a guard area between VMAs
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Jann Horn <jannh@google.com>, Andy Lutomirski <luto@amacapital.net>
Cc:     the arch/x86 maintainers <x86@kernel.org>,
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
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>, rdunlap@infradead.org,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com,
        Daniel Micay <danielmicay@gmail.com>
Date:   Thu, 11 Oct 2018 13:49:00 -0700
In-Reply-To: <CAG48ez3R7XL8MX_sjff1FFYuARX_58wA_=ACbv2im-XJKR8tvA@mail.gmail.com>
References: <20181011151523.27101-1-yu-cheng.yu@intel.com>
         <20181011151523.27101-8-yu-cheng.yu@intel.com>
         <CAG48ez3R7XL8MX_sjff1FFYuARX_58wA_=ACbv2im-XJKR8tvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-10-11 at 22:39 +0200, Jann Horn wrote:
> On Thu, Oct 11, 2018 at 5:20 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > Create a guard area between VMAs to detect memory corruption.
> 
> [...]
> > +config VM_AREA_GUARD
> > +       bool "VM area guard"
> > +       default n
> > +       help
> > +         Create a guard area between VM areas so that access beyond
> > +         limit can be detected.
> > +
> >  endmenu
> 
> Sorry to bring this up so late, but Daniel Micay pointed out to me
> that, given that VMA guards will raise the number of VMAs by
> inhibiting vma_merge(), people are more likely to run into
> /proc/sys/vm/max_map_count (which limits the number of VMAs to ~65k by
> default, and can't easily be raised without risking an overflow of
> page->_mapcount on systems with over ~800GiB of RAM, see
> https://lore.kernel.org/lkml/20180208021112.GB14918@bombadil.infradead.org/
> and replies) with this change.

Can we use the VMA guard only for Shadow Stacks?

Yu-cheng
