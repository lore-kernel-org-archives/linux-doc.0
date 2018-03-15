Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE96E7E6AB
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 16:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752045AbeCOQoz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 12:44:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:41076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751711AbeCOQoy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 12:44:54 -0400
Received: from vmware.local.home (ip-64-134-136-2.public.wayport.net [64.134.136.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C2C420779;
        Thu, 15 Mar 2018 16:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2C420779
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Thu, 15 Mar 2018 12:44:49 -0400
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
Subject: Re: [PATCH 3/8] Uprobe: Rename map_info to uprobe_map_info
Message-ID: <20180315124449.7d92c06b@vmware.local.home>
In-Reply-To: <20180313125603.19819-4-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-4-ravi.bangoria@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 18:25:58 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
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

Also, as these functions have side effects (like you need to perform a
mmput(info->mm), you need to add kerneldoc type comments to these
functions, explaining how to use them.

When you upgrade a function from static to use cases outside the file,
it requires documenting that function for future users.

-- Steve


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
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
