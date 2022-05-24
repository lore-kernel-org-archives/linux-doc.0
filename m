Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825FAC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 24 May 2022 11:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbiEXLpp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 May 2022 07:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbiEXLpo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 May 2022 07:45:44 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635B91137
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 04:45:43 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id r84so3378196qke.10
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CR09yeXsFtoUOg9OMladANfYR85/7BwnLnQK+uR1N0Y=;
        b=fvqp9+cdKj6LUnqaiDF1ifg3kW67yhA7mfjWX6ZFH2sG5F8ll4k55tNdNMuoB1M4to
         Z1AV36+WHxVDjTPLY6bzHrbo5yJXPiJYOceulRYWs7upkmVU3JGKtI50rd0LWM/Pmo91
         Z65P8xlljk+pDOkEJB58JvWaTZZdZ5QPbzT38ZFoJGHl/G+l2Jz7Limq9k4aafPrTBoO
         VQeW7Q/M2I8PndKg6WFmKst0Pc3oRyJmlwI0SCBvP/h9UWXS8S2mRljTo/QRrsFQH+/T
         7FlXtbCY5LpzOlJWW9Vrj3DkOYOFXiz3oUu1znM50xY05BDXckQpGZUkOI6gWeA7kRD+
         P8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CR09yeXsFtoUOg9OMladANfYR85/7BwnLnQK+uR1N0Y=;
        b=DFSKpscPl4hPd5sCzwI05O9G71iS5T4TLp6NTiCyD7V9A8L4oQF4E2bPCnsxVcjhpQ
         Gb0ItyK4fhuFzTR/XP7M31SZQeIGhG6tcXY7zp8D1RQoOkVQC6gFs7d/W9wW8/ZkQuVt
         vzf8ccZmbnlmz/8KTTMwBXMJyvNZ8XmPwa7MkY2mHhk51BbRyKFuDu6KozFPMaIgSTDp
         x84rKCqMLfXerGxKeIEXW7QzHK8UWnT3MuW2Y1aaMvLOKURY7Pfmfr20Wefgvs3rZ15Q
         R3dg/L/na2M8jJJ5rRfI8rIn2mpf3GZzZEGNS5a5dmiQapoNyV+mt9YuqKRx+5AqTYsd
         sQ7w==
X-Gm-Message-State: AOAM532e+TiscIeN9AcMLtODPO0cXGh5fBh57JPqN0n0NEBZu8f5EhmT
        p9Fn+ROJTYKznwLb3n2mXzgSuA==
X-Google-Smtp-Source: ABdhPJy+mRmOWARy6q76pkXL/ov/YwM3Sjk6bTK9qOTgTtk/PBNAMmayhuzsas+dwXg1UhhNSG9LBQ==
X-Received: by 2002:a05:620a:bc6:b0:67c:ce55:d2d4 with SMTP id s6-20020a05620a0bc600b0067cce55d2d4mr17064770qki.175.1653392742579;
        Tue, 24 May 2022 04:45:42 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:741f])
        by smtp.gmail.com with ESMTPSA id cg7-20020a05622a408700b002f9050bb622sm5988169qtb.69.2022.05.24.04.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 04:45:42 -0700 (PDT)
Date:   Tue, 24 May 2022 07:45:40 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Yosry Ahmed <yosryahmed@google.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
        Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH] memcg: provide reclaim stats via 'memory.reclaim'
Message-ID: <YozFZI2euSjWPgDb@cmpxchg.org>
References: <20220518223815.809858-1-vaibhav@linux.ibm.com>
 <YoYj4sLJfGke5IGT@dhcp22.suse.cz>
 <87zgjcg4xs.fsf@vajain21.in.ibm.com>
 <YodDaFVeU33bu7yQ@dhcp22.suse.cz>
 <CAJD7tkYwv2LDZeV2F5pxuniw7LCNjBapDCm3WuRhzwTH-jN3PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD7tkYwv2LDZeV2F5pxuniw7LCNjBapDCm3WuRhzwTH-jN3PA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 23, 2022 at 03:50:34PM -0700, Yosry Ahmed wrote:
> I think it might be useful to have a dedicated entry in memory.stat
> for proactively reclaimed memory. A case where this would be useful is
> tuning and evaluating userspace proactive reclaimers. For instance, if
> a userspace agent is asking the kernel to reclaim 100M, but it could
> only reclaim 10M, then most probably the proactive reclaimer is not
> using a good methodology to figure out how much memory do we need to
> reclaim.
> 
> IMO this is more useful, and a superset of just reading the last
> reclaim request status through memory.reclaim (read stat before and
> after).

+1
