Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C0627E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 14:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751532AbeCNOPs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 10:15:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:53860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751523AbeCNOPr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Mar 2018 10:15:47 -0400
Received: from devbox (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAD0E214D7;
        Wed, 14 Mar 2018 14:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD0E214D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mhiramat@kernel.org
Date:   Wed, 14 Mar 2018 23:15:40 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     oleg@redhat.com, peterz@infradead.org, srikar@linux.vnet.ibm.com,
        acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 6/8] trace_uprobe/sdt: Fix multiple update of same
 reference counter
Message-Id: <20180314231540.b98c74a153255f59f54ebc46@kernel.org>
In-Reply-To: <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 18:26:01 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:

> For tiny binaries/libraries, different mmap regions points to the
> same file portion. In such cases, we may increment reference counter
> multiple times. But while de-registration, reference counter will get
> decremented only by once leaving reference counter > 0 even if no one
> is tracing on that marker.
> 
> Ensure increment and decrement happens in sync by keeping list of
> mms in trace_uprobe. Increment reference counter only if mm is not
> present in the list and decrement only if mm is present in the list.
> 
> Example
> 
>   # echo "p:sdt_tick/loop2 /tmp/tick:0x6e4(0x10036)" > uprobe_events
> 
> Before patch:
> 
>   # perf stat -a -e sdt_tick:loop2
>   # /tmp/tick
>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>    0000000: 02                                       .
> 
>   # pkill perf
>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>   0000000: 01                                       .
> 
> After patch:
> 
>   # perf stat -a -e sdt_tick:loop2
>   # /tmp/tick
>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>   0000000: 01                                       .
> 
>   # pkill perf
>   # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
>   0000000: 00                                       .
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
> ---
>  kernel/trace/trace_uprobe.c | 105 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
> index b6c9b48..9bf3f7a 100644
> --- a/kernel/trace/trace_uprobe.c
> +++ b/kernel/trace/trace_uprobe.c
> @@ -50,6 +50,11 @@ struct trace_uprobe_filter {
>  	struct list_head	perf_events;
>  };
>  
> +struct sdt_mm_list {
> +	struct mm_struct *mm;
> +	struct sdt_mm_list *next;
> +};

Oh, please use struct list_head instead of defining your own pointer-chain :(

> +
>  /*
>   * uprobe event core functions
>   */
> @@ -61,6 +66,8 @@ struct trace_uprobe {
>  	char				*filename;
>  	unsigned long			offset;
>  	unsigned long			ref_ctr_offset;
> +	struct sdt_mm_list		*sml;
> +	struct rw_semaphore		sml_rw_sem;

BTW, is there any reason to use rw_semaphore? (mutex doesn't fit?)

Thank you,

>  	unsigned long			nhit;
>  	struct trace_probe		tp;
>  };
> @@ -274,6 +281,7 @@ static inline bool is_ret_probe(struct trace_uprobe *tu)
>  	if (is_ret)
>  		tu->consumer.ret_handler = uretprobe_dispatcher;
>  	init_trace_uprobe_filter(&tu->filter);
> +	init_rwsem(&tu->sml_rw_sem);
>  	return tu;
>  
>  error:
> @@ -921,6 +929,74 @@ static void uretprobe_trace_func(struct trace_uprobe *tu, unsigned long func,
>  	return trace_handle_return(s);
>  }
>  
> +static bool sdt_check_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
> +{
> +	struct sdt_mm_list *tmp = tu->sml;
> +
> +	if (!tu->sml || !mm)
> +		return false;
> +
> +	while (tmp) {
> +		if (tmp->mm == mm)
> +			return true;
> +		tmp = tmp->next;
> +	}
> +
> +	return false;
> +}
> +
> +static void sdt_add_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
> +{
> +	struct sdt_mm_list *tmp;
> +
> +	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
> +	if (!tmp)
> +		return;
> +
> +	tmp->mm = mm;
> +	tmp->next = tu->sml;
> +	tu->sml = tmp;
> +}
> +
> +static void sdt_del_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
> +{
> +	struct sdt_mm_list *prev, *curr;
> +
> +	if (!tu->sml)
> +		return;
> +
> +	if (tu->sml->mm == mm) {
> +		curr = tu->sml;
> +		tu->sml = tu->sml->next;
> +		kfree(curr);
> +		return;
> +	}
> +
> +	prev = tu->sml;
> +	curr = tu->sml->next;
> +	while (curr) {
> +		if (curr->mm == mm) {
> +			prev->next = curr->next;
> +			kfree(curr);
> +			return;
> +		}
> +		prev = curr;
> +		curr = curr->next;
> +	}
> +}
> +
> +static void sdt_flush_mm_list(struct trace_uprobe *tu)
> +{
> +	struct sdt_mm_list *next, *curr = tu->sml;
> +
> +	while (curr) {
> +		next = curr->next;
> +		kfree(curr);
> +		curr = next;
> +	}
> +	tu->sml = NULL;
> +}
> +
>  static bool sdt_valid_vma(struct trace_uprobe *tu, struct vm_area_struct *vma)
>  {
>  	unsigned long vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
> @@ -989,17 +1065,25 @@ static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
>  	if (IS_ERR(info))
>  		goto out;
>  
> +	down_write(&tu->sml_rw_sem);
>  	while (info) {
> +		if (sdt_check_mm_list(tu, info->mm))
> +			goto cont;
> +
>  		down_write(&info->mm->mmap_sem);
>  
>  		vma = sdt_find_vma(info->mm, tu);
>  		vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
> -		sdt_update_ref_ctr(info->mm, vaddr, 1);
> +		if (!sdt_update_ref_ctr(info->mm, vaddr, 1))
> +			sdt_add_mm_list(tu, info->mm);
>  
>  		up_write(&info->mm->mmap_sem);
> +
> +cont:
>  		mmput(info->mm);
>  		info = uprobe_free_map_info(info);
>  	}
> +	up_write(&tu->sml_rw_sem);
>  
>  out:
>  	uprobe_end_dup_mmap();
> @@ -1020,8 +1104,16 @@ void trace_uprobe_mmap_callback(struct vm_area_struct *vma)
>  		    !trace_probe_is_enabled(&tu->tp))
>  			continue;
>  
> +		down_write(&tu->sml_rw_sem);
> +		if (sdt_check_mm_list(tu, vma->vm_mm))
> +			goto cont;
> +
>  		vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
> -		sdt_update_ref_ctr(vma->vm_mm, vaddr, 1);
> +		if (!sdt_update_ref_ctr(vma->vm_mm, vaddr, 1))
> +			sdt_add_mm_list(tu, vma->vm_mm);
> +
> +cont:
> +		up_write(&tu->sml_rw_sem);
>  	}
>  	mutex_unlock(&uprobe_lock);
>  }
> @@ -1038,7 +1130,11 @@ static void sdt_decrement_ref_ctr(struct trace_uprobe *tu)
>  	if (IS_ERR(info))
>  		goto out;
>  
> +	down_write(&tu->sml_rw_sem);
>  	while (info) {
> +		if (!sdt_check_mm_list(tu, info->mm))
> +			goto cont;
> +
>  		down_write(&info->mm->mmap_sem);
>  
>  		vma = sdt_find_vma(info->mm, tu);
> @@ -1046,9 +1142,14 @@ static void sdt_decrement_ref_ctr(struct trace_uprobe *tu)
>  		sdt_update_ref_ctr(info->mm, vaddr, -1);
>  
>  		up_write(&info->mm->mmap_sem);
> +		sdt_del_mm_list(tu, info->mm);
> +
> +cont:
>  		mmput(info->mm);
>  		info = uprobe_free_map_info(info);
>  	}
> +	sdt_flush_mm_list(tu);
> +	up_write(&tu->sml_rw_sem);
>  
>  out:
>  	uprobe_end_dup_mmap();
> -- 
> 1.8.3.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
