Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0036EC388F9
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 07:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 657F42177B
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 07:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VrC8dvAl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374624AbgJWHpt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 03:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374437AbgJWHps (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 03:45:48 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13FCC0613CE;
        Fri, 23 Oct 2020 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=C8iPz4vR/r/Z7txUMN6zv8MlJSlNHAYC9PuCCf3WrRc=; b=VrC8dvAl/nH2owuVmhXvcwABwo
        lys5ud6TqV2KhOz+wIgITmag1I/hBL7cTPZmVjcnbdIYzfRmMKHtrKsyZzTfxehMo/aHDDuxQTg7K
        3WtU17vINDxt+K4y4pjdOXAnYrqt+z9osguYycfcaTy6WgYtXLfTHOGe/hCWG982LWN7XbZ8hDdGc
        6caMD8ui+guG7N9HBp/dFWACDEKIDMBAOl0+QiydHFpidY+/T1JUHcVCrlfqoX0uCe18bH68+Uhol
        9TPNJQTsF1SeFyozEbRkTj8CY/KveJ30THdMFs3XyLgGNoMN+Ud7E8YZFd4oPGhOLa36SsLnvGsYp
        mTma2OcQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVrlg-0004Y1-2n; Fri, 23 Oct 2020 07:45:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 901C5300B22;
        Fri, 23 Oct 2020 09:45:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 590CC203D09CB; Fri, 23 Oct 2020 09:45:42 +0200 (CEST)
Date:   Fri, 23 Oct 2020 09:45:42 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] smp: Add bootcpus parameter to boot subset of CPUs
Message-ID: <20201023074542.GN2611@hirez.programming.kicks-ass.net>
References: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603404243-5536-1-git-send-email-eberman@codeaurora.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 22, 2020 at 03:04:03PM -0700, Elliot Berman wrote:
> In a heterogeneous multiprocessor system, specifying the 'maxcpus'
> parameter on kernel command line does not provide sufficient control
> over which CPUs are brought online at kernel boot time, since CPUs may
> have nonuniform performance characteristics. Thus, add bootcpus kernel
> parameter to control which CPUs should be brought online during kernel
> boot. When both maxcpus and bootcpus is set, the more restrictive of the
> two are booted.

Why would one wish to do so? Having the ability for abilities sake is no
good.
