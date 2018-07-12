Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 113BD7DE7F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Jul 2018 16:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbeGLRGk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 13:06:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43474 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbeGLRGk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jul 2018 13:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Ezivkyy8DR9jRLwZAdh5OgweEpGw7Q6hWS2sAOWJCPY=; b=VOTxOErVvIOAHF1j8dc82gob9
        Nhgy47DdV0U8UU7DXT0TNRwv2S7QfIJjIJcoa1/WboEsxX45kArv+mvlEZJFz5nkbHymOX3RAOzHx
        6f6EQjQXuD02Ke49SJp9089OIdzVRnzumlmh0DwFNanB/sUOpQbNDQimfx32g0AQ8kYAI4GyeZYme
        kgJc+BcdRXgsjGGWVI+/I5fJJwe2aJjsGWBLgh6foedG7/S0/YdUHYxWs0ajh/wNMB7aIOuK1eSYQ
        O2lQCvfURicxL5w0Zf54ZPwK77WMcMj8UPeZfDFQ1YYRY607eOg5d9+87TdwlK4aT4fTxbWksQgjd
        ojtn3dEpA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fdesv-0001ZN-7E; Thu, 12 Jul 2018 16:56:05 +0000
Date:   Thu, 12 Jul 2018 09:56:05 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
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
Subject: Re: [PATCH v7 3/6] fs/dcache: Add sysctl parameter neg-dentry-limit
 as a soft limit on negative dentries
Message-ID: <20180712165605.GB3475@bombadil.infradead.org>
References: <1531413965-5401-1-git-send-email-longman@redhat.com>
 <1531413965-5401-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531413965-5401-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 12, 2018 at 12:46:02PM -0400, Waiman Long wrote:
> +int neg_dentry_limit;
> +EXPORT_SYMBOL_GPL(neg_dentry_limit);

Why are you exporting it?  What module needs this?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
