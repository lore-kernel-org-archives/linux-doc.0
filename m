Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3EF27D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 19:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbeJLDCa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 23:02:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:5545 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbeJLDCa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Oct 2018 23:02:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2018 12:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,369,1534834800"; 
   d="scan'208";a="80728764"
Received: from 2b52.sc.intel.com ([143.183.136.147])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2018 12:33:49 -0700
Message-ID: <d068f923d45c26e4c0f91f4cf0eef8a02ae4a6b0.camel@intel.com>
Subject: Re: [PATCH v5 00/27] Control Flow Enforcement: Shadow Stack
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
        Eugene Syromiatnikov <esyr@redhat.com>,
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
Date:   Thu, 11 Oct 2018 12:29:03 -0700
In-Reply-To: <109d1600-340e-e3c2-ba11-1f6096212540@linux.intel.com>
References: <20181011151523.27101-1-yu-cheng.yu@intel.com>
         <109d1600-340e-e3c2-ba11-1f6096212540@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-10-11 at 12:21 -0700, Dave Hansen wrote:
> On 10/11/2018 08:14 AM, Yu-cheng Yu wrote:
> > The previous version of CET Shadow Stack patches is at the following
> > link:
> > 
> >   https://lkml.org/lkml/2018/9/21/776
> 
> Why are you posting these?  Do you want more review?  Do you simply want
> the series applied?

Thanks, Dave!


Hi Maintainers,

If there are no more major issues, can we get these applied?

Currently the IBT bitmap allocation (in the IBT series) works with GLIBC.
If GLIBC developers agree to mmap() the bitmap in dlopen(), I will submit an
additional patch to change how the kernel handles it.

Thanks,
Yu-cheng
