Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 22C4C7D062
	for <lwn-linux-doc@archive.lwn.net>; Sun,  1 Jul 2018 21:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752504AbeGAVJl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 1 Jul 2018 17:09:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48432 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752407AbeGAVJk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Jul 2018 17:09:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id EE99C7788C;
        Sun,  1 Jul 2018 21:09:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id 682567C24;
        Sun,  1 Jul 2018 21:09:36 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Sun,  1 Jul 2018 23:09:39 +0200 (CEST)
Date:   Sun, 1 Jul 2018 23:09:35 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc:     srikar@linux.vnet.ibm.com, rostedt@goodmis.org,
        mhiramat@kernel.org, peterz@infradead.org, mingo@redhat.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        jolsa@redhat.com, namhyung@kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, ananth@linux.vnet.ibm.com,
        alexis.berlemont@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org,
        linux@armlinux.org.uk, ralf@linux-mips.org, paul.burton@mips.com
Subject: Re: [PATCH v5 06/10] Uprobes: Support SDT markers having reference
 count (semaphore)
Message-ID: <20180701210935.GA14404@redhat.com>
References: <20180628052209.13056-1-ravi.bangoria@linux.ibm.com>
 <20180628052209.13056-7-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628052209.13056-7-ravi.bangoria@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Sun, 01 Jul 2018 21:09:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Sun, 01 Jul 2018 21:09:40 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/28, Ravi Bangoria wrote:
>
> @@ -294,6 +462,15 @@ int uprobe_write_opcode(struct uprobe *uprobe, struct mm_struct *mm,
>  	if (ret <= 0)
>  		goto put_old;
>  
> +	/* Update the ref_ctr if we are going to replace instruction. */
> +	if (!ref_ctr_updated) {
> +		ret = update_ref_ctr(uprobe, mm, is_register);
> +		if (ret)
> +			goto put_old;
> +
> +		ref_ctr_updated = 1;
> +	}

Why can't this code live in install_breakpoint() and remove_breakpoint() ?
this way we do not need to export "struct uprobe" and change set_swbp/set_orig_insn,
and the logic will be more simple.

And let me ask again... May be you have already explained this, but I can't
find the previous discussion.

So why do we need a counter but not a boolean? IIRC, because the counter can
be shared, in particular 2 different uprobes can have the same >ref_ctr_offset,
right?

But who else can use this counter and how? Say, can userspace update it too?
If yes, why this can't race with __update_ref_ctr() ?

And btw, why does __update_ref_ctr() use FOLL_FORCE? This vma should be writeable
or valid_ref_ctr_vma() should nack it?

And shouldn't valid_ref_ctr_vma() check VM_SHARED? IIUC we do not want to write
to this file?

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
