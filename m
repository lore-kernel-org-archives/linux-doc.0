Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A40067E677
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 05:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751069AbeEBF3y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 01:29:54 -0400
Received: from mail-vk0-f66.google.com ([209.85.213.66]:42325 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbeEBF3t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 01:29:49 -0400
Received: by mail-vk0-f66.google.com with SMTP id j7-v6so8099610vkc.9
        for <linux-doc@vger.kernel.org>; Tue, 01 May 2018 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3NDMdaLyV5MDrb8V8c+f4Zq3IUSxI38rpoFYSdrZ0eE=;
        b=mZ3jO4QmpPIrxsj1qvbkm2Tvgcg/hY0xtAC7LtJ78ieYxn3g7lxoe3oA0A5H8N1dxt
         WV3jjtmOZ0NWSRqDis6rHhSnKQavfJ+CCaTmbcKj909wGJumpzfTm7AxDJl61438Bdk1
         qqqFIx+LBlzn0mPU48tftaVFLJrN96++OC63hk2zoDAc60vvoQS/NmoHcf1+jMpwCbIq
         P53KkSXGQ0xd9rry6Dp7myjatFrigCFJPUvO/0XcJnAXBAzvU8+gcqZJ5jgjQODdqGjY
         WUUQFekdiIaNtpArZ53rwD4EJ5/338QuFzI7pMseJJP8pqGHOO3wTtROlqJP2xn6iTEx
         mqQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=3NDMdaLyV5MDrb8V8c+f4Zq3IUSxI38rpoFYSdrZ0eE=;
        b=dFbPqcInI0TFfhvnKrW6RE9i0E/IY1sNPQW8T1bUhAaUkZ4q1BsKWAI0uqW2QeCtEx
         4dkl9hNtcvwAnZqOJ4sYrQZHm1lGXWpAy6iWB2eVPVJ6lDVrgJdhXAsXeI0yX/rPD3wx
         H66PdIE1AYk9kOx4MvQPKKfgfcBZawNrRCIzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=3NDMdaLyV5MDrb8V8c+f4Zq3IUSxI38rpoFYSdrZ0eE=;
        b=EgpCtx3sGzbknbtp7P3nfvmIl3t2Ct+a9iMgZ2fy8mgrKIaSCdIRhucdQ2MslxKldI
         DrFBp6yP6P29jRJY+Ms67RsKXpJCU03jfuJDI2wz8fqcmMdwYdxvQYCXZnfMfP4NWPUh
         IZIbJk/W7OYHIStX48JZHMFqkW1RqszWXYLnD0NuA/zqShooRMjGSVvCvZBQGNnszNFk
         QFKjoPsKfdo6pGcpQXQs8hqAl1wRLAI5iFbVQhoGumelyoJwD84K0hk14YrqxxYJvfQV
         JEk3jZeO/Fw3gsWxZiiYSx7p1ZpclilwDqCx8JbG/rnWKzGsOv9rSXq8zc/bAsUR2pRZ
         hsLw==
X-Gm-Message-State: ALQs6tAdpQeZN/FligOazLGPmnGP4t7PFwagBRRzzXy0u/UIOmPGCLVC
        mVA+/ytvsMKRccCIhPhbCY+guy80lPQozr6Gxt+4v+kH
X-Google-Smtp-Source: AB8JxZo0nA1UBeSggm6Oa4z7BS5ylY3g8+lyjst7lOHovCB89GZkVO/ZkUW92zcBbK7lUioEvCRbVjS0Tm+vlun9Yxw=
X-Received: by 2002:a1f:b9d2:: with SMTP id j201-v6mr16663422vkf.123.1525238988000;
 Tue, 01 May 2018 22:29:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.11.209 with HTTP; Tue, 1 May 2018 22:29:46 -0700 (PDT)
In-Reply-To: <1525237251-32496-1-git-send-email-leo.yan@linaro.org>
References: <1525237251-32496-1-git-send-email-leo.yan@linaro.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 1 May 2018 22:29:46 -0700
X-Google-Sender-Auth: b6u9d_CVY9wa2wowmJyj4vDDg6Y
Message-ID: <CAGXu5jJjCJuDNOJPMHmu94naQvKke47LVv-Y=t9vji88FtkRDw@mail.gmail.com>
Subject: Re: [PATCH] coresight: Remove %px for printing pcsr value
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 1, 2018 at 10:00 PM, Leo Yan <leo.yan@linaro.org> wrote:
> The driver prints pcsr twice: the first time it uses specifier %px to
> print hexadecimal pcsr value and the second time uses specifier %pS for
> output kernel symbols.
>
> As suggested by Kees, using %pS should be sufficient and %px isn't
> necessary; the reason is if the pcsr is a kernel space address, we can
> easily get to know the code line from %pS format, on the other hand, if
> the pcsr value doesn't fall into kernel space range (e.g. if the CPU is
> stuck in firmware), %pS also gives out pcsr hexadecimal value.
>
> So this commit removes useless %px and update section "Output format"
> in the document for alignment between the code and document.
>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/trace/coresight-cpu-debug.txt       | 4 ++--
>  drivers/hwtracing/coresight/coresight-cpu-debug.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/trace/coresight-cpu-debug.txt b/Documentation/trace/coresight-cpu-debug.txt
> index 2b9b51c..89ab09e 100644
> --- a/Documentation/trace/coresight-cpu-debug.txt
> +++ b/Documentation/trace/coresight-cpu-debug.txt
> @@ -177,11 +177,11 @@ Here is an example of the debugging output format:
>  ARM external debug module:
>  coresight-cpu-debug 850000.debug: CPU[0]:
>  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
> -coresight-cpu-debug 850000.debug:  EDPCSR:  [<ffff00000808e9bc>] handle_IPI+0x174/0x1d8
> +coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
>  coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
>  coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
>  coresight-cpu-debug 852000.debug: CPU[1]:
>  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
> -coresight-cpu-debug 852000.debug:  EDPCSR:  [<ffff0000087fab34>] debug_notifier_call+0x23c/0x358
> +coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
>  coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
>  coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 9cdb3fb..78a054e 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -315,7 +315,7 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
>         }
>
>         pc = debug_adjust_pc(drvdata);
> -       dev_emerg(dev, " EDPCSR:  [<%px>] %pS\n", (void *)pc, (void *)pc);
> +       dev_emerg(dev, " EDPCSR:  %pS\n", (void *)pc);
>
>         if (drvdata->edcidsr_present)
>                 dev_emerg(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
