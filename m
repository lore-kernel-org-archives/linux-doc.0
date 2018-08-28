Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABF887D00B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 23:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbeH2DQF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 23:16:05 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:35176 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbeH2DQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 23:16:05 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 29DCEC23;
        Tue, 28 Aug 2018 23:22:08 +0000 (UTC)
Date:   Tue, 28 Aug 2018 16:22:07 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Waiman Long <longman@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        "Wangkai (Kevin,C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH 2/2] fs/dcache: Make negative dentries easier to be
 reclaimed
Message-Id: <20180828162207.52240d3442fbe65166f9d604@linux-foundation.org>
In-Reply-To: <CA+55aFxy1vH2CamZ_pdFohKgSJgi1i2MkeaY1qX8NdFK8Xu8Ww@mail.gmail.com>
References: <1535476780-5773-1-git-send-email-longman@redhat.com>
        <1535476780-5773-3-git-send-email-longman@redhat.com>
        <20180828221352.GC11400@bombadil.infradead.org>
        <6873378b-3202-e738-2366-5fb818b4a013@redhat.com>
        <CA+55aFxy1vH2CamZ_pdFohKgSJgi1i2MkeaY1qX8NdFK8Xu8Ww@mail.gmail.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 28 Aug 2018 16:10:24 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, Aug 28, 2018 at 3:29 PM Waiman Long <longman@redhat.com> wrote:
> >
> > Yes, I can rewrite it. What is the problem with the abbreviated form?
> 
> Either gcc rewrites it for you, or you end up _actually_ using a
> function pointer and calling through it.
> 
> The latter would be absolutely horribly bad for something like
> "list_add()", which should expand to just a couple of instructions.
> 
> And the former would be ok, except for the "you wrote code the garbage
> way, and then depended on the compiler fixing it up". Which we
> generally try to avoid in the kernel.
> 
> (Don't get me wrong - we definitely depend on the compiler doing a
> good job at CSE and dead code elimination etc, but generally we try to
> avoid the whole "compiler has to rewrite code to be good" model).
> 

And the "abbreviated form" will surely explode if one or both of those
"functions" happens to be implemented (or later reimplemented) as a macro.
It's best not to unnecessarily make such assumptions.

