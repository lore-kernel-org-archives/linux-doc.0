Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E6FE27D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 21:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbeIOChz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 22:37:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:9165 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727762AbeIOChz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 Sep 2018 22:37:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Sep 2018 14:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,374,1531810800"; 
   d="scan'208";a="73321823"
Received: from 2b52.sc.intel.com ([143.183.136.51])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2018 14:21:40 -0700
Message-ID: <1536959832.12990.34.camel@intel.com>
Subject: Re: [RFC PATCH v3 05/24] Documentation/x86: Add CET description
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Pavel Machek <pavel@ucw.cz>
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
        Oleg Nesterov <oleg@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Fri, 14 Sep 2018 14:17:12 -0700
In-Reply-To: <20180830203948.GB1936@amd>
References: <20180830143904.3168-1-yu-cheng.yu@intel.com>
         <20180830143904.3168-6-yu-cheng.yu@intel.com> <20180830203948.GB1936@amd>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-08-30 at 22:39 +0200, Pavel Machek wrote:
> Hi!
> 
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt
> > b/Documentation/admin-guide/kernel-parameters.txt
> > index 9871e649ffef..b090787188b4 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2764,6 +2764,12 @@
> >  			noexec=on: enable non-executable mappings (default)
> >  			noexec=off: disable non-executable mappings
> >  
> > +	no_cet_ibt	[X86-64] Disable indirect branch tracking for
> > user-mode
> > +			applications
> > +
> > +	no_cet_shstk	[X86-64] Disable shadow stack support for user-
> > mode
> > +			applications
> Hmm, not too consistent with "nosmap" below. Would it make sense to
> have cet=on/off/ibt/shstk instead?

We also have noxsave, noxsaveopt, noxsaves, etc.  This style is more decisive?
If "cet=" is preferred, we can change it later?

Yu-cheng
