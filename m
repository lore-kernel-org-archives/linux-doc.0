Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 798997D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Apr 2019 14:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbfD0Ou0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Apr 2019 10:50:26 -0400
Received: from casper.infradead.org ([85.118.1.10]:42674 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD0OuZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Apr 2019 10:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7KIr4IQhp7LY5LEj//lAYtkzKVaFiu/QdBWowma+oOs=; b=jojUjA+th7QfzUBtGkh7SW7XOH
        02q2Sdnpsmuoprg73u7HpM6VRmn4bGnYn0N+f/+rDsw3MewxzAiB7zecLGg4FvdYS4ImLOIhOruzK
        lB1LgEyKuNjSDB3JCJr9uHVsGfyNOjljmNAmrFgY81ZeJINUEk4jKUZ5JKWCyb2y9CdhOMA42KrRz
        w2XneUJ21RekgILT4On4KQH+XZJZqHeuwvfD1EJD6YXYg4k28Z3DN/7cFrlPrI2rNh1ZL0muzhl8U
        L5CLzLaNjcz2hr0aYegYkFWKJol7dF9QdihE5aES5u0/dzcIdVERsPb1BETMSYpwIaU0w4EJGE3JR
        uqAgDvuQ==;
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hKOei-0008HX-9x; Sat, 27 Apr 2019 14:50:20 +0000
Date:   Sat, 27 Apr 2019 11:50:15 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/27] Documentation: x86: convert kernel-stacks to reST
Message-ID: <20190427115015.79eac719@coco.lan>
In-Reply-To: <20190426153150.21228-6-changbin.du@gmail.com>
References: <20190426153150.21228-1-changbin.du@gmail.com>
        <20190426153150.21228-6-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 26 Apr 2019 23:31:28 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  Documentation/x86/index.rst                   |  1 +
>  .../x86/{kernel-stacks => kernel-stacks.rst}  | 20 ++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
>  rename Documentation/x86/{kernel-stacks => kernel-stacks.rst} (92%)
> 
> diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
> index c0bfd0bd6000..489f4f4179c4 100644
> --- a/Documentation/x86/index.rst
> +++ b/Documentation/x86/index.rst
> @@ -11,3 +11,4 @@ Linux x86 Support
>     boot
>     topology
>     exception-tables
> +   kernel-stacks
> diff --git a/Documentation/x86/kernel-stacks b/Documentation/x86/kernel-stacks.rst
> similarity index 92%
> rename from Documentation/x86/kernel-stacks
> rename to Documentation/x86/kernel-stacks.rst
> index 9a0aa4d3a866..3e6bf5940db0 100644
> --- a/Documentation/x86/kernel-stacks
> +++ b/Documentation/x86/kernel-stacks.rst
> @@ -1,5 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============
> +Kernel Stacks
> +=============
> +
>  Kernel stacks on x86-64 bit
> ----------------------------
> +===========================
>  
>  Most of the text from Keith Owens, hacked by AK
>  
> @@ -57,7 +63,7 @@ IST events with the same code to be nested.  However in most cases, the
>  stack size allocated to an IST assumes no nesting for the same code.
>  If that assumption is ever broken then the stacks will become corrupt.
>  
> -The currently assigned IST stacks are :-
> +The currently assigned IST stacks are :

This is a matter of style, but I would remove the space before ':', as this
is a much more common pattern.

In any case:

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

>  
>  * DOUBLEFAULT_STACK.  EXCEPTION_STKSZ (PAGE_SIZE).
>  
> @@ -98,7 +104,7 @@ For more details see the Intel IA32 or AMD AMD64 architecture manuals.
>  
>  
>  Printing backtraces on x86
> ---------------------------
> +==========================
>  
>  The question about the '?' preceding function names in an x86 stacktrace
>  keeps popping up, here's an indepth explanation. It helps if the reader
> @@ -108,7 +114,7 @@ arch/x86/kernel/dumpstack.c.
>  Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
>  
>  We always scan the full kernel stack for return addresses stored on
> -the kernel stack(s) [*], from stack top to stack bottom, and print out
> +the kernel stack(s) [1]_, from stack top to stack bottom, and print out
>  anything that 'looks like' a kernel text address.
>  
>  If it fits into the frame pointer chain, we print it without a question
> @@ -136,6 +142,6 @@ that look like kernel text addresses, so if debug information is wrong,
>  we still print out the real call chain as well - just with more question
>  marks than ideal.
>  
> -[*] For things like IRQ and IST stacks, we also scan those stacks, in
> -    the right order, and try to cross from one stack into another
> -    reconstructing the call chain. This works most of the time.
> +.. [1] For things like IRQ and IST stacks, we also scan those stacks, in
> +       the right order, and try to cross from one stack into another
> +       reconstructing the call chain. This works most of the time.



Thanks,
Mauro
