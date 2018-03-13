Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E278B7E66E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 20:37:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752280AbeCMUhG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 16:37:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46748 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752149AbeCMUhF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Mar 2018 16:37:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AF7E984256;
        Tue, 13 Mar 2018 20:37:04 +0000 (UTC)
Received: from redhat.com (ovpn-121-215.rdu2.redhat.com [10.10.121.215])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5B750335;
        Tue, 13 Mar 2018 20:36:58 +0000 (UTC)
Date:   Tue, 13 Mar 2018 16:36:57 -0400
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
Subject: Re: [PATCH 1/8] Uprobe: Export vaddr <-> offset conversion functions
Message-ID: <20180313203657.GG3828@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-2-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180313125603.19819-2-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 13 Mar 2018 20:37:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 13 Mar 2018 20:37:04 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'jglisse@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 13, 2018 at 06:25:56PM +0530, Ravi Bangoria wrote:
> No functionality changes.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>

Reviewed-by: Jérôme Glisse <jglisse@redhat.com>

> ---
>  include/linux/mm.h      | 12 ++++++++++++
>  kernel/events/uprobes.c | 10 ----------
>  2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ad06d42..95909f2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2274,6 +2274,18 @@ struct vm_unmapped_area_info {
>  		return unmapped_area(info);
>  }
>  
> +static inline unsigned long
> +offset_to_vaddr(struct vm_area_struct *vma, loff_t offset)
> +{
> +	return vma->vm_start + offset - ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> +}
> +
> +static inline loff_t
> +vaddr_to_offset(struct vm_area_struct *vma, unsigned long vaddr)
> +{
> +	return ((loff_t)vma->vm_pgoff << PAGE_SHIFT) + (vaddr - vma->vm_start);
> +}
> +
>  /* truncate.c */
>  extern void truncate_inode_pages(struct address_space *, loff_t);
>  extern void truncate_inode_pages_range(struct address_space *,
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index ce6848e..bd6f230 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -130,16 +130,6 @@ static bool valid_vma(struct vm_area_struct *vma, bool is_register)
>  	return vma->vm_file && (vma->vm_flags & flags) == VM_MAYEXEC;
>  }
>  
> -static unsigned long offset_to_vaddr(struct vm_area_struct *vma, loff_t offset)
> -{
> -	return vma->vm_start + offset - ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
> -}
> -
> -static loff_t vaddr_to_offset(struct vm_area_struct *vma, unsigned long vaddr)
> -{
> -	return ((loff_t)vma->vm_pgoff << PAGE_SHIFT) + (vaddr - vma->vm_start);
> -}
> -
>  /**
>   * __replace_page - replace page in vma by new page.
>   * based on replace_page in mm/ksm.c
> -- 
> 1.8.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
