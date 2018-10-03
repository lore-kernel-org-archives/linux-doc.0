Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7537C7D087
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 15:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbeJCV4b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 17:56:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50638 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbeJCV4b (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Oct 2018 17:56:31 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.26])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E4DDCC05D41D;
        Wed,  3 Oct 2018 15:07:43 +0000 (UTC)
Received: from asgard.redhat.com (ovpn-200-34.brq.redhat.com [10.40.200.34])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D67F83001659;
        Wed,  3 Oct 2018 15:07:34 +0000 (UTC)
Date:   Wed, 3 Oct 2018 17:08:03 +0200
From:   Eugene Syromiatnikov <esyr@redhat.com>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
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
Subject: Re: [RFC PATCH v4 18/27] x86/cet/shstk: User-mode shadow stack
 support
Message-ID: <20181003150754.GC32759@asgard.redhat.com>
References: <20180921150351.20898-1-yu-cheng.yu@intel.com>
 <20180921150351.20898-19-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180921150351.20898-19-yu-cheng.yu@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 03 Oct 2018 15:07:44 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 21, 2018 at 08:03:42AM -0700, Yu-cheng Yu wrote:

> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 5ea1d64cb0b4..b20450dde5b7 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -652,6 +652,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  		[ilog2(VM_PKEY_BIT4)]	= "",
>  #endif
>  #endif /* CONFIG_ARCH_HAS_PKEYS */
> +#ifdef CONFIG_X86_INTEL_SHADOW_STACK_USER
> +		[ilog2(VM_SHSTK)]	= "ss"
> +#endif

It's probably makes sense to have this hunk as a part of "x86/cet/shstk:
Add Kconfig option for user-mode shadow stack", where VM_SHSTK was
initially introduced.
