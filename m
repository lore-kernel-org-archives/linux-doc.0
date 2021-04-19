Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B4C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9181E6102A
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhDSHyC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhDSHyB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:54:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5E2C061760;
        Mon, 19 Apr 2021 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=YzAn8SzGKu0DXe6e1BJUzLQkVHpN6Ohs5SZys+vEv+0=; b=V0Q1J7VnGgGnulWUq/wojkQ5S8
        6fJG5+msp5oyQfgMKsCKKiq7EQ36J9rl1mwJ5kF4o53g1LNpC878t7r8Mqn5i5f7jq74Yhl0NhC9O
        NtTWdAV52Po1cgATUkYCuIDiRszwQuo/0PRigqjWYkUmoNRH34No1UdAWCGSxEkfRyMYb/lCP4270
        /90Jf4eaK5a271WswAfBao2KRbZUa0vPeZcP0dFj6a4uL2uG6VjUuvhm/OfrQQ5nyKROXUXla1CcX
        +uRfgN8ua/WXDeWnWrsplspBu1Wz9MgCdN33o52IdI5IyUSPKZx7RCvu+vcEdpmXGUbjlBT+XYC+y
        oPAKriBA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYOhq-00DPvw-TH; Mon, 19 Apr 2021 07:52:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 875F530018E;
        Mon, 19 Apr 2021 09:52:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4B594200D4310; Mon, 19 Apr 2021 09:52:30 +0200 (CEST)
Date:   Mon, 19 Apr 2021 09:52:30 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Don <joshdon@google.com>
Cc:     Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        David Rientjes <rientjes@google.com>,
        Oleg Rombakh <olegrom@google.com>, linux-doc@vger.kernel.org,
        Paul Turner <pjt@google.com>
Subject: Re: [PATCH v2] sched: Warn on long periods of pending need_resched
Message-ID: <YH02vqlaZM3a5+9s@hirez.programming.kicks-ass.net>
References: <20210323035706.572953-1-joshdon@google.com>
 <20210324112739.GO15768@suse.de>
 <CABk29Nv7qwWcn4nUe_cxH-pJnppUVjHan+f-iHc8hEyPJ37jxA@mail.gmail.com>
 <CABk29NsQ21F3A6EPmCf+pJG7ojDFog9zD-ri8LO8OVW6sXeusQ@mail.gmail.com>
 <YHmnbngrDGJkduFD@hirez.programming.kicks-ass.net>
 <CABk29Nvkx6wyDfUWsv5oUCR9GKW3qU=HTLdMKpwL+_HcymVFJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABk29Nvkx6wyDfUWsv5oUCR9GKW3qU=HTLdMKpwL+_HcymVFJA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 16, 2021 at 02:33:27PM -0700, Josh Don wrote:
> Yikes, sorry about that. I've squashed the fixup and sent the updated
> patch (with trimmed cc list): https://lkml.org/lkml/2021/4/16/1125

For future reference, please use: https://lkml.kernel.org/r/MSGID

Then I can search for MSGID in my local mailer (mutt: ~h) and instantly
find the actual message (now I'll search for all email from you and it
should obviously be easily found as well).
