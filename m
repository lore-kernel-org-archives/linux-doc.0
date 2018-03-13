Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AEDD7E66E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 20:40:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753150AbeCMUkd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 16:40:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59400 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752675AbeCMUkc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Mar 2018 16:40:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4C7408182D16;
        Tue, 13 Mar 2018 20:40:31 +0000 (UTC)
Received: from redhat.com (ovpn-121-215.rdu2.redhat.com [10.10.121.215])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B1981C725;
        Tue, 13 Mar 2018 20:40:26 +0000 (UTC)
Date:   Tue, 13 Mar 2018 16:40:25 -0400
From:   Jerome Glisse <jglisse@redhat.com>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com,
        gregkh@linuxfoundation.org, huawei.libin@huawei.com,
        hughd@google.com, jack@suse.cz, jolsa@redhat.com,
        kan.liang@intel.com, kirill.shutemov@linux.intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mhocko@suse.com, milian.wolff@kdab.com,
        mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 4/8] Uprobe: Export uprobe_map_info along with
 uprobe_{build/free}_map_info()
Message-ID: <20180313204024.GJ3828@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-5-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180313125603.19819-5-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 13 Mar 2018 20:40:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Tue, 13 Mar 2018 20:40:31 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'jglisse@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 13, 2018 at 06:25:59PM +0530, Ravi Bangoria wrote:
> These exported data structure and functions will be used by other
> files in later patches.
> 
> No functionality changes.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>

Reviewed-by: Jérôme Glisse <jglisse@redhat.com>

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
> -- 
> 1.8.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
