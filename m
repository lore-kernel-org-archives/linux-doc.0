Return-Path: <SRS0=c74n=4R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F454C3F2CD
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 21:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7599021775
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 21:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgB2VGR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Feb 2020 16:06:17 -0500
Received: from ms.lwn.net ([45.79.88.28]:44126 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgB2VGR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 29 Feb 2020 16:06:17 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E7728750;
        Sat, 29 Feb 2020 21:06:16 +0000 (UTC)
Date:   Sat, 29 Feb 2020 14:06:15 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pawan Kumar Meena <pawank1804@gmail.com>
Cc:     josh@joshtriplett.org, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
        linux-doc@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Documentation: RCU: lockdep.txt: Convert to lockdep.rst
Message-ID: <20200229140615.0b36c471@lwn.net>
In-Reply-To: <20200229194636.11494-1-pawank1804@gmail.com>
References: <20200229194636.11494-1-pawank1804@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun,  1 Mar 2020 01:16:36 +0530
Pawan Kumar Meena <pawank1804@gmail.com> wrote:

> diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
> similarity index 99%
> rename from Documentation/RCU/lockdep.txt
> rename to Documentation/RCU/lockdep.rst
> index 89db949eeca0..4e71f77bdd28 100644
> --- a/Documentation/RCU/lockdep.txt
> +++ b/Documentation/RCU/lockdep.rst
> @@ -1,3 +1,5 @@
> +.. _lockdep_doc:
> +
>  RCU and lockdep checking
>  
>  All flavors of RCU have lockdep checking available, so that lockdep is

So what about the rest of the file?  You've renamed it, but there's no
formatting changes to the document itself.

Also...  we don't add labels to code just because we might want to jump to
them someday.  Similarly, I don't think we should add labels to the docs
unless we actually need them.

Thanks,

jon
