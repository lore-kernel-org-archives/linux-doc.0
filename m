Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C6E497E86A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 13:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751455AbeDIN3g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 09:29:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37412 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752127AbeDIN3e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Apr 2018 09:29:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 03C4340201A1;
        Mon,  9 Apr 2018 13:29:33 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4126C111DCF6;
        Mon,  9 Apr 2018 13:29:29 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon,  9 Apr 2018 15:29:32 +0200 (CEST)
Date:   Mon, 9 Apr 2018 15:29:28 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     mhiramat@kernel.org, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, rostedt@goodmis.org, acme@kernel.org,
        ananth@linux.vnet.ibm.com, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, alexis.berlemont@gmail.com,
        corbet@lwn.net, dan.j.williams@intel.com, jolsa@redhat.com,
        kan.liang@intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com, tglx@linutronix.de,
        yao.jin@linux.intel.com, fengguang.wu@intel.com, jglisse@redhat.com
Subject: Re: [PATCH v2 7/9] trace_uprobe/sdt: Fix multiple update of same
 reference counter
Message-ID: <20180409132928.GA25722@redhat.com>
References: <20180404083110.18647-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180404083110.18647-8-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404083110.18647-8-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Mon, 09 Apr 2018 13:29:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Mon, 09 Apr 2018 13:29:33 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/04, Ravi Bangoria wrote:
>
> +static void sdt_add_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
> +{
> +	struct mmu_notifier *mn;
> +	struct sdt_mm_list *sml = kzalloc(sizeof(*sml), GFP_KERNEL);
> +
> +	if (!sml)
> +		return;
> +	sml->mm = mm;
> +	list_add(&(sml->list), &(tu->sml.list));
> +
> +	/* Register mmu_notifier for this mm. */
> +	mn = kzalloc(sizeof(*mn), GFP_KERNEL);
> +	if (!mn)
> +		return;
> +
> +	mn->ops = &sdt_mmu_notifier_ops;
> +	__mmu_notifier_register(mn, mm);
> +}

and what if __mmu_notifier_register() fails simply because signal_pending() == T?
see mm_take_all_locks().

at first glance this all look suspicious and sub-optimal, but let me repeat that
I didn't read this version yet.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
