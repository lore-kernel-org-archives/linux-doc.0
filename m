Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56D417E686
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 16:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751556AbeCOQdB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 12:33:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:38854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751482AbeCOQdA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 12:33:00 -0400
Received: from vmware.local.home (ip-64-134-136-2.public.wayport.net [64.134.136.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3461E204EF;
        Thu, 15 Mar 2018 16:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3461E204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Thu, 15 Mar 2018 12:32:55 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com,
        gregkh@linuxfoundation.org, huawei.libin@huawei.com,
        hughd@google.com, jack@suse.cz, jglisse@redhat.com,
        jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 4/8] Uprobe: Export uprobe_map_info along with
 uprobe_{build/free}_map_info()
Message-ID: <20180315123255.17a8d997@vmware.local.home>
In-Reply-To: <20180313125603.19819-5-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-5-ravi.bangoria@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 18:25:59 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:

> These exported data structure and functions will be used by other
> files in later patches.

I'm reluctantly OK with the above.

> 
> No functionality changes.

Please remove this line. There are functionality changes. Turning a
static inline into an exported function *is* a functionality change.

-- Steve

> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
> ---
>  include/linux/uprobes.h |  9 +++++++++
>  kernel/events/uprobes.c | 14 +++-----------
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
> index 0a294e9..7bd2760 100644
> --- a/include/linux/uprobes.h
> +++ b/include/linux/uprobes.h
> @@ -109,12 +109,19 @@ enum rp_check {
>  	RP_CHECK_RET,
>  };
>  
> +struct address_space;
>  struct xol_area;
>  
>  struct uprobes_state {
>  	struct xol_area		*xol_area;
>  };
>  
> +struct uprobe_map_info {
> +	struct uprobe_map_info *next;
> +	struct mm_struct *mm;
> +	unsigned long vaddr;
> +};
> +
>  extern int set_swbp(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>  extern int set_orig_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
>  extern bool is_swbp_insn(uprobe_opcode_t *insn);
> @@ -149,6 +156,8 @@ struct uprobes_state {
>  extern bool arch_uprobe_ignore(struct arch_uprobe *aup, struct pt_regs *regs);
>  extern void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
>  					 void *src, unsigned long len);
> +extern struct uprobe_map_info *uprobe_free_map_info(struct uprobe_map_info *info);
> +extern struct uprobe_map_info *uprobe_build_map_info(struct address_space *mapping, loff_t offset, bool is_register);
>  #else /* !CONFIG_UPROBES */
>  struct uprobes_state {
>  };
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index 081b88c1..e7830b8 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -695,23 +695,15 @@ static void delete_uprobe(struct uprobe *uprobe)
>  	put_uprobe(uprobe);
>  }
>  
> -struct uprobe_map_info {
> -	struct uprobe_map_info *next;
> -	struct mm_struct *mm;
> -	unsigned long vaddr;
> -};
> -
> -static inline struct uprobe_map_info *
> -uprobe_free_map_info(struct uprobe_map_info *info)
> +struct uprobe_map_info *uprobe_free_map_info(struct uprobe_map_info *info)
>  {
>  	struct uprobe_map_info *next = info->next;
>  	kfree(info);
>  	return next;
>  }
>  
> -static struct uprobe_map_info *
> -uprobe_build_map_info(struct address_space *mapping, loff_t offset,
> -		      bool is_register)
> +struct uprobe_map_info *uprobe_build_map_info(struct address_space *mapping,
> +					      loff_t offset, bool is_register)
>  {
>  	unsigned long pgoff = offset >> PAGE_SHIFT;
>  	struct vm_area_struct *vma;

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
