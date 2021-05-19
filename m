Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FECC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74263611BF
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbhESSJh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 14:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhESSJf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 14:09:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0E1C061760;
        Wed, 19 May 2021 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=cliPZxmbguglFEJoeEstF9Rdtka6WrCxDhdLInm6eB8=; b=Du82p1XXZevN9YM0/5DUHJqM0u
        +3ywcdpTiTXuGfr6WkC3hc27y1vsM1w1zl5OoVLRoiCrSjz/MY7aBW3euB1bKIwHYZ7fTE4czHNhL
        0LMpi+iYom5d1Wp7vFd7sI16QtB0ZVp2v5rioPdsZJtbLxRSw4wb8Jwya7q+EpdVKQHEUViKmtqxG
        EzglKghk9k5wdM3b0khqSTdfr0I805wg04DCXWgu8w9r/92u2P9M/DT6fzmnZbVSzEMGZvLn8q9Ro
        gEISwEemqObDx9vObuzhH/ful4YpynRu9DpfW947JgQbs3izlgZ+cD8h8FV9bdfUacX6m6CpL2AFH
        Vldz1jMg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1ljQbq-00FBgo-9l; Wed, 19 May 2021 18:08:00 +0000
Date:   Wed, 19 May 2021 19:07:54 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc:     rostedt@goodmis.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mingo@redhat.com, corbet@lwn.net,
        mtosatti@redhat.com
Subject: Re: [RFC] trace: Add option for polling ring buffers
Message-ID: <YKVT+sQTgNpCR/Gt@casper.infradead.org>
References: <20210519175755.670876-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519175755.670876-1-nsaenzju@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 07:57:55PM +0200, Nicolas Saenz Julienne wrote:
> To minimize trace's effect on isolated CPUs. That is, CPUs were only a
> handful or a single, process are allowed to run. Introduce a new trace
> option: 'poll-rb'.

maybe this should take a parameter in ms (us?) saying how frequently
to poll?  it seems like a reasonable assumption that somebody running in
this kind of RT environment would be able to judge how often their
monitoring task needs to collect data.

> [1] The IPI, in this case, an irq_work, is needed since trace might run
> in NMI context. Which is not suitable for wake-ups.

could we also consider a try-wakeup which would not succeed if in NMI
context?  or are there situations where we only gather data in NMI
context, and so would never succeed in waking up?  if so, maybe
schedule the irq_work every 1000 failures to wake up.

