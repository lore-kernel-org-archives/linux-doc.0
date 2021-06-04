Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED1C4743C
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 20:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7516D61403
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 20:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbhFDUwJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 16:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229906AbhFDUwJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jun 2021 16:52:09 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 082D2613FF;
        Fri,  4 Jun 2021 20:50:20 +0000 (UTC)
Date:   Fri, 4 Jun 2021 16:50:19 -0400
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
Subject: Re: [PATCH V3 6/9] trace/hwlat: Use the generic function to
 read/write width and window
Message-ID: <20210604165019.061e9f51@oasis.local.home>
In-Reply-To: <4ff9f435-9932-f555-9f19-65f92041950e@redhat.com>
References: <cover.1621024265.git.bristot@redhat.com>
        <bf0c568ddaf9e75e3d2e77b0ffd5ad1508c47afc.1621024265.git.bristot@redhat.com>
        <20210603172709.25c322a1@gandalf.local.home>
        <4ff9f435-9932-f555-9f19-65f92041950e@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 4 Jun 2021 18:36:58 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> I will rework the patch 5/9 to add a better explanation for the read/write
> functions, and I will add comments to this patch, explaining the reason for the
> min/max values.
> 
> Sound good?

We'll see in v4 ;-)

-- Steve
