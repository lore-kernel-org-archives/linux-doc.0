Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0968C7EE23
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 19:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjFATge (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 15:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjFATgd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 15:36:33 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5384699
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 12:36:32 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-3f6b9ad956cso9570791cf.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Jun 2023 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20221208.gappssmtp.com; s=20221208; t=1685648191; x=1688240191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMBOA4WH9GmX8va2TeN6IF1hKckQ4hk2vM+qJu7Yuk8=;
        b=JKQScWQlepZwk1rwr8D4B8rhFPkzPfrRjo7oBWfw+nEP9EfqxAcT+QW4osjwPhmT5Q
         ZQV6JWXs8rJRB3wOSil33aA6VH95iOYN6NoX5pyxPzvm5t4sMk6BhLLDlzYUm0BDj51b
         NzeK/c8Vw1d6f0CTxvogTrH8Jj3bZjQMBYb3ccX2/bMjCwpvFGw6aikcmLyNiBcs4KEU
         czOUcxsiQkOFgG8W7JYe0fmkQADh9wc7yDtbyUxt+Mn4vHqjpz7R6q6mj9tnNkmcZpcb
         6qOD1px5L7EOtewVnd2LWHez4iP7SCtbcRjjzfJCt5Ov8Ju3NzRD7iK3yEysqmi3RAWk
         z6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685648191; x=1688240191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMBOA4WH9GmX8va2TeN6IF1hKckQ4hk2vM+qJu7Yuk8=;
        b=dvlEiGF53l1S5MG5EeiIZ5s3Uqt89EN92aSPJoVR9Zu5UKwPPDGrBQTNrB1UYx8q8E
         wRJKQt712sVIfJMn3TYz2lMYAPAiW5i1Pi5Lvc0/NFvd520DEHl7FGW704DZ5G7qNKee
         lRR7c1rZ5nIgPduwsnM6MfW6dwfoOeB1b0gE9h/C2sa15xkt2RKMvj7tbrz6dlmkvLhS
         PhVhTveJOEabdhrlv4xeoOz/y1/S2yp/3bo04uZms7f8x+dOf1FYtpxztv/iqVkcldbL
         /wdRdGkyPNmrbs2hSTXdDfbw44G0bnQz5j4Av3Z8LPTC3lt2N74TYPs0GN78LSWz1vFA
         9iMg==
X-Gm-Message-State: AC+VfDz8lL/b9On6kjZwVg27+ihvSR2v2unna6t3re6QZJO+kXytKs/X
        QRSjXTXSjovF0wVhCg1EZkxLdw==
X-Google-Smtp-Source: ACHHUZ7CZ13+q3p59s8LZm39fYm6itDCPooJs/hGoBcJsKdzQMerh2esQX0ar5jZ58mA8fqbfZLxrQ==
X-Received: by 2002:a05:622a:4d:b0:3f7:fcb1:3153 with SMTP id y13-20020a05622a004d00b003f7fcb13153mr11551235qtw.30.1685648191239;
        Thu, 01 Jun 2023 12:36:31 -0700 (PDT)
Received: from localhost ([2620:10d:c091:400::5:ec58])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8774b000000b003eda962ed24sm7973574qtu.22.2023.06.01.12.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 12:36:30 -0700 (PDT)
Date:   Thu, 1 Jun 2023 15:36:30 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Dan Schatzberg <schatzberg.dan@gmail.com>
Cc:     Tejun Heo <tj@kernel.org>, Chris Down <chris@chrisdown.name>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: Clarify usage of memory limits
Message-ID: <20230601193630.GA157732@cmpxchg.org>
References: <20230601183820.3839891-1-schatzberg.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601183820.3839891-1-schatzberg.dan@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 01, 2023 at 11:38:19AM -0700, Dan Schatzberg wrote:
> The existing documentation refers to memory.high as the "main mechanism
> to control memory usage." This seems incorrect to me - memory.high can
> result in reclaim pressure which simply leads to stalls unless some
> external component observes and actions on it (e.g. systemd-oomd can be
> used for this purpose). While this is feasible, users are unaware of
> this interaction and are led to believe that memory.high alone is an
> effective mechanism for limiting memory.
> 
> The documentation should recommend the use of memory.max as the
> effective way to enforce memory limits - it triggers reclaim and results
> in OOM kills by itself.
> 
> Signed-off-by: Dan Schatzberg <schatzberg.dan@gmail.com>

Yeah, this is quite stale. How this ended up working in practice is a
bit different from how we initially conceived it.

Thanks for updating it.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
