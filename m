Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A83AC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 14:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AC1F61154
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 14:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbhEMODC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 10:03:02 -0400
Received: from foss.arm.com ([217.140.110.172]:36178 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234291AbhEMOC6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 10:02:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0B84169E;
        Thu, 13 May 2021 07:01:48 -0700 (PDT)
Received: from e120325.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A56443F73B;
        Thu, 13 May 2021 07:01:46 -0700 (PDT)
Date:   Thu, 13 May 2021 15:01:43 +0100
From:   Beata Michalska <beata.michalska@arm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        valentin.schneider@arm.com, dietmar.eggemann@arm.com,
        corbet@lwn.net, rdunlap@infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] sched/topology: Rework CPU capacity asymmetry
 detection
Message-ID: <20210513140141.GC15289@e120325.cambridge.arm.com>
References: <1620664258-11045-1-git-send-email-beata.michalska@arm.com>
 <1620664258-11045-3-git-send-email-beata.michalska@arm.com>
 <YJ0H5+P4uHJVh5qF@hirez.programming.kicks-ass.net>
 <20210513134832.GB15289@e120325.cambridge.arm.com>
 <YJ0wuY1uDVbvTxRT@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ0wuY1uDVbvTxRT@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 03:59:21PM +0200, Peter Zijlstra wrote:
> On Thu, May 13, 2021 at 02:48:32PM +0100, Beata Michalska wrote:
> 
> > > > Where:
> > > >  arch_scale_cpu_capacity(L) = 512
> > > >  arch_scale_cpu_capacity(M) = 871
> > > >  arch_scale_cpu_capacity(B) = 1024
> > > 
> > > Low, High
> > > Small, Big
> > > 
> > > But you appear to have picked: Low and Big, which just doesn't make any
> > > sense. (Worse, L can also be Large :-)
> > >
> > (L)ittle, (M)edium, (B)ig
> > I can re-arrange the abbreviations used here.
> 
> Duh, I must really be having a bad day for not thinking of Little. I
> don't think you need to change this. S,M,L would be like a clothing
> store, but steps away from the big.Little thing.
>
That's how I would prefer it - keep the 'little' things
Thanks

---
BR
B.
