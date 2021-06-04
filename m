Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964EDC47424
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A676140C
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 16:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhFDQXS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 12:23:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229746AbhFDQXS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jun 2021 12:23:18 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52FBC61405;
        Fri,  4 Jun 2021 16:21:30 +0000 (UTC)
Date:   Fri, 4 Jun 2021 12:21:28 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Joe Perches <joe@perches.com>
Cc:     Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 7/9] tracing: Add __print_ns_to_secs() and
 __print_ns_without_secs() helpers
Message-ID: <20210604122128.0d348960@oasis.local.home>
In-Reply-To: <1e068d21106bb6db05b735b4916bb420e6c9842a.camel@perches.com>
References: <cover.1621024265.git.bristot@redhat.com>
        <2c59beee3b36b15592bfbb9f26dee7f8b55fd814.1621024265.git.bristot@redhat.com>
        <20210603172902.41648183@gandalf.local.home>
        <1e068d21106bb6db05b735b4916bb420e6c9842a.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 03 Jun 2021 21:19:50 -0700
Joe Perches <joe@perches.com> wrote:

> If tracing cleanups for trace_events.h are being done, perhaps
> another bit of untidiness is the macro definition and uses of
> __assign_str.

This isn't a tracing cleanup, but adding new functionality.

That said,

> 
> $ git grep -w -1 __assign_str include/trace/trace_events.h
> include/trace/trace_events.h-
> include/trace/trace_events.h:#undef __assign_str
> include/trace/trace_events.h:#define __assign_str(dst, src)                                             \
> include/trace/trace_events.h-   strcpy(__get_str(dst), (src) ? (const char *)(src) : "(null)");
> 
> Its definition has a semicolon as do most uses but a dozen handfuls of
> other uses do not have a semicolon.  It'd be more consistent to add a
> semicolon to the uses without them and when done treewide, then remove
> the semicolon from the macro declaration.

I have no problem taking a clean up patch that adds semicolons to all
use cases of "__assign_str()" and ever remove the one from where it is
defined. As long as it doesn't break any builds, I'm fine with that.

-- Steve
