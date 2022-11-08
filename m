Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E595C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 15:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbiKHPZN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 10:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbiKHPZM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 10:25:12 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A642A1B1ED
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 07:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ghycFeXmR+o0Sqyg6Zu5mJbNwqcyiKrfevqs83cZkd8=; b=SRA808TdXThLkJyW8xjfp3Anbr
        1tlyh2wpo2oFvRJohqEZGH8iqD1kjenRp6O6rkuB4FV5Ce1Sh7UOCX7F/Z+jJSzkVSoNkOaI7mKVV
        zgz6fZ58Uh5WhkmSLEy5c9OhN4KAfgBCDbi6w5a1KaxEdAa/QodoSeQCAO9zi+0jiUPN1upTXuwky
        pVl62rAdSo7+rYd/wLccfxdsXUUq79sFproig9AYbV1IrwWbUSClylMK93sun/tMFHJiq3GxBxmTm
        xUvDOQVrXPCiv+MIQScCVzaydyhgDYEZylSnHpyFsKE3q7Ay2eY7L2BBdF0QprwwDizZR9ET3qvGD
        vga6yywg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1osQTO-00ANFi-B1; Tue, 08 Nov 2022 15:25:10 +0000
Date:   Tue, 8 Nov 2022 15:25:10 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
Message-ID: <Y2p01rcfyDfIqufZ@casper.infradead.org>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 08, 2022 at 11:02:35AM -0400, Jason Gunthorpe wrote:
> (I don't know perl at all so happy to replace this with something more elegant)
>  my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
> +my $export_symbol_ns = '^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*\w+\)\s*;';

How about:

-my $export_symbol = '^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';
+my $export_symbol = '^\s*EXPORT_SYMBOL(_NS)?(_GPL)?\s*\(\s*(\w+)\s*\)\s*;';

Not them i'm a perlite either, but this is just a regexp.
