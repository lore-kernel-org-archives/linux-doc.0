Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6CCC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 14:18:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 159B7610A0
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 14:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbhEMOTr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 10:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbhEMOTe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 10:19:34 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48DCC06174A;
        Thu, 13 May 2021 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=B+baY95FPQkUPXLrLohTvFtYOpo3rW+vabm9FMks7dk=; b=LDasP70eq35ARTWIIMb6R3kT/r
        sue+s3m1wbJ+CikD25M95FFEObL2ZaWyTtzLbSXLSCsORASp3dWwlR3VGd1qt7k9aT3MaP8pVY7QT
        NMGlZBbDGfCy4UmJYVn6m98qgIbwBsCcKXTv9/xp35uhod5VQlZvOoUXzknv6XDBa4JTA2TjRafJp
        VDMXqDcrFVMrNPoAYw1qxpdOZ6hswDa4Rden633hap26Gk6mVmCJokSnXYPqeh4VadjPzI4F0OwbQ
        5aTAZjcR+kZhgr+HJzcAtebcnyjwrhVhD/LPH9w5w5ArI+qUB4hGgisACOUZ9+n6Xwdvqe9F2/cwT
        NMDEnv+A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lhC8O-009V3t-SO; Thu, 13 May 2021 14:16:33 +0000
Date:   Thu, 13 May 2021 15:16:16 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v3 11/14] intel_gna: add ioctl handler
Message-ID: <YJ00sFLGnW0pengc@casper.infradead.org>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <20210513110040.2268-12-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513110040.2268-12-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 13, 2021 at 01:00:37PM +0200, Maciej Kwapulinski wrote:
> +#include <linux/idr.h>

Please don't use the IDR in new code.  Use the XArray instead.

> +	mutex_lock(&gna_priv->memidr_lock);
> +	mo = idr_find(&gna_priv->memory_idr, memory_id);
> +	mutex_unlock(&gna_priv->memidr_lock);

You don't need your own lock with the XArray.

