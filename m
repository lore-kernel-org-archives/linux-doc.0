Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A16F57E677
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 16:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934278AbeCPQQ3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 12:16:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57748 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964770AbeCPQQY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Mar 2018 12:16:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C1ABF814DF58;
        Fri, 16 Mar 2018 16:16:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id F1FD42166BDA;
        Fri, 16 Mar 2018 16:16:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri, 16 Mar 2018 17:16:23 +0100 (CET)
Date:   Fri, 16 Mar 2018 17:16:17 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>,
        mhiramat@kernel.org, peterz@infradead.org,
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
Message-ID: <20180316161616.GA28249@redhat.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
 <20180313125603.19819-6-ravi.bangoria@linux.vnet.ibm.com>
 <20180315124816.6aa3d4e2@vmware.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180315124816.6aa3d4e2@vmware.local.home>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 16 Mar 2018 16:16:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 16 Mar 2018 16:16:24 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/15, Steven Rostedt wrote:
>
> On Tue, 13 Mar 2018 18:26:00 +0530
> Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com> wrote:
>
> > +static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
> > +{
> > +	struct uprobe_map_info *info;
> > +	struct vm_area_struct *vma;
> > +	unsigned long vaddr;
> > +
> > +	uprobe_start_dup_mmap();
>
> Please add a comment here that this function ups the mm ref count for
> each info returned. Otherwise it's hard to know what that mmput() below
> matches.

You meant uprobe_build_map_info(), not uprobe_start_dup_mmap().

Yes, and if it gets more callers perhaps we should move this mmput() into
uprobe_free_map_info()...

Oleg.


--- x/kernel/events/uprobes.c
+++ x/kernel/events/uprobes.c
@@ -714,6 +714,7 @@ struct map_info {
 static inline struct map_info *free_map_info(struct map_info *info)
 {
 	struct map_info *next = info->next;
+	mmput(info->mm);
 	kfree(info);
 	return next;
 }
@@ -783,8 +784,11 @@ build_map_info(struct address_space *map
 
 	goto again;
  out:
-	while (prev)
-		prev = free_map_info(prev);
+	while (prev) {
+		info = prev;
+		prev = prev->next;
+		kfree(info);
+	}
 	return curr;
 }
 
@@ -834,7 +838,6 @@ register_for_each_vma(struct uprobe *upr
  unlock:
 		up_write(&mm->mmap_sem);
  free:
-		mmput(mm);
 		info = free_map_info(info);
 	}
  out:

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
