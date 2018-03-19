Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A1F5A7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 13:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933324AbeCSNk7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 09:40:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44268 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932793AbeCSNk6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Mar 2018 09:40:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D0AE04068034;
        Mon, 19 Mar 2018 13:40:57 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id E78A5AB3F2;
        Mon, 19 Mar 2018 13:40:51 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon, 19 Mar 2018 14:40:57 +0100 (CET)
Date:   Mon, 19 Mar 2018 14:40:51 +0100
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
Message-ID: <20180319134050.GA12554@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
 <20180315144959.GB19643@redhat.com>
 <c93216a4-a4e1-dd8f-00be-17254e308cd1@linux.vnet.ibm.com>
 <20180316175030.GA28770@redhat.com>
 <4b337afd-fc5e-6110-888b-d4fa36a797ee@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b337afd-fc5e-6110-888b-d4fa36a797ee@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 19 Mar 2018 13:40:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 19 Mar 2018 13:40:58 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ravi,

On 03/19, Ravi Bangoria wrote:
>
> On 03/16/2018 11:20 PM, Oleg Nesterov wrote:
> >
> > And it seems that you are trying to confuse yourself, not only me ;) Just
> > suppose that an application does mmap+munmap in a loop and the mapped region
> > contains uprobe but not the counter.
>
> this is fine because ...

Yes, I guess I tried to say "counter but not uprobe" but possibly I was actually
confused.

> Our initial design was to increment counter in install_breakpoint() but
> uprobed instruction gets patched in a very early stage of binary loading
> and vma that holds the counter may not be mapped yet.

Yes, yes, I understand this is not that simple...

> > Btw, why do we need a counter, not a boolean? Who else can modify it?
> > Or different uprobes can share the same counter?
>
> Yes, multiple SDT markers can share the counter.

OK, thanks.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
