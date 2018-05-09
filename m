Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2A3D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 08:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934374AbeEIIlc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 04:41:32 -0400
Received: from merlin.infradead.org ([205.233.59.134]:50406 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934244AbeEIIl3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 04:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xOa/yQzWR92S+f+CpDz3OvEzSHSOWXpKpi56JJiIcV8=; b=PyMAWYxVb2YrEkWuxE9Tk4jZ/
        pqNNMIgduu2tFTpFzVSvrBxke84XLSHtddczPO/BOe1lYUWF5+1yHTGxEl+GsWbsUrHehrxCZJDK6
        CYv4x7UMSeThHxN4/S+Q1AZ5F+BpZZiUcSnYSlgctwTJMkHCB+9q4edb+V9cL+lxBe96hPS5gu3gI
        yR6cn+n4SAPgvZTLcUsOkr47U7rSHrBN7LvizqQOAvHtHEMR/S4oDPEWPqm4OxK8FB40BNfCVol4R
        kTjwQ7R4rFTsCIB+cFdkvq2VTKa/2Ep/mxHd3c82vRDvWbkPXHtfbWaG0IWSBrGVpExRKwz0MC0I+
        /o3sPaW1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGKf4-0006gO-MC; Wed, 09 May 2018 08:41:22 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 432ED2029FA13; Wed,  9 May 2018 10:41:20 +0200 (CEST)
Date:   Wed, 9 May 2018 10:41:20 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180509084120.GF12217@hirez.programming.kicks-ass.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:49AM -0300, Mauro Carvalho Chehab wrote:
> The flow diagram should be inside a code-block to avoid those
> warnings:
> 	./include/linux/wait.h:110: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	./include/linux/wait.h:113: WARNING: Unexpected indentation.
> 	./include/linux/wait.h:115: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> This is easily done by using "::" instead of just ":".

And I'll voice my objection once again. This makes a regular comment
worse. This rst stuff is utter shit for making normal text files less
readable in your favourite text editor.

If this gets merged, I'll simply remove that spurious ':' the next time
I'm near that comment.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  include/linux/wait.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index d9f131ecf708..d907ed761a7f 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -101,7 +101,7 @@ init_waitqueue_func_entry(struct wait_queue_entry *wq_entry, wait_queue_func_t f
>   * lead to sporadic and non-obvious failure.
>   *
>   * Use either while holding wait_queue_head::lock or when used for wakeups
> - * with an extra smp_mb() like:
> + * with an extra smp_mb() like::
>   *
>   *      CPU0 - waker                    CPU1 - waiter
>   *
> -- 
> 2.17.0
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
