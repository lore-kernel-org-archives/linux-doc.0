Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD500C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79F1C64FAA
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBDVgX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhBDVgW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 16:36:22 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1BCC0613D6;
        Thu,  4 Feb 2021 13:35:42 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4C8E35F5A;
        Thu,  4 Feb 2021 21:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4C8E35F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612474542; bh=XYMiN/VKsdhtgUM3GTGzrXE4KpgP2N79ilgPo3ZjoVA=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=JzURcZMN5uAaMn3AvJJg2BiVRqgt/hxOAtM+ejv3N08mA0/NddmWY2vlmx3WwTod8
         R7275OI9yLxihzU8Osfr3EhqhjbnfMCouJ3zZXyODCtNtQZMhN+vJJjzRYE+OjE+Vd
         Zp5/l/kthUFAZbl+I+v+zpPGbjcsfSPoIrKmvgkuqvV1/GhTL9pSY6wpH4jgTo4kxm
         U6W3+CRIxoc4qwq4ToAwdBWrjIYgMtePdEDzymGRiNtmxr4mp5avpLwhVUUqOa+gyP
         LEt6BYk6Z6LNqUqJ1tbHK0Mg9IKhas5xR1nZBiCd/olCYR8GUkZAi4bhl8oMzpfbYM
         VPxOtU5U9S23A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: /proc/loadavg: add 3 more field
 descriptions
In-Reply-To: <fe55b139-bd03-4762-199b-83be873cf7dd@infradead.org>
References: <fe55b139-bd03-4762-199b-83be873cf7dd@infradead.org>
Date:   Thu, 04 Feb 2021 14:35:41 -0700
Message-ID: <87czxffrde.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Update contents of /proc/loadavg: add 3 more fields.

...except that two of those fields are actually a single field with a
slash in the middle.

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/filesystems/proc.rst |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> --- linux-next-20210202.orig/Documentation/filesystems/proc.rst
> +++ linux-next-20210202/Documentation/filesystems/proc.rst
> @@ -687,7 +687,10 @@ files are there, and which are missing.
>   kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
>   kmsg         Kernel messages
>   ksyms        Kernel symbol table
> - loadavg      Load average of last 1, 5 & 15 minutes
> + loadavg      Load average of last 1, 5 & 15 minutes;
> +                number of processes currently runnable (running or on ready queue);
> +                total number of processes in system;

Given that those two fields (for reasons certainly unknown to me) are
different than the rest, it seems like we should actually explain how
they are formatted.

> +                last pid created.
>   locks        Kernel locks
>   meminfo      Memory info
>   misc         Miscellaneous

The patch is an improvement over what's there now, so I've applied it,
but it seems like a further tweak might be called for.

Thanks,

jon
