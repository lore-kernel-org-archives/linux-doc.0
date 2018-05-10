Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8E4447DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 15:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966295AbeEJPiu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 11:38:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:57732 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966209AbeEJPiu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 11:38:50 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1EEA8308;
        Thu, 10 May 2018 15:38:49 +0000 (UTC)
Date:   Thu, 10 May 2018 09:38:46 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510093846.184f6de0@lwn.net>
In-Reply-To: <20180510112113.4db65764@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
        <20180510083838.GA21846@infradead.org>
        <20180510063805.1859b1aa@vento.lan>
        <20180510073012.5902088e@lwn.net>
        <20180510112113.4db65764@vento.lan>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 May 2018 11:21:13 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> The problem with a hint-based mechanism is that it will generate
> false hints. If added, we may end by needing to add extra tags to
> disable the hints mechanism where it gets wrong, or to periodically
> do code changes at kernel-doc comments in order to make the hints
> logic happy.
> 
> So, IMO, we should provide non-hints based mechanism, like forcing the
> string that prepends the colon to have a keyword that will make it to
> parse the block as literal, where expressions like:
> 
> 	See the code-block foo:
> 	See the following code example:
> 	See the following flow diagram:
> 	See the following artwork:
> 
> Is the best alternative to avoid "::", as on the enclosed patch.

But this, too, is a hint-based mechanism.  Thanks for the patches, I'll
keep them around, but I would like an opportunity to try to do better
before applying them.  I fear that using magic words in this way will
lead to a constant stream of surprises, and I'd like to avoid that if
possible...

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
