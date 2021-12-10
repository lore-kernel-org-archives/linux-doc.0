Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C108C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 05:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhLJFXS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 00:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhLJFXS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 00:23:18 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C3FC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 21:19:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 599F1CE286A
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 05:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6936C00446;
        Fri, 10 Dec 2021 05:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639113580;
        bh=qTMtkKETQiz/M4lEcEM1jDQC4B666MR+e449RU6TmbA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iaUm+3WAjJUPrAOQaL8qKSjqI+ceULqTmoWZtiPAo+ENgEYDpndf5luCwc2csMySu
         4Gf+SeuF/sxmAxCt8jwQdz8pQImEPdBk9KX2Eo4AFcMLY3JUTOl8DmU1MxcSdv74E8
         gkr6dSISEzmlvGYKgDZquO/FdslbIDwV6PpIUAZAv694liZ6fLP8Immz10Xamnep2O
         gnWUiVKjT/fO3db0VY4phj9OlObQjYSYoDjrRqhVhutV6DsdJimYSQRmUGMMAcDoZt
         yqudP9jtcicCTL5pNFI9W/vlfIhtP33rS4ODbhmnQMQ0PTvStCCHsWLMnaxp1LheRb
         kjrQp/fuGEImA==
Date:   Fri, 10 Dec 2021 14:19:36 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     rostedt@goodmis.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        akiyks@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v2] docs/trace: fix a label of boottime-trace
Message-Id: <20211210141936.56fb2cfb71e057148cef15c7@kernel.org>
In-Reply-To: <20211210041536.1446734-1-siyanteng@loongson.cn>
References: <20211210041536.1446734-1-siyanteng@loongson.cn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 10 Dec 2021 12:15:36 +0800
Yanteng Si <siyanteng01@gmail.com> wrote:

> Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
> introduced a warning:
> 
> linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
> 
> Replace with: (path)
> 

Looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Fixes: 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing")

Thank you,

> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/trace/boottime-trace.rst | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
> index 6dcfbc64014d..d594597201fd 100644
> --- a/Documentation/trace/boottime-trace.rst
> +++ b/Documentation/trace/boottime-trace.rst
> @@ -131,9 +131,7 @@ Ftrace Histogram Options
>  Since it is too long to write a histogram action as a string for per-event
>  action option, there are tree-style options under per-event 'hist' subkey
>  for the histogram actions. For the detail of the each parameter,
> -please read the event histogram document [3]_.
> -
> -.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
> +please read the event histogram document (Documentation/trace/histogram.rst)
>  
>  ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
>    Set histogram key parameters. (Mandatory)
> -- 
> 2.27.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
