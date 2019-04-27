Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FF6A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Apr 2019 18:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfD0Skl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Apr 2019 14:40:41 -0400
Received: from casper.infradead.org ([85.118.1.10]:52568 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfD0Skl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Apr 2019 14:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6MCHmb2V14s8ffmIju/zs3Aro0XdZioE5Kihm4e1WtU=; b=EcdY3n+gZr6+wPA5tj0ubPrlFN
        eKjxPEOa2kqzDwnv7TAJDBG15sBmw6SFbNNiPrqLAvxDuBxsgxXwWag9xa+mzpw6Rpg2nz8Or7SOh
        4TqY4lgzeVNIq6wP4ajW2hDht9+Z5vA0gCha6wKo6MvKcGGBHHAQYvXpbnUCNeaOqvcHiEBvtRYtv
        1WI11ODtZfVM53khxzVB3TtPwwMzXBL7fvTcpCkoHTQyOxINPx54jcRNO/9Xnjkff3WMifrEiRS1D
        BsmCuyI844eX0DKBYLd0g+HNvVnDkdW0k5nWY5/Yp7ueYBCYHs+iM+HAW9hBZabmGOORb0Fs87kCR
        rb1HI7qA==;
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hKSFY-0005Ke-JQ; Sat, 27 Apr 2019 18:40:37 +0000
Date:   Sat, 27 Apr 2019 15:40:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/27] Documentation: x86: convert
 x86_64/cpu-hotplug-spec to reST
Message-ID: <20190427154031.5b874cdb@coco.lan>
In-Reply-To: <20190426153150.21228-27-changbin.du@gmail.com>
References: <20190426153150.21228-1-changbin.du@gmail.com>
        <20190426153150.21228-27-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 26 Apr 2019 23:31:49 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  .../x86/x86_64/{cpu-hotplug-spec => cpu-hotplug-spec.rst}    | 5 ++++-
>  Documentation/x86/x86_64/index.rst                           | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>  rename Documentation/x86/x86_64/{cpu-hotplug-spec => cpu-hotplug-spec.rst} (88%)
> 
> diff --git a/Documentation/x86/x86_64/cpu-hotplug-spec b/Documentation/x86/x86_64/cpu-hotplug-spec.rst
> similarity index 88%
> rename from Documentation/x86/x86_64/cpu-hotplug-spec
> rename to Documentation/x86/x86_64/cpu-hotplug-spec.rst
> index 3c23e0587db3..8d1c91f0c880 100644
> --- a/Documentation/x86/x86_64/cpu-hotplug-spec
> +++ b/Documentation/x86/x86_64/cpu-hotplug-spec.rst
> @@ -1,5 +1,8 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================================================
>  Firmware support for CPU hotplug under Linux/x86-64
> ----------------------------------------------------
> +===================================================

In thesis, nothing needs to change here, but IMO it is a good idea
to use the same markup on most document titles.

Anyway,

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

>  
>  Linux/x86-64 supports CPU hotplug now. For various reasons Linux wants to
>  know in advance of boot time the maximum number of CPUs that could be plugged
> diff --git a/Documentation/x86/x86_64/index.rst b/Documentation/x86/x86_64/index.rst
> index e2a324cde671..c04b6eab3c76 100644
> --- a/Documentation/x86/x86_64/index.rst
> +++ b/Documentation/x86/x86_64/index.rst
> @@ -12,3 +12,4 @@ x86_64 Support
>     mm
>     5level-paging
>     fake-numa-for-cpusets
> +   cpu-hotplug-spec



Thanks,
Mauro
