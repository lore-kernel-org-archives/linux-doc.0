Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F8277E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 14:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932279AbeCOOuH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 10:50:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43468 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752633AbeCOOuG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Mar 2018 10:50:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2B9AEEAEB3;
        Thu, 15 Mar 2018 14:50:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id 52E0F215CDAF;
        Thu, 15 Mar 2018 14:50:00 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 15 Mar 2018 15:50:04 +0100 (CET)
Date:   Thu, 15 Mar 2018 15:49:59 +0100
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
Subject: Re: [PATCH 6/8] trace_uprobe/sdt: Fix multiple update of same
 reference counter
Message-ID: <20180315144959.GB19643@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 14:50:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 15 Mar 2018 14:50:05 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/13, Ravi Bangoria wrote:
>
> For tiny binaries/libraries, different mmap regions points to the
> same file portion. In such cases, we may increment reference counter
> multiple times.

Yes,

> But while de-registration, reference counter will get
> decremented only by once

could you explain why this happens? sdt_increment_ref_ctr() and
sdt_decrement_ref_ctr() look symmetrical, _decrement_ should see
the same mappings?

Ether way, this patch doesn't look right at first glance... Just
for example,

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

...

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

...

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

To simplify, suppose that tu->sml is empty.

Some process calls this function, increments the counter and adds its ->mm into
the list.

Then it exits, ->mm is freed.

The next fork/exec allocates the same memory for the new ->mm, the new process
calls trace_uprobe_mmap_callback() and sdt_check_mm_list() returns T?

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
