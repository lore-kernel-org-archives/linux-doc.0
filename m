Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C390C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 14:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238690AbhLIOid (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 09:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238689AbhLIOic (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 09:38:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC06C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 06:34:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F3CCB823B8
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 14:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB20C004DD;
        Thu,  9 Dec 2021 14:34:56 +0000 (UTC)
Date:   Thu, 9 Dec 2021 09:34:55 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     mhiramat@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/trace: fix a label of boottime-trace
Message-ID: <20211209093455.7489c399@gandalf.local.home>
In-Reply-To: <20211209091133.558744-1-siyanteng@loongson.cn>
References: <20211209091133.558744-1-siyanteng@loongson.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  9 Dec 2021 17:11:33 +0800
Yanteng Si <siyanteng01@gmail.com> wrote:

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
>  
>  ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
>    Set histogram key parameters. (Mandatory)

I have no idea if this works or not, so Jon, if you are fine with it, you
can take it through your tree.

-- Steve
