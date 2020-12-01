Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8512CC64E7B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 12:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18CA420857
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 12:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fJaQwflK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgLAMoY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 07:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729823AbgLAMoX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 07:44:23 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A557C0613CF;
        Tue,  1 Dec 2020 04:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=YB0thBF7GjuedFieR4hV45nwqrGcIU5L4KJGUs96Eog=; b=fJaQwflKUoj7MSgwsq3oWC8W4f
        OwXUQi8MdCWgbvpHVMMgmA45UkMa+uC2I9AJZxUr7gF6vkR1XhJDnHoMVikMW2YcqQOucuNaSPekk
        R/GC4AKp+9pMPK8BGSaESgiFJL9KdX7HtGfg7N99EzCgp5vhMB95fzVrmgd8bFsZ0BXuyRZOzGfUt
        8MF9Xy6A6gm0EhZvPidMC/+iqKDgd5j9lR+y898pRpaPeuHSDHObJgdExI2UPisVe4L+KOKBeoq5G
        ClJYxFwj1dF+L6cJXNvARIq91cJQodIfdTnzsb7ZbZoKQ7TfZOrqexfR7XOfL4Rtgqyouag5+r8JR
        NlYRBlEw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kk50P-0005ds-6z; Tue, 01 Dec 2020 12:43:41 +0000
Date:   Tue, 1 Dec 2020 12:43:41 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/16] fs: fix kernel-doc markups
Message-ID: <20201201124341.GA21541@infradead.org>
References: <cover.1606823973.git.mchehab+huawei@kernel.org>
 <46ccd8f26eb51b2eb092923d74eadf71fdca43d7.1606823973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46ccd8f26eb51b2eb092923d74eadf71fdca43d7.1606823973.git.mchehab+huawei@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 01, 2020 at 01:08:58PM +0100, Mauro Carvalho Chehab wrote:
> Two markups are at the wrong place. Kernel-doc only
> support having the comment just before the identifier.
> 
> Also, some identifiers have different names between their
> prototypes and the kernel-doc markup.

This patch looks really weird, having 30-ish unchanged lines as the
unified diff context.
