Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9D0007DE80
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 14:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388586AbeGKPCB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 11:02:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:44545 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388430AbeGKPCB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Jul 2018 11:02:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jul 2018 07:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; 
   d="scan'208";a="239526669"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by orsmga005.jf.intel.com with ESMTP; 11 Jul 2018 07:57:14 -0700
Message-ID: <1531320817.13297.1.camel@intel.com>
Subject: Re: [RFC PATCH v2 05/27] Documentation/x86: Add CET description
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     "H.J. Lu" <hjl.tools@gmail.com>,
        Florian Weimer <fweimer@redhat.com>
Cc:     the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Wed, 11 Jul 2018 07:53:37 -0700
In-Reply-To: <CAMe9rOqo3ZSMuwNZf8HbrL72OY1aQ0S0Huwqj7rsVY9_ZOfF_A@mail.gmail.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
         <20180710222639.8241-6-yu-cheng.yu@intel.com>
         <ae3e2013-9c90-af39-f9da-278bf7af6f73@redhat.com>
         <CAMe9rOqo3ZSMuwNZf8HbrL72OY1aQ0S0Huwqj7rsVY9_ZOfF_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-07-11 at 06:47 -0700, H.J. Lu wrote:
> On Wed, Jul 11, 2018 at 2:57 AM, Florian Weimer <fweimer@redhat.com>
> wrote:
> > 
> > On 07/11/2018 12:26 AM, Yu-cheng Yu wrote:
> > 
> > > 
> > > +To build a CET-enabled kernel, Binutils v2.30 and GCC v8.1 or
> > > later
> > > +are required.  To build a CET-enabled application, GLIBC v2.29
> > > or
> > > +later is also requried.
> > 
> > Have you given up on getting the required changes into glibc 2.28?
> > 
> This is a typo.  We are still targeting for 2.28.  All pieces are
> there.
> 

Ok, I will fix it.

Yu-cheng
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
