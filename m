Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AD447DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 17:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756433AbeDZRrX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 13:47:23 -0400
Received: from foss.arm.com ([217.140.101.70]:57214 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754569AbeDZRrW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Apr 2018 13:47:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 244491435;
        Thu, 26 Apr 2018 10:47:22 -0700 (PDT)
Received: from armageddon.cambridge.arm.com (armageddon.cambridge.arm.com [10.1.206.84])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E5BF3F487;
        Thu, 26 Apr 2018 10:47:17 -0700 (PDT)
Date:   Thu, 26 Apr 2018 18:47:14 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Subject: Re: [PATCH 4/6] mm, arm64: untag user addresses in mm/gup.c
Message-ID: <20180426174714.4jtb72q56w3xonsa@armageddon.cambridge.arm.com>
References: <cover.1524077494.git.andreyknvl@google.com>
 <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db34d04fa16be162336106e3b4a94f3dacc0af4.1524077494.git.andreyknvl@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 18, 2018 at 08:53:13PM +0200, Andrey Konovalov wrote:
> diff --git a/mm/gup.c b/mm/gup.c
> index 76af4cfeaf68..fb375de7d40d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -386,6 +386,8 @@ struct page *follow_page_mask(struct vm_area_struct *vma,
>  	struct page *page;
>  	struct mm_struct *mm = vma->vm_mm;
>  
> +	address = untagged_addr(address);
> +
>  	*page_mask = 0;
>  
>  	/* make this handle hugepd */

Does having a tagged address here makes any difference? I couldn't hit a
failure with my simple tests (LD_PRELOAD a library that randomly adds
tags to pointers returned by malloc).

> @@ -647,6 +649,8 @@ static long __get_user_pages(struct task_struct *tsk, struct mm_struct *mm,
>  	if (!nr_pages)
>  		return 0;
>  
> +	start = untagged_addr(start);
> +
>  	VM_BUG_ON(!!pages != !!(gup_flags & FOLL_GET));
>  
>  	/*
> @@ -801,6 +805,8 @@ int fixup_user_fault(struct task_struct *tsk, struct mm_struct *mm,
>  	struct vm_area_struct *vma;
>  	int ret, major = 0;
>  
> +	address = untagged_addr(address);
> +
>  	if (unlocked)
>  		fault_flags |= FAULT_FLAG_ALLOW_RETRY;
>  
> @@ -854,6 +860,8 @@ static __always_inline long __get_user_pages_locked(struct task_struct *tsk,
>  	long ret, pages_done;
>  	bool lock_dropped;
>  
> +	start = untagged_addr(start);
> +
>  	if (locked) {
>  		/* if VM_FAULT_RETRY can be returned, vmas become invalid */
>  		BUG_ON(vmas);

Isn't __get_user_pages() untagging enough to cover this case as well?
Can this function not cope with tagged pointers?

> @@ -1751,6 +1759,8 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  	unsigned long flags;
>  	int nr = 0;
>  
> +	start = untagged_addr(start);
> +
>  	start &= PAGE_MASK;
>  	addr = start;
>  	len = (unsigned long) nr_pages << PAGE_SHIFT;
> @@ -1803,6 +1813,8 @@ int get_user_pages_fast(unsigned long start, int nr_pages, int write,
>  	unsigned long addr, len, end;
>  	int nr = 0, ret = 0;
>  
> +	start = untagged_addr(start);
> +
>  	start &= PAGE_MASK;
>  	addr = start;
>  	len = (unsigned long) nr_pages << PAGE_SHIFT;

Have you hit a problem with the fast gup functions and tagged pointers?
The page table walking macros (e.g. p*d_index()) should mask the tag out
already.

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
