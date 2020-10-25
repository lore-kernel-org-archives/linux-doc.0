Return-Path: <SRS0=AsmQ=EA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3765C388F7
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 13:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A8DD208E4
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 13:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416163AbgJYNGs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Oct 2020 09:06:48 -0400
Received: from foss.arm.com ([217.140.110.172]:45730 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1416161AbgJYNGr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Oct 2020 09:06:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C581812FC;
        Sun, 25 Oct 2020 06:06:46 -0700 (PDT)
Received: from e107158-lin (e107158-lin.cambridge.arm.com [10.1.194.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D00D3F66B;
        Sun, 25 Oct 2020 06:06:45 -0700 (PDT)
Date:   Sun, 25 Oct 2020 13:06:42 +0000
From:   Qais Yousef <qais.yousef@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH] smp: Add bootcpus parameter to boot subset of CPUs
Message-ID: <20201025130642.yurgta7s63aecgrj@e107158-lin>
References: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Elliot

On 10/22/20 15:04, Elliot Berman wrote:
> In a heterogeneous multiprocessor system, specifying the 'maxcpus'
> parameter on kernel command line does not provide sufficient control
> over which CPUs are brought online at kernel boot time, since CPUs may
> have nonuniform performance characteristics. Thus, add bootcpus kernel

Are you seeing boot time issues on big.LITTLE systems that's why you need this
extra config? If so it'll be good to elaborate on the problem. Scheduler should
place the heavy tasks on bigs. It'll be good to understand what's failing in
here as this might not be addressing the root cause.

Thanks

--
Qais Yousef

> parameter to control which CPUs should be brought online during kernel
> boot. When both maxcpus and bootcpus is set, the more restrictive of the
> two are booted.
