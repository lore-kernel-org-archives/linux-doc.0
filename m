Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 616237D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 12:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfA2MjB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 07:39:01 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55428 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfA2MjB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 07:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hcUmsWqOlUZoA0tGVtVxZVeGi9/WntceTQMLGURqW8U=; b=PBeiAFj84XF4ohPPYvNWj4Frx
        zy33xge/EQv0zpd59PDLm9VtSeIzpXE/lJEW4322H3P7tFLk4zvJP6dZ4NEifr60zfHbqnunPMmh7
        BNEYVN7SeJ/JCiD5JBo3xBvAF9RI/9ho2qVbgzxCcw6ZhcIBUooP2sen9hW8s1fkr46WXVF8hVJlj
        a5nWrftCspTUGFGV3K0hjkbch5lEitgg+JzHUbTusZps2AsgxgAaYnQ5ToQnDYoMaaPIXiscx/v+o
        t6qBu0lTsYS/Iq+N4raF0oQZ+VLiBr7q1ajxAP7N6NplyLoU7Zvns33ALWYK968MQoCR7KZslxNfw
        CmIApdPvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1goSf8-0003BI-LX; Tue, 29 Jan 2019 12:38:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0A4FD2042CFA9; Tue, 29 Jan 2019 13:38:44 +0100 (CET)
Date:   Tue, 29 Jan 2019 13:38:44 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     gregkh@linuxfoundation.org, tj@kernel.org, lizefan@huawei.com,
        hannes@cmpxchg.org, axboe@kernel.dk, dennis@kernel.org,
        dennisszhou@gmail.com, mingo@redhat.com, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 5/5] psi: introduce psi monitor
Message-ID: <20190129123843.GK28467@hirez.programming.kicks-ass.net>
References: <20190124211518.244221-1-surenb@google.com>
 <20190124211518.244221-6-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124211518.244221-6-surenb@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 24, 2019 at 01:15:18PM -0800, Suren Baghdasaryan wrote:
> +			atomic_set(&group->polling, polling);
> +			/*
> +			 * Memory barrier is needed to order group->polling
> +			 * write before times[] read in collect_percpu_times()
> +			 */
> +			smp_mb__after_atomic();

That's broken, smp_mb__{before,after}_atomic() can only be used on
atomic RmW operations, something atomic_set() is _not_.
