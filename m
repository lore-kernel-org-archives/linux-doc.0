Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 909787D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 02:36:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbeILHi1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 03:38:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46030 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbeILHi1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 03:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MOXrYYHG4997Uvf/64FBOlldevSKG0F7ZyHCu3snLVA=; b=hQ9W8RlbBB4iODDtQD5J8mcjQ
        1QqRI0C53HV5wMqrv9LBnMQu9nIWOU8IXt0eZmoPIHbkioBswuCHc+xxNVCXXyeQiC5nQDtCImXqf
        H6gToMbDTZB7HWaMV+k+lcDaHvrRBPJemw4NBKAwkVy+Wlxcz3MOkrKwSC0LrWCw9YZ4WwNUHvnKl
        kvfeDOuvHGCZGHe4Web/JWopS+GU+/BezkN+xmn1zjR2IoUKclfgEqXPsjctBmw/cyOMGvW1Pl9/b
        kO6A/yEp9kTczmWG9A8lTeuRZc+CGoCPbuGa3o4ANKZebzeeB37D90vuq4jnlkS7M2AJx/4pr+7h3
        h3u5q1ueg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fzv0l-0004ta-4a; Wed, 12 Sep 2018 02:36:11 +0000
Date:   Tue, 11 Sep 2018 19:36:10 -0700
From:   Matthew Wilcox <willy@infradead.org>
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
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v3 4/4] fs/dcache: Eliminate branches in
 nr_dentry_negative accounting
Message-ID: <20180912023610.GB20056@bombadil.infradead.org>
References: <1536693506-11949-1-git-send-email-longman@redhat.com>
 <1536693506-11949-5-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536693506-11949-5-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 11, 2018 at 03:18:26PM -0400, Waiman Long wrote:
> Because the accounting of nr_dentry_negative depends on whether a dentry
> is a negative one or not, branch instructions are introduced to handle
> the accounting conditionally. That may potentially slow down the task
> by a noticeable amount if that introduces sizeable amount of additional
> branch mispredictions.
> 
> To avoid that, the accounting code is now modified to use conditional
> move instructions instead, if supported by the architecture.

You're substituting your judgement here for the compiler's.  I don't
see a reason why the compiler couldn't choose to use a cmov in order
to do this:

	if (dentry->d_flags & DCACHE_LRU_LIST)
		this_cpu_inc(nr_dentry_negative);

unless our macrology has got too clever for the compilre to see through
it.  In which case, the right answer is to simplify the percpu code,
not to force the compiler to optimise the code in the way that makes
sense for your current microarchitecture.

