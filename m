Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B85C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245583AbiFCPiV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245568AbiFCPiU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:38:20 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF092B26A
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:38:19 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id c12so5828483qvr.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SJXhCrUR8OTVpnLcTOK6eseLDr1ev0Qsg1uNsb9nbv8=;
        b=Q3903lNQQOni7+M4c5ncDu0HLSUQTxvb297A868WBL3HKMBPQ9Vxh/IhIjiQX1r4Mf
         oyPtz/NaYgx9vPorrhxthWs8nTd6jQem8/d8QfACSCYmw293IQT2yN0P/EWNdgruyhFq
         lyiiTi+D0Udva2DO+r+itdpjfySDS4zPtxkSO5vNvipNuYnCsF7uECI0JMrsC4i6qpjG
         t5X6fC3832TP1X39Rj60D7oR6+/p9kggMlLea+C5PdyeOkXxzW274DDdPpsUZo82YHIa
         JFFvkH1sXQQxu2WphhiDNw8+u+F7dY6Bqc6KZ4bckG21U9BdPPBK7xWAyUe2m3/sxgjq
         f53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SJXhCrUR8OTVpnLcTOK6eseLDr1ev0Qsg1uNsb9nbv8=;
        b=2pbWnujga65Pr6JLgYz2ur/9ZPO3ki3At6YS8HnFIjTB9WXn6Tj0NhiOZZSH2HFXpg
         +O3TU0aFP5p6/zf8gZiVrzfVbC49aK63rDxvVJEyqIqEWjeCVwCErQrSIuRcmhFBmJFZ
         gRN2gDIhnyKDzOX9j1x1V5zMnICDd8+Zm9zVYepFunRc8H9a05A5i1f03NPIz5dbTFOu
         Jby3qs7+2djDBpaO6mwkARLaypla9/jE5r+RbWa4Rhx8npMc+B2hq+2n3YhbDpvTeMRI
         q/biWJUXyZg6SK4H2vfCXLdQqKhOUb7MmMZF925nbO32Jfa0gtDk0TwBEcYLmVki3Ji0
         qG7A==
X-Gm-Message-State: AOAM5308ckNtmvHUH5LXJiMzvgHuXS/y1Sgjr0SNg6Fxp0V3ZuEH8klp
        tIiUOQScAW99UHm6/iY90uX80g==
X-Google-Smtp-Source: ABdhPJxdZQ9/SUfZZTAwPP0SSmcim7n4j2UV2gr4nbRDnef4WqhMGWV2G4k+wJYZM/q3KcMDiuC8dg==
X-Received: by 2002:a0c:df8c:0:b0:465:d376:1ec0 with SMTP id w12-20020a0cdf8c000000b00465d3761ec0mr7369798qvl.97.1654270698608;
        Fri, 03 Jun 2022 08:38:18 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:1d66])
        by smtp.gmail.com with ESMTPSA id y184-20020a37afc1000000b0069fc13ce225sm5204351qke.86.2022.06.03.08.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:38:17 -0700 (PDT)
Date:   Fri, 3 Jun 2022 11:38:16 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com,
        songmuchun@bytedance.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: separate
 {pgscan,pgsteal}_{kswapd,direct} items in memory.stat of cgroup v2
Message-ID: <Ypoq6KLItUWsOq+E@cmpxchg.org>
References: <20220603070423.10025-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603070423.10025-1-zhengqi.arch@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 03:04:23PM +0800, Qi Zheng wrote:
> There are already statistics of {pgscan,pgsteal}_kswapd and
> {pgscan,pgsteal}_direct of memcg event here, but now the sum
> of the two is displayed in memory.stat of cgroup v2.
> 
> In order to obtain more accurate information during monitoring
> and debugging, and to align with the display in /proc/vmstat,
> it better to display {pgscan,pgsteal}_kswapd and
> {pgscan,pgsteal}_direct separately.
> 
> Moreover, after this modification, all memcg events can be
> printed with a combination of vm_event_name() and memcg_events().
> This allows us to create an array to traverse and print, which
> reduces redundant seq_buf_printf() codes.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Sounds good to me. We inititally didn't do it because /proc/vmstat has
the breakdown to understand global reclaim behavior, and cgroup
reclaim doesn't have a kswapd. But it's nice to stay consistent, it's
helpful to understand if certain cgroups have a higher share of direct
global reclaim (GFP_TRANSHUGE* for example), and we very much do want
kswapd per cgroup down the line (we've had it in production for ages).

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
