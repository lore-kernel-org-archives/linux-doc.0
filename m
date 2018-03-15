Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7024A7E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 14:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752212AbeCOOVa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 10:21:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42118 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751880AbeCOOV1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:21:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8FF8B20CC6;
        Thu, 15 Mar 2018 14:21:26 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4BFDC2026E04;
        Thu, 15 Mar 2018 14:21:21 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 15 Mar 2018 15:21:26 +0100 (CET)
Date:   Thu, 15 Mar 2018 15:21:20 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     mhiramat@kernel.org, peterz@infradead.org,
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
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com
Subject: Re: [PATCH 5/8] trace_uprobe: Support SDT markers having reference
 count (semaphore)
Message-ID: <20180315142120.GA19218@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 14:21:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 14:21:26 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/13, Ravi Bangoria wrote:
>
> @@ -1053,6 +1056,9 @@ int uprobe_mmap(struct vm_area_struct *vma)
>  	struct uprobe *uprobe, *u;
>  	struct inode *inode;
>
> +	if (uprobe_mmap_callback)
> +		uprobe_mmap_callback(vma);
> +
>  	if (no_uprobe_events() || !valid_vma(vma, true))
>  		return 0;

probe_event_enable() does

	uprobe_register();
	/* WINDOW */
	sdt_increment_ref_ctr();

what if uprobe_mmap() is called in between? The counter(s) in this vma
will be incremented twice, no?

> +static struct vm_area_struct *
> +sdt_find_vma(struct mm_struct *mm, struct trace_uprobe *tu)
> +{
> +	struct vm_area_struct *tmp;
> +
> +	for (tmp = mm->mmap; tmp != NULL; tmp = tmp->vm_next)
> +		if (sdt_valid_vma(tu, tmp))
> +			return tmp;
> +
> +	return NULL;

I can't understand the logic... Lets ignore sdt_valid_vma() for now.
The caller has uprobe_map_info, why it can't simply do
vma = find_vma(uprobe_map_info->vaddr)? and then check sdt_valid_vma().

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
