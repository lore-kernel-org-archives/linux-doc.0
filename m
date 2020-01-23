Return-Path: <SRS0=p0eP=3M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D848CC32771
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 00:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B017121835
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 00:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgAWAXZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 19:23:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:53600 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728655AbgAWAXZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Jan 2020 19:23:25 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 96880378;
        Thu, 23 Jan 2020 00:23:24 +0000 (UTC)
Date:   Wed, 22 Jan 2020 17:23:23 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a document on how to contribute to the
 documentation
Message-ID: <20200122172323.5147ea8b@lwn.net>
In-Reply-To: <20200122235302.GD4675@bombadil.infradead.org>
References: <20200122162030.5b789232@lwn.net>
        <20200122235302.GD4675@bombadil.infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 22 Jan 2020 15:53:02 -0800
Matthew Wilcox <willy@infradead.org> wrote:

> One thing which I feel should be mentioned
> is the hard work put in by hundreds of kernel maintainers who have
> written kernel-doc and nobody has done the trivial work to actually
> include those source files in an rst file, so all that documentation
> is being ignored.  A great task that's a step up from "fixing typos" is
> "find documentation that's not currently in a kernel book and add it".
> Even if it's just dumped into a "misc" section, having (eg) kvmalloc()
> documentation in a kernel book is a benefit.

Yeah, I'd thought about putting that in, then kind of forgot about it.
I'll add a paragraph.

> Do you want to preemptively mention the Oxford comma here?

It's true, there is only One True Way Of Comma Placement, so we want to be
sure people get it right...:)

Thanks,

jon
