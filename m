Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D4EE7E6AB
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 16:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752168AbeCOQsW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 12:48:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752163AbeCOQsV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 12:48:21 -0400
Received: from vmware.local.home (ip-64-134-136-2.public.wayport.net [64.134.136.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49C9420779;
        Thu, 15 Mar 2018 16:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C9420779
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=rostedt@goodmis.org
Date:   Thu, 15 Mar 2018 12:48:16 -0400
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
Subject: Re: [PATCH 5/8] trace_uprobe: Support SDT markers having reference
 count (semaphore)
Message-ID: <20180315124816.6aa3d4e2@vmware.local.home>
In-Reply-To: <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
        <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 18:26:00 +0530
Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:

> +static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
> +{
> +	struct uprobe_map_info *info;
> +	struct vm_area_struct *vma;
> +	unsigned long vaddr;
> +
> +	uprobe_start_dup_mmap();

Please add a comment here that this function ups the mm ref count for
each info returned. Otherwise it's hard to know what that mmput() below
matches.

-- Steve

> +	info = uprobe_build_map_info(tu->inode->i_mapping,
> +				tu->ref_ctr_offset, false);
> +	if (IS_ERR(info))
> +		goto out;
> +
> +	while (info) {
> +		down_write(&info->mm->mmap_sem);
> +
> +		vma = sdt_find_vma(info->mm, tu);
> +		vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
> +		sdt_update_ref_ctr(info->mm, vaddr, 1);
> +
> +		up_write(&info->mm->mmap_sem);
> +		mmput(info->mm);
> +		info = uprobe_free_map_info(info);
> +	}
> +
> +out:
> +	uprobe_end_dup_mmap();
> +}
> +
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
