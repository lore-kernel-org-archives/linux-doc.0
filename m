Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5A9EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 19:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235904AbjGNTRj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235765AbjGNTRj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 15:17:39 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6087F1989;
        Fri, 14 Jul 2023 12:17:35 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0A0D52DC;
        Fri, 14 Jul 2023 19:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0A0D52DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689362255; bh=6lwILxJvR/rOGOyu8SmlHOBd6tNOtIo6YBozvchbiKY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GknMINu4rL55Tu3FSNjWS1GiJ5ZvnCmn5ZstMh6GdrqUqLio62P1PORdt4MvgN6kN
         wOO4ch9ZMjo9wUWOY4UUZy8AW22lwwAOscLxQx/wG/3ei+FkkrPZpAiSPVmAskg4+J
         3Fw5f10GznOfrNHtcnGBtaz+r1jFF2AAbvpf4tWfRUW0c2LJE807FJ/W6V7aez4oZg
         BYBXWwHExNkFZVQhp4Cic1r3sGHEY1gA31ewSMmOUEreVfMkHDmXiY4ph8gB7vfc22
         UdQ9kHXKqn6H6Ll911IthIZ629P3Ec+2OP2NeDwhpudOSaA1OFH0EWtu5E4Nvj3GK0
         9YYLARsfiAyAg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] Documentation: doc-guide: use '%' constant
 indicator in Return: examples
In-Reply-To: <20230703232030.8223-1-rdunlap@infradead.org>
References: <20230703232030.8223-1-rdunlap@infradead.org>
Date:   Fri, 14 Jul 2023 13:17:34 -0600
Message-ID: <87ilamz4j5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Use the 'constant' indicator '%' in the examples for the
> Return: values syntax. This can help encourage people to use it.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Link: https://lore.kernel.org/lkml/20221121154358.36856ca6@gandalf.local.home/
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> v2: in Subject, spell 'examples' correctly;
>     Add Link: and Acked-by: Steven
>     add Note:
>
> Note: %-ECODE or -%ECODE both work well.
>
>  Documentation/doc-guide/kernel-doc.rst |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I'm not convinced that this %notation really helps the documentation
rather than just cluttering...but for now we have it, so I've applied
this.

Thanks,

jon
