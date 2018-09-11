Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 864507D87C
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 22:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbeILDDs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 23:03:48 -0400
Received: from ipmail01.adl6.internode.on.net ([150.101.137.136]:29112 "EHLO
        ipmail01.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727762AbeILDDs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Sep 2018 23:03:48 -0400
Received: from ppp59-167-129-252.static.internode.on.net (HELO dastard) ([59.167.129.252])
  by ipmail01.adl6.internode.on.net with ESMTP; 12 Sep 2018 07:32:25 +0930
Received: from dave by dastard with local (Exim 4.80)
        (envelope-from <david@fromorbit.com>)
        id 1fzqjo-0003tX-6D; Wed, 12 Sep 2018 08:02:24 +1000
Date:   Wed, 12 Sep 2018 08:02:24 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v3 1/4] fs/dcache: Fix incorrect nr_dentry_unused
 accounting in shrink_dcache_sb()
Message-ID: <20180911220224.GE5631@dastard>
References: <1536693506-11949-1-git-send-email-longman@redhat.com>
 <1536693506-11949-2-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536693506-11949-2-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 11, 2018 at 03:18:23PM -0400, Waiman Long wrote:
> The nr_dentry_unused per-cpu counter tracks dentries in both the
> LRU lists and the shrink lists where the DCACHE_LRU_LIST bit is set.
> The shrink_dcache_sb() function moves dentries from the LRU list to a
> shrink list and subtracts the dentry count from nr_dentry_unused. This
> is incorrect as the nr_dentry_unused count Will also be decremented in
> shrink_dentry_list() via d_shrink_del(). To fix this double decrement,
> the decrement in the shrink_dcache_sb() function is taken out.
> 
> Fixes: 4e717f5c1083 ("list_lru: remove special case function list_lru_dispose_all."
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Please add a stable tag for this.

Otherwise looks fine.

Reviewed-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com
