Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A51C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8427021927
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJRxa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:53:30 -0400
Received: from ms.lwn.net ([45.79.88.28]:44404 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgCJRxa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:53:30 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 87F6A2E4;
        Tue, 10 Mar 2020 17:53:29 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:53:28 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-doc@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/9] docs: watch_queue.rst: supress some Sphinx warnings
Message-ID: <20200310115328.021999a7@lwn.net>
In-Reply-To: <637fc605eb2fe6e27d9983ee5c30d78989618313.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
        <637fc605eb2fe6e27d9983ee5c30d78989618313.1583250595.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  3 Mar 2020 16:50:32 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Sphinx doesn't like multi-line literal blocks with ``foobar``:
> 
>     Documentation/watch_queue.rst:109: WARNING: Inline literal start-string without end-string.
>     Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
>     Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
>     Documentation/watch_queue.rst:109: WARNING: Inline emphasis start-string without end-string.
>     Documentation/watch_queue.rst:186: WARNING: Inline literal start-string without end-string.
>     Documentation/watch_queue.rst:186: WARNING: Inline emphasis start-string without end-string.
>     Documentation/watch_queue.rst:185: WARNING: Inline emphasis start-string without end-string.
> 
> So, let's use the "::" markup instead.
> 
> While we could do the fix only at the affected lines, let's
> do the same change along the entire file, in order to preserve
> the same look and feel at the entire doc.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

So this doesn't apply to docs-next, of course, since there is no such
file.  Looking in linux-next, I see a few things to comment on beyond
these issues...

 - We *really* don't want to be adding more files like this to the top
   level; we have a directory hierarchy for a reason.  This looks like it
   belongs (mostly) in the core-api manual.

 - Can the user-space example be instead turned into a working program
   under samples (or perhaps a test under tests/)?

The first of these, at least, I would really like to see fixed before this
goes upstream.

Thanks,

jon
