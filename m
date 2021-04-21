Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476E6C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 12:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1202661424
	for <linux-doc@archiver.kernel.org>; Wed, 21 Apr 2021 12:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239309AbhDUMjn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Apr 2021 08:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbhDUMjn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Apr 2021 08:39:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61067C06174A;
        Wed, 21 Apr 2021 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Qh8w6W1RTQVTT8r1EuB9WtIiSIZsU2fv/VFDqOMIuwQ=; b=H6UVNAq6KUvcMXWk3iMsO/UZ2Y
        ILGNp1MmzjG/5qy0rL1OPYCCvX6jgYpA5h+aLunNqmufcnRugmUW+LU861g+4YhrlZa6qb7gRMqWf
        uLJQfLr7vHSs3cyDv1Z7EdIgQ7Bf7shteCcrTloh7pZVWEPXHZXtzh4XJmg7M6BHsmB+DficsjHqT
        RVHN3lVrg+vK3ZSNxwXs2iG+yeILTLMaHl5+NVPieScgfqgRSGhGnkScG+pj4ieiSBVU+M0LWgqht
        HXNVKeewD+cCnmezahUiDJo81PcD0WY7QaJf08dnxlFe1p0K3AHLm4UN3j6Fe06NOw1/DObrTfkoU
        lCialyCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lZC73-00GVhi-L3; Wed, 21 Apr 2021 12:38:03 +0000
Date:   Wed, 21 Apr 2021 13:37:49 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Eric Dumazet <eric.dumazet@gmail.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3] docs: proc.rst: meminfo: briefly describe gaps in
 memory accounting
Message-ID: <20210421123749.GH3596236@casper.infradead.org>
References: <20210421061127.1182723-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421061127.1182723-1-rppt@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 21, 2021 at 09:11:27AM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Add a paragraph that explains that it may happen that the counters in
> /proc/meminfo do not add up to the overall memory usage.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
