Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54F817D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Jan 2019 21:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731414AbfAPVwD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Jan 2019 16:52:03 -0500
Received: from ms.lwn.net ([45.79.88.28]:52576 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730479AbfAPVwD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Jan 2019 16:52:03 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E509F2DD;
        Wed, 16 Jan 2019 21:52:02 +0000 (UTC)
Date:   Wed, 16 Jan 2019 14:52:01 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Shi <yang.shi@linux.alibaba.com>
Cc:     mhocko@suse.com, shakeelb@google.com, hannes@cmpxchg.org,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: memcontrol: fix the obsolete content about force
 empty
Message-ID: <20190116145201.3000520b@lwn.net>
In-Reply-To: <1547596295-14085-1-git-send-email-yang.shi@linux.alibaba.com>
References: <1547596295-14085-1-git-send-email-yang.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Jan 2019 07:51:35 +0800
Yang Shi <yang.shi@linux.alibaba.com> wrote:

> We don't do page cache reparent anymore when offlining memcg, so update
> force empty related content accordingly.
> 
> Reviewed-by: Shakeel Butt <shakeelb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Yang Shi <yang.shi@linux.alibaba.com>
> ---
>  Documentation/cgroup-v1/memory.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

jon
