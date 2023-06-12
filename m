Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA762C7EE25
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 10:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjFLKAX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235982AbjFLJ57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 05:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7301826B2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686562920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=D3WIPm4z3+5JGaYbfhg2L2EMz9XADf68AcDZRHShQv4=;
        b=BFm4Rs9/dvR4pS50+DGHgcYUqGJDaTdNbRViiCj6iqI+WriQb+IXpInEEN0W9qd766mbJo
        uLkDO3zLjG7TGZ9NK56JP8gt08SqCb1HOIdoHGp+P1aJeXNzE0Zny0DJ9pknwp8DTpiCJo
        TdewCpYqQoIelB71O9xtis23+0sYzrs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-w_WHo2wXMjaTEv7dyp8gbw-1; Mon, 12 Jun 2023 05:41:59 -0400
X-MC-Unique: w_WHo2wXMjaTEv7dyp8gbw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f7ecfccf2eso17548055e9.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 02:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686562918; x=1689154918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3WIPm4z3+5JGaYbfhg2L2EMz9XADf68AcDZRHShQv4=;
        b=BLc2NphX0bPU+rwVzkOLdmDzlNmGGwz0rO9JwOgQ9FVGE59xEE8as/8K0M6xIiQ+76
         3YzIpItS+jCPb31AY5W9MsgE0uFdAq1bX1p59xIo4EAaje+fvzKMl8IDSJF3pEmIYwgc
         dcDyh9YNG3s8Qnw3Uc8/WzIBc2bDiddiB+rOFRs0Q18FyfJiZTXRzLATThaaCHq40qsc
         UqPsxu+jEw74s1GMtWRwcE48dXbAUtHc+hB7pdQDinfnRicl0hnYre3eja86qQXS8tJX
         LC5oLnWYJlEExGHHAl5zalI01MAKS9wQ20sw2yAUiM29GdVJTWmNh4soEr9cKB0f+4SR
         JD2g==
X-Gm-Message-State: AC+VfDxvEkUaQjSorBvKiny0RNq4rYGo3Vsup0CoatIftbqCog3SIW5C
        olH6vP+ifyLN9gACHgFXQjI+XuPPUPxRijTKOHhhR1CI6eNZQb9+7lQpqDo0VmiO2V0asOqJeuL
        xgZaNgwbvZRNx51PCDlmk
X-Received: by 2002:a05:600c:2254:b0:3f7:e535:ff3b with SMTP id a20-20020a05600c225400b003f7e535ff3bmr5477920wmm.3.1686562918184;
        Mon, 12 Jun 2023 02:41:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Sm436YTX68TNCme7HngotSe4eDUtAGeZuBK92RHWCc1ajo1ryGkbEfHpBQKOiPAD0EO+q1A==
X-Received: by 2002:a05:600c:2254:b0:3f7:e535:ff3b with SMTP id a20-20020a05600c225400b003f7e535ff3bmr5477906wmm.3.1686562917812;
        Mon, 12 Jun 2023 02:41:57 -0700 (PDT)
Received: from localhost.localdomain ([151.29.46.22])
        by smtp.gmail.com with ESMTPSA id y10-20020a1c4b0a000000b003f5ffba9ae1sm10886705wma.24.2023.06.12.02.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:41:57 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:41:55 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, William White <chwhite@redhat.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH V3 00/11] rtla improvements
Message-ID: <ZIboY08U6SMS1tiO@localhost.localdomain>
References: <cover.1686066600.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686066600.git.bristot@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 06/06/23 18:12, Daniel Bristot de Oliveira wrote:
> This is a series of improvements for rtla, mainly as a result of our
> daily usage of the tool debugging problems at red hat.
> 
> The cgroup support and house keeping options are from our usage
> of the tool debugging containers.
> 
> The auto-analysis overhead reduction is needed when we go to
> large boxes - but it is really hand in practice, as it gives an idea
> of the problem without having to look at the trace.
> 
> Running hwnoise 100 % of CPU time might cause some systems
> to slow down too much. Reduce its utilization to 75% by default to
> avoid problems for people using it for the first time.
> 
> Finally, it adds support for running timerlat user-space threads,
> and to collect the additional field via rtla timerlat top/hist.
> 
> Changes from V2:
>   - Add timerlat hist -u option
>   - Link: https://lore.kernel.org/lkml/cover.1684863094.git.bristot@kernel.org/
> Changes from V1:
>   - Add the user-space thread support to rtla timerlat top
>   - Link: https://lore.kernel.org/lkml/cover.1683827510.git.bristot@kernel.org/
> 
> Daniel Bristot de Oliveira (11):
>   rtla: Add -C cgroup support
>   rtla: Add --house-keeping option
>   rtla: Change monitored_cpus from char * to cpu_set_t
>   rtla: Automatically move rtla to a house-keeping cpu
>   rtla/timerlat: Give timerlat auto analysis its own instance
>   rtla/timerlat_hist: Add auto-analysis support
>   rtla: Start the tracers after creating all instances
>   rtla/hwnoise: Reduce runtime to 75%
>   rtla: Add timerlat user-space support for timerlat top
>   rtla: Add timerlat user-space support for
>   Documentation: Add tools/rtla timerlat -u option documentation
> 
>  Documentation/tools/rtla/common_options.rst   |   8 +
>  .../tools/rtla/common_timerlat_aa.rst         |   7 -
>  .../tools/rtla/common_timerlat_options.rst    |   7 +
>  .../tools/rtla/rtla-timerlat-hist.rst         |   7 +-
>  .../tools/rtla/rtla-timerlat-top.rst          |   7 +
>  tools/tracing/rtla/src/osnoise.c              |  65 ++++
>  tools/tracing/rtla/src/osnoise.h              |   5 +
>  tools/tracing/rtla/src/osnoise_hist.c         |  90 ++++-
>  tools/tracing/rtla/src/osnoise_top.c          |  83 ++++-
>  tools/tracing/rtla/src/timerlat_aa.c          |  35 +-
>  tools/tracing/rtla/src/timerlat_aa.h          |   5 +-
>  tools/tracing/rtla/src/timerlat_hist.c        | 262 ++++++++++++--
>  tools/tracing/rtla/src/timerlat_top.c         | 229 +++++++++++--
>  tools/tracing/rtla/src/timerlat_u.c           | 224 ++++++++++++
>  tools/tracing/rtla/src/timerlat_u.h           |  18 +
>  tools/tracing/rtla/src/utils.c                | 324 +++++++++++++++++-
>  tools/tracing/rtla/src/utils.h                |   7 +
>  17 files changed, 1277 insertions(+), 106 deletions(-)
>  create mode 100644 tools/tracing/rtla/src/timerlat_u.c
>  create mode 100644 tools/tracing/rtla/src/timerlat_u.h
> 
> -- 

I've been heavily relying on these for debugging various issues with
latency sensitive workloads and they work like a charm.

Tested-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

