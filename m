Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D50127DE80
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Jul 2018 18:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731948AbeGMSQO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Jul 2018 14:16:14 -0400
Received: from mga04.intel.com ([192.55.52.120]:15917 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730149AbeGMSQO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Jul 2018 14:16:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jul 2018 11:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,348,1526367600"; 
   d="scan'208";a="215814726"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by orsmga004.jf.intel.com with ESMTP; 13 Jul 2018 11:00:30 -0700
Message-ID: <1531504609.11680.16.camel@intel.com>
Subject: Re: [RFC PATCH v2 22/27] x86/cet/ibt: User-mode indirect branch
 tracking support
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
Date:   Fri, 13 Jul 2018 10:56:49 -0700
In-Reply-To: <25675609-9ea7-55fb-6e73-b4a4c49b6c35@linux.intel.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
         <20180710222639.8241-23-yu-cheng.yu@intel.com>
         <3a7e9ce4-03c6-cc28-017b-d00108459e94@linux.intel.com>
         <1531347019.15351.89.camel@intel.com>
         <f97ce234-52fa-e666-2250-098925cf3c39@linux.intel.com>
         <1531350028.15351.102.camel@intel.com>
         <25675609-9ea7-55fb-6e73-b4a4c49b6c35@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-07-11 at 16:16 -0700, Dave Hansen wrote:
> On 07/11/2018 04:00 PM, Yu-cheng Yu wrote:
> > 
> > On Wed, 2018-07-11 at 15:40 -0700, Dave Hansen wrote:
> > > 
> > > On 07/11/2018 03:10 PM, Yu-cheng Yu wrote:
> > > > 
> > > > 
> > > > On Tue, 2018-07-10 at 17:11 -0700, Dave Hansen wrote:
> > > > > 
> > > > > 
> > > > > Is this feature *integral* to shadow stacks?  Or, should it just
> > > > > be
> > > > > in a
> > > > > different series?
> > > > The whole CET series is mostly about SHSTK and only a minority for
> > > > IBT.
> > > > IBT changes cannot be applied by itself without first applying
> > > > SHSTK
> > > > changes.  Would the titles help, e.g. x86/cet/ibt, x86/cet/shstk,
> > > > etc.?
> > > That doesn't really answer what I asked, though.
> > > 
> > > Do shadow stacks *require* IBT?  Or, should we concentrate on merging
> > > shadow stacks themselves first and then do IBT at a later time, in a
> > > different patch series?
> > > 
> > > But, yes, better patch titles would help, although I'm not sure
> > > that's
> > > quite the format that Ingo and Thomas prefer.
> > Shadow stack does not require IBT, but they complement each other.  If
> > we can resolve the legacy bitmap, both features can be merged at the
> > same time.
> As large as this patch set is, I'd really prefer to see you get shadow
> stacks merged and then move on to IBT.  I say separate them.

Ok, separate them.

> 
> > 
> > GLIBC does the bitmap setup.  It sets bits in there.
> > I thought you wanted a smaller bitmap?  One way is forcing legacy libs
> > to low address, or not having the bitmap at all, i.e. turn IBT off.
> I'm concerned with two things:
> 1. the virtual address space consumption, especially the *default* case
>    which will be apps using 4-level address space amounts, but having
>    5-level-sized tables.
> 2. the driving a truck-sized hole in the address space limits
> 
> You can force legacy libs to low addresses, but you can't stop anyone
> from putting code into a high address *later*, at least with the code we
> have today.

So we will always reserve a big space for all CET tasks?

Currently if an application does dlopen() a legacy lib, it will have only
partial IBT protection and no SHSTK.  Do we want to consider simply turning
off IBT in that case?

Yu-cheng

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
