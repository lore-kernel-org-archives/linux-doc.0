Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9C5C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 14:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhLIOxl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:53:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:53632 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232965AbhLIOxl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Dec 2021 09:53:41 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E80012CC;
        Thu,  9 Dec 2021 14:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E80012CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639061408; bh=zse5LktihrfyAvB0c4hiEi2sLt8KOplpsIaPuP80Fvc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Fm3eGpL9mEcKdbTZpc1Wt/TwJ7FnmvWPRdMYb4de2Tb3F4w1vLddp7QWbm0KX7Jmq
         lkLuKk7oSY5bA7nEoFqAJsRcEs0MtreBloUyQJLzQJXgwvLHFgOOukHlvCQX7/ft4d
         VN1dK/1vRq8NqWmNcas7Efh0eK5ptZei1eI2P7gb6CgeBCvP0xo6hsOBeYpqXD63Mq
         atrgMbRtHq7CaGexdRAOl/D7jMhlTuHbz3fVnlOlqZ8jgk0JPgIXGKCaNjvv0hKJPy
         QA0Rv9G5SE31HGVUZiAJdveN2jCWx9Eo1/leG7SDcMluIwM9Z0ujDIrSz8ku/4Lpms
         Q2HHOIP7cXmsw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, mhiramat@kernel.org
Cc:     rostedt@goodmis.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
In-Reply-To: <20211209091133.558744-1-siyanteng@loongson.cn>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
Date:   Thu, 09 Dec 2021 07:50:07 -0700
Message-ID: <87y24tvnmo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
> introduced a warning:
>
> linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
>
> Replace with:
>               :xxx: path
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/trace/boottime-trace.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
> index 6dcfbc64014d..efb75ec5bf48 100644
> --- a/Documentation/trace/boottime-trace.rst
> +++ b/Documentation/trace/boottime-trace.rst
> @@ -133,7 +133,7 @@ action option, there are tree-style options under per-event 'hist' subkey
>  for the histogram actions. For the detail of the each parameter,
>  please read the event histogram document [3]_.
>  
> -.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
> +.. [3] See :histogram: Documentation/trace/histogram.rst

I don't see that this is going to work either.  Is there any reason not
to just make the text read:

   please read the event histogram document Documentation/trace/histogram.rst

and let automarkup link it in?

Thanks,

jon
