Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 46D9C7D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 21:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732695AbeGKVM2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 17:12:28 -0400
Received: from mga03.intel.com ([134.134.136.65]:30442 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732552AbeGKVM1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Jul 2018 17:12:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jul 2018 14:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,339,1526367600"; 
   d="scan'208";a="66171654"
Received: from 2b52.sc.intel.com ([143.183.136.52])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2018 14:06:14 -0700
Message-ID: <1531342956.15351.38.camel@intel.com>
Subject: Re: [RFC PATCH v2 27/27] x86/cet: Add arch_prctl functions for CET
From:   Yu-cheng Yu <yu-cheng.yu@intel.com>
To:     Florian Weimer <fweimer@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Date:   Wed, 11 Jul 2018 14:02:36 -0700
In-Reply-To: <bbd9d3d7-a456-d161-6bc6-19e555edcd01@redhat.com>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
         <20180710222639.8241-28-yu-cheng.yu@intel.com>
         <bbd9d3d7-a456-d161-6bc6-19e555edcd01@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-07-11 at 14:19 +0200, Florian Weimer wrote:
> On 07/11/2018 12:26 AM, Yu-cheng Yu wrote:
> > 
> > arch_prctl(ARCH_CET_DISABLE, unsigned long features)
> >      Disable SHSTK and/or IBT specified in 'features'.  Return
> > -EPERM
> >      if CET is locked out.
> > 
> > arch_prctl(ARCH_CET_LOCK)
> >      Lock out CET feature.
> Isn't it a “lock in” rather than a “lock out”?

Yes, that makes more sense.  I will fix it.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
