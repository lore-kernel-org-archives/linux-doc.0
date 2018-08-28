Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 14CDE7D00B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 23:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbeH2Czo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 22:55:44 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:34648 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbeH2Czo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 22:55:44 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id D70ACA73;
        Tue, 28 Aug 2018 23:01:51 +0000 (UTC)
Date:   Tue, 28 Aug 2018 16:01:50 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/2] fs/dcache: Make negative dentries easier to be
 reclaimed
Message-Id: <20180828160150.9a45ee293c92708edb511eab@linux-foundation.org>
In-Reply-To: <1535476780-5773-3-git-send-email-longman@redhat.com>
References: <1535476780-5773-1-git-send-email-longman@redhat.com>
        <1535476780-5773-3-git-send-email-longman@redhat.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Another pet peeve ;)

On Tue, 28 Aug 2018 13:19:40 -0400 Waiman Long <longman@redhat.com> wrote:

>  /**
> + * list_lru_add_head: add an element to the lru list's head
> + * @list_lru: the lru pointer
> + * @item: the item to be added.
> + *
> + * This is similar to list_lru_add(). The only difference is the location
> + * where the new item will be added. The list_lru_add() function will add

People often use the term "the foo() function".  I don't know why -
just say "foo()"!

> + * the new item to the tail as it is the most recently used one. The
> + * list_lru_add_head() will add the new item into the head so that it

Ditto.

"to the head"

> + * will the first to go if a shrinker is running. So this function should

"will be the"

> + * only be used for less important item that can be the first to go if

"items"

> + * the system is under memory pressure.
> + *
> + * Return value: true if the list was updated, false otherwise
> + */
