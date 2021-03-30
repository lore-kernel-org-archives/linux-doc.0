Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970F4C433C1
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 14:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EFF4619D1
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 14:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbhC3OwM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:52:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232085AbhC3Ov7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 30 Mar 2021 10:51:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DB9D619CD;
        Tue, 30 Mar 2021 14:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617115918;
        bh=QRCxLkm1xfgmDEANzJ0hjYvujYLz7NRAUc6d4FczU74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vd02VnQGGZCXzoCM38zuhUtu3mQj8bH6yXivtrMbswqyaNPuyQX0O3mggp0txXvL2
         j4H2z/o8MvZfbLwFEEz6llm/obH67O2GexJ1sggxMaoHTK5KZIpOASpHouKAO7vUEq
         HPrbw6p5dyp29QuPWYZcv9gbQDeMr2OGSgdq7n4Y=
Date:   Tue, 30 Mar 2021 16:51:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH v1 1/4] docs: make reporting-issues.rst official and
 delete reporting-bugs.rst
Message-ID: <YGM7DIbkEUvHkMfr@kroah.com>
References: <cover.1617113469.git.linux@leemhuis.info>
 <49c674c2d304d87e6259063580fda05267e8c348.1617113469.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49c674c2d304d87e6259063580fda05267e8c348.1617113469.git.linux@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 30, 2021 at 04:13:04PM +0200, Thorsten Leemhuis wrote:
> Remove the WIP and two FIXME notes in the text to make it official, as
> it's now considered fully ready for consumption. To make sure this
> step is okay for people the intent of this change and the latest version
> of the text were posted to ksummit-discuss; nobody complained, thus
> lets move ahead.
> 
> Add a footer to point out people can contact Thorsten directly in case
> they find something to improve in the text.
> 
> Dear reporting-bugs.rst, I'm sorry to tell you, but that makes you fully
> obsolete and we thus have to let you go now. Thank you very much for
> your service, you in one form or another have been around for a long
> time. I'm sure over the years you got read a lot and helped quite a few
> people. But it's time to retire now. Rest in peace.
> 
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> CC: Harry Wei <harryxiyou@gmail.com>
> CC: Alex Shi <alex.shi@linux.alibaba.com>
> CC: Federico Vaga <federico.vaga@vaga.pv.it>
> CC: Greg KH <gregkh@linuxfoundation.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
