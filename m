Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8139C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6274A207DE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iJNiKavV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgJ3LlF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 07:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgJ3LlE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 07:41:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EB8C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=o8B+amg/22wJebRIcfs0jc7xceCP+Ip2jkg2/uFmylI=; b=iJNiKavV5QitNqW4xS9Wd5B5CO
        EEwDARpDoEuK40E6i9H95yj5uVWkMOVeXZa2UEavyLysZwOzqFY0fO1jtE6DGl59DmRoBnsPCM/u7
        VmuIRvWBl6VIfRt3zpvC+QpO3IKqVOvY+guOoUN2EaYVTPJfzxmAYaxzYW0S3f1M95MV89cj1hjj3
        hBLYmKlFNAF1JtE4Rjl+oZd5AZkaeJVjgjm3DoRR0xqC8FkSq8AbL4pfrNdMzr2lZbp1qfPCBcam5
        F9b+oJkiulJuux92oek3uiE3Mlns5zpwuAPbSinxvR430lqTm+7V2pTfWZV3UcwmSIJiLjzrAfa/0
        frtuZkgg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kYSdH-0005Bl-3l; Fri, 30 Oct 2020 11:31:47 +0000
Date:   Fri, 30 Oct 2020 11:31:47 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: excess bolding in html
Message-ID: <20201030113147.GG27442@casper.infradead.org>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
 <20201030083748.4db9848b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030083748.4db9848b@coco.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 30, 2020 at 08:37:48AM +0100, Mauro Carvalho Chehab wrote:
> Just changing the kernel-doc markup at kernel/futex.c:
> 
> 	/**
> 	 * futex_setup_timer - set up the sleeping hrtimer.
> 	 * @time:	ptr to the given timeout value
> 	 * @timeout:	the hrtimer_sleeper structure to be set up
> 	 * @flags:	futex flags
> 	 * @range_ns:	optional range in ns
> 	 *
> 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
> 	 *	   value given
> 	 */
> 
> To:
> 
> ...
> 	 * Return:
> 	 *
> 	 * Initialized hrtimer_sleeper structure or NULL if no timeout
> 	 * value given 
> 	 */
> 
> Should fix it.

Or just remove the indent.

 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
 * value given.

