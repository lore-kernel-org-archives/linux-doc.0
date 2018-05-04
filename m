Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB74A7E27D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 14:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751423AbeEDOaa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 10:30:30 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48614 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751729AbeEDOa1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 May 2018 10:30:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 145EC8160F82;
        Fri,  4 May 2018 14:30:27 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.34.27.30])
        by smtp.corp.redhat.com (Postfix) with SMTP id 73520215CDA7;
        Fri,  4 May 2018 14:30:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri,  4 May 2018 16:30:26 +0200 (CEST)
Date:   Fri, 4 May 2018 16:30:21 +0200
From:   Oleg Nesterov <oleg@redhat.com>
To:     Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc:     mhiramat@kernel.org,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>,
        peterz@infradead.org, srikar@linux.vnet.ibm.com,
        rostedt@goodmis.org, acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        pc@us.ibm.com, tglx@linutronix.de, yao.jin@linux.intel.com,
        fengguang.wu@intel.com, jglisse@redhat.com
Subject: Re: [PATCH v3 0/9] trace_uprobe: Support SDT markers having
 reference count (semaphore)
Message-ID: <20180504143021.GB26151@redhat.com>
References: <20180417043244.7501-1-ravi.bangoria@linux.vnet.ibm.com>
 <f77789c0-9277-23bf-9abb-92f3f36c4baa@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f77789c0-9277-23bf-9abb-92f3f36c4baa@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 04 May 2018 14:30:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 04 May 2018 14:30:27 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'oleg@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sorry Ravi, I saved the new version for review and forgot about it... I'll
try to do this on weekend.

On 05/03, Ravi Bangoria wrote:
> 
> On 04/17/2018 10:02 AM, Ravi Bangoria wrote:
> > Userspace Statically Defined Tracepoints[1] are dtrace style markers
> > inside userspace applications. Applications like PostgreSQL, MySQL,
> > Pthread, Perl, Python, Java, Ruby, Node.js, libvirt, QEMU, glib etc
> > have these markers embedded in them. These markers are added by developer
> > at important places in the code. Each marker source expands to a single
> > nop instruction in the compiled code but there may be additional
> > overhead for computing the marker arguments which expands to couple of
> > instructions. In case the overhead is more, execution of it can be
> > omitted by runtime if() condition when no one is tracing on the marker:
> >
> >     if (reference_counter > 0) {
> >         Execute marker instructions;
> >     }   
> >
> > Default value of reference counter is 0. Tracer has to increment the 
> > reference counter before tracing on a marker and decrement it when
> > done with the tracing.
> 
> Hi Oleg, Masami,
> 
> Can you please review this :) ?
> 
> Thanks.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
