Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D803CD3436
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 04:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjISEJI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 00:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjISEJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 00:09:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A188F;
        Mon, 18 Sep 2023 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Yo6T8uhHcfZbYbU2my6aJ0W/oWWmPTagXuiTZhzqkDM=; b=WTwA+22ex6Irlzh3uhIPjYGUBu
        n14hD/Sq8DOLKDnermruSGZThCR8cqo9e78ZNuBWMF04WJ4zUGCYc+ew2HgyZLAC0dWSeCnVswMs5
        qtFery+e1rNqxO1Q5oN+8cRcqi6toTfwa9IFGxZMHn7GznOQntPKzHfHxylQ23uxfK0YxicnL4wAz
        Gv2MW3YUuyKVm9dMSqVYkYusluvl35s96Kyg+kUcjpzzwiGuXJIsXGO1lSZI8s2+gFL1rzFSpv3A1
        68o8MXbja6z2oTfWoGbWrfogYWqFELhGNaeva/HQkmNggZNY9f1iTm3W2SRfhmg28rLs2ElHd+8rO
        Ep+AW5zw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qiS2l-00F2hx-M1; Tue, 19 Sep 2023 04:08:59 +0000
Date:   Tue, 19 Sep 2023 05:08:59 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: add a warning prefix option
Message-ID: <ZQke26HX9Am3k2sh@casper.infradead.org>
References: <20230919023415.4744-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919023415.4744-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 18, 2023 at 07:34:15PM -0700, Randy Dunlap wrote:
> Add an environment variable ("KDOC_LABEL") for use by scripts/kernel-doc.
> This variable instructs kernel-doc to label each "warning:" line with
> a prefix of the KDOC_LABEL value. E.g., using
>   KDOC_LABEL="doc" ./scripts/kernel-doc -none -Wall kernel/panic.c
> causes kernel-doc warnings to be emitted as "doc warning:", like this:
>   kernel/panic.c:497: doc warning: No description found for return value of 'print_tainted'
> 
> This can aid either in finding or eliminating kernel-doc warnings.

I worry this will lead to people saying "Oh, it's just a doc warning,
so I ignored it".
