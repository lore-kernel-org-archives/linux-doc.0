Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB7287E66E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 20:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753106AbeCMUj5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 16:39:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38308 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753086AbeCMUjy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Mar 2018 16:39:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1642B40201A3;
        Tue, 13 Mar 2018 20:39:54 +0000 (UTC)
Received: from redhat.com (ovpn-121-215.rdu2.redhat.com [10.10.121.215])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB972166BAE;
        Tue, 13 Mar 2018 20:39:51 +0000 (UTC)
Date:   Tue, 13 Mar 2018 16:39:49 -0400
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
Subject: Re: [PATCH 3/8] Uprobe: Rename map_info to uprobe_map_info
Message-ID: <20180313203949.GI3828@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-4-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180313125603.19819-4-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Tue, 13 Mar 2018 20:39:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Tue, 13 Mar 2018 20:39:54 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'jglisse@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 13, 2018 at 06:25:58PM +0530, Ravi Bangoria wrote:
> map_info is very generic name, rename it to uprobe_map_info.
> Renaming will help to export this structure outside of the
> file.
> 
> Also rename free_map_info() to uprobe_free_map_info() and
> build_map_info() to uprobe_build_map_info().
> 
> No functionality changes.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>

Same coccinelle comments as previously.

Reviewed-by: Jérôme Glisse <jglisse@redhat.com>

> ---
>  kernel/events/uprobes.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index 535fd39..081b88c1 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -695,27 +695,29 @@ static void delete_uprobe(struct uprobe *uprobe)
>  	put_uprobe(uprobe);
>  }
>  
> -struct map_info {
> -	struct map_info *next;
> +struct uprobe_map_info {
> +	struct uprobe_map_info *next;
>  	struct mm_struct *mm;
>  	unsigned long vaddr;
>  };
>  
> -static inline struct map_info *free_map_info(struct map_info *info)
> +static inline struct uprobe_map_info *
> +uprobe_free_map_info(struct uprobe_map_info *info)
>  {
> -	struct map_info *next = info->next;
> +	struct uprobe_map_info *next = info->next;
>  	kfree(info);
>  	return next;
>  }
>  
> -static struct map_info *
> -build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
> +static struct uprobe_map_info *
> +uprobe_build_map_info(struct address_space *mapping, loff_t offset,
> +		      bool is_register)
>  {
>  	unsigned long pgoff = offset >> PAGE_SHIFT;
>  	struct vm_area_struct *vma;
> -	struct map_info *curr = NULL;
> -	struct map_info *prev = NULL;
> -	struct map_info *info;
> +	struct uprobe_map_info *curr = NULL;
> +	struct uprobe_map_info *prev = NULL;
> +	struct uprobe_map_info *info;
>  	int more = 0;
>  
>   again:
> @@ -729,7 +731,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
>  			 * Needs GFP_NOWAIT to avoid i_mmap_rwsem recursion through
>  			 * reclaim. This is optimistic, no harm done if it fails.
>  			 */
> -			prev = kmalloc(sizeof(struct map_info),
> +			prev = kmalloc(sizeof(struct uprobe_map_info),
>  					GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN);
>  			if (prev)
>  				prev->next = NULL;
> @@ -762,7 +764,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
>  	}
>  
>  	do {
> -		info = kmalloc(sizeof(struct map_info), GFP_KERNEL);
> +		info = kmalloc(sizeof(struct uprobe_map_info), GFP_KERNEL);
>  		if (!info) {
>  			curr = ERR_PTR(-ENOMEM);
>  			goto out;
> @@ -774,7 +776,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
>  	goto again;
>   out:
>  	while (prev)
> -		prev = free_map_info(prev);
> +		prev = uprobe_free_map_info(prev);
>  	return curr;
>  }
>  
> @@ -782,11 +784,11 @@ static inline struct map_info *free_map_info(struct map_info *info)
>  register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
>  {
>  	bool is_register = !!new;
> -	struct map_info *info;
> +	struct uprobe_map_info *info;
>  	int err = 0;
>  
>  	percpu_down_write(&dup_mmap_sem);
> -	info = build_map_info(uprobe->inode->i_mapping,
> +	info = uprobe_build_map_info(uprobe->inode->i_mapping,
>  					uprobe->offset, is_register);
>  	if (IS_ERR(info)) {
>  		err = PTR_ERR(info);
> @@ -825,7 +827,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
>  		up_write(&mm->mmap_sem);
>   free:
>  		mmput(mm);
> -		info = free_map_info(info);
> +		info = uprobe_free_map_info(info);
>  	}
>   out:
>  	percpu_up_write(&dup_mmap_sem);
> -- 
> 1.8.3.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
