Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3666EC77B7E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 12:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbjFAMzd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 08:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbjFAMzb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 08:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966C3123
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685624081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zyyQ6P4OiPQqIz2ajY3K5RuKb2ciiT0j+HS/foPHgko=;
        b=I8az5GyLArMtSph8gwfwGV1rVNFT4Inpy3uWsq9cLlCocAgX/IWQEooaZ4Z97MTrH6N0gg
        3n+a6JzSF0Ju+UTAW2s69JoWbFFaxfehYa0aym/LC4i+KhYRkcN0eQkslO4VCXmT4GgBTM
        HDGMSiezSKtwbCMc2Jk4hV7XUTB1gZ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-hZqbB7M2M1aNrLRoChZmCg-1; Thu, 01 Jun 2023 08:54:35 -0400
X-MC-Unique: hZqbB7M2M1aNrLRoChZmCg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae4ed92eeso434647f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Jun 2023 05:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624074; x=1688216074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyyQ6P4OiPQqIz2ajY3K5RuKb2ciiT0j+HS/foPHgko=;
        b=hIGfeLaq3H/Mgw78O8/4X2Iwciol6Phii5SGemOx0AWp1U8mW0aSjQRL0j9FOWhrB/
         0rNsbKRpqT8sQhUEmC01fUNUqZRrOWnmiYYH9mJFi57DTxcuoXF4ndjjfmQUNyZ4amId
         fG/3k9pjmGaECNsOjVArwNtCXak2v3g/T/SPyAk3t4ED/nYQvtHlmk/Nta5nuHTXRVCq
         3mjnaIVqhArZ0SbDn54ewSpXSYqfpu0TnYJbYIGZTxgssteMJF+ub+IxFLaWgx0ArLaG
         uYZo4381mXo5xWHLxWP5adbUbnZGpo6hr1zo1SdP7ariKtr1u7oUllkfsm5fomxYjGrZ
         NACA==
X-Gm-Message-State: AC+VfDzVXf8gG/+hYZ7U8b38cRzATT0HOvDR3J5evdt91UqoXzlM+83W
        gkhGSqWWmy6mJvIQGn6gBWhiK+eC5jol3aZaS+UfaMZRhtyEe0lTLGHXE5xf21VYE7oxVNUadtw
        ITkUZUEJIeX6BSKUn6Hpb
X-Received: by 2002:a05:6000:11c7:b0:309:31ac:6663 with SMTP id i7-20020a05600011c700b0030931ac6663mr1977884wrx.16.1685624074115;
        Thu, 01 Jun 2023 05:54:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7y+03rc+mH8f0CjAvN2cbS83wfAP3YE5dl7d4U7xdoyqWIDsowQO1s4HgAFuqC6Koy5vmAjg==
X-Received: by 2002:a05:6000:11c7:b0:309:31ac:6663 with SMTP id i7-20020a05600011c700b0030931ac6663mr1977863wrx.16.1685624073722;
        Thu, 01 Jun 2023 05:54:33 -0700 (PDT)
Received: from localhost.localdomain ([176.206.22.140])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d5272000000b002fb60c7995esm10290986wrc.8.2023.06.01.05.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:54:33 -0700 (PDT)
Date:   Thu, 1 Jun 2023 14:54:30 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Vineeth Pillai <vineeth@bitbyteword.org>
Cc:     luca.abeni@santannapisa.it,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] sched/deadline: Fix bandwidth reclaim equation in
 GRUB
Message-ID: <ZHiVBp4GMAcO2ncV@localhost.localdomain>
References: <20230530135526.2385378-1-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530135526.2385378-1-vineeth@bitbyteword.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi!

On 30/05/23 09:55, Vineeth Pillai wrote:
> According to the GRUB[1] rule, the runtime is depreciated as:
>   "dq = -max{u, (1 - Uinact - Uextra)} dt" (1)
> 
> To guarantee that deadline tasks doesn't starve lower class tasks,
> we do not allocate the full bandwidth of the cpu to deadline tasks.
> Maximum bandwidth usable by deadline tasks is denoted by "Umax".
> Considering Umax, equation (1) becomes:
>   "dq = -(max{u, (Umax - Uinact - Uextra)} / Umax) dt" (2)
> 
> Current implementation has a minor bug in equation (2), which this
> patch fixes.
> 
> The reclamation logic is verified by a sample program which creates
> multiple deadline threads and observing their utilization. The tests
> were run on an isolated cpu(isolcpus=3) on a 4 cpu system.
> 
> Tests on 6.3.0
> ==============
> 
> RUN 1: runtime=7ms, deadline=period=10ms, RT capacity = 95%
> TID[693]: RECLAIM=1, (r=7ms, d=10ms, p=10ms), Util: 93.33
> TID[693]: RECLAIM=1, (r=7ms, d=10ms, p=10ms), Util: 93.35
> 
> RUN 2: runtime=1ms, deadline=period=100ms, RT capacity = 95%
> TID[708]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 16.69
> TID[708]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 16.69
> 
> RUN 3: 2 tasks
>   Task 1: runtime=1ms, deadline=period=10ms
>   Task 2: runtime=1ms, deadline=period=100ms
> TID[631]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 62.67
> TID[632]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 6.37
> TID[631]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 62.38
> TID[632]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 6.23
> 
> As seen above, the reclamation doesn't reclaim the maximum allowed
> bandwidth and as the bandwidth of tasks gets smaller, the reclaimed
> bandwidth also comes down.
> 
> Tests with this patch applied
> =============================
> 
> RUN 1: runtime=7ms, deadline=period=10ms, RT capacity = 95%
> TID[608]: RECLAIM=1, (r=7ms, d=10ms, p=10ms), Util: 95.19
> TID[608]: RECLAIM=1, (r=7ms, d=10ms, p=10ms), Util: 95.16
> 
> RUN 2: runtime=1ms, deadline=period=100ms, RT capacity = 95%
> TID[616]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 95.27
> TID[616]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 95.21
> 
> RUN 3: 2 tasks
>   Task 1: runtime=1ms, deadline=period=10ms
>   Task 2: runtime=1ms, deadline=period=100ms
> TID[620]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 86.64
> TID[621]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 8.66
> TID[620]: RECLAIM=1, (r=1ms, d=10ms, p=10ms), Util: 86.45
> TID[621]: RECLAIM=1, (r=1ms, d=100ms, p=100ms), Util: 8.73
> 
> Running tasks on all cpus allowing for migration also showed that
> the utilization is reclaimed to the maximum. Running 10 tasks on
> 3 cpus SCHED_FLAG_RECLAIM - top shows:
> %Cpu0  : 94.6 us,  0.0 sy,  0.0 ni,  5.4 id,  0.0 wa
> %Cpu1  : 95.2 us,  0.0 sy,  0.0 ni,  4.8 id,  0.0 wa
> %Cpu2  : 95.8 us,  0.0 sy,  0.0 ni,  4.2 id,  0.0 wa
> 
> [1]: Abeni, Luca & Lipari, Giuseppe & Parri, Andrea & Sun, Youcheng.
>      (2015). Parallel and sequential reclaiming in multicore
>      real-time global scheduling.
> 
> Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
> ---

This looks good to me too. Thanks a lot for working on this and of
course to Luca and Daniel who reviewed and played with it as well.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

