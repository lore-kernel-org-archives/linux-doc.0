Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C6B97D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 16:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754463AbeFTQhy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 12:37:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753960AbeFTQhy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jun 2018 12:37:54 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33A7820846;
        Wed, 20 Jun 2018 16:37:52 +0000 (UTC)
Date:   Wed, 20 Jun 2018 12:37:50 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Cc:     oleg@redhat.com, srikar@linux.vnet.ibm.com, mhiramat@kernel.org,
        peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, ananth@linux.vnet.ibm.com,
        alexis.berlemont@gmail.com, naveen.n.rao@linux.vnet.ibm.com
Subject: Re: [PATCH 0/7] Uprobes: Support SDT markers having reference count
 (semaphore)
Message-ID: <20180620123750.79811466@gandalf.local.home>
In-Reply-To: <20180606083344.31320-1-ravi.bangoria@linux.ibm.com>
References: <20180606083344.31320-1-ravi.bangoria@linux.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  6 Jun 2018 14:03:37 +0530
Ravi Bangoria <ravi.bangoria@linux.ibm.com> wrote:

> Why RFC again:
> 
> This series is different from earlier versions[1]. Earlier series
> implemented this feature in trace_uprobe while this has implemented
> the logic in core uprobe. Few reasons for this:
>  1. One of the major reason was the deadlock between uprobe_lock and
>  mm->mmap inside trace_uprobe_mmap(). That deadlock was not easy to fix
>  because mm->mmap is not in control of trace_uprobe_mmap() and it has
>  to take uprobe_lock to loop over trace_uprobe list. More details can
>  be found at[2]. With this new approach, there are no deadlocks found
>  so far.
>  2. Many of the core uprobe function and data-structures needs to be
>  exported to make earlier implementation simple. With this new approach,
>  reference counter logic is been implemented in core uprobe and thus
>  no need to export anything.


A quick scan of the patches, I don't see anything controversial with
them. Unless others have any qualms about it, I say repost as non RFC,
and we can start doing a more thorough review.

Thanks,

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
