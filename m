Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5ADC48BE5
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 23:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DD4E610C8
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 23:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFLXLw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 19:11:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFLXLv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 12 Jun 2021 19:11:51 -0400
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 369D3611C2;
        Sat, 12 Jun 2021 23:09:50 +0000 (UTC)
Date:   Sat, 12 Jun 2021 19:09:48 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
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
Subject: Re: [PATCH V3 9/9] tracing: Add timerlat tracer
Message-ID: <20210612190948.4fa93611@rorschach.local.home>
In-Reply-To: <80f74da1-a9a7-2af9-dd4f-c22f312214df@redhat.com>
References: <cover.1621024265.git.bristot@redhat.com>
        <b650672b9973887ef1420bc1e76b97940b6522d6.1621024265.git.bristot@redhat.com>
        <20210607213639.68aad064@gandalf.local.home>
        <6bc850eb-14c8-6898-847c-d9f0e67d60f8@redhat.com>
        <20210611164855.252f35fb@gandalf.local.home>
        <80f74da1-a9a7-2af9-dd4f-c22f312214df@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 12 Jun 2021 10:47:16 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> Thinking only about the instrumentation/events, what they are tracking is the
> execution time. So how about naming them as:
> 
> exec_time:thread
> exec_time:irq

I guess. I should go and look at your other code.

> 
> Also adding that, although here we measure the execution time of "task" context,
> on rtsl we have other kinds of "windows" that they measure, for instance, the
> poid window (Preemption or IRQ disabled). So, the term exec time also fits there.

LOL at "poid"

-- Steve
