Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A9DC433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 13:50:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF78613C7
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 13:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhDONu7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:50:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231549AbhDONu7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:50:59 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4BB9613C0;
        Thu, 15 Apr 2021 13:50:33 +0000 (UTC)
Date:   Thu, 15 Apr 2021 09:50:32 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kcarcia@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] tracing/hwlat: Implement the mode config option
Message-ID: <20210415095032.7d98d474@gandalf.local.home>
In-Reply-To: <882d85c1-5bd9-f68d-3861-f7bdf0cc0992@redhat.com>
References: <cover.1617889883.git.bristot@redhat.com>
        <c6b6ac9274e417b650c7aa9494bcf4f6ca0a1097.1617889883.git.bristot@redhat.com>
        <20210414103029.7c48b76e@gandalf.local.home>
        <882d85c1-5bd9-f68d-3861-f7bdf0cc0992@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 15 Apr 2021 15:16:04 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> That was my initial intention with the NONE mode, but I feared breaking
> something by removing the "migrate_disable" logic. If you do not think it is
> a problem, I will remove the migrate disable and just change the mode.

Yes, just change it.

Thanks,

-- Steve
