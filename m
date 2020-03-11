Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4B9C10DCE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 01:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08DF721D56
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 01:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583890009;
	bh=eMDYXR2nJZoF3367Sc7t4Lc1WZJdnWQnD5UrvNe19Jg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=v5G8bvOxJ6Lk3iuqAU1KH6GTHEaqfylnhrcm85JIr4jdYXwFOE63Av93Mt/SuulF/
	 E7fbcAwXWNIoY0uDKd7iWm6EM1+GrAdf6c677xh4ZuFxcVgCwf2V4cVt3IlOHvaNl7
	 eVBJuGYyd2SNeqd1ukabu6G7gmYL1ndSWUXXAFDc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgCKB0s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 21:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727528AbgCKB0s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 21:26:48 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9464D205ED;
        Wed, 11 Mar 2020 01:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583890008;
        bh=eMDYXR2nJZoF3367Sc7t4Lc1WZJdnWQnD5UrvNe19Jg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T8TmCtDpE64khBhTPI+ccVAiSHhT0IlO0Loa/vazicprYilRGiHWoolabqja0dOCG
         j/KdC66zHZydqdJpoJhd8CY9CsR/jH2HoSgl7KI9Mr7x2JPZe7gbPkfN+8p0MZj062
         iiRfYkMcoSbbzpqp/mg2jjNJZ3kZS3jGbGHWKzuw=
Date:   Tue, 10 Mar 2020 18:26:47 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        tglx@linutronix.de, kernel@gpiccoli.net
Subject: Re: [PATCH] panic: Add sysctl/cmdline to dump all CPUs backtraces
 on oops event
Message-Id: <20200310182647.59f6ea73aad3aca619065f1e@linux-foundation.org>
In-Reply-To: <93f20e59-41b1-48ad-b0eb-e670b18994d5@infradead.org>
References: <20200310163700.19186-1-gpiccoli@canonical.com>
        <93f20e59-41b1-48ad-b0eb-e670b18994d5@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Mar 2020 13:59:15 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

> > +oops_all_cpu_backtrace:
> > +================
> > +
> > +Determines if kernel should NMI all CPUs to dump their backtraces when
> 
> I would much prefer that to be written without using NMI as a verb.

"Non maskably interrupt" ;)

I think it's OK.  Concise and the meaning is clear.


Why do we need the kernel boot parameter?  Isn't
/proc/sys/kernel/oops_all_cpu_backtrace sufficient?

