Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270DCC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E827B21BE5
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387453AbhAKUeB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:34:01 -0500
Received: from ms.lwn.net ([45.79.88.28]:34514 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731948AbhAKUeB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:34:01 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 746E79B2;
        Mon, 11 Jan 2021 20:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 746E79B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610397200; bh=BY8eScDNycdd49z8UzwKPJOGgGLk+Cy0F6YF5RoD4Mc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YlTXNiDDJXQyP4fmefHg5bctJY+k7ppKwUzTbbNJNK8I5vXakEVRZbkrN6NfgU2H/
         EoW5E9EKEPWKvBpHduiCLVLmevfzsJSJhEx53qmzgWbcjFbWP9BZJqwF3hAosmZez6
         SR+L+r0jzwZAlESAGYZCCCQGWYTtjmXexcbp3Qm/HAqCk4C0DE0vQ7pGrkyZ4XhErS
         khslNtegFkqV690KNjNsR/PzsXOl4+vLS2fGracHk9av9gyI7Mlngk1QkyAFm31Xwv
         ejNxUE2mmIcp1/Aguxc/jXPmmIaSlLBen/4HK8LPphw9k+runfInr0AZqAC7N67CEh
         yiNUj5xaCmsFg==
Date:   Mon, 11 Jan 2021 13:33:19 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Marc Koderer <marc@koderer.com>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        trivial@kernel.org
Subject: Re: [PATCH] samples/kprobes: Remove misleading comment
Message-ID: <20210111133319.4cca787c@lwn.net>
In-Reply-To: <20201228060415.2194-1-marc@koderer.com>
References: <20201228060415.2194-1-marc@koderer.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 28 Dec 2020 07:04:15 +0100
Marc Koderer <marc@koderer.com> wrote:

> The example file supports many architectures not only x86 and PPC.
> 
> Signed-off-by: Marc Koderer <marc@koderer.com>
> Cc: trivial@kernel.org
> ---
>  samples/kprobes/kprobe_example.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 365905cb24b1..192aa68db0c0 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -1,6 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * NOTE: This example is works on x86 and powerpc.
>   * Here's a sample kernel module showing the use of kprobes to dump a
>   * stack trace and selected registers when kernel_clone() is called.

Applied, thanks.

jon
