Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 002FD7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 01:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbeJSJQb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 05:16:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbeJSJQb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Oct 2018 05:16:31 -0400
Received: from vmware.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3D5D2087A;
        Fri, 19 Oct 2018 01:12:46 +0000 (UTC)
Date:   Thu, 18 Oct 2018 21:12:45 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Nikolay Borisov <nborisov@suse.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181018211245.10baf496@vmware.local.home>
In-Reply-To: <20181019001932.GR2674@linux.ibm.com>
References: <20181015201556.GA43575@joelaf.mtv.corp.google.com>
        <20181015210856.GE2674@linux.ibm.com>
        <20181016112611.GA27405@linux.ibm.com>
        <20181016204122.GA8176@joelaf.mtv.corp.google.com>
        <20181017161100.GP2674@linux.ibm.com>
        <20181017181505.GC107185@joelaf.mtv.corp.google.com>
        <20181017203324.GS2674@linux.ibm.com>
        <20181018020751.GB99677@joelaf.mtv.corp.google.com>
        <20181018144637.GD2674@linux.ibm.com>
        <20181019000350.GB89903@joelaf.mtv.corp.google.com>
        <20181019001932.GR2674@linux.ibm.com>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 18 Oct 2018 17:19:32 -0700
"Paul E. McKenney" <paulmck@linux.ibm.com> wrote:

> I figured that whoever calls preempt_enable_no_resched() is taking the
> responsibility for permitting preemption in the near future, and if they
> fail to do so, they will get called on it.  Hard to hide from the latency
> tracer, after all.  ;-)

Correct, and doing a search of preempt_enable_no_resched() I see
there's one in the ftrace ring buffer code, that was added a long time
ago (2008) to fix a recursion bug that no longer exists, and this now
can leak a preemption point.

I'll have to go fix that :-(

-- Steve
